CC=gcc
CFLAGS=-Wall

all: lex_analaizer

lex_analaizer: lex.yy.c
	$(CC) $(CFLAGS) -o lex_analaizer lex.yy.c -ll

lex.yy.c: lex_analaizer.l
	flex lex_analaizer.l

clean:
	rm -f lex_analaizer lex.yy.c

test: all
	python3 code_generator.py > example.ac
	./lex_analaizer example.ac 