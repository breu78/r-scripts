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
##            ***   Unidad 1  ***  Sesión 5   ***                 ##
##                                                                ##
####################################################################

####################################################################
##                    Graficando con ggplot2                      ##
####################################################################

library(ggplot2)
library(tidyverse)

dat <- read_csv("SantanderBIO.csv")

# El paquete ggplot2 ofrece herramientas que ayudan a visualizar datos tidy en data frames de forma organizada y sencilla, basado en la gramática de las gráficas. En la grámatica de las gráficas, la idea es que puedas construir gráficas a partir de los mismos componentes: un set de datos; un sistema de coordenadas ("X" y "Y") y aspectos del gráfico; y formas o elementos geométricos que representan a los datos (puntos, lineas circulos, etc)

#En ggplot, cada componente es un capa que se va añadiendo una tras otra usando el símbolo "+"

ggplot(data = dat) #La  primera capa de un ggplot es el conjunto de datos que provienen de un data frame

ggplot(data = dat) +
  aes(x = class) #Luego se añade el sistema de coordenas o relación entre las variables

ggplot(data = dat) +
  aes(x = class) +
  geom_bar() #Y añadimos un geom_ para representar geometricamente nuestros datos. Hay que tener precaución ya que no todos las representaciones gráficas funcionan bien para la relación entre las variables que establezcamos. Ggplot realiza algunas gráficas de manera predeterminada, si solo dejamos en aes() una unica variable, este graficará el número de observaciones por cada clase que exista en esa variable (geom_bar(stat="count")), ya que convierte las variables en factores para graficarlas

#Estos son los 3 componentes principales para elaborar una gráfica en ggplot. Es posible seguir añadiendo capas para mejorar nuestra grafica y personalizarla de muchas maneras, sin embargo, si no se especifican Ggplot las establecerá por defecto

#Al hacer parte del mundo de tidyverse, es posible encadenar la función de ggplot con las funciones vistas anteriormente y así crear un gráfico de forma directa. Vamos a crear una gráfico que nos muestre el número de especies únicas por municipio

dat %>% 
  group_by(municipio) %>% 
  summarise(unicos = unique(species)) %>% 
  ggplot(aes(x = municipio)) +
  geom_bar()

#Ggplot también establece colores y leyenda por defecto a partir de los factores en el elemento aes() con el argumento fill

dat %>% 
  group_by(municipio) %>% 
  summarise(unicos = unique(species)) %>% 
  ggplot(aes(x = municipio, fill = municipio)) +
  geom_bar()

#Podemos cambiar el orden de las barras cambiando el eje x a eje y. Si deseamos usar colores específicos para cada barra lo hacemos en el geom_:

dat %>% 
  group_by(municipio) %>% 
  summarise(unicos = unique(species)) %>% 
  ggplot(aes(y = municipio)) +
  geom_bar(fill = c("blue", "yellow", "brown"), col = c("blue", "yellow", "brown")) # ¿Cuál es la diferencia entre fill y col?

#Realice una gráfica con ggplot de los registros de mamíferos por cada localidad

dat %>% 
  filter(class == "Mammalia")%>% 
  ggplot(aes(x = locality)) + 
  geom_bar()

#Grafique los registros del orden Coleoptera en las diferentes localidades de cada municipio. Para diferenciar a que municipio pertenece cada localidad, use el argumento fill de aes()

dat %>% 
  filter(order == "Coleoptera") %>% 
  group_by(locality) %>% 
  ggplot(aes(x = locality, fill = municipio)) + 
  geom_bar()

#Podemos agrupar las barras

dat %>% 
  filter(order == "Coleoptera") %>% 
  group_by(locality) %>% 
  ggplot(aes(x = municipio, fill = locality)) + 
  geom_bar(position =  "stack")

#También podemos realizar gráficos de cajas e histogramas cambiando de geom_

?geom_boxplot

dat %>% 
  ggplot(aes(x = municipio, y = elevation)) + #Grafico de cajas de la elevacion por cada municipio
  geom_boxplot()

####################################################################
##                          Ejercicio 1                           ##
####################################################################

# 1. Realice un gráfico de cajas sobre la distribución de las alturas a la que fueron registradas las aves en cada localidad utilizando las funciones tidy

