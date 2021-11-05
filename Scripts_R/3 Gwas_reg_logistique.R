# Gwas --------------------------------------------------------------------

# Une régression logistique par SNP (sauf pour les SNP où maigres et gros sont tous 1/1 ou 0/1)
# 177 reg effectuées 
# la covariable est le fait d'étre 0/1 1/1 ou 0/0
# On réalise un test globale sur cette variable (ligne Anova) pour se rendre compte de son effet
# Plot des résultats dans un manhattant plot
# Les points les plus haut sont ceux avec le plus de contrastes
# Pas de correction sur les p_valeur même si 177 tests du fait du peu de nombre d'individu
# On retrouve les résultats obtenus sur R lors de la semaine de NGS pour un bon seuil choisis


library(car)
res_reg_vect <- list()
res_reg_summ_vect <- list()
p_valvect <- c()
Posi <- c()

for (i in levels(SNP_long2$Pos)) {
  if (sum(SNP_long2$alt_ref[which(SNP_long2$Pos == i)]=="1/1")!=8 &
      sum(SNP_long2$alt_ref[which(SNP_long2$Pos == i)]=="0/1")!=8 &
      length(SNP_long2$alt_ref[which(SNP_long2$Pos == i)]) == 8){
    res_reg <- glm(formula = Grosseur ~ alt_ref, data = SNP_long2[which(SNP_long2$Pos == i),], binomial(link = 'logit'))
    append(res_reg_vect,res_reg)
    append(res_reg_summ_vect, summary(res_reg))
    P_val <- Anova(res_reg, 'III')
    p_valvect <- c(p_valvect, P_val$`Pr(>Chisq)`)
    Posi <- c(Posi, i)
  }
}
Posi <- as.numeric(Posi)

plot(Posi, -log10(p_valvect)) # manhattant plot


select_Gwas25 <- Posi[which(-log10(p_valvect) > 2.5)]
select_Gwas2 <- Posi[which(-log10(p_valvect) > 2)]

select_freq_qualite <- select # ce qu'on avait trouvé avant


select_freq_qualite %in% select_Gwas25 # On en chope 2 sur 4 pour un seuil à 2.5
select_freq_qualite %in% select_Gwas2 # On les chope tous pour un seuil à 2.0 !!!!
