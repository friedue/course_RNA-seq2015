## Turn the output of RSeQC's read_distribution.py run on multiple samples
## into a bar chart
#############################################################################
## to run this script as is, save the example .txt files (from the folder readDistribution_input)
## in your current working directory
##############################################################################

## get all file names
files <- list.files(pattern = "readDistribution_UHR", full.names = TRUE)

## source the following function
ReadIn_ReadDistrbution <- function(FileName){
  # This function takes the output that is printed to the screen by RSeQC's read_distribution.py 
  # If samples and replicates should be filled in as well,
  # this function expects that the RSeQC output was parsed to a .txt file
  # named readDistribution_SAMPLENAME_REPLICATENUMBER.txt
  # e.g.: read_distribution.py -i ${BAM} -r referenceGenomes/human/hg19_RefSeq.bed > readDistribution_${SAMPLENAME}_${REPLICATE}.txt
  
  in.df <- read.table(FileName, skip = 4, stringsAsFactors = FALSE, fill=TRUE, header=TRUE)[c("Group", "Tags.Kb")]
  in.df <- in.df[complete.cases(in.df),]
  in.df <- transform(in.df,
                     Sample = gsub(".*readDistribution_([a-zA-Z0-9]*)[_-]*([A-Z0-9]*).*\\.txt","\\1", FileName),
                     Replicate = gsub(".*readDistribution_([a-zA-Z0-9]*)[_-]([A-Z0-9]*).*\\.txt","\\2",FileName)
  )
  return(in.df)
}

## read in all files (produces a list of data frames)
readDistribution <- lapply(files, function(x) ReadIn_ReadDistrbution(x))

## concatenate all data.frames from the list into one big data.frame
readDistribution <- as.data.frame(do.call(rbind, readDistribution))

## make the plot
library(ggplot2)

P <- ggplot(data = subset(readDistribution, Tags.Kb > 10),
       aes(x=Group, y=Tags.Kb, fill = Replicate)) +
    geom_bar(stat="identity", position = position_dodge()) +
    theme_bw(base_size = 14) +
    theme(legend.position="bottom") +
    coord_flip() +
    ylab("Tags per kb") +  ggtitle("Tags per kb > 10") + xlab("") +
    scale_fill_manual(values = c("forestgreen","darkseagreen","green","limegreen"))

print(P)
