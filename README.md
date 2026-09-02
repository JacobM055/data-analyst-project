# Bank Customer Churn Analysis

An end-to-end analysis of customer churn for a retail bank, using Python for exploratory analysis, SQL for structured querying, and Tableau for an interactive dashboard.

**[View the interactive dashboard on Tableau Public →](https://public.tableau.com/app/profile/jacob.mcvicker/viz/BankCustomerChurnAnalysis_17883613605630/Dashboard1)**

## Overview

Customer churn — when a bank customer closes their account and leaves — is costly to acquire back and directly impacts revenue. This project explores a dataset of 10,000 bank customers to identify which factors are most associated with churn, with the goal of surfacing patterns that could inform retention strategy.

## Dataset

- **Source:** Bank Customer Churn Prediction dataset (`Bank Customer Churn Prediction.csv`)
- **Size:** 10,000 rows, 12 columns
- **Key fields:** `country`, `age`, `products_number`, `active_member`, `balance`, `churn`

## Methodology

The analysis followed a four-phase workflow:

1. **Python (Exploration)** — `notebooks/01_exploration.ipynb`
   Initial data profiling, cleaning checks, and summary statistics to understand the shape of the dataset.

2. **SQL (Analysis)** — `bank_churn_analysis.sql`
   Five structured queries breaking down churn rate by country, product count, activity status, and age, using MySQL.

3. **Python (Visualization)** — `notebooks/02_visualizations.ipynb`
   Five charts built to validate and visually communicate the SQL findings.

4. **Tableau (Dashboard)**
   An interactive four-panel dashboard combining the key findings into a single shareable view, published to Tableau Public.

## Key Findings

- **Overall churn rate:** 20.37%
- **Geography matters:** Germany churns at 32.44%, roughly double the rate of France and Spain (~16% each).
- **Product count has a sweet spot:** Customers with 2 products churn least (7.58%), while those with only 1 product churn at 27.71%. Customers with 3 or 4 products show very high churn rates (83%+), but these groups are small (n=266 and n=60, respectively) and should be read as a high-risk segment rather than a statistically robust trend.
- **Engagement reduces churn:** Inactive members churn at 26.85% vs. 14.27% for active members — nearly double.
- **Age is a factor:** Churned customers average 44.84 years old, compared to 37.41 for retained customers.

## Repository Structure

├── data/
│ └── Bank Customer Churn Prediction.csv
├── notebooks/
│ ├── 01_exploration.ipynb
│ └── 02_visualizations.ipynb
├── bank_churn_analysis.sql
└── README.md


## Tools

Python (Jupyter), MySQL Workbench, Tableau Public, VS Code

## Author

Jacob McVicker