## LESSON 1 - Building blocks

5 + 7 ## In its simplest form, R can be used as an interactive calculator

x <- 5 + 7 ## assigned to a new variable called x, can be read as 'x gets 5 plus 7'
x ## To view the contents of the variable, just type it and press ctrl Enter / Enter

y <- x - 3 ## new variable

z <- c(1.1, 9, 3.14) ## easiest way to create a numeric vector (small collection of numbers) 
## is with the c() function, which stands for 'concatenate' or 'combine'.
## Any object that contains data is called a data structure 
## and numeric vectors are the simplest type of data structure in R.
## In fact, even a single number is considered a vector of length one.  

?c ## for more information on the c() function

c(z, 555, z) ## combine vectors to make a new vector, here with no variable
z * 2 + 100 ## Numeric vectors can be used in arithmetic expressions
## First, R multiplied each of the three elements in z by 2.
## Then it added 100 to each element to get the result.
## Other common arithmetic operators are `+`, `-`, `/`,
## `^` (where x^2 means 'x squared'). To take the square root, use sqrt() function
## and to take the absolute value, use abs() function.

my_sqrt <- sqrt(z - 1) ## square root of z - 1 and assign it to variable my_sqrt
## R first subtracted 1 from each element of z,
## then took the square root of each element,
## creating a vector of the same length as the original vector z.

my_div <- z / my_sqrt ## new variable called my_div with z divided by my_sqrt
## The first element of my_div is equal to the first element of z 
## divided by the first element of my_sqrt, and so on...

## When given two vectors of the same length, R simply performs the specified
## arithmetic operation (`+`, `-`, `*`, etc.) element-by-element. If the vectors
## are of different lengths, R 'recycles' the shorter vector until it is the same
##length as the longer vector.
## in z * 2 + 100 , z was a vector of length 3, but technically 2 and 100 
## are each vectors of length 1.
## R is ''recycling'' the 2 to make a vector of 2s 
## and the 100 to make a vector of 100s. 
## when you ask R to compute z * 2 + 100, 
## what it really computes is: z * c(2, 2, 2) + c(100, 100, 100).'

c(1, 2, 3, 4) + c(0, 10) ## recycling in action

c(1, 2, 3, 4) + c(0, 10, 100) ## If the length of the shorter vector
## does not divide evenly into the length of the longer vector,
## R will still apply the 'recycling' method, but will throw a warning
## to let you know something fishy might be going on.

## the up arrow will cycle through previous commands



## LESSON 2 - Workspace and files

getwd() ## Determine which directory R session is using as its current working directory

ls() ## List all the objects in your local workspace
list.files() ## List all the files in your working directory
dir() ## Also list all the files in your working directory

args(list.files) ## way to see what arguments a function can take

old.dir <- getwd() ## Assign the value of the current working directory to a variable old.dir
dir.create("testdir") ## create a directory in the current working directory called "testdir"
setdir("testdir") ## Set your working directory to "testdir"

file.create("mytest.R") ## Create a file in your working directory called "mytest.R"
file.exists("mytest.R") ## Check to see if "mytest.R" exists in the working directory
file.info("mytest.R") ## Access information about the file "mytest.R"
file.info("mytest.R")$size ## use the $ operator to grab specific info items
file.rename("mytest.R", "mytest2.R") ## Change file name "mytest.R" to "mytest2.R"
file.copy("mytest2.R", "mytest3.R") ## Make a copy of "mytest2.R" called "mytest3.R"
file.path("mytest3.R") ## Provide the relative path to the file "mytest3.R"
file.path("folder1", "folder2") ## Pass 'folder1' and 'folder2' as argumentsto make platform-independent pathname

dir.create(file.path("testdir2", "testdir3"), recursive = TRUE) ## Create a directory
## in the current working directory called "testdir2"
## and a subdirectory for it called "testdir3", all in one command
## To create nested directories, 'recursive' must be set to TRUE



## LESSON 3 - 