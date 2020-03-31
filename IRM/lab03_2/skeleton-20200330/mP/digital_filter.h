#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <string.h>


float smoothing_filter( float* sensRawArray, int filterSamples, int counter);
/*  Online Smoothing (=moving average) filter
 *  sensRawArray - array for raw data
 *  filterSamples - number of samples in filter
 *  counter - current position of filter in the sensRawArray
 *  return filtered Datapoint at filter position
 */


void filtering(int arg_N);
//arg_N filter parameter for moving average

