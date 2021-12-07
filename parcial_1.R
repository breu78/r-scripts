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
##                    ***   Parcial 1  ***                        ##
##                                                                ##
##                                                                ##
####################################################################

dat <- read.csv("Datos_Permanencia.csv")

# Para el primer parcial, vamos a trabajar con un set de datos que contiene información académica de los estudiantes de Biología que han ingresado desde el año 2000 en adelante

# 1. Muestre en una gráfica de barras las diferentes condicionalidades de los años 2006,2008,2010,2015. Elabore un "stacked barplot" en el cual "x" es cada uno de los años, y el eje "y" son las barras de las condicionalidades. Debe tener en cuenta lo siguiente: deberá agrupar las condicionalidades en 4 grupos: Graduado, matriculado (Condicional 1 y 2+ normal), pfu (Pfu+excluido por vencimiento de tiempo) y desertor (Cancelación de matrícula, cambio de programa, y retiros). Asigne colores y cree una leyenda para cada condicionalidad. (PLUS: convierta los valores en porcentaje). Según la gráfica, responda lo siguiente: ¿Qué año presenta el mayor número de graduados?; y ¿Debería haber valores similares de estudiantes graduados en cada año?

# 2. Realice una gráfica de barras en donde muestre el número de estudiantes que hay por cada condicionalidad. Recuerde que puede resumir las condicionalidades en 4: Graduado, matriculado (Condicional 1 y 2+ normal), pfu (Pfu+excluido por vencimiento de tiempo) y desertor (Cancelación de matrícula, cambio de programa, y retiros). Para esto, es recomendable crear un vector por cada condicionalidad y hacer el conteo mediante los valores únicos del codigo_op. Adicionalmente, grafique los porcentajes de cada grupo encima de cada barra y etiquete los ejes. 

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


# 3. Realice una gráfica de barras del número total de estudiantes únicos en cada matería del plan de biología. Tenga en cuenta que cada estudiante esta identificado por la variable "Codigo_op". Coloree las materias acorde al semestre a la cual pertenecen.

# 4. Grafique el retraso estudiantil de cada materia del plan de biología (El número promedio de semestres que tardan los estudiantes en matricular una materia respecto al plan de estudios). Para esto, cree una nueva variable en el data frame existente en donde calcule el semestre en el cual los estudiantes matriculan la materia de la siguiente manera:

(2*(dat$ano_matric-dat$Ano_Ingreso))+dat$periodo_matric

# Realice una gráfica de cajas de cada asignatura. Además, estandarice las materias restando el número de semestre en el cuál cada matería debe ser matriculada en el plan ej: Si el retraso de Introducción a la biología es de 1, esto significa que fue matriculada en el semestre 1. Al restar el número del semestre (1), el valor que tenemos es 0, lo que significa que la materia no tiene retraso.