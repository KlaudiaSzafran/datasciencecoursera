## Functions for matrix inversion (with matrix fully invertible):
## 1. makeCacheMatrix: creates "matrix" object that can cache its inverse
## 2. cacheSolve: calculates inverse of "matrix" or returns inverse from cache if already computed


## cacheable matrix
makeCacheMatrix <- function(mx = matrix()) {
  inv <- NULL
  set <- function(matrix) {
    mx <<- matrix
    inv <<- NULL
  }
  
  get <- function() {
    mx
  }
  
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  getInverse <- function() {
    inv
  }
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## cached inverse matrix
cacheSolve <- function(x, ...) {
  mx <- x$getInverse()
  if(!is.null(mx)) {
    message("Getting data from cache")
    return(mx)
  }
  
  data <- x$get()
  mx <- solve(data) %*% data
  x$setInverse(mx)
  mx
}