%{
#include<stdio.h>
%}
%%
"<"+[^>]*">" {fprintf(yyout,"%s",yytext);}
. ;
%%
int yywrap()
{
return 1;
}
int main(int args, char **argv)
{
extern FILE *yyin,*yyout;
yyin=fopen(argv[1],"r"); //input2.txt
yyout=fopen(argv[2],"w"); //output2.txt
yylex();
return 0;
}