# BigBasket Category Performance Diagnostic

## Overview
This repository implements the four-part BigBasket category performance diagnostic using one deterministic SQLite dataset, an exact monthly-category CSV export, a spreadsheet cross-check, a Tableau Public dashboard, and an independent Pandas cleaning analysis.

## Repository structure
- `generate_data.py` — deterministic database/raw-export generator (`random.seed(42)`).
- `bigbasket_capstone.db` — SQLite database used for Parts 1–3.
- `orders_raw.csv` — deliberately messy raw export for Part 4.
- `products.csv` — product/supplier lookup for Part 4.
- `verify.sql` — table/status verification queries and expected results.
- `01_foundations.sql` — foundational SELECT/WHERE, DISTINCT, ORDER BY/LIMIT, AS, IN, BETWEEN, NOT BETWEEN, IS NULL queries.
- `02_aggregation_joins.sql` — JOIN, GROUP BY, HAVING, and LEFT JOIN/COUNT queries.
- `03_reporting.sql` — CASE tiers, monthly report, and target-variance report.
- `monthly_category_revenue.csv` — exact Part 1 monthly-by-category Delivered revenue export.
- `bigbasket_category_analysis.xlsx` — spreadsheet cross-check workbook.
- `analysis.ipynb` — Part 4 Pandas cleaning, analysis, charts, and cross-validation.
- `ai_log.md` — the two required RCTCF AI-assisted prompts and concrete verification steps.

## Regenerating the data
From the repository root:

```bash
python3 generate_data.py
```

Do not change the fixed seed or source lists. This recreates `bigbasket_capstone.db`, `orders_raw.csv`, and `products.csv`. The monthly CSV should then be exported from the Task 5(b) query in `03_reporting.sql`.

## Key SQL findings
Part 1's Delivered category totals are:
- Household Essentials — INR 21,715
- Personal Care — INR 16,382
- Bakery — INR 15,410
- Dairy & Eggs — INR 14,090
- Snacks & Beverages — INR 10,895
- Fruits & Vegetables — INR 9,790

The monthly export has 36 rows and total Delivered revenue of INR 88,282.

## Data story
### Target status
- Household Essentials — Above Target by INR 4,715.
- Personal Care — Above Target by INR 882.
- Bakery — Above Target by INR 3,410.
- Dairy & Eggs — Below Target - Watch by INR 2,410.
- Snacks & Beverages — Below Target - Critical by INR 2,105.
- Fruits & Vegetables — Below Target - Critical by INR 2,210.

### Two recommendations
1. Review catalog/marketing opportunities for **Snacks & Beverages** because its Delivered revenue is INR 2,105 below its INR 13,000 target and is classified as Below Target - Critical.
2. Review suppliers and category mix for **Fruits & Vegetables** because its Delivered revenue is INR 2,210 below its INR 12,000 target and is classified as Below Target - Critical.

## Tableau Public
**Live Tableau Public dashboard:** `BigBasket Category Performance Diagnostic — Tableau Public`

The dashboard should use `monthly_category_revenue.csv` and contain the required monthly time series, descending category bar chart with the three target-status tiers, four KPI cards, and a dashboard-wide interactive filter.

## AI-assisted prompting
See [`ai_log.md`](ai_log.md).

## Part 4 notebook
See [`analysis.ipynb`](analysis.ipynb). It independently cleans duplicates/casing/missing revenue, applies IQR capping, merges supplier data, produces three charts, and cross-validates the top category and supplier against Part 1.
