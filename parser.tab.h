/* A Bison parser, made by GNU Bison 3.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AMP = 258,
    ASGN = 259,
    BANG = 260,
    COLON = 261,
    COMMA = 262,
    DAMP = 263,
    DBAR = 264,
    DIV = 265,
    DOT = 266,
    EQ = 267,
    GE = 268,
    GT = 269,
    LBRACK = 270,
    LE = 271,
    LPAREN = 272,
    LT = 273,
    MINUS = 274,
    NE = 275,
    PLUS = 276,
    RBRACK = 277,
    RPAREN = 278,
    SEMI = 279,
    STAR = 280,
    ARRAY = 281,
    BEGINN = 282,
    BOOL = 283,
    ELSE = 284,
    ELIF = 285,
    END = 286,
    FALSE = 287,
    FOR = 288,
    FLOAT = 289,
    FUNCTION = 290,
    IF = 291,
    IN = 292,
    INT = 293,
    OF = 294,
    PROCEDURE = 295,
    PROGRAM = 296,
    READ = 297,
    RECORD = 298,
    RETURN = 299,
    THEN = 300,
    TRUE = 301,
    WHILE = 302,
    WRITE = 303,
    FCONST = 304,
    ICONST = 305,
    IDENT = 306,
    SCONST = 307,
    STATEMENT = 308
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 20 "parser.y"

    int w;                 /* ICONST yylval.w = yytext(then convert this to int)*/
    double r;              /* FCONST */
    char *sb;              /* SCONST */
    struct he *phe;        /* IDENT  */

    /* more to be added during Phase 3 */

#line 120 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
