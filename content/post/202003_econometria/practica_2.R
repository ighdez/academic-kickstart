# Practica 2
# Introduccion a la econometria

# Parte 1: Estadistica descriptiva

# Instalar y abrir librerias
install.packages("readxl")
library(readxl)

# Abrir datos
dat = read_xlsx("dat_clase2.xlsx")

summary(dat)

edad = dat$age
ingreso = dat$inc

# Estadistica descriptiva
mean(edad)
median(edad)
sd(edad)

mean(ingreso)
median(ingreso)
sd(ingreso)

# Cuantiles
quantile(edad)
quantile(edad,0.5)
median(edad)

# Histograma
hist(edad)
hist(ingreso)

# Generar numeros aleatorios
a = runif(100)
b = runif(100,0,50)