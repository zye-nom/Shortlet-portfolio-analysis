CREATE VIEW vw_project_expenditure as 
SELECT
    Expense."Expense_ID", Expense."Project_ID", Expense."Expense_Date", 
    Expense."Amount",  Expense."Category", Expense."Payment_Status", Expense."Property_ID",

    projects."Project_Name", projects."Budget", projects."Start_Date",
    projects."Expected_End_Date"
from expenses as Expense

LEFT JOIN projects 
    on Expense."Project_ID" = projects."Project_ID"
LEFT JOIN properties
    on projects."Property_ID" = properties."Property_ID";

SELECT *
FROM vw_project_expenditure
LIMIT 10;

select DISTINCT "Category" from vw_project_expenditure;

-- 01 - What is the total approved budget?

SELECT "Project_ID", "Budget"
FROM projects 
GROUP BY "Project_ID", "Budget"
order by "Budget" desc;

-- 02 - How much has actually been spent
SELECT
    "Project_ID", sum("Amount") AS Total_spend
FROM expenses
GROUP BY "Project_ID"
ORDER BY Total_spend DESC;

-- 03 - What percentage of the budget has been utilized?
SELECT "Project_ID", 
    ROUND(
        SUM("Amount") /NULLIF("Budget", 0) * 100,2) AS "Budget_Utilization_Percentage"
FROM vw_project_expenditure
GROUP BY "Project_ID", "Budget"
ORDER BY "Budget_Utilization_Percentage" DESC;


SELECT "Project_ID", sum("Amount") AS Total_spend, "Budget" AS Total_budget,
    ROUND(
        SUM("Amount") /NULLIF("Budget", 0) * 100,2) AS "Budget_Utilization_Percentage"
FROM vw_project_expenditure
GROUP BY "Project_ID", "Budget"
ORDER BY "Budget_Utilization_Percentage" DESC;


-- 04 How much budget remains?
-- 05 Which projects have consumed the largest proportion of their budgets
-- 06 Are any projects over budget

SELECT "Project_ID", "Budget" AS Total_budget, sum("Actual Spend") AS Total_spend,
    "Budget" - SUM("Actual Spend") AS Remaining_Budget,
    ROUND(SUM("Actual Spend") /NULLIF("Budget", 0) * 100,2) AS "Budget_Utilization_Percentage",
    round(("Budget" - SUM("Actual Spend")) /NULLIF("Budget", 0) * 100,2) AS "Remaining_Budget_Percentage"
FROM vw_project_financials
GROUP BY "Project_ID", "Budget"
ORDER BY Remaining_Budget DESC;


-- 07 What are the largest categories of project expenditure?
-- 08 Which categories account for the largest share of spending?
 SELECT "Category", sum("Amount") AS Total_spend,
 ROUND(
        SUM("Amount") /
        NULLIF((SELECT SUM("Amount") FROM vw_project_expenditure), 0)
        * 100,
        2
    ) AS "Share_of_Total_Spending"
 FROM vw_project_expenditure
 group by "Category"
 order by Total_spend desc;


