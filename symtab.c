/*
 * symtab.c -- symbol table routines
 *
 * Author:        
 *
 * Date:
 *
 * Modification History:
 *
 */

#include <stdio.h>
#include "hash.h"

extern struct he *symtab[];

/*
 * InitSymTab() -- initialize the symbol table
 */
void InitSymTab()
{
    int i;

    for (i = 0; i < iheMax; i++)
        symtab[i] = NULL;
}
