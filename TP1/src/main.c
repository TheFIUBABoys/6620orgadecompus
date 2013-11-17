#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "reverse.h"
int main(int argc, char** argv) {
	
	FILE* fPtr = NULL;
	
	// Rev from stdin.
	if( argc == 1 ) {
		reverseFile(stdin);
		return 0;
	}
	
	// Option may have been passed.
	if( argc == 2 ) {
		// Option was matched.
		if( checkOption(argv[1]) ) return 0;
	}
	unsigned i;
	for( i = 1 ; i < argc ; i++ ) {
		fPtr = fopen(argv[i], "r");
		// Handling opening file error.
		if( fPtr == NULL ) fprintf(stderr, "Error: unable to open file %s\n", argv[i]);
		else {
			reverseFile(fPtr);
			fclose(fPtr);
		}
	}
	return 0;
}
