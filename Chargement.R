# Libraries ---------------------------------------------------------------

library(readr)


# Chargement des données --------------------------------------------------

SNP_Pass <- read_delim("VCF/output_gGVCF_sV_VF_SNP_PASS_VariantToTable.table", 
           "\t", escape_double = FALSE, trim_ws = TRUE)


names(SNP_Pass)

summary(SNP_Pass)

SNP_Pass$CHROM <- as.factor(SNP_Pass$CHROM)
SNP_Pass$REF <- as.factor(SNP_Pass$REF)
SNP_Pass$ALT <- as.factor(SNP_Pass$ALT)
SNP_Pass$F10_GTGAAA.AD <- as.factor(SNP_Pass$F10_GTGAAA.AD)
SNP_Pass$F10_GTGAAA.GT <- as.factor(SNP_Pass$F10_GTGAAA.GT)
SNP_Pass$F11_ACAGTG.AD <- as.factor(SNP_Pass$F11_ACAGTG.AD)
SNP_Pass$F11_ACAGTG.GT <- as.factor(SNP_Pass$F11_ACAGTG.GT)
SNP_Pass$F13_GATCAG.AD <- as.factor(SNP_Pass$F13_GATCAG.AD)
SNP_Pass$F13_GATCAG.GT <- as.factor(SNP_Pass$F13_GATCAG.GT)
SNP_Pass$F5_GTTTCG.AD <- as.factor(SNP_Pass$F5_GTTTCG.AD)
SNP_Pass$F5_GTTTCG.GT <- as.factor(SNP_Pass$F5_GTTTCG.GT)
SNP_Pass$F8_TGACCA.AD <- as.factor(SNP_Pass$F8_TGACCA.AD)
SNP_Pass$F8_TGACCA.GT <- as.factor(SNP_Pass$F8_TGACCA.GT)

=======
ll
>>>>>>> 2af091e9103b0207c377fcacd75e1713c1a1fd48
