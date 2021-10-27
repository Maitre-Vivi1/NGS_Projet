# Libraries ---------------------------------------------------------------

library(dplyr)
# données -----------------------------------------------------------------

# 5 13 7 10 fat
# 6 8  9 11 lean

tous_commun <- SNP_Pass$F10_alt_ref_gt == SNP_Pass$F13_alt_ref_gt & SNP_Pass$F13_alt_ref_gt == SNP_Pass$F11_alt_ref_gt &
  SNP_Pass$F11_alt_ref_gt == SNP_Pass$F9_alt_ref_gt & SNP_Pass$F9_alt_ref_gt == SNP_Pass$F8_alt_ref_gt &
  SNP_Pass$F8_alt_ref_gt == SNP_Pass$F7_alt_ref_gt & SNP_Pass$F7_alt_ref_gt == SNP_Pass$F6_alt_ref_gt &
  SNP_Pass$F6_alt_ref_gt == SNP_Pass$F5_alt_ref_gt

gras_commun <- SNP_Pass$F10_alt_ref_gt == SNP_Pass$F13_alt_ref_gt & SNP_Pass$F13_alt_ref_gt == SNP_Pass$F7_alt_ref_gt &
  SNP_Pass$F7_alt_ref_gt == SNP_Pass$F5_alt_ref_gt

maigre_commun <- SNP_Pass$F8_alt_ref_gt == SNP_Pass$F6_alt_ref_gt & SNP_Pass$F6_alt_ref_gt == SNP_Pass$F9_alt_ref_gt &
  SNP_Pass$F9_alt_ref_gt == SNP_Pass$F11_alt_ref_gt


gras_vs_maigre <- SNP_Pass$F8_alt_ref_gt == SNP_Pass$F6_alt_ref_gt & SNP_Pass$F6_alt_ref_gt == SNP_Pass$F9_alt_ref_gt &
  SNP_Pass$F9_alt_ref_gt == SNP_Pass$F11_alt_ref_gt & SNP_Pass$F10_alt_ref_gt == SNP_Pass$F13_alt_ref_gt &
  SNP_Pass$F13_alt_ref_gt == SNP_Pass$F7_alt_ref_gt & SNP_Pass$F7_alt_ref_gt == SNP_Pass$F5_alt_ref_gt &
  SNP_Pass$F5_alt_ref_gt != SNP_Pass$F8_alt_ref_gt


View(SNP_Pass[which(gras_vs_maigre),])


# -------------------------------------------------------------------------



# 5 13 7 10 fat
# 6 8  9 11 lean

SNP_Pass$freq_maigre_00 <- ((SNP_Pass$F6_alt_ref_gt == "0/0") + (SNP_Pass$F8_alt_ref_gt == "0/0") + 
  (SNP_Pass$F9_alt_ref_gt == "0/0") + (SNP_Pass$F11_alt_ref_gt == "0/0"))/4

SNP_Pass$freq_maigre_01 <- ((SNP_Pass$F6_alt_ref_gt == "0/1") + (SNP_Pass$F8_alt_ref_gt == "0/1") + 
                              (SNP_Pass$F9_alt_ref_gt == "0/1") + (SNP_Pass$F11_alt_ref_gt == "0/1"))/4

SNP_Pass$freq_maigre_11 <- ((SNP_Pass$F6_alt_ref_gt == "1/1") + (SNP_Pass$F8_alt_ref_gt == "1/1") + 
                              (SNP_Pass$F9_alt_ref_gt == "1/1") + (SNP_Pass$F11_alt_ref_gt == "1/1"))/4




SNP_Pass$freq_gros_00 <- ((SNP_Pass$F5_alt_ref_gt == "0/0") + (SNP_Pass$F7_alt_ref_gt == "0/0") + 
                              (SNP_Pass$F10_alt_ref_gt == "0/0") + (SNP_Pass$F13_alt_ref_gt == "0/0"))/4

SNP_Pass$freq_gros_01 <- ((SNP_Pass$F5_alt_ref_gt == "0/1") + (SNP_Pass$F7_alt_ref_gt == "0/1") + 
                              (SNP_Pass$F10_alt_ref_gt == "0/1") + (SNP_Pass$F13_alt_ref_gt == "0/1"))/4

SNP_Pass$freq_gros_11 <- ((SNP_Pass$F5_alt_ref_gt == "1/1") + (SNP_Pass$F7_alt_ref_gt == "1/1") + 
                              (SNP_Pass$F10_alt_ref_gt == "1/1") + (SNP_Pass$F13_alt_ref_gt == "1/1"))/4



<<<<<<< HEAD


selection_candidats <- SNP_Pass[which( (SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1) |
                                         (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1)),]

