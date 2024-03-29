## R sumup slogan: 1. Everything that exists is an object. 2. Everything that happens is a function call
## play() to suspend lesson in swirl and play with the code; nxt() to continue


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




## LESSON 10 - lapply and sapply

## Each of the *apply functions will SPLIT up some data into smaller pieces,
## APPLY a function to each piece, then COMBINE the results
## Flags dataset http://archive.ics.uci.edu/ml/datasets/Flags

head(flags) ## preview the first six lines (i.e. the 'head') of the dataset stored as flags
dim(flags) ## returns info about 194 rows, or observations, and 30 columns, or variables
class(flags) ## returns data.frame, not the actual classes of each variable
cls_list <- lapply(flags, class) ## apply the class() function to each column
## of the flags dataset and store the result in a variable cls_list
class(cls_list) ## confirms that lapply returns a list
as.character(cls_list) ## list changed into a character vector
cls_vect <- sapply(flags, class) ## lapply, but simplified into a vector, not a list
class(cls_vect) ## confirms that sapply returns a vector

## if element length 1, sapply returns a vector
## if element length more than 1, sapply returns a matrix
## if various, sapply returns a list like lapply

sum(flags$orange) ## no of countries with orange on their flag
flag_colors <- flags[, 11:17] ## extracts all rows ( ,) for columns with flag color info (11-17)
lapply(flag_colors, sum) ## returns sums of instances of each flag color as list
sapply(flag_colors, sum) ## returns sums of instances of each flag color as vector
sapply(flag_colors, mean) ## returns proportion of each color to all flags as vector

flag_shapes <- flags[, 19:23] ## extracts all rows ( ,) for columns with flag shape info (19-23)
lapply(flag_shapes, range) ## returns the minimum and maximum of each shape as list
shape_mat <- sapply(flag_shapes, range) ## returns the minimum and maximum of each shape as matrix
class(shape_mat) ## confirms it's a matrix/array
unique(c(3, 4, 5, 5, 5, 6, 6)) ## returns unique values with duplicates removed
unique_vals <- lapply(flags, unique) ## returns unique values of the dataset as list
sapply(unique_vals, length) ## returns the length of elements as list (cause the length varies too much for a vector)
lapply(unique_vals, function(elem) elem[2]) ## returns list containing the second item from each element of unique_vals




## LESSON 11 - vapply and tapply

## Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows you to specify it explicitly
vapply(flags, unique, numeric(1)) ## expects each element to be a numeric vector of length 1
## and returns an error if that's not the case
vapply(flags, class, character(1)) ## expectations met here

## tapply splits data up into groups based on the value of some variable,
## then applies a function to the members of each group
table(flags$landmass) ## returns no of flags for each landmass
table(flags$animate) ## returns no of flags with an animal etc and bare ones
tapply(flags$animate, flags$landmass, mean) ## returns proportion of flags containing animate image within each landmass group
## by applying mean function to 'animate' variable separately for each of the six landmass groups
tapply(flags$population, flags$red, summary) ## returns summary of population for flags with red
tapply(flags$population, flags$landmass, summary) ## returns summary of population for each landmass




## LESSON 12 - Looking at data

## Plants dataset http://plants.usda.gov/adv_search.html
ls() ## returns all active variables
class(plants)
dim(plants) ## informs about 5166 rows/observations and 10 columns/variables
nrow(plants) ## how many rows
ncol(plants) ## how many columns
object.size(plants) ## how many bytes it occupies in memory
names(plants) ## returns a vector of column names
head(plants) ## first six rows by default
head(plants, 10) ## first 10 rows
tail(plants) ## last six rows by default
tail(plants, 15) ## last 15 rows
summary(plants) ## different output for each variable, depending on its class
## For numeric data, displays the minimum, 1st quartile, median, mean, 3rd quartile, and maximum
## These values help us understand how the data are distributed
## For categorical/factor variables, displays the number of times each value (or 'level') occurs in the data
## For example, each value of Scientific_Name only appears once, since it is unique to a specific plant
## In contrast, the summary for Duration (also a factor variable) tells us that
## our dataset contains 3031 Perennial plants, 682 Annual plants, etc
table(plants$Active_Growth_Period) ## see how many times each value actually occurs in the data
str(plants) ## combines many of the features of the other functions, all in a concise and readable format
## At the very top, it tells us that the class of plants is 'data.frame' and that it has 5166 observations and 10 variables
## It then gives us the name and class of each variable, as well as a preview of its contents
## actually a very general function that you can use on most objects in R
## Any time you want to understand the structure of something (a dataset, function, etc.), str() is a good place to start





