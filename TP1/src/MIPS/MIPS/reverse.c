#include "reverse.h"

/*
 * Prints the output of the given file after its lines were
 * reversed. File pointer must be already opened for reading
 * and must be closed after this call.
 * 
 * fPtr: file to be reversed.
 */
int reverse(int infd, int outfd)
{
	int result = reverseS(infd,outfd);
	return result;
	
	
}

