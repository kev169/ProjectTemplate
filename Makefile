BINDIR=bin/
BUILDDIR=build/
SRC=src/
CC=gcc
STRIP=strip
DEBUG=
TESTING=
INCLUDES=./include/
FILES=$(shell find ./src/ -name *.c)
OBJECTS=$(FILES:%.c=%.o)
CLEANOBJ=$(subst $(SRC),$(BUILDDIR),$(OBJECTS))

%.o:%.c
	$(CC) -c -I $(INCLUDES) $(TESTING) $(DEBUG) -o $(subst $(SRC),$(BUILDDIR),$@) $<

setup:
	mkdir -p $(BINDIR) $(BUILDDIR)

test: DEBUG+=-DDEBUG

test: setup $(OBJECTS)
	$(CC) $(CLEANOBJ) $(DEBUG) -I $(INCLUDES) -o $(BINDIR)test.out

release: setup $(OBJECTS)
	$(CC) $(CLEANOBJ) -I $(INCLUDES) -o $(BINDIR)release.out

testcases: TESTING=-DTESTING

testcases: setup $(OBJECTS)
	$(CC) $(CLEANOBJ) -I $(INCLUDES) -o $(BINDIR)testcases.out

clean:
	rm -rf $(BINDIR) $(BUILDDIR)
