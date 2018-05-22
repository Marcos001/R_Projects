
# read databases
train <- read.csv('/media/nig/Data/Titanic/train.csv')
test <- read.csv('/media/nig/Data/Titanic/test.csv')

# devolve as colunas de um dataframe
names(train)

# vendo os rotulos e a quantidade
table(train$Survived)

# vendo a porcentagens de passageiros que mortes e sobreviventes
prop.table(table(train$Survived))

homens <- train[train$Sex == 'male',]
mulheres <- train[train$Sex == 'female',]

# vendo a porcetagem de homens e mulheres que sobreviveram
prop.table(table(homens$Survived))
prop.table(table(mulheres$Survived))
