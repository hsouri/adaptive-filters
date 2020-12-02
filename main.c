#include "init.h"
#include <math.h>

#define M 500 // order of filter
#define mu 0.002 //convergnece rate
#define pi 3.14159265359
#define Len 513

float noise[513];
float noise_filter[513];

float err_nrt[513]={0}, w_nrt[Len]={0}, out_nrt[513]={0};


void main(){
	int i,j,Window;

	float mu_nrt = 0.2;


	for(i=0; i<513; i++){
		err_nrt[i] = 0;
		out_nrt[i] = 0;
	}
	for(i=0; i<Len; i++){
		w_nrt[i] = 0;
	}
	for(i=0; i<513; i++){
		noise[i] = sin(2*pi*i/513);
		noise_filter[i] = cos(2*pi*i/513);
	}


for(Window=0; Window<513;Window=Window+Len){
	for(i=0; i<20000; i++){
		for(j=0; j<Len; j++){
			err_nrt[Window+j] = noise_filter[Window+j] - w_nrt[j]*noise[Len - Window+j];
			w_nrt[j] = w_nrt[j] + mu_nrt*err_nrt[Window+j]*noise[Len - Window+j];
		}
	
		for(j=0; j<Len; j++){
			out_nrt[Window+j] = w_nrt[j] * noise[Len - Window + j];

		}
	}

}

}

