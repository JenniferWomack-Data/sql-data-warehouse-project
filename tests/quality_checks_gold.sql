/*
========================================================================================================
Quality Checks
========================================================================================================
Script Purpose:
    This script performs qualtity checks to validate the integrity, consistency and
    accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential intergrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
========================================================================================================
*/


-- ======================================================================================================
Checking 'gold.facts_sales'
-- ======================================================================================================
-- Check the data model connectivity between fact and dimensions
SELECT * 
FROM gold.facts_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL
