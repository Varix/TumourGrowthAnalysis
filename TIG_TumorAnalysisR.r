## Wes' Mixed Model Anova Script for Tumour Growth Analysis Built for the Tumour Immunology Group and the National Centre for Asbestos Related Diseases

## Only Need to Install the first time
install.packages("afex")
install.packages("emmeans")

library("afex")
library("emmeans")

## Varibles to Change
fileName <- "XX_MixedModelAnalysis" ## Change to your file name 
TumourData <- YourDATAframeNAME  # Change 'YourDATAframeNAME' to your data frame
g1 <- "1" #change to Treatment Group 1 you want to compare
g2 <- "2" #change to Treatment Group 2 you want to compare


# RunThisOnce / There is no need to edit this function 
OutputAnalysis <- function(WesMMA) {
  
  ## Get Todays Date
  today <- Sys.Date()
  
  ## Remove Nulls & Select Treatment Groups
  WesMMA <- subset(WesMMA[!is.na(WesMMA$measure),],Tx %in% c(g1,g2))
  
  ## Convert to Factors / Integers, Run this each time you change datasets
  
  WesMMA$Sample <- as.factor(WesMMA$Sample)
  WesMMA$Tx <- as.factor(WesMMA$Tx)
  WesMMA$Time <- as.factor(WesMMA$Time)
  WesMMA$measure <- as.integer(WesMMA$measure)
  
  CoverT <- "Wes' Mixed Model Analysis for Tumour Growth for TIG / NCARD"
  mixed_model <- mixed(measure~Time*Tx+(1|Sample), data=WesMMA)
  emmeansModel <- emmeans(mixed_model,~Tx|Time)
  pairwiseModel <- contrast(model4, method = "pairwise")
  OutPutFileFinal <- paste(today,"_",fileName,".txt", sep="")
  sink(OutPutFileFinal, append=TRUE, split=TRUE)
  cat(CoverT,"\n",fileName," - ",format(today, "%d %b %Y"),"\n", sep="")
  print(mixed_model)
  cat("\n [- emmeans -] \n")
  print(emmeansModel)
  cat("\n [- pariwise -] \n")
  print(pairwiseModel)
  sink()
  return(mixed_model)
}


## Running the mixed Model Anova Type 3, KR-method
## OutputFile contains emmeans & pairwise contrast
OutputAnalysis(TumourData)
