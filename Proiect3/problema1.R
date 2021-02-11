
#punem in px probabilitatile lui x pe care le citim din fisierul prob.txt
probX <- strsplit(readLines("prob.txt"), " ")
px <- c()
for(i in probX[[1]])
  px <- c(px, eval(parse(text = i)))
#values[[1]] va contine valorile lui x, iar values[[2]] valorile lui y
values <- c()
fisier <- readLines("xy.txt")
for(i in 1:length(fisier))
  values <- append(values, list(as.integer(unlist(strsplit(fisier[i]," ")))))

#a)
frepcomgen <- function(m, n)
{
  #Construim o matrice mat de m*n elemente si o initializam cu valoarea 0
  mat <- matrix(0, nrow = m, ncol = n)
  mat <- rbind(mat, rep(0, n))
  mat <- cbind(mat, c(px, 1))
  #ultima coloana din matrice reprezinta pi, iar ultima linie reprezinta qj
  rownames(mat) <- c(values[[1]], "qj")
  colnames(mat) <- c(values[[2]], "pi")
  matt <- mat
  
  #Pentru fiecare linie generam n-1 valori folosind functia runif
  i <- 1
  while (i <= m) 
  {
      linie <- round(runif(n-1, 0, matt[i, n+1]), 2)
      if(sum(linie) < matt[i, n+1]) 
      {
          matt[i, 1:(n-1)] <- linie
          i <- i + 1
      }
  }
  return (fractions(matt))
}


#b)
fcomplrepcom <- function()
{ 
  m <- length(values[[1]])
  n <- length(values[[2]])
  mat <- frepcomgen(m, n)
  print("Matrice in forma incompleta")
  print(mat, right = TRUE)
  
  for(i in 1:m)
    for(j in 1:n)
      if(mat[i, j] == 0)
        mat[i, j] = mat[i, n+1] - (sum(as.double(mat[i, ])) - mat[i, n+1])
  
  for(i in 1:n)
    mat[m+1, i] <- colSums(mat)[i]
  
  return (mat)
}

getInd <- function(v, elem)
{
    for(i in 1:length(v))
      if(as.integer(v[i]) == elem)
        return (i)
}

#c)
mat <- fcomplrepcom()
print(mat, right = TRUE)

py <- c()
lg0 <- length(colSums(mat)) - 1
linPy <- length(rowSums(mat))
for(i in 1:lg0)
  py <- c(py, mat[linPy, i])
  
X <- RV(values[[1]], px)
Y <- RV(values[[2]], py)
deriv_X <- 2 * X + 3
deriv_Y <- 4 * Y - 11

lg1 <- length(values[[1]])
for(i in 1:lg1)
  values[[1]][i] <- 2 * values[[1]][i] + 3

lg2 <- length(values[[2]])
for(i in 1:lg2)
  values[[2]][i] <- 4 * values[[2]][i] - 11

prodXY <- c()
valXY <- c()
for(i in 1:lg1)
  for(j in 1:lg2)
  {
      valXY <- c(valXY, values[[1]][i] * values[[2]][j])
      prodXY <- c(prodXY, mat[i, j])
  }
    
XY <- RV(valXY, prodXY)
cov_XY <- E(XY) - E(deriv_X) * E(deriv_Y)
cat("cov(2*X+3,4*Y-11) =", cov_XY)

#P(0 < X < 8 | Y > 3)
valpx <- c()
for(i in outcomes(X))
  if(i > 0 && i < 8)
    valpx <- c(valpx, i)

sumint <- 0
for(i in valpx)
  for(j in outcomes(Y))
  {
      if(j > 3)
      {
          indL <- getInd(rownames(mat), i)
          indC <- getInd(colnames(mat), j)
          sumint <- sumint + mat[indL, indC]
      }
  }
cat("Probabilitatea P(0 < X < 8 | Y > 3) =", sumint / P(Y > 3))

#P(X > 2 , Y < 7)
valpx <- c()
for(i in outcomes(X))
  if(i > 2)
    valpx <- c(valpx, i)

sumint <- 0
for(i in valpx)
  for(j in outcomes(Y))
  {
      if(j < 7)
      {
          indL <- getInd(rownames(mat), i)
          indC <- getInd(colnames(mat), j)
          sumint <- sumint + mat[indL, indC]
      }
  }

cat("Probabilitatea P(X > 2 , Y < 7) =", sumint)

#d)
fverind <- function()
{
  m <- length(rownames(mat)) - 1
  n <- length(colnames(mat)) - 1
  for(i in 1:m)
    for(j in 1:n)
      if(mat[i, j] != mat[i, n+1] * mat[m+1, j])
        return (0)
  
  return (1)
}

fvernecor <- function()
{
  prodXY <- c()
  valXY <- c()
  for(i in outcomes(X))
    for(j in outcomes(Y))
      valXY <- c(valXY, i * j)
  
  for(i in 1:lg1)
    for(j in 1:lg2)
      prodXY <- c(prodXY, mat[i, j])
  
  XY <- RV(valXY, prodXY)
  cov_XY <- E(XY) - E(X) * E(Y)
  if(cov_XY == 0)
    return (1)
  
  return (0)
}

cat("{Independenta :",fverind()," Necorelate :", fvernecor(),"}")