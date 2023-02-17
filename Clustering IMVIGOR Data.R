#cds counts is the gene expression for each patient 
cdscounts <- read.csv("countcds.csv")
#key with more information on gene data and how it is labelled
cdsfdata <- read.csv("cdsfdata.csv")
#clinical data
cdspdata <- read.csv("cdspdata.csv")
#clinical data but with a smaller group 
fmonepdata <- read.csv("fmonepdata.csv")
rownames(cdscounts) <- cdscounts$X 
#this makes the rows titled by the gene numbers rather than the 1,2,3
cdscounts = subset(cdscounts, select = -c(X) )
#this removes the column that just contains the genes labelled by number 


##How to remove patients in cdspdata with no data in regards to their survival outcome
rownames(cdspdata) <- cdspdata$X 
cdspdata = subset(cdspdata, select = -c(X) )
cdspdata_mod <- cdspdata[complete.cases(cdspdata$binaryResponse),]

##How to determine which rows were removed so that we can remove it from the gene data set
all_rows <- rownames(cdspdata)
kept_rows <- rownames(cdspdata[complete.cases(cdspdata$binaryResponse),])
removed_rows <- setdiff(all_rows, kept_rows)
print(removed_rows)


## Removing Patient Gene Expression Data if there is no survival data on them
columns_to_remove <- c("SAMf2ce197162ce", "SAM698d8d76b934" ,"SAM85e41e7f33f9", "SAMd0e47be700b0", "SAM4edbe45817b3" ,"SAMb8f13a0525a6",
                                   "SAM3f2033c90438", "SAM5ffd7e4cd794" ,"SAM17c45bf16bb6", "SAM9448d858692c" ,"SAM714285adf612", "SAM2dc578e0165f",
                                   "SAM3785587846ce", "SAMaf7578d55754", "SAMbd8ee73983b8" ,"SAM8a42c0d59187" ,"SAM73b653ae20d1" ,"SAM3f446449bf81" ,
                                   "SAM7ee2b6e4d6b3" ,"SAMaff272833538" ,"SAM4581bac493af", "SAM31291c256373" ,"SAM7746b76437e6" ,"SAM7a9093b9c7e9",
                                   "SAMfddc359e862b", "SAMcee0fa8c05b4" ,"SAM3779e979db6b", "SAMbf91f27e7f9b" ,"SAM491e341d5a82", "SAM8e43e9caf307",
                                   "SAM99b1f6a9534e" ,"SAM9681450bbc90" ,"SAM00b9e5c52da9" ,"SAM59b825252c0d", "SAM9eebdef2858a" ,"SAM9b9d48b0b02c",
                                   "SAMff41c4e8c08f", "SAMc97f35a29d16", "SAM95c70496ffb5", "SAM7edacb3deb65" ,"SAM1bcc62d8290c" ,"SAM59289ca42c99",
                                   "SAM1f3c93814cb9", "SAM5fc9ae0aed1f" ,"SAMd5ab7fbfab4e" ,"SAM04c589eb3fb3" ,"SAM4918c524b83a" ,"SAMa0ca029b7afd",
                                   "SAMbe25e2c88f3e", "SAM2de7cffb5f72"
                                   )
cdscounts <- cdscounts[,!(colnames(cdscounts) %in% columns_to_remove)]

#installing packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("multiClust")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("GEOquery")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Biobase")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("preprocessCore")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("ctc")

library(multiClust)
library(Biobase)
library(GEOquery)
library(preprocessCore)
library(ctc)





