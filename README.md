# Honey Production in the USA (1998–2012): Data Validation & Dashboard

## Overview
This project analyzes honey production trends in the United States from **1998–2012**.  
I validated and explored the dataset using **SQL in BigQuery** to confirm its quality, then built a **Tableau dashboard** to visualize production, yield, and pricing trends.

---

## Dataset
- **Source**: [Kaggle – Honey Production Dataset](https://www.kaggle.com/datasets/jessicali9530/honey-production?utm)
- **Key variables**:  
  - `year` – Year of production  
  - `state` – U.S. state  
  - `numcol` – Number of colonies  
  - `yieldpercol` – Yield per colony (lbs)  
  - `totalprod` – Total production (lbs)  
  - `stocks` – Stocks held by producers (lbs)  
  - `priceperlb` – Price per pound (USD)  
  - `prodvalue` – Value of production (USD)  

---

## Data Validation (SQL in BigQuery)
The honey production dataset from Kaggle was already clean, but I validated it using **SQL in BigQuery** to ensure accuracy, consistency, and integrity. Below are the queries I ran and why.


# Validate Year Range
```sql
SELECT DISTINCT year
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE year NOT BETWEEN 1998 AND 2012
ORDER BY year;
```
**Purpose:** Ensures that all records fall within the expected year range (1998–2012).

```sql
SELECT state
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE LENGTH(state) != 2;
```
**Purpose:** Confirms that all states are represented as two-letter abbreviations

```sql
SELECT *
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE numcol IS NULL
   OR yieldpercol IS NULL
   OR totalprod IS NULL
   OR stocks IS NULL
   OR priceperlb IS NULL
   OR prodvalue IS NULL;
```
**Purpose:** Verifies that there are no null values in critical columns.

```sql
SELECT *, 
       (numcol * yieldpercol) AS expected_total_production,
       (totalprod - (numcol * yieldpercol)) AS difference
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE totalprod != (numcol * yieldpercol);
```
**Purpose:** Ensures that totalprod (total production) correctly equals
numcol × yieldpercol. Any differences would indicate data inconsistencies.

```sql
SELECT *
FROM `plucky-respect-467323-d9.honey_production.honey_production`
WHERE numcol < 0
   OR yieldpercol < 0
   OR totalprod < 0
   OR stocks < 0
   OR priceperlb < 0
   OR priceperlb > 10
   OR prodvalue < 0;
```
**Purpose:** Checks for impossible or unrealistic values, such as negative production or excessively high prices.

```sql
SELECT state, year, COUNT(*) AS record_count
FROM `plucky-respect-467323-d9.honey_production.honey_production`
GROUP BY state, year
HAVING COUNT(*) > 1;
```
**Purpose:** Confirms that each (state, year) pair appears only once in the dataset.

---

## Visualization (Tableau)
The Tableau dashboard explores:  
- Trends in honey production over time  
- Top-producing states  
- Comparison of production vs. price changes  
- Efficiency of honey production per colony  

### Dashboard Preview

[**View Interactive Dashboard on Tableau Public**](https://public.tableau.com/app/profile/micah.wells4903)

---

## Tools & Skills
- **SQL (BigQuery)** – Data validation & exploration  
- **Tableau** – Dashboard design & storytelling  
- **GitHub** – Project documentation  

---

## Key Insights
- U.S. honey production steadily **declined between 1998–2012**  
- **Prices increased** despite lower production  
- **Midwestern states** consistently ranked among the top producers  
- States varied widely in **production efficiency per colony**  

---
