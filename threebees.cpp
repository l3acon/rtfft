// threebees.cpp STK tutorial program
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <pthread.h>

#include "NoteMaps.h"

#include "BeeThree.h"
#include "RtAudio.h"
#include "Messager.h"
#include "Voicer.h"
#include "SKINI.msg"

#include <time.h>
#include <chrono>
#include <ratio>
#define UPDATE_PLOT_HZ 1/10

/* No need to explicitely include the OpenCL headers */
#include "clFFT.h"
#define BLOCK_SIZE 128



#include <algorithm>
using std::min;
#define N_INST 5

using namespace stk;

/* use global variables for use
 * in our tick function */

/* OpenCL initalizations */
const size_t N = 128;

cl_int err;
cl_platform_id platform = 0;
cl_device_id device = 0;
cl_context_properties props[3] ;
cl_context ctx = 0;
cl_command_queue queue = 0;
cl_mem bufIn;
cl_mem bufOut;

/* FFT library realted declarations */
clfftPlanHandle planHandle;
clfftDim dim = CLFFT_1D;
size_t clLengths[1] ;
  
float *X;
float *xout;
cl_event event = NULL;
int ret = 0;

int exect = 1;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
char keyhit = 'a'; 



// The TickData structure holds all the class instances and data that
// are shared by the various processing functions.
struct TickData {
  Voicer voicer;
  Messager messager;
  Skini::Message message;
  int counter;
  bool haveMessage;
  bool done;

  // Default constructor.
  TickData()
    : counter(0), haveMessage(false), done( false ) {}
};

#define DELTA_CONTROL_TICKS 64 // default sample frames between control input checks

// The processMessage() function encapsulates the handling of control
// messages.  It can be easily relocated within a program structure
// depending on the desired scheduling scheme.
void processMessage( TickData* data )
{
  register StkFloat value1 = data->message.floatValues[0];
  register StkFloat value2 = data->message.floatValues[1];

  switch( data->message.type ) {

  case __SK_Exit_:
    data->done = true;
    return;

  case __SK_NoteOn_:
    if ( value2 == 0.0 ) // velocity is zero ... really a NoteOff
      data->voicer.noteOff( value1, 64.0 );
    else { // a NoteOn
      data->voicer.noteOn( value1, value2 );
    }
    break;

  case __SK_NoteOff_:
    data->voicer.noteOff( value1, value2 );
    break;

  case __SK_ControlChange_:
    data->voicer.controlChange( (int) value1, value2 );
    break;

  case __SK_AfterTouch_:
    data->voicer.controlChange( 128, value1 );

  case __SK_PitchChange_:
    data->voicer.setFrequency( value1 );
    break;

  case __SK_PitchBend_:
    data->voicer.pitchBend( value1 );

  } // end of switch

  data->haveMessage = false;
  return;
}

// This tick() function handles sample computation and scheduling of
// control updates.  It will be called automatically when the system
// needs a new buffer of audio samples.
int tick( void *outputBuffer, void *inputBuffer, unsigned int nBufferFrames,
         double streamTime, RtAudioStreamStatus status, void *dataPointer )
{
  TickData *data = (TickData *) dataPointer;
  register StkFloat *samples = (StkFloat *) outputBuffer;
  int counter, nTicks = (int) nBufferFrames;
 
  // For our FFT
  X = (StkFloat*) outputBuffer;

  while ( nTicks > 0 && !data->done ) 
  {

    if ( !data->haveMessage ) {
      data->messager.popMessage( data->message );
      if ( data->message.type > 0 ) {
        data->counter = (long) (data->message.time * Stk::sampleRate());
        data->haveMessage = true;
      }
      else
        data->counter = DELTA_CONTROL_TICKS;
    }

    counter = min( nTicks, data->counter );
    data->counter -= counter;

    for ( int i=0; i<counter; i++ ) {
      *samples++ = data->voicer.tick();
      nTicks--;
    }
    if ( nTicks == 0 ) break;

    // Process control messages.
    if ( data->haveMessage ) processMessage( data );
  }
 
  // -------
  // CLFFT 
  //
  err = clEnqueueWriteBuffer( queue, bufIn, CL_TRUE, 0,	N * 2 * sizeof( *X ), X, 0, NULL, NULL );

  /* Execute the plan. */
  err = clfftEnqueueTransform(planHandle, CLFFT_FORWARD, 1, &queue, 0, NULL, NULL, &bufIn, &bufOut, NULL);
  exect = 0;


  return 0;
}

