
fgenerare <- function()
{   n <- as.numeric(readLines("n.txt"))
    nr <- 0
    x <- c()
    found <- 0
    while( found == 0 & nr <=3)
    {   nr <- nr + 1
        sec  <- as.numeric(format(Sys.time(), "%S"))
        min  <- as.numeric(format(Sys.time(), "%M"))
        hour <- as.numeric(format(Sys.time(), "%H"))
        t1 <- min * 100 + sec
        if(t1%%12 == 0)
        {   x[1] <- rnorm(1,min,sec)
            found <- 1
        }
        else if(t1%%12 == 1)
        {   y1 <- runif(1,0,1)
            x[1] <- rpois(1,min) + y1
            found <- 1
        }
        else if(t1%%12 == 5)
        {
            x[1] <- rexp(1,hour)
            found <- 1
        }
        else if(t1%%12 == 7)
        {   y1 <- runif(1,0,5)
            x[1] <- rbinom(1,hour,1/min) + y1
            found <- 1
        }
        else if(t1%%12 == 8)
        {   x[1] <- runif(1,5,12)
            found <- 1
        }
        else if (t1%%12 == 9)
        {   y1 <- rhyper(1,2,3,4)
            x[1] <- rgamma(1,2) - y1
            found <- 1
        }
      }
      if(found == 0)
          x[1] <- rnorm(1,0,1)
      a = rexp(1,2); b = rnorm(1,5,1)
      for(i in 2:n)
        x[i] <- a * x[i-1] + b
      hist(x,col = "blue")
      return (x)
}

fgenerare()
