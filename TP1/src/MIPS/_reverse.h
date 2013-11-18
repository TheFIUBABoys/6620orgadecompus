#ifndef _CALLBACK_H_
#define _CALLBACK_H_

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct charWrap {
	char* string;
	unsigned length;
} charWrap;

int checkOption(char* attr);
void swapChars(char* string, int pos1, int pos2);
char* reverseString(charWrap* source);
charWrap* readFromFile(FILE* filePtr);
void reverseFile(FILE* fPtr);

#endif
