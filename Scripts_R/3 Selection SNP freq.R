# -------------------------------------------------------------------------

SNP_long2 <- SNP_long[which(SNP_long$DP >= 80),]
# Qualité suffisante

SNP_long2 <- SNP_long2[which(SNP_long2$maigre_00_gros_01_gros11 | SNP_long2$gros_00_maigre_01_maigre11),]
# Avec un gros contraste


summary(as.factor(as.character(SNP_long2$Pos)))
# 4 candidats

select <- c(5432425, 5513019, 5514499, 5528011)
