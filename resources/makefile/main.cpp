#include "print.h"
#include <stdlib.h>

int main(int argc, char *argv[]){
	int size = atoi(argv[1]);
	double stepsize=1.0/double(size+1);
	double *data= new double[size+2];
	for(int i=0;i<size+2;i++)
		data[i]=i*stepsize;
	mynamespace::myprint(data,size+2);
	delete data;
	return 0;
}
