# Predicting Home Remodeling Status Using k-Nearest Neighbors (kNN)

## Project Overview

Understanding whether a home has been remodeled is valuable for buyers, sellers, and real estate investors. Remodeling can significantly affect a property’s value, usability, and market appeal.
This project applies a k-Nearest Neighbors (kNN) classification model to predict whether homes have been remodeled based on key housing characteristics.
The goal is to build and evaluate a machine learning model that accurately classifies homes into remodeled and non-remodeled categories.

## Objectives

Develop a kNN classification model to predict home remodeling status
Normalize numerical features to improve distance-based learning
Evaluate model performance across multiple values of k
Identify the optimal k that maximizes classification accuracy

## Dataset

The dataset (Roxbury.csv) contains housing information used for model training and evaluation.

### Features Used

Total Price:
Represents the overall market value of the home.

Number of Rooms:
Includes bedrooms, bathrooms, and other living spaces, reflecting property size and functionality.

Living Area:
Total usable living space measured in square feet (or square meters).

Target Variable:
Remodeled Status (binary classification)
Indicates whether the home has undergone remodeling

## Method

Data Preparation

Split the dataset into 60% training and 40% testing sets
Standardized numerical features using centering and scaling

Modeling

Implemented a kNN classifier using the class package
Used an initial value of k = 3 to establish baseline performance

Model Evaluation

Evaluated accuracy on the test dataset
Tuned the hyperparameter k by testing values from 1 to 15
Selected the k value with the highest classification accuracy
Remodeled Status (binary classification)
Indicates whether the home has undergone remodeling.

## Results

Baseline Model (k = 3)
Accuracy: 74%
Hyperparameter Tuning (k = 1–15)
Best performance achieved at k = 13
Maximum accuracy: 81%
These results demonstrate the importance of hyperparameter tuning in kNN models. Selecting an appropriate number of neighbors significantly improves predictive performance.

## Conclusion

This project shows that a well-tuned kNN model can effectively classify whether a home has been remodeled using basic housing features. Normalization and systematic evaluation of different k values were critical to achieving optimal accuracy.

Future improvements could include:
Adding more predictive features
Using cross-validation
Comparing kNN with other classification algorithms
