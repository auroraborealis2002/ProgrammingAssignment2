# Caching the Inverse of a Matrix

# Generate a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(cachedMatrix = matrix()) {
    invertedMatrix <<- NULL
    set <- function(y) {
        cachedMatrix <<- y
        invertedMatrix <<- NULL
    }
    get <- function() cachedMatrix
    setInvert <- function(input) invertedMatrix <<- input
    getInvert <- function() invertedMatrix
    list(set = set, get = get, setInvert = setInvert, getInvert = getInvert)
}

# Print the inverted matrix of x:
# **If x has been cached, print the cached matrix directly.
# **Otherwise, calculate, cache and print the new inverted matrix.
cacheSolve <- function(x, ...) {
    inverted <- x$getInvert()
    if (!is.null(inverted)) {
        message("CACHED:")
        return(invertedMatrix)
    }
    data <- x$get()
    calcInvert <- solve(data)
    x$setInvert(calcInvert)
    message("NEW:")
    calcInvert
}

# Example:
# > mymat <- makeCacheMatrix(matrix(c(1,7,9,4,6,2,8,11,3), 3, 3))
# > cacheSolve(mymat)
# > cacheSolve(mymat)
# When a new matrix has been set
# > mymat$set(matrix(c(19,7,9,4), 2, 2))
# > cacheSolve(mymat)
# > cacheSolve(mymat)
