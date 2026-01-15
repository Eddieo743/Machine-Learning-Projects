# Tree-Based Model Comparison: Wine Dataset

# Libraries
library(adabag)        
library(caret)        
library(rpart)        
library(rpart.plot)    
library(randomForest) 
set.seed(123)          

# Data
wine_data <- read.csv("C:/Users/eddie/Downloads/data/wine.csv")

# Target
wine_data$Wine <- as.factor(wine_data$Wine)

# Split (70/30)
idx <- sample(1:nrow(wine_data), round(0.7 * nrow(wine_data)))
train <- wine_data[idx, ]
test  <- wine_data[-idx, ]


# Decision Tree
wine.single <- rpart(Wine ~ ., data = train, method = "class")
rpart.plot(wine.single, main = "Decision Tree")

pred_single <- predict(wine.single, test, type = "class")
cm_single <- confusionMatrix(pred_single, test$Wine)
print(cm_single)

# Bagging
wine.bagging <- bagging(
  Wine ~ ., 
  data = train,
  mfinal = 50,
  control = rpart.control(maxdepth = 5, minsplit = 5)
)

rpart.plot(wine.bagging$trees[[1]],
           main = "Bagging")

pred_bag <- predict(wine.bagging, test, type = "class")
cm_bag <- confusionMatrix(factor(pred_bag$class), test$Wine)
print(cm_bag)

# Boosting
wine.boost <- boosting(
  Wine ~ ., 
  data = train,
  mfinal = 50,
  control = rpart.control(maxdepth = 5, minsplit = 5)
)

rpart.plot(wine.boost$trees[[1]],
           main = "Boosting")

pred_boost <- predict(wine.boost, test, type = "class")
cm_boost <- confusionMatrix(factor(pred_boost$class), test$Wine)
print(cm_boost)


# Random Forest
wine.rf <- randomForest(
  Wine ~ .,
  data = train,
  ntree = 500,          
  mtry = floor(sqrt(ncol(train) - 1)),  
  importance = TRUE
)

pred_rf <- predict(wine.rf, test)
cm_rf <- confusionMatrix(pred_rf, test$Wine)
print(cm_rf)


# Accuracy Comparison
accuracy_table <- data.frame(
  Model = c("Decision Tree", "Bagging", "Boosting", "Random Forest"),
  Accuracy = c(cm_single$overall["Accuracy"],
               cm_bag$overall["Accuracy"],
               cm_boost$overall["Accuracy"],
               cm_rf$overall["Accuracy"])
)

print(accuracy_table)


# Feature Importance
print(wine.boost$importance)

print(wine.bagging$importance)

print(importance(wine.rf))
varImpPlot(wine.rf, main = "Random Forest Feature Importance")
