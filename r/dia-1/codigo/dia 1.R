require(ggplot2); require(gghighlight); require(magrittr); require(dplyr)

# Actividad 1 -------------------------------------------------------------

data <- rio::import(here::here("codigo", "datos-sin-procesar", "owid-covid-data.csv"))

data %>% 
    str()

# Actividad 2 -------------------------------------------------------------

media_casos_chile_enero_2021 <- data %>% 
    filter(location == "Chile") %>% 
    filter(date >= "2021-01-01" & date <= "2021-01-31") %>% 
    group_by(location) %>% 
    summarize(media_casos = mean(new_cases))

# Actividad 3 -------------------------------------------------------------

test_latinoamerica_ultimo_mes <- data %>% 
    filter(continent == "South America") %>% 
    filter(date >= "2021-01-10" & date <= "2021-02-10") %>% 
    filter(!is.na(new_tests)) %>%
    group_by(location) %>% 
    summarize(total_test = sum(new_tests)) %>% 
    arrange(total_test)

# Actividad 4 -------------------------------------------------------------

paises_europa_xmill <- data %>%
    filter(continent == "Europe") %>% 
    filter(!is.na(new_cases_per_million)) %>% 
    group_by(location) %>% 
    summarize(cases_per_million = sum(new_cases_per_million)) %>% 
    arrange(desc(cases_per_million))

# Actividad 5 -------------------------------------------------------------

casos_contientes_2_semanas <- data %>% 
    filter(date >= "2021-01-27" & date <= "2021-02-10") %>% 
    filter(!is.na(new_cases)) %>% 
    group_by(continent) %>% 
    summarize(casos = sum(new_cases))
