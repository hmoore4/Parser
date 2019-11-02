/*
 * pmc.c -- main driver for P- compiler
 *
 * <Your name here>
 * Department of Computer Science
 * Trinity College  
 *
 * Date:
 * Modification History:
 *
 */

#include "pmc.h"

int main(int argc, char *argv[])
{
    if (argc != 2) {
        fprintf(stderr, "Usage: pppc filename\n");
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        fprintf(stderr, "%s: cannot open\n", argv[1]);
        exit(1);
    }
    infile = argv[1];
    cErrors = 0;
    InitSymTab();
    yyparse();
    if (cErrors == 0) 
        fprintf(stderr, "\nno errors\n");
    else
        fprintf(stderr, "\n%d error(s)\n", cErrors);
    exit(cErrors);
}
