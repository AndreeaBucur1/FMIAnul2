

#Pentru valorile coloanei conc egale cu 12.5, stocam valorile corespunzatoare din coloana density 
varSetX <- DNase$density[DNase$conc==12.5]

#Functia mean returneaza media aritmetica a vectorului varSetX
cat("Media este :", mean(varSetX))
cat("Varianta este :", var(varSetX))

#Quartilele impart vectorul varSetX in patru parti egale
q1 <- quantile(varSetX, 1/4) #mediana din "lower half"
q2 <- quantile(varSetX, 2/4) #mediana intregului vector
q3 <- quantile(varSetX, 3/4) #mediana din "upper half"
IQR <- q3 - q1
cat("Quartilele sunt :", q1, q2, q3)
cat("Distanta intercuartilica :", IQR)

#Functia boxplot reprezinta setul de date sub forma quartilelor, la care se adauga minimul si maximul acestui set
boxplot(varSetX, col="pink")
boxplot(DNase$conc)

#Functia hist reprezinta frecventa setului de date pe diferite intervale
hist(varSetX, col="orange")
#Atributul breaks specifica latimea fiecarui dreptunghi
hist(DNase$density, breaks=23, border = "blue")

#construim graficul coloanei conc din DNase
#atributul type = "l" reprezinta modalitatea de trasare a grafului si anume cu o linie
plot(DNase$conc, type = "l", col = "red")
#adaugam vectorul varSetX in acelasi grafic
lines(varSetX,type = "l",col = "blue")
