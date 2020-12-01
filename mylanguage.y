%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(char* s);
int yylex();

struct 	Name_STRCT{
	double val;
	char id[30];
	char type;
}names[100];
int top = -1;

int findName_Index(char X[30]);
%}

%union{
	double num;
	char string[30];
	}

%token INT
%token FLOAT

%token AND
%token OR

%token PRINT
%token IF
%token WHILE
%token EXIT_COMMAND

%token <string>name
%token <num>number

%left AND OR
%left '<' '>'
%left '+' '-'
%left '*' '/'

%start program
%type <num> program exp term statements statement
%type <string> assignment_i assignment_f


%%


program		:statements				{;}
		;
		
		
statements	:statement				{;}
		|statements statement			{;}
		;
		
		
statement	:INT assignment_i ';'			{printf("ASSIGN_STATE INT\n");}
		|FLOAT assignment_f ';'			{printf("ASSIGN_STATE FLOAT\n");}
		|if_statement				{printf("IF_STATEMENT\n");}
		|while_statement			{printf("WHILE_STATEMENT\n");}
		|EXIT_COMMAND ';' 			{printf("EXITING\n");exit(EXIT_SUCCESS);}
		|print_statement ';'			{printf("PRINT STATEMENT\n");}
		;
		
		
print_statement		:PRINT exp				{if(((int)$2 / $2 == 1))
							 printf("PRINTING i %d\n",(int)$2);
							 else
							 printf("PRINTING f  %lf\n",$2);
							}		
		;
		
			
if_statement	:IF '(' COND ')' '{' statements '}'	{;}
		|IF '(' COND ')' statement		{;}
		;
		

while_statement :WHILE '(' COND ')' '{' statements '}'	{;}	
		|WHILE '(' COND ')' statement		{;}
		;
		
			
COND		:        exp				{;}
		|    exp '>' exp			{;}
		|'(' exp '>' exp ')'			{;}
		|    exp '<' exp			{;}
		|'(' exp '<' exp ')'			{;}
		|    COND AND COND			{;}
		|'(' COND AND COND ')'			{;}
		|    COND OR COND			{;}
		|'(' COND OR COND ')'			{;}
		;
		
		
assignment_i	:name				{strcpy(names[++top].id,$1);
						 names[top].val = 0;names[top].type = 'i';}
		|name '=' exp			{strcpy(names[++top].id,$1);
						 names[top].val = (int)$3;names[top].type = 'i';}
		;
		
		
assignment_f	:name				{strcpy(names[++top].id,$1);
						 names[top].val = 0.0;names[top].type = 'f';}
		|name '=' exp			{strcpy(names[++top].id,$1);
						 names[top].val = $3;names[top].type = 'f';}
		;
		
		
exp		:term				{$$ = $1;}
		|exp '+' exp			{$$ = $1 + $3;}
		|exp '-' exp			{$$ = $1 - $3;}
		|exp '*' exp			{$$ = $1 * $3;}
		|exp '/' exp			{$$ = $1 / $3;}
		|'(' exp ')'			{$$ = $2;}
		;
		
		
term		:number				{$$ = $1;}
		|name				{
						 if(findName_Index($1) != -1){
						 	if(names[findName_Index($1)].type == 'i')
						 		$$ = (int)names[findName_Index($1)].val;
						 	else
						 		$$ = names[findName_Index($1)].val;
						 }
						 	
						 else printf("[ERROR NO VARIABLE NAMED %s]\n",$1);
						}
		;



%%


int findName_Index(char X[30]){
	int i;
	for(i=0;i<=top;i++){
		if(!strcmp(names[i].id,X))
			return i; 
	}
	return -1;
}

int main(){
return yyparse();
}

void yyerror(char* s){fprintf(stderr,"%s\n",s);}


















