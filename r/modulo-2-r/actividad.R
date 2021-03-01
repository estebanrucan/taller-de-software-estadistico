# Actividad ---------------------------------------------------------------

# Usando la base de datos del Módulo 1, genere un gráfico de lineas para ver 
# la evolución de la cantidad de casos por día en Chile, Argentina y Perú en 
# enero de 2021. ¡Personalizelo a su gusto! Hint: Use dplyr y magrittr.

require(magrittr)
require(dplyr)
require(ggplot2)
require(plotly)
require(rio)

data <- import("https://covid.ourworldindata.org/data/owid-covid-data.csv")

data %>% str

chile_arg_peru <- data %>% 
    filter(location %in% c("Chile", "Argentina", "Peru")) %>% 
    filter(date >= "2021-01-01" & date <= "2021-01-31") %>% 
    filter(!is.na(new_cases)) %>% 
    select(location, date, new_cases)

grafico_actividad <- ggplot(chile_arg_peru) +
    aes(x = date, y = new_cases, color = location) +
    geom_line(size = 1) +
    labs(x = "Fecha", y = "Cantidad de nuevos casos", 
         title = "Cantidad de Nuevos casos Chile, Arg y Perú 01-2021") +
    theme_bw() +
    scale_color_manual(labels = c("Arg", "Chi", "Per"), # Nombre de Leyendas
                       values = c("deepskyblue", "red", "gray")) + # Color de Leyendas
    guides(color = guide_legend("País")) # Título de Leyendas

grafico_actividad

grafico_actividad %>% 
    ggplotly
