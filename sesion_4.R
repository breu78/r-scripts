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
##                                                                ##
####################################################################

#En esta sesión vamos a trabajar los datos de la sesión anterior de una manera diferente. Para esto vamos a cargar el conjunto de paquetes Tidyverse.

install.packages("tidyverse")
library(tidyverse)

#Los paquetes que ofrece Tidyverse están orientados a facilitar la manipulación, importación, exploración y visualización de datos, permitiendo que el proceso sea eficiente y que los scripts puedan ser reproducibles entre usuarios. En esta sesión vamos a trabajar principalmente con el paquete  dplyr y algunas generalidades de otros paquetes para trabajar con datos tidy.

#Los "datos tidy" se caracterizan por lo siguiente:

# Cada columna es una variable
# Cada fila es una observación
# Cada celda es un valor único

#Estas 3 propiedades las veremos con frecuencia a lo largo de esta sesión.

#Comenzamos nuevamente estableciendo el directorio de trabajo y cargando nuestros datos

setwd("~/R/Nuevo curso")

####################################################################
##                             Readr                              ##
####################################################################

#El paquete Readr es una alternativa para leer datos rectangulares como un .csv. Las principales ventajas de usar readr para leer un .csv son la velocidad con la que se importan los datos y el "parse" realizado sobre estos. Esto último quiere decir que la función analizará automaticamente el tipo de dato que está siendo importando y no producirá cambios inesperados. Con frecuencia, la función base de R puede convertir vectores de caracteres a factores. Además, Readr lee automáticamente formatos de fechas.

dat <- read_csv("Santander_BIO_data.csv") #Como resultado devuelve el número de filas y columnas, los nombres de las variables y el tipo de dato de cada una.

## Recordemos que nuestro data frame contiene información sobre inventarios de la biodiversidad en el marco del proyecto Santander BIO. Nuestro data frame cuenta con información taxonómica (Nombre de la especie, familia, reino, etc) e información sobre los sitios y la altura a la que se encuentran estas especies.

#Podemos cambiar el tipo de dato al importarlo, por ejemplo convertir algunas variables en factores

dat <- read_csv("Santander_BIO_data.csv", col_types = 
                  list(
                    species = col_character(),
                    locality = col_factor(),
                    municipio = col_factor(),
                    kingdom = col_factor(),
                    phylum = col_character(),
                    class = col_character(),
                    order = col_character(),
                    family = col_character(),
                    genus = col_character(),
                    taxonRank = col_character(),
                    elevation = col_double()
                  )
)

####################################################################
##                           Tibble                               ##
####################################################################

#Tibble es una forma moderna de data frame que ha probado ser más eficiente. Los tibbles no cambian los nombres de las variables o el tipo de dato.

class(dat) #Si miramos de que clase son los objetos cargados con el paquete Readr, nos damos cuenta que estos son de tipo tibble. Por esto, no hace sentido convertir un objeto cargado con Readr a un tibble, pero si podemos convertir un data frame convencional en un tibble.

dat_conv <-read.csv("Santander_BIO_data.csv")

class(dat_conv)

dat_tibble <- as_tibble(dat_conv)

class(dat_tibble)

#Hay dos diferencias entre un tibble y un data frame convencional: el método de impresión o print() y la forma de obtener subconjuntos.

dat_tibble #Tibble nos muestra hasta 10 observaciones para mantener la consola menos saturada. En caso de necesitar más de 10 observaciones puede indicarlo de la siguiente manera:

dat_tibble %>% print(n = 20)

#Extraer datos de un tibble se hace de una manera más estricta, ya que estos no realizan coincidencia parcial. Necesitará escribir el nombre completo de la variable.

dat_conv$lo #De forma convencional, al escribir el nombre incompleto de una variable, este mostrará la variable con que mejor coincida

dat_tibble$lo #Mientras que en tibble resultará en un error
dat$lo #Lo mismo sucederá con Readr

#Finalmente, usted puede crear tibbles fila por fila o por columnas

tibble(x = 1:5, y = 1, z = x ^ 2 + y) #Por columnas

tribble( 
  ~x, ~y,  ~z,
  "a", 2,  3.6,
  "b", 1,  8.5
)#Por fila

