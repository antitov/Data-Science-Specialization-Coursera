##Input Data Set

The input data containts the following data files:

- `X_train.txt` contains variable features that are intended for training.
- `y_train.txt` contains the activities corresponding to `X_train.txt`.
- `subject_train.txt` contains information on the subjects from whom data is collected.
- `X_test.txt` contains variable features that are intended for testing.
- `y_test.txt` contains the activities corresponding to `X_test.txt`.
- `subject_test.txt` contains information on the subjects from whom data is collected.
- `activity_labels.txt` contains metadata on the different types of activities.
- `features.txt` contains the name of the features in the data sets.

##Transformations

Following are the transformations that were performed on the input dataset:

- `X_train.txt` is read into `trainData`.
- `y_train.txt` is read into `trainData_actlabels`.
- `subject_train.txt` is read into `SubjectTrain`.
- `X_test.txt` is read into `testData`.
- `y_test.txt` is read into `testData_actlabels`.
- `subject_test.txt` is read into `SubjectTest`.
- `features.txt` is read into `features`.
- `activity_labels.txt` is read into `actlabels`.
- `Data` is merged dataset from train and test dataset
- `DataMeanStd` contains onyl mean and standart deviations values
- `DT` is merged dataset that was converted to `data.table`
- `tidy` is the final dataset with the average of each variable for each activity and each subject