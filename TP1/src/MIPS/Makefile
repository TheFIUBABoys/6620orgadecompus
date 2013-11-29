CFLAGS=-g -Wall -o x
MEMFLAGS=valgrind --leak-check=full --track-origins=yes -v
CC=gcc
MAIN=main.c
REVERSEC=reverse.o

REVERSE=reverse.S
MYMALLOC=sys_mmap/mymalloc.S
EXEC=main
TESTSCRIPT=TestFiles/tests.sh

all: $(EXEC) clean
test: all runTests cleanExec



.SILENT:

reverse.o: reverse.c reverse.h
		$(CC) -g -Wall -pedantic -std=c99 -c reverse.c

$(EXEC): $(MAIN) $(REVERSE) $(MYMALLOC) $(REVERSEC)
	$(CC) $(CFLAGS) $(REVERSEC)  $(MAIN) $(REVERSE) $(MYMALLOC)  -o $(EXEC)

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
	rm -f *.o

.SILENT:
cleanExec: $(EXEC)
	rm -f $(EXEC)
