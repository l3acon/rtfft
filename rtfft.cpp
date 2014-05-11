//	Matthew Fernandez 2014
//
//	This project is the combination of 
//	at least two other projects. Their
//	licenses may not be compatible.
//

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <pthread.h>

#include "NoteMaps.h"
#include "SineWave.h"
// #include "RtWvOut.h"
#include "RtAudio.h"


/* No need to explicitely include the OpenCL headers */
#include "clFFT.h"
#define BLOCK_SIZE 128


using namespace stk;

/* use global variables for use
 * in our tick function */

/* OpenCL initalizations */
size_t N = 128;

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


// This tick() function handles sample computation only.  It will be
// called automatically when the system needs a new buffer of audio
// samples.
int tick( void *outputBuffer, void *inputBuffer, unsigned int nBufferFrames,
         double streamTime, RtAudioStreamStatus status, void *dataPointer )
{
  SineWave *sine = (SineWave *) dataPointer;
  register StkFloat *samples = (StkFloat *) outputBuffer;

  X = (StkFloat*) outputBuffer;

  //std::cout<<"Called 1\n"<<std::endl;
  for ( unsigned int i=0; i<nBufferFrames; i++ )
    *samples++ = sine->tick();
  
  // -------
  // CLFFT 
  //
  err = clEnqueueWriteBuffer( queue, bufIn, CL_TRUE, 0,	N * 2 * sizeof( *X ), X, 0, NULL, NULL );

  /* Execute the plan. */
  err = clfftEnqueueTransform(planHandle, CLFFT_FORWARD, 1, &queue, 0, NULL, NULL, &bufIn, &bufOut, NULL);
  exect = 0;

  /* Wait for calculations to be finished. */
  err = clFinish(queue);

  /* Fetch results of calculations. */
  err = clEnqueueReadBuffer( queue, bufOut, CL_TRUE, 0, N * 2 * sizeof( *xout ), xout, 0, NULL, NULL );
  err = clFinish(queue);
  
  fflush(stdout);
  //printf("Transform ---- \n");
  for(int i = 0; i < BLOCK_SIZE; ++i)
  {
	printf("%f ",xout[i]);
  }
  printf("\n");

  return 0;
}


void *synth_thread(void*)
{
  //	-------------
  //	STK 
  // Set the global sample rate before creating class instances.
  Stk::setSampleRate( 44100.0 );
  // Stk::showWarnings( true );

  SineWave sine;
  RtAudio dac;

  // Figure out how many bytes in an StkFloat and setup the RtAudio stream.
  RtAudio::StreamParameters parameters;
  parameters.deviceId = dac.getDefaultOutputDevice();
  parameters.nChannels = 1;
  RtAudioFormat format = ( sizeof(StkFloat) == 8 ) ? RTAUDIO_FLOAT64 : RTAUDIO_FLOAT32;
  unsigned int bufferFrames = RT_BUFFER_SIZE;

  try 
  {	dac.openStream( 
	  &parameters, 
	  NULL, format, 
	  (unsigned int)Stk::sampleRate(),
	  &bufferFrames, 
	  &tick, (void *)&sine );
  }
  catch ( RtAudioError &error ) 
  {	error.printMessage();
	return NULL;
  }

  sine.setFrequency(MUSICAL_NOTE_A4);

  /*	-- setup done 
   *	wait -- */

  try 
  {	dac.startStream();
  }
  catch ( RtAudioError &error ) 
  {	error.printMessage();
	return NULL;
  }
  //	---------
  //	STK stuff
 
  // set terminal to raw mode
  system("stty raw");

  char keyhit = 'a'; 
  while( keyhit != 'q' )
  {
	keyhit = getchar();
	switch(keyhit)
	{
	  case 'a': sine.setFrequency(MUSICAL_NOTE_C4); break;
	  case 's': sine.setFrequency(MUSICAL_NOTE_D4); break;
	  case 'd': sine.setFrequency(MUSICAL_NOTE_E4); break;
	  case 'f': sine.setFrequency(MUSICAL_NOTE_F4); break;
	  case 'g': sine.setFrequency(MUSICAL_NOTE_G4); break;
	  case 'h': sine.setFrequency(MUSICAL_NOTE_A4); break;
	  case 'j': sine.setFrequency(MUSICAL_NOTE_B4); break;
	  case 'k': sine.setFrequency(MUSICAL_NOTE_C5); break;
	  case 'l': sine.setFrequency(MUSICAL_NOTE_D5); break;
	  case '\'': sine.setFrequency(MUSICAL_NOTE_E5); break;
	  case ';': sine.setFrequency(MUSICAL_NOTE_F5); break;
	  
	  case 'w': sine.setFrequency(MUSICAL_NOTE_Db4); break;
	  case 'e': sine.setFrequency(MUSICAL_NOTE_Eb4); break;
	  case 't': sine.setFrequency(MUSICAL_NOTE_Gb4); break;
	  case 'y': sine.setFrequency(MUSICAL_NOTE_Ab4); break;
	  case 'u': sine.setFrequency(MUSICAL_NOTE_Bb4); break;
	  case 'o': sine.setFrequency(MUSICAL_NOTE_Db5); break;
	  case 'p': sine.setFrequency(MUSICAL_NOTE_Eb5); break;
	}
  } 
  // reset terminal to normal mode
  system("stty cooked");

  // do STK cleanup first

  // 
  // STK Cleanup
  //
  // Shut down the output stream.
  try 
  {	dac.closeStream();
  }
  catch ( RtAudioError &error ) 
  {	error.printMessage();
  }
  return NULL;
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
  return NULL; 
}

int main( void )
{
  pthread_t t1;
  pthread_t t2;
  
  pthread_create(&t1, NULL, &fft_thread, NULL);
  pthread_create(&t2, NULL, &synth_thread, NULL);

  // returns values for our threads
  void* r1;
  void* r2;
  pthread_join(t2, &r2);
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

  return ret;
}
