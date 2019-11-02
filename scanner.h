/*
 * scanner.h -- a lexical analyzer definitions
 *
 * <Your name>
 * Department of Computer Science
 * Trinity College
 *
 * Date:
 * Modification History:
 *
 */

#include <stdlib.h>
#include "msg.h"
#include "parser.tab.h"

#define fError        -1
#define fMore         -2

int cLine = 1;
extern struct he *Insert(char *), *Lookup(char *);
extern char *MakeString(char *);
