# Clase 2: Taller R
# Manuel Barrientos Cifuentes
# Octubre 2020


#Qué es una función? 

#Función de suma
input_1 = 2
input_2 = 3

suma_fun <- function(input_1, input_2 ) {
  output <- input_1 + input_2
  return(output)
}

suma_fun(1,2)

#Función cuadrática
#
cuadratic = function(a,b,c){
  output = (-b + c(-1, 1) * sqrt(b^2 - 4 * a * c))/(2 * a)
  return(output)
}

# x^2 + 5x + 6
a =3  
b =-72
c =49

cuadratic(a,b,c)

#DPLYR

# Instalar paquetes requeridos. Se requiere solo una vez
#install.packages("haven")
#install.packages("dplyr")
#install.packages("ggplot2")
# Abrir paquete 'haven'.
#Clean memory
rm(list=ls())
library(haven)
library(dplyr)
library(ggplot2)

# Abrir base de datos desde internet
db = read_dta(file ="https://ighdez.cl/post/202010_tallerr/casen_r8_r16.dta")

#Hay varios "verbos" útiles en esta libreria. Revisemos algunos

#Select 

db_income = select(db,y_total_hogar, y_trabajo_pc, y_autonomo_pc)

#Esto es muy parecido a subset, qué ganamos con dplyr? 
#Pipes %>% Sirven para combinar funciones. Es literalmente una "cañeria" 

db_income = db %>% select(y_total_hogar, y_trabajo_pc, y_autonomo_pc)


#filter
#Ahora solo utilicemos a las personas de concepción

db_income_conce = db %>% filter(comuna =="8101") %>% 
  select(y_total_hogar, y_trabajo_pc, y_autonomo_pc)

# group_by ciudad, generalmente es más util utilizandolo que summarize


db_income_ = db %>% group_by(comuna)

db_income_mean = db %>% group_by(comuna) %>%  summarize(mean_ing_hogar=mean(y_total_hogar))

#Explotando un poco más estas herramientas

db_income_mean2 = db %>% group_by(comuna,decil) %>%  
    summarize(mean_ing_hogar=mean(y_total_hogar), sd_ing_hogar = sd(y_total_hogar), n = n())


#################
#####GGPLOT2#####
#################

#Definamos cada uno de los objetos
rm(list=ls())
db = read_dta(file ="https://ighdez.cl/post/202010_tallerr/casen_r8_r16.dta")

#Solo datos
ggplot(data=db)
#Datos, y coordenadas
ggplot(data=db, aes(x=y_total_hogar, y=educ))
#Datos, coordenadas, y geoms (scatterplot)

ggplot(data=db, aes(x=y_total_hogar, y=educ)) + geom_point()

#Qué pasó?
db$educ[db$educ == 99] <- mean(db$educ)

#Agreguemosle más detalle

#Nombres a provincias
table(db$provincia)

db$provincia[db$provincia == 81] <- "Concepción"
db$provincia[db$provincia == 82] <- "Arauco"
db$provincia[db$provincia == 83] <- "Biobio"
db$provincia[db$provincia == 161] <- "Diguillin"
db$provincia[db$provincia == 162] <- "Itata"
db$provincia[db$provincia == 163] <- "Punilla"


ggplot(data=db, aes(x=y_total_hogar, y=educ)) + geom_point(aes(col=provincia))

#Gráfico de barras

ggplot(data=db, aes(x=provincia, y=y_total_hogar)) + 
  geom_bar(stat="identity", width = 0.7, fill="coral") +
  labs(title="Ingreso por provincia",
       subtitle="Práctica Taller de R",
       caption= "Fuente: CASEN 2017") + theme_classic()

#Pero, no tiene mucho sentido mostrar los ingresos agregados...¿Qué podríamos hacer?

db_income_mean_prov = db %>% group_by(provincia) %>%  summarize(mean_ing_prov=mean(y_total_hogar))

ggplot(data=db_income_mean_prov, aes(x=provincia, y=mean_ing_prov)) + 
  geom_bar(stat="identity", width = 0.7, fill="coral") +
  labs(title="Ingreso por provincia",
       subtitle="Práctica Taller de R",
       caption= "Fuente: CASEN 2017") + theme_classic()
