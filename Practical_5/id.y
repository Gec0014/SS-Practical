%{
#include <stdio.h>
#include <stdlib.h>

int yylex();  // Declaration to avoid "implicit declaration" warning
void yyerror(const char *); // Declaration to match Bison expectation
%}

%token IDENTIFIER

%%

input: IDENTIFIER { printf("Valid identifier\n"); }
     | error      { printf("Invalid identifier\n"); yyerrok; }
     ;

%%

int main() {
    printf("Enter an identifier:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}