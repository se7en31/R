#load DPLR lib
library(dplR)

#set Working Directory
setwd("C:/Users/Twitch/Downloads/R-Stuff-From-Aaron")

#get list of RWL files in directory
fileNames<-Sys.glob("*.rwl")

#find total amount of files
fileSize<-length(fileNames)

#for loop to read files in, convert them and write them to CSV files.
for (fileName in fileNames) {
	
	#strip file name down(remove extension for saving file name later)
	tempName<-unlist(strsplit(fileName, split='.', fixed=TRUE))[1]

	#read file into Var using read.rwl from DPLR
	tempRwl<-read.rwl(fileName)

	#convert data into basal with bai.out from DPLR
	tempBasal<-bai.out(tempRwl,diam=NULL)

	#set name for CSV file
	tempCsv<-paste(tempName, "csv", sep=".")

	#write out basal data to CVS fil
	write.csv(tempBasal,file=tempCsv)
}
