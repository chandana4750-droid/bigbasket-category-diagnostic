# Tableau Public setup checklist

1. Open Tableau Public and connect to `monthly_category_revenue.csv`.
2. Create a monthly line chart:
   - Columns: `month`
   - Rows: `SUM(total_revenue)`
3. Create a category bar chart:
   - Rows: `category`
   - Columns: `SUM(total_revenue)`
   - Sort descending.
   - Create a calculated field `Target Status` using the three categories listed in README/data story and color by it.
4. Create KPI sheets for:
   - Total Revenue = SUM(total_revenue)
   - Total Delivered Orders = SUM(order_count)
   - Average Order Value = SUM(total_revenue) / SUM(order_count)
   - Categories Meeting Target = 3
5. Add a category or month filter and apply it to all worksheets using the same data source.
6. Assemble one dashboard with floating layout.
7. Publish publicly on Tableau Public and paste the generated public URL into `README.md`.

Do not claim a Tableau URL until the workbook has actually been published and opened publicly.
