# Libraries ---------------------------------------------------------------

library(FactoMineR)
library(explor)


# données -----------------------------------------------------------------

donnees <- SNP_Pass[,c(2:5,8,11,14,17,20,23,26)]

View(donnees)


# ACM ---------------------------------------------------------------------

res.mca <- MCA(donnees, quanti.sup = 1)

explor(res.mca)
