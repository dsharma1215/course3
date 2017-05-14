#Assignment for week4 - Getting and Cleaning data

#read all test files
x_sub_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

#cbind all test files; 2947 obs of 563 variables
test <- cbind(x_sub_test, y_test, x_test)

#read all train files
sub_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

#cbind all train files; 7352 obs of 563 variables
train <- cbind(sub_train, y_train, x_train)

#step 1 for the assignment
#create 1 data set by combining test and train, 10299 obs of 563 variables
alldata <- rbind(test, train)

#read features file to get column name
feat <- read.table("features.txt")

#extarct all mean;std col
a1 <- grep("mean\\(\\)|std\\(\\)", feat$V2)

#we have to add 2 becuase we have 2 extra colums in out dF "alldata"
a1 <- a1 + 2

#step 2 for the assignment
#create data set that contains only subject,activity,mean, std dev
#first rename the first two colums becuae they are duplicated- V1
names(alldata)[1:2] <- c("subject","act")
#stp2 is 10299 obs of 68 variables
stp2 <- select(alldata, subject, act, a1)

#step3 for the assignment
#replace all activity codes in column 2 with activity description
stp2$act[stp2$act=="1"]<- "WALKING"
stp2$act[stp2$act=="2"]<- "WALKING_UPSTAIRS"
stp2$act[stp2$act=="3"]<- "WALKING_DOWNSTAIRS"
stp2$act[stp2$act=="4"]<- "SITTING"
stp2$act[stp2$act=="5"]<- "STANDING"
stp2$act[stp2$act=="6"]<- "LAYING"

#step4 for the assignment
#name all colums in descriptive fashion
#From the features.txt file(already read), get all rows with "mean" or 
# "std" in name
b1 <- grep("mean\\(\\)|std\\(\\)", feat$V2)
myname <- feat[b1,]
#Make names descriptive by subsitituting
# t = "Time"
# f = "Freq"
# () = nothing
mynamevect <- sub("^t", "Time", myname$V2)
mynamevect2 <- sub("^F", "Freq", mynamevect)
mynamevect3 <- sub("\\(\\)", "", mynamevect2)
#get all coulmn names in one vector
myfinalvect <- c("subjectId", "activity", mynamevect3)
#Name columns in dataset stp2 with these new descriptive headings
colnames(stp2) <- myfinalvect
df_labeled <- stp2

#Step5 for the assignment
#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
#data frame - data_final has 180 observations with 68 variables
data_final <- df_labeled %>%
  group_by(subjectId,activity) %>%
  summarise_each(funs(mean))
