#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

#include "reverse.h"
int main(int argc, char** argv) {
	
	// Rev from stdin.
	if( argc == 1 ) {
		int res = reverseS(STDIN_FILENO, STDERR_FILENO);
		return res;
	}
	
	// Option may have been passed.
	if( argc == 2 ) {
		// Option was matched.
		//if( checkOption(argv[1]) ) return 0;
	}
	unsigned i;
	for( i = 1 ; i < argc ; i++ ) {
		int fPtr = open(argv[i], O_RDONLY);
		int res= reverseS(fPtr,STDERR_FILENO);
			close(fPtr);
		
	}
	return 0;
}
