# RNA-seq course

__Applied Bioinformatics Core, WCMC__

Here, you can find some additional scripts that go beyond the course notes. 

### 1. Visualize the STAR alignment information (advanced R)

We aligned 2x48 yeast samples (2 conditions: WT and SNF2) and wanted to compare the results of the STAR alignment across all 96 samples.
The result can be seen in the pdf file, which can be recreated by running the 01_Alignment_visualizeSTARresults.Rmd file in RStudio.
You can find all the functions and commands used to:

* read in the STAR log file
* combine the log files for several samples
* make data.frames suitable for ggplot2 plotting
* combine various ggplot2 figures into one image


### 2. Visualize the output of multiple RSeQC read_distribution.py runs

This is a simpler exercise than the STAR log file visualization.

If you want to reproduce the figure 02_barplot_readDistributions.png, download the .txt files from the folder 02_readDistribution_input and carry out the steps detailed in the .R script.
