## PART 1

## save as pollutantmean.R

## Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate)
## across a specified list of monitors. The function 'pollutantmean' takes three arguments:
## 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers,
## 'pollutantmean' reads that monitors' particulate matter data from the directory
## specified in the 'directory' argument and returns the mean of the pollutant
## across all of the monitors, ignoring any missing values coded as NA.
## A prototype of the function is as follows:

## pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## directory is a char vector length 1 indicating location of csv files
  ## pollutant is a char vector length 1 indicating either sulfate or nitrate
  ## id is an int vector indicating monitor id nos tb used

  ## return pollutant mean across all monitors in id vector, ignoring NAs
  ## NO rounding of results
## }

## sample output:

## print(R.version.string)
## [1] "R version 3.4.0 (2017-04-21)"
## source("pollutantmean.R")
## pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064128
## pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706047
## pollutantmean("specdata", "nitrate", 23)
## [1] 1.280833


## PART 2

## save as complete.R

## Write a function that reads a directory full of files
## and reports the number of completely observed cases in each data file.
## The function should return a data frame where the first column
## is the name of the file and the second column is the number of complete cases.
## A prototype of this function follows:

## complete <- function(directory, id = 1:332) {
  ## directory is a char vector length 1 indicating location of csv files
  ## id is an int vector indicating monitor id nos tb used

  ## return data frame of the form:
  ## id nobs
  ## 1 117
  ## 2 1041
  ## ...
  ## where id is monitor id and nobs is no of complete cases
## }

## sample output:

##source("complete.R")
##complete("specdata", 1)
##   id nobs
## 1  1  117
##complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
##complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
##complete("specdata", 3)
##   id nobs
## 1  3  243


## PART 3

## save as corr.R

## Write a function that takes a directory of data files and a threshold
## for complete cases and calculates the correlation between sulfate and nitrate
## for monitor locations where the number of completely observed cases (on all variables)
## is greater than the threshold. The function should return a vector of correlations
## for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement,
## then the function should return a numeric vector of length 0.
## A prototype of this function follows:

## corr <- function(directory, threshold = 0) {
  ## directory is a char vector length 1 indicating location of csv files
  ## threshold is a num vector length 1 indicating no of complete observations
  ## (on all variables) required to compute nit-sulf correlation; default 0

  ## return num vector of correlations
  ## NO rounding of results
## }

## use the 'cor' function in R which calculates the correlation between two vectors
## because of how R rounds and presents floating point numbers,
## the output you generate may differ slightly from the example output:

## print(R.version.string)
## [1] "R version 3.4.0 (2017-04-21)"
## source("corr.R")
## source("complete.R")
## cr <- corr("specdata", 150)
## head(cr)
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
## summary(cr)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313
## cr <- corr("specdata", 400)
## head(cr)
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
## summary(cr)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313
## cr <- corr("specdata", 5000)
## summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
## length(cr)
## [1] 0
## cr <- corr("specdata")
## summary(cr)
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000
## length(cr)
## [1] 323