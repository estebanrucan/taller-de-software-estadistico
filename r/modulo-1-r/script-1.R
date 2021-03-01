require(magrittr) # library(magrittr)


# Magrittr ----------------------------------------------------------------

matriz <- matrix(1:100, ncol = 2)
media_columnas <- apply(matriz, 2, mean)

2 * (apply(matrix(1:100, ncol = 2), 2, mean) + 5)

media_matriz <- 1:100 %>% 
    matrix(ncol = 2) %>% 
    apply(2, mean)

vector_1 <- 1:100 %>% 
    * 5   # Error

operacion_correcta <- 1:100 %>% 
    "*" (5)

operacion_correcta

operacion_correcta <- operacion_correcta %>% 
    "/" (3) 

operacion_correcta_media <- operacion_correcta %>% 
    mean

operacion_correcta_median <- operacion_correcta %>% 
    median


# dplyr -------------------------------------------------------------------


install.packages("dplyr")
require(dplyr)

# Filter

# Recibe una condición.
# Muestra las filas que cumplen la condición 
# Contexto de una base de datos.

iris %>% 
    str

filtro_Sepal.Length <- iris %>% 
    filter(Sepal.Length >= 7.4)

filtro_Sepal.Length

# iris[iris$Sepal.Length >= 7.4, ]


# Group_by

# Variables categóricas
# Acompañado de summarize

group_by_Species <- iris %>% 
    group_by(Species) %>% 
    summarize(media_Sepal.Length = mean(Sepal.Length), # Separamos por una coma
              mediana_Sepal.Length = median(Sepal.Length))

group_by_Species


# Mutate

# Creamos base de datos con una nueva columna al final

mutate_iris <- iris %>% 
    mutate(Sepal.Sum = Sepal.Length + Sepal.Width)

mutate_iris

# Summarize debe ir después de group_by, a diferencia de mutate.



# Arrange

arrange_Petal.Length <- iris %>% 
    arrange(Petal.Length)

arrange_Petal.Length

# en orden descendiente

arrange_desc_Petal.Length <- iris %>% 
    arrange(desc(Petal.Length))

arrange_desc_Petal.Length


# Select 

iris %>% 
    names

select_Sepal <- iris %>% 
    select(Sepal.Length, Sepal.Width)

select_Sepal <- iris %>% 
    select(matches("^Sepal"))


selec_Sepal


# Para no seleccionar

not_select_Sepal <- iris %>% 
    select(- Sepal.Length, - Sepal.Width)

not_select_Sepal <- iris %>% 
    select(!c(Sepal.Length, Sepal.Width))

not_select_Sepal <- iris %>% 
    select(- matches("^Sepal"))

not_select_Sepal



# Actividades -------------------------------------------------------------

# 1.

install.packages("rio")
require(rio)

data <- import("https://covid.ourworldindata.org/data/owid-covid-data.csv")

data %>% 
    str

# 2.

pregunta_2 <- data %>% 
    filter(location == "Chile") %>% 
    filter(date >= "2021-01-01" & date <= "2021-01-31") %>% 
    filter(!is.na(new_cases)) %>% 
    select(location, new_cases)

pregunta_2

pregunta_2$new_cases %>% 
    mean

# 3.

pregunta_3 <- data %>% 
    filter(continent == "South America") %>% 
    filter(date >= "2021-01-14" & date <= "2021-02-14") %>% 
    filter(!is.na(new_tests)) %>% 
    group_by(location) %>% 
    summarize(total_test = sum(new_tests)) %>% 
    arrange(total_test)

pregunta_3

# 4. 

pregunta_4 <- data %>% 
    filter(continent == "Europe") %>% 
    filter(!is.na(new_cases_per_million)) %>% 
    group_by(location) %>% 
    summarize(casos_millon = sum(new_cases_per_million)) %>% 
    arrange(desc(casos_millon))

pregunta_4

# Andorra y montenegro

# 5. 

pregunta_5 <- data %>% 
    filter(date >= "2021-02-01" & date <= "2021-02-14") %>% 
    filter(!is.na(new_cases)) %>% 
    group_by(continent) %>% 
    summarize(casos_2_semanas = sum(new_cases))

pregunta_5
