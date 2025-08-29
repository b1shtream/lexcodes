%{
#include<stdio.h>
int lineCount=0,spaceCount=0,tabCount=0,restCount=0, totChars=0;
%}
%%
[\n] {++lineCount; totChars=totChars+yyleng;}
[" "] {++spaceCount; totChars=totChars+yyleng;}
[\t] {++tabCount; totChars=totChars+yyleng;}
[^\t" "\n] {++restCount;   totChars=totChars+yyleng;}
END {return 0;}
%%
int yywrap()
{
return 1;
}
int main()
{
printf("Enter the Sentence : \n");
yylex();
printf("Number of Lines are : %d\n",lineCount);
printf("Number of Spaces are : %d\n",spaceCount);
printf("Number of Tabs Characters are : %d\n",tabCount);
printf("Number of Rest Characters are : %d\n",restCount);
printf("Total Number of Characters are : %d\n",totChars);
return 0;
}