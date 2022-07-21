# install.packages("data.table")
library("data.table")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Format number with fixed width and then append .csv to number
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  # Reading in all files and making a large data.table
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  
  if (c(pollutant) %in% names(dt)){
    return(dt[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
  } 
}

## ALTERNATIVE:

pollutantmean <- function(directory, pollutant, id= 1:332){
  
  ## Create an empty vector of pollutants
  pollutants = c()
  
  ## Get a list of filenames
  filenames = list.files(directory)
  
  ## For each .csv file in id
  for(i in id){
    
    ## Concatinate the directory and filename
    ## e.g. directory = "C:/folder", filenames = vector("001.csv", "002.csv", ...), filepath="C:/folder/001.csv"
    filepath=paste(directory,"/" ,filenames[i], sep="")
    
    ## read in each file and store it in data
    data = read.csv(filepath, header = TRUE)
    
    ##Concatinate the vectors from each file of the pollutant('sulfate' or 'nitrate') column to pollutants vector
    pollutants = c(pollutants, data[,pollutant])
    
  }
  ## Get the mean of the pollutants and remove NA values
  pollutants_mean = mean(pollutants, na.rm=TRUE)
  
  ## Return the mean 'pollutants_mean'
  pollutants_mean
}

# Example usage
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
