#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

#include "reverse.h"
int main(int argc, char** argv) {
	
	//int fPtr = 0;
	int outFd = open("salida.out",O_WRONLY);
	// Rev from stdin.
	if( argc == 1 ) {
		reverse(STDIN_FILENO,outFd);
		return 0;
	}
	
	// Option may have been passed.
	if( argc == 2 ) {
		// Option was matched.
		//if( checkOption(argv[1]) ) return 0;
	}
	unsigned i;
	for( i = 1 ; i < argc ; i++ ) {
		int fPtr = open(argv[i], O_RDONLY);
		
		// Handling opening file error.
		if( !fPtr )
		 fprintf(stderr, "Error: unable to open file %s\n", argv[i]);
		else {
			reverse(fPtr,outFd);
			close(fPtr);
			close(outFd);
		}
	}
	return 0;
}
