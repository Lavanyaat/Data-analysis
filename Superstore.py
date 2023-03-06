# Importing library panda
import pandas as pd
import numpy as np
pd.set_option('display.max_rows', 50000)
pd.set_option('display.max_columns', 500)
pd.set_option('display.width', 1000)

df = pd.read_csv('/Users/lavanyaat/Desktop/Superstore Sample Data Analysis/Dataset/superstore_final_dataset.csv')
df.info()

# Find the duplicate rows except Row_ID
duplicateRows = df[df.duplicated(subset=["Order_ID", "Order_Date", "Ship_Date", "Ship_Mode", "Customer_ID",
                                         "Customer_Name", "Segment", "Country", "City", "State", "Postal_Code",
                                         "Region", "Product_ID", "Category", "Sub_Category", "Product_Name", "Sales"])]
print(duplicateRows)

# To drop the 1 duplicated row
after_duplicate = df.drop_duplicates(subset=["Order_ID", "Order_Date", "Ship_Date", "Ship_Mode", "Customer_ID",
                                         "Customer_Name", "Segment", "Country", "City", "State", "Postal_Code",
                                         "Region", "Product_ID", "Category", "Sub_Category", "Product_Name", "Sales"]
                         , keep='first')
print(after_duplicate)

# To find out the rows with missing null values

null_data = after_duplicate[after_duplicate.isnull().any(axis=1)]
print(null_data)

# To remove rows with null values.
after_null = after_duplicate.dropna()
print(after_null)

# To change the Date datatype from Object to datetime
after_null['Order_Date'] = pd.to_datetime(after_null['Order_Date'], format='%d/%m/%Y')
after_null['Ship_Date'] = pd.to_datetime(after_null['Ship_Date'], format='%d/%m/%Y')
after_null.info()

# To Check whether any record having Order_Date is greater than Ship_Date
Order_Greater_Ship = after_null.query('Order_Date > Ship_Date')
print("The Count of Order_Date>Ship_Date is" + " "+str(len(Order_Greater_Ship)))

# To export csv file in UTF-8 encoding
after_null.to_csv('Superstore_cleaned_dataset.csv', encoding='utf-8', index=False)








