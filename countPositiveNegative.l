%{
    #include<stdio.h>
    int pos=0;
    int neg=0;
%}
%%

[-][0-9] {neg++;printf("Negative : %s\n",yytext);}
[0-9] {pos++;printf("Positive : %s\n",yytext);}

%%
int yywrap(void){}
int main(){
    printf("Enter something : ");
    yylex();
    printf("Positive : %d\n",pos);
    printf("Negative : %d\n",neg);
    return 0;
}