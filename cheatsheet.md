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