## LESSON 13 - Simulation

## Each probability distribution in R has an r*** function (for "random"),
## a d*** function (for "density"), a p*** (for "probability"), and q*** (for "quantile")

sample(1:6, 4, replace = TRUE) ## simulates rolling four six-sided dice; with replacement =
## each number is "replaced" after it is selected, so that the same number can show up more than once
sample(1:20, 10) ## random 10 nos between 1 and 20, without replacement,
## so no number appears more than once in the output
LETTERS ## predefined variable in R containing a vector of all 26 letters of the English alphabet
sample(LETTERS) ## rearranges all elements of the vector
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3,0.7)) ## simulate 100 flips of an unfair two-sided coin
## This particular coin has a 0.3 probability of landing 'tails' and a 0.7 probability of landing 'heads'
sum(flips) ## sums the no of head flips (cause these have binary outcome 1)
rbinom(1, size=100, prob=0.7) ## one binominal random variable, represents no. of 'successes' (heads)
## in a given no. of independent 'trials' (coin flips), with probability of successes specified
flips2 <- rbinom(100, size=1, prob=0.7) ## hundred random variables, representing successes or failures (1 or 0)
sum(flips2) ## also sums the no of head flips
rnorm(10) ## 10 random nos from standard normal distribution
## standard normal distribution has mean 0 and standard deviation 1
rnorm(10, 100, 25) ## 10 random nos from a normal distribution with mean 100 and standard deviation 25
rpois(5, 10) ## 5 random numbers from a Poisson distribution with mean 10
my_pois <- replicate(100, rpois(5, 10)) ## matrix, each column contains 5 random nos generated from Poisson distribution with mean 10
cm <- colMeans(my_pois) ## vector of column means
hist(cm) ## plots a histogram





## LESSON 14 - Dates and times

## dates are stored as the number of days since 1970-01-01 (Date class)
## times are stored as either the number of seconds since 1970-01-01 ('POSIXct' class)
## or a list of seconds, minutes, hours, etc. ('POSIXlt' class)

d1 <- Sys.Date()
class(d1) ## confirm it's Date class
unclass(d1) ## shows what it looks like internally; here, 19193 - no of day since Jan 1, 1970
d1 ## shows today's date in year-month-day format
d2 <- as.Date("1969-01-01") ## date before unix date
unclass(d2) ## returns -365, what fun :D
t1 <- Sys.time()
t1 ## returns date + time CEST
class(t1) ## returns "POSIXct" "POSIXt"; POSIXt just as a common language between POSIXct and POSIXlt
unclass(t1) ## returns no of seconds since Jan 1, 1970
as.POSIXlt(Sys.time()) ## coerces the result as POSIXlt this time
unclass(t2) ## prints just the same, but internally is stored as list of values that make up the date and time
str(unclass(t2)) ## more compact view of the POSIXlt list
t2$min ## returns only minutes from POSIXlt list
weekdays(d1) ## returns day of the week of the variable
months(t1) ## returns month of the variable
quarters(t2) ## returns quarter of the yer of the variable
t3 <- "October 17, 1986 08:24" ## non-standard time format
t4 <- strptime(t3, "%B %d, %Y %H:%M") ## converts to R time format
Sys.time() > t1 ## checks if some time has passed
Sys.time() - t1 ## returns time difference
difftime(Sys.time(), t1, units = 'days') ## returns how many days have passed since creating t1





## LESSON 15 - Base graphics

data(cars) ## loads data frame about cars
head(cars) ## first 6 rows/observations
plot(cars) ## makes a scatterplot for the data frame
plot(x = cars$speed, y = cars$dist) ## practically the same plot, just more specifically described
plot(x=cars$dist, y=cars$speed) ## reversed axes
plot(x = cars$speed, y = cars$dist, xlab = "Speed") ## x axis label set to Speed
plot(x = cars$speed, y = cars$dist, xlab = "Speed", ylab = "Stopping Distance") ## both axes named correctly
plot(cars, main = "My Plot", sub = "My Plot Subtitle") ## plot title and subtitle
plot(cars, col=2) ## points colored red
plot(cars, xlim = c(10, 15)) ## x axis values only from 10 to 15
plot(cars, pch=2) ## triangles instead of points

data(mtcars) ## loads data frame about other cars
boxplot(formula = mpg ~ cyl, data = mtcars) ## plot the relationship between cyl (number of cylinders) and mpg (miles per gallon)
hist(mtcars$mpg) ## histogram of mpg