####################################################################
##                            dplyr                               ##
####################################################################

dat <- read_csv("Santander_BIO_data.csv")

#Dplyr es uno de los paquetes más utiles para la manipulación de datos. Dentro de sus funciones más utiles se encuentran:

#mutate() Añade nuevas variables en función de variables existentes
#select() Selecciona variables de acuerdo a su nombre
#filter() Selcciona observaciones de acuerdo a sus valores
#summarise() Resume cada grupo en menos filas
#arrange() Cambia el orden de las observaciones

#La forma simple para seleccionar una variable en un data frame común es mediante el símbolo $

dat$species

####################################################################
### Select:

#Mediante el paquete dplyr podemos seleccionar variables con la función select()

?select()

select(dat, species) #Seleccionamos el data frame y seguido una variable

select(dat, species, locality, municipio) #O más de una variable

#Podemos encadenar varias funciones mediante "pipes" o %>% (se puede generar mediante el atajo control+shift+m). Esto es muy útil ya que nos permite realizar tareas con menos línea de código

#Empezamos cargando primero los datos por fuera de cualquier función, seguido de un pipe

dat %>% select(species)

#Ya que tenemos nuestra variable seleccionada, podemos encadenar funciones que trabajen sobre estos datos. Si la función no requiere parametros adicionales, la función se escribe en su forma básica: funcion()

dat %>% select(species) %>% unique() #Nos muestra los valores unicos de esta variable

#La estructura básica de este proceso es escoger nuestro set de datos, filtrar y seleccionar las variables que necesitamos y aplicar una función. La complejidad del código dependerá del resultado deseado. A continuación vamos a realizar una función simple en un conjunto de datos específico de nuestro set de datos.

####################################################################
### Filter: 

?filter()

dat %>% filter(municipio == "El Carmen de Chucuri") #Hasta este paso filtramos nuestras observaciones

dat %>% filter(municipio == "El Carmen de Chucuri") %>% select(species) #Seleccionamos las localidades en las cuales se registró la especie Xiphidium caeruleum

dat %>% filter(municipio == "El Carmen de Chucuri") %>% select(species) %>% unique() #Y obtenemos los nombres únicos de las especies que están presentes en el municipio de El carmen de Chuchuri

El_Carmen <- dat %>% 
  filter(municipio == "El Carmen de Chucuri") %>% 
  select(species) %>% 
  unique() #Esto puede ser guardado en un vector y separado de una forma mas elegante

length(El_Carmen$species) #Para El Carmen de Chucurí se registraron 357 especies

# ¿Cuántas clases hay en ese mismo municipio?

class_carmen <- dat %>% 
  filter(municipio == "El Carmen de Chucuri") %>% 
  select(class) %>% 
  unique()

length(class_carmen$class) #En El Carmen de Chucurí se registraron 9 clases

####################################################################
### Summarise:

#Podemos realizar resumenes estadísticos de nuestros datos y crear un nuevo data frame con los resultados usando la función summarise()

?summarise()

#Vamos a promediar los valores de elevación

ele_mean <- dat %>% 
  summarise(mean = mean(elevation), n = n()) #El argumento n nos muestra el tamaño del grupo y lo indexa en una columna
#Explique el resultado y lo que se muestra en cada columna

#Podemos agrupar los resultados

conteo_clase <- dat %>% 
  group_by(class) %>% 
  summarise(n = n()) #Realizamos un conteo de los registros de especies en cada clase

ele_mean_group <- dat %>% 
  group_by(municipio) %>% 
  summarise(mean = mean(elevation), n = n())

#Es posible realizar más de una operación simplemente añadiendo una "," y escribiéndola dentro de summarise. Calcule el valor promedio, mínimo y máximo de la elevación por municipio.

ele_mean_group <- dat %>% 
  group_by(municipio) %>% 
  summarise(mean = mean(elevation), min(elevation), max(elevation), n = n())

#Podemos etiquetar nuestros datos o incluso organizarlos dentro de un mismo data frame

#Creamos una etiqueta para cada clase
clase_etiqueta <- dat %>% 
  group_by(class) %>% 
  summarise(cur_group_id()) #Esto podra ser utilizado mas adelante con mutate() y crear una nueva variable en el data frame existente

