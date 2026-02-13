SELECT
  trafficSource.source AS source,
  COUNT(DISTINCT fullVisitorId) AS users,
  SUM(totals.transactions) AS transactions,
  SUM(totals.transactionRevenue) / 1000000 AS revenue
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20160831'
GROUP BY
  source
ORDER BY
  revenue DESC
LIMIT 20;
