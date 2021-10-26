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
##            ***   Unidad 1  ***  Sesión 3   ***                 ##
##                                                                ##
####################################################################


## Estableciendo el directorio de trabajo para poder leer datos desde un archivo

# Antes de empezar, debemos crear nuestro sitio de trabajo mediante la función setwd(), en el cual debemos poner entre comillas la dirección de la carpeta en la que tenemos guardado este script y el archivo con los datos del proyecto Santander BIO "Santander_BIO_data.csv"

setwd("~/R/Nuevo curso") # Note que empieza con ~ ya que esto nos dirige automáticamente a la carpeta mis documentos que R establece por defecto. Las carpetas se separan con /

# En RStudio se recomienda utilizar: Session -> Set Working Directory

####################################################################
##                          Data frame                            ##
####################################################################

#Al igual que una matriz, los data frames son un conjunto de elementos ordenados en dos dimensiones. Filas (observaciones) y columnas (variables). Sin embargo, en un data frame se pueden almacenar diferentes tipos de datos en diferentes columnas.

## Una de las formas más comunes en la que vamos a encontrar datos, es en formato Excel o .csv. Estos son datos tabulados que constan de dos dimensiones, filas y columnas, que pueden almacenar datos numéricos y caracteres.

####################################################################

## El primer paso es importar el archivo desde carpeta de trabajo.

dat <-read.csv("SantanderBIO.csv") # Note que los nombres de los documentos van entre comillas y con la extensión del documento

## Ya hemos cargado nuestros datos en un data frame, el cual contiene información sobre inventarios de la biodiversidad en el marco del proyecto SantanderBIO. Nuestro data frame cuenta con información taxonómica (Nombre de la especie, familia, reino, etc.) e información sobre los sitios y la altura a la que se encuentran estas registros.

##################################################################

## Ahora revisaremos la estructura del data frame.

# Vamos a explorar nuestros datos aprendiendo paso a paso algunas funciones importantes

dim(dat) # Dimensiones de los datos: en este caso, 1255 filas (observaciones) y 11 columnas (variables)

colnames(dat) #Nombre de las columnas

str(dat) #Estructura de los datos

#Tambien es posible preguntar por otras condiciones en nuestro data frame que no sean necesariamente numéricas o que su resultado no sea una posición. Por ejemplo, un resultado tipo lógico, mediante la función is.numeric/character()

is.numeric(dat$species) 
is.character(dat$species) 

is.numeric(dat$elevation) 
is.character(dat$elevation) 

##################################################################
##             Acceder a variables dentro data frame            ##
##################################################################

#Para seleccionar una variable o columna del data frame utilizaremos el caracter "$" seguido del nombre asignado asignado a nuestros datos, después colocaremos el nombre de la variable deseada o podremos desplegar todas las opciones con tabulador

dat$elevation

ele <- dat$elevation

head(ele) #La función head devuelve por defecto los seis primeros valores de un vector
tail(ele) #En contraste, la función tail devuelve los seis últimos valores.

min(dat$elevation) #Con min obtenemos el valor mínimo de una variable deseada (en este caso altura de la observación)

max(dat$elevation) #Y con max el valor máximo.

# Ejercicio: Explorar con las funciones mean() y sd()

#Sabemos que hay distintos lugares en donde se colecto la información y que cada lugar puede aparecer más de una vez porque es probable que cuente con más de una especie colectada, también es probable que una especie se repita debido a que se puede encontrar en más de un lugar. Entonces, vamos a averiguar el número de especies registradas en total.

dat$species
length(dat$species) # la longitud del vector nos da el numero total de registros

species <- unique(dat$species) #Con la función "unique" obtendremos los nombres de las especies sin que se repitan.

length(species) #Hay 1000 especies en total

#Ahora averiguaremos cuantas especie únicas puede haber en un municipio aleatorio. Para esto, vamos a crear un vector que contenga solo los datos del municipio deseado, aunque esto no es obligatorio, puede ser una forma ordenada de escribir nuestro código.

unique(dat$municipio) #Nombres de los municipios de colecta

m_Cimitarra <- dat[dat$municipio=="Cimitarra",] #Usamos los corchetes [] para seleccionar las filas que contengan datos únicamente del municipio de Cimitarra. Después de la "," se deja vacío para que extraiga todas las columnas asociadas a las filas que seleccionamos

sp_unicas_cimitarra <- unique(m_Cimitarra$species)

length(sp_unicas_cimitarra) #En el municipio de Cimitarra se registraron 397 especies 

####################################################################
##                        Ejercicio 1                             ##
####################################################################

# Averigue la siguiente información del municipio de Cimitarra:

