![](https://raw.githubusercontent.com/friedue/course_RNA-seq2015/master/wcmc_abc_logo.png)

# RNA-seq course 2015

Here, you can find some additional scripts that go beyond the [course notes](http://chagall.med.cornell.edu/RNASEQcourse/Intro2RNAseq.pdf) and show you how some of the images within the report were produced.

[return to course material website at WCMC](http://chagall.med.cornell.edu/RNASEQcourse/)

### 1. Visualize the STAR alignment information (advanced R)

We aligned 2x48 yeast samples (2 conditions: WT and SNF2 knockout) and wanted to compare the results of the STAR alignment across all 96 samples.
The log files can be found in the folder [01_STAR_logs](https://github.com/friedue/course_RNA-seq2015/tree/master/01_STAR_logs).
An example for how you could visualize the results kept within those 96 log files can be seen in the [pdf file](https://github.com/friedue/course_RNA-seq2015/blob/master/01_Alignment_visualizeSTARresults.pdf), which can be recreated by running the `01_Alignment_visualizeSTARresults.Rmd` file, for example using RStudio.
You can find all the functions and commands used to:

* read in a single STAR log file
* combine the log files for several samples
* make data frames suitable for ggplot2 plotting
* combine various ggplot2 figures into one image


### 2. Visualize the output of multiple RSeQC read_distribution.py runs

This is a simpler exercise than the STAR log file visualization.

If you want to reproduce the figure `02_barplot_readDistributions.png`, download the `.txt` files from the folder [02_readDistribution_input](https://github.com/friedue/course_RNA-seq2015/tree/master/02_readDistribution_input) and carry out the steps detailed in the `.R` script.

![](https://raw.githubusercontent.com/friedue/course_RNA-seq2015/master/02_barplot_readDistributions.png)

### 3. Visualize the relationship between mRIN (TIN) and the experimentally determined RIN

This, too, is a very simple `R` exercise to reproduce figure `03_boxplots_TIN.png`

![](https://raw.githubusercontent.com/friedue/course_RNA-seq2015/master/03_boxplots_TIN.png)

`RSeQC`'s TIN module was run on 4 different BAM files, each obtained from human RNA-seq experiments where the RNA quality was deliberately modified to generate RINs of low (0), medium, and high (9) quality.
In principle, the _in silico_ determined TIN score should correlate very well with the original RIN.
You can read more about it in the [recent publication](http://www.ncbi.nlm.nih.gov/pubmed/26234653) of the _in silico_ RIN method.

`RSeQC`'s output files are `.xls` files, which you can find in the respective [folder](https://github.com/friedue/course_RNA-seq2015/tree/master/03_mRIN_input).
Download those files into your working directory as well as the `.R` script and have a go at the boxplots.

[return to course material website at WCMC](http://chagall.med.cornell.edu/RNASEQcourse/)
