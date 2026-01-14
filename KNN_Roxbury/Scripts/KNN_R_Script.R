library(caret)
library(tinytex)
library(class)

# read dataset and inspect
housing.df <- read.csv("Data/Roxbury.csv")
head(housing.df)
str(housing.df)


# Split data into training and testing sets
set.seed(123) # Setting seed for reproducibility
train.index <- sample(nrow(housing.df), 0.6 * nrow(housing.df))
train.df <- housing.df[train.index, ]
test.df <- housing.df[-train.index, ]

# Create new data frames to preserve original data
train.norm.df <- train.df
test.norm.df <- test.df

# Standardize the data
norm.values <- preProcess(train.df[, 1:3], method = c("center", "scale"))
train.norm.df[, 1:3] <- predict(norm.values, train.df[, 1:3])
test.norm.df[, 1:3] <- predict(norm.values, test.df[, 1:3])

# Perform k-NN classification on arbitrary number to get baseline performance
knn<-knn(train=train.norm.df[,1:3], test=test.norm.df[,1:3], cl=train.norm.df[, 4], k=3)

# Calculate accuracy
accuracy <- mean(knn == test.norm.df[, 4])
accuracy

# Initialize a data frame to store accuracy values for different k
accuracy.df <- data.frame(k = 1:15, accuracy = rep(0, 15))

# Compute k-NN for different values of k
for (i in 1:15) {
  knn.pred <- knn(train.norm.df[, 1:3], test.norm.df[, 1:3], cl = train.norm.df[, 4], k = i)
  accuracy.df[i, "accuracy"] <- confusionMatrix(knn.pred, factor(test.norm.df[, 4]))$overall[1]
}

accuracy.df