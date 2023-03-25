%{
    #include<stdio.h>
    int k;
    void capitalize(char *);
%}

letter [a-z]
com [//]

%%

{com} {k=1;}
{letter} {if(k==1) capitalize(yytext);}


%%
int yywrap(void){}
int main(){
    yylex();
    return 0;
}
void capitalize(char *s){
    for(int i=0;s[i]!='\0';i++){
        printf("%c", toupper(s[i]));
    }
}