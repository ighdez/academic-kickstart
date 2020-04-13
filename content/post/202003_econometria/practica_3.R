# Practica 3, parte 1
# Introduccion a la econometria
# Jose Ignacio Hernandez

# Numeros aleatorios y ley de los grandes numeros

# Lanzamiento de una moneda

R = 10

tries = runif(R)
tries = round(R)

tries = round(runif(R))

# Histograma
hist(tries)

# Distribuciones de probabilidad relevantes

# Distribucion normal
a = rnorm(1000)
b = rnorm(1000,10,2)

hist(a)
hist(b)

# Distribucion Chi cuadrada
c = rchisq(1000,4)

hist(c)

# Distribucion t student
d = rt(1000,3)
e = rt(1000,50)
f = rt(1000,800)

hist(d)
hist(e)
hist(f)

# Distribucion F
g = rf(1000,2,2)
h = rf(1000,10,10)
i = rf(1000,100,10)

hist(g)
hist(h)
hist(i)
