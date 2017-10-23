#include <iostream>
#include "print.h"

void mynamespace::myprint(double* a,int n){
	for(int i=0;i<n;i++)
		std::cout<<a[i]<<'\t';
	std::cout<<std::endl;
}
