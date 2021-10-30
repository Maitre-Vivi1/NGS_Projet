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

SNP_Pass <- cbind(SNP_Pass[,c(1:8)],SNP_Pass[,c(13:20)], SNP_Pass[,c(25:28)],
      SNP_Pass[,c(9:12)], SNP_Pass[,c(21:24)], SNP_Pass[,c(29:36)])

# Recodage PID ------------------------------------------------------------

SNP_Pass$F5_GTTTCG.PID[which(is.na(SNP_Pass$F5_GTTTCG.PID))] <- F
SNP_Pass$F5_GTTTCG.PID <- as.factor(SNP_Pass$F5_GTTTCG.PID)
levels(SNP_Pass$F5_GTTTCG.PID) <- c(rep(T,21),F)

SNP_Pass$F6_GTCCGC.PID[which(is.na(SNP_Pass$F6_GTCCGC.PID))] <- F
SNP_Pass$F6_GTCCGC.PID <- as.factor(SNP_Pass$F6_GTCCGC.PID)
levels(SNP_Pass$F6_GTCCGC.PID) <- c(rep(T,25),F)

SNP_Pass$F7_CCGTCC.PID[which(is.na(SNP_Pass$F7_CCGTCC.PID))] <- F
SNP_Pass$F7_CCGTCC.PID <- as.factor(SNP_Pass$F7_CCGTCC.PID)
levels(SNP_Pass$F7_CCGTCC.PID) <- c(rep(T,20),F)

SNP_Pass$F8_TGACCA.PID[which(is.na(SNP_Pass$F8_TGACCA.PID))] <- F
SNP_Pass$F8_TGACCA.PID <- as.factor(SNP_Pass$F8_TGACCA.PID)
levels(SNP_Pass$F8_TGACCA.PID) <- c(rep(T,13),F)

SNP_Pass$F9_GTGGCC.PID[which(is.na(SNP_Pass$F9_GTGGCC.PID))] <- F
SNP_Pass$F9_GTGGCC.PID <- as.factor(SNP_Pass$F9_GTGGCC.PID)
levels(SNP_Pass$F9_GTGGCC.PID) <- c(rep(T,19),F)

SNP_Pass$F10_GTGAAA.PID[which(is.na(SNP_Pass$F10_GTGAAA.PID))] <- F
SNP_Pass$F10_GTGAAA.PID <- as.factor(SNP_Pass$F10_GTGAAA.PID)
levels(SNP_Pass$F10_GTGAAA.PID) <- c(rep(T,23),F)

SNP_Pass$F11_ACAGTG.PID[which(is.na(SNP_Pass$F11_ACAGTG.PID))] <- F
SNP_Pass$F11_ACAGTG.PID <- as.factor(SNP_Pass$F11_ACAGTG.PID)
levels(SNP_Pass$F11_ACAGTG.PID) <- c(rep(T,20),F)

SNP_Pass$F13_GATCAG.PID[which(is.na(SNP_Pass$F13_GATCAG.PID))] <- F
SNP_Pass$F13_GATCAG.PID <- as.factor(SNP_Pass$F13_GATCAG.PID)
levels(SNP_Pass$F13_GATCAG.PID) <- c(rep(T,26),F)


# Recodage modalités ------------------------------------------------------

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

SNP_Pass <- SNP_Pass[-which(SNP_Pass$ALT %in% c("A", "C", "G", "T") == F) ,]

SNP_Pass$F10_alt_ref_gt <- as.factor(ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F10_GTGAAA.GT, "0/0",
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F10_GTGAAA.GT, "1/1",
    ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F10_GTGAAA.GT, "0/1", 
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F10_GTGAAA.GT, "1/0", "AUTRE")))))

SNP_Pass$F11_alt_ref_gt <- as.factor(ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F11_ACAGTG.GT, "0/0",
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F11_ACAGTG.GT, "1/1",
    ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F11_ACAGTG.GT, "0/1", 
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F11_ACAGTG.GT, "1/0", "AUTRE")))))

SNP_Pass$F13_alt_ref_gt <- as.factor(ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F13_GATCAG.GT, "0/0",
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F13_GATCAG.GT, "1/1",
    ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F13_GATCAG.GT, "0/1", 
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F13_GATCAG.GT, "1/0", "AUTRE")))))

SNP_Pass$F9_alt_ref_gt <- as.factor(ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F9_GTGGCC.GT, "0/0",
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F9_GTGGCC.GT, "1/1",
    ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F9_GTGGCC.GT, "0/1", 
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F9_GTGGCC.GT, "1/0", "AUTRE")))))

SNP_Pass$F8_alt_ref_gt <- as.factor(ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F8_TGACCA.GT, "0/0",
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F8_TGACCA.GT, "1/1",
    ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F8_TGACCA.GT, "0/1", 
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F8_TGACCA.GT, "1/0", "AUTRE")))))

SNP_Pass$F7_alt_ref_gt <- as.factor(ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F7_CCGTCC.GT, "0/0",
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F7_CCGTCC.GT, "1/1",
    ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F7_CCGTCC.GT, "0/1", 
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F7_CCGTCC.GT, "1/0", "AUTRE")))))

SNP_Pass$F6_alt_ref_gt <- as.factor(ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F6_GTCCGC.GT, "0/0",
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F6_GTCCGC.GT, "1/1",
    ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F6_GTCCGC.GT, "0/1", 
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F6_GTCCGC.GT, "1/0", "AUTRE")))))

SNP_Pass$F5_alt_ref_gt <- as.factor(ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F5_GTTTCG.GT, "0/0",
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F5_GTTTCG.GT, "1/1",
    ifelse(paste(SNP_Pass$REF,"/",SNP_Pass$ALT, sep ="") == SNP_Pass$F5_GTTTCG.GT, "0/1", 
    ifelse(paste(SNP_Pass$ALT,"/",SNP_Pass$REF, sep ="") == SNP_Pass$F5_GTTTCG.GT, "1/0", "AUTRE")))))

SNP_Pass <- SNP_Pass[,c(1:8,37,9:12,39,13:16,44,17:20,42,21:24,38,25:28,43,29:32,41,33:36,40)]


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