void *fft_thread(void*)
{
  /* OpenCL initalizations */
  //cl_int err;
  //cl_platform_id platform = 0;
  //cl_device_id device = 0;
  cl_context_properties props[3] = { CL_CONTEXT_PLATFORM, 0, 0 };
  //`cl_context ctx = 0;
  //`cl_command_queue queue = 0;
  //`cl_mem bufIn;
  //`cl_mem bufOut;

  clLengths[0] = N;
  		  
  /* Setup OpenCL environment. */
  err = clGetPlatformIDs( 1, &platform, NULL );
  err = clGetDeviceIDs( platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL );

  props[1] = (cl_context_properties)platform;
  ctx = clCreateContext( props, 1, &device, NULL, NULL, &err );
  queue = clCreateCommandQueue( ctx, device, 0, &err );

  /* Setup clFFT. */
  clfftSetupData fftSetup;
  err = clfftInitSetupData(&fftSetup);
  err = clfftSetup(&fftSetup);
  
  xout = (float*) malloc( N * 2 * sizeof(float));

  /* Prepare OpenCL memory objects and place data inside them. */
  bufIn = clCreateBuffer( ctx, CL_MEM_READ_ONLY, N * 2 * sizeof(*X), NULL, &err );
  bufOut = clCreateBuffer( ctx, CL_MEM_READ_WRITE, N * 2 * sizeof(*X), NULL, &err );
 
  /* Create a default plan for a complex FFT. */
  err = clfftCreateDefaultPlan(&planHandle, ctx, dim, clLengths);
  
  /* Set plan parameters. */
  err = clfftSetPlanPrecision(planHandle, CLFFT_SINGLE);
  err = clfftSetLayout(planHandle, CLFFT_COMPLEX_INTERLEAVED, CLFFT_COMPLEX_INTERLEAVED);
  err = clfftSetResultLocation(planHandle, CLFFT_OUTOFPLACE);
							  
  /* Bake the plan. */
  err = clfftBakePlan(planHandle, 1, &queue, NULL, NULL);

  /*	-- setup done 
   *	wait -- */
  
  std::chrono::steady_clock::time_point begin_c = std::chrono::steady_clock::now();
  std::chrono::steady_clock::time_point end_c = std::chrono::steady_clock::now();
  
  while( keyhit != 'q')
  {
	std::chrono::steady_clock::duration time_span = end_c - begin_c;
	double dur = double(time_span.count()) * std::chrono::steady_clock::period::num / std::chrono::steady_clock::period::den;	
	//printf("dur: %f\n", dur);
	if( UPDATE_PLOT_HZ < dur)
	{
	  dur = double(time_span.count()) * std::chrono::steady_clock::period::num / std::chrono::steady_clock::period::den;	
	  begin_c = std::chrono::steady_clock::now();
	  /* Wait for calculations to be finished. */
	  err = clFinish(queue);

	  /* Fetch results of calculations. */
	  err = clEnqueueReadBuffer( queue, bufOut, CL_TRUE, 0, N * 2 * sizeof( *xout ), xout, 0, NULL, NULL );
	  err = clFinish(queue);
	  
	  //printf("Transform ---- \n");
	  printf("replot \n");
	  for(int i = 0; i < BLOCK_SIZE; ++i)
	  {
		printf("%f\n",xout[i]);
	  }
	  printf("e\n");
	  fflush(stdout);

	}
	else
	{
	  usleep( 1000);
	  end_c = std::chrono::steady_clock::now();
	}
  }
  return NULL; 
}

int main()
{
  /* GNUPLOT setup */
  printf("set yrange [-128:128]\n");
  printf("set xrange [0:128]\n");
  printf("set style data lines\n");
  printf("set grid\n");
  
  printf("plot \"-\" notitle\n");
  printf("1\n 2\n 3\n e\n");
  
  pthread_t t1;
  pthread_create(&t1, NULL, &fft_thread, NULL);
 
  // Set the global sample rate and rawwave path before creating class instances.
  Stk::setSampleRate( 44100.0 );
  Stk::setRawwavePath( "./rawwaves/" );

  int i;
  TickData data;
  RtAudio dac;
  Instrmnt *instrument[N_INST];
  for ( i=0; i<N_INST; i++ ) instrument[i] = 0;

  // Figure out how many bytes in an StkFloat and setup the RtAudio stream.
  RtAudio::StreamParameters parameters;
  parameters.deviceId = dac.getDefaultOutputDevice();
  parameters.nChannels = 1;
  RtAudioFormat format = ( sizeof(StkFloat) == 8 ) ? RTAUDIO_FLOAT64 : RTAUDIO_FLOAT32;
  unsigned int bufferFrames = RT_BUFFER_SIZE;
  try {
    dac.openStream( &parameters, NULL, format, (unsigned int)Stk::sampleRate(), &bufferFrames, &tick, (void *)&data );
  }
  catch ( RtAudioError &error ) {
    error.printMessage();
    goto cleanup;
  }

  try {
    // Define and load the BeeThree instruments
    for ( i=0; i<N_INST; i++ )
      instrument[i] = new BeeThree();
  }
  catch ( StkError & ) {
    goto cleanup;
  }

  // "Add" the instruments to the voicer.
  for ( i=0; i<N_INST; i++ )
    data.voicer.addInstrument( instrument[i] );

  if ( data.messager.startMidiInput() == false )
  {
	printf("Failure to start Midi Input\n");
    goto cleanup;
  }

  try {
    dac.startStream();
  }
  catch ( RtAudioError &error ) {
    error.printMessage();
    goto cleanup;
  }

  system("stty raw");
  // Block waiting until callback signals done.
  while( keyhit != 'q' )
  {
	keyhit = getchar();
  }
  system("stty cooked");
	
 
  // Shut down the callback and output stream.
  try {
    dac.closeStream();
  }
  catch ( RtAudioError &error ) {
    error.printMessage();
  }

 cleanup:
  for ( i=0; i<N_INST; i++ ) delete instrument[i];

  void* r1;
  pthread_join(t1, &r1);

  // 
  // clFFT Cleanup
  //
  /* Release OpenCL memory objects. */
  clReleaseMemObject( bufOut );
  clReleaseMemObject(bufIn);

  free(xout);
  
  /* Release the plan. */
  err = clfftDestroyPlan( &planHandle );
  /* Release clFFT library. */
  clfftTeardown( );

  /* Release OpenCL working objects. */
  clReleaseCommandQueue( queue );
  clReleaseContext( ctx );


  return 0;
}