#Utilizamos las funciones cur_ para crear subconjuntos de datos ordenados por grupo. Los nuevos subconjuntos serán una lista de tibbles.

clase_grupo <- dat %>% 
  group_by(class) %>% 
  summarise(data = list(cur_group()))

clase_datos <- dat %>% 
  group_by(class) %>% 
  summarise(data = list(cur_data()))

clase_datos_completo <- dat %>% 
  group_by(class) %>% 
  summarise(data = list(cur_data_all()))

#Explique la diferencia entre los 3 data frames

#Cree un data frame en el cual agrupe las observaciones por la variable orden y calcule el número de observaciones, valor promedio y mediana de la elevación en cada uno

ejercicio <- dat %>% 
  group_by(order) %>% 
  summarise(data = list(cur_data_all()), n = n(), mean = mean(elevation), median = median(elevation))

####################################################################
##                         Ejercicio 1                            ##
####################################################################

# 1. Utilice summarise y filter para averiguar cual es la familia con mayor registro de especies

mayor <- dat %>% 
  group_by(family) %>% 
  summarise(n = n()) %>% 
  filter(n == max(n))

# 2. Averigue cual es la elevacion máxima en la que fue registrada una planta y un animal

max_ele <- mayor <- dat %>% 
  group_by(kingdom) %>% 
  summarise(max = max(elevation)) 

# 3. Repita el ejercicio anterior, pero mantenga las demás columnas del data frame para visualizar que especies se cuentran a esta altura

# Pista: use la funcion mutate, ungroup y filter para mantener todas las columnas

?ungroup

max_ele2 <- mayor <- dat %>% 
  group_by(kingdom) %>% 
  mutate(max = max(elevation))

## fin ejercicio
####################################################################

####################################################################
### Mutate:

#Ahora vamos a ver como se modifican columnas en dplyr mediante la función mutate().

?mutate()

#Vamos a crear una nueva varible que etiquete las observaciones de acuerdo con una variable, en este caso dependiendo a que clase pertenecen

da <- dat %>% 
  group_by(class) %>% 
  mutate(id = cur_group_id())

#En mutate, las nuevas variables se crean a partir de las variables existentes.

new_var <- dat %>%
  select(species, elevation) %>% #Nos quedamos con 2 variables
  mutate(
    doble_elevacion = elevation * 2, #Creamos una nueva variable a partir de los datos de elevación
    doble_elevacion_logaritmo = log(doble_elevacion) #Creamos una segunda variable a partir de la variable anterior
  )

#Tambien es posible remover o modificar variables existentes. Vamos a eliminar la variable order, y modificar la variable de elevación 

nuevo_dat <- dat %>% 
  mutate(
    order = NULL,
    elevation = elevation/2
  )

#Podemos modificar multiples columnas usando across dentro de mutate

?across

across_data <- dat %>% 
  mutate(across(.cols = everything(), as.factor)) #Convertimos todas las columnas en factores

#Ya que la elevación es una variable numérica, debemos evitar tenerla como factor

across_data <- dat %>%
  mutate(across(!elevation, as.factor)) #Con el signo de admiración antes de la variable, estamos indicando que aplique la funcion as.factor a todas las columnas menos a elevation

####################################################################
##                         Ejercicio 2                            ##
####################################################################

# 1. Cree dos columnas nuevas, una en donde le sume 1000 a cada observacion de elevación y otra donde le reste 1000. Ademas, mantenga la variable de especies, municipio y de elevación orginal. Agrupe las observacioens por municipio y cree un data frame que contenga los valores promedio de las 3 variables numéricas.

##Pista: revise argumento where() y utilicelo dentro de la función across para seleccionar solo las columnas de clase numerica

ejercicio_2 <- dat %>%
  select(species, municipio, elevation) %>% 
  mutate(masmil = elevation+1000, menosmil = elevation-1000) %>% 
  group_by(municipio) %>% 
  summarise(across(where(is.numeric), mean))

# 2. Explore el argumento starts_with() para seleccionar las observaciones que empiezan con una secuencia de caracteres en especifico ej: starts_with("Anolis")

## fin ejercicio
#####################################################################

#####################################################################
## Arrange: 

