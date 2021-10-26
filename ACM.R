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
                     (SNP_Pass$freq_gros_11 == 1 & SNP_Pass$freq_maigre_00 + SNP_Pass$freq_maigre_11 ==1) |
                       
                       (SNP_Pass$freq_maigre_00 == 1 & SNP_Pass$freq_gros_01 + SNP_Pass$freq_gros_11 ==1) |
                       (SNP_Pass$freq_maigre_01 == 1 & SNP_Pass$freq_gros_11 + SNP_Pass$freq_gros_00 ==1) |
                       (SNP_Pass$freq_maigre_11 == 1 & SNP_Pass$freq_gros_00 + SNP_Pass$freq_gros_11 ==1)
                       
                       ),])










