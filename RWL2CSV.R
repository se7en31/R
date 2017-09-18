library(dplR)
#setwd("C:/Users/Twitch/Downloads/R-Stuff-From-Aaron")
fileNames <- Sys.glob("*.rwl")
for (fileName in fileNames) {
	tempName<-unlist(strsplit(fileName, split='.', fixed=TRUE))[1]
	tempRwl<-read.rwl(fileName)
	tempBasal<-bai.out(tempRwl,diam=NULL)
	tempCsv<-paste(tempName, "csv", sep=".")
	write.csv(tempBasal,file=tempCsv)
}
