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
##                    ***   Parcial 3  ***                        ##
##                                                                ##
##                                                                ##
####################################################################

# Para las siguientes preguntas, adjuntar el script en formato .R incluyendo las respuestas a cada pregunta y todas las gráficas en formato .pdf. O como alternativa en formato Rmd y la compilación resultante del parcial en formato .html o .pdf 

library(tidyverse)

dat_env <- read_csv("env_Paramos_Colombia.csv")
dat_pa <- read_csv("pa_Paramos_Colombia.csv")

# 1. Existe un fenómeno en Ecología llamado “the species-area relationship”, es decir áreas más grandes albergan un mayor número de especies. Ponga a prueba este fenómeno mediante un análisis de regresión lineal entre la diversidad y el área de los páramos. Reporte los resultados de su análisis utilizando una gráfica. Para que se entienda  fácilmente, describa el resultado de la prueba e interprételo; es decir, nombre los  parámetros que le permiten decir si se acepta o rechaza esta hipótesis. Discuta brevemente los alcances y limitaciones de su análisis teniendo en cuenta el origen y representatividad de los datos. 

# 2. Los puntos calientes de la biodiversidad (uno de ellos es la parte Norte de los Andes) se definen a través de su cantidad de especies endémicas y las amenazas causadas por la transformación del uso de suelo. Se ha mostrado que sitios con un mayor número de especies  de plantas endémicas albergan una mayor biodiversidad en general (en especies de fauna y flora). Aunque en nuestros datos no podemos identificar especies endémicas, podemos calcular el número de especies únicas por páramo (especies que se han registrado sólo para un complejo de páramo). Evalúe mediante una prueba estadística si el número de especies únicas es un predictor válido para la biodiversidad de los páramos de Colombia. Reporte qué tan bueno es este predictor (cuánta varianza puede explicar en la riqueza total de especies de plantas) y demuestre el resultado y su incertidumbre en una gráfica hecha con ggplot. 

# 3. Existe la hipótesis de que un hábitat con una alta heterogeneidad en sus condiciones ambientales alberga más especies que un hábitat con condiciones homogéneas, dado que permite la coexistencia de diferentes especies con diferentes adaptaciones. Evalúe esta hipótesis mediante regresiones múltiples de las variables ambientales y la diversidad de especies. Revise la colinealidad entre las variables y realice una selección del modelo más parsimonioso mediante la función step(). R reporte los resultados de manera escrita y gráfica. Discuta su resultado y los factores que pueden impactarlo. 

# 4. Realice el ejercicio anterior poniendo a prueba el rango altitudinal que abarcan como un proxy para la heterogeneidad ambiental en una regresión lineal simple. Además, realice diferentes pruebas de anova para las variables ambientales y rango altitudinal para mirar diferencias de las variables en cada cordillera. Reporte los resultados de manera escrita y gráfica y discuta sobre las diferencias en las diferentes cordilleras. 
