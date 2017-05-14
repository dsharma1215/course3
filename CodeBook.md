---
title: "CodeBook.md"
output: word_document
---

Description : This is README file for Peer graded assignment for Coursera
              course "Getting and Cleaning Data".
              
---------------------------------------------------------------------------

Output for step1

Dataframe - Alldata has 10299 observation of 563 variables

Column1 = numeric id for subject

column2 = numeric id for activity type

column 3 to column 563 = measurements for x,y,z axis for time and frequency
as detailed in "features.txt" file from the input dataset for this assignment

---------------------------------------------------------------------------

Output for step 2

Dataframe 'stp2' is the output for step2 

stp2 has 10299 observation of 68 variables

Column1 = numeric id for subject

column2 = numeric id for activity type

column 3 to column 68 = measurements for x,y,z axis for time and frequency
as detailed in "features.txt" file from the input dataset for this assignment that have 'mean()' or 'std()' in its string.

--------------------------------------------------------------------------

Output for step 3

stp2 still has 10299 observation of 68 variables but coulum2 data is different from previous step

Column1 = numeric id for subject

column2 = activity description corresponding to numeric id

column 3 to column 68 = measurements for x,y,z axis for time and frequency
as detailed in "features.txt" file from the input dataset for this assignment that have 'mean()' or 'std()' in its string.


--------------------------------------------------------------------------

Output for step 4

Dataframe 'df_labeled' is the output for step4

"df_labeled" has 10299 observation of 68 variables

 [1] "subject"                      "activity"                    
 [3] "TimeBodyAcc-mean-X"           "TimeBodyAcc-mean-Y"          
 [5] "TimeBodyAcc-mean-Z"           "TimeBodyAcc-std-X"           
 [7] "TimeBodyAcc-std-Y"            "TimeBodyAcc-std-Z"           
 [9] "TimeGravityAcc-mean-X"        "TimeGravityAcc-mean-Y"       
[11] "TimeGravityAcc-mean-Z"        "TimeGravityAcc-std-X"        
[13] "TimeGravityAcc-std-Y"         "TimeGravityAcc-std-Z"        
[15] "TimeBodyAccJerk-mean-X"       "TimeBodyAccJerk-mean-Y"      
[17] "TimeBodyAccJerk-mean-Z"       "TimeBodyAccJerk-std-X"       
[19] "TimeBodyAccJerk-std-Y"        "TimeBodyAccJerk-std-Z"       
[21] "TimeBodyGyro-mean-X"          "TimeBodyGyro-mean-Y"         
[23] "TimeBodyGyro-mean-Z"          "TimeBodyGyro-std-X"          
[25] "TimeBodyGyro-std-Y"           "TimeBodyGyro-std-Z"          
[27] "TimeBodyGyroJerk-mean-X"      "TimeBodyGyroJerk-mean-Y"     
[29] "TimeBodyGyroJerk-mean-Z"      "TimeBodyGyroJerk-std-X"      
[31] "TimeBodyGyroJerk-std-Y"       "TimeBodyGyroJerk-std-Z"      
[33] "TimeBodyAccMag-mean"          "TimeBodyAccMag-std"          
[35] "TimeGravityAccMag-mean"       "TimeGravityAccMag-std"       
[37] "TimeBodyAccJerkMag-mean"      "TimeBodyAccJerkMag-std"      
[39] "TimeBodyGyroMag-mean"         "TimeBodyGyroMag-std"         
[41] "TimeBodyGyroJerkMag-mean"     "TimeBodyGyroJerkMag-std"     
[43] "FreqBodyAcc-mean-X"           "FreqBodyAcc-mean-Y"          
[45] "FreqBodyAcc-mean-Z"           "FreqBodyAcc-std-X"           
[47] "FreqBodyAcc-std-Y"            "FreqBodyAcc-std-Z"           
[49] "FreqBodyAccJerk-mean-X"       "FreqBodyAccJerk-mean-Y"      
[51] "FreqBodyAccJerk-mean-Z"       "FreqBodyAccJerk-std-X"       
[53] "FreqBodyAccJerk-std-Y"        "FreqBodyAccJerk-std-Z"       
[55] "FreqBodyGyro-mean-X"          "FreqBodyGyro-mean-Y"         
[57] "FreqBodyGyro-mean-Z"          "FreqBodyGyro-std-X"          
[59] "FreqBodyGyro-std-Y"           "FreqBodyGyro-std-Z"          
[61] "FreqBodyAccMag-mean"          "FreqBodyAccMag-std"          
[63] "FreqBodyBodyAccJerkMag-mean"  "FreqBodyBodyAccJerkMag-std"  
[65] "FreqBodyBodyGyroMag-mean"     "FreqBodyBodyGyroMag-std"     
[67] "FreqBodyBodyGyroJerkMag-mean" "FreqBodyBodyGyroJerkMag-std" 


