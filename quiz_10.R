1. ¿Cuáles son las pruebas estadísticas adecuadas para los siguientes tipos de datos? Por favor tenga en cuenta que "y" es la variable dependiente y "x" la variable independiente.
# mode(y) == "numeric"; mode(x) == "numeric" -> Regresión
# mode(y) == "numeric"; mode(x) == "factor" -> ANOVA
# mode(y) == "factor"; mode(x) == "factor" -> esta caso no fue tratado en el curso
# mode(y) == "numeric"; mode(x1) == "numeric"; mode(x2) == "numeric" -> Regresión mÚltiple
  
2. El Criterio de información de Akaike es útil para
#A. Evaluar la calidad de un modelo estadístico
#B. Seleccionar entre modelos estadísticos con diferente numero de parámetros***
#C. Probar relaciones significativos en un modelo estadístico
  
3. El coeficiente de Prelación "r" toma valores entre:
#A. 0:1
#B. -1:1***
#C. -1:0

4. ¿Cuál es la diferencia entre la regresión lineal lm() y la correlación cor()?
#A. En la función cor() no es necesario que exista una variable dependiente y una independiente***
#B. En una regresión lineal solo existen variables dependientes
#C. Ambas funcionees funcionan de la misma manera
  
5. ¿Con qué función podemos comprobar una posible colinealidad entre variables?
#A. cor()***
#B. lm()
#C. reg()

6. ¿Cuál es un ejemplo de colinealidad en las variables independiente?
#A. Valores altos de r2 con predictores no significativos
#B. Valores bajos de r2 con predictores no significativos
#C. Valores altos de r2 con predictores significativos
  
7. ¿Mediante que función se calcula el factor de inflación de la varianza en R?
#A. vif()
#B. vfi()
#C. viff()
  
8. ¿Qué se calcula mediante el factor de inflación de la varianza?
#A. Cuanta varianza de un coeficiente de regresion es inflada debido a la colinearidad***
#B. Cuanta varianza es explicada por la dependencia entre dos variables
#C. El ajuste de la linea de tendencia debido a la varianza
  
9. ¿Cómo podemos ajustar una regresión lineal múltiple entre una variable dependiente "y" y 3 variables independientes "x1", "x2" y "x3"?
#A. lm(y ~ x1 + x2 + x3, data = dat)***
#C. lm(y ~ x1,x2,x3, data = dat)
#D. lm(y + x1+x2+x3, data = dat)
#B. lm(y ~ x1x2x3, data = dat)

10. ¿Con qué función podemos seleccionar los predictores en una regresión lineal múltiple?
#A. step()***
#B. step_lm()
#C. select()
#D. steep()