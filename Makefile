#
# <Your name here>
# Department of Computer Science
# Trinity College
#
# Maintain that following definitions:
#        HDR        all header files (*.h) that you create
#        HDRg       all header files generated by programs (e.g., lex and bison)
#        SRC        all C source files (*.c) that you create
#        SRCg       all C source files generated by programs
#        OBJ        all object files (*.o) required to load your progrms
#        GRD        all files required for grading
#
# Use the following make targets:
#        pmc        to build your program (into 'pmc')
#        grade      to hand in your program for grading
#        clean      to remove files generated by programs
# Date:
# Modification History:
#

HDR = msg.h scanner.h hash.h dt.h pmc.h
HDRg = parser.tab.h
SRC = pmc.c report.c symtab.c hash.c
SRCg = lex.yy.c parser.tab.c parser.output
OBJ = parser.tab.o lex.yy.o pmc.o report.o symtab.o hash.o
GRD = ${HDR} ${SRC} scanner.l parser.y Makefile 

CC = gcc
CFLAGS = -g

pmc: ${OBJ} 
	${CC} ${CFLAG} -o pmc ${OBJ} -L/home/pyoon/flex/lib -lfl

clean: 
	rm -f pmc ${HDRg} ${SRCg} ${OBJ}

grade:
	tar cvf - ${GRD} > myparser.tar

print:
	printfile ${GRD}

# Include this section when you begin your lex scanner.
lex.yy.c: scanner.l
	flex scanner.l
#
# Include this section when you begin your bison parser.
parser.tab.c: parser.y
	bison -dv parser.y

depend:
	sed '/^###/q' Makefile > Makefile.1
	sed '/^###/d' Makefile.1 > Makefile.2
	echo '### Automatically generated dependencies list:' >> Makefile.2
	${CC} -M ${SRC} >> Makefile.2
	mv Makefile.2 Makefile
	rm Makefile.1

### Automatically generated dependencies list:
pmc.o: pmc.c /usr/include/stdc-predef.h pmc.h /usr/include/stdio.h \
 /usr/include/features.h /usr/include/x86_64-linux-gnu/sys/cdefs.h \
 /usr/include/x86_64-linux-gnu/bits/wordsize.h \
 /usr/include/x86_64-linux-gnu/gnu/stubs.h \
 /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h \
 /usr/include/x86_64-linux-gnu/bits/types.h \
 /usr/include/x86_64-linux-gnu/bits/typesizes.h /usr/include/libio.h \
 /usr/include/_G_config.h /usr/include/wchar.h \
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
 /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
 /usr/include/x86_64-linux-gnu/bits/sys_errlist.h hash.h msg.h
report.o: report.c /usr/include/stdc-predef.h /usr/include/stdio.h \
 /usr/include/features.h /usr/include/x86_64-linux-gnu/sys/cdefs.h \
 /usr/include/x86_64-linux-gnu/bits/wordsize.h \
 /usr/include/x86_64-linux-gnu/gnu/stubs.h \
 /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h \
 /usr/include/x86_64-linux-gnu/bits/types.h \
 /usr/include/x86_64-linux-gnu/bits/typesizes.h /usr/include/libio.h \
 /usr/include/_G_config.h /usr/include/wchar.h \
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
 /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
 /usr/include/x86_64-linux-gnu/bits/sys_errlist.h
symtab.o: symtab.c /usr/include/stdc-predef.h /usr/include/stdio.h \
 /usr/include/features.h /usr/include/x86_64-linux-gnu/sys/cdefs.h \
 /usr/include/x86_64-linux-gnu/bits/wordsize.h \
 /usr/include/x86_64-linux-gnu/gnu/stubs.h \
 /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h \
 /usr/include/x86_64-linux-gnu/bits/types.h \
 /usr/include/x86_64-linux-gnu/bits/typesizes.h /usr/include/libio.h \
 /usr/include/_G_config.h /usr/include/wchar.h \
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
 /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
 /usr/include/x86_64-linux-gnu/bits/sys_errlist.h hash.h
hash.o: hash.c /usr/include/stdc-predef.h /usr/include/stdio.h \
 /usr/include/features.h /usr/include/x86_64-linux-gnu/sys/cdefs.h \
 /usr/include/x86_64-linux-gnu/bits/wordsize.h \
 /usr/include/x86_64-linux-gnu/gnu/stubs.h \
 /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h \
 /usr/include/x86_64-linux-gnu/bits/types.h \
 /usr/include/x86_64-linux-gnu/bits/typesizes.h /usr/include/libio.h \
 /usr/include/_G_config.h /usr/include/wchar.h \
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h \
 /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
 /usr/include/x86_64-linux-gnu/bits/sys_errlist.h /usr/include/stdlib.h \
 /usr/include/x86_64-linux-gnu/bits/waitflags.h \
 /usr/include/x86_64-linux-gnu/bits/waitstatus.h /usr/include/endian.h \
 /usr/include/x86_64-linux-gnu/bits/endian.h \
 /usr/include/x86_64-linux-gnu/bits/byteswap.h \
 /usr/include/x86_64-linux-gnu/bits/byteswap-16.h \
 /usr/include/x86_64-linux-gnu/sys/types.h /usr/include/time.h \
 /usr/include/x86_64-linux-gnu/sys/select.h \
 /usr/include/x86_64-linux-gnu/bits/select.h \
 /usr/include/x86_64-linux-gnu/bits/sigset.h \
 /usr/include/x86_64-linux-gnu/bits/time.h \
 /usr/include/x86_64-linux-gnu/sys/sysmacros.h \
 /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h /usr/include/alloca.h \
 /usr/include/x86_64-linux-gnu/bits/stdlib-float.h dt.h hash.h