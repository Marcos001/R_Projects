
dados <- matrix(nrow = 10, ncol = 2)
dados[,1] <- c(2.5, 0.5, 2.2, 1.9, 3.1, 2.3, 2.0, 1.0, 1.5, 1.1)
dados[,2] <- c(2.7, 0.7, 2.9, 2.2, 3.0, 2.7, 1.6, 1.1, 1.6, 0.9)

plot(dados)

# normalizar
dados[,1] <- dados[,1]-mean(dados[,1])
dados[,2] <- dados[,2]-mean(dados[,2])

covmat <- cov(dados)

#econtre os autovetores
autovec <- eigen(covmat)$vectors

#calcule os componentes principais
comps<-t(t(autovec)%*%t(dados))

# analisando as variâncias de cada componente
cat("\t\t\t PC1 \t PC2 \n")

cat("Standard deviation \t",  sqrt(var(comps[,1])), "\t", sqrt(var(comps[,2])), "\n")

cat("Proporcion of Variance \t ", cov(comps)[1,1]/sum(diag(cov(comps))), "\t", cov(comps)[2,2]/sum(diag(cov(comps))), "\n")

# função do R que ja faz tudo do PCA




