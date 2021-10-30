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
##            ***   Unidad 3  ***  Sesión 9   ***                 ##
##                                                                ##
####################################################################

# En esta sesión vamos a conocer los fundamentos básicos para realizar una regresión lineal y como se realiza en R.

###################################################################
##                  Regresión lineal                             ##
###################################################################

# Mediante la regresión lineal, podemos predecir el valor de una variable depentiente "x" en función de una variable independiente "x" mediante la ecuación de la recta (yi=α+β*xi+ϵi). Además, la regresión lineal nos sirve como análisis exploratorio para observar si dos o mas variables se relacionan linealmente (si x cambia entonces y también cambiará en una magnitud similar)

# A diferencia de la Anova, nuestra variable independiente "x" es usualmente una variable contínua y no una variable categórica, pero su notación es la misma:

lm(y ~ x) # Como vimos anteriormente, utilizamos la función lm (linear regression)

# Vamos a crear datos para realizar una regesión lineal simple. Para esto, debemos crear 3 componentes: respuesta (y) = deterministico (x) + estocástico (error). 

# Creamos la variable deterministica, es decir, datos definidos lls cuales conocemos (30 valores aleatorios entre 15 y 150)

x <- runif(30,50,150)
x

# Creamos la variable de respuesta

y.pred <- 20 + 2 * x

# Cuando trabajamos con datos reales, no es necesario establecer el componente estocástico o el error ya que R lo calcula por si mismo (este error esta asociado a la naturaleza de los datos y su ajuste a una distribcuón como vimos en sesiones anteriores). Sin embargo, en este ejemplo los datos se ajustan perfertamente a una recta:

plot(x, y.pred, pch = 19)

summary(lm(y.pred ~ x)) # Obtenemos un R2 de 1 (ajuste perfecto), valor de p significativo (vemos que tiene 3 asteríscos indicando un alto nivel de significancia)

# Ahora añadimos el componente estocástico (ruido) a la variable respuesta:

y <- y.pred + rnorm(30,0,30)

# Observamos mediante un gráfico como se relacionan ahora nuestras variables

plot(y ~ x, pch = 19)

summary(lm(y ~ x)) # Ahora el ajuste de la regresión es menor debido al ruido (r2 = 0.7914)

###################################################################
##                  Regresión a mano                             ##
###################################################################

# Al igual que la Anova, podemos calcular los parámetros de la regresión a mano mediante el método de la suma de cuadrados y la información del promedio de los datos.

# Recordemos que hacemos uso de la ecuación de la recta = yi=α+β*xi+ϵi, en los que debemos calcular algunos parámetros con el método de la suma de cuadrados. En esta ecuación se nos presentan varios componentes:

# yi o la variable respuesta

# α o intercepto, el cual es el valor de y cuando x = 0

# β o pendiente (el valor de p que obtenemos nos dice si la pendiente es significativa o no)

# xi o variable predictora

# ϵi o el error. Todos los modelos estadísticos tienen una varianza residual de información observada no tenida en cuenta en nuestros predictores y está direcamente relacionada con la variable respuesta a través de una distribución (típicamente una distribución normal). Para tener un mejor ajuste de nuestro modelo, debemos entender como se genero nuestra variable dependiente. De esta manera, nos aseguramos de escoger una distribución que describa nuestros datos y que capture el error residual correctamente

# Vamos a calcular la suma de cuadrados de nuestros datos

SSY <- sum((y - mean(y))^2) # sumas de cuadrados corregidas en y

SSX <- sum((x - mean(x))^2) # sumas de cuadrados corregidas en x

SSXY <- sum((x - mean(x)) * (y - mean(y))) # suma corregida de productos (covarianza de x e y en la expectativa)

# Pendiente

b <- SSXY/SSX # máxima probabilidad de pendiente b
b

# Intercepto

a <- mean(y) - b * mean(x) # Usamos la ecuación y valores promedio para calcular el intercepto 
a

# Comprobamos

summary(lm(y ~ x))

# De esta forma hemos calculado los parámetros que desconociamos en la ecuación de la recta. De esta forma tenemos lo siguiente:

