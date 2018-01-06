
# Module used only once to create conversion of pdf to text files
# There are many ways to achieve this same process by using pdftotext.exe
# This is only one way (of many) to automate the process
# Pdf's are located on http://www.houstonisd.org/Page/61439
# THere is a small number of them so they were downloaded manually

rm(list = ls()) #clears workspace


#folder with HISD highschool pdf data
dest <- "C://Users/Alpha/Documents/HISD/HISD-highschool-pdf/Advanced_Virtual_Academy_HS.pdf"
folder <- "C://Users/Alpha/Documents/HISD/HISD-highschool-pdf/"

# vector of pdf file names
file_list <- list.files(path=folder, pattern=".pdf", full.names=TRUE)

# convert each PDF file that is named in the vector into a text file 
# text file is created in the same directory as the PDFs
#lapply(file_list, function(i) system(paste('"c://Program FIles/Git/mingw64/bin/pdftotext.exe"', 
#                                         paste0('"', i, '"')), wait = FALSE) )
library("tabulizer")
library(dplyr)
#f <- system.file("C://Users/Alpha/Documents/Machine Learning/HISD-highschool-pdf/Yates_HS.pdf", package="tabulizer")


#Since wall pdf's have the same formatting (no extra rows) we can hard code the area's of the 8 tables
#Every report for all HS's are the same so this only needs to be adjust once if there are any changes

#area=(top,left,bottom,right)
#negate labels
#cood<-locate_areas(dest,pages=1)#School Header data
school_info=c(15,18.2,55,754.2) #School info
stud_prof=c(80,150,300,400)#student profile table
stud_2=c(81,157,296,383)
teach_staff=c(90,540,460,800)#Teacher and Staff Profile table
stud_outcomes=c(320,150,440,400)#Student Outcomes Table
tea_account=c(440,30,480,800)#TEA Accountability
programs=c(480,10,570,800)#School-Based Programs
#STAAR End-Of-Course
#STARR End-Of-Course
#College Bound

#coord<- locate_areas(dest,pages=1)
#for (i in 1:41){
  school_info.data <- extract_tables(file_list[1],pages=1,area=list(school_info),guess=FALSE)
#}
#stud_prof.data <- extract_tables(dest,pages=1,area=list(stud_2),guess=FALSE)
#c()
# <- data.frame(stud_prof.data) #note issue using dataframe input on extract_tables

#out1[[1]][[23]] #column,row
#out2<- extract_areas(dest,pages=1,widget=c("shiny"))
