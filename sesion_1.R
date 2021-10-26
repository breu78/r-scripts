####################################################################
##                                                                ##
##  Análisis de datos utilizando el lenguaje de programación R:   ##
##  una experiencia de aprendizaje virtual en el aula invertida   ##
##                                                                ##
##                 Proyecto INNOVA-TIC 2021                       ##
##                                                                ##
## Creado por:     Björn Reu (breu@uis.edu.co)                    ##
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
##            ***   Unidad 1  ***  Sesión 1   ***                 ##
##                                                                ##
####################################################################

#Comenzaremos con las operaciones básicas ejecutadas en la línea de comandos en R o terminal. Este será nuestro espacio de trabajo en el cual ejecutaremos las ordenes cuyos resultados se mostrarán en la consola. 

#Todo lo que siga después de un numeral (#) será considerado como un comentario, que al ejecutar será omitido. Para ejecutar el código en R podemos utilizar el botón "run" que disponemos arriba a la derecha, o utilizar un atajo:

## Command + Enter (Mac)
## Control + Enter (Windows, Linux)

###################################################################
##        La línea de comandos (Terminal)                        ##
###################################################################

## Línea de comandos como calculadora:

2+5
7-3
(2+3)*5
(2+3)/((2+3)*5)

## Se pueden ejecutar varias operaciones utilizando punto y coma (;):

2+5; 4+6

## Dispone de diferentes funciones como raiz cuadrada o logaritmo

?Arithmetic
sqrt(9) # raíz cuadrada
log(1)  # logaritmo
log10(10) # logaritmo base 10
3^2 # potenciación (exponente 2)

## Las letras y variables mas importantes estan disponibles en R

?Constants
pi
letters
LETTERS
 
##################################################################
##        Función ayuda                                         ##
##################################################################

## Existen tres formas de obtener ayuda:-----
## 1. Área miscelánea -> "Help"
## 2. Símbolo "?" antes de la función
## 3 Tecla Tabulador (Autocompleta el nombre)

x <- c(1,2,3,4,5,6,7,8) # <- símbolo de asignación, permite agrupar los elementos dentro del objeto x.

x = c(1,2,3,4,5,6,7,8) # "<-" o "=" significa lo mismo

mean(x)
?sum
?rep
?sort
?order

## Estructura función
## Función: "mean()"
## Objeto: "x"
## Argumento ('arg'): "na.rm=FALSE"


## Ejercicio:
## Explique brevemente la función "order". ¿Qué hace y que significan los argumentos? 

?sort
x <-c(5,3,7,8,9)
sort(x, decreasing = TRUE)
sort(x, decreasing = FALSE)

##################################################################
##        Vamos a comenzar                                      ##
##################################################################

## Creando nuevas variables:----
## Para crear una nueva variable usted puede utilizar "<-" (símbolo de asignación) o "=". Es aconsejable el uso de "<-" ya que se refiere a la indexación dentro de un vector

## Cada variable necesita un nombre que puede estar compuesto de letras, números, "." o "_". Ejemplo: "my_data"

## Las variables nunca deben comenzar con un número

## R diferencia entre minúsculas y mayúsculas; "a" es diferente de "A". Las variables pueden ser reescritas.  

## Una vez escrita una variable podemos llamar al objeto

x <- 3
x

x <- 9
x

resultado <- 3+9
resultado
mode(resultado)


## Además de las variables ('numeric'), R permite la definición de texto ('character') y de variables lógicas ('logic', e.g. TRUE y FALSE). Los caracteres deben ser puestos entre comillas ("...") para que R los identifique como tal.

## Estos tipos de vectores se definen como vectores atómicos.

y <- "test"
y
mode(y)

a <- FALSE
a
mode(a)

mode(T) # T es igual a TRUE, y F es igual a FALSE

## Que ocurre aquí?
s <- as.numeric(c(T,F,F)) 
mode(s)

##################################################################
## El área de trabajo o memoria - ventana arriba a la derecha 'Environment'

## Todos los objetos creados durante una sesión son guardados en el área de trabajo.
## Para ver el área de trabajo ejecute ls(), para remover algún objeto de esta ejecute rm().

## También puede utilizar los botones en el área de trabajo

ls()
rm(s)
ls()

##################################################################

