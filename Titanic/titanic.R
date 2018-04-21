
# carregando as bibliotecas
library('ggplot2') # visualição
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('mice') # imputation
library('randomForest') # classification algorithm

train <- read.csv('data/train.csv', stringsAsFactors = F)
test <- read.csv('data/test.csv', stringsAsFactors = F)

full  <- bind_rows(train, test) # junta os dados de treinamento e teste

#checa os dados
str(full)

# Engenharia de Recursos
print('-------------------------------------------------\n')

# Pega o título dos nomes dos passageiros
full$Title <- gsub('(.*, )|(\\..*)', '', full$Name)

# Mostrar contagem de títulos por sexo
table(full$Sex, full$)