# Elevacion máxima y mínima de los registros en SantanderBIO

max(m_Cimitarra$elevation)
min(m_Cimitarra$elevation)

#Elevación máxima y mínima de los registros de aves

colnames(m_Cimitarra) # la columna 11 es la columna de la altura

max(m_Cimitarra[m_Cimitarra$class=="Aves", 11])

min(m_Cimitarra[m_Cimitarra$class=="Aves", 11])

# Número de localidades únicas 

unique(m_Cimitarra$locality)
length(unique(m_Cimitarra$locality))

####################################################################
##                        Ejercicio 2                             ##
####################################################################

# 1. Extraer la altura máxima y mínima de la que se tiene registro en cada reino (Plantae, Animalia) por localidad (Vereda El Aguila, Vereda Guineales, Vereda Locacion, Vereda Riveras de San Juan)

max(m_Cimitarra[m_Cimitarra$locality=="Vereda El Aguila" & m_Cimitarra$kingdom=="Plantae", 11])
min(m_Cimitarra[m_Cimitarra$locality=="Vereda El Aguila" & m_Cimitarra$kingdom=="Plantae", 11])
max(m_Cimitarra[m_Cimitarra$locality=="Vereda El Aguila" & m_Cimitarra$kingdom=="Animalia", 11])
min(m_Cimitarra[m_Cimitarra$locality=="Vereda El Aguila" & m_Cimitarra$kingdom=="Animalia", 11])

max(m_Cimitarra[m_Cimitarra$locality=="Vereda Guineales" & m_Cimitarra$kingdom=="Plantae", 11])
min(m_Cimitarra[m_Cimitarra$locality=="Vereda Guineales" & m_Cimitarra$kingdom=="Plantae", 11])
max(m_Cimitarra[m_Cimitarra$locality=="Vereda Guineales" & m_Cimitarra$kingdom=="Animalia", 11])
min(m_Cimitarra[m_Cimitarra$locality=="Vereda Guineales" & m_Cimitarra$kingdom=="Animalia", 11])

max(m_Cimitarra[m_Cimitarra$locality=="Vereda Locacion" & m_Cimitarra$kingdom=="Plantae", 11])
min(m_Cimitarra[m_Cimitarra$locality=="Vereda Locacion" & m_Cimitarra$kingdom=="Plantae", 11])
max(m_Cimitarra[m_Cimitarra$locality=="Vereda Locacion" & m_Cimitarra$kingdom=="Animalia", 11])
min(m_Cimitarra[m_Cimitarra$locality=="Vereda Locacion" & m_Cimitarra$kingdom=="Animalia", 11])

max(m_Cimitarra[m_Cimitarra$locality=="Vereda Riveras de San Juan" & m_Cimitarra$kingdom=="Plantae", 11])
min(m_Cimitarra[m_Cimitarra$locality=="Vereda Riveras de San Juan" & m_Cimitarra$kingdom=="Plantae", 11])
max(m_Cimitarra[m_Cimitarra$locality=="Vereda Riveras de San Juan" & m_Cimitarra$kingdom=="Animalia", 11])
min(m_Cimitarra[m_Cimitarra$locality=="Vereda Riveras de San Juan" & m_Cimitarra$kingdom=="Animalia", 11])

# 2. Calcular el promedio de la altura por municipio

mean(dat[dat$municipio=="Cimitarra",11])
mean(dat[dat$municipio=="El Carmen de Chucuri",11])
mean(dat[dat$municipio=="Santa Barbara",11])

## Fin de los ejercicios
####################################################################


#################################################################### 
##             Acceder a observaciones más complejas              ##
####################################################################

# Podemos especificar más de una condición para crear un set de datos más pequeño

or_operador <- dat[dat$municipio=="Cimitarra" | dat$municipio=="Santa Barbara",] # Utilizamos el simbolo "|" o "or" para extraer una condición u otra. Si ambas condiciones son verdaderas en nuestro set de datos, se extraerán ambas.

or_operador <- dat[dat$municipio=="Cimitarra" | dat$municipio=="Santa",] # En este caso solo  se extraerán las observaciones de Cimitarra ya que no existe un municipio llamado "Santa" dentro de nuestros datos

#Si queremos elegir todas las observaciones menos una en particular, usamos el operador lógico "!"

plantas_no <- dat[!dat$kingdom=="Plantae",] # Seleccionamos solo observaciones con registros del reino Animalia

# Para seleccionar varias condiciones usamos "&"

alt_0_100 <- dat[dat$elevation > 0 & dat$elevation < 100,] #seleccionar alturas entre 0 y 100 metros

length(alt_0_100[,1]) # Existen 16 observaciones registradas en el rango de altura de 0 a 100 metros, todos en Cimitarra

