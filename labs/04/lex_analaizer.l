%{
#include <stdio.h>
#include <stdlib.h>
%}

%option nounput
%option noinput

%%
"//".*      { printf("COMMENT"); }
"f"[ \t]+[a-zA-Z][a-zA-Z0-9]*  { printf("floatdcl id"); }
"i"[ \t]+[a-zA-Z][a-zA-Z0-9]*  { printf("intdcl id"); }
"p"[ \t]+[a-zA-Z][a-zA-Z0-9]*  { printf("print id"); }
[a-zA-Z][a-zA-Z0-9]*  { printf("id"); }
"="         { printf(" assign "); }
"+"         { printf(" plus "); }
"-"         { printf(" minus "); }
"*"         { printf(" times "); }
"/"         { printf(" div "); }
[0-9]+      { printf("inum"); }
[0-9]+"."[0-9]+  { printf("fnum"); }
[ \t]+      { /* ignore whitespace */ }
\n          { printf("\n"); }
.           { printf("Unknown character %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return 1;
        }
    }
    yylex();
    return 0;
} 