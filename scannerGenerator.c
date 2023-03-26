#include<stdio.h>
#include<string.h>
#include<ctype.h>
#include<math.h>
int main(){
    FILE *input=fopen("input.txt","r");
    FILE *output=fopen("output.txt","w");
    char str[20];
    char keyword[30][30]={"int","double","char","if","else","main"};
    int i,flag;
    int t=1,l=0;
    fprintf(output,"Line no.\t\tToken no.\t\t Token\t\t Lexeme\n\n"); 
    while(!feof(input)){
        i=0; flag=0;
        char ch=fgetc(input);
        if(ch=='+'||ch=='-'||ch=='*'||ch=='/'){
            fprintf(output,"%7d\t\t%7d\t\tOperator\t\t%7c\n\n",l,t,ch);
            t++;
        }
        else if(ch=='('||ch==')'||ch=='{'||ch=='}'||ch=='%'||ch==';'){
            fprintf(output,"%7d\t\t%7d\t\tSpecial Symbol\t\t%7c\n\n",l,t,ch);
            t++;
        }
        else if(isdigit(ch)){
            fprintf(output,"%7d\t\t%7d\t\tDigit\t\t%7c\n\n",l,t,ch);
            t++;
        }
        else if(isalpha(ch)){
            str[i]=ch;
            i++;
            ch=fgetc(input);
            while(isalpha(ch) && ch!=' '){
                str[i]=ch;
                i++;
                ch=fgetc(input);
            }
            str[i]='\0';
            for(int j=0;j<30;j++){
                if(strcmp(str,keyword[j])==0){
                    flag=1;
                    break;
                }
            }
            if(flag==1){
                fprintf(output,"%7d\t\t%7d\t\tKeyword\t\t%7s\n\n",l,t,str);
                t++;
            }
            else{
                fprintf(output,"%7d\t\t%7d\t\tIdentifier\t\t%7s\n\n",l,t,str);
                t++;
            }
        }
        else if(ch=='\n'){
            l++;
        }
    }
    fclose(input);
    fclose(output);
    return 0;
}