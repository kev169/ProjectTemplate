BINDIR=bin/
BUILDDIR=build/
SRC=src/
CC=gcc
STRIP=strip
DEBUG=
FILES=$(shell find ./src/ -name *.c)
OBJECTS=$(FILES:%.c=%.o)
CLEANOBJ=$(subst $(SRC),$(BUILDDIR),$(OBJECTS))

%.o:%.c
	$(CC) -c -o $(subst $(SRC),$(BUILDDIR),$@) $<

setup:
	mkdir -p $(BINDIR) $(BUILDDIR)

test: DEBUG+=-DDEBUG

test: setup $(OBJECTS)
	$(CC) $(CLEANOBJ) $(DEBUG) -o $(BINDIR)test.out

clean:
	rm -rf $(BINDIR) $(BUILDDIR)
