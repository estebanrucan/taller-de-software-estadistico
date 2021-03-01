require(dplyr); require(magrittr); require(ggplot2); require(plotly)

data <- rio::import(here::here("codigo", "datos-sin-procesar", "owid-covid-data.csv"))

chile_arg_peru_01_2021 <- data %>% 
    select(location, date, new_cases) %>% 
    filter(location %in% c("Chile", "Argentina", "Peru")) %>% 
    filter(date >= "2021-01-01" & date <= "2021-01-31") %>% 
    filter(!is.na(new_cases))

grafico_actividad <- ggplot(data = chile_arg_peru_01_2021) +
    aes(x = date, y = new_cases, color = location) +
    geom_line(size = 1) +
    labs(x = "Fecha", y = "Casos Nuevos", title = "Nuevos casos por día en enero 2021",
         subtitle = "Chile, Argentina y Perú", caption = "Figura 1") +
    theme_bw() +
    scale_color_manual(labels = c("Arg", "Chi", "Per"), # Nombre de Leyendas
                       values = c("deepskyblue", "red", "gray")) + # Color de Leyendas
    guides(color = guide_legend("País")) # Título de Leyendas
    
grafico_actividad %>% 
    ggplotly
    