y = α + β*x # Esto significa que cuando x = 0, "y" es igual al valor en α, y la variable respuesta "y" aumenta β por cada unidad en x

# Si queremos predecir el valor de y cuando x = 100 utilizando nuestra ecuación:

y.result <-  a + b*100

##################################################################
## Ejercicio

# 1) Utilizando los siguientes datos calcule el intercepto y la pendiente a mano mediante la suma de cuadrados:

x <- runif(20, 1, 20)
y.pred <- 20 + 2 * x
y <- y.pred + + rnorm(20,0,5)

# 2) Realice una interpretación de los valores de la pentiente e intercepto teniendo en cuenta la siguiente información: Asuma que la variable "y" son datos del peso de roedores y que la variable "x" es información del tamaño de estos roedores

# 3) Utilice la función de R para realizar la regresión lineal e interprete el valor de R2 y valor de p
 
## fin ejercicio
############################################################################

###################################################################
##          Indices de diversidad y regresión lineal             ##
###################################################################

# Ahora que conocemos como realizar una regresión lineal, vamos a utilizar los datos de la fundación COLTREE para explorar algunos índices que miden la biodiversidad y reaizar regresiones lineales con estos resultados.

# En adición al set de datos taxonómicos, trabajaremos con datos medioambientales de cada parcela

# Cargamos los datos

library(tidyverse)

setwd("~/R/Nuevo curso")

dat_spec <- read_csv("Species_Coltree.csv")

dat_env <- read_csv("Env_Coltree.csv")

#Algunas de las principales variables medioambientales

# Temp_media = Temperatura media anual
# Rango_diurno = Rango diurno promedio
# Est_T = Estacionalidad de la temperatura
# MaxTemp = Temperatura maxima del mes mas calido
# MinTemp = Temperatura minima del mes mas frio
# Rango_anual_T = Rango anual de temperatura
# T_media_tmh = Temperatura media del trimestre mas humedo
# T_media_tms = Temperatura media del trimestre mas seco
# T_media_tmc = Temperatura media del trimestre mas calido
# T_media_tmf = Temperatura media del trimestre mas frio
# Precip_anual = Precipitacion anual
# Precip_max = Precipitacion del mes mas humedo
# Precip_min = Precipitacion del mes mas seco
# Est_P = Estacionalidad de la precipitacion (Coeficiente de Variacion)

# Para calcular la riqueza de especies (diversidad), debemos contar el número de especies presentes en cada sitio (parcela en nuestro caso)

conteo_parcela <- dat_spec %>% 
  group_by(Parcela) %>% 
  select(N_cientifico) %>%
  unique() %>% 
  summarise(n = n())

barplot(conteo_parcela$n)

riqueza <- conteo_parcela$n

# En caso de contar con una matriz de abundancias, podemos convertir la matriz una matriz de presencia/ausencia y contar el número de especies; o utilizar el paquete vegan:

# Convertimos nuestros datos a una matriz de abundancias:

dat_abun <- dat_spec %>% 
  select(Parcela, N_cientifico) %>% #Seleccionamos las variables deseadas
  group_by(Parcela, N_cientifico) %>% # Agrupamos las observaciones por parcela y nombre de las especies
  summarise(freq = n()) %>% # contamos el número de individuos para obtener la abundancia de cada especie
  pivot_wider(names_from = N_cientifico, values_from = freq) # Mediante la función pivot_wider, convertimos la variable N_cientifico en columnas, y el conteo en observaciones a través de cada parcela. Para mayor información revise la función

# Reemplazamos los NA por 0

dat_abun <- dat_abun %>%
  replace(is.na(dat_abun), 0) 

dat_abun <- dat_abun[,-1] #Eliminamos la variable del código de la parcela

str(dat_abun) # Revisamos la matriz de abundancia creada

# 1) Contar especies con una matriz de presencia/ausencia

p_a <- replace(dat_abun, dat_abun > 0, 1) # Convertimos la matriz de abundancias en una matriz de presencia/ausencia.

riqueza <- apply(p_a, 1, sum) # Sumamos las especies presentes en cada parcela para estimar su riqueza.

barplot(riqueza)

