#include "digital_filter.h"
#include <string.h>
// each of the files has 1001 lines
#define MAX_SAMPLES_2 1001


//////Smoothing filter//////
float smoothing_filter( float* sensRawArray, int filterSamples, int counter)
{
 /* INSERT YOUR CODE HERE */
    // IMPLEMENT the moving average filter, which is used in the filtering function
    float return_ = 0;

    for (int j = 0; j < filterSamples; ++j)
    {
        return_ += (sensRawArray [counter - j]);
    }
    return_ /= filterSamples;
    return (return_);
}

//////filtering handles all the data in/output//////
void filtering(int arg_N)
{
    
    /* Define all variables*/
    int i;
    int N = arg_N; //for smoothing filter
    float time[MAX_SAMPLES_2]; //for both filters
    
    float raw_data[MAX_SAMPLES_2]; //vector for raw data
    float filtered_smoothing[MAX_SAMPLES_2];// array for smoothing filtered data
  
    
    FILE* rfile;
    FILE* wfile;
    
    /* Read Files into data vector for raw data and filter with smoothing filter */
    

    //open the file
    rfile = fopen("signals/noisy_sinusoid.txt", "r");
    wfile = fopen("signals/filtered_noisy_sinusoidN7.txt", "w+");
    
   
    
    // scan data from file and load it into raw_data vector
    for(i=0; i<MAX_SAMPLES_2; i++)
    {
        fscanf(rfile, "%f%*c%f\n", &time[i], &raw_data[i]);
        
        
    }
    
    
    //copy raw data vector
    memcpy(filtered_smoothing, raw_data, sizeof(filtered_smoothing)); //copy all Data in new Vector
    
    
    

    //override raw data with filtered data (the data-points that can be filtered)
    for (i=N;i<MAX_SAMPLES_2;i++) {
        filtered_smoothing [i] = smoothing_filter(raw_data, N,i);
        
        
    }
    
    for (i=0;i<MAX_SAMPLES_2;i++) {
    fprintf(wfile, "%f \t %f \t %f \t \n", time[i], raw_data[i], filtered_smoothing[i]); //print to file
    }
    
   
    
    
    //close all files
    fclose(rfile);
    fclose(wfile);



}
