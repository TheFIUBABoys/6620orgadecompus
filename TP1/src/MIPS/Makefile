CFLAGS=-g -Wall -o x
MEMFLAGS=valgrind --leak-check=full --track-origins=yes -v
CC=gcc
MAIN=main.c
REVERSE=reverse.S
MYMALLOC=sys_mmap/mymalloc.S
EXEC=main
TESTSCRIPT=TestFiles/tests.sh

all: $(EXEC) clean
test: all runTests cleanExec

.SILENT:
$(EXEC): $(MAIN) $(REVERSE) $(MYMALLOC) 
	$(CC) $(CFLAGS) $(MAIN) $(REVERSE) $(MYMALLOC) -o $(EXEC)

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
