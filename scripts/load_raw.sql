CREATE SCHEMA IF NOT EXISTS raw;

CREATE OR REPLACE VIEW raw.customers AS
    SELECT * FROM read_csv_auto('data/olist_customers_dataset.csv');
CREATE OR REPLACE VIEW raw.orders AS
    SELECT * FROM read_csv_auto('data/olist_orders_dataset.csv');
CREATE OR REPLACE VIEW raw.order_items AS
    SELECT * FROM read_csv_auto('data/olist_order_items_dataset.csv');
CREATE OR REPLACE VIEW raw.order_payments AS
    SELECT * FROM read_csv_auto('data/olist_order_payments_dataset.csv');
CREATE OR REPLACE VIEW raw.order_reviews AS
    SELECT * FROM read_csv_auto('data/olist_order_reviews_dataset.csv');
CREATE OR REPLACE VIEW raw.products AS
    SELECT * FROM read_csv_auto('data/olist_products_dataset.csv');
CREATE OR REPLACE VIEW raw.sellers AS
    SELECT * FROM read_csv_auto('data/olist_sellers_dataset.csv');
CREATE OR REPLACE VIEW raw.product_category_name_translations AS
    SELECT * FROM read_csv_auto('data/product_category_name_translation.csv');

CREATE OR REPLACE VIEW raw.geolocation AS
    SELECT * FROM read_csv_auto('data/olist_geolocation_dataset.csv');
