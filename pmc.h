/*
 * pmc.h -- main definitions
 *
 * <Your name here>
 * Department of Computer Science
 * Trinity College
 *
 * Date:
 * Modification History:
 *
 */

#include <stdio.h>
#include "hash.h"
#include "msg.h"

#define   MAX_FILE_NAME    256
struct he *symtab[iheMax]; /* symbol table */
extern FILE *yyin;
int cErrors;
char *infile;
