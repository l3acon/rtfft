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
#include "RtWvOut.h"


/* No need to explicitely include the OpenCL headers */
#include "clFFT.h"
#define SIZE 2048

using namespace stk;

int main( void )
{
	/* OpenCL initalizations */
	cl_int err;
	cl_platform_id platform = 0;
	cl_device_id device = 0;
	cl_context_properties props[3] = { CL_CONTEXT_PLATFORM, 0, 0 };
	cl_context ctx = 0;
	cl_command_queue queue = 0;
	cl_mem bufX;
	float *X;
	cl_event event = NULL;
	int ret = 0;
	size_t N = SIZE;
	
	/* FFT library realted declarations */
	clfftPlanHandle planHandle;
	clfftDim dim = CLFFT_1D;
	size_t clLengths[1] = {N};
				
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
 
	//	-------------
	//	STK 
	// Set the global sample rate before creating class instances.
	Stk::setSampleRate( 44100.0 );
	Stk::showWarnings( true );

	int nFrames = 100000;
	SineWave sine;
	RtWvOut *dac = 0;
	try 
	{
	  // Define and open the default realtime output device for one-channel playback
	  dac = new RtWvOut( 1 );
	}
	catch ( StkError & ) 
	{
	  exit( 1 );
	}

	sine.setFrequency( 441.0 );
	// Option 1: Use StkFrames
	
	StkFrames frames( nFrames, 1 );
	try 
	{
	  dac->tick( sine.tick( frames ) );
	}
	catch ( StkError & ) 
	{
	  return -1;
	}

   
	// -------
	// CLFFT 
	//
	/* Allocate host & initialize data. */
	/* Only allocation shown for simplicity. */
	float b = 0.0;
	float step = M_PI/SIZE;
	X = (float *)malloc(N * 2 * sizeof(*X));
	for(int i = 0; i < SIZE*2; ++i)
	{
	  X[i] = sin(b*100) * exp(-b) ;
	  b += step;
	}
	//printf("VALUES ---- \n");
	//for(int i = 0; i < SIZE; ++i)
	//{
	//  printf("%f\n",X[i]);
	//}

			   
	/* Prepare OpenCL memory objects and place data inside them. */
	bufX = clCreateBuffer( ctx, CL_MEM_READ_WRITE, N * 2 * sizeof(*X), NULL, &err );

	err = clEnqueueWriteBuffer( queue, bufX, CL_TRUE, 0,
	N * 2 * sizeof( *X ), X, 0, NULL, NULL );

	/* Create a default plan for a complex FFT. */
	err = clfftCreateDefaultPlan(&planHandle, ctx, dim, clLengths);
	
	/* Set plan parameters. */
	err = clfftSetPlanPrecision(planHandle, CLFFT_SINGLE);
	err = clfftSetLayout(planHandle, CLFFT_COMPLEX_INTERLEAVED, CLFFT_COMPLEX_INTERLEAVED);
	err = clfftSetResultLocation(planHandle, CLFFT_INPLACE);
								
	/* Bake the plan. */
	err = clfftBakePlan(planHandle, 1, &queue, NULL, NULL);
	
	/* Execute the plan. */
	err = clfftEnqueueTransform(planHandle, CLFFT_FORWARD, 1, &queue, 0, NULL, NULL, &bufX, NULL, NULL);

	/* Wait for calculations to be finished. */
	err = clFinish(queue);

	/* Fetch results of calculations. */
	err = clEnqueueReadBuffer( queue, bufX, CL_TRUE, 0, N * 2 * sizeof( *X ), X, 0, NULL, NULL );
	err = clFinish(queue);

	//printf("Transform ---- \n");
	for(int i = 0; i < SIZE*2; ++i)
	{
	  printf("%f\n",X[i]);
	}

	/* Release OpenCL memory objects. */
	clReleaseMemObject( bufX );

	free(X);
	
	/* Release the plan. */
	err = clfftDestroyPlan( &planHandle );

	/* Release clFFT library. */
	clfftTeardown( );

	/* Release OpenCL working objects. */
	clReleaseCommandQueue( queue );
	clReleaseContext( ctx );
  
	//	---------
	//	STK cleanup
	delete dac;



	return ret;
}
