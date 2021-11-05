# 5,6,7,8,9,10,11,13
# 5 13 7 10 fat
# 6 8  9 11 lean

# -------------------------------------------------------------------------


GM000111<- rep(F,509)
GM000111[which(SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1)] <- T

MG000111<- rep(F,509)
MG000111[which(SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1)] <- T


SNP_long<- data.frame(
  
  indiv = as.factor(c(rep(5,509),rep(6,509),rep(7,509),rep(8,509),rep(9,509),rep(10,509),rep(11,509),rep(13,509))),
  
  GT = as.factor(c(as.character(SNP_Pass$F5_GTTTCG.GT), as.character(SNP_Pass$F6_GTCCGC.GT),
                   as.character(SNP_Pass$F7_CCGTCC.GT), as.character(SNP_Pass$F8_TGACCA.GT),
              as.character(SNP_Pass$F9_GTGGCC.GT), as.character(SNP_Pass$F10_GTGAAA.GT), as.character(SNP_Pass$F11_ACAGTG.GT),
              as.character(SNP_Pass$F13_GATCAG.GT))),
  
  alt_ref = as.factor(c(as.character(SNP_Pass$F5_alt_ref_gt),as.character(SNP_Pass$F6_alt_ref_gt),
                                  as.character(SNP_Pass$F7_alt_ref_gt),as.character(SNP_Pass$F8_alt_ref_gt),
                                as.character(SNP_Pass$F9_alt_ref_gt),as.character(SNP_Pass$F10_alt_ref_gt),
                                as.character(SNP_Pass$F11_alt_ref_gt),as.character(SNP_Pass$F13_alt_ref_gt))),
  
  Phase =  c(SNP_Pass$F5_GTTTCG.PID, SNP_Pass$F6_GTCCGC.PID, SNP_Pass$F7_CCGTCC.PID, SNP_Pass$F8_TGACCA.PID,
                              SNP_Pass$F9_GTGGCC.PID, SNP_Pass$F10_GTGAAA.PID, SNP_Pass$F11_ACAGTG.PID,
                              SNP_Pass$F13_GATCAG.PID),
  
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
  
  Pos = as.factor(rep(SNP_Pass$POS, 8)),
  
  
  DP = as.numeric(c(as.character(SNP_Pass$F5_GTTTCG.DP), as.character(SNP_Pass$F6_GTCCGC.DP), as.character(SNP_Pass$F7_CCGTCC.DP),
                   as.character(SNP_Pass$F8_TGACCA.DP),
                   as.character(SNP_Pass$F9_GTGGCC.DP), as.character(SNP_Pass$F10_GTGAAA.DP), as.character(SNP_Pass$F11_ACAGTG.DP),
                   as.character(SNP_Pass$F13_GATCAG.DP)))
  
)

for (i in levels(SNP_long$Pos)) {
  SNP_long$DP[which(SNP_long$Pos == i)] <- mean(SNP_long$DP[which(SNP_long$Pos == i)])
}

SNP_long$Phase<- as.factor(SNP_long$Phase)
levels(SNP_long$Phase) <- c(T,F)
SNP_long <- SNP_long[order(SNP_long$Pos),]
SNP_long2 <- SNP_long[which(SNP_long$GT != "./."),]
SNP_long2$Pos <- as.factor(as.character(SNP_long2$Pos))

# -------------------------------------------------------------------------