#Finalmente con arrange() podemos cambiar el orden de las observaciones o filas

?arrange

#Vamos a ordenar nuestra variable numérica de elevación

ordenado <- dat %>% arrange(elevation) #Ordena las observaciones de menor a mayor

#Ordenelo de mayor a menor usando desc() en la funcion arrange()

ordenado <- dat %>% arrange(desc(elevation))

#Tambien es posible ordenarlo por categorias de una variable. Intente crear un data frame ordenado por su género

#En nuestro set de datos, no existe una columna para el género. Vamos a intentar crearla a partir de la variable species, la cual contiene el epíteto genérico y crear una nueva variable con estos caracteres.

####################################################################
## Separate:

#Podemos separar caracteres con la función separate()

?separate()

separado <- dat %>% separate(species, c("specie", "genus"))

#separate() se encarga de separar caracteres cuando encuentra un valor diferente a una letra o numero, como el espacio. En este caso, separará los caracteres en dos columnas llamadas "specie" y "genus". Vemos que luego de ejecutar, obtenemos una advertencia con las posiciones de filas en las que encontraron problemas. Revisamos las posiciones en el data frame original

dat$species[c(226, 720, 950)] #Vemos que el epíteto de estas especies está acompañado de otra palabra separado con -. ¿Qué pasa si añadimos una tercera columna?

separado <- dat %>% separate(species, c("specie", "genus", "otro"))

#Si usamos NA en vez del nombre de la nueva columna omitiremos esa columna

separado <- dat %>% separate(species, c(NA, "genus"))

#O podemos especificar el comportamiento de la separación

separado <- dat %>% 
  separate(species, c("specie", "genus"), " ", extra = "merge")#Le indicamos a la función que solo debe separar los caracteres cuando encuntre un espacio " ", y lo que queda sera único o se hará un "merge".

#Revisamos la observacion 226

separado$genus[226]

#También podemos realizar esto mediante expresiones regulares que veremos mas adelante en la sesion

separado <- dat %>% 
  separate(species, c("specie", "genus"), sep = " ")

#Ahora podemos ordenar nuestras observaciones de acuerdo al género!

ordenado_grupo <- separado %>% arrange(genus)

####################################################################
##                          Aggregate                             ##
####################################################################

#Una alternativa clásica en R a la función de summarise() en dplyr es aggregate, aunque es recomendable usar los paquetes de tidiverse, conocer la sintaxis de otras funciones es recomendable para desarrollar habilidades en la programación

#Al igual que summarise, aggregate() permite calcular resúmenes estadísticos de subconjuntos de datos

?aggregate

#Vamos a promediar la elevación a través de algunos grupos en nuestros datos

aggre_prom <- aggregate(elevation ~ class, data = dat, FUN = mean) #Aggregate tiene 3 argumentos básicos usando la formula ~. Primero se escribe el elemento al cual se aplicará la función, en este caso la elevación; seguido el grupo de observaciones que se tomara en cuenta para aplicar la función, que en este caso es la clase; el nombre del vector en el cual se encuentran estos elementos y la función a realizar. La función se lee como: Realice una promedio de la elevación en cada clase de nuestras espcies en el set de datos llamado dat

#Esta es la forma que utilizabamos en dplyr para realizar el mismo proceso
sum_prom <- dat %>% 
  group_by(class) %>% 
  summarise(mean = mean(elevation))

#Adicionalmente, podemos obtener resultados que dependan de mas de una variable. Si necesitamos obtener los valores promedio de elevación por clase y al mismo tiempo por municipio, agregamos el signo "+" de la siguiente manera:

aggre_prom <- aggregate(elevation ~ class+municipio, data = dat, FUN = mean) #De esta forma, obtener el valor promedio de elvación de los registros en cada clase y en cada municipio

sum_prom <- dat %>% 
  group_by(class, municipio) %>% 
  summarise(mean = mean(elevation)) #Esto funciona de igual forma en summarise añadiendo otra variable en group_by

##################################################################
##                        Ejercicio 3                           ##
##################################################################

# 1. ¿Qué pasa al cambiar el orden de las variables en aggregate y en summarise? ¿Son los resultados iguales? Explique.

