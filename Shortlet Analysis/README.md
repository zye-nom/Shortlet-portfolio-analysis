# Short-Let Portfolio Financial & Operational Analysis

## Project Overview

This project evaluates the financial and operational performance of a short-let property portfolio to understand how capital is deployed, how effectively properties generate revenue, and how long recorded project investment could take to recover.

The analysis combines financial and operational data to identify budget overruns, expenditure patterns, property performance, procurement cost differences, and potential investment recovery timelines.

**Tools:** Microsoft Excel · Python · PostgreSQL · SQL · Power BI · Git/GitHub

## Business Objectives

The analysis was designed to answer five key business questions:

1. **Investment and Project Spending:** How does actual project expenditure compare with approved budgets?
2. **Expense Analysis:** Which expenditure categories account for the largest share of project spending?
3. **Property Performance:** Which properties generate the most revenue, and how do occupancy and average daily rate compare?
4. **Operating Performance:** How does revenue compare with operating expenses, and what does net cash flow reveal about operational performance?
5. **Investment Recovery:** Based on recorded investment and available cash-flow data, how long could it take to recover the initial project expenditure?

## Tools and Methodology

The project followed a structured data analytics workflow.

### 1. Excel — Exploratory Data Analysis

Excel was used to explore the source data, understand the available tables and fields, identify data-quality issues, and establish the initial business questions.

### 2. Python — Data Preparation

Python was used to read the Excel workbook, prepare the data, and load the tables into PostgreSQL. This reduced the need to manually create and populate multiple database tables.

### 3. PostgreSQL and SQL — Data Analysis

PostgreSQL was used to store the data and perform the analytical transformations. SQL queries and views were created to analyse project expenditure, budgets, procurement costs, property performance, and operating performance.

### 4. Power BI — Dashboard Development

Power BI was used to develop an interactive dashboard with three report pages:

- **Dashboard Summary:** Portfolio-level financial and operational overview.
- **Financial Performance:** Budget utilisation, project expenditure, vendor spending, and quoted versus actual procurement costs.
- **Operational Performance:** Property revenue, occupancy, average daily rate, operating expenses, net cash flow, and estimated investment recovery.

The report includes navigation icons, filters, chart interactions, and information tooltips to help users understand the metrics and explore the results.

## Key Findings

### 1. Project Budget and Expenditure

| Metric                        | Result      |
| Total approved project budget | ₦38,500,000 |
| Actual project expenditure    | ₦41,258,600 |
| Budget overrun                | ₦2,758,600  |
| Budget utilisation            | 107.17%     |

Recorded project expenditure exceeded the approved budget by approximately 7.17%.

PRJ003, the White Suites Upgrade project, was the most significant budget-control concern.

- Approved budget: ₦9,000,000
- Actual expenditure: approximately ₦16,717,800
- Budget utilisation: 185.75%
- Amount over budget: approximately ₦7,717,800

### 2. Expenditure by Category

Appliances, furniture, carpentry, and labour were the four largest expenditure categories.

Together, these categories accounted for approximately 66.37% of recorded project expenditure, making them important areas for cost monitoring and procurement control.

### 3. Property Revenue and Performance

The three active properties generated approximately ₦84.94 million in recorded revenue.

| Property | Revenue | Occupancy | Average Daily Rate |
| P001     | ₦28.59M | 99.53%    | ₦45,017.77 |
| P003     | ₦28.41M | 96.99%    | ₦40,127.94 |
| P002     | ₦27.94M | 97.34%    | ₦44,992.18 |

Average occupancy across the three active properties was approximately 97.95%, indicating high utilisation of available nights in the recorded data.

P001 generated the highest revenue and recorded the highest occupancy rate among the three properties.

### 4. Procurement Cost Analysis

Comparing quoted and actual purchase costs revealed differences across procurement categories.

- Woodwork and furniture recorded actual costs above quoted amounts.
- Appliances and curtains recorded actual costs below quoted amounts.

These comparisons demonstrate how procurement analysis can help identify cost increases, savings, and opportunities to improve budget control.

### 5. Estimated Investment Recovery

Recorded project expenditure was approximately ₦41.26 million, while average monthly net cash flow was approximately ₦2.90 million.

Based on these values, the simple estimated payback period was approximately **14.24 months**.

This estimate assumes that average monthly net cash flow remains stable. It is an indicative calculation based on the available records, not a confirmed full-portfolio recovery period.

## Recommendations

Based on the findings, the following actions merit consideration:

1. Investigate the substantial budget overrun recorded for PRJ003 and review the underlying expenditure.
2. Introduce regular budget-versus-actual monitoring for projects.
3. Review high-spend categories, particularly appliances, furniture, carpentry, and labour.
4. Compare procurement quotations with actual purchase costs to improve cost control.
5. Monitor property revenue, occupancy, ADR, and operating expenses together to assess operating performance.
6. Improve investment record completeness before relying on portfolio-wide payback estimates for financial decisions.

## Data Limitations

The interpretation of the results is subject to several limitations:

- Investment records are not available for all active properties. Recorded project expenditure may therefore not represent the complete historical capital invested across the portfolio.
- Two properties are classified as pre-opening, so their approved project budgets should not be interpreted as evidence of operating revenue.
- The payback calculation assumes stable monthly net cash flow and does not independently establish when the full portfolio will recover all capital invested.
- Forecast scenarios represent potential outcomes under different assumptions, not guaranteed financial results.

These limitations should be considered when interpreting the dashboard and its conclusions.

## Project Deliverables

The repository contains the SQL analysis files and Power BI dashboard used to support the project.

- SQL views for project expenditure and financial analysis.
- SQL analysis for purchases and procurement.
- SQL analysis for property performance.
- SQL analysis for operating performance.
- Power BI report containing the three dashboard pages.

## Conclusion

This project demonstrates an end-to-end analytics workflow, from exploratory data analysis and data preparation to SQL-based analysis and interactive dashboard development.

The findings highlight the importance of budget control, procurement monitoring, property-level performance analysis, and complete investment records when evaluating the financial performance and recovery potential of a short-let portfolio.