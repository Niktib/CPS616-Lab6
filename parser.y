%{
#include <stdio.h>
  int yylex();
%}

%token ID NUM STR OB CB DP 

%%                   /* beginning of rules section */

sexpr: atom                 {printf("matched sexpr\n");}
    | list
    ;
list: OB members CB        {printf("matched list\n");}
    | OB CB                {printf("matched empty list\n");}
    ;
members: sexpr              {printf("members 1\n");}
    | members members         {printf("members 2\n");}
    ;
atom: ID                    {printf("ID\n");}
    | NUM                   {printf("NUM\n");}
    | STR                   {printf("STR\n");}
    ;

%%
main()
{
 return(yyparse());
}

yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

yywrap()
{
  return(1);
}
