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


#5.5 Usando os dados de penguins (palmerpenguins::penguins), calcule a correlação 
#de Pearson entre comprimento e profundidade do bico para cada espécie e 
#para todas as espécies. Compare os índices de correlação para exemplificar o 
#Paradoxo de Simpson.



#5.6 Oficialmente a pandemia de COVID-19 começou no Brasil com o primeiro caso 
#no dia 26 de fevereiro de 2020. Calcule quantos anos, meses e dias se passou 
#desde então. Calcule também quanto tempo se passou até você ser vacinado.


