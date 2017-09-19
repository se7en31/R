#load DPLR lib
library(dplR)

#set Working Directory
setwd("C:/Users/Twitch/Downloads/R-Stuff-From-Aaron/cores2016")

#get list of RWL files in directory
fileNames<-Sys.glob("*.rwl")

#find total amount of files
fileSize<-length(fileNames)

#set Base Var for later use in for loop, and initialize list
x<-1
my_data<-list()

#for loop to read files in, convert them to Basal
for (fileName in fileNames) {
	
	#strip file name down(remove extension for saving file name later)
	tempName<-unlist(strsplit(fileName, split='.', fixed=TRUE))[1]

	#read file into Var using read.rwl from DPLR
	tempRwl<-read.rwl(fileName)

	#convert data into basal with bai.out from DPLR
	tempBasal<-bai.out(tempRwl,diam=NULL)

	#write CSV file Specific for each file
	tempCsv<-paste(tempName, "csv", sep=".")
	write.csv(tempBasal,file=tempCsv)

	#add current Basal value to list position
 	my_data[[x]] <- tempBasal

	#increase list position by 1
	x<-x+1
}

#create combined list
combTemp<-combine.rwl(my_data, y=NULL)

#write out basal data to CVS file
write.csv(combTemp,file="Master_CSV.csv")