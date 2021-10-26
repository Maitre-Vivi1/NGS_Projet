# Libraries ---------------------------------------------------------------

library(readr)


# Chargement des données --------------------------------------------------

# 5 13 7 10 fat
# 6 8  9 11 lean

SNP_Pass <- read_delim("VCF/output_gGVCF_sV_VF_SNP_PASS_PID_VariantToTable.table", 
                                                             "\t", escape_double = FALSE, trim_ws = TRUE)



# Typage ------------------------------------------------------------------

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
SNP_Pass$F9_GTGGCC.AD <- as.factor(SNP_Pass$F9_GTGGCC.AD)
SNP_Pass$F9_GTGGCC.GT <- as.factor(SNP_Pass$F9_GTGGCC.GT)
SNP_Pass$F6_GTCCGC.AD <- as.factor(SNP_Pass$F6_GTCCGC.AD)
SNP_Pass$F6_GTCCGC.GT <- as.factor(SNP_Pass$F6_GTCCGC.GT)
SNP_Pass$F7_CCGTCC.AD <- as.factor(SNP_Pass$F7_CCGTCC.AD)
SNP_Pass$F7_CCGTCC.GT <- as.factor(SNP_Pass$F7_CCGTCC.GT)


# Recodage PID ------------------------------------------------------------

SNP_Pass$F5_GTTTCG.PID[which(is.na(SNP_Pass$F5_GTTTCG.PID))] <- rep(F,491)
SNP_Pass$F5_GTTTCG.PID <- as.factor(SNP_Pass$F5_GTTTCG.PID)
levels(SNP_Pass$F5_GTTTCG.PID) <- c(rep(T,21),F)

SNP_Pass$F6_GTCCGC.PID[which(is.na(SNP_Pass$F6_GTCCGC.PID))] <- rep(F,493)
SNP_Pass$F6_GTCCGC.PID <- as.factor(SNP_Pass$F6_GTCCGC.PID)
levels(SNP_Pass$F6_GTCCGC.PID) <- c(rep(T,25),F)

SNP_Pass$F7_CCGTCC.PID[which(is.na(SNP_Pass$F7_CCGTCC.PID))] <- rep(F,490)
SNP_Pass$F7_CCGTCC.PID <- as.factor(SNP_Pass$F7_CCGTCC.PID)
levels(SNP_Pass$F7_CCGTCC.PID) <- c(rep(T,20),F)

SNP_Pass$F8_TGACCA.PID[which(is.na(SNP_Pass$F8_TGACCA.PID))] <- rep(F,491)
SNP_Pass$F8_TGACCA.PID <- as.factor(SNP_Pass$F8_TGACCA.PID)
levels(SNP_Pass$F8_TGACCA.PID) <- c(rep(T,13),F)

SNP_Pass$F9_GTGGCC.PID[which(is.na(SNP_Pass$F9_GTGGCC.PID))] <- rep(F,498)
SNP_Pass$F9_GTGGCC.PID <- as.factor(SNP_Pass$F9_GTGGCC.PID)
levels(SNP_Pass$F9_GTGGCC.PID) <- c(rep(T,19),F)

SNP_Pass$F10_GTGAAA.PID[which(is.na(SNP_Pass$F10_GTGAAA.PID))] <- rep(F,484)
SNP_Pass$F10_GTGAAA.PID <- as.factor(SNP_Pass$F10_GTGAAA.PID)
levels(SNP_Pass$F10_GTGAAA.PID) <- c(rep(T,23),F)

SNP_Pass$F11_ACAGTG.PID[which(is.na(SNP_Pass$F11_ACAGTG.PID))] <- rep(F,493)
SNP_Pass$F11_ACAGTG.PID <- as.factor(SNP_Pass$F11_ACAGTG.PID)
levels(SNP_Pass$F11_ACAGTG.PID) <- c(rep(T,20),F)

SNP_Pass$F13_GATCAG.PID[which(is.na(SNP_Pass$F13_GATCAG.PID))] <- rep(F,480)
SNP_Pass$F13_GATCAG.PID <- as.factor(SNP_Pass$F13_GATCAG.PID)
levels(SNP_Pass$F13_GATCAG.PID) <- c(rep(T,26),F)


# Recodage modalités ------------------------------------------------------

paste(substr(levels(SNP_Pass$F5_GTTTCG.GT), 1,1), "/", substr(levels(SNP_Pass$F5_GTTTCG.GT), 3,3), sep = "")

levels(SNP_Pass$F5_GTTTCG.GT) <- paste(substr(levels(SNP_Pass$F5_GTTTCG.GT), 1,1),
                                       "/",
                                       substr(levels(SNP_Pass$F5_GTTTCG.GT), 3,3), sep = "")

levels(SNP_Pass$F6_GTCCGC.GT) <- paste(substr(levels(SNP_Pass$F6_GTCCGC.GT), 1,1),
                                       "/",
                                       substr(levels(SNP_Pass$F6_GTCCGC.GT), 3,3), sep = "")

levels(SNP_Pass$F7_CCGTCC.GT) <- paste(substr(levels(SNP_Pass$F7_CCGTCC.GT), 1,1),
                                       "/",
                                       substr(levels(SNP_Pass$F7_CCGTCC.GT), 3,3), sep = "")

levels(SNP_Pass$F8_TGACCA.GT) <- paste(substr(levels(SNP_Pass$F8_TGACCA.GT), 1,1),
                                       "/",
                                       substr(levels(SNP_Pass$F8_TGACCA.GT), 3,3), sep = "")

levels(SNP_Pass$F9_GTGGCC.GT) <- paste(substr(levels(SNP_Pass$F9_GTGGCC.GT), 1,1),
                                       "/",
                                       substr(levels(SNP_Pass$F9_GTGGCC.GT), 3,3), sep = "")

levels(SNP_Pass$F10_GTGAAA.GT) <- paste(substr(levels(SNP_Pass$F10_GTGAAA.GT), 1,1),
                                        "/",
                                        substr(levels(SNP_Pass$F10_GTGAAA.GT), 3,3), sep = "")

levels(SNP_Pass$F11_ACAGTG.GT) <- paste(substr(levels(SNP_Pass$F11_ACAGTG.GT), 1,1),
                                        "/",
                                        substr(levels(SNP_Pass$F11_ACAGTG.GT), 3,3), sep = "")

levels(SNP_Pass$F13_GATCAG.GT) <- paste(substr(levels(SNP_Pass$F13_GATCAG.GT), 1,1),
                                        "/",
                                        substr(levels(SNP_Pass$F13_GATCAG.GT), 3,3), sep = "")


# Alt ref  ----------------------------------------------------------------

substr(SNP_Pass$F10_GTGAAA.GT[1], 1,2)
paste(substr(SNP_Pass$F10_GTGAAA.GT[1], 1,2),substr(SNP_Pass$F10_GTGAAA.GT[1], 3,3), sep = "")

ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F10_GTGAAA.GT, "0/0",
       ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F10_GTGAAA.GT, "1/1",
       ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F10_GTGAAA.GT, "0/1", 
       ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F10_GTGAAA.GT, "1/0", "AUTRE"))))

paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F10_GTGAAA.GT


paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F10_GTGAAA.GT



# Summary -----------------------------------------------------------------

names(SNP_Pass)

summary(SNP_Pass)
