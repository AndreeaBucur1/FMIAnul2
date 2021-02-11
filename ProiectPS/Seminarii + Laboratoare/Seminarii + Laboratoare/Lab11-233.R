#lucru cu v.a. bidimensionale folosind discreteRV
#Fie X, Y v.a. independente
library(discreteRV)
X <- RV(1:3,c(1/3,1/2,1/6))
Y <- RV(c(-1,0,1))
library(MASS)
fractions(P(X<2.5))
#P(X<2.5|Y>=-0.5)=P(X<2.5) din independenta v.a. X si Y
P(X<2.5|Y>=-0.5) #imi da o valoare gresita

#folosirea functiei rep
rep(5,2) #5 apare de 2 ori
rep(1:5,3) #se repeta vectorul 1:5 de 3 ori
rep(1:5,c(2,3,1,5,2)) # se repeta fiecare element din primul vector de atatea ori cate sunt specificate
#pe aceeasi pozitie din al doilea vector


#Pentru orice calcul de probabilitate ce implica 2 v.a. avem nevoie de repartitia lor comuna  `
XsiY <- jointRV(outcomes=list(1:3,c(-1,0,1)), probs=rep(c(1/9,1/6,1/18),rep(3,3)))
X_marginal <- marginal(XsiY,1)
Y_marginal <- marginal(XsiY,2)
fractions(P(X_marginal<2.5|Y_marginal>=-0.5)[1]) #imi da valoarea buna
#Comportament neasteptat al functiei independent(X,Y)
independent(X_marginal,Y_marginal)
independent(X,Y)


#Repartitii de v.a. in discreteRV
#Repartitia Poisson
#o functie ce calculeaza probabilitatea ca X=y pentru orice y, stiind parametrul lambda
pois.func <- function(k, lambda)
{
  return(lambda^k * exp(-lambda) / factorial(k))
}
#Y este repartizata Poisson
(Y <- RV(outcomes = c(0, Inf), probs = pois.func, lambda = 1))
P(Y>3)

#Sau: 
Y <- RV("poisson",lambda=0.5)
#V.a. conditionate
#In exemplul initial
# Alte operatii realizabile cu discreteRV X|Y=0
X_marginal|(Y_marginal==0)
#media lui X
E(X)

#dispersia
V(X)
