CC=gcc
CCOPTS=--std=gnu99 -g -Wall -D_LIST_DEBUG_
AR=ar

OBJS=bitmap.o\
     buddy_allocator.o

HEADERS=bitmap.h buddy_allocator.h

LIBS=libbuddy.a

BINS=buddy_allocator_test

.phony: clean all

all:	$(LIBS) $(BINS)

%.o:	%.c $(HEADERS)
	$(CC) $(CCOPTS) -c -o $@  $<

libbuddy.a: $(OBJS)
	$(AR) -rcs $@ $^
	$(RM) $(OBJS)

buddy_allocator_test: buddy_allocator_test.o $(LIBS)
	$(CC) $(CCOPTS) -o $@ $^ -lm

clean:
	rm -rf *.o *~ $(LIBS) $(BINS)
