SELECT
  COUNT(DISTINCT fullVisitorId) AS total_users,
  SUM(totals.visits) AS total_sessions,
  SUM(totals.transactions) AS total_transactions,
  SUM(totals.transactionRevenue) / 1000000 AS total_revenue,
  SAFE_DIVIDE(SUM(totals.transactions), SUM(totals.visits)) AS conversion_rate
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20160831';
