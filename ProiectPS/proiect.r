
mn <- read.table("mn.txt")
m <- mn[1]
n <- mn[2]
probxy <- cbind(read.table("prob.txt"))
probX <- probxy[1]
probY <- probxy[2]


px <- c()
for ( i in sequence(m))
  px <- fractions(c(px,fractions(eval(parse(text = probX[i,1])))))
probX <- px

py <- c()
for ( i in sequence(m))
  py <- fractions(c(py,fractions(eval(parse(text = probY[i,1])))))
probY <- py


print(probX)
print(probY)


xy <- cbind(read.table(("xy.txt")))
x <- xy[1]
y <- xy[2]

auxx <- c()
for ( i in sequence(m))
  auxx <-c(auxx,x[i,1])

auxy <- c()
for ( i in sequence(m))
  auxy <-c(auxy,y[i,1])
x <- RV(auxx,px)
y <- RV(auxy,py)


frepcomgen <- function(m,n){

}



frepcomgen(m,n)


h <- (m-1)*(n-1)

z <- jointRV(outcomes = list(1:(m-1), 1:(n-1), probs = 1:(m-1) / sum(1:(n-1)))

probs = 2 


Andv <- jointRV(outcomes = list(1:3, 0:2), probs = 1:9 / sum(1:9))
             

