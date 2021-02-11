#Lucru cu pachetul prob
# tosscoin(), rolldie(), cards()
moneda3 <- tosscoin(3)
moneda3$toss3
moneda3[2:3,1:2]
moneda3[-7,-2]
#sau
moneda3[-7,c(1,3)]

#Filtrare intr-un dataframe
#Caut T in tot dataframe-ul si numar de cate ori apare
length(moneda3[moneda3=='T'])
#Caut liniile din dataframe pentru care am cel putin o aparitie T
#ASA NU (nu confundati rowsum cu rowSums)
#rowsum(moneda3=='T')
#ASA DA
sum(rowSums(moneda3=='T')>0)

#Returneaza un dataframe de valori boolene
moneda3=="T"

#Se arunca o moneda de 5 ori si se cere probabilitatea ca din cele 5 aruncari
#cel putin 3 sa fie "H"
#Solutie Giuliano Dumitru
m5 <- tosscoin(5)
probi <- sum(rowSums(m5 == 'H') > 2)/nrow(m5)
rowSums(moneda3)

#Functiile cbind si rbind
a <- 1:3
b <- 4:6
m1 <- cbind(a,b) #imbinare de vectori pe coloane
m2 <- rbind(a,b) #imbinare de vectori pe linii
cbind(m1,7:9)
rbind(m1,13:14)

rowSums(m1) # face sume pe linii

rowSums(m1>3)

# TEMA: Sa se calculeze probabilitatea ca din 7 aruncari sa apara secventa HH
#varianta pentru 3 aruncari
omega3 <- tosscoin(3)
# omega3[,1]  echivalenta omega3$toss1
probTT31 <- (sum((omega3[,1] == 'H') & (omega3[,2] == 'H')) + sum((omega3[,2] == 'H') & (omega3[,3] == 'H')))/ nrow(omega3)


#rolldie -aruncarea cu zarul
rolldie(2)
rolldie(2,7)# pe pozitia a doua dam numarul de fete al zarului
#Tema:
1) Calculati probabilitatea ca aruncand 2 zaruri sa obtinem:
  a)aceeasi valoare
  b)doua numere pare
  c)doua numere prime
  d)un numar par si unul impar
2) Calculati probabilitatea ca aruncand 3 zaruri sa obtinem:
   a) suma >10
   b) suma divizibila cu 4
   c) suma cuprinsa intre 8 si 23
   d) o dubla

#cards() -pachetul cu 52 de carti
cards()
#pentru jokeri folosim atributul jokers=T
cards(jokers=T)

3) Calculati probabilitatea ca extragand o carte dintr-un pachet cu 52 de carti sa obtinem:
a) O carte de inima sau de romb
b) O carte de valoare mai mica decat 10
c) O carte de tip As
d) O dama de romb sau un valet de pica

#Functii in R

f <- function()
{
  #optional return()
}

#Functia returneaza prin numele sau ultima prelucrare realizata (lucru foarte util in lucru cu expresii matematice)

f1 <- function(x)
{
  sqrt(x)+2*x
}
#Intoarce 10

f1(4)

f11 <- function(x)
{
  x <- sqrt(x)+2*x
}
# DE INVESTIGAT de ce se intampla asta!
f11(4)
#Nu intoarce nimic dar in cazul atribuirii intoarce 10
y <- f11(4)

f2 <- function(x)
{
  x^3
}

#Integram folosind functia integrate
a <- integrate(f2,0,1)
#Extrag doar valoarea integralei din a
a$value

a1 <- integrate(f2,0,1)$value

integrala <- function(f,a,b)
{
  x <- integrate(f,a,b)$value
  return(x)
}
integrala(f2,-1,1)


#Variabile aleatoare (discrete) NEXT TIME