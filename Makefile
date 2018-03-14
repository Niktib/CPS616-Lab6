CC = gcc

parser: lex.yy.o y.tab.o 
	${CC} lex.yy.o y.tab.o  -o parser

lex.yy.o: lex.yy.c y.tab.h
	gcc -c lex.yy.c

y.tab.o: y.tab.c y.tab.h
	gcc -c y.tab.c

lex.yy.c: lexer.l
	flex -i lexer.l

y.tab.c y.tab.h: parser.y
	yacc -d parser.y

clean:
	rm -f *~ *.o y.* lex.* core parser
