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
##            ***   Unidad 1  ***  Sesión 4   ***                 ##
##                     Ejercicios y refuerzo                      ##
##                                                                ##
####################################################################

dat_env <- read.csv("env_Paramos_Colombia.csv")
dat_pa <- read.csv("pa_Paramos_Colombia.csv")

####################################################################
##                           Sesión 1                             ##
####################################################################

# 1. Genere muy eficientemente estos 3 vectores

# a) 1 2 3 4 5 6 7 8 9 10 10 9 8 7 6 5 4 3 2 1

A = c(1:10,10:1)
A

# b) 0.00 0.15 0.30 0.45 0.60 0.75 0.90 1.05 1.20 1.35 1.50

B = seq(from=0, to=1.5, by=0.15); B 

# c) A A A 1 1 1 B B B X X X 2 2 2 C C C 3 3 3

C= c("A",1,"B","X",2,"C",3); rep(C, each = 3)

# 2. Extraiga de cada vector el tercer elemento y ubíquelo en la primera, segunda y tercera posición de un nuevo vector vacío. ¿Cuál es el modo del nuevo vector y por qué?

D = numeric(5)
D[1:3] <- c(A[3],B[3],C[3])
mode(D)

# 3. Cree un nuevo objeto que contenga los mismos elementos del vector anterior.

Z <- D

####################################################################
##                           Sesión 2                             ##
####################################################################

# 1. Haga una carita (:|)

plot(0, 0, xlim = c(-2, 2), ylim = c(-2, 2), cex = 40)
points(c(-0.5, 0.5), c(0.4, 0.4), cex = 5)
points(0, 0, pch = 2, cex = 4)
lines(c(-0.5, 0.5), c(-0.7, -0.7))

# 2. Realice una gráficas de barras de la variable de área de los datos dat_env en donde las barras esten de forma horizontal y tengan un espaciado de 2 entre ellas. Agregue nombres en los ejes

barplot(dat_env$AREA_KM2, horiz = TRUE, space = 2)

# 3. Realice una gráfica de cajas de la isotermalidad con colores diferentes para cada caja

boxplot(Isother ~ Cordillera, data = dat_env, col = colors()[c(100,200,300,400,500)])

# 4. Haga una gráfica de dispersión entre los datos temperatura anual y altura máxima en donde haya 5 tamaños diferentes de puntos, y 25 formas diferentes de puntos

plot(dat_env$Temp_ann ~ dat_env$Alt_max, cex = seq(from= 1, to= 5), pch = 1:20)

# 5. Realice un gráfico compuesto de las 3 gráficas anteriores mediante par()

####################################################################
##                           Sesión 3                             ##
####################################################################

# 1. Averigüe los nombres únicos de las cordilleras y elimine las que cuentan con menos de 3 observaciones

# 2. Mediante which() encuentre los complejos que poseen alturas máximas mayores a 5000

# 3. Halle la media de la temperatura anual y la isothermalidad  de cada cordillera

# 4. Utilice la funcion cut() para crear 3 rangos de estacionalidad de la precipitación.

# 5. Realice las siguientes gráficas:

# a) Un histograma del área en km2 de cada rango creado con cut
# b) Una gráfica de cajas de la precipitación anual de cada rango creado con cut
# c) Una gráfica de barras del número de complejos presente en cada rango creado con cut

