#' Obs: Se eu colocar a aspas simples depois do # e der espaço, continua 
#' escrevendo normalmente sem precisar fazer o # toda vez que der espaço
#' 

# Capitulo 5 exercicios
# Reescreva as operações abaixo utilizando pipes %>%.

# log10(cumsum(1:100))
# sum(sqrt(abs(rnorm(100))))
# sum(sort(sample(1:10, 10000, rep = TRUE)))


cumsum(1:100) %>%
log()

rnorm(100) %>%
abs() %>%
sqrt() %>%
sum() 

#5.2 Use a função download.file() e unzip() para baixar e extrair o arquivo 
#do data paper de médios e grandes mamíferos: ATLANTIC MAMMALS. 
#Em seguinda, importe para o R, usando a função readr::read_csv().

library(tidyverse)
download.file(url = "https://esajournals.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1002%2Fecy.2785&file=ecy2785-sup-0001-DataS1.zip", 
              destfile = "ecy2785-sup-0001-DataS1.zip", mode = "wb")

unzip("ecy2785-sup-0001-DataS1.zip")

dp_lm <- readr::read_csv("ATLANTIC_MAMMAL_MID_LARGE _assemblages_and_sites.csv")

#5.3 Use a função tibble::glimpse() para ter uma noção geral dos dados importados 
#no item anterior.

library(tidyverse)
dplyr::glimpse(dp_lm)

#5.4 Compare os dados de penguins (palmerpenguins::penguins_raw e 
#palmerpenguins::penguins). Monte uma série de funções dos pacotes tidyr e dplyr 
#para limpar os dados e fazer com que o primeiro dado seja igual ao segundo.

library(tidyverse)
library(palmerpenguins)

palmerpenguins::penguins_raw
palmerpenguins::penguins

view(penguins_raw)
view(penguins)

#Com `
penguins_raw %>% 
    dplyr::select(Species, Island, `Culmen Length (mm)`:Sex, `Date Egg`) %>% 
    dplyr::rename(species = Species,
                  island = Island,
                  bill_length_mm = `Culmen Length (mm)`,
                  bill_depth_mm = `Culmen Depth (mm)`,
                  flipper_length_mm = `Flipper Length (mm)`,
                  body_mass_g = `Body Mass (g)`,
                  sex = Sex,
                  year = `Date Egg`) %>% 
    tidyr::separate(species, c("species", NA, NA, NA, NA)) %>% 
    dplyr::mutate(sex = stringr::str_to_lower(sex),
                  year = lubridate::year(year))
#com '
penguins_raw %>% 
    dplyr::select(Species, Island, 'Culmen Length (mm)':Sex, 'Date Egg') %>% 
    dplyr::rename(species = Species,
                  island = Island,
                  bill_length_mm = 'Culmen Length (mm)',
                  bill_depth_mm = 'Culmen Depth (mm)',
                  flipper_length_mm = 'Flipper Length (mm)',
                  body_mass_g = 'Body Mass (g)',
                  sex = Sex,
                  year = 'Date Egg') %>% 
    tidyr::separate(species, c("species", NA, NA, NA, NA)) %>% 
    dplyr::mutate(sex = stringr::str_to_lower(sex),
                  year = lubridate::year(year))
#com "
penguins_raw %>% 
    dplyr::select(Species, Island, "Culmen Length (mm)":Sex, "Date Egg") %>% 
    dplyr::rename(species = Species,
                  island = Island,
                  bill_length_mm = "Culmen Length (mm)",
                  bill_depth_mm = "Culmen Depth (mm)",
                  flipper_length_mm = "Flipper Length (mm)",
                  body_mass_g = "Body Mass (g)",
                  sex = Sex,
                  year = "Date Egg") %>% 
    tidyr::separate(species, c("species", NA, NA, NA, NA)) %>% 
    dplyr::mutate(sex = stringr::str_to_lower(sex),
                  year = lubridate::year(year))

#Obs1: Se tiver espaço, tem que colocar acento grave OU as aspas simples,
#ou até a dupla ` ou ' ou "


#5.5 Usando os dados de penguins (palmerpenguins::penguins), calcule a correlação 
#de Pearson entre comprimento e profundidade do bico para cada espécie e 
#para todas as espécies. Compare os índices de correlação para exemplificar o 
#Paradoxo de Simpson.

library(tidyverse)
library(palmerpenguins)
library(ggplot2)


cor(penguins$bill_length_mm, penguins$bill_depth_mm, use = "na.or.complete")
#> [1] -0.2350529

penguins %>%
    dplyr::group_split(species) %>% 
    purrr::map(~cor(.x$bill_length_mm, .x$bill_depth_mm, use = "na.or.complete")
               
#5.6 Oficialmente a pandemia de COVID-19 começou no Brasil com o primeiro caso 
#no dia 26 de fevereiro de 2020. Calcule quantos anos, meses e dias se passou 
#desde então. Calcule também quanto tempo se passou até você ser vacinado.

covid_inicio_br <- lubridate::dmy("26-02-2020")
vacina <- lubridate::dmy("20-07-2021")

intervalo_covid <- lubridate::interval(covid_inicio_br, lubridate::today())
intervalo_vacina <- lubridate::interval(covid_inicio_br, vacina)

lubridate::as.period(intervalo_covid)
#> [1] "1y 11m 18d 0H 0M 0S"
lubridate::as.period(intervalo_vacina)
#> [1] "1y 4m 24d 0H 0M 0S"



