require(ggplot2); require(gghighlight); require(plotly)
data$new_cases <- ifelse(is.na(data$new_cases), 0, data$new_cases)

casos_1 <- data %>% 
    filter(continent == "South America") %>%
    filter(!is.na(new_cases)) %>% 
    mutate(new_cases_perc = new_cases / population) %>% 
    group_by(location) %>% 
    summarize(median_casos = median(new_cases_perc),
              mean_casos = mean(new_cases_perc)) %>% 
    arrange(desc(median_casos), desc(mean_casos))

casos_1

casos_2 <- data %>% 
    filter(continent == "South America") %>%
    filter(!is.na(new_cases_per_million)) %>% 
    group_by(location) %>% 
    summarize(median_casos = median(new_cases_per_million),
              mean_casos = mean(new_cases_per_million)) %>% 
    arrange(desc(median_casos), desc(mean_casos))

casos_2 

head(data)

# Ejemplo 1

data_chile <- data %>% 
    filter(location == "Chile")

data_continente <- data %>% 
    group_by(continent) %>% 
    summarize(total_cases = sum(new_cases),
              cases_2 = 2 * total_cases)

data_casos <- data %>% 
    select(location, new_cases) %>% 
    filter(location != "World") %>%
    arrange(desc(new_cases))

data <- data %>%
    filter(!is.na(new_cases)) %>% 
    mutate(new_cases_perc = new_cases / population)

data_cases_perc$new_cases_perc

# data <- data %>%
data %<>% 
    filter(!is.na(new_cases_per_million))

data$new_cases %>% mean %>% `+`(5)

# boxplot
# histogram
# line
# ribbon
# col , position = "dodge"
# args: linetype, mapping, color, alpha, fill, group

g1 <- ggplot(casos_2) +
    aes(date, new_cases, color = location) +
    geom_line() +
    gghighlight(location %in% c("Brazil", "Chile", "Argentina")) +
    theme_bw()

ggplotly(g1)