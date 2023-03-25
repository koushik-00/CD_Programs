%{
    #include<stdio.h>
    #include<ctype.h>
    #include<string.h>
    #include<math.h>
%}


%%


#.* {printf("Preprocessor Directive : %s \n",yytext);}
int|char|double|long {printf("Keyword : %s \n",yytext);}
[+|-|*|/] {printf("Operators : %s \n",yytext);}
"="|"=="|">="|"<="|"!="|">"|"<" {printf("Operator: %s\n",yytext);}
"{" {printf("Block Starts : %s \n",yytext);}
"}" {printf("Block Ends : %s \n",yytext);}
"(" {printf("Paranthesis Open : %s \n",yytext);}
")" {printf("Paranthesis Closed : %s \n",yytext);}
";" {printf("Semicolon: %s\n",yytext);}
[0-9] {printf("Constant : %s \n",yytext);}
[a-z][a-z0-9]* {printf("Identifier : %s \n",yytext);}
.    { printf("INVALID: %s\n", yytext); }


%%
int yywrap(void){}
int main(){
    yylex();
    return 0;
}
