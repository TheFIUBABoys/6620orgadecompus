CFLAGS=-Wall -pedantic -std=c99 -g
MEMFLAGS=valgrind --leak-check=full --track-origins=yes -v
CC=gcc
MAIN=main.c
INPUT=reverse.c
MIDDLEFILE=reverse.o
EXEC=main
TESTSCRIPT=TestFiles/tests.sh

all: $(EXEC) clean
test: all runTests cleanExec


.SILENT:
$(MIDDLEFILE): reverse.h reverse.c 
	$(CC) $(CFLAGS)  -c reverse.c

.SILENT:
$(EXEC): $(MIDDLEFILE) $(MAIN) 
	$(CC) $(CFLAGS) $(MIDDLEFILE) $(MAIN) -o $(EXEC)

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
