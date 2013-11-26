#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

#include "reverse.h"
int main(int argc, char** argv) {
	
	//int fPtr = 0;
	FILE* outFd = fopen("salida.out","w");
	// Rev from stdin.
	if( argc == 1 ) {
		//reverse(STDIN_FILENO, fileno( outFd ));
		reverse(STDIN_FILENO, 1);
		fclose(outFd);
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
			reverse(fPtr,fileno( outFd ));
			close(fPtr);
			fclose(outFd);
		}
	}
	return 0;
}
