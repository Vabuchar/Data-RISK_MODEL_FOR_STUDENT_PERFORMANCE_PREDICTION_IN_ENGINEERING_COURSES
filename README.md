# Data-Risk_Model_For_Student_Performance_Prediction_In_Engineering_Courses
This code loads a .txt document with GPA data to build fragility curves.   Refer to 'logNormal_Score3.0_Statics.txt' for an example of the data organization within the .txt file. Create tables separated with TABS with the following headers:

GPA		n_i		z_i

where each row will have: GPA bin of the students prior to taking the course, n_i is the number of the available data for this GPA, and z_i is the number of the data from n_i that surpass a course grade threshold of interest.

This file is the result of collecting and organizing data as is described in the paper 'Risk Model for Student Performance Prediction in Engineering Courses'.

The file 'Student_Performance_Fragility.m' reads the .txt file located in the same folder, then calculates the lognormal distribution parameters to then graph the fragility curves.
