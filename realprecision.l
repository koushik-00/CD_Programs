%{
    #include<stdio.h>
    #include<ctype.h>
    #include<string.h>
    #include<math.h>
    int num=0;
%}

%%

[0-9]+\.[0-9]+ {
    char* ptr=yytext;
    num=0;
    while(*ptr!='.'){
        ptr++;
    }
    ptr++;
    while(*ptr){
        num++;
        ptr++;
    }
    printf("Precision : %d",num);
}

%%
int yywrap(void){}
int main(){
    yylex();
    return 0;
}