-- ========================================
-- STEP 1: Clean NULL values
-- ========================================
-- Keep arr_flights as NULL if unknown (do NOT set 0)
UPDATE Flight_Arrival_Performance
SET arr_del15 = 0 WHERE arr_del15 IS NULL;
UPDATE Flight_Arrival_Performance
SET arr_cancelled = 0 WHERE arr_cancelled IS NULL;
UPDATE Flight_Arrival_Performance
SET arr_diverted = 0 WHERE arr_diverted IS NULL;
UPDATE Flight_Arrival_Performance
SET arr_delay = 0 WHERE arr_delay IS NULL;
UPDATE Flight_Arrival_Performance
SET carrier_delay = 0 WHERE carrier_delay IS NULL;
UPDATE Flight_Arrival_Performance
SET weather_delay = 0 WHERE weather_delay IS NULL;
UPDATE Flight_Arrival_Performance
SET nas_delay = 0 WHERE nas_delay IS NULL;
UPDATE Flight_Arrival_Performance
SET security_delay = 0 WHERE security_delay IS NULL;
UPDATE Flight_Arrival_Performance
SET late_aircraft_delay = 0 WHERE late_aircraft_delay IS NULL;
UPDATE Flight_Arrival_Performance
SET carrier_ct = 0 WHERE carrier_ct IS NULL;
UPDATE Flight_Arrival_Performance
SET weather_ct = 0 WHERE weather_ct IS NULL;
UPDATE Flight_Arrival_Performance
SET nas_ct = 0 WHERE nas_ct IS NULL;
UPDATE Flight_Arrival_Performance
SET security_ct = 0 WHERE security_ct IS NULL;
UPDATE Flight_Arrival_Performance
SET late_aircraft_ct = 0 WHERE late_aircraft_ct IS NULL;

-- ========================================
-- STEP 2: Add calculated columns
-- ========================================
-- Delay %
ALTER TABLE Flight_Arrival_Performance
ADD delay_percentage FLOAT;

UPDATE Flight_Arrival_Performance
SET delay_percentage = 
    CASE 
        WHEN arr_flights IS NULL OR arr_flights = 0 THEN NULL
        ELSE arr_del15 * 100.0 / arr_flights
    END;


-- Cancellation Rate %
ALTER TABLE Flight_Arrival_Performance
ADD cancellation_rate FLOAT;

UPDATE Flight_Arrival_Performance
SET cancellation_rate = 
    CASE 
        WHEN arr_flights IS NULL OR arr_flights = 0 THEN NULL
        ELSE arr_cancelled * 100.0 / arr_flights
    END;

-- Diversion Rate %
ALTER TABLE Flight_Arrival_Performance
ADD diversion_rate FLOAT;

UPDATE Flight_Arrival_Performance
SET diversion_rate =
    CASE 
        WHEN arr_flights IS NULL OR arr_flights = 0 THEN NULL
        ELSE arr_diverted * 100.0 / arr_flights
    END;

-- ========================================
-- STEP 3: Create Views for Aggregation
-- ========================================
-- Airline-level performance

CREATE OR ALTER VIEW vw_Airline_Performance AS
SELECT
    carrier,
    carrier_name,
    year,
    month,

    SUM(arr_flights) AS Total_Flights,
    SUM(arr_del15) AS Delayed_Flights,
    SUM(arr_cancelled) AS Total_Cancelled,
    SUM(arr_diverted) AS Total_Diverted,

    ROUND(SUM(arr_del15) * 100.0 / NULLIF(SUM(arr_flights), 0), 2) AS Delay_Percentage,
    ROUND(SUM(arr_cancelled) * 100.0 / NULLIF(SUM(arr_flights), 0), 2) AS Cancellation_Rate,
    ROUND(SUM(arr_diverted) * 100.0 / NULLIF(SUM(arr_flights), 0), 2) AS Diversion_Rate,

    SUM(arr_delay) AS Total_Delay_Minutes,
    SUM(carrier_delay) AS Carrier_Delay_Minutes,
    SUM(weather_delay) AS Weather_Delay_Minutes,
    SUM(nas_delay) AS NAS_Delay_Minutes,              -- ✅ ADD
    SUM(security_delay) AS Security_Delay_Minutes,    -- ✅ ADD
    SUM(late_aircraft_delay) AS Late_Aircraft_Delay_Minutes

FROM Flight_Arrival_Performance
GROUP BY carrier, carrier_name, year, month;



-- Airport-level performance
CREATE OR ALTER VIEW vw_Airport_Performance AS
SELECT
    airport,
    airport_name,
    year,
    month,

    -- Volumes
    SUM(arr_flights)     AS Total_Flights,
    SUM(arr_del15)       AS Delayed_Flights,
    SUM(arr_cancelled)   AS Total_Cancelled,
    SUM(arr_diverted)    AS Total_Diverted,

    -- Percentages
    ROUND(SUM(arr_del15) * 100.0 / NULLIF(SUM(arr_flights), 0), 2) AS Delay_Percentage,
    ROUND(SUM(arr_cancelled) * 100.0 / NULLIF(SUM(arr_flights), 0), 2) AS Cancellation_Rate,
    ROUND(SUM(arr_diverted) * 100.0 / NULLIF(SUM(arr_flights), 0), 2) AS Diversion_Rate,

    -- Delay minutes
    SUM(arr_delay) AS Total_Delay_Minutes

FROM Flight_Arrival_Performance
GROUP BY airport, airport_name, year, month;


-- ========================================
-- STEP 4: Select top 20 for verification
-- ========================================
SELECT TOP 20 * FROM vw_Airline_Performance;
SELECT TOP 20 * FROM vw_Airport_Performance;