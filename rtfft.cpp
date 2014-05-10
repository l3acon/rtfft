//	Matthew Fernandez 2014
//
//	This project is the combination of 
//	at least two other projects. Their
//	licenses may not be compatible.
//

#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "SineWave.h"
// #include "RtWvOut.h"
#include "RtAudio.h"


/* No need to explicitely include the OpenCL headers */
#include "clFFT.h"
#define BLOCK_SIZE 128


using namespace stk;

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
cl_event event = NULL;
int ret = 0;

int debug_once = 1;


// This tick() function handles sample computation only.  It will be
// called automatically when the system needs a new buffer of audio
// samples.
int tick( void *outputBuffer, void *inputBuffer, unsigned int nBufferFrames,
         double streamTime, RtAudioStreamStatus status, void *dataPointer )
{
  SineWave *sine = (SineWave *) dataPointer;
  register StkFloat *samples = (StkFloat *) outputBuffer;

  X = (StkFloat*) outputBuffer;

  std::cout<<"Called 1\n"<<std::endl;
  for ( unsigned int i=0; i<nBufferFrames; i++ )
    *samples++ = sine->tick();
  
  // -------
  // CLFFT 
  //
  err = clEnqueueWriteBuffer( queue, bufIn, CL_TRUE, 0,
	N * 2 * sizeof( *X ), X, 0, NULL, NULL );

  /* Execute the plan. */
  err = clfftEnqueueTransform(planHandle, CLFFT_FORWARD, 1, &queue, 0, NULL, NULL, &bufIn, &bufOut, NULL);
  debug_once = 0;
  return 0;
}


int main( void )
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
  
  float *xout = (float*) malloc( N * 2 * sizeof(float));

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

  try {
	dac.openStream( &parameters, NULL, format, (unsigned int)Stk::sampleRate(), &bufferFrames, &tick, (void *)&sine );
  }
  catch ( RtAudioError &error ) {
	error.printMessage();
	return 0;
  }

  sine.setFrequency(440.0);

  try {
	dac.startStream();
  }
  catch ( RtAudioError &error ) {
	error.printMessage();
	return 0;
  }
  //	---------
  //	STK stuff

  // char keyhit;
  // Block waiting here.
  //std::cout << "\nPlaying ... press <enter> to quit.\n";
  //std::cin.get( keyhit );
  
 for (;debug_once;)
   usleep(10);

  // -------
  // CLFFT 
  //

  //	assume the FFT is working?
  
  /* Wait for calculations to be finished. */
  err = clFinish(queue);

  /* Fetch results of calculations. */
  err = clEnqueueReadBuffer( queue, bufOut, CL_TRUE, 0, N * 2 * sizeof( *xout ), xout, 0, NULL, NULL );
  err = clFinish(queue);

  //printf("Transform ---- \n");
  for(int i = 0; i < BLOCK_SIZE; ++i)
  {
	printf("%f\n",xout[i]);
  }


  // 
  // clFFT Cleanup
  //
  /* Release OpenCL memory objects. */
  clReleaseMemObject( bufOut );
  clReleaseMemObject(bufIn);

  //free(X);
  
  /* Release the plan. */
  err = clfftDestroyPlan( &planHandle );

  /* Release clFFT library. */
  clfftTeardown( );

  /* Release OpenCL working objects. */
  clReleaseCommandQueue( queue );
  clReleaseContext( ctx );

  
  // 
  // STK Cleanup
  //
  // Shut down the output stream.
  try {
	dac.closeStream();
  }
  catch ( RtAudioError &error ) {
	error.printMessage();
  }

  return ret;
}
