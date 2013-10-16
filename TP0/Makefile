CFLAGS=-Wall -pedantic -std=c99 -g
MEMFLAGS=valgrind --leak-check=full --track-origins=yes -v
CC=gcc
INPUT=ownRev.c
MIDDLEFILE=ownRev.o
EXEC=ownRev
TESTSCRIPT=TestFiles/tests.sh

all: $(EXEC) clean
test: all runTests cleanExec

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
	$(MEMFLAGS) ./$(EXEC) TestFiles/test TestFiles/test1 TestFiles/test2

.SILENT:
clean:
	rm *.o

.SILENT:
cleanExec:
	rm $(EXEC)
