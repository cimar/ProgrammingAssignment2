## Put comments here that give an overall description of what your
## functions do

## This creates a "cachedMatrix" which is really a list of functions to get and set a matrix's value and inverse 

makeCacheMatrix <- function(x = matrix()) {
		m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## cacheSolve takes a list created by makeCacheMatrix and uses the setinverse function,
## defined above, and R's solve function to cache the matrix's inverse as the variable "m" i
## the makeCacheMatrix list.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
       if(!is.null(m)) {
            message("getting cached data")
            return(m)
       }
       data <- x$get()
       m <- solve(data, ...)
       x$setinverse(m)
       m
}