-------------------------------------------------------------------------

Output for step 5

Dataframe 'data_final' is the output for step5

"data_final" has 80 observation of 68 variables

Column names are same as listed for step 4

--------------------------------------------------------------------------

Notes:

Broad logic used for each step

Explanation for step 1

There are 3 files each in 'test' and 'train' sets that need to be combined first


'Test' group files

subject_test.txt - Contains numeric id for each volunteer/subject;2947 rows

X_test.txt - contains 561 colums for measurements taken;2947 rows

y_test.txt - contains numeric id for each activity type;2947 rows


'Train' group files

subject_train.txt - Contains numeric id for each volunteer/subject,7352 rows 

X_train.txt - contains 561 colums for measurements taken; 7352 rows

y_train.txt - contains numeric id for each activity type;7352 rows

After reading these two sets of files use 'cbind' command to merge
columns into test(2947 obs of 563 variables) and train(7352 obs of 563 variables) data frame respectively.

Dataframe 'alldata' is the output for step1 and it is created by using
'rbind' on test and train data frames.

Alldata has 10299 observation of 563 variables




--------------------------------------------------------------------------


Explanation for step 2

File 'features.txt' contains the name for colums in x_test.txt and y_test.txt. It had 561 entries.

We use grep command to get only entries that have 'mean()' or 'std()' in its string. We do +2 to get actual column numbers because we had added two colums (subject, act) in the begining of dataframe alldata

Then we use select comand to create data fram "stp2" that contains columns
from "alldata" = subject, act, measurements that only have 'mean()' or 'std()' in its string

Dataframe 'stp2' is the output for step2 

stp2 has 10299 observation of 68 variables


--------------------------------------------------------------------------

Explanation for step 3

replace all activity codes in column 2 of dataframe stp2 with activity description. 

This is done by subsetting the values in colums2 with the corresponding description from file "activity_lables.txt"

After this dataframe stp2 have activity description in column 2 instead of numeric codes.

stp2 still has 10299 observation of 68 variables

--------------------------------------------------------------------------


Explanation for step 4

name all colums in dataframe "stp2" in descriptive fashion.

We get all entries from "features_txt" file that have 'mean()' or 'std()' in its string, the same way we did in step 2. To make the colum names even
more descriptive we use sub() function to 

-substitue first letter't' with "Time";

-first letter'f' with "Freq";

-take out brackets"()"

Now create a vector (myfinalvect) that has all the column names for dataframe "stp2" and use colnames function to name the columns.

Use dataframe "df_labeled" to store this output.

Dataframe 'df_labeled' is the output for step4

"df_labeled" has 10299 observation of 68 variables


-------------------------------------------------------------------------

Explanation for step 5

Use dataframe "df_labeled" to create a tidy dataframe (data_final) that has a mean for each subject and activity.

We used pipes to combine all the steps required in one command. 

We first group the dataset by subject and activity and then calculate the mean for each resultant group.

Dataframe 'data_final' is the output for step5

"data_final" has 80 observation of 68 variables

------------------------------------------------------------------------


