%{
    #include<stdio.h>
    int s=0;
    int nl=0;
    int words=0;
    int cc=0;
    int tabs=0;
%}
%%

[\n] {nl++;}
[^\t\n] {words++;cc+=yyleng;}
[\t] {s++; cc+=yyleng;}
[ \t] {tabs++; cc+=yyleng;}
%%
int yywrap(void){}
int main(){
    printf("Enter something : ");
    yylex();
    printf("Spaces : %d\n",s);
    printf("Newlines : %d\n",nl);
    printf("Words : %d\n",words);
    printf("Characters : %d\n",cc);
    printf("Tabs : %d\n",tabs);
    return 0;
}