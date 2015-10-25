# Getting and Cleaning Data Project (GACDProjectTidy)

* Adjust the setwd() line at the beginning of the script if you aren't on a unix-based operating system such as Mac OS X, Linux, etc., in other words, if you are using Windows) or if you would prefer a different directory structure.

* The R script contains code to get the raw data from the source website so you don't need to download the data yourself.

* Source the run_analysis.R script using source("run_analysis.R") at the command line in RStudio.

* Two files are generated in the current working directory (~/Desktop/coursera/GADCProjectTidy). The _joinedAndLabeledDataset.txt_ is an intermediary file written at the time that the data was joined and cleaned; _tidyDataset.txt_ is the file containing the __final tidy dataset__ (180 rows (plus header row), 68 columns)

* Run the command    ``` data <- read.table("tidyDataset.txt") ``` in RStudio to read the file. 

