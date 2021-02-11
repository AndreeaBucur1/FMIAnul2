#Lucru cu discreteRV
library(discreteRV)
X <- RV(c(-3,8,9))
X1 <- RV(c(-3,8,9),c(1/4,1/2,1/4))
X2 <- RV(1:20)
a <- probs(X2)
#Accesez prima probabilitate IMPREUNA CU atributul sau numeric
a[1]
#Accesez prima probabilitate FARA atributul sau numeric
a[[1]]
#Pentru a accesa doar atributul numeric
#TEMA

#Calculul unor probabilitati
#P(X=3)
P(X==3)

#P(X=-3)
P(X==-3)
#Pentru a vizualiza fractiile sunt forma unei fractii ireductibile folosim functia
#fractions() din pachetul MASS
library(MASS)
fractions(P(X==-3))

#P(X<5)
P(X<5)

#P(X<=8)
P(X<=8)

#Probabilitati conditionate
P(X>2|X<9)
#Sa verificam P(X>2|X<9)=P(X>2 si X<9)/P(X<9)
#P(X>2 si X<9)
P((X>2)%AND%(X<9))

#P(X>2 sau X<9)
P((X>2)%OR%(X<9))

#ATENTIE la un comportament aparent bizar!
fractions(P(X<5))
fractions(P(X<5|X>-4))
#TO DO !!!
