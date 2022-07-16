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



## LESSON 3 - Sequences of numbers

1:20 ## every integer between (and including) 1 and 20
pi:10 ## vector of real numbers starting with pi (3.142...)
## and increasing in increments of 1. The upper limit of 10 is never reached,
## since the next number in our sequence would be greater than 10
15:1 ## counted backwards in increments of 1
?":" ## help file about the function
seq(1, 20) ## same output as 1:20
seq(0, 10, by=0.5) ## vector of numbers ranging from 0 to 10, incremented by 0.5
my_seq <- seq(5, 10, length=30) ## sequence of 30 numbers between 5 and 10 stored in variable
length(my_seq) ## check the length
1:length(my_seq) ## sequence of integers from 1 to N with N = length of my_seq vector
seq(along.with = my_seq) ## same as 1:length(my_seq)
seq_along(my_seq) ## same as 1:length(my_seq)
rep(0, times=40) ## vector that contains 40 zeros
rep(c(0, 1, 2), times=10) ## 10 repetitions of the vector (0, 1, 2)
rep(c(0, 1, 2), each=10) ## contain 10 zeros, then 10 ones, then 10 twos



## LESSON 4 - Vectors

num_vect <- c(0.5, 55, -10, 6) ## numeric vector
tf <- num_vect < 1 ## variable checking if vector values are less than 1
## `<` and `>=` symbols are called 'logical operators'
## Other logical operators  `>`, `<=`, `==` for exact equality, and `!=` for inequality
## two logical expressions, A and B, we can ask whether at least one is TRUE
## with A | B (logical 'or' a.k.a. 'union')
## or whether they are both TRUE with A & B (logical 'and' a.k.a. 'intersection'). 
## !A is the negation of A and is TRUE when A is FALSE and vice versa
my_char <- c("My", "name", "is") ## character vector
paste(my_char, collapse = " ") ## join vector elements into one continuous character string
## separated with single spaces
paste("Hello", "world!", sep = " ") ## join vectors into one continuous character string
## separated with single spaces
paste(1:3, c("X", "Y", "Z"), sep = "") ## join vectors into pairs without space separation
paste(LETTERS, 1:4, sep = "-") ## Since the character vector LETTERS is longer than the numeric vector 1:4
## R simply recycles, or repeats, 1:4 until it matches the length
## numeric vector 1:4 gets 'coerced' into a character vector



## LESSON 5 - Missing values
