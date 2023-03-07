#  Superstore Data-analysis
---

Superstore Sales Analysis & Data Visualisation
![image](https://user-images.githubusercontent.com/17746000/223122146-1081fa4e-76be-4f81-8995-02b7aa77f1be.png)

This is the real world data analysis project conducted by HiCounselor as a 2 week challenge. 
The real dataset, client requirements, the tools which will be used, everything related to the project had been given in a sandbox link in their website.
It Contains 3 modules:
Module 1(Week 1): Preprocessing, cleaning the data using Python and finally achieving the clean dataset. 
Module 2(Week 1): Analysing the data using MySQL for the requested conditions.
Module 3(Week 2): Visualizing the data analysis using PowerBI/Tableau and present to the stakeholders.

---

Module 1:
Let's start with module 1 by downloading superstore_final_dataset.csv in the given sandbox link.
![image](https://user-images.githubusercontent.com/17746000/223122558-bedc7a42-5e6c-4fe4-9329-b18b8834c085.png)To understand the sales and operations of Superstore, we are going to go through the data in Python and will proceed with some data cleaning.
The dataset may contain duplicate rows, excluding Row_ID column as Row_ID is unique identifier here. This is to avoid duplicate entry for the same product in the same order.
So to identify the duplicate row df.duplicated() function is used except Row_ID column.
We Could see that 1 row is duplicated which is row#3407.
![image](https://user-images.githubusercontent.com/17746000/223122654-1aeaae3c-0f48-4ebf-980a-7930cd7b6355.png)The duplicate row had been removed using df.drop_duplicates () function.
Step 2: Removing rows for which few values are missing.
![image](https://user-images.githubusercontent.com/17746000/223122712-34b8e2a4-8742-48ed-a40e-bd5b7dea2361.png)We could see that using df.isnull() , there are 11 rows with null postal code.
Then we proceed with dropping the records with null values as it can interfere with the data analysis by df.dropna() function.
Step 3: Remove irrelevant values from each column if any. Validation of all values for a column( order date and ship date value must be in correct date format ). For each entry in dataset ship date >= order date. So there is no incorrect data where Ship_Date is less than Order_Date. So no need to remove any rows.

![image](https://user-images.githubusercontent.com/17746000/223122847-b741c0fc-4059-4093-b6ff-a9b959f7d168.png)


Step 4: Export the cleaned dataset as a .csv file: prefer UTF-8 encoding.
![image](https://user-images.githubusercontent.com/17746000/223123750-c9c2e012-7b9d-47cd-8916-57892e1febbe.png)
 So now the dataset is very clean and ready to be exported to csv file with UTF-8 encoding. Superstore_cleaned_dataset.csv is now cleaned and ready for data analysis.
 
 After finishing the data cleaning,now the requirement is to convert the cleaned csv to sql file and create a table called "superstore" in the PHP Admin.
 Converted the csv file to SQL file using this website.
 https://www.convertcsv.com/csv-to-sql.htm
 
 
 Then the SQL file has been imported into PHP admin by using given Username,Password as table superstore.
 
 Now the table has been created for data analysis using SQL. There were 14 tasks/data analysis requirement given. The SQL queries used to address those requirements has been attached as superstore.sql file.
 
 From this Module 1 and 2 comes to an end.
