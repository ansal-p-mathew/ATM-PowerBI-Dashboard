create DATABASE atm_analysis;
use atm_analysis;

show tables;
SELECT COUNT(*) 
FROM atm_data;

SELECT COUNT(*) 
FROM bob_source;

SELECT *
FROM bob_source
LIMIT 10;

#Dataset size#3580
SELECT COUNT(*) AS total_records
FROM bob_source;


#Total transaction by states
SELECT state,
       SUM(monthly_txn) AS total_transactions
FROM bob_source
GROUP BY state
ORDER BY total_transactions DESC;


#Top revenue generating
SELECT atm_id,
       atm_rev_total
FROM bob_source
ORDER BY atm_rev_total DESC
LIMIT 10;


#AVg ATM uptime
SELECT AVG(uptime) AS avg_uptime
FROM bob_source;


#Profitibality analysis
SELECT atm_type,
       AVG(gross_profit) AS avg_profit
FROM bob_source
GROUP BY atm_type;

#ATM with highest margins
SELECT atm_id,
       atm_rev_total,
       total_cost,
       gross_profit
FROM bob_source
ORDER BY gross_profit DESC
LIMIT 10;


#Transaction efficiency analysis
SELECT atm_id,
       fin_txn,
       non_fin_txn,
       (fin_txn / (fin_txn + non_fin_txn)) * 100 AS fin_txn_percentage
FROM bob_source
ORDER BY fin_txn_percentage DESC
LIMIT 10;


#Profit category
SELECT atm_id,
       gross_profit,
       CASE
           WHEN gross_profit > 30000 THEN 'High Profit'
           WHEN gross_profit BETWEEN 10000 AND 30000 THEN 'Medium Profit'
           ELSE 'Low Profit'
       END AS profit_category
FROM bob_source;

