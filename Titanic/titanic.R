
# carregando as bibliotecas
library('ggplot2') # visualição
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('mice') # imputation
library('randomForest') # classification algorithm
library(crayon) # pacote de colorir o texto

train <- read.csv('data/train.csv', stringsAsFactors = F)
test <- read.csv('data/test.csv', stringsAsFactors = F)

full  <- bind_rows(train, test) # junta os dados de treinamento e teste

#checa os dados
str(full)

# Engenharia de Recursos
print('-------------------------------------------------\n')

# Pega o título dos nomes dos passageiros
full$Title <- gsub('(.*, )|(\\..*)', '', full$Name)

cat(yellow('Mostrar contagem de títulos por sexo'))
table(full$Sex, full$Title)

# Titulos de células muito baixas para serem combinados como nível raro
rare_title <- c('Dona', 'Lady', 'the Countess','Capt', 'Col', 'Don',
                'Dr', 'Major', 'Rev', 'Sir', 'Jonkheer')

# Também reatribuir mlle, ms e mme de acordo
full$Title[full$Title == 'Mlle'] <- 'Miss'
full$Title[full$Title == 'Ms'] <- 'Miss'
full$Title[full$Title == 'Mme'] <- 'Mrs'
full$Title[full$Title %in% rare_title] <- 'Rare Title'

cat(yellow('Mostrar contagens de título por sexo novamente'))
table(full$Sex, full$Title)

cat(yellow('Por fim, pegue o sobrenome do nome do passageiro \n'))
full$Surname <- sapply(full$Name, function(x) strsplit(x, split = '[,.]')[[1]][1])

cat(paste('We have <b>', nlevels(factor(full$Surname)), '</b> unique surnames. I would be interested to infer ethnicity based on surname --- another time.'))
