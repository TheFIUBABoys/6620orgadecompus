#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

#include "reverse.h"
int main(int argc, char** argv) {
	
	// Rev from stdin.
	if( argc == 1 ) {
		int res = reverseS(STDIN_FILENO,1 );
		return res;
	}
	
	// Option may have been passed.
	if( argc == 2 ) {
		// Option was matched.
		//if( checkOption(argv[1]) ) return 0;
	}
	unsigned i;
	int res=0;
	for( i = 1 ; i < argc ; i++ ) {
		int fPtr = open(argv[i], O_RDONLY);
		res = reverseS(fPtr,1);
		close(fPtr);
		if(res!=0)
			exit(res);
	}
	return res;
}	