aggre_prom2 <- aggregate(elevation ~ municipio+class, data = dat, FUN = mean)
sum_prom2 <- dat %>% 
  group_by(municipio, class) %>% 
  summarise(mean = mean(elevation))

# 2. Utilice la función aggregate para calcular el número de observaciones de especies por orden utilizando la funcion length. Realice el mismo proceso usando el paquete dplyr

leng <- aggregate(species ~ order, data = dat, FUN = length)
leng_sum <- dat %>% 
  group_by(order) %>% 
  summarise(n = n())

# 3. Calcule la desviacion estándar, el valor mínimo y máximo de la elevación para cada familia, phylum y municipio con aggregate y dplyr.

ejercicio <- aggregate(elevation ~ family+phylum+municipio, data = dat, FUN = min)
ejercicio_1 <- aggregate(elevation ~ family+phylum+municipio, data = dat, FUN = sd)
ejercicio_2 <- aggregate(elevation ~ family+phylum+municipio, data = dat, FUN = max)

final_ejercicio <- cbind(ejercicio, ejercicio_1$elevation,ejercicio_2$elevation)


ejercicio_dplyr <- dat %>% 
  group_by(family, phylum, municipio) %>% 
  summarise(sd = sd(elevation), min = min(elevation), max = max(elevation))

#En aggregate la solución del problema anterior requiere muchos más pasos que en dplyr.

## fin ejercicio
####################################################################

####################################################################
##                            Stringr                             ##
####################################################################

#El paquete stringr brinda herramientas útiles para trabajar con expresiones regulares y caracteres. Las expresiones regulares son un lenguaje que describen patrones de texto. Esto es de gran ayuda cuando necesitamos preparar y limpiar nuestros datos. Ejecute las siguientes funciones y describa lo que esta pasando.

?Stringr
x <- fruit[1:5]

str_detect(x, "aeiou")

str_detect(x, "[aeiou]")

str_count(x, "[aeiou]")

str_subset(x, "[aeiou]")

str_locate(x, "[aeiou]")

str_extract(x, "[aeiou]")

str_match(x, "(.)[aeiou](.)")

str_replace(x, "[aeiou]", "?")

str_split(c("a,b", "c,d,e"), ",")

#Todas las funciones de stringr comienzan con str_, y las funciones anteriores son las 7 principales del paquete.

#Aplicando estas funciones a nuestro set de datos, podemos realizar busquedas de caracteres de nuestros registros

which(str_detect(dat$species, "Clusia hammeliana")=="TRUE") #Buscamos la posición de una especie en particular

#Sin embargo, si no estamos seguro, podemos hacer una busqueda con algunos caracteres que recordemos

which(str_detect(dat$species, "sia hamm")=="TRUE")

#También podemos contar el numero de registros por localidad o municipio

sum(str_count(dat$municipio, "Cimitarra"))

#En stringr podemos hacer busquedas mas generalizadas que no veremos en esta sesión, pero esto es un ejemplo de lo que podemos hacer conociendo algunas clases de caracteres

str_subset(dat$species, "[:space:][aeiou]") #Extraemos todas las especies en la que su epíteto específico comienza con una vocal. Observe que [:space:] es una clase de caracter que se utiliza para indicar que antes de las vocales debe haber un espacio, de otra manera se obtendrían todos los registros que tuviesen alguna vocal en cualquier posición.

# ¿Como podemos averiguar si hay un número en los nombres de especies?

which(str_detect(dat$species, "123456789"))
which(str_detect(dat$species, "[:digit:]")) #La clase de caracter para encontrar cualquier número es [:digit:]
str_detect(dat$elevation, "[:digit:]")

#Explore las clases de caratceres pre-creadas

#[:punct:]: Puntuación
#[:alpha:]: Letras
#[:lower:]: Letras minúsculas
#[:upper:]: Letras mayúsculas
#[:digit:]: Dígitos
#[:xdigit:]: Dígitos hexadecimales
#[:alnum:]: Letras y núeros
#[:cntrl:]: Caracteres de control
#[:graph:]: Letras, números y puntuación
#[:print:]: Letras, números, puntuación y espacio en blanco
#[:space:]: Caracter de espacio
#[:blank:]: Espacio y tabulador


