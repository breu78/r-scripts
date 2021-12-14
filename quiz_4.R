1. ¿Cuáles son las características principales de los datos tidy?
#A. Cada columna es una variable***
#B. Cada observación es una columna
#C. Cada fila es una observación***
#D. Cada variable es una fila
#E. Cada celda es un valor único***

2. Seleccione la afirmación correcta sobre los tibbles:
#A. A diferencia de los data frames, el método de impresión "print" de un tibble es mas corto y la selección de variables utilizan la coincidencia parcial
#B. Cuando cargamos un tibble, este cambia el nombre de las variables, y la selección de varialbes no se realiza mediante coincidencia parcial
#C. Un tibble no utiliza un método de "print" diferente a un data.frame convencional, y además no modifica el tipo de dato				
#D. Al cargar un set de datos con tibble, este no transforma los datos y su método de impresión por defecto muestra hasta 10 observaciones***

3.Empareje las siguientes funciones de dplyr con su función:
#mutate() <- Añade nuevas variables en función de variables existentes
#select() <- Selecciona variables de acuerdo a su nombre
#filter() <- Selcciona observaciones de acuerdo a sus valores
#summarise() <- Resume cada grupo en menos filas
#arrange() <-Cambia el orden de las observaciones
  
4.¿Cuáles son los caracteres utilizados en tidyR para encadenar funciones?
#A. $
#B. %>% ***
#C. %<%
#D. %->%

5.¿Con cuál función podemos agrupar los resultados en dplyr?
#A. agrupar_por()
#B. group_in()
#C. group_by()***
#D. group.by()

6.Seleccione la opción que describa el resultado generado mediante el siguiente código código:
data %>% 
  group_by(municipio) %>% 
  summarise(mean = mean(elevation), n = n())
#A. Se agruparán los municipios del vector "data" y se promediará el número de observaciones de la variable "elevation"
#B. En cada municipio del vector "data" se mostrará el número de observaciones de elevación y se sumarán sus valores.
#C. Se promediarán los valores de elevación y se mostrará el número de veces que se promedió en cada municipio del vector "data"
#D. Los datos del vector "data" se agruparán de acuerdo al municipio y se promediarán los valores de elevación. Además se mostrará el número de observaciones promediadas en cada municipio ***

7.¿Con cuál argumento crearmos etiquetas a nuestros grupos en summarise?
#A. cur_group()
#B. cur_data()
#C. cur_data_all()
#D. cur_group_id()***

8.Seleccione el argumento con el cual podemos modificar multiples columnas en mutate.
#A. along()
#B. across()***
#C. arrange()
#D. cross()

9.¿Con cuál función de tidy es posible separar caracteres en nuevas columnas?
#A. separade()
#B. separar()
#C. separate()***
#D. separado()

10.Seleccione la forma tidy equivalente al siguiente código:
aggregate(elevation ~ class, data = datA, FUN = mean)
#A. dat %>% group_by(class) %>%  summarise(mean = mean(elevation))***
#B. dat %>% summarise(mean = mean(elevation))
#C. dat <- group_by(class) %>%  summarise(mean = mean(elevation))
#D. group_by(dat%>%class) %>% summarise(mean = mean(elevation))

11.Seleccione la forma correcta de contar el número de vocales en un vector "x" usando el paquete stringr
#A. str_detect(x, "[aeiou]")
#B. str_locate(x, "[aeiou]")
#C. str_match(x, "[aeiou]")
#D. str_count(x, "[aeiou]")***

12.Marque las clases de caracteres pre-creadas que se pueden usar en stringr
#[:punct:]: 
#[:alpha:]: 
#[:lower:]: 
#[:upper:]: 
#[:digit:]: 
#[:alnum:]: 
#[:tonc:]:
#[:bigger:]:
#[:minim:]:
#[:dates:]:

13. Medainte la función "_aggregate()_" podemos realizar operaciones en las dimensiones de un data frame y obtener subconjutos de esta
