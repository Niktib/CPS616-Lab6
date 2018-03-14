# CPS615-lab06 Creating a parser in Yacc

## Introduction

In this assignment you are given an scanner and parser (written in Lex and Yacc) for an incomplete grammar of the sLisp language (the language we created a lexer for in an earlier assignment).

In addition to `README.md` you will find the following files in this repository:
* `lexer.l`: an incomplete (but working) lex/flex specification of a lexer for sLisp
* `parser.y`: an incomplete yacc/bison specification of a parser for sLisp; the grammar it specifies is ambiguous
* `Makefile`: do not change this file.
* `test.lsp`: a simple syntactically correct sLisp program.

Below are instructions on how to create and test your parser.

To clean up files type at the command line:

> make clean

To create the parser (executable file called 'parser') type:

> make parser

Notice that when you compile the above files you will notice a message regarding *shift/reduce* conflicts and some warning messages.  The conflicts are indicate that your grammar is ambiguous. You may ignore the warning messages.

To test the parser on a test sLisp program file, say `test.lsp`,  type:

> ./parser < test.lsp

Nota Bene: if your test program has a syntax error, then the parser will output the message *syntax error* when you execute the above command. If the parser does not output that message, then your sLisp program is syntactically correct.


## You are asked to

1. Create a 'README.md' file that includes  the title of the assignment, your full name,  student ID, a statement attesting that this is your own work, and instructions on how to compile the parser. Below is an example of a `README.md` file
```
# LAB06
John doe
This is my own work.

To compile the parser...
```
2. improve the provided `lexer.l` code as appropriate. You must use this starter code. You are not allowed to create your own new lex code.
3. remove the ambiguity from the grammar
4. introduce grammar rules to accommodate the following new constructs:
  * boolean constants are atoms
  * an `sexpr` can also be a `vector`. Example of a vector `#(4 3 a #( 1 a) (b c) *s* lol)`. Notice each element in the vector is an `sexpr`


## What to submit

**Nota Bene**: Before submitting your solution, make sure your parser compiles with the *provided Makefile*.

Create an archive (.zip) file named `yourName.zip` (where `yourName` represents your actual name) containing the following files:
* your `README.md` file
* the provided Makefile
* your Yacc file
* your Lex file

Visit the assignment web page to submit a copy of your archive .zip file.

**EMAIL SUBMISSIONS WILL NOT BE ACCEPTED**
