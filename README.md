# Coffee Shop Sales Analysis

## Project Overview
This project analyzes sales, product, customer, and city data for a coffee shop. The goal is to generate insights about top-selling products, customer behavior, city revenue, and product ratings.

## Skills & Tools
- SQL (MySQL)
- Joins, aggregations, window functions, GROUP BY, HAVING
- Date formatting for trends
- Data analysis and business insights

## Dataset Description
### Tables:
1. **sales**: Records each sale (sale_date, total, rating, product_id, customer_id)
2. **products**: Product details (product_id, product_name, price)
3. **customers**: Customer details (customer_id, customer_name, city_id)
4. **city**: City/branch details (city_id, city_name, population, estimated_rent, city_rank)

### Relationships:
- sales.product_id → products.product_id
- sales.customer_id → customers.customer_id
- customers.city_id → city.city_id

## Queries
The SQL file `CoffeeShopSales.sql` contains 15 queries covering:
- Sales overview
- Product sales and ratings
- Customer purchase behavior
- Revenue per city
- Top products and city trends
- Monthly revenue trends

## How to Run
1. Import the CSV files (`sales.csv`, `products.csv`, `customers.csv`, `city.csv`) into MySQL.
2. Open `CoffeeShopSales.sql` in MySQL Workbench.
3. Execute the queries to generate insights.

## GitHub Repository
`https://github.com/venkatabhinaypalepu/coffee_shop_sales_sql`
