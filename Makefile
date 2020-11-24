CC = gcc
OBJ = test_global.o max.o min.o var.o
CC_OPTIONS = 

ifeq ($(CC_OPTIONS), -g -Wall)
	DEBUG = yes
else
	DEBUG = non
endif


decision:
ifeq ($(DEBUG), yes)
	@echo "La compilation est en mode Debug"
else
	@echo "La compilation est en mode Release"
endif

install: test_global
	mv test_global /home/student

test_global: $(OBJ)
	$(CC) $(OBJ) -o $@

max.o: max.c max.h
	$(CC) -c $(CC_OPTIONS) $^

min.o: min.c min.h
	$(CC) -c $(CC_OPTIONS) $<

var.o: var.c var.h
	$(CC) -c $(CC_OPTIONS) $<

test_global.o: test_global.c max.h min.h var.h
	$(CC) -c $(CC_OPTIONS) $<

clean:
	rm -rf *.o test_global
	





