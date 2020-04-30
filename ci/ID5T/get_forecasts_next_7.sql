-- Use Account id = 3
-- User ID = \x000000000000000000000003


-- Get all transactions with account_id 3

-- SELECT * FROM transactions
-- WHERE account_id = 3 AND date > current_date

-- SELECT * from forecasts
-- WHERE account_id = 3 AND date > current_date
-- ORDER BY date ASC
-- LIMIT 7;

-- TRANSACTIONS account_id
-- FORECASTS transaction_id

SELECT * FROM accounts
  JOIN transactions ON (transactions.account_id = accounts.id)
  JOIN forecasts ON (forecasts.transaction_id = transactions.id)
WHERE accounts.user_id = '\x000000000000000000000003' AND forecasts.date > current_date
ORDER BY forecasts.date ASC
LIMIT 7;
