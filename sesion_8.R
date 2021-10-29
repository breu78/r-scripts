####################################################################
##                                                                ##
##  Análisis de datos utilizando el lenguaje de programación R:   ##
##  una experiencia de aprendizaje virtual en el aula invertida   ##
##                                                                ##
##                 Proyecto INNOVA-TIC 2021                       ##
##                                                                ##
## Creado por:     Björn Reu (breu@uis.edu.co )                   ##
##                 Yovanny Duran Barajas                          ##
##                 Zarith Tatiana Villamizar                      ##
##                 Silvia Fernanda Ardila Hurtado                 ## 
##                 Sergio Andres Bolivar-Santamaria               ##
##                                                                ##
##  con el apoyo de la Vicerrectoría Académica,                   ##
##  Universidad Industrial de Santander                           ##
##                                                                ##
####################################################################
##                                                                ##
##            ***   Unidad 2  ***  Sesión 2   ***                 ##
##                                                                ##
####################################################################

# En esta sesión vamos a aprender a realizar el test de análisis de varianza o ANOVA. Mediante esta prueba, se busca encontrar si hay diferencias significativas entre las medias de dos grupos. Para poder calcularla, se tendrán en cuenta dos tipos de varianza: 1) La varianza entre grupos (los valores promedio de cada grupo se comparan con la media total de los datos); y la varianza dentro del grupo (la varianza de cada dato en un grupo con el promedio dentro del mismo grupo).

# Vamos a aprender primero como realizar la anova a mano paso a paso y luego utilizaremos la función de ANOVA en R.

###################################################################
##                  Anova a mano                                 ##
###################################################################

# Vamos a generar nuestros datos para hacer una Anova a mano. Supongamos que estamos experimentando con un tratamiento que permita a las plantulas de una planta crecer más rápido. Para esto tendremos dos grupos de plantas de una misma especie, unas a las que se les provea un compuesto "z" el cuál debería acelerar el crecimiento y otros a los que no. Llamaremos al grupo con el tratamiento "z" g1 y el otro grupo g2.

#Generamos datos aleatorios del crecimiento de las plantas, la cual es nuestra variable dependiente

g1 <- rnorm(30, mean=10, sd=2) # 30 observaciones (replicas) en donde el crecimiento en promedio es 10, el doble de lo normal

g2 <- rnorm(30, mean=5, sd=2) # 30 observaciones (replicas) en donde el crecimiento en promedio es 5, en ambas grupos la variacion en el crecimiento de cada grupo es lo mismo, con sd=2

y <- c(g1, g2) # Los concatenamos en un mismo vector

x <- rep(c(1, 2), each = 30) # Creamos la variable de nuestros grupos o variable independiente, el 1 corresponde a las plantulas de g1 y el 2 a los de g2

plot(y)

plot(x, y) # En este punto parecen haber diferencia entre el crecimiento del grupo 1 y 2

# Ahora empezamos a realizar una ANOVA paso a paso. Para esto, hallaremos la suma de cuadrados y los grados de libertad, pues esto es igual a la varianza

# Obtenemos los promedios de cada agrupo y el total, los cuales necesitaremos para hallar la suma de los residuales al cuadrado (suma total de la distancia entre cada observación con la media elevada al cuadrado)

tot.mean <- mean(y) # Obtenemos el promedio de todas la observaciones

# en la grafica: 
plot(y, pch=19, col="grey", cex=0.5) 
abline(tot.mean, 0, col="grey") 
?abline
# a = intercepto, b = pendiente, para una linea horizontal la pendiente (slope) = 0

g1.mean <- mean(g1)
g2.mean <- mean(g2) 

lines(c(0, 30), c(g1.mean, g1.mean) , col = "red") # media del grupo 1
lines(c(30, 60), c(g2.mean, g2.mean) , col = "green") # media del grupo 2

# Calculamos la suma de cuadrados de los residuos, los cuales se dividen en suma de cuadrados totales (SST); el error de la suma de cuadrados (SSE), que se refiere a la varianza dentro de cada grupo que no se puede explicar; y la suma de cuadrados del tratamiento (SSA) o varianza entre grupos

# Suma de cuadrados total: SST = SSE + SSA

SST <- sum((y - tot.mean) ^2) #Hallamos el SST sumando la resta entre la media de todos los datos con cada observación elevada al cuadrado

# Suma de cuadrados residual

SSE.g1 <- sum((g1 - g1.mean) ^2) # Realizamos el mismo paso para calcular el SST pero con el subconjunto de datos de cada grupo

SSE.g2 <- sum((g2 - g2.mean) ^2)

SSE <- SSE.g1 + SSE.g2 #sumamos los SSE de cada grupo

# SSA

SSA <- SST - SSE 

#### En la grafica 
# se dibuja los residuos en vez de los sumas de los cuadrados:

segments(1:60, tot.mean, 1:60, y, col="lightgrey")
segments(1:30, g1.mean, 1:30, g1, col="red")
segments(31:60, g2.mean, 31:60, g2, col="green")



