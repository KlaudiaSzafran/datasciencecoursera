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
