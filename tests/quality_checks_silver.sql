/*
=================================================================================
Quality Checks
=================================================================================
Script Purpose:
  This script performs various quality checks for data consistency, accuracy,
  and standardization across the 'silver' schema. It includes checks for:
  - Null or duplicate primary keys.
  - Unwanted spaces in string fields.
  - Data standardization and consistency.
  - Invalid date ranges and orders.
  - Data consistency between related fields.

Usage Notes:
  - Run these checks after data loading Silver Layer.
  - Investidate and resolve and discrepancies found during the checks.
=================================================================================
*/

-- =================================================================================
-- Checking 'silver.crm_cust_info'
-- 
=================================================================================
  
-- Check for duplicates and NULLs in Primary Key
-- Expectation: No Results
SELECT
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL


-- Check for NULLs or Negative Numbers
-- Expectation: No Results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

  
-- Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info


-- Check for Invalid Date Orders
SELECT *
FROM silver.crm_prd_info 
WHERE prd_end_dt < prd_start_dt 



