/*
 * scanner.l - a lexical analyzer for P-
 *
 * Hunter Moore
 *
 * Date: 9/30/19
 * Modification History:
 * Modified by Hunter Moore
 */

%{

/* Include files and global variables go here */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "msg.h"
#include "parser.tab.h"
#define MAX_STR_LENGTH 500


int cLine = 1;
extern int cErrors;
extern char *infile;
int i;
void quote(char a[]);
%}

digit[0-9]
ID[A-Z|a-z_]+[a-z|0-9]*
operator["&"|"="|"!"|":"|","|"."|">"|"<"|"["|"]"|"("|")"|"+"|"-"|"/"|"*"]
newQuote\\"
specialChar[^\"]

%x comment																																																												
%x string

%%
            /* Local variables go here */


"\n"           																										 cLine++;

"&&"|"||"|">="|"<="|"=="|"!="|".."                              {																																			/*Catches compound operators*/
																																fprintf(stderr, message[mnCompoundOperator], cLine, yytext);
																																}

  						     
[0-9]+"."[0-9]+																	       		    		{																																		/*Catches floats*/
																																	return FCONST;
																																	}	
	

{digit}+			 																										{																																/*Catches integers*/
																																	return ICONST;
  						 																										}																		
																				
array|ARRAY|BEGIN|begin|BOOL|bool|ELSE|else|ELIF|elif|END|end|FALSE|false|FOR|for|FLOAT|float|FUNCTION|function|IF|if|IN|in|INT|int|OF|of|PROCEDURE|procedure|PROGRAM|program|READ|read|RECORD|record|RETURN|return|THEN|then|TRUE|true|WHILE|while|WRITE|write				{																																				/*Catches keywords*/
																																printf("%d: keyword '%s' found\n", cLine, yytext);
																																}
																																
																								


			
{ID}+																													   {																																					/*Catches identifiers*/
																																 return IDENT; //maybe return individual identifier name...
																																 }
																																	



[ \t]+ 																												  {}																																						/*Catches white space*/
[ \f]+ 																													{}																																																								
																																
"&"|"="|"!"|":"|","|"."|">"|"<"|"["|"]"|"("|")"|"+"|"-"|"/"|"*"	{																																							/*Catches operators*/
																																fprintf(stderr, message[mnOperator], cLine, yytext);
																																}


																																


"/*"																														BEGIN(comment);																/*Begins starting state for comment*/
<comment>[^*\n/*]*																																														/*This code is modified from the text book (as are lines 89, 96 nad 97)*/
<comment>"*"+[^*/\n]*																																													/*These lines eat up what are within comments - except for a * / within a comment 																																																							*/																			
																																																													
<comment>"/*"																										{																							/*This detects illegal comments nested in a comment*/
																																fprintf(stderr, message[mnIllegalComment], cLine, yytext);
																																return -1;																		/*Ends scanning at error - if removed, it prints the error, does not print the comment, 																																																								and continues scanning*/
																														  	}

<comment>\n																											++cLine;																			/*If a new line is encountered in comment, it increases line number*/
<comment>"*"+"/"  													   									BEGIN(INITIAL);    														/*End of comment. Exits <comment> phase*/

\"																															{
																																BEGIN(string);	
																																yymore();																			/*Begins string phase*/																																
																																}																														
																																    		                                    																															

<string>(\\.|[^"\\])*																						{yymore();																		//Adds everything to yytext unless it's an escape character or "	 
																																}																			




<string>\"																						      	{																									//Denotes end of string																													
																																BEGIN(INITIAL);																			
																																quote(yytext);           				     //Calls function to eliminate escape characters
																																return SCONST;
																															  }	
																												
																												
																												
<string><<EOF>>																									{											 																					//Catches unterminated strings				
																																fprintf(stderr, message[mnIllegalString], cLine, yytext); 
																																yyterminate();
																																}
					
					
					
  .         																								   {																																	//Catches unrecognized characters
               																								 fprintf(stderr, message[mnUnknownChar], cLine, yytext[0]);
              																						  	 cErrors++;
              																								 }
                        
%%

/* User routines go here */

void quote(char a[]){
	int i;
	int j;
	char first;
	
	for(i = 0; i < strlen(a); i++){
		first = a[i];
		if((int)first == 92){																//if character is a backslash
			if((int)a[i+1] == 92){														//and next character is a backslash
				for(j = i+1; j < strlen(a); j++){								//go through yytext and move everything up one to get rid of a backslash
					int counter = j+1;
					a[j] = a[counter];
					counter++;
				}
			}

			if(a[i+1] == '"'){																//if next character is a "
				j = i;																					//move up every position by one to get rid of backslash
				int counter = j + 1;														//This works, as in it removes a baskslash,but it calls the method at the end of a \", so it ends the string when it sees a \"
																												//I tried figuring out regex to only call function when it sees a " not proceded by a backslash, but I failed.
				for(j = i; j < strlen(a); j++){
					a[j] = a[counter];
					counter++;
				}
			}		
		}
	}
}
