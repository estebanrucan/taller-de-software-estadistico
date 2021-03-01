
# ggplot ------------------------------------------------------------------

# Mucho mejor que la forma de graficar base que incluye R. 
# Mucho más elegante
# Concepto de gramática de gráficos en capas
# Muy personalizable

install.packages("ggplot2")
require(ggplot2) #library(ggplot2)
require(magrittr); require(dplyr)

iris %>% 
    str

# llamar a la función ggplot y digo que base estoy usando
ggplot(data = iris) + 
    aes(x = Sepal.Length, y = Sepal.Width) + # Que info va en el gráfico, y parámetros adicionales
    geom_point() # Que tipo de gráfico quiero ver

ggplot(iris) + 
    aes(Sepal.Length, Sepal.Width) + # Que info va en el gráfico, y parámetros adicionales
    geom_point()

# Aesthetics

# Acá indicamos que tipo de variables van en el gráfico, y parámetros
# según nuestras necesidades

# x: Variable en eje X
# y: Variable eje Y
# color: colorear según Variable categórica
# fill: rellenar de un color según variable categórica

ggplot(data = iris) +
    aes(x = Sepal.Length, y = Sepal.Width, color = Species) +
    geom_point()


# GEOMS

# Qué gráfico queremos ver

# geom_point: Gráfico de puntos, dispersión, scatterplot, etc.

ggplot(data = iris) +
    aes(x = Sepal.Length, y = Sepal.Width, color = Species) +
    geom_point()

# geom_line: gráfico de lineas, para series de tiempo


require(datasets)

data("economics")

economics %>% str

ggplot(data = economics) +
    aes(x = date, y = unemploy) +
    geom_line()

# geom_histogram: Histograma

ggplot(data = iris) +
    aes(x = Sepal.Width) +
    geom_histogram(binwidth = 0.1)

# geom_boxplot: boxplox, gráfico de caja y bigote, etc

ggplot(iris) +
    aes(y = Sepal.Length, fill = Species) +
    geom_boxplot()

# geom_bar: gráfico de barras

ggplot(data = iris) +
    aes(x = Species, fill = Species) +
    geom_bar()

# ARGUMENTOS DE UNA GEOM

# Dentro de un geom se puede agregar:

# - aes()
# - color = "color"

ggplot(data = economics) +
    aes(x = date, y = unemploy) +
    geom_line(color = "dodgerblue")

# - fill = "color"

ggplot(data = iris) +
    aes(x = Sepal.Width) +
    geom_histogram(fill = "deepskyblue1", color = "dodgerblue4")

# - linetype: Que tipo de linea queremos ver
# Por ejemplo "longdash", "dotted", "dashed", etc.


ggplot(data = economics) +
    aes(x = date, y = unemploy) +
    geom_line(color = "dodgerblue", linetype = "longdash")

# - size: tamaño de la linea o punto

ggplot(data = iris) +
    aes(x = Sepal.Length, y = Sepal.Width, color = Species) +
    geom_point(size = 3)

# - alpha: Porcentaje de solidez del gráfico (añade transparencia)

ggplot(data = iris) +
    aes(x = Sepal.Length, y = Sepal.Width, color = Species) +
    geom_point(size = 3, alpha = 0.2) # Valor entre 0 y 1

ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3)

# LABS

# Capa para indicar título, Nombres de Ejes, Subtítulo y "caption"

ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1")

# LIMS: Poner límites del gráfico

ggplot(data = iris) +
    aes(x = Sepal.Length, y = Petal.Length, color = Species) +
    geom_point() +
    lims(x = c(6, 8), y = c(4, NA))

# Temas

# theme_gray()
ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1") +
    theme_gray()


# theme_bw()
ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1") +
    theme_bw()

# theme_linedraw()
ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1") +
    theme_linedraw()

# theme_ligth()
ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1") +
    theme_light()

# theme_dark()
ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1") +
    theme_dark()

# theme_minimal()
ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1") +
    theme_minimal()


# theme_classic()
ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1") +
    theme_classic()

# theme_void()
ggplot(data = iris) +
    aes(x = Sepal.Length) +
    geom_histogram(aes(y = ..density..), color = "deepskyblue4", fill = "deepskyblue3", alpha = 0.3) +
    labs(x = "Sepal Length", y = "Frecuencia", 
         title = "Histograma",
         subtitle = "Sepal Length",
         caption = "Gráfico 1") +
    theme_void()

# bbcplot: Gráficos de BBC News

# GGPLOT COMO UN OBJETO

# Se pueden guardar gráficos para usarlos más tarde
# Guardar distintas geoms

grafico_1 <- ggplot(data = economics) +
    aes(x = date, y = unemploy) +
    geom_line(color = "dodgerblue", linetype = "longdash") +
    labs(x = "Fecha", y = "Desempleo", title = "Desempleo en el tiempo") +
    theme_minimal()

grafico_Sepal.Length <- ggplot(data = iris) +
    aes(x = Sepal.Length)


# Histograma
grafico_Sepal.Length +
    geom_histogram(color = "dodgerblue4", fill = "dodgerblue3", alpha = 0.5)

# Boxplot

grafico_Sepal.Length +
    geom_boxplot(aes(fill = Species)) +
    coord_flip()

# Gráficos interactivos

install.packages("plotly")
require(plotly)

grafico_1

grafico_1 %>% 
    ggplotly


