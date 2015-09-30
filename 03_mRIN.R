## Compare the distribution of mRIN (= TIN) values across different samples
############################################################################
## This script will result in boxplots based on mRIN values calculated by
## RSeQC on 4 example files, named UHR-RIN0 to UHR-RIN9.
## To run the script as is, download the xls files from the respective folder
## into your current working directory.
#############################################################################

## read in the RSeQC results
# list the respective files
TIN.files <- list.files(pattern = "xls")

# lapply will iterate over the list of file names in TIN.files, read the respective
# tables and return a list of data frames where each data frame corresponds to 
# one of the original xls tables
TIN.list <- lapply(TIN.files, function(x) read.table(x, header = TRUE)[c("geneID", "TIN")])

# to give meaningful names to each data frame, we can use regex on the file names
# the regex will have to be adjusted if you use different files
names(TIN.list) <- gsub("UHR-(.*)_Aligned.*", "\\1", TIN.files) 

# make a long data frame that is suitable for ggplot2 plotting
TIN.df <- as.data.frame(do.call(rbind, TIN.list))

# add a column that indicates the sample type for each gene ID and TIN value,
# here, I use the information from the original data frame's name in the TIN.list
# which is kept in the row.names of TIN.df
TIN.df$sample <- gsub("\\.[0-9]+", "", row.names(TIN.df))

# make the boxplots
library(ggplot2)
ggplot(data = TIN.df, aes(x = sample, y = TIN)) + geom_boxplot(notch=TRUE)

# excluding genes with TIN = 0, which are most likely due to lack of read coverage
ggplot(data = subset(TIN.df, TIN > 0), aes(x = sample, y = TIN)) + 
  geom_boxplot(notch=TRUE) +
  theme_bw(base_size = 14) +
  ggtitle("relationship between mRIN (=TIN) and the experimentally determined RIN")
