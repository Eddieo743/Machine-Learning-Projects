# Mushroom Classification Using Naive Bayes (R)

## Introduction
This project implements a Naive Bayes classification model to predict whether a mushroom is edible or poisonous based on its physical characteristics. The goal is to demonstrate a complete supervised machine learning workflow using R.

The mushroom dataset is well-suited for Naive Bayes because it consists entirely of categorical features, making probabilistic classification optimal.

## Dataset
The dataset (`mushrooms.csv`) contains observations of mushrooms described by categorical attributes such as:
Cap shape and color
Odor
Gill size and color
Stalk characteristics

The target variable, `class`, indicates whether a mushroom is:
e — edible  
p — poisonous  

## Objective
The objectives of this project are to:
- Train a Naive Bayes classifier to predict mushroom edibility
- Evaluate model performance on unseen test data
- Interpret classification results using a confusion matrix and statistical metrics

## Methodology
The project follows a standard machine learning process:

1. Load and inspect the dataset  
2. Split the data into training (70%) and testing (30%) sets using sampling  
3. Train a Naive Bayes classifier with Laplace smoothing  
4. Generate predictions on the test dataset  
5. Evaluate performance using a confusion matrix and accuracy metrics  

## Tools & Libraries
- R
- caret — data partitioning and evaluation
- e1071 — Naive Bayes implementation
---

## Results

### Confusion Matrix
|               | Reference: Edible | Reference: Poisonous |
|---------------|------------------|----------------------|
| Predicted Edible | 1256 | 143 |
| Predicted Poisonous | 6 | 1031 |

---

### Performance Metrics
- Accuracy: 93.88%
- 95% Confidence Interval: (92.86%, 94.80%)
- Kappa Statistic: 0.877
- Sensitivity (Edible): 99.52%
- Specificity (Poisonous): 87.82%
- Balanced Accuracy: 93.67%
- p-value: < 2.2e-16

## Interpretation
The model demonstrates strong overall performance, achieving nearly 94% accuracy on unseen data. Sensitivity is particularly high, meaning the model is very effective at identifying edible mushrooms. Specificity is also strong, indicating reliable detection of poisonous mushrooms.


## Conclusion
This project shows that a Naive Bayes classifier can effectively model categorical mushroom data and achieve high predictive performance. The results highlight Naive Bayes as a strong baseline model for classification tasks involving categorical features.

Future improvements could include:
- Comparing Naive Bayes with other classifiers (e.g., decision trees, random forests)
- Feature importance analysis
- Cross-validation

## How to Run
1. Clone the repository
2. Install required R packages:
   ```r
   install.packages(c("caret", "e1071"))

