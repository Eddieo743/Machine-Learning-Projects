# Read the dataset
mushroom <- read.csv("Data/mushrooms.csv")

# Check the structure of the dataset
str(mushroom)

# Data Partition
library(caret)
set.seed(123)
partition <- createDataPartition(mushroom$class, p = 0.7, list = FALSE)
train.df <- mushroom[partition, ]
test.df <- mushroom[-partition, ]

# Check the structure of the training and testing sets
str(train.df)
str(test.df)

# Extract labels
trainLabels <- train.df$class
testLabels <- test.df$class

# Create the model
library(e1071)
mushroom_bayes <- naiveBayes(train.df[, -1], trainLabels, laplace = 1)

# Display the model
print(mushroom_bayes)

# Run prediction on the test set
m_pred <- predict(mushroom_bayes, test.df[, -1])

# Convert predicted and true labels to factors
m_pred <- factor(m_pred)
testLabels <- factor(testLabels)

# Ensure levels match
levels(m_pred) <- levels(testLabels)

# Calculate confusion matrix
confusionMatrix(m_pred, testLabels)


