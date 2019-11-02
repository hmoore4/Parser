/*
 * scanner.l -- a lexical analyzer for P-
 *
 * <Your name>
 * Department of Computer Science
 * Trinity College
 *
 * Date:
 * Modification History:
 *
 */

%{

#include "scanner.h"
int MAX = 1000;
extern char *infile;
%}

D                 [0-9]
LETTER  					[a-zA-Z_]
POSSIBLEID  			[a-zA-Z0-9_]
%x string
%x comment


%%
						char stringArray[MAX];
            char *pt;								//points to char array (strings)
                        struct he *phe;
                        char msg[MAX_MSG_LEN];
                        char ch;
                        int ret;
					
" "                     |
"\t"                    |
"\f"                    ;
"\n"                    cLine++;


array|ARRAY             return(ARRAY);
begin|BEGIN							return(BEGINN);
bool|BOOL								return(BOOL);
else|ELSE								return(ELSE);
elif|ELIF								return(ELIF);
end|END									return(END);
false|FALSE							return(FALSE);
for|FOR									return(FOR);
float|FLOAT							return(FLOAT);
function|FUNCTION				return(FUNCTION);
if|IF										return(IF);
in|IN										return(IN);
int|INT									return(INT);
of|OF										return(OF);
procedure|PROCEDURE			return(PROCEDURE);
program|PROGRAM					return(PROGRAM);
read|READ								return(READ);
record|RECORD						return(RECORD);
return|RETURN						return(RETURN);
then|THEN								return(THEN);
true|TRUE								return(TRUE);
while|WHILE							return(WHILE);
write|WRITE							return(WRITE);

"&"											return(AMP);
"="											return(ASGN);
"!"										  return(BANG);
":"											return(COLON);
","											return(COMMA);
"."											return(DOT);
">"											return(GT);
"<"											return(LT);
"["											return(LBRACK);
"]"											return(RBRACK);
"("											return(LPAREN);
")"											return(RPAREN);
"+"											return(PLUS);
"-"											return(MINUS);
"/"											return(DIV);
"*"											return(STAR);
";"											return(SEMI);

"||"										return(DBAR);
"!="										return(NE);
"<="										return(LE);
">="										return(GE);
"=="										return(EQ);
"&&"										return(DAMP);



[0-9]+"."[0-9]+					{
													yylval.r = atof(yytext);		
													return(FCONST);
												}

{D}+										{
													yylval.w = atoi(yytext);
													return(ICONST);
												}

	                        

{LETTER}{POSSIBLEID}*     	{
                            if ((phe = Lookup(yytext)) == NULL) {
                                phe = Insert(yytext);
                                yylval.phe = phe;
                            }
                            return(IDENT);
                        }

                               

"\""			{																			//begins string
         pt = stringArray;
				 BEGIN(string);
				}
				
				
<string>(\\.|[^"\\])*																						{yymore();																		//Adds everything to yytext unless it's an escape character or "	 
																																}			
                 

					
<string>"\""	{																	//end of string
				BEGIN(INITIAL);
				char *pointer = yytext;
				while (*pointer) {
           *pt++ = *pointer++;
       	}
				yylval.sb = MakeString(yytext);
        return(SCONST);
              }


"/*"             BEGIN(comment);
               

<comment>[^*\n]*																//ignores everything except closing comment and newline
                 
<comment>"*"[^*/\n]*														//ignores star if not followed by a / (in which case it is end of comment)

<comment>"\n"	 cLine++;														//keep track of line number

<comment>"*/"  	 BEGIN(INITIAL);																//end of comment

.                       {
                            sprintf(msg, message[mnUnknownChar], yytext[0]);
                            PrintErrMsg(msg);
                        }
%%
