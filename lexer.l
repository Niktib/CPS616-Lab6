%{
  #include <stdio.h>
  #include "y.tab.h"
  int lineCnt=1;      /* Line counter for error messages */
  int cmmtFlag=0;      /* Comment flag  */

%}

letter [a-zA-Z]
digit [0-9]
oSign ("+"|"-")?
lineComm ";"

boolean #t|#f|#T|#F
iNumber {oSign}{digit}+
rNumber {oSign}({digit}+"."{digit}*|{digit}*"."{digit}+)
number {iNumber}|{rNumber}
specialCharacter [+\-!$%&*/:<=>?~_\^]
identifier ({letter}|{specialCharacter})({letter}|{specialCharacter}|{digit})*
newline \n
whitespace [ \t]+


%%

\"(\\.|[^"\\])*\" {
  if (cmmtFlag==0)
    return STR;
}
{number} {
  if (cmmtFlag==0)
    return NUM;
}
{identifier} {
  if (cmmtFlag==0)
    return ID;
}
"(" {
  if (cmmtFlag==0)
    return OB;
}
"#(" {
  if (cmmtFlag==0)
    printf("An vector open parenthesis.");
}
")" {
  if (cmmtFlag==0)
    return CB;
}
"." {
  if (cmmtFlag==0)
    return DP;
}
{lineComm} { cmmtFlag=1;}
{newline} {
  lineCnt++;
  cmmtFlag = 0;
}
{whitespace}
. {
  if (cmmtFlag==0)
    printf("INVALID TOKEN: '%s' in line: %d\n", yytext, lineCnt);
}

%%
