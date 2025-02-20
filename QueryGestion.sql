---calcula las ventas por año y mes y su tasa de variacion
SELECT 
    YEAR(CAST(Convert(DATE,Sales_Date,103) AS DATE)) AS Año,
    MONTH(CAST(Convert(DATE,Sales_Date,103) AS DATE)) AS Mes,
    COUNT (*) AS Total_Ventas,
    LAG(COUNT(*)) OVER (PARTITION BY YEAR(CAST(Convert(DATE,Sales_Date,103) AS DATE)) 
    ORDER BY MONTH(CAST(Convert(DATE,Sales_Date,103) AS DATE))) AS Ventas_Anteriores_Mes,

    CASE 
    WHEN LAG(COUNT(*)) OVER (PARTITION BY YEAR(CAST(Convert(DATE,Sales_Date,103) AS DATE))
    ORDER BY MONTH(CAST(Convert(DATE,Sales_Date,103) AS DATE))) IS NULL
    THEN NULL
    ELSE ROUND(100.0 * (COUNT(*) - LAG(COUNT(*)) OVER (PARTITION BY YEAR(CAST(Convert(DATE,Sales_Date,103)))) AS DATE))