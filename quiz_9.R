1. para cada uno de los tres medidas de la biodiversidad encuentre la función correcta para calcularla.
# número de especies</p> -> specnumber(x)
# Shannon Index</p> -> diversity(x, index = "shannon")
# Simpsons index -> diversity(x, index = "simpson")
	
2. ¿Qué sucede al realizar una anova(lm(y ~ x))?
#A. El resultado será el mismo ya que la anova de una vía funciona igual que la regresión lineal simple***
#B. Obtenemos resultados muy distintos ya que ambas parten de principios estadísticos diferentes
#C. Obtendremos un error ya que no es posible usar la funcion lm dentro de los parámetros de la anova

3. ¿Qué es una regresión lineal?
#A. Es un modelo que estima la relación de dependencia entre una variable dependiente Y y una variable independiente x con una parte aleatoria e***
#B. Es una función con la cuál se estima la linealidad de una variable
#C. Es un estadístico para mirar la semejanza de dos modelos matemáticos y su correspondencia

4. ¿Qué tipo de objeto se utiliza con la función diversity()?
#A. Matriz***
#B. Data frame
#C. Todas las anteriores
  
5. ¿Qué índices de diversidad pueden ser calculados mediante la función diversity()?
#A. Shannon Y Simpson***
#B. Berger-Parker
#C. Singletones
    
6. ¿Cuáles son los parámetros para estimar una línea de tendencia?
#A. Intercepto y pendiente***
#B. Pendiente y residuos
#C. Residuos e intercepto
    
7. Para hacer un análisis de regresión entre dos variables, donde 'x' es la variable independiente y 'y' es la variable dependiente, marque la respuesta correcta:
#A. lm(y~x); plot(x,y); abline(reg)
#B. lm(y,x); plot(x,y); abline("reg")
#C. lm(x,y); plot(x,y); abline(reg)
#D. lm(y\~x); plot(y~x); abline("reg")
    
8. Escoja la forma correcta de realizar una regresión lineal en R
#A. lm(y\~x)***
#B. lm(x,y)
#C. lm(x\~y)
  
9. Una regresión lineal:
#A. Genera una ecuación capaz de predecir el valor de una variable a partir de otra***
#B. Sirve para cuantificar qué tan relacionadas están dos variables entre sí
#C. Genera un modelo que predice la correlación entre dos variables continuas y discretas.
  
10. ¿Qué variables necesitamos en una regresión lineal?
#A. Variable predictora y variable respuesta***
#B. Variable respuesta y variable dependiente
#C. Variable independiente y variable predictora
  
11. ¿Qué es un residuo?
#A. Es la distancia entre la observación y la media de los datos***
#B. Es distancia en el eje x entre la observación y la media de los datos
#C. La resta de las medias de los grupos
  
12. ¿Cómo se obtienen los residuos de la regresión lineal?
#A. reg$residuals***
#B. reg$coefficients
#C. reg$fitted
  
13. En el índice de Shannon-Wiener:
#A. Los valores más altos indican mayor diversidad***
#B. Los valores más bajos indican mayor diversidad
#C. Los valores intermedios indican mayor diversidad

14. ¿Qué se calcula con la suma de cuadrados totales?
#A. La varianza total con respecto a la media global***
#B. La varianza total de los grupos respecto a sus medias
#C. La varianza no explicada
#D. La varianza explicada por los factores
  
15. ¿Con qué función se realiza una regresión lineal en R?</p>{
#A. rlm()
#B. lm()***
#C. glm()

16. En una regresión univariada (ej y ~ x) en 30 observaciones se estima la linea de tendencia. ¿Cuantos grados de libertad tiene esta regresión?
#A. 28***
#B. 29
#C. 30
#D. 27
