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
run: $(EXEC)
	./$(EXEC)

.SILENT:
runTests: $(EXEC)
	./$(TESTSCRIPT)

.SILENT:
memCheck: $(EXEC)
	$(MEMFLAGS) ./$(EXEC) TestFiles/test TestFiles/test1 TestFiles/test2

.SILENT:
clean: $(MIDDLEFILE)
	rm *.o

.SILENT:
cleanExec: $(EXEC)
	rm $(EXEC)
