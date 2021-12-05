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

# 2. Averigue cual es la temperatura y precipitación anual máxima de cada cordillera. Además, mantenga todas las columnas del data frame original que correspondan a los valores máximos encontrados
max_ele <- mayor <- dat_env %>% 
  group_by(Cordillera) %>% 
  mutate(Temp = max(Temp_ann), Prec = max(Precp_ann)) %>% 
  filter(Temp == Temp_ann | Prec == Precp_ann)

# Pista: use la función mutate y filter 

# 3. Ordene de mayor a menor la variable AREA_KM2 del data frame dat_env y seleccione las variables que empiecen por una vocal

ordenado <- dat_env %>% arrange(desc(AREA_KM2)) %>% select(starts_with(c("a", "e", "i", "o", "u")))

# 4. Cree un data frame en donde añada dos columnas, una en donde le sume 100 a cada observacion de isotermalidad y otra donde le reste 1000. Ademas, mantenga la variable de cordillera e isotermalidad original. Agrupe las observacioens por cordillera y cree un data frame que contenga los valores promedio de las 3 variables numéricas.

##Pista: revise argumento where() y utilicelo dentro de la función across para seleccionar solo las columnas de clase numerica

ejercicio_2 <- dat_env %>%
  select(Cordillera, Isother) %>% 
  mutate(masmil = Isother+100, menosmil = Isother-100) %>% 
  group_by(Cordillera) %>% 
  summarise(across(where(is.numeric), mean))

####################################################################
##                           Sesión 5                             ##
####################################################################

# 1. Realice una gráfica de violines con la temperatura anual de cada cordilerra en ventanas separadas. Agregue títulos de los ejes y colores a cada gráfica

dat_env %>% 
  group_by(Cordillera) %>% 
  ggplot(aes(x = Cordillera, y = Temp_ann, fill = Cordillera)) + 
  geom_violin() +
  facet_wrap(~Cordillera, ncol = 1)

# 2. Grafique mediante un histograma la estacionalidad de la precipitación en cada cordillera con colores que se sobrelapen entre sí

#Pista: Utilice el argumento alpha dentro del geom_

ggplot(data = dat_env) + 
  geom_histogram(aes(x = Precp_seasonality, fill = Cordillera), 
                 bins = 12, position = "identity", alpha = 0.4) + # alpha para ver las barras que se sobreponen
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white")) 

# 3. Cree un tema que contenga los siguientes elementos:
 # a. Líneas en los 4 bordes de color amarillo
 # b. Lineas horizontales y verticales discontinuas de color azul y negro respectivamente
 # c. Fondo gris interno
 # d. Fondo rosado externo

# 4. Grafique el número de observaciones de cada cordillera en una gráfica de barras con colores y nombres en los ejes. Adicionalmente, convierta la gráfica de barras en una gráfica de torta mediante el argumento coord_polar().

dat_env %>% 
  ggplot(aes(x = Cordillera)) +
  geom_bar() +
  coord_polar()

# 5. Cree un vector con los nombres de las cordilerras como factores y utilice forcats para ordenar los nombres manualmente de la siguiente forma: SM,CC,CW,CP Y CE

f <- as.factor(dat_env$Cordillera)
levels(f)
fct_relevel(f, "SM","CC","CW","CP","CE")

####################################################################
##                           Sesión 6                             ##
####################################################################

# 1. Presente este documento en formato markdown
