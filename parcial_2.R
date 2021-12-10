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
##                    ***   Parcial 2  ***                        ##
##                                                                ##
##                                                                ##
####################################################################

library(tidyverse)
dat <- read_csv("Datos_Permanencia.csv")

# 1. Grafique la permanencia de los estudiantes graduados que ingresaron entre 2000 - 2009 y aquellos que ingresaron del 2010 al 2019 mediante un boxplot utilizando los paquetes tidy. No olvide incluir las etiquetas de los ejes y el título de la gráfica.

dd <- dat %>% 
  select(Codigo_Op,Ano_Ingreso,Condicionalidad,permanencia) %>% 
  group_by(Codigo_Op, permanencia, Ano_Ingreso, Condicionalidad) %>% 
  summarise(n = n()) %>% 
  filter(Condicionalidad == "GRADUADO") 

dd1 <- dd %>% 
  filter(Ano_Ingreso>=2000,Ano_Ingreso<2010) %>% 
  mutate(grupo = "2000-2009")

dd2 <- dd %>% 
  filter(Ano_Ingreso>=2010,Ano_Ingreso<=2019) %>% 
  mutate(grupo = "2010-2019")

ddf <- rbind(dd1, dd2)

# Para los siguientes ejercicios considere la siguiente información: Asignaturas del plan de biología

#1 semestre
"INTRODUCCION A LA BIOLOGIA"
"MATEMATICAS I"
"QUIMICA GENERAL"
"TALLER DE LENGUAJE"
"INGLES I"
"VIDA Y CULTURA UNIVERSITARIA"
#2 semestre
"MATEMATICAS II"
"CULTURA FISICA Y DEPORTIVA"
"BIOFISICA"
"BIOMOLECULAS"
"GEOFISIOGRAFIA"
"INGLES II"
#3 semestre
"BIOLOGIA CELULAR"
"METABOLISMO"
"HONGOS"
"PROTISTA"
#4 semestre
"MICROBIOLOGIA"
"METAPHYTA I"
"METAZOOA I"
"ESTADISTICA"
#5 semester
"BIOLOGIA MOLECULAR"
"METAPHYTA II"
"METAZOOA II"
#6 semestre
"FISIOLOGIA ANIMAL"
"FISIOLOGIA VEGETAL"
"ECOLOGIA"
"GENETICA"
#7 semestre
"GENETICA DE POBLACIONES"
"BIOLOGIA DEL DESARROLLO"
"SISTEMATICA"
"BIOETICA"
#8 semestre
"EVOLUCION"
"BIOLOGIA DE LA CONSERVACION"
"SEMINARIO DE INVESTIGACION"
#9 semestre
"TRABAJO DE GRADO I"
#10 semester
"TRABAJO DE GRADO II"

# 2. Realice una gráfica de barras en donde muestre en promedio cuántas veces los estudiantes de biología han visto cada materia (o recurrencia media) del plan de biología. Use los paquetes tidy para crear un data frame con la recurrencia media de cada asignatura y realice una gráfica horizontal en ggplot en la cual los valores esten ordenados de forma descendente. Además, establesca limites en el eje "y" para que los valores empiecen desde 1. Utilice nombres en los ejes y colores en las barras.

dd <- datP10 %>% 
  select(Codigo_Op, Nombre.Asignatura) %>% 
  group_by(Codigo_Op, Nombre.Asignatura) %>% 
  summarise(n = n()) %>% 
  group_by(Nombre.Asignatura) %>% 
  summarise(mean = mean(n))

dd %>% 
  mutate(Nombre.Asignatura = fct_reorder(Nombre.Asignatura, mean)) %>% 
  ggplot() +
  geom_col(aes(x = Nombre.Asignatura, y = mean, fill = Nombre.Asignatura)) +
  coord_flip(ylim = c(1, 3)) 

ddf %>% ggplot(aes(x = grupo, y = permanencia)) +
  geom_boxplot()
