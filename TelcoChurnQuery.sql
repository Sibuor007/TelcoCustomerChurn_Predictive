/*
Selecting relevant columns, filtering out null values
and ensuring that churn values stay binary
*/

SELECT 
	[customerID],
	[gender],
	[tenure],
	[PhoneService],
	[MultipleLines],
	[InternetService],
	[OnlineSecurity],
	[DeviceProtection],
	[Contract],
	[PaymentMethod],
	[MonthlyCharges],
	[TotalCharges],
	[Churn]
FROM [dbo].[TelcoCustomerChurnQ]
WHERE MultipleLines IS NOT NULL
		AND OnlineSecurity IS NOT NULL
		AND DeviceProtection IS NOT NULL
		AND Churn IN (0, 1)
	;
/*
checking and removing duplicates
*/

DELETE FROM [dbo].[TelcoCustomerChurnQ]
WHERE [customerID] IN (
    SELECT [customerID]
    FROM [dbo].[TelcoCustomerChurnQ]
    GROUP BY [customerID]
    HAVING COUNT(*) > 1
);

