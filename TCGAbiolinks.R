# This R script will download and visualize Transcription Profiling and Single Nucleotide Mutation data from the Colon Adenocarcinoma (TCGA-COAD) project using the `TCGAbiolinks` package. 

setwd("~/Desktop/TCGAbiolinks")

# Load the necessary libraries

library(TCGAbiolinks)
library(tidyverse)
library(maftools)
library(pheatmap)
library(SummarizedExperiment)
library(sesame)
library(sesameData)

# get a list of projects
gdcprojects <- getGDCprojects()
View(gdcprojects)

getProjectSummary('TCGA-COAD')

# building a query
query_TCGA <- GDCquery(project  = 'TCGA-COAD',
                  data.category = 'Transcriptome Profiling')

View(query_TCGA)

output_query_TCGA <- getResults(query_TCGA)
View(output_query_TCGA)


# building a query to retrieve gene expression data 
query_TCGA <- GDCquery(project  = 'TCGA-COAD', data.category = 'Transcriptome Profiling', experimental.strategy = 'RNA-Seq',
                       workflow.type = 'STAR - Counts', access = 'open',
                       barcode = c('TCGA-AA-3692-01A-01R-0905-07', 
                                   'TCGA-AA-3662-11A-01R-1723-07', 
                                   'TCGA-AA-A00L-01A-01R-A002-07'))

getResults(query_TCGA)

# download selected expression data -- GDCdownload
GDCdownload(query_TCGA)

# prepare the data 
tcga_coad_data <- GDCprepare(query_TCGA, summarizedExperiment = TRUE)
coad_matrix <- assay(tcga_coad_data, 'unstranded')
View(coad_matrix)

# to get the FPKM dataset
coad_matrix <- assay(tcga_coad_data, 'fpkm_unstrand')
View(coad_matrix)

#download and visualize mutation data from TCGA 

# building a query
query_TCGA <- GDCquery(project  = 'TCGA-COAD',
                       data.category = 'Simple Nucleotide Variation')

View(query_TCGA)


query_mutation <- GDCquery(project = 'TCGA-COAD',
                           data.category = 'Simple Nucleotide Variation',
                           access = 'open',
                           barcode = c('TCGA-AA-3662-01A-01D-1719-10,TCGA-AA-3662-11A-01D-1719-10',
                                        'TCGA-G4-6314-01A-11D-1719-10,TCGA-G4-6314-10A-01D-1720-10'))
                           
output_query_mutation <- getResults(query_mutation)
#View(output_query_mutation)

# download selected  data 
GDCdownload(query_mutation)

maf <- GDCprepare(query_mutation, summarizedExperiment = TRUE)

# maftools utilities to read and create dashboard
maftools.input <- read.maf(maf)

plotmafSummary(maf = maftools.input,
               addStat = 'median',
               rmOutlier = TRUE,
               dashboard = TRUE)

# create oncoplot
oncoplot(maf = maftools.input,
         top = 10,
         removeNonMutated = TRUE)

