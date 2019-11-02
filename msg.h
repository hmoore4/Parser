/*
 * msg.h -- List of messages for P- compiler
 *
 * Hunter Moore
 * Department of Computer Science
 * Trinity College
 *
 * Date:
 * Modification History:
 *
 */

#define MAX_MSG_LEN     256


/* error definitions for the scanner */ 
#define mnKeywordFound                     0
#define mnUnknownChar                      1
#define mnIllegalString                    2
#define mnOperator												 3
#define mnInteger													 4
#define mnFloat														 5
#define mnSpace														 6
#define mnIdentifier											 7
#define mnCompoundOperator								 8
#define mnString													 9
#define mnIllegalComment									10



/* error definitions for the parser */
#define mnMissingIdent                        11
#define mnMissingDecl													12
#define mnMissingStatement										13
#define mnMissingEnd													14
#define mnMissingSemi													15
#define mnMissingParen												16
#define mnMissingAssignment										17

/* Actual messages */
static char *message[] = {

    "%d: keyword '%s' found\n",
    "%d: unknown character %#x\n",
    "%d: illegal string found\n",
    "%d: operator '%s' found\n",
    "%d: integer '%s' found\n",
    "%d: float '%s' found\n",
    "%c: space '%s' found\n",
    "%d: identifier '%s' found\n",
    "%d: compound operator '%s' found\n",
    "%d: string %s found\n",
    "%d: illegal comment found\n",
     "Missing identifier\n",
    "Missing declaration\n",
    "Missing Statement\n",
		"Missing end statement\n",
		"Missing semi colon\n",
		"Missing parenthesis\n",
		"Missing Assignment\n",

};

