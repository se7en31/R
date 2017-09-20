library(dplR)
workingDir<-choose.dir(default = "", caption="Choose Directory of RWL files.")
setwd(workingDir)
fileNames<-Sys.glob("*.rwl")
x<-1
my_data<-list()
for (fileName in fileNames) {
	tempName<-unlist(strsplit(fileName, split='.', fixed=TRUE))[1]
	tempRwl<-read.rwl(fileName)
	tempBasal<-bai.out(tempRwl,diam=NULL)
	tempCsv<-paste(tempName, "csv", sep=".")
	write.csv(tempBasal,file=tempCsv)
 	my_data[[x]] <- tempBasal
	x<-x+1
}
combTemp<-combine.rwl(my_data, y=NULL)
write.csv(combTemp,file="Master_CSV.csv")