=======
View(SNP_Pass[which( (SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1) |
                     (SNP_Pass$freq_gros_01 == 1 & SNP_Pass$freq_maigre_11 + SNP_Pass$freq_maigre_00 ==1) |
                     (SNP_Pass$freq_gros_11 == 1 & SNP_Pass$freq_maigre_00 + SNP_Pass$freq_maigre_01 ==1) |
                       
                       (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1) |
                       (SNP_Pass$freq_maigre_01 == 1 & SNP_Pass$freq_gros_11 + SNP_Pass$freq_gros_00 ==1) |
                       (SNP_Pass$freq_maigre_11 == 1 & SNP_Pass$freq_gros_00 + SNP_Pass$freq_gros_01 ==1)
                       
                       ),])

SNP_Pass <- SNP_Pass[,-c(11,12,16,17,6,7,21,22,26,27,31,32,36,41,42,37)]


# 5,6,7,8,9,10,11,13
# 5 13 7 10 fat
# 6 8  9 11 lean

GM000111<- rep(F,509)
GM000111[which(SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1)] <- T

MG000111<- rep(F,509)
MG000111[which(SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1)] <- T


SNP_long<- data.frame(
  indiv = as.factor(c(rep(5,509),rep(6,509),rep(7,509),rep(8,509),rep(9,509),rep(10,509),rep(11,509),rep(13,509))),
  GT = as.vector(as.matrix(SNP_Pass$F5_GTTTCG.GT, SNP_Pass$F6_GTCCGC.GT, SNP_Pass$F7_CCGTCC.GT, SNP_Pass$F8_TGACCA.GT,
              SNP_Pass$F9_GTGGCC.GT, SNP_Pass$F10_GTGAAA.GT, SNP_Pass$F11_ACAGTG.GT,
              SNP_Pass$F13_GATCAG.GT)),
  alt_ref = as.factor(as.vector(as.matrix(SNP_Pass$F5_alt_ref_gt,SNP_Pass$F6_alt_ref_gt,SNP_Pass$F7_alt_ref_gt,SNP_Pass$F8_alt_ref_gt,
                                SNP_Pass$F9_alt_ref_gt,SNP_Pass$F10_alt_ref_gt,SNP_Pass$F11_alt_ref_gt,SNP_Pass$F13_alt_ref_gt))),
  Phase = as.vector(as.matrix(SNP_Pass$F5_GTTTCG.PID, SNP_Pass$F6_GTCCGC.PID, SNP_Pass$F7_CCGTCC.PID, SNP_Pass$F8_TGACCA.PID,
                              SNP_Pass$F9_GTGGCC.PID, SNP_Pass$F10_GTGAAA.PID, SNP_Pass$F11_ACAGTG.PID,
                              SNP_Pass$F13_GATCAG.PID)),
  Grosseur = as.factor(c(rep("Gros", 509), rep("Maigre",509), rep("Gros",509), rep("Maigre",509*2), rep("Gros",509),
                         rep("Maigre",509), rep("Gros",509))),
  freq_maigre_00 = as.vector(as.matrix(rep(SNP_Pass$freq_maigre_00,8))),
  freq_maigre_01 = as.vector(as.matrix(rep(SNP_Pass$freq_maigre_01,8))),
  freq_maigre_11 = as.vector(as.matrix(rep(SNP_Pass$freq_maigre_11,8))),
  freq_gros_00 = as.vector(as.matrix(rep(SNP_Pass$freq_gros_00,8))),
  freq_gros_01 = as.vector(as.matrix(rep(SNP_Pass$freq_gros_01,8))),
  freq_gros_11 = as.vector(as.matrix(rep(SNP_Pass$freq_gros_11,8))),
  
  gros_00_maigre_01_maigre11 = rep(GM000111,8),
  
  maigre_00_gros_01_maigre_11 = rep(MG000111,8)
  
)



res_reg <- glm(data = SNP_long, Grosseur ~ GT:Phase + freq_maigre_00 + freq_maigre_01 + freq_maigre_11
               + freq_gros_00 + freq_gros_01 + freq_gros_11 + gros_00_maigre_01_maigre11 + 
                 maigre_00_gros_01_maigre_11 + alt_ref + alt_ref:Phase, binomial(link = 'logit'))

summary(res_reg)
>>>>>>> becba6c02a918c21315a0cabe43e52ef57a17539

head(selection_candidats)

dim(selection_candidats[selection_candidats$freq_gros_01 < 0.5,])
row.names(selection_candidats[selection_candidats$freq_maigre_01 < 0.5,])
row.names(selection_candidats)
selection_VEP <- c("510", "846", "964", "988", "989","1080","1114","1124","1128","1874")

Reduce(intersect, list(row.names(selection_candidats), selection_VEP))
