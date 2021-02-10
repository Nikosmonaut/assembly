Following ARM tutorials


```sh

ld # linker

# generate stabs for debugging
as --gstabs -o doNothingProg2.o doNothingProg2.s
# warning all
# -g debug
gcc Wall -g -o doNothingProg2 doNothingProg2.o

```


`GOT : Global Offset Table`

### Static library
---
```sh

# (static) library
as -o mylib.o mylib.s
ar cru mylib.a mylib.o
# program
as -o main.o main.s
gcc -o main main.o -L. -l:mylib.a

```


### Dynamic library
---
```sh

as -o mylib.o mylib.S
gcc -shared -o mylib.so mylib.o

```