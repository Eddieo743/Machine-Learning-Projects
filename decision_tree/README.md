# Tree-Based Classification Models on the Wine Dataset

## DESCRIPTION
This project compares multiple tree-based machine learning models for multiclass classification using the Wine dataset. The goal is to evaluate how ensemble methods improve upon a single decision tree in terms of predictive accuracy.

The models evaluated include:

Single Decision Tree

Bagging (Bootstrap Aggregation)

Boosting

Random Forest

Each model is trained on a 70% training split and evaluated on a 30% test split using classification accuracy and confusion matrices.

## DATASET
The Wine dataset consists of 178 observations and multiple numerical features derived from chemical analysis of wines.
The target variable is Wine, which represents the wine class.

## METHODS

Decision Tree: A single CART-style tree using recursive partitioning

Bagging: An ensemble of trees trained on bootstrap samples

Boosting: Sequential trees that emphasize misclassified observations

Random Forest: An ensemble of trees using bootstrap samples and random feature selection

All models are implemented in R using established libraries.

## RESULTS
The observed test-set accuracies were:

Single Decision Tree: 94.34%

Bagging: 96.23%

Boosting: 94.34%

Random Forest: 100.00%

Random Forest achieved perfect accuracy on the test set, reflecting the strong class separability of the dataset and the effectiveness of ensemble learning.

## FEATURE IMPORTANCE
Feature importance is extracted for Bagging, Boosting, and Random Forest models to identify which chemical attributes contribute most to classification performance.

## REQUIREMENTS
R packages required:

rpart

rpart.plot

adabag

caret

randomForest 
