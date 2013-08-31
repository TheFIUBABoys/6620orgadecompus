#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*
 * Checks the option passed via attribute. Prints a different output
 * depending on the option that was passed. Handles only one option
 * at a time.
 * 
 * attr: The string with the option received.
 */ 
int checkOption(char* attr) {
	
	// Match version option.
	if( !strcmp(attr, "-v") || !strcmp(attr, "--version") ) {
		printf("Version 1.0.0\n");
		return 1;
	}
	// Match help option.
	else if ( !strcmp(attr, "-h") || !strcmp(attr, "--help") ) {
		printf("Usage\n");
		return 1;
	}
	
	return 0;
	
}
/*
 * Makes a swap in the given string. The positions swapped are pos1
 * and pos2.
 * 
 * string: The string whose characters the function will swap.
 * pos1: First position in the string to swap.
 * pos2: Second position in the string to swap.
 */
void swapChars(char* string, int pos1, int pos2) {
	
	if( pos1 == pos2 ) return;
	
	char aux = string[pos2];
	string[pos2] = string[pos1];
	string[pos1] = aux;
	
}

/*
 * Copies the source string in a new space of memory and reverses
 * this copy. Returns the copy's reference.
 * 
 * source: The string to reverse.
 */
char* reverseString(char* source) {
	int length = strlen(source);
	
	// One more character for \0 terminator.
	char* reversed = (char*) malloc( (length + 1) * sizeof(char) );
	strcpy(reversed, source);
	
	int posInitial = 0;
	// Start counting from 0, so length - 1. One less for \n.
	int posFinal = length - 2;
	
	while( posInitial < posFinal )
		swapChars(reversed, posInitial++, posFinal--);
		
	return reversed;
}

/*
 * Reads one character at a time from STDIN and stores the result in
 * a new space of memory. Returns the reference to this new string.
 */
char* readFromStdin() {
	
	// Initial buffer length.
	unsigned bufferLength = 30;
	// Allocate memory for buffer length and \0 terminator.
	char* finalString = (char*) malloc( (bufferLength + 2) * sizeof(char) );
	
	// Initialize aux variables.
	char* auxString = NULL;
	char character = 0;
	int length = 0;
	
	// Parse stdin until we get \n (should be EOF).
	while( (character = getchar()) != '\n' ) {	
		length++;
		// Buffer has been filled. Allocate more memory.
		if( (length + 2) == bufferLength ) {
			bufferLength =  2 * bufferLength;
			auxString = (char*) realloc( finalString, bufferLength * sizeof(char) );
			finalString = auxString;
		}
		finalString[length-1] = character;
	}
	
	// Only for \n purposes.
	finalString[length++] = character;
	finalString[length++] = '\0';
	
	auxString = (char*) realloc( finalString, length * sizeof(char) );
	return auxString;
	
}

char* readFromFile(FILE* filePtr) {
	
	// Initial buffer length.
	unsigned bufferLength = 30;
	// Allocate memory for buffer length and \0 terminator.
	char* finalString = (char*) malloc( (bufferLength + 2) * sizeof(char) );
	
	// Initialize aux variables.
	char* auxString = NULL;
	char character = 0;
	int length = 0;
	
	// Parse stdin until we get \n (should be EOF).
	while( (character = fgetc(filePtr)) != EOF ) {	
		length++;
		// Buffer has been filled. Allocate more memory.
		if( (length + 1) == bufferLength ) {
			bufferLength =  2 * bufferLength;
			auxString = (char*) realloc( finalString, bufferLength * sizeof(char) );
			finalString = auxString;
		}
		finalString[length-1] = character;
		if( character == '\n' ) break;
	}
	
	// Only for \n purposes.
	finalString[length++] = '\0';
	
	auxString = (char*) realloc( finalString, length * sizeof(char) );
	return auxString;
	
}

int main(int argc, char** argv) {
	
	char* stdinString = NULL;
	char* fileString = NULL;
	char* reversed = NULL;
	
	// Rev from stdin.
	if( argc == 1 ) {
		stdinString = readFromStdin();
		reversed = reverseString(stdinString);
		printf("%s", stdinString);
		free(stdinString);
		free(reversed);
	}
	
	// Options may have been passed.
	if( argc == 2 ) {
		// No option was matched (only one file to reverse)
		if( !checkOption(argv[1]) ) {
			FILE* fPtr = fopen(argv[1], "r");
			fileString = readFromFile(fPtr);
			reversed = reverseString(fileString);
			printf("%s", reversed);
			free(fileString);
			free(reversed);
			fclose(fPtr);
		}
	}
	
	return 0;
}