dat %>% 
  filter(class=="Aves") %>% 
  ggplot(aes(x = locality, y = elevation)) +
  geom_boxplot()

# 2. Como es la distribución de elevacion de las familias del orden Polypodiales?

dat %>% 
  filter(order=="Polypodiales") %>% 
  ggplot(aes(x = family, y = elevation)) +
  geom_boxplot()

#3. Realice un histograma de la elevación total y la elevación  de ambos reinos

dat %>% 
  ggplot(aes(elevation)) +
  geom_histogram()

dat %>% 
  filter(kingdom == "Plantae") %>% 
  ggplot(aes(elevation)) +
  geom_histogram()

dat %>% 
  filter(kingdom == "Animalia") %>% 
  ggplot(aes(elevation)) +
  geom_histogram()

#Experimente graficando la elevacion de diferentes grupos (reinos, clase, familia etc) utilizando las funcioens tidy

## fin ejercicio
####################################################################

### Theme:

#Igual que en la función básica de plot(), en ggplot podemos tener mas de una gráfica y personalizar cada elemento mediante theme()

as <- dat %>% mutate(elevation_2 = elevation+10)

#Ggplot cuenta con temas predeterminados que podemos cargar mediante la función theme_

?theme()

dat %>% mutate(aleatorios = runif(1255, min = 0, max = 3600)) %>% 
  ggplot(aes(x=elevation, y=aleatorios)) + #establecemos los datos y las variables "x" y "y"
  theme_minimal() #tema del grafico para personalizar color de fondo, bordes, cuadrícula, etc.


#Dentro de theme() modificamos elementos como líneas, colores, ejes, entre otros

dat %>% mutate(aleatorios = runif(1255, min = 0, max = 3600)) %>% 
  ggplot(aes(x=elevation, y=aleatorios)) +
  theme_minimal() + theme(panel.border = element_blank(),
                          panel.grid.major = element_blank(), 
                          panel.grid.minor = element_blank(), 
                          axis.line = element_line(colour = "white")) +#definimos fondo y bordes
  labs(title = "Elevación vs números aleatorios", #título
       subtitle = "Data: SantanderBIO") + #subtítulo
  labs(x = "Elevación", y = "Némeros aleatorios")#nombres de los ejes

#Añadimos un geom_ de puntos

