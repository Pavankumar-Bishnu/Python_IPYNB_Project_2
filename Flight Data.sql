SELECT * FROM project_pv.flight_dataset;

-- Total Revenue & Flight Statistics
SELECT 
    COUNT(*) AS Total_Flights,
    COUNT(DISTINCT Airline) AS Total_Airlines,
    COUNT(DISTINCT CONCAT(Source, '-', Destination)) AS Total_Routes,
    SUM(Price) AS Total_Revenue,
    ROUND(AVG(Price), 2) AS Avg_Ticket_Price,
    MIN(Price) AS Min_Price,
    MAX(Price) AS Max_Price,
    ROUND(STDDEV(Price), 2) AS Price_Std_Deviation
FROM flight_dataset;

-- Top Profitable Routes
SELECT 
    Source,
    Destination,
    COUNT(*) AS Flight_Count,
    ROUND(AVG(Price), 2) AS Avg_Price,
    MIN(Price) AS Min_Price,
    MAX(Price) AS Max_Price,
    SUM(Price) AS Total_Revenue,
    ROUND(AVG(Duration_Min), 0) AS Avg_Duration,
    ROUND(AVG(Total_Stops), 2) AS Avg_Stops,
    ROUND(AVG(Price) / NULLIF(AVG(Duration_Min), 0) * 60, 2) AS Revenue_Per_Hour
FROM flight_dataset
GROUP BY Source, Destination
ORDER BY Total_Revenue DESC;

-- Departure Time Impact on Pricing
SELECT 
    Dep_Time_Bucket,
    COUNT(*) AS Flight_Count,
    ROUND(AVG(Price), 2) AS Avg_Price,
    MIN(Price) AS Min_Price,
    MAX(Price) AS Max_Price,
    ROUND(AVG(Price), 2) - (SELECT ROUND(AVG(Price), 2) FROM flight_dataset) AS Price_Variance_From_Avg
FROM flight_dataset
GROUP BY Dep_Time_Bucket
ORDER BY 
    CASE Dep_Time_Bucket
        WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
        WHEN 'Night' THEN 4
    END;
    
-- Month-wise Revenue & Flight Trends
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    MONTHNAME(Date) AS Month_Name,
    COUNT(*) AS Total_Flights,
    ROUND(AVG(Price), 2) AS Avg_Price,
    SUM(Price) AS Total_Revenue,
    MIN(Price) AS Min_Price,
    MAX(Price) AS Max_Price,
    ROUND(AVG(Duration_Min), 0) AS Avg_Duration
FROM flight_dataset
GROUP BY DATE_FORMAT(Date, '%Y-%m'), MONTHNAME(Date)
ORDER BY Month;

-- Top 10 Routes by Revenue
SELECT 
    CONCAT(Source, ' → ', Destination) AS Route,
    COUNT(*) AS Flight_Count,
    SUM(Price) AS Total_Revenue,
    ROUND(AVG(Price), 2) AS Avg_Price,
    ROUND(AVG(Duration_Min) / 60.0, 1) AS Avg_Duration_Hours
FROM flight_dataset
GROUP BY Source, Destination
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Airline Operational Efficiency
SELECT 
    Airline,
    COUNT(*) AS Total_Flights,
    ROUND(AVG(Duration_Min), 0) AS Avg_Duration,
    ROUND(AVG(Total_Stops), 2) AS Avg_Stops,
    ROUND(AVG(Price), 2) AS Avg_Price,
    ROUND(AVG(Price) / NULLIF(AVG(Duration_Min), 0) * 60, 2) AS Revenue_Per_Hour,
    ROUND(SUM(CASE WHEN Total_Stops = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Direct_Flight_Percent
FROM flight_dataset
GROUP BY Airline
ORDER BY Revenue_Per_Hour DESC;

-- Busiest Source Cities
SELECT 
    Source AS City,
    COUNT(*) AS Outbound_Flights,
    ROUND(AVG(Price), 2) AS Avg_Price,
    SUM(Price) AS Total_Revenue,
    COUNT(DISTINCT Destination) AS Destinations_Served
FROM flight_dataset
GROUP BY Source
ORDER BY Outbound_Flights DESC;


-- Route-Airline Price Comparison
SELECT 
    CONCAT(Source, ' → ', Destination) AS Route,
    Airline,
    COUNT(*) AS Flight_Count,
    ROUND(AVG(Price), 2) AS Avg_Price,
    MIN(Price) AS Min_Price,
    MAX(Price) AS Max_Price,
    ROUND(MAX(Price) - MIN(Price), 2) AS Price_Range
FROM flight_dataset
GROUP BY Source, Destination, Airline
HAVING COUNT(*) >= 10
ORDER BY Route, Avg_Price;

-- Peak Hours Identification
SELECT 
    Dep_hours AS Departure_Hour,
    COUNT(*) AS Flight_Count,
    ROUND(AVG(Price), 2) AS Avg_Price,
    CASE 
        WHEN Dep_hours BETWEEN 6 AND 9 THEN 'Morning Peak'
        WHEN Dep_hours BETWEEN 17 AND 21 THEN 'Evening Peak'
        ELSE 'Off-Peak'
    END AS Peak_Category
FROM flight_dataset
GROUP BY Dep_hours
ORDER BY Dep_hours;

-- Duration Efficiency Analysis
SELECT Source,
    Destination,
    Total_Stops,
    COUNT(*) AS Flight_Count,
    ROUND(AVG(Duration_Min), 0) AS Avg_Duration_Minutes,
    ROUND(AVG(Duration_Min) / 60.0, 1) AS Avg_Duration_Hours,
    ROUND(AVG(Price), 2) AS Avg_Price
FROM flight_dataset
GROUP BY Source, Destination, Total_Stops
HAVING COUNT(*) >= 5
ORDER BY Source, Destination, Total_Stops;