# ¿Cómo podemos verificar que obtuvimos los datos deseados?

min(alt_0_100$elevation)

max(alt_0_100$elevation)

# ¿Cómo podemos averiguar el número de observaciones de anfibios por municipio?

amphi_cimitarra <- dat[dat$municipio=="Cimitarra" & dat$class=="Amphibia",]
length(amphi_cimitarra[,1])

# Ejericio: Calcular también para El carmen de Chucurí y Santa Barbara.

####################################################################
##     Agregar columnas al data frame para apoyar el análisis     ##
####################################################################

# Vamos a ver el número de registros totales en cada municipio

dat$conteo <- 1 #Podemos añadir una nueva columna que tenga el número 1 en cada observación y así hacer una suma de filas 

sum(dat[dat$municipio=="Cimitarra", "conteo"]) #En Cimitarra existen 551 registros

sum(dat[dat$municipio=="El Carmen de Chucuri", "conteo"]) #En el Carmen de Chucuri existen 372 registros totales

sum(dat[dat$municipio=="Santa Barbara", "conteo"]) #En Santa Barbara existen 332 registros

#Finalmente, podemos eliminar la columna de conteo

dat <- dat[,-11]


##################################################################
##            Crear rangos en una variable continua             ##
##################################################################

# ¿Cuál es el rango de altura en la que registraron los anfibios del ejercicio anterior? 
# Para esto usaremos la función cut()

?cut

dat$cut <- cut(dat$elevation, 4)

dat$cut <- cut(dat$elevation, 4, labels = c("a", "b", "c", "d"))

#Explique que sucede en las líneas de código anterior, luego defina 4 rangos de altura que empiece desde 0 y termine en 4000 metros y colóqueles una etiqueta. Finalmente responda la pregunta anterior.

dat$cut <- cut(dat$elevation, breaks = c(0,1000,2000,3000,4000), labels = c("Cero a mil", "Mil a dos mil", "Dos mil a tres mil", "Tres mil a cuatro mil"))

levels(dat$cut)

####################################################################
##                         Ejercicio 3                            ##
####################################################################

# 1. Calcular el número de registros por cada rango de altura

# 2. Calcular el número de especies por cada rango de altura

# 3. Calcular el número de especies de plantas por cada rango de altura

## Fin del ejercicio
####################################################################

####################################################################
##                     Indexar  y reemplazar                      ##
####################################################################

#En R podemos preguntar por una condición en específico y el resultado será la posición de este en el data frame. Esto se hace mediante la función which().

?which

#Podemos preguntar por ejemplo por los registros que se encuentren a una altura menor de 80 metros

which(dat$elevation<80) #Existen 6 registros que se encuentran a una altura menor de 80 metros

dat[1144,] #El resultado de la fila 1144 corresponde la especie Curimata mivartii registrada a 74 metros de altura

#Si guardamos las posiciones del resultado anterior, podemos obtener todos los resultados en un nuevo data frame de manera rápida:

posiciones <- which(dat$elevation<80)

nuevo_dat <- dat[posiciones,] #Podemos escribir el nombre del vector que contiene los valores de las posiciones para no escribirlas una por una

nuevo_dat

#Ademas de extraer información de un data frame, podemos editarlo de forma sencilla. Supongamos que encontramos un error asociado a un dato en específico, como el nombre de una familia. En nuestro caso hipotético, supongamos que nuestros datos tienen un error de digitación, y el nombre de la familia Acanthaceae está mal escrito, por lo que necesitamos modificarlo.

dat2 <- dat #Copiamos el data frame en un nuevo vector

nombre_incorrecto <- which(dat2$family=="Acanthaceae") #Guardamos la posición de las filas en las que esta el nombre de la familia mal escrito

dat2[nombre_incorrecto, 8] <- "Nombre correcto" #Cambiamos el nombre por el que deseamos

#Otra alternativa: Utilice la siguiente función para cambiar el nombre de la familia Viperidae a "Notviperidae" y verifique que el cambio se hizo correctamente

?replace
dat2$family <- replace(dat2$family ,c(dat2$family=="Viperidae"), "Notviperidae")
verificacion <- dat2[dat2$family=="Notviperidae",] #Y finalmente verificamos que el cambio fue realizado

####################################################################
##                        Ejercicio 4                             ##
####################################################################

# 1. Realice un gráfico de barras del número de registros totales por cada municipio

# 2. Realice un gráfico del número de registros de insectos en cada localidad

# 3. Realice un boxplot de la elevacion por clases

# 4. Realice un histograma de la elevación

## Fin del ejercicio
#####################################################################