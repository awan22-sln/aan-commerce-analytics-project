SELECT
  PARSE_DATE('%Y%m%d', date) AS session_date,
  SUM(totals.transactionRevenue) / 1000000 AS revenue,
  SUM(totals.transactions) AS transactions,
  COUNT(DISTINCT fullVisitorId) AS users
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20160831'
GROUP BY
  session_date
ORDER BY
  session_date;
