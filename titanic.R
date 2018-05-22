
caminho <- "/home/marcos/codes/R_Projects/Titanic/data/"

# read databases
train <- read.csv(paste(caminho,'train.csv', sep = ''))
test <- read.csv(paste(caminho,'test.csv', sep = ''))

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

## representação de arvore ruim
print(arvore)

## bibliotecas graficas para representar uma arvore de decisao
library(rattle)
library(RColorBrewer)
## plota a arvore
fancyRpartPlot(arvore)

# usar a predição da arvore de decisão e fazer o agrupamento dos dados
test$Survived <- 0
submissao = data.frame(PassengerId=test$PassengerId, Survived=test$Survived)

previsao = predict(arvore, test, type = "class")

submissao$Survived = previsao

write.csv(submissao, file = 'predictions/r_submission_tictanic.csv', row.names=FALSE)


# source
## http://blog.caelum.com.br/r-titanic-e-data-science/ ##



