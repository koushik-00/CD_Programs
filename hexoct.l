%{
    #include<stdio.h>
%}

%%

[o][0-7]+ {printf("Octal : %s\n",yytext);}
[o][x|X][0-9A-F]+ {printf("Hexadecimal : %s\n",yytext);}

%%
int yywrap(void){}
int main(){
    printf("Enter something : ");
    yylex();
    return 0;
}