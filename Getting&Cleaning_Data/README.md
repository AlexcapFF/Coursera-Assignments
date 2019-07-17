# Run_Analysis for Getting and Cleaning Data course on coursera

Firstly I downloaded tha zip file with the dataset manually and not via R

Then I extracted the information from the txt files using read.table. After that I started tidying up the dataset.

I then noticed how "features" had the same number of rows as the number of columns of x_test, x_train and only 2 variables, so I assigned their names respectively, sorting by x,y and subject

Lastly I created a readable dataset by merging the data.frames and by using the grepl function I extracted the mean san sd for each measurement
