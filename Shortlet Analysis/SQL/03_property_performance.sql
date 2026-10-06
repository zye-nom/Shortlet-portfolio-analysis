CREATE VIEW vw_property_performance AS
SELECT
    "Property_ID",
    SUM("Revenue") AS "Total_Revenue",
    SUM("Available_Nights") AS "Total_Available_Nights",
    SUM("Booked_Nights") AS "Total_Booked_Nights",
    ROUND(
        SUM("Booked_Nights")::numeric
        / NULLIF(SUM("Available_Nights"), 0) * 100,
        2
    ) AS "Occupancy_Rate", 
    ROUND(
        SUM("Revenue")::numeric
        / NULLIF(SUM("Booked_Nights"), 0),
        2
    ) AS "ADR"
FROM revenue
GROUP BY "Property_ID";

select * from vw_property_performance;

-- 12 How much revenue is each property generating?
-- 13 What is the occupancy rate of each property?
-- 14 What is the average daily rate (ADR)?
-- 15 Which properties generate the highest revenue?
-- 16 Are high-revenue properties also achieving high occupancy?

select "Property_ID", "Total_Revenue", "Occupancy_Rate", "ADR"
from vw_property_performance
group by "Property_ID", "Total_Revenue", "Occupancy_Rate", "ADR"
order by "Total_Revenue" desc;


-- 17 Is there evidence that pricing or occupancy could be affecting performance