dat %>% mutate(aleatorios = runif(1255, min = 0, max = 3600)) %>% 
  ggplot(aes(x=elevation, y=aleatorios)) + #Grafico base 
  geom_point() + # geometria que corresponde a los puntos
  theme_bw() + theme(panel.border = element_blank(),
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white")) +
  labs(title = "Elevación vs números aleatorios",
       subtitle = "Data: SantanderBIO") 
  labs(x = "Elevación", y = "Némeros aleatorios")

#Coloreamos los puntos y modificamos el título de la leyenda generada

dat %>% mutate(aleatorios = runif(1255, min = 0, max = 3600)) %>% 
  ggplot(aes(x=elevation, y=aleatorios, color = municipio)) + #Gráfico base con color para cada punto
  geom_point(shape=5) +  # Geom que corresponde a los puntos y shape para modificar la forma del punto
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+#definimos fondo y bordes
  scale_colour_discrete(name = "Municipios") + #Establecemos el título de la leyenda
  labs(title = "Elevación vs números aleatorios", 
       subtitle = "Data: SantanderBIO") + 
  labs(x = "Elevación", y = "Números aleatorios")

#Podemos incluir en la gráfica algunos métodos estadísticos como la relación lineal entre los puntos

?geom_smooth

dat %>% mutate(aleatorios = runif(1255, min = 0, max = 3600)) %>% 
  ggplot(aes(x=elevation, y=aleatorios)) + 
  geom_point(shape=5) +  
  geom_smooth(method = "lm", se = TRUE) + #método lm e intervalo de confianza
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white")) +
  scale_colour_discrete(name = "Municipios") + 
  labs(title = "Elevación vs números aleatorios", 
       subtitle = "Data: SantanderBIO") + 
  labs(x = "Elevación", y = "Números aleatorios")

#Y por cada grupo

dat %>% mutate(aleatorios = runif(1255, min = 0, max = 3600)) %>% 
  ggplot(aes(x=elevation, y=aleatorios, color = municipio)) + 
  geom_point(shape=5) +  
  geom_smooth(method = "lm", se = TRUE) +
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white")) +
  scale_colour_discrete(name = "Municipios") + 
  labs(title = "Elevación vs números aleatorios", 
       subtitle = "Data: SantanderBIO") + 
  labs(x = "Elevación", y = "Números aleatorios")

#Podemos graficar una variable por cada grupo con colores que se sobreponen

ggplot(data = dat) + 
  geom_histogram(aes(x = elevation, fill = municipio), 
                 bins = 12, position = "identity", alpha = 0.4) + # alpha para ver las barras que se sobreponen
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white")) +
  labs(title = "Elevación por municipio", 
       subtitle = "Data: SantanderBIO") + 
  labs(x = "Elevación", y = "Conteo")

#Para poder mostrar mas de una gráfica en el mismo plot se utiliza face_wrap. Revise la función y realice el histograma anterior pero ubique en un mismo plot 3 gráficas para cada municipio

?facet_wrap

ggplot(data = dat) + 
  geom_histogram(aes(x = elevation, fill = municipio), bins = 12) + 
  facet_wrap(~municipio, ncol = 1)+ #para cada especie, realice tres histogramas en una columna
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white")) +
  labs(title = "Elevación por municipio", 
       subtitle = "Data: SantanderBIO") + 
  labs(x = "Elevación", y = "Conteo")

#Todas las características de un tema pueden ser guardadas en un vector para evitar escribir el tema cada vez que se grafique

mitema <- theme(panel.grid.major = element_line(colour = "green"), 
                panel.grid.minor = element_line(colour = "pink"),
                panel.background = element_rect(fill = "blue"),
                panel.border = element_blank(),axis.line = element_line(size = 0.9, linetype = "solid", colour = "black"))

ggplot(data = dat, aes(x = elevation, y = elevation))+
  mitema

####################################################################
##                          Ejercicio 2                           ##
####################################################################

# 1.Contruya su propio tema personalizado

# 2. Cree una gráfica de barras de el número de individuos por cada clase, utilice un color diferente para cada barra y utilice su propio tema

# 3.Realice el gráfico anterior pero genere una gráfica separada para cada clase en el mismo plot

# 4. Convierta la gráfica de barras del punto 2 en una gráfica de torta mediante coord_polar()

## fin ejercicio
####################################################################

#Finalmente, con el sistema de coordenadas "X" y "Y" es posible hacer increíbles mapas mediante ggplot 

nz <- map_data("nz") #Cargamos un set de datos que contienede coordenadas longitud y latitud, y columnas que indican a que región corresponden esas coordenadas

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

####################################################################
##                            forcats                             ##
####################################################################

#El paquete forcats tiene como objetivo brindar herramientas de ayuda para manejar variables categóricas.

#Convirtamos una variable en un factor

dat$class <- as.factor(dat$class)

levels(dat$class) #Revisamos las categorías

dat %>% 
  ggplot(aes(x = class)) + 
  geom_bar() + 
  coord_flip()
#Vemos que se grafica un conteo de la variable "class" por cada factor, ahora vamos a ordenar esta gráfica con forcats

dat %>% 
  mutate(class = fct_infreq(class)) %>% 
  ggplot(aes(x = class)) + 
  geom_bar() + 
  coord_flip()
#Ahora tenemos cada categoría ordenada por frecuencia

#Podemos ordenar un factor por otra variable

dat %>% 
  ggplot(aes(x = class, y = elevation)) + 
  geom_boxplot() 

#Bloxplot de la distribución de la altura por cada clase

dat %>% 
  mutate(class = fct_reorder(class, elevation)) %>% 
  ggplot(aes(x = class, y = elevation)) + 
  geom_boxplot()
#En este caso ordenamos las clases por la mediana de sus elevaciones

#Si tenemos clases con pocas o muchas observaciones podemos agruparlos en un nuevo grupo llamado "other". Explique la diferencia entre las dos gráficas

dat %>% 
  mutate(class = fct_lump(class, n = 5)) %>% 
  ggplot(aes(x = class)) + 
  geom_bar() + 
  coord_flip()

dat %>% 
  mutate(class = fct_lump(class, n = -5)) %>% 
  ggplot(aes(x = class)) + 
  geom_bar() + 
  coord_flip()
