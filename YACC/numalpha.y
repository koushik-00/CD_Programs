%{
    #include<stdio.h>
%}
%token NUMBER ALPHABET
%%
input : NUMBER {printf("Input is a number");} | ALPHABET{printf("Input is a ALPHABET");} ;
%%
int main(){
    yyparse();
    return 0;
}
int yyerror(const char *msg){
    fprintf(stderr, "%s\n", msg);
}