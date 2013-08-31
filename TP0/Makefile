CFLAGS=-Wall -pedantic -std=c99 -g
MEMFLAGS=valgrind --leak-check=full --track-origins=yes -v
CC=gcc
INPUT=ownRev.c
MIDDLEFILE=ownRev.o
EXEC=ownRev
TESTSCRIPT=tests.sh

all: $(EXEC) clean

.SILENT:
$(MIDDLEFILE):
	$(CC) $(CFLAGS) $(INPUT) -c

.SILENT:
$(EXEC): $(MIDDLEFILE)
	$(CC) $(CFLAGS) $(MIDDLEFILE) -o $(EXEC)

.SILENT:	
run:
	./$(EXEC)

.SILENT:
runTests:
	./$(TESTSCRIPT)

.SILENT:
memCheck:
	$(MEMFLAGS) ./$(EXEC)

.SILENT:
clean:
	rm *.o

.SILENT:
cleanExec:
	rm $(EXEC)
