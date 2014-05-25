## Put comments here that give an overall description of what your
## functions do

## Creates a special version of matrix that provides cached operations.
## @param x R matrix to be converted.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## A function to compute the inverse of a "special" matrix and stores the value in cache.
## @param x Matrix "class".
## @param ... additional parameters to the solve function.
## @return Inverse of the matrix x.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}

