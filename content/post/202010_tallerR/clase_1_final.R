# Clase 1: Taller R
# Jose Ignacio Hernandez
# Octubre 2020

# Instalar paquetes requeridos. Se requiere solo una vez
# install.packages("foreign")

# Abrir paquete 'foreign'. Permite leer bases de datos Stata. Se debe hacer en cada nueva sesión de R
library(foreign)

# Abrir base de datos desde internet
dat = read.dta("https://ighdez.cl/post/202010_tallerR/clase_1_final.R")

# Slice
dat_10vars = dat[,1:10]                                 # 10 primeras variables
dat_100obs = dat[1:100,]                                # 100 primeras observaciones
dat_10vars = dat[1:10,1:10]                             # Combinacion

# Definir objetos
escolaridad =  dat$esc                                          # Años de escolaridad
y_total_pc = dat$y_total_hogar  / dat$tot_per                         # Ingreso total per capita

ingresos = cbind(y_total_pc,dat$y_trabajo_pc,dat$y_autonomo_pc)     # Variables de ingreso
colnames(ingresos) = c("y_total_pc","y_trabajo_pc","y_autonomo_pc")

# Estadistica descriptiva sobre la base de datos
summary(dat)            # Estadistica descriptiva relevante para cada columna
summary(dat$esc)        # Solo para escolaridad
summary(escolaridad)    # Para un elemento creado
summary(ingresos)       # Para un elemento compuesto de varias columnas

min(y_total_pc)         # Minimo
max(y_total_pc)         # Maximo
mean(y_total_pc)        # Media
median(y_total_pc)      # Mediana
sd(y_total_pc)          # Desviacion estandar

mean(ingresos)          # Media de todo el elemento
colMeans(ingresos)      # Media por columnas
apply(ingresos,2,mean)  # Forma mas general (permite aplicar otras formulas por fila-columna)