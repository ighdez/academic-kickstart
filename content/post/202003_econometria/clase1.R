# Elementos basicos de R
# Introduccion a la econometria
# Jose Ignacio Hernandez
# Marzo 2020

# Parte 1: Objetos y funciones basicas

# Escalares
a = 1                           # Crear un objecto que contenga un escalar
b = a + 2                       # Crear un objeto a partir de otro

# Imprimir objeto en pantalla
print(a)
print(b)

# Operaciones fundamentales
a + b                           # Suma
a - b                           # Resta
a * b                           # Multiplicacion
a / b                           # Division
c = a + b                       # Es posible definir un objeto con una operacion entre objetos

# Otras funciones basicas
d = c                           # Copiar un objeto
rm(d)                           # Eliminar un objeto

# Parte 2: Vectores
d = c(a,b,c)                    # Crear un vector usando 3 escalares
e = c(c,b,a)                    # Los vectores respetan el orden en el que los datos fueron ingresados
print(d)
print(e)
length(d)
length(e)

d + e                           # Suma de vectores
a * e                           # Multiplicacion escalar - vector
d * e                           # Multiplicacion elemento por elemento
d%*%e                           # Producto punto

c(d,e)                          # Concatenar vectores
cbind(d,e)                      # Concatenar vectores como columnas de una matriz
rbind(d,e)                      # Concatenar vectores como filas de una matriz

# Parte 3: Matrices
f = cbind(d,e)                  # Definir matrices
g = rbind(d,e)

h = matrix(1:9,3,3)             # Definir una matriz de 1 a 9 (1:9), de 3x3
i = matrix(1:9,3,3,byrow=TRUE)  # Misma operacion pero ordenando elementos por fila
j = matrix(c(1,6,5,9),2,2)      # Podemos definir elementos uno a uno

h + i                           # Suma de matrices (deben tener la misma dimension)
a * h                           # Multiplicacion por escalar
h * i                           # Multiplicacion elemento por elemento (deben tener la misma dimension)
f%*%g                           # Multiplicacion de matrices (debe respetar reglas de dimensiones)
g%*%f                           # La multiplicacion de matrices no es conmutativa

solve(j)                        # Inversa de una matriz
det(j)                          # Determinante de una matriz

# Algunas funciones adicionales como ayuda
r = 1:10                        # Secuencia simple
s = seq(1,10,by=2)              # Secuencia con saltos de 2 en 2

t = rep(1,10)                   # Repeticion simple
u = rep(d,3)                    # Repeticion de un vector 3 veces
v = rep(d,each=2)               # Cada elemento se repite 2 veces
w = rep(d,3,each=2)             # Cada elemento se repite 2 veces, y a su vez esta secuencia se repite 3 veces

help(rep)                       # Ayuda (muy util!)