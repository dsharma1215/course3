---
output:
  word_document: default
  html_document: default
---
----------------------------------------------------------------------
title: "README"

output: word_document

Description : This is README file for Peer graded assignment for Coursera
              course "Getting and Cleaning Data".
              
              
              This documents explains script 'run_analysis.R'.
------------------------------------------------------------------------

Input dataset for the assignment contains various measurements taken from 30 volunteers(subjects) wearing samsung Galaxy S II phone on waist while performing 6 activites -

WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The 30 subjects are randomly divived into two groups-'test' and 'train'
Both these groups have same set of variables.

----------------------------------------------------------------------

Follwoing are the 5 steps that were required to complete the Assignment

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

-------------------------------------------------------------------------

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

Explanation of step 5

Use dataframe "df_labeled" to create a tidy dataframe (data_final) that has a mean for each subject and activity.

We used pipes to combine all the steps required in one command. 

We first group the dataset by subject and activity and then calculate the mean for each resultant group.

Dataframe 'data_final' is the output for step5

"data_final" has 80 observation of 68 variables

------------------------------------------------------------------------



