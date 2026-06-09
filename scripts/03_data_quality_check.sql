/* ==========================================================
   E-COMMERCE ORDERS DATA QUALITY ASSESSMENT
   Purpose:
     Validate record completeness, consistency, uniqueness,
     formatting, and date accuracy before analysis.
   ========================================================== */

-- ==========================================================
-- 1. Duplicate Record Checks
-- ==========================================================

-- Identify duplicate Order IDs
SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;


-- ==========================================================
-- 2. Missing Value Assessment
-- ==========================================================

-- Identify records containing NULL values
SELECT
    order_id,
    order_date,
    customer_id,
    product,
    quantity,
    unit_price,
    shipping_address,
    payment_method,
    order_status,
    tracking_number,
    items_in_cart,
    coupon_code,
    referral_source,
    total_price
FROM orders
WHERE
    order_id IS NULL OR
    order_date IS NULL OR
    customer_id IS NULL OR
    product IS NULL OR
    quantity IS NULL OR
    unit_price IS NULL OR
    shipping_address IS NULL OR
    payment_method IS NULL OR
    order_status IS NULL OR
    tracking_number IS NULL OR
    items_in_cart IS NULL OR
    coupon_code IS NULL OR
    referral_source IS NULL OR
    total_price IS NULL;


-- ==========================================================
-- 3. Business Rule Validation
-- ==========================================================

-- Verify that Total Price equals Unit Price × Quantity
SELECT
    order_id,
    coupon_code,
    unit_price,
    quantity,
    total_price
FROM orders
WHERE total_price != (unit_price * quantity);


-- ==========================================================
-- 4. Categorical Data Review
-- ==========================================================

-- Review distinct product values
SELECT DISTINCT product
FROM orders
ORDER BY product;

-- Review distinct payment methods
SELECT DISTINCT payment_method
FROM orders
ORDER BY payment_method;

-- Review distinct order statuses
SELECT DISTINCT order_status
FROM orders
ORDER BY order_status;

-- Review distinct coupon codes
SELECT DISTINCT coupon_code
FROM orders
ORDER BY coupon_code;

-- Review distinct referral sources
SELECT DISTINCT referral_source
FROM orders
ORDER BY referral_source;


-- ==========================================================
-- 5. Date Validation
-- ==========================================================

-- Determine date range of the dataset
SELECT
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date
FROM orders;

-- Identify orders with dates later than data lifespan
SELECT
    order_id,
    order_date
FROM orders
WHERE order_date > '2025-06-30';

-- ==========================================================
-- 6. Text Formatting Checks
-- ==========================================================

-- Detect leading or trailing spaces in key text fields
SELECT
    order_id,
    customer_id,
    shipping_address,
    tracking_number
FROM orders
WHERE
    order_id != TRIM(order_id) OR
    customer_id != TRIM(customer_id) OR
    shipping_address != TRIM(shipping_address) OR
    tracking_number != TRIM(tracking_number);
