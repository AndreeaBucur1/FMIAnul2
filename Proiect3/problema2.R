
densX <- function(x) dnorm(x, 0, 1)
medieContinue <- function(x) x * densX(x)
medieContinueVar <- function(x) x * x *  densX(x)
convolFuncSumXY <- function()
{
    rez <- function(z) integrate(function(x, z){densX(x) * densX(z - x)},-Inf, Inf, z)$value
    return (rez(0))
}
   
convolFuncDifXY <- function()
{
    rez <- function(z) integrate(function(x, z){densX(x) * densX(x - z)},-Inf, Inf, z)$value
    return (rez(0))
}

medieDisp <- function()
{
    medieX <- integrate(medieContinue, -Inf, Inf)$value
    cat(medieX, " ", integrate(medieContinueVar, -Inf, Inf)$value - medieX ^ 2)
}


grafic <- function()
{
  u <- seq(1:25)
  v1 <- densX(u)
  v2 <- dnorm(u, 1, 2)
  
  matplot(x = u,
          y = cbind(v1, v2),
          type = "l",
          lty = 1,
          col = c("red", "blue"),
          xlab = "Valori",
          ylab = "Densitati",
          main = "Reprezentare")
  legend(x = "topright", legend = paste(c("X", "Y")), col = c("red", "blue"), lty = 1)
}

meniu <- function()
{
  print("Bun venit pe taramul variabilelor aleatoare continue independente!")
  while(1)
  {
    optiuni <- c("Apasa 1 pentru adunare", 
                 "Apasa 2 pentru scadere",
                 "Apasa 3 pentru a afisa media, respectiv dispersia",
                 "Apasa 4 pentru reprezentarea grafica",
                 "Iesire ")
    switch(menu(optiuni)+1, cat("No Action\n"), print(convolFuncSumXY()), print(convolFuncDifXY()), medieDisp(), grafic(), break)
  }  
}

meniu()
