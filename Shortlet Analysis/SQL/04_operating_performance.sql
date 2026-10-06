CREATE VIEW vw_operating_performance AS
    WITH revenue_monthly AS (
    SELECT
        "Property_ID",
        "Month",
        COALESCE("Revenue", 0) AS "Revenue"
    FROM revenue
),
opex_monthly AS (
    SELECT
        "Property_ID",
        "Month",
        SUM("Amount") AS "Operating_Expenses"
    FROM operating_expenses
    GROUP BY
        "Property_ID",
        "Month"
)
SELECT
    r."Property_ID",
    r."Month",
    r."Revenue",
    COALESCE(o."Operating_Expenses", 0) AS "Operating_Expenses",
    r."Revenue"
        - COALESCE(o."Operating_Expenses", 0) AS "Net_Cash_Flow"
FROM revenue_monthly AS r
LEFT JOIN opex_monthly AS o
    ON r."Property_ID" = o."Property_ID"
    AND r."Month" = o."Month";

SELECT *
FROM vw_operating_performance;

select * FROM operating_expenses;

-- 18 How much is being spent on recurring operating expenses?
select "Month", sum("Amount") as total
from operating_expenses
group by "Month";

-- 19 What are the largest operating expense categories?
select "Category", sum("Amount") as total
from operating_expenses
group by "Category"
order by total desc;


-- 20 How much revenue is generated relative to operating expenses?
select "Property_ID", "Month",
    sum("Revenue") as total_revenue, 
    sum("Operating_Expenses") as total_expenses,
    sum("Net_Cash_Flow") as total_net_cash_flow
from vw_operating_performance
WHERE "Month" < DATE '2027-01-01'
group by "Property_ID", "Month";

-- 21 What is the monthly net cash flow?
select "Month", sum("Net_Cash_Flow") as "Net_Cash_Flow"
from vw_operating_performance
WHERE "Month" < DATE '2027-01-01'
group by "Month";

-- 22 What was the initial investment required?
SELECT
    SUM("Actual Spend") AS "Initial_Investment"
FROM vw_project_financials;

-- 23 What is the average monthly net cash flow?
SELECT
    AVG("Monthly_Net_Cash_Flow") AS "Average Monthly Net Cash Flow"
FROM (
    SELECT
        "Month",
        SUM("Net_Cash_Flow") AS "Monthly_Net_Cash_Flow"
    FROM vw_operating_performance
    GROUP BY "Month"
) AS monthly_cash_flow;


-- 24 Based on current assumptions, approximately how long could it take to recover the initial investment?

SELECT
    AVG("Available_Nights") AS "Avg_Monthly_Available_Nights"
FROM (
    SELECT
        "Month",
        SUM("Available_Nights") AS "Available_Nights"
    FROM revenue
    GROUP BY "Month"
) AS monthly_nights;

select * from forecast;

SELECT
    f."Scenario",
    f."Occupancy_Assumption",
    f."ADR_Assumption",
    f."Monthly_Operating_Cost",
    n."Avg Monthly Available Nights",
    (
        n."Avg Monthly Available Nights"
        * f."Occupancy_Assumption"
        * f."ADR_Assumption"
    ) AS "Projected_Monthly_Revenue",
    (
        (
            n."Avg Monthly Available Nights"
            * f."Occupancy_Assumption"
            * f."ADR_Assumption"
        ) - f."Monthly_Operating_Cost"
    ) AS "Projected_Monthly_Net_Cash_Flow"
FROM forecast AS f
CROSS JOIN (
    SELECT
        AVG("Available_Nights") AS "Avg Monthly Available Nights"
    FROM (
        SELECT
            "Month",
            SUM("Available_Nights") AS "Available_Nights"
        FROM revenue
        GROUP BY "Month"
    ) AS monthly_nights
) AS n;

