#Codebook
**Sølve Heggem**
##Peer Assessments ( https://class.coursera.org/getdata-004 )
##Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Short description
This dataset represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained (See link above).


#Instructions
* Download "run_analysis.R" 
* Run it : source("run_analysis.R") in RStudio
* Wait for about 1 minute while the script download source data and process it.



#The run_analysis.R script performs the following steps to clean the data:   
*Downloads and unzip original data
*Loads the data into R/RStudio
*Merges rows from "Train" and "Test" datasets via rbind command
*Labels the column with headers  via colnames command
*Merges the 3 datasets (x,y and subject) via cbind command
*Extract only the columns with mean/std and writes this to a separate file "measurements_mean_std.csv"
*Creates a second tidy data set with the average of each activity and each subject "tidydataset.csv"
 
