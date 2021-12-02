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
##            ***   Unidad 1  ***  Sesión 9   ***                 ##
##                     Ejercicios y refuerzo                      ##
##                                                                ##
####################################################################

library(tidyverse)

dat_env <- read_csv("env_Paramos_Colombia.csv")

####################################################################
##                           Sesión 4                             ##
####################################################################

# 1. Cree un data frame en el cual agrupe las observaciones por la variable Cordillera y calcule el número de observaciones, valor promedio y mediana de su área en cada uno. Ademas cree un subconjunto de los datos para cada observación en el mismo data frame

ejercicio <- dat_env %>% 
  group_by(Cordillera) %>% 
  summarise(data = list(cur_data_all()), n = n(), mean = mean(AREA_KM2), median = median(AREA_KM2))

# 1. Utilice summarise y filter para averiguar cual es la familia con mayor registro de especies

mayor <- dat %>% 
  group_by(family) %>% 
  summarise(n = n()) %>% 
  filter(n == max(n))

# 2. Averigue cual es la elevacion maxima a la que fue registrada una planta y un animal

max_ele <- mayor <- dat_env %>% 
  group_by(Cordillera) %>% 
  mutate(Temp = max(Temp_ann), Prec = max(Precp_ann)) %>% 
  filter(Temp == Temp_ann, Prec == Precp_ann)

# 3. Averigüe cual es el , pero mantentga las demas columnas del data frame para visuales que especies se cuentran a esta altura

# Pista: use la funcion mutate, ungroup y filter para mantener todas las columnas

?ungroup

max_ele <- mayor <- dat %>% 
  group_by(kingdom) %>% 
  mutate(max = max(elevation)) %>% 
  ungroup() %>% 
  filter(max == elevation)