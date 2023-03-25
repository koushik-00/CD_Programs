%{
    int vow_count=0;
    int con_count=0;
%}
%%
[aeiouAEIOU]* {vow_count++;}
[^aeiouAEIOU]* {con_count++;}
%%
int yywrap(void){}
int main(){
    printf("Enter something : ");
    yylex();
    printf("Vowels : %d\n",vow_count);
    printf("Consonant : %d\n",con_count);
    return 0;
}