# A partir de acá, vamos a calcular el estadístico F, el promedio de los cuadrados (MSA Y MSE), los grados de libertad y el valor de p (valor de significancia) para determinar si nuestros grupos son estadísticamente diferentes

# MSA = SSA/k-1(grados de libertad)

MSA <- SSA/1 #siendo k igual al número de grupos, que en nuestro caso es 2

# MSE = SSE/k(n-1) (grados de libertad)

MSE <- SSE/58 #en este caso, n es igual a 30 o número de observaciones por grupo

# Estadístico F

Fval <- MSA/MSE 
Fval  

# Valor de significancia pf = qf(Fval, k-1, k(n-1))

sig <- 1-pf(Fval, 1, 58)
sig

# Usualmente, valores pequeños de p provienen de valores de F grandes, y estos a su vez sugieren una varianza mas grande entre grupos que dentro de cada grupo. En nuestro experimento, se puede concluir que la sustancia "z" está teniendo afectando el crecimiento de las plántulas de manera positiva.

# Finalmente, podemos usar el R2 para determinar cuanta varianza en nuestros datos (y) está siendo explicada por la variable independiente (x)

R2 = 1 - (SSE/SST)
R2 # es la varianza que puede ser explicada por las diferencias en las medias

# Felicitaciones, hizo una ANOVA por usted mismo(a), paso a paso. De ahora en adelante, puede usar las funciones de R!

##################################################################
## Ejercicio

# 1) Cree tres vectores de datos aleatorios, cada uno de 40 observaciones que se diferencien por sus valores medias: entre g1 y g2 por un valor de 2y entre g2 y g3 de un valor de 5, las cuales vienen de una distribcuón normal con una sd=2. Finalmente concatene ambos vectores

# 2) Cree un vector "y" en el cuál se repitan tres letras (A,B,C), cada una igual al número de observaciones de cada vector creado en el punto 1

# 3) Realice una anova con los vectores creados anteriormente e identifique si la varianza entre las grupos es significativamente diferente 

## fin ejercicio
############################################################################

###################################################################
##                  Anova con funciones de R                     ##
###################################################################

# En R, usamos la función aov() para hacer una anova rápidamente

?aov()

aov(y ~ x)

# Si quieremos ver el valor de F y el valor de p, utilizamos la función summary

summary(aov(y ~ x)) 

# Vemos que el valor de F es igual al que calculamos anteriormente, y también el valor de p (Pr(>F)) es significativo y recahzamos la hipótesis nula H0. 

# Hasta este punto, hemos realizado un anova de una vía, ya que solo determinamos el efecto de una sola variable independiente, lo que es igual a realizar una regresión lineal simple, ya que Anova es un método que ocurre dentro del modelo de la regresión lineal.

summary(lm(y ~ x))

###################################################################
##                  Anova con datos reales                       ##
###################################################################

library(tidyverse)

setwd("~/R/Nuevo curso")

# En esta sección vamos a explorar el análisis de anova con un set de datos que contiene información taxonómica de especies vegetales, abundancia e información del diametro promedio de cada especie colectada en diferentes parcelas. Estos datos hacen parte de la fundación COLTREE, la cual se dedica al monitoreo de parcelas permanentes de vegetacion a nivel nacional, con el proposito de comprender el funcionamiento de los bosques en terminos de su productividad vegetal y su relacion con el ciclo del carbono. 

dat <- read_csv("Species_Coltree.csv")

# Utilizando la función de Anova en R, vamos a evaluar si existen diferencias en el diametro entre los géneros de plantas de una misma familia. En este ejemplo, vamos a trabajar con mas de dos grupos ya que es más frecuente utilizar otra prueba (T-Test) para comparar solo dos grupos.

# Escogemos la familia Anacardiaceae

familia <- dat %>% 
  filter(N_Familia == "ANACARDIACEAE")

# Visualizamos las medias de los géneros

familia %>% 
  ggplot(aes(x = Genero, y = DAP)) +
  geom_boxplot()

# Realizamos la Anova

anova <- aov(familia$DAP ~ familia$Genero)

summary(anova)

# En este ejemplo, vemos que tenemos un valor de F bajo, y un valor de p>0.05, por lo que concluimos que el diametro entre los géneros de esta familia no difieren entré si significativamente. Sin embargo, con summary no obtenemos información sobre cuáles grupos se están diferenciando o no. Para esto, hacemos uso de una prueba post-hoc o "Tukey's Honest Significant Differences" (HSD) para ayudarnos a cuantificar cuales grupos difieren entre ellos.

?TukeyHSD()

TukeyHSD(anova)

# Podemos ver un valor de p asociado a la interacción entre grupos. Vemos que los géneros que más difieren son Tapirira y Astronium, sin embargo las medias no son significativamente diferente

##################################################################
## Ejercicio

# Realice una Anova para evaluar si existen diferencias en el diametro entre las familias de dos parcelas diferentes y realice una prueba post hoc

## fin ejercicio
############################################################################
