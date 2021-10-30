VEPfile <- read.delim("3_annotationVEP/output_gGVCF_sV_vF_SNP_PASS_resVEP.txt",
                      header = FALSE, comment.char = "#",
                      col.names = c("variantID", "pos", "ALT", "gene_id", "transcript_id", "feature",
                                    "consequence", "cDNA_position", "CDS_position", "Protein_position",
                                    "Amino_acids", "Codons", "Existing_variation", "Extra"),
                      stringsAsFactors = FALSE)

VEPfile[10:11 ,] ;dim(VEPfile) 

#Découpage de la dernière colonne
VEPextraParser <- function(VEPres){
  extra <- VEPres$Extra
  cat("Treating the file", deparse(substitute(VEPres)), "composed of", nrow(VEPres), "lines\n")
  cat("Formating step 1/1...")
  extra <- gsub(" \\(.*\\)", "_bracketsRemoved", extra)
  cat(" Done\n")
  
  cat("Splitting the extras...")
  list.splitExtra <- strsplit(extra, ";")
  cat(" Done\n")
  
  cat("Finding all the possible fields...")
  namesOfParsedExtras <- unlist(list.splitExtra)
  namesOfParsedExtras <- gsub("=.*", "", namesOfParsedExtras)
  namesOfParsedExtras <- unique(namesOfParsedExtras)
  
  splitExtra <- matrix(nrow = length(list.splitExtra), ncol = length(namesOfParsedExtras))
  colnames(splitExtra) <- namesOfParsedExtras  
  cat(" Done\n")
  
  cat("Separating field names & content...")
  list.splitExtra <- lapply(list.splitExtra, function(x){unlist(strsplit(x, " "))})
  cat(" Done\n")
  
  cat("Dataframe creation : looping on", length(list.splitExtra), "elements \n0%\n")
  totalSize <- length(list.splitExtra)
  by_percent <- 10
  slice_size <- totalSize / by_percent
  
  for (i in 1:length(list.splitExtra)){
    
    if(totalSize >= 1e3){
      if(i %% round(slice_size, digits = 0) == 0){cat(i / round(slice_size, digits = 0) * by_percent, "%\n")}
    }
    
    length_list.splitExtra_i <- length(list.splitExtra[[i]])
    
    names <- gsub("=.*", "", list.splitExtra[[i]])
    content <- gsub(".*=", "", list.splitExtra[[i]])
    
    # names(list.splitExtra[[i]]) <- list.splitExtra[[i]][rep(seq(from = 1, to = length_list.splitExtra_i, by = 2), each = 2)]
    # list.splitExtra[[i]] <- list.splitExtra[[i]][- rep(seq(from = 1, to = length_list.splitExtra_i, by = 2), each = 2)]
    
    names(content) <- names
    
    
    splitExtra[i, names] <- unname(content)
  }
  
  cat("Done\n")
  
  return(splitExtra)
}


dern_col <- VEPextraParser(VEPfile)

Vep <- cbind.data.frame(VEPfile, dern_col)

pie(table(Vep$consequence),
    col=c("#AAFFAA","#FFEE44","#FFAAAA","red","#FFAAA4","blue","green", "purple", "yellow", 'orange', "pink", "white", "grey"),
    labels=c("3_prime_UTR_variant","downstream_gene_variant","intron_variant,non_coding_transcript_variant",
             "non_coding_transcript_exon_variant","splice_region_variant,intron_variant", "stop_gained",
             "upstream_gene_variant", "5_prime_UTR_variant","intron_variant", "missense_variant","splice_donor_variant",
             "splice_region_variant,synonymous_variant","synonymous_variant "),main="Répartition des conséquences",cex=1.5)



library(ggplot2)
table_cons <- as.data.frame(table(Vep$consequence))
table_cons$perc <- table_cons$Freq/sum(table_cons$Freq)*100
table_cons$perc2 <- paste(round(table_cons$perc,2),"%", sep = " ")
table_cons$Conséquences <- paste(table_cons$Var1, table_cons$perc2, sep = " : " )
bp<- ggplot(table_cons, aes(x="", y=Freq, fill=Conséquences))+
  geom_bar(width = 1, stat = "identity") + theme_minimal()
bp
pie <- bp + coord_polar("y", start=0) + theme_minimal()
pie

vep_cons_codant <- Vep[Vep$consequence == "missense_variant" | Vep$consequence == "stop_gained" | Vep$consequence == "synonymous_variant",]
table_cons2 <- as.data.frame(table(vep_cons_codant$consequence))
table_cons2$perc <- table_cons2$Freq/sum(table_cons2$Freq)*100
table_cons2$perc2 <- paste(round(table_cons2$perc,2),"%", sep = " ")
table_cons2$Conséquences <- paste(table_cons2$Var1, table_cons2$perc2, sep = " : " )
bp<- ggplot(table_cons2, aes(x="", y=Freq, fill=Conséquences))+
  geom_bar(width = 1, stat = "identity") + theme_minimal()
bp
pie <- bp + coord_polar("y", start=0) + theme_minimal()
pie

