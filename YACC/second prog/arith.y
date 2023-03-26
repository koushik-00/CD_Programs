%{
    #include<stdio.h>
%}
%token NUMBER VARIABLE
%left '+' '-' '*' '/' '%' '(' ')'
%%
S : VARIABLE'='E{
    printf("Valid arithmetic expression");
}

E : E'+'E
   | E'-'E
   | E'*'E
   | E'/'E
   | E'%'E
   | '('E')'
   | NUMBER
   | VARIABLE 
;

%%

int main(){    
    printf("Enter any arithmetic expression");
    yyparse();
}

int yyerror(const char *msg){
    fprintf(stderr,"%s\n",msg);
}