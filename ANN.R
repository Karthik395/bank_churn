# ARTIFICIAL NEURAL NETWORK

getwd()

setwd("/Users/karthikmudlapur/desktop/R/10.Artificial neural network")


dataset = read.csv('Churn_Modelling.csv')
dataset = dataset[4:14]

# Encoding the categorical variables as factors

dataset$Geography = as.numeric(factor(dataset$Geography,
                                     levels = c('France', 'Spain', 'Germany'),
                                     labels = c(1,2,3)))

dataset$Gender = as.numeric(factor(dataset$Gender,
                                      levels = c('Female', 'Male'),
                                      labels = c(1,2)))

# For deep learning package, we need to put the factor variables into as.numeric 

# Splitting the dataset into the Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Exited, SplitRatio = 0.80)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-11] = scale(training_set[-11])
test_set[-11] = scale(test_set[-11])

# Fitting ANN to the Training set
install.packages('h20')
library(h2o)

h2o.init(nthreads = -1)

h2o.shutdown()



y
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)