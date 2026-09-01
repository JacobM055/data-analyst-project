# Pandas Cheat Sheet

## Loading Data
df = pd.read_csv('path/to/file.csv')   # load CSV into dataframe

## Exploring Data
df.head()                               # show first 5 rows
df.shape                                # (rows, columns)
df.info()                               # column types and null counts

## Single Column
df['column']                            # get one column
df['column'].mean()                     # average
df['column'].value_counts()             # count each unique value

## Grouping
df.groupby('col1')['col2'].mean()       # average of col2 per group
df.groupby('col1')['col2'].count()      # count rows per group

## Filtering
df[df['column'] == value]               # rows where condition is true

## Formatting
round(number, 2)                        # round to 2 decimal places
f"text {variable:.2f}%"                 # print variable in a sentence

## Churn / Percentage Calculations
df['column'].mean() * 100              # convert 0/1 column to percentage

churn_rate = df['churn'].mean() * 100  # overall churn rate
print(f"Churn rate: {churn_rate:.2f}%") # print with 2 decimal places

## Groupby + Churn Rate Pattern
df.groupby('column')['churn'].mean() * 100  # churn rate per group

## Common Analysis Patterns Used So Far
# Churn by country
df.groupby('country')['churn'].mean() * 100

# Average balance by country  
df.groupby('country')['balance'].mean()

# Churn by number of products
df.groupby('products_number')['churn'].mean() * 100

# Count customers per group
df['column'].value_counts()

# Average age by churn status
df.groupby('churn')['age'].mean()

## Key Reminder
# Always check sample sizes before trusting a percentage
df['column'].value_counts()   # how many people are in each group?


# BANK CUSTOMER CHURN - KEY FINDINGS

1. Overall churn rate: 20.37% — 1 in 5 customers is leaving

2. Germany churns at 32.44% vs ~16% for France and Spain
   — German customers also have double the average balance

3. Customers with 2 products have lowest churn (7.58%)
   — Customers with 1 product churn at 27.71%
   — 3-4 products have very high churn but small sample sizes

4. Churned customers average age 44.84 vs 37.41 for those who stayed
   — Older customers are leaving at higher rates

5. Inactive members churn at 26.85% vs 14.27% for active members
   — Inactivity is nearly double the churn risk



## Chart Building Steps (matplotlib)
1. Get the data you want to display
2. Set up the canvas → fig, ax = plt.subplots(figsize=(8, 6))
3. Draw the chart → ax.bar(labels, values, color=colors)
4. Add title → ax.set_title('Title', fontsize=16, fontweight='bold')
5. Add axis labels → ax.set_xlabel('X Label'), ax.set_ylabel('Y Label')
6. Add numbers on bars → for i, v in enumerate(values): ax.text(i, v + 50, str(v), ha='center')
7. Show the chart → plt.tight_layout() then plt.show()

## Chart Types
ax.bar()      → bar chart
ax.scatter()  → scatter plot
ax.pie()      → pie chart

## Colors
Use hex codes e.g. '#2ecc71' (green), '#e74c3c' (red)
Green = positive/good, Red = negative/bad

## Important: v + offset for bar labels
# The offset depends on your y-axis scale
# Large y-axis (thousands): use v + 50
# Small y-axis (percentages): use v + 0.5

## Formatting numbers on charts
str(v)           → raw number with all decimals
f"{v:.2f}%"      → 2 decimal places with % sign
f"{v:.0f}"       → whole number, no decimals