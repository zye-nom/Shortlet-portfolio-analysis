# Short-Let Portfolio Financial & Operational Analysis

## Introduction
This project evaluates the financial and operational performance of a short-let property portfolio to understand how capital was deployed, how effectively the properties generated revenue, and the estimated time required to recover the initial investment.
The analysis combines project expenditure, procurement, property performance, operating expenses, cash flow, and forecast scenarios to provide a financial view of the portfolio.

Business Objective
How much money has been invested, where has it gone, how are the properties performing, and how long could it take to recover the investment?

## Background
The portfolio consists of multiple short-let properties undergoing development and operation. Financial data was available across project budgets, expenses, purchases, vendors, revenue, bookings, operating expenses, and forecast assumptions.
The analysis was designed to move beyond individual transactions and evaluate the portfolio from a business perspective.

#### Capital Deployment
Where is the money going, and are projects staying within budget?

#### Revenue Performance
Which properties are generating revenue, and what role do occupancy and pricing play?

#### Investment Recovery
Given the capital invested and current cash generation, how long could it take to recover the investment?

## Tools Used
Excel Dataset
     ↓
Exploratory Data Analysis in Excel
     ↓
Python
Read/import Excel file
     ↓
Convert/load data into SQL format
     ↓
PostgreSQL
     ↓
SQL Analysis
     ↓
Power BI
Visualization


## The Analysis

### 1. Investment & Project Spending

PRJ003 was the major contributor to the portfolio's budget overrun, with expenditure of ₦16.72M against an approved budget of ₦9.0M, representing 185.75% budget utilization.

Metric              Result 
Approved Budget     ₦38.0M 
Actual Spend        ₦41.26M
Budget Utilization  108.58%
Budget Overrun      ₦3.26M

### 2. Expense & Procurement Analysis
Project expenditure was concentrated in a few categories. Appliances accounted for the largest share of project spending at 24.17%, followed by Furniture at 18.48%, Carpentry at 12.45%, and Labour at 11.27%.

Actual purchase costs were generally close to quoted costs. Woodwork recorded the largest positive variance at ₦61,400 (3.18%), while Curtains had the largest percentage saving at 4.39% below quotation.

### 3. Property Performance

Revenue performance was relatively balanced across the three properties. P001 generated the highest revenue at ₦28.59M and also recorded the highest occupancy at 99.53%, while maintaining a relatively high ADR of ₦45,017.77.
The results provide descriptive evidence that both occupancy and pricing may influence revenue performance, although the analysis does not establish causation.

Property   Revenue | Occupancy | ADR |
P001       ₦28.59M | 99.53%    | ₦45,017.77 
P003       ₦28.41M | 96.99%    | ₦40,127.94
P002       ₦27.94M | 97.34%    | ₦44,992.18


### 4. Operating Performance
Major operating expense categories:
- Utilities — ₦4.45M
- Staff — ₦3.72M
- Cleaning — ₦3.36M
- Maintenance — ₦2.61M
- Internet — ₦1.26M

### 5. Investment Recovery
Initial Investment: ₦41.26M
Average Monthly Net Cash Flow: ₦2.90M
Estimated Simple Payback: ~14.24 months

Scenario     | Monthly Revenue | Monthly Net Cash Flow
Conservative | ₦2.34M          | ₦1.84M 
Base Case    | ₦4.01M          | ₦3.46M
Optimistic   | ₦6.02M          | ₦5.42M


## Key Findings
₦41.26M has been spent against an approved project budget of ₦38M, resulting in 108.58% budget utilization.
PRJ003 significantly exceeded its budget, reaching 185.75% utilization.
Appliances, Furniture, Carpentry, and Labour accounted for 66.37% of project expenditure.
All three properties recorded occupancy above 96%, with P001 generating the highest revenue.
Average monthly net cash flow was approximately ₦2.90M.
Based on historical cash flow, the initial investment could be recovered in approximately 14.24 months.
Forecast scenarios indicate monthly net cash flow could range from approximately ₦1.84M to ₦5.42M, depending on occupancy, ADR, and operating costs.

## What I Learned
What I Learned
One of the biggest things I learned from this project was how to make my analytical workflow more efficient by using different tools for different stages of the process.
I started with Excel for exploratory data analysis, using it to inspect the dataset, understand the tables, and get familiar with the structure and contents of the data.
I then wanted to perform the main analysis in SQL/PostgreSQL. However, the dataset contained multiple tables, and manually creating each table in PostgreSQL and defining the columns and data types would have made the process unnecessarily long.
Instead, I used Python as a bridge between the raw dataset and PostgreSQL. I read the Excel dataset into Python, converted the data into SQL-compatible tables, and loaded it into PostgreSQL. This allowed me to move quickly into the SQL analysis without manually creating and populating every table.
This taught me that data analysis is not always about using one tool from beginning to end. The goal is to build an efficient workflow where each tool solves the part of the problem it is best suited for.
I also learned that writing SQL is more than knowing syntax. I had to think about the grain of the data, aggregation, joins, and how a business question translates into a query. Working through the questions step by step helped me strenghten my understanding of concepts such as views, COALESCE, NULLIF, subqueries, CTEs, and CROSS JOIN in the context of an actual business problem.

## Conclusion
The analysis shows a portfolio generating strong operational performance, with consistently high occupancy and approximately ₦2.90M in average monthly net cash flow. However, capital deployment requires attention, particularly the significant budget overrun recorded by PRJ003.
Based on historical cash flow, the ₦41.26M initial investment has an estimated simple payback period of approximately 14.24 months. The forecast scenarios demonstrate how changes in occupancy, ADR, and operating costs could materially affect the pace of investment recovery.
Overall, the analysis provides a financial and operational view of the portfolio and highlights both its revenue-generating potential and areas requiring tighter cost control.