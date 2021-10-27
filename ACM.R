# Libraries ---------------------------------------------------------------


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



View(SNP_Pass[which( (SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1) |
                     (SNP_Pass$freq_gros_01 == 1 & SNP_Pass$freq_maigre_11 + SNP_Pass$freq_maigre_00 ==1) |
                     (SNP_Pass$freq_gros_11 == 1 & SNP_Pass$freq_maigre_00 + SNP_Pass$freq_maigre_01 ==1) |
                       
                       (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1) |
                       (SNP_Pass$freq_maigre_01 == 1 & SNP_Pass$freq_gros_11 + SNP_Pass$freq_gros_00 ==1) |
                       (SNP_Pass$freq_maigre_11 == 1 & SNP_Pass$freq_gros_00 + SNP_Pass$freq_gros_01 ==1)
                       
                       ),])

selection_candidat <- SNP_Pass[which( (SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1) |
                                        (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1)),]





SNP_Pass <- SNP_Pass[,-c(11,16,6,21,26,31,41,36)]


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
  
  maigre_00_gros_01_gros11 = rep(MG000111,8),
  
  Pos = rep(SNP_Pass$POS, 8),
  
  
  DP = as.vector(as.matrix(SNP_Pass$F5_GTTTCG.DP, SNP_Pass$F6_GTCCGC.DP, SNP_Pass$F7_CCGTCC.DP, SNP_Pass$F8_TGACCA.DP,
                              SNP_Pass$F9_GTGGCC.DP, SNP_Pass$F10_GTGAAA.DP, SNP_Pass$F11_ACAGTG.DP,
                              SNP_Pass$F13_GATCAG.DP))
  
)


SNP_long2 <- SNP_long[which(SNP_long$DP >= 100),]

SNP_long2 <- SNP_long2[which(SNP_long2$maigre_00_gros_01_gros11 | SNP_long2$gros_00_maigre_01_maigre11),]


summary(as.factor(SNP_long2$Pos))


res_reg <- glm(data = SNP_long, Grosseur ~ GT:Phase + freq_maigre_00 + freq_maigre_01 + freq_maigre_11
               + freq_gros_00 + freq_gros_01 + freq_gros_11 + gros_00_maigre_01_maigre11 + 
                 maigre_00_gros_01_gros11 + alt_ref + alt_ref:Phase, binomial(link = 'logit'))

summary(res_reg)

chisq.test(SNP_long$Grosseur, SNP_long$gros_00_maigre_01_maigre11)
chisq.test(SNP_long$Grosseur, SNP_long$maigre_00_gros_01_gros11)




SNP_long2 <- SNP_long[which(SNP_long$GT != "./."),]

res_reg <- glm(data = SNP_long2, Grosseur ~ gros_00_maigre_01_maigre11 + 
                 maigre_00_gros_01_gros11, binomial(link = 'logit'))

summary(res_reg)


chisq.test(SNP_long2$Grosseur, SNP_long2$gros_00_maigre_01_maigre11)
chisq.test(SNP_long2$Grosseur, SNP_long2$maigre_00_gros_01_gros11)

