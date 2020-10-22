# Clase 3: Taller R
# Jose Ignacio Hernandez
# Octubre 2020

# Instalar paquetes requeridos. Se requiere solo una vez
# install.packages("foreign")

# Abrir paquete 'foreign'. Permite leer bases de datos Stata. Se debe hacer en cada nueva sesión de R
library(foreign)

# Abrir base de datos desde internet
dat = read.dta("https://ighdez.cl/post/202010_tallerR/casen_r8_r16_v2.dta")

# Limpiar base de datos
dat = na.omit(dat)

# Descripcion estadistica de los datos
summary(dat)

# Modelo 1: OLS
res_ols = lm(y_trabajo_pc ~ 1 + edad + esc + genero_fem,data=dat)
summary(res_ols)

# Modelo 2: MLE
res_mle = glm(y_trabajo_pc ~ 1 + edad + esc + genero_fem,data=dat,family=gaussian())
summary(res_mle)

# Modelo 1 avanzado
X = cbind(1,dat$edad,dat$esc,dat$genero_fem)
Y = dat$y_trabajo_pc

beta_hat = solve(t(X)%*%X)%*%t(X)%*%Y

# Modelo 2 avanzado

llf<-function(theta){

    # Numero de observaciones
    n = nrow(X)

    # Numero de variables explicativas
    k = ncol(X)

    # Parametros
    beta = theta[1:k]
    sigma2 = theta[k+1]

    # Funcion de error
    e = Y-X%*%beta

    # Funcion de verosimilitud
    logL = -0.5*n*log(2*pi*sigma2)-((t(e)%*%e)/(2*sigma2))

    # Devolver el negativo de la funcion de log-verosimilitud
    return(-logL)

}

# Valores iniciales para iniciar optimizacion
b0 = c(1,0,0,0,1)

llf(b0)

# Optimizar
res_optim = optim(b0,llf,hessian=TRUE,method="BFGS")

#resultados
print(res_optim)