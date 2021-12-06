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
##                     ***   Unidad 3  ***                        ##
##                     Ejercicios y refuerzo                      ##
##                                                                ##
####################################################################

reg <- read.csv("regression.csv")
anov <- read.csv("anova.csv")

# Lea el archivo anova.csv.  Estos son los resultados de un experimento que compara la producción (en peso seco de la planta) obtenida en un control y dos tratamientos diferentes. 

# 1. Grafique los datos  en un boxplot para así poder comparar visualmente si hay o no diferencias en el peso seco. 

# 2. Realice una ANOVA y reporte la suma de los cuadrados explicando para los grupos en relación con la suma de cuadrados de los residuos. 

# 3. Calcule el valor F y utilice la prueba de Tukey post-hoc utilizando la función TukeyHSD() para evaluar si hay diferencias significativas entre las medias   
# Lea el conjunto de datos regression.csv. Estos datos son del géiser Old Faithful en el Parque Nacional de Yellowstone. La columna 1 muestra la duración de la erupción y la columna 2 el tiempo de espera entre las erupciones. 

# 1. Muestre la relación entre las dos variables en un diagrama de dispersión, y preséntelo bien ( título, etiquetas de los ejes , etc. ). 

# 2. Realice un análisis de regresión y reporte los parámetros de la línea de regresión, grafique los puntos como triángulos y la línea de regresión en color rojo. 

# 3. Informe el nivel de significancia y muestre la ecuación de regresión y el R2 en la gráfica mediante la función de text() 
  