# Caching the Inverse of a Matrix

# Cache the matrix, and calculate its inverse matrix
makeCacheMatrix <- function(x = matrix()) {
    cachedMatrix <<- x
    invertedMatrix <<- solve(x)
}

# Print the inverted matrix of x:
# **If x has been cached, print the cached matrix directly.
# **Otherwise, update the cache, calculate and print the new inverted matrix.
cacheSolve <- function(x, ...) {
    if (exists("cachedMatrix") && identical(x, cachedMatrix)) {
        message("CACHED:")
        return(invertedMatrix)
    }
    makeCacheMatrix(x)
    message("NEW:")
    invertedMatrix
}
