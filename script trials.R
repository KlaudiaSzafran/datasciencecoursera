x <- 1  ## 1 assigned to x
print(x)
x  ## same as print
msg <- "We'll try this as a first assigned string"
msg
y <- 1:60
y

num <- c(0.5, 0.6)  ## concatenate; create a vector of same-type objects
log1 <- c(TRUE, FALSE)  ## logical
log2 <- c(T, F)  ## logical
char <- c("a", "b", "c")  ## character
int <- 9:29  ## integer
com <- c(1+0i, 2+4i)  ## complex
com
char

numvec <- vector("numeric", length = 10)
numvec  ## returns 10x zero cause zero is the default numeric value
mix <- c(1.7, "a")  ## not the same object type, so R will automatically read 1.7 as a string
mix

class(y)  ## returns "integer"
as.character(y)  ## changes class to strings
as.integer(y)  ## changes class to integer
as.logical(y)  ## changes class to logical, with zero as the only false

firstlist <- list(1, "a", TRUE, 1+4i)
firstlist

matx <- matrix(nrow = 2, ncol = 3)  ## empty matrix of 2 rows and 3 columns
print(matx)
dim(matx)  ## returns the number of rows and columns (dimensions)

matx <- matrix(1:6, nrow = 2, ncol = 3) ## matrix of numbers 1-6
matx  ## numbers distributed columnwise = columns fill up first

matx <- 1:10  ## one-row matrix of nos 1-10
matx
dim(matx) <- c(2, 5)  ## adds dimensions to the matrix
matx

ob1 <- 1:3
ob2 <- 10:12
cbind(ob1, ob2)  ## binds two objects into column-based matrix
rbind(ob1, ob2)  ## binds two objects into row-based matrix

fact <- factor(c("yes", "yes", "no", "yes", "no"))
fact  ##factor = special vector representing categorical data
table(fact)  ## returns frequency of factor lvls
unclass(fact)  ## converts factor to a vector of integers

fact <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
fact  ## returns factor with lvls specifically ordered yes, then no
## normally lvls sorted alphabetically, so no is before yes

misvec <- c(1, 2, NA, 10, NaN, 3)
is.na(misvec)  ## checks for missing values in object, returning T/F
is.nan(misvec)  ## checks for unidentified math operations, returning T/F
