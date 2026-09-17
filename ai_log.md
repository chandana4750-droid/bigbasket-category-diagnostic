# AI-Assisted Prompting Log

## Prompt 1 — SQL (RCTCF)
**Role:** Act as a SQL tutor familiar with SQLite and beginner analytics workflows.
**Context:** I am building the BigBasket Category Performance Diagnostic using `bigbasket_capstone.db`. The database contains `orders`, `products`, `customers`, and `category_targets`. The project requires a monthly-by-category Delivered revenue report using SQLite date functions.
**Task:** Help me draft/debug the SQL query that returns `category`, `month`, `order_count`, `total_revenue`, and `avg_revenue`, grouped by category and month and ordered by category then month.
**Constraints:** Use SQLite syntax; use `strftime('%Y-%m', order_date)`; include only Delivered orders; join orders to products by product_id; do not change the source data; keep the query deterministic.
**Format:** Return one runnable SQL query followed by a short explanation of each clause.
**Verification actually performed:** I ran the suggested query against `bigbasket_capstone.db`, checked that it returned 36 rows, and compared the category totals with the SQL acceptance values before keeping it.

## Prompt 2 — Pandas (RCTCF)
**Role:** Act as a Pandas data-cleaning tutor.
**Context:** I am cleaning the deliberately messy `orders_raw.csv` for the BigBasket capstone. Delivered, non-null `amount_inr` values contain synthetic outliers, and the brief requires an IQR upper fence and capping rather than dropping.
**Task:** Help me write/debug Pandas code to calculate Q1, Q3, IQR, the upper fence, and cap Delivered amounts above the fence with `.clip(upper=...)`.
**Constraints:** Use pandas; calculate quantiles only on Delivered rows with non-null amount; do not fill missing revenue; do not drop outliers; preserve the original dataframe until the cleaning step is explicit.
**Format:** Return concise code plus a short explanation and a verification check.
**Verification actually performed:** I re-ran the `.clip()` logic in the notebook, printed the upper fence, and manually checked three rows that had exceeded the fence to confirm their cleaned `amount_inr` equalled the computed upper-fence value.
