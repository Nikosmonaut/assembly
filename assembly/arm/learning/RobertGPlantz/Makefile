
BIN=doNothing

all:
	as -Wall -g -o ${BIN}.o ${BIN}.S
	gcc -O0 -o ${BIN}.out ${BIN}.o

clean:
	rm *.out
	rm *.o
