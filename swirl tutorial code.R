## R sumup slogan: 1. Everything that exists is an object. 2. Everything that happens is a function call

## LESSON 1 - Building blocks

rm(list=ls()) ## clears workspace by removing stored variables

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

x <- c(44, NA, 5, NA) ## vector with missing values
y <- rnorm(1000) ## vector containing 1000 draws from a standard normal distribution
z <- rep(NA, 1000) ## vector containing 1000 NAs
my_data <- sample(c(y, z), 100) ## select 100 elements at random from combined y and z
my_na <- is.na(my_data) ## checks if each element of a vector is NA
my_data == NA ## DOESN'T work as NA is not really a value, just a placeholder for quantity that's not available
sum(my_na) ## sums up all trues since TRUE = 1 and FALSE = 0
0/0 ## returns NaN, not a number



## LESSON 6 - Subsetting vectors

x[1:10] ## [index vector] to view the first ten elements of x
x[is.na(x)] ## returns all missing values from the vector
y <- x[!is.na(x)] ## vector with all values that are NOT NA
y[y>0] ## all of the positive elements of y
x[x>0] ## bunch of NAs mixed in with positive numbers since NA is not a value
x[!is.na(x) & x>0] ## only values of x that are both non-missing AND greater than zero
x[c(3, 5, 7)] ## returns 3rd, 5th, and 7th elements of x
x[c(-2, -10)] ## returns all elements of x EXCEPT for the 2nd and 10th
x[-c(2, 10)] ## same as x[c(-2, -10)]
vect <- c(foo = 11, bar = 2, norf = NA) ## vector with named elements
names(vect) ## returns names from the vector, without values
vect2 <- c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf") ## assigns names to values
identical(vect, vect2) ## check that vect and vect2 are the same
vect["bar"] ## returns the second named element
vect[c("foo", "bar")] ## specify a vector of names



## LESSON 7 - Matrices and data frames

my_vector <- 1:20
dim(my_vector) ## returns 'dimensions' of an object; here NULL cause vectors have no dimensions
length(my_vector) ## returns length of vector
dim(my_vector) <- c(4, 5) ## turns vector into a 4 rows x 5 columns matrix
attributes(my_vector) ## shows attributes, such as dimensions
class(my_vector) ## checks the class, here - a matrix / array
my_matrix2 <- matrix(1:20, nrow=4, ncol=5) ## makes a matrix from scratch
identical(my_matrix, my_matrix2) ## checks if they're the same
patients <- c("Bill", "Gina", "Kelly", "Sean")
cbind(patients, my_matrix) ## combines both matrices but turns them into character type
my_data <- data.frame(patients, my_matrix) ## combines matrices into a data frame
## without turning numbers into strings
class(my_data) ## returns class type; here - "data.frame"
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames ## assigns column names to data frame from cnames vector



## LESSON 8 - Logic

TRUE == TRUE ## checks if equal to
(FALSE == TRUE) == FALSE
6<7 ## less than
10<=10 ## less than or equal
5 != 7 ## not equal
!(5==7) ## negates the expression to TRUE
FALSE & FALSE ## AND operator; here: false
TRUE & TRUE ## here: true
TRUE & FALSE ## here: false
TRUE & c(TRUE, FALSE, FALSE) ## checks logic for each of three pairs
TRUE && c(TRUE, FALSE, FALSE) ## checks logic for the first pair only
TRUE | c(TRUE, FALSE, FALSE) ## OR operator, checks each of three pairs
TRUE || c(TRUE, FALSE, FALSE) ## checks the first pair only
5 > 8 || 6 != 8 && 4 > 3.9 ## First the left and right operands of the AND operator are evaluated
## 6 is not equal 8, 4 is greater than 3.9, therefore both operands are TRUE
## so the resulting expression `TRUE && TRUE` evaluates to TRUE.
## Then the left operand of the OR operator is evaluated: 5 is not greater than 8 
## so the entire expression is reduced to FALSE || TRUE.
## Since the right operand of this expression is TRUE the entire expression evaluates to TRUE
isTRUE(6>4)
!isTRUE(4 < 3) ## negated
identical('twins', 'twins')
identical(5 > 4, 3 < 3.1) ## also true
xor(5 == 6, !FALSE) ## exclusive OR; if one TRUE and one FALSE, then TRUE, otherwise FALSE
ints <- sample(10)
ints > 5 ## checks true false for every element
which(ints>7) ## returns the sequence numbers (indices) of the elements that match (4th element, 5th etc)
any(ints<0)
all(ints>0)



## LESSON 9 - Functions

Sys.Date() ## returns today's date
mean(c(2, 4, 5))

boring_function <- function(x) {
  x
} ## function that returns whatever is input in parentheses
boring_function('My first function!') ## returns My first function!
boring_function ## returns source code for the function

my_mean <- function(my_vector) {
  sum(my_vector) / length(my_vector) 
} ## function that returns the mean
my_mean(c(4, 5, 10)) ## returns the mean, 6.33..

increment <- function(number, by = 1){
  number + by
} ## function that returns numbers increased by 1
increment(5) ## returns 6
increment(5, 2) ## also works, returns 7

remainder <- function(num, divisor = 2) {
  num %% divisor 
} ## function that returns the remainder of division, default by 2
remainder(5) ## returns 1
remainder(11, 5) ## also works, returns 1
remainder(divisor=11, num=5) ## returns 5
remainder(4, div=2) ## R can also partially match arguments; div = divisor
args(remainder) ## returns function arguments

add_two_numbers <- function(num1, num2){
  num1 + num2
} ## function returns sum
multiply_two_numbers <- function(num1, num2){
  num1 * num2
} ## function for multiplication
some_function <- function(func){
  func(2, 4)
} ## function returns just numbers
some_function(add_two_numbers) ## will evaluate to 6
some_function(multiply_two_numbers) ## will evaluate to 8

evaluate <- function(func, dat){
  func(dat) 
} ## function returns result of dat being passed as an argument to func
evaluate(sd, c(1.4, 3.6, 7.9, 8.8)) ## returns standard deviation of the vector

evaluate(function(x){x+1}, 6) ## includes anonymous function; returns 7
evaluate(function(x){x[1]}, c(8, 4, 0)) ## anonymous function; returns 1st element of vector
evaluate(function(x){x[length(x)]}, c(8, 4, 0)) ## anonymous; returns last element

paste("Programming", "is", "fun!") ## pastes these as one string incl spaces

simon_says <- function(...){
  paste("Simon says:", ...)
}

telegram <- function(...){
  paste("START", ..., "STOP")
}
telegram("Baby", "is", "drawing") ## returns START Baby is drawing STOP

add_alpha_and_beta <- function(...){
## First capture the ellipsis inside of a list
## and then assign the list to a variable. Let's name the variable `args`.
  args <- list(...)
## assume that there are two named arguments within args named `alpha` and `beta.`
## extract named arguments by using the name and double brackets
  alpha <- args[["alpha"]]
  beta  <- args[["beta"]]
## Then we return the sum of alpha and beta.
  alpha + beta 
}

mad_libs <- function(...){
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

"%mult_add_one%" <- function(left, right){
  left * right + 1
} ## defining custom operator
4 %mult_add_one% 5 ## returns 21

"%p%" <- function(left, right){
  paste(left, right)
}
"I" %p% "love" %p% "R!" ## returns "I love R!"



## LESSON 14 - Dates and times

