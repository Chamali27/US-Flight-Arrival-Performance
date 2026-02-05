# US Flight Arrival Performance Analysis (2010–2025)

This repository contains an analysis of U.S. flight arrival performance using **SQL** and **Power BI**. The project examines flight delays, cancellations, diversions, and root causes, providing interactive dashboards for airline and airport performance insights.

---

## 📂 Folder Structure
```
US-Flight-Arrival-Performance/
│
├── README.md
├── data/
│ └── flight_arrival_performance.csv # Raw dataset
├── sql/
│ └── analysis_queries.sql # SQL analysis queries
├── powerbi/
│ ├── Flight_Performance_Dashboard.pbix # Power BI dashboard file
│ └── dashboard_screenshots/
│ ├── Airline Performance Overview.png
│ ├── Airport Performance Analysis.png
│ └── Delay Root Cause Analysis.png

```

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

- **SQL:** Analytical queries for airline, airport, and delay analysis  
  (`sql/analysis_queries.sql`)
- **Power BI:** Interactive dashboards and data visualization  
  (`powerbi/Flight_Performance_Dashboard.pbix`)
- **Dashboard Screenshots:** PNG images for quick visual reference  
  (`powerbi/dashboard_screenshots/`)

---

## ⚡ Dashboards Overview

### 1. Airline Performance Overview
- Displays total flights, cancellation rate, diversion rate, total delay impact, and average delay per flight by airline.
- Screenshot:  
  `powerbi/dashboard_screenshots/Airline Performance Overview.png`

### 2. Delay Root Cause Analysis
- Analyzes the contribution of different delay causes including carrier, weather, NAS, security, and late-arriving aircraft.
- Screenshot:  
  `powerbi/dashboard_screenshots/Delay Root Cause Analysis.png`

### 3. Airport Performance Analysis
- Evaluates airport-level operational performance using metrics such as average delay per flight, cancellation rate, and diversion rate.
- Screenshot:  
  `powerbi/dashboard_screenshots/Airport Performance Analysis.png`

---

## 📌 How to Use

### SQL Analysis
- Open `sql/analysis_queries.sql` in your SQL environment.
- Execute queries to generate analytical results.

### Power BI Dashboard
- Open `powerbi/Flight_Performance_Dashboard.pbix` using Power BI Desktop.
- Use slicers and filters to explore airline-, airport-, and time-based trends.

### Dashboard Screenshots
- View dashboard visuals directly from  
  `powerbi/dashboard_screenshots/`  
  without opening Power BI.

---

## ⚠ Limitations

- The analysis is based on aggregated arrival-level data.
- Delay causes follow BTS predefined categories and may not capture all operational dependencies.
- Departure delays and passenger-centric impacts are not included.

---

## 📄 References

- Bureau of Transportation Statistics (BTS), TranStats On-Time Performance Database  
  https://www.transtats.bts.gov
