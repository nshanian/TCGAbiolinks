### Downloading and visualizing data from TCGA database using TCGAbiolinks package

### Introduction

This repoisitory cointains an R workflow for downloading and visualizing Transcription Profiling and Single Nucleotide Mutation data from the Colon Adenocarcinoma (TCGA-COAD) project using the `TCGAbiolinks` package. 

[Click here](https://htmlpreview.github.io/?https://github.com/nshanian/Documents/blob/main/TCGAbiolinks.html) for the HTML version of this R markdown workflow with the output and the embedded plots.

### Goals

This workflow will perform the following analyses:

-   Build a query for expression data 
-   Retrieve gene expression data 
-   Download selected expression data
-   Prepare and visualize expression data (FPKM) 
-   Build a query for mutation data 
-   Retrieve mutation data 
-   Download selected mutation data
-   Create a dashboard and an oncoplot

### Setup

As in a regular R script in RStudio, a single line of code can be run with Command-Enter (Mac OS) or Ctrl-Enter (Windows). Whole chunks of code can be run with Command(/Ctrl) + Shift + Enter **or** by clicking the green "\>" button in the top-right corner of the chunk. Alternatively, these options can also be implemented by selecting lines of code and choosing the desired option from the drop-down menu in the "Run" tab, in the top-right corner of the of Source section of RStudio.

To comment or uncomment a series of lines, highlight the lines and use Command(/Ctrl) + Shift + C.

R packages `TCGAbiolinks`, `tidyverse`, `maftools`, `pheatmap`, `SummarizedExperiment`, `sesame`, and `sesameData` are required for this workflow. 

#### Documentation and References:

`TCGAbiolinks`: 

`tidyverse`: https://www.tidyverse.org/packages/

`maftools`: https://bioconductor.org/packages/release/bioc/html/maftools.html

`pheatmap`:  https://cran.r-project.org/web/packages/pheatmap/index.html

`SummarizedExperiment`: https://bioconductor.org/packages/release/bioc/html/SummarizedExperiment.html

`sesame`: https://bioconductor.org/packages/release/bioc/html/sesame.html

`sesameData`: https://www.bioconductor.org/packages/release/data/experiment/html/sesameData.html

