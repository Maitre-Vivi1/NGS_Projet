# Libraries ---------------------------------------------------------------

library(readr)


# Chargement des données --------------------------------------------------

SNP_Pass <- read_delim("VCF/output_gGVCF_sV_VF_SNP_PASS_VariantToTable.table", 
           "\t", escape_double = FALSE, trim_ws = TRUE)


names(SNP_Pass)

