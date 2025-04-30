%{
#include <stdio.h>
%}

%option noyywrap
%option nounput
%option noinput

%%
f                       { printf("floatdcl "); }
i                       { printf("intdcl "); }
p                       { printf("print "); }
"+"                     { printf("plus "); }
"-"                     { printf("minus "); }
=                       { printf("assign "); }
"*"                     { printf("times "); }
"/"                     { printf("division "); }
[0-9]+                  { printf("inum "); }
[0-9]+\.[0-9]+          { printf("fnum "); }
[a-zA-Z][a-zA-Z0-9]*    { printf("id "); }
\/\/.*                  { printf("COMMENT "); } 

\n                      { printf("\n"); }
[ \t]+                  /* ignore whitespace */
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror(argv[1]);
            return 1;
        }
        yyin = file;
    }
    yylex();
    printf("\n"); 
    return 0;
}