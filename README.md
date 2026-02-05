
# US Flight Arrival Performance Analysis (2010–2025)

This repository contains an analysis of U.S. flight arrival performance using **SQL** and **Power BI**. The project examines flight delays, cancellations, diversions, and root causes, providing interactive dashboards for airline and airport performance insights.

---

## 📂 Folder Structure




---

## 📝 Project Overview

The project analyzes U.S. flight arrival performance between **January 2010 and September 2025**, using the **Bureau of Transportation Statistics (BTS) On-Time Performance dataset**.

Key objectives:
- Examine trends in flight delays, cancellations, and diversions.
- Identify root causes of delays across airlines and airports.
- Compare airline and airport performance.
- Provide interactive dashboards to support operational and strategic decision-making.

---

## 💾 Dataset

- **File:** `data/flight_arrival_performance.csv`  
- **Source:** [BTS TranStats OT Delay Database](https://www.transtats.bts.gov)  
- **Coverage:** Domestic flight arrivals in the U.S., 2010–2025  
- **Details:** Includes total flights, delayed flights, delay minutes, cancellations, diversions, and delay causes (carrier, weather, NAS, security, late aircraft).

---

## 🛠 Technologies Used

- **SQL:** Data cleaning, preprocessing, aggregation, and analytical queries (`sql/analysis_queries.sql`)  
- **Power BI:** Dashboard creation and visualization (`powerbi/pbix/Flight_Performance_Dashboard.pbix`)  
- **Screenshots:** PNG images of dashboards for quick viewing (`dashboard_screenshots/`)

---

## ⚡ Dashboards Overview

1. **Airline Performance Overview**  
   - Measures total flights, cancellations, diversions, and average delays per airline.  
   - Screenshot: `dashboard_screenshots/airline_performance.png`

2. **Delay Root Cause Analysis**  
   - Visualizes contribution of different causes to total delay (carrier, weather, NAS, security, late aircraft).  
   - Screenshot: `dashboard_screenshots/delay_root_cause.png`

3. **Airport Performance Analysis**  
   - Measures operational efficiency at the airport level: delays, cancellations, diversions.  
   - Screenshot: `dashboard_screenshots/airport_performance.png`

---

## 📌 How to Use

1. **SQL Queries:**  
   - Open `sql/analysis_queries.sql` in your SQL environment.  
   - Run queries to reproduce the tables and insights used in Power BI dashboards.

2. **Power BI Dashboard:**  
   - Open `powerbi/pbix/Flight_Performance_Dashboard.pbix` in Power BI Desktop.  
   - Use slicers and filters to explore trends by airline, airport, month, and year.

3. **Dashboard Screenshots:**  
   - View high-level visuals in `dashboard_screenshots/` without opening Power BI.

---

## ⚠ Limitations

- Analysis uses aggregated arrival-level data; flight-level details like aircraft type or crew info are not included.  
- Delay causes are categorized based on BTS predefined categories and may not reflect all operational factors.  
- Only arrival performance is analyzed, not departure delays or passenger-level outcomes.

---

## 📄 References

- Bureau of Transportation Statistics (BTS) TranStats OT Delay Database: [https://www.transtats.bts.gov](https://www.transtats.bts.gov)

---