## Puede hacer cálculos simples con variables númericas
a <- 5
b <- 7
a+b+3

## Que ocurre a continuación? Por favor explique!
b = 2
b == 2
b == 3

c = 7
d = -3
?Syntax

## Ejercicio----

#compruebe las siguientes afirmaciones lógicas:
## c mayor que d
## c menor o igual que d
## c igual a d
c > d
c <= d
c == d

##################################################################
## R como calculadora - Operadores y funciones----
?Syntax

# <-               Asignar
# + - * / % ^      Aritméticas
# > >= < <= == !=  Relación (orden y comparación)
# ! & && | ||      lógicas
# $                lista indexada
# :                Crear una secuencia


# Operadores lógicos para:
# !      NO
# &      Y
# |      O
# <     Menor que
# <=    Menor o igual que
# >     Mayor que
# >=    Mayor o igual que
# ==    IGUAL
# !=    NO IGUAL (diferente de)
# &&    AND with IF (y con si <condicional>)
# ||    OR with IF (o con si <condicional>)

##################################################################

## Tipos de Datos y Objetos----

## Logical = (FALSO/VERDADERO) / (FALSE/TRUE)
## Number = (Entero, Decimal, Complejo (e.g. 3i))
## Character = Letras y palabras ("", o '')

## Otros tipos de datos son "list", "expression", "name", "symbol" and "function"

## Para operaciones más complejas necesitamos estructuras de datos más complejas.
## R ofrece más que solo objetos que contienen un elemento, como los vectores o las matrices.


##################################################################
## Vectores I: Vectores sencillos                               ##
##################################################################
## Para hacer un vector utilice la función concatenar "c()" . Los elementos sencillos de un vector están separados por ",".
x <- c (2, 5, 10, 14, 3, 1, 18, 24, 17)
x
mode(x)

a <- c ("text", 2, 6, TRUE)
mode(a) ## ¿Qué ocurre aquí? Por qué "character"?
a <- c ( 2, 6, F)
mode(a) #y ahora?

# Crear un vector vacío:
b <- numeric(20)
b

## Ejercicio: 
## Cree un vector con nombre "vec" que contenga los números de 1 a 10.
vec <- (1:10)

## Un vector también puede contener diferentes tipos de variables.
## Usted puede realizar cálculos con vectores que contengan solo elementos "numeric"

## suma
sort(x)
sum(x)

## promedio
mean(x)

## cuartil
quantile(x)

## longitud del vector
length (x)
length(letters)

## ordenar
x
?sort(x)
sort(x, decreasing = F)
sort(x, decreasing = FALSE)
sort(x, decreasing = T)
sort(x, decreasing = TRUE)

## Que ocurre si colocamos "decreasing = TRUE"? Compruebe con "?sort"
## "sort" y "order" realizan la misma función; sin embargo "order" puede ser aplicado a otro tipo de objetos diferentes a vectores, como los data frames.

## Calculo con vectores: Por favor explique qué ocurre a continuación
x
length(x)

#1
x + 10
x

#2
y <- c(1, 3, 5)
x + y
x

#3
y <- c (4, 2, 8, 5, 3, 9, 3, 10, 1)
xy <- x + y
xy
x

#4
y <- c(1, 3)
x + y
x

#5
y <- c (4, 2, 8, 5, 3, 9, 3, 10, 1)
sum(x)
sum(x,y)
sum(x + y)

## Etiquetar elementos de un vector con nombres. Función "names()"
x <- c (2, 5, 10, 14, 3, 1, 18, 24, 17)
a <- c ("E1","E2","E3","E4","E5","E6","E7","E8","E9")
names (x) <- a
x
names(x) # Vector de los nombres del vector numérico x 

str (x) # sobre la estructura del vector x (muy útil!)
summary (x) # indica los valores mínimos, máximos, etc.
head (x)
tail (x)

##################################################################
## Ejercicios: Asignación y operadores lógicos-----

# 1. Sumar los números enteros de 1 hasta 5

sum(1:5)
# 2. Crear un variable v1 que contenga una letra
v1 <- "d"

# 3. Copiar v1 a v2
v2 <- v1

# 4. Compare los valores de v1 y v2
v1 == v2
v1 != v2

