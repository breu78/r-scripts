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
##            ***   Unidad 3  ***  Sesión 10   ***                ##
##                                                                ##
####################################################################  

# En esta sesión vamos explorar la regresión lineal múltiple, la colinealidad entre variables y la selección de modelos en R.

###################################################################
##                 Regresión lineal multiple                     ##
###################################################################

# En la sesión pasada, vimos como ajustabamos la ecuación de la recta para observar la relación lineal entre una variable dependiente "y" y una única varible independiente "x". En la regresión lineal múltiple, el modelo lineal puede ajustarse con más de una variable indepentiente "x".

# Cargamos nuevamente de la fundación COLTREE

setwd("~/R/Nuevo curso")
library(tidyverse)

dat_spec <- read_csv("Species_Coltree.csv")

dat_env <- read_csv("Env_Coltree.csv")

# Vamos a revisar nuevamente algunas variables ambientales que predicen mejor la riqueza de especies.

# Riqueza de especies

conteo_parcela <- dat_spec %>% 
  group_by(Parcela) %>% 
  select(N_cientifico) %>%
  unique() %>% 
  summarise(n = n())

riqueza <- conteo_parcela$n

# Observemos la relación lineal simple con algunas de las variables ambientales

summary(lm(riqueza ~ Altitud, data = dat_env))

summary(lm(riqueza ~ Temp_media, data = dat_env))

summary(lm(riqueza ~ Prec_anual , data = dat_env))

summary(lm(riqueza ~ Prec_min, data = dat_env))

summary(lm(riqueza ~ Est_Temp, data = dat_env))

summary(lm(riqueza ~ Est_Prec, data = dat_env))

# Es probable que haya una combinacion de variables (por ejemplo, la interacción entre la temperatura y la precipitación) que predice mejor la riqueza de especies. Ahora, esta vez usaremos la regresión múltiple con lm():

reg <- lm(riqueza ~ . ,data = dat_env[,c(3:10)]) # el '.' se puede remplazar listando todo los predictores, es decir, todas las demas variables independientes: reg = lm(riq ~ Altitud + Temp_media + Precip_anual + Precip_min..., data = dat_env)

summary(reg)

# Esta vez, en la regresión lineal múltiple existen menos predictores significativos, mientras que en las regresiones simples varios todos los predictores resultan significativos. Esto puede estar siendo causado por la colinealidad entre las variables independientes, es decir, que las variables predictoras deben ser independientes entre sí y no están linealmente relacionadas. Al igual que en la regresión simple, para validar nuestros resultados es necesario cumplir con los supuestos estadísticos, dentro de los cuales se incluye la no colinealidad.

###################################################################
##                         Colinealidad                          ##
###################################################################

# Es posible observar como resultado de la colinealidad, valores altos de r2 con predictores no significarivos. Podemos explorar los valores de correlación entre pares de variables para detectar posible colinealidad, sin embargo, a pesar de que dos variables tengan valores de correlación bajo, esto no asegura la no colinealidad entre ellas.

# Correlación entre pares de variables mediante la cor():

# Mediante la correlación determinamos la relación lineal entre dos variables, y a diferencia de la regresión lineal, no tiene que haber una variable dependiente y otra independiente. 

?cor

cor(dat_env$Altitud, dat_env$Temp_media)

# El coeficiente de relación "r" resultante puede variar entre -1 a 1. Mientras mas cerca este este valor a un extremo, más corelacionados estan las dos variables entre ellas, ya sea una correlación positiva (cuando una variable aumenta la igual aumenta de la igual manera), o correlación negativa (mientras que una variable disminuye la otra aumenta). Si obtenemos el cuadrado de r, podremos obtener el porcentaje de variación de una variable en relación a la varciación de la otra.

# Vamos a realizar múltiples correlaciones

cor(dat_env[,3:10])

# Múltiples gráficas de correlaciones

pairs(dat_env[,3:10])

# ¿Cuáles de los predictores climáticos están fuertemente correlacionados?

# Podemos hacer uso del Factor de Inflacion de la Varianza (VIF) para estimar cuanta varianza de un coeficiente de regresion es inflada debido a la colinearidad del modelo.

#install.packages("car")

library(car)

?vif

v <- vif(reg)
v

# Para entender los resultados de esta función debemos tener conocer como se calcula manualmente:

# Pimero debemos calcular el r2 de alguna variable frente a las demás:

rcuadrado <- summary(lm(dat_env$Altitud ~ ., data = dat_env[4:10]))$r.squared
rcuadrado

1/(1-rcuadrado)
v[1]

# VIF relaiza este proceso para cada variable independiente. En nuestro ejemplo, vemos que cuando la altura se utiliza como variable dependiente, el r2 del modelo es alto, lo que resulta en un valor de VIF cercano a 6. ¿Qué pasa entonces cuando el r2 es de 0.9?

1/(1-0.9)

# Generalmente valores de VIF de 10 indican alta colinealidad, sin embargo, valores de hasta 6 pueden reflejar una colinealidad en nuestros datos, por lo cual deberíamos seleccionar las variables con los valores de VIF más bajos.

v

fit1 <-  lm(riqueza ~ Altitud + Prec_min + Est_Prec, data = dat_env) 

summary(fit1)

# A comparación con el modelo que incluía todas las variables, aunque el r2 disminuyó, la significancia de las variables en el modelo aumentó. Para seleccionar variables que mejor se ajusten en el modelo, podemos hacer uso de otras funciones en R.

##################################################################
##                   Seleccion de modelos                       ##
##################################################################

# Podemos hacer una selección de predictores en R mediante la función step()

?step

step(reg)

# Mediante step, podemos observar el valor del criterio de akaike (AIC) de diferentes combinaciones de predictores. AIC representa la calidad relativa de un modelo estadístico, lo que nos permite hacer selección de un modelo. Usualmente se escoge aquel con el AIC más bajo.

fit2 <- lm(riqueza ~ Rango_diurno_Temp + Est_Temp + Prec_anual + Rango_anual_Temp, data = dat_env) 

summary(fit2)

##################################################################
## Ejercicio

# 1. Use la función AIC() para escoger cual de los dos modelos fit1 y fit2 es mejor en predecir la riqueza de especies

AIC(fit1, fit2)

## fin ejercicio
############################################################################


