Yacc-Lex code for Desk calculator.
Program.y code
%{
#include<stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}
%token id digit
%left '+' '-'
%left '*' '/'
%%
P: P S '\n'
| ;
S: E {printf("Output : %d\n", $1);}
| id '=' E {sym[$1] = $3;}
;
E: digit {$$=$1;}
| id {$$ = sym[$1]; }
| E '+' E {$$ = $1 + $3; }
| E '-' E {$$ = $1 - $3; }
| E '*' E {$$ = $1 * $3; }
| E '/' E {$$ = $1 / $3; }
| '(' E ')' { $$ = $2; }
;
%%
void yyerror(char *s)
{
fprintf(stderr, "%s\n", s);
}
int main(void)
{
printf("Enter Expression to Evaluate : \n\n");
yyparse();
return 0;
}
Program.l code
%{
#include<stdlib.h>
#include<stdio.h>
int yylval;
#include "y.tab.h"
%}
%%
[a-z] {yylval = *yytext - 'a'; return id;}
[0-9]+ {yylval = atoi(yytext); return digit;}
[-+()=/*\n] {return *yytext;}
[ \t];
. yyerror("invalid character");
%%
int yywrap(void)
{
return 1;
}