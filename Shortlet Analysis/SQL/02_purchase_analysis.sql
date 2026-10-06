CREATE VIEW vw_purchase as 
SELECT
    v."Vendor_ID", v."Category", v."Status",
    pu."Purchase_ID", pu."Quote_ID",	pu."Property_ID",
    pu."Vendor_Name", pu."Quantity", pu."Quoted_Unit_Price", pu."Actual_Unit_Price",
    pu."Payment_Status", pu."Quoted_Total",	pu."Actual_Total",	pu."Variance"
from purchases as pu

LEFT JOIN vendors as v
 on v."Vendor_ID" = pu."Vendor_ID";

select * from vw_purchase;


-- 09 Which vendors have received the most money?
select "Vendor_ID", sum("Actual_Total") as total
from vw_purchase
where "Payment_Status" = 'Paid'
GROUP BY "Vendor_ID" 
order by total desc;

-- 10 How does actual purchase cost compare with quoted cost?
-- 11 Are there significant differences between quotations and actual purchases?
SELECT "Category",
    SUM("Quoted_Total") AS "Total_Quoted_Cost",
    SUM("Actual_Total") AS "Total_Actual_Cost",
    SUM("Actual_Total") - SUM("Quoted_Total")
        AS "Cost_Difference",
    ROUND(
        (
            SUM("Actual_Total") - SUM("Quoted_Total")
        )
        / NULLIF(SUM("Quoted_Total"), 0) * 100,
        2
    ) AS "Percentage_Difference"
FROM vw_purchase
GROUP BY "Category"
ORDER BY "Percentage_Difference" DESC;

