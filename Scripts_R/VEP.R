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




selection_candidats <- SNP_Pass[which( (SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1) |
                                         (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1)),]


View(SNP_Pass[which( (SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1 & SNP_Pass$freq_maigre_11 > 0.25) |
                       (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1 & SNP_Pass$freq_gros_11 > 0.25)),])



View(SNP_Pass[which( (SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1) |
                       (SNP_Pass$freq_gros_01 == 1 & SNP_Pass$freq_maigre_11 + SNP_Pass$freq_maigre_00 ==1) |
                       (SNP_Pass$freq_gros_11 == 1 & SNP_Pass$freq_maigre_00 + SNP_Pass$freq_maigre_01 ==1) |
                       
                       (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1) |
                       (SNP_Pass$freq_maigre_01 == 1 & SNP_Pass$freq_gros_11 + SNP_Pass$freq_gros_00 ==1) |
                       (SNP_Pass$freq_maigre_11 == 1 & SNP_Pass$freq_gros_00 + SNP_Pass$freq_gros_01 ==1)
                     
),])

selection_candidat <- SNP_Pass[which( (SNP_Pass$freq_gros_00 == 1 & SNP_Pass$freq_maigre_01 + SNP_Pass$freq_maigre_11 ==1) |
                                        (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1)),]



dim(selection_candidats[selection_candidats$freq_gros_01 < 0.5,])
row.names(selection_candidats[selection_candidats$freq_maigre_01 < 0.5,])
row.names(selection_candidats)

selection_VEP <- c("510", "846", "964", "988", "989","1080","1114","1124","1128","1874")

Reduce(intersect, list(row.names(selection_candidats), selection_VEP))