# 5. Cree un vector de longitud 20 con el tipo de datos que usted quiera 
## y muestre las primeras nueve entradas.

vec <- c(1:10, letters[1:10])
?head
head(vec, 9)

# 6.Cree un vector que contenga los seis primeras letras del abecedario.

alph <- (letters[1:6])
alph

###################################################################
## Vectores II: Vectores más complejos                           ##
###################################################################
## Secuencias----
z <- 3:10
z

?seq
seq(from = 1, to = 6, by = 0.2) # El argumento "by" genera frecuencias #
seq(from = 1, to = 6, length.out = 20)  # ¿Cuál es la diferencia con respecto al anterior? 

### Puede empezar desde cualquier punto
seq(from = 530, to = 620, by = 30)

z <- c(1, 3, 9)
z
?rep
rep (z, times = 10)           # ¿Qué ocurre aqui?

#La secuencia de elementos del vector z se repite 10 veces

rep (z, each = 10)  			    # ¿Cuál es la diferencia con la linea anterior?

# Aquí cada uno de los elementos del vector z se repite 10 veces.

## Indexar----
## Para extraer uno o varios elementos de un vector utilice "[]"
## Por favor observa y explica que ocurre en las siguientes lineas:
x
x[5]
x[4]
x[3:5]
x[c(3,5)]
id<-c(1, 9, 2)
x[id]
x[c (1, 9, 2)]
x[-c (1, 9, 2)]

## Ejercicio:----

# Cree un vector con los números de 1 a 100
x <- (1:100)

# Extraiga del vector el elemento numero 87
x[87]

# Extraiga todos los elementos excepto el 87 para crear un nuevo vector "z"
z <- x[-87]

# Verifique la longitud del nuevo vector
length(z)

# PLUS: Extraiga cada segundo elemento del vector
x[seq(from = 1, to = 100, by = 2)]

## Crear un vector vacío de longitud 10 y asigne a su tercer elemento el valor que tiene la suma de x
y <- numeric(10)
y[3] <- sum(x)

## Ejercicio

# Cree un vector vacío de cuatro elementos
a <- numeric(4)

# En el vector vacío indexe para cada posición la primera inicial de sus nombres y apellidos. (Si tiene un solo nombre indexe NA)

a[1] <- "M"
a[2] <- "A"
a[3] <- "B"
a[4] <- "R"
a

###################################################################
##                          NA                                   ##
###################################################################
?NA
e <- c(122, 324, 34, NA, 234) 
mean(e) # porque sale este resultado? con NA no se puede calcular!
?mean
mean(e, na.rm = T) # ahora sin tener en cuenta el NA

is.na(e)        #¿Qué ocurre aquí? me indica cuales son NA
which(is.na(e)) #¿Qué ocurre aquí? me indica la posición del NA

###################################################################
##                      Matrices                                 ##
###################################################################

# La matriz es un conjunto de elementos que son del mismo tipo, ya sea numéricos, de carácter o lógico, distribuidos en dos dimensiones, filas y columnas. 
# [1,] indica la primera fila
# [,1] indica la primera columna


mat <- matrix(data = 1:12, nrow = 3, ncol = 4, byrow = T)
mat
mat[,1]
mat[2,2]
mat[1:3,1:3]
mat[,1]
mat[1,]

# transponer la matriz
mat2 <- t(mat)
mat2
mat

colnames(mat2) <- c("A","B","C")
mat2
rownames(mat2) <-c ("sp1","sp2","sp3","sp4")
mat2
class(mat2[,1])
class(mat2[2,1])

## Ejercicio:----
# Realice una matriz con 11 columnas y 11 filas.
ej <- matrix(data = NA, nrow = 11, ncol = 11)

# incluya en la matriz el número 8 en cada esquina y en la mitad de la matriz
ej[c(1,11),c(1,11)] <- 8
ej[6,6] <- 8
ej

# cbind y rbind
mat
c5 <- c(5,5,5)
cbind(mat, c5)

r4 <- c(4,4,4,4)
rbind(mat, r4)

# rownames y colnames
rownames(mat) <- c("a", "b", "c")
mat

colnames(mat) <- c("E1", "E2","E3","E4")
mat

##       !!! Felicitaciones, ahora has aprendido 
##           sobre el funcionamiento básico de R y Rstudio!!!
