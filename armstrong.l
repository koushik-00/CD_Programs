%{
    #include<stdio.h>
    #include<string.h>
    #include<math.h>
    #include<ctype.h>
    void check(char *a);
%}
%%

[0-9]+ check(yytext);

%%
int yywrap(void){}
int main(){
    printf("Enter number : ");
    yylex();
    return 0;
}
void check(char *a){
    int num=0;
    for(int i=0;i<strlen(a);i++){
        num=num*10+(a[i]-'0');
    }
    int temp=num;
    int sum=0;
    int x;
    while(temp>0){
        x=temp%10;
        sum=sum + x*x*x;
        temp=temp/10;
    }
    if(sum==num){
        printf("Armstrong No.");
    }
    else{
        printf("Not an Armstrong No.");
    }
}