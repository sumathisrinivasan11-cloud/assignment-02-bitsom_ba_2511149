-- ============================================================
-- STAR SCHEMA FOR RETAIL DATA WAREHOUSE
-- ============================================================

-- ============================
-- DIMENSION: DATE
-- ============================
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

-- ============================
-- DIMENSION: STORE
-- ============================
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

-- ============================
-- DIMENSION: PRODUCT
-- ============================
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- ============================
-- FACT TABLE: SALES
-- ============================
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT,
    unit_price DECIMAL(12,2),
    total_sales DECIMAL(12,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- ============================================================
-- INSERT CLEANED DIMENSION DATA
-- ============================================================

INSERT INTO dim_date VALUES
(1, '2023-08-29', 29, 8, 2023),
(2, '2023-12-12', 12, 12, 2023),
(3, '2023-02-05', 5, 2, 2023),
(4, '2023-10-26', 26, 10, 2023),
(5, '2023-06-04', 4, 6, 2023),
(6, '2023-05-21', 21, 5, 2023),
(7, '2023-01-15', 15, 1, 2023),
(8, '2023-03-31', 31, 3, 2023),
(9, '2023-11-18', 18, 11, 2023),
(10, '2023-07-22', 22, 7, 2023);

INSERT INTO dim_store VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune'),
(5, 'Mumbai Central', 'Mumbai');

INSERT INTO dim_product VALUES
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Phone', 'Electronics'),
(4, 'Smartwatch', 'Electronics'),
(5, 'Atta 10kg', 'Grocery'),
(6, 'Jeans', 'Clothing'),
(7, 'Jacket', 'Clothing'),
(8, 'Milk 1L', 'Groceries'),
(9, 'Laptop', 'Electronics'),
(10, 'Biscuits', 'Groceries');

-- ============================================================
-- INSERT CLEANED FACT DATA (10 ROWS)
-- ============================================================

INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 3, 49262.78, 3 * 49262.78),
(2, 2, 1, 2, 11, 23226.12, 11 * 23226.12),
(3, 3, 1, 3, 20, 48703.39, 20 * 48703.39),
(4, 4, 4, 6, 16, 2317.47, 16 * 2317.47),
(5, 5, 1, 7, 15, 30187.24, 15 * 30187.24),
(6, 6, 3, 9, 13, 42343.15, 13 * 42343.15),
(7, 7, 1, 4, 10, 58851.01, 10 * 58851.01),
(8, 8, 4, 4, 6, 58851.01, 6 * 58851.01),
(9, 9, 2, 7, 5, 30187.24, 5 * 30187.24),
(10, 10, 1, 5, 3, 52464.00, 3 * 52464.00);