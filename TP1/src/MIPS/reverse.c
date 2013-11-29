#include "reverse.h"
#include <stdio.h>
/*
 * Prints the output of the given file after its lines were
 * reversed. File pointer must be already opened for reading
 * and must be closed after this call.
 * 
 * fPtr: file to be reversed.
 */
int reverseS(int infd, int outfd)
{
	int result=0;
	int result = reverse(infd,outfd);
	const char* msj = reverse_errmsg[result];
	printf("\n");
	if(result!=0)
		fprintf(stderr, msj);
	
	return result;
}

