## R Programming - Assignment 2 - 2015/06/21
## makeCachMatrix -- This function creates a special "matrix" object that can cache its inverse.
## cacheSolve -- This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not 
## changed), then the cachesolve will retrieve the inverse from the cache using the solve() 
## function. For this assignment, we will assume that the matrix supplied is always invertitble.
## LET'S DO THIS!!

makeCacheMatrix <- function(x = numeric()) { ## make a function that stores a list of functions
        cache <- NULL
        setMatrix <- function(newValue) { ## first function stores a matrix
                x <<- newValue ## the matrix is assigned a value with the newValue argument
                cache <<- NULL ## because you store a matrix w/ a new value you flush the cache 
                ## w/ NULL
        }
        
        ## returns the stored matrix
        getMatrix <- function() { ## self-descriptive. this function returns the stored matrix
                ## that we assigned a value to with 'newValue' argument
                x
        }
        
        ## cache the given argument 
        cacheInverse <- function(solve) { # this function cache's the 'newValue' from above
                cache <<- solve
        }
        
        getInverse <- function() { ## this function simply gets the cached value we just previously
                ## cached
                cache
        }
        
        ## now we assign the list of function we created to our original list of functions 
        ## we created
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

cacheSolve <- function(y, ...) { ## this function calculates the inverse of a special "matrix" 
        ## object that can cache it's inverse (as requested in the assignment)
        ## get the cached value
        inverse <- y$getInverse()
        if(!is.null(inverse)) { ## if a cached value exists, then we do not calculate the inverse
                ## and return the cache
                message("getting cached data")
                return(inverse)
        }
        
        data <- y$getMatrix() ## if there is nothing in the cache, this funct
        inverse <- solve(data)
        y$cacheInverse(inverse) ## if there is nothing in the cache, this will get the matrix
        ## calculate the inverse of it and store it in the cache
        
        inverse ## finish off the function by returning the inverse
}
## YEAH! 