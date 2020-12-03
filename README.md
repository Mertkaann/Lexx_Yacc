# Lex & Yacc Project
A minimal c compiler implementation using Lex and Yacc.

## NOTE
##### This readme file depracated. Please renew it later.


In the lex file;

We defined the digit from 0 to 9 and we used it for integer and float format.

We return some words to use them in yacc file.
These are "int, float, print, exit, if, while, &&, ||" . . .
User can also define the name for data types, so we define in lexx file this and return it to yacc file.
And we define them and we use atof for the floats and we used atol for the integers.
So both float and integer appers as number in yacc file.
And we also defined some operatos, paranthesis.. and also define for spaces and new lines.
And the end of the lex file, we use printf for the unexpected character

In the yacc file;
we defined the struct which name is Name_STRCT. we use this for the names.
we add all names in this struct and later we can compare this name if it exists or not in the input easily.

So we define array which name is "names" to take the names. The name has one double number. So we defined this in the struct
to use the struct in assignment_i and assignment_f.

We use "union" to define double and char. We use num for the double and char array for the name of float and integer inputs.

We take wors, from returning in lex file, and add these words with "token". And for the name, we use string arrray to take name and
in lex file we return number for integer and float so we take them as double with using "num"
which is defined in union.

We use "left" for the operators, paranthesis which are defined in lex file.
We use start to indicate that we start with "program" to this code.

We use "findName_Index(char X[30])" this function to is this name in names array which is defined in struct or not, this function's purpose
is that if it is not in names array the the function must return -1.

We define program, statements, statement, print_statement, if_statements, while_statement,
COND, assignment_i(for integers), assignment_f (for_floats), exp, term.

Statement can go to six statement so we print on screen user write in input. For example, for while_statement, we are printing
"WHILE_STATEMENT" on the console.
In print_statement we print the expression. Firstly, we check that if it is integer or float. Then if it is integer
we retunr the integer and we are printing "PRINTING i" to view on the screen. we use same operation for floats.

In assignment_i, we copy the name to array of names in struct Name_STRCT. And also we change the variable to integer
because we take names with dobule. In assignment_f we use the same.

