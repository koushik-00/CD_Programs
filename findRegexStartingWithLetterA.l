%{
    int flag=0;
%}

%%

[$aa-zA-Z0-9]+ {flag=1;}


%%
int yywrap(void){}
int main(){
    yylex();
    if(flag==1) printf("Accepted");
    else printf("Not Accepted");
    return 0;
}