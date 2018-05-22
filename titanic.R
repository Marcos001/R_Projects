
# read databases
train <- read.csv('/media/nig/Data/Titanic/train.csv')
test <- read.csv('/media/nig/Data/Titanic/test.csv')

# devolve as colunas de um dataframe
names(train)

# vendo os rotulos e a quantidade
table(train$Survived)

# vendo a porcentagens de passageiros que mortes e sobreviventes
prop.table(table(train$Survived))

# analisando dados entre homens e mulheres
homens <- train[train$Sex == 'male',]
mulheres <- train[train$Sex == 'female',]

# vendo a porcetagem de homens e mulheres que sobreviveram
prop.table(table(homens$Survived))
prop.table(table(mulheres$Survived))

# analisando os pasageiros com idade inferior a 5 anos
## corrigindo campus em nulos da idade
passageiros_com_idade <- train[!is.na(train$Age),]
idade_media <- mean(passageiros_com_idade$Age)

## preencendo as colunas mulas com a media de idades
train[is.na(train$Age),]$Age <- idade_media

criancas <- train[train$Age < 5, ]

## sera que a maioria das criancas foram salvas do desastre
prop.table(table(criancas$Survived))

library(rpart)

arvore <- rpart(Survived ~ Age + Sex + Pclass + Fare, data=train, method="class")

# source
## http://blog.caelum.com.br/r-titanic-e-data-science/ ##



