%{
#include "y.tab.h"
%}
digit [0-9]
%%


"int"				{return INT;}
"float"				{return FLOAT;}
"print"				{return PRINT;}
"exit"				{return EXIT_COMMAND;}
"if"				{return IF;}
"while"				{return WHILE;}
"&&"				{return AND;}
"||"				{return OR;}

[a-zA-Z][0-9a-zA-Z]*		{strcpy(yylval.string,yytext);return name;}
{digit}+\.{digit}+		{yylval.num = atof(yytext);return number;}
{digit}+			{yylval.num = atoi(yytext);return number;}

[-+*/=;(){}<>]			{return yytext[0];}
[ \t\n]				;
.				{printf("unexpected character\n");}
				
				
%%

int yywrap(void){return 1;}