# 2) Paquete vegan

#install.packages("vegan")

library(vegan)

riqueza <- specnumber(dat_abun)

barplot(riqueza)

# A partir de la matriz de abundacias, podemos calcular índices de diversidad como shannon o simpson mediante la función diversity() del paquete vegan. Utilice la función diversity() para calcular el indice de shannon.

div <- diversity(dat_abun, index = "shannon")

# Ahora Vamos a relacionar la riqueza de especies (o diversidad) con algunos de los factores ambientales de las parcelas.

# Riqueza ~ T_media

reg <- lm(riqueza ~ dat_env$Temp_media) # Ajustamos un modelo con la riqueza de especies y la temperatura media

reg

abline(reg, col = "red")

summary(reg)

# Con base a los resultados de la regresión lineal, reponda las siguientes preguntas: 1) ¿La riqueza de especies depende de la temperatura? 2) ¿Cuál resultado de la regresion demuestra eso? y 3) ¿Cuánta varianza explica la temperatura en la variación de la riqueza de especies?

# Por favor agregue etiquetas a los ejes de la gráfica anterior e inserte una leyenda con el valor de R^2 y la ecuación de la línea de regresión. 

# Riqueza ~ Precip_anual

reg_2 <- lm(riqueza ~ dat_env$Precip_anual) 

reg_2

abline(reg_2, col = "red")

summary(reg_2)

##################################################################
## Ejercicio

# 1. Realiza regresiones con las otras variables ambientales y determina
# cuales de ellas pueden explicar la variabilidad en riqueza a traves del
# gradiente altitudinal.

# 2. Repite el mismo analisis pero ahora con el Indice de Shannon como variable
# independiente. Los resultados son congruentes?

# 3. Muestra los resultados de todos estos analisis en graficas de dispersion
# con la linea de tendencia y la legenda.

## fin ejercicio
############################################################################

###################################################################
##             Supuestos de la regresión lineal                  ##
###################################################################

# Para poder validar los resultados de nuestra regresión lineal, debemos saber si nuestro modelo cumple con los supuestos o requisitos asociados al modelo:

# 1) Linealidad: Debido a que la ecuación de la recta que se emplea en la regresión lineal, la relación entre las variables dependientes e independientes debe ser lineal. Esto puede ser observado fácilmente mediante el diagrama de dispersión:

plot(riqueza ~ dat_env$Temp_media) 
lm <- lm(riqueza ~ dat_env$Temp_media)
abline(lm) 

# Podemos observar que es probable que los datos no se relacionan linealmente y ajustar una relación lineal podría resultar en resultados erroneos

# 2) Independencia de los residuos: Los residuos deben ser independientes entre sí y representan una variable aleatoria, es decir, que la predicción de un valor los residuos no es afectada por los residuos cercanos. Podemos probar este supuesto mediante el test de durbin-watson:

library(lmtest)

dwtest(lm) # En esta prueba, valores de DW alrededor de 2 y p significativos significan que los residuos son independientes (normalmente se considenran valores entre 1.5 y 2.5)

# 3) Residuos constantes "homocedasticidad": Los residuos (diferencia entre los valores observados de la variable dependiente respecto a los valores predecidos mediante la ecuación de la recta) deben ser constantes. Esto quiere decir que los residuos no aumentan ni disminuyen a medida que se predicen valores más grandes o pequeños. Podemos observar este supuesto graficando nuestro vector de regresión lineal:

plot(lm) # Al graficar esto presionamos enter en la consola y debemos observar la primera gráfica "Residual vs Fitted". Al haber homocedasticidad, la linea roja debe observarse como una linea recta. Con nuestros datos parece complirse este supuesto.

# 4) Normalidad de residuos: Los residuos deben presentan una distribución normal. Mediante la gráfica de histograma y la prueba de shaphiro-wilk podemos probar este supuesto:

hist(lm$residuals, 15) # Los resoduos parecen ajustarse a una distribución normal

?shapiro.test

shapiro.test(lm$residuals) # Con el valor de p de la prueba, aceptamos la hipótesis nula ya que p > 0.05, por lo que los residuos si presentan una distribución normal
