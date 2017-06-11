## Using Functions to Simplify Your Code ##

If you have written even one Arduino sketch, you have already written at least
two functions:  

> >   `setup()` and 

> >   `loop()`.  

The essential features of any function are shown below, using the
`loop` function from the [packet](../../1-LED/1c-SeveralLEDs/code.html).
 
| Anatomy of a Function                 |
|:-------------------------------------:|
|![](images/anatomy-function.png)       |

Note that:

* the name of the function is `loop`
* the function takes no parameters, so its parameter list is just `void` (or blank)
* the function does not return any value, so it is said to have a "return type" of `void`
* the function definition consists of about a dozen statements enclosed in curly braces
* the `return` statement is used to return a `void`, so it isn't necessary

You can add any number of *additional* functions to your sketch to streamline
your code.

### Breaking Up Your Code into Two Functions ###

As written, the `loop()` function above repeats the same set of steps, with
different parameters, 3 times.  The program can be considerably shortened and
clarified by moving the repeated steps to an external function, as shown below:

| Calling a Function              |
|:-------------------------------:|
|![](images/calling.png)          |

Notes:

1.  There are two types of variables:

> > Global Variables:  these variables are declared outside of any function; they are accessible to all functions.

> > Local variables: these variables are declared within a function, and are only visible within that function.

2.  In the above example, the calling function invokes the called function with two parameters:

> > The first parameter is assigned to the local variable `pin` inside the called function.

> > The second parameter is assigned to the local variable `onTime`.

3.  The called function does not return any value, which is why it doesn't have a `return` statement.
When the called function finishes executing its last statement, program control just 
returns to the calling function.

### Advantage of Using Functions ###

There are several advantages of subdividing your code using functions.

1.  Your code is simpler and easier to read (and therefore maintain).
2.  If your new custom function has an error, then that error is localized within the function,
and not repeated elsewhere in the program.
3.  If you later decide to change the way your function works, it will only
be necessary to fix it in one place, rather than making serveral similar fixes at
various places in your program.

### Disadvantages of Using Functions ###

It takes a lot of time for a processor to *call* a function.  The
processor has to set aside its current state (e.g., the address of the statement 
it last executed, the values of all the variables it knows about).  Then it 
has to "jump" to the memory location where the new function is defined, 
execute all the statements in that function, and finally re-load its state 
from before the function was called. 

