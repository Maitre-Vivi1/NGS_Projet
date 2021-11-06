# -------------------------------------------------------------------------

SNP_long3 <- SNP_long[which(SNP_long$DP >= 80),]
# Qualité suffisante

SNP_long3 <- SNP_long3[which(SNP_long3$maigre_00_gros_01_gros11 | SNP_long3$gros_00_maigre_01_maigre11),]
# Avec un gros contraste


summary(as.factor(as.character(SNP_long3$Pos)))
# 4 candidats

select <- names(summary(as.factor(as.character(SNP_long3$Pos))))
select
 