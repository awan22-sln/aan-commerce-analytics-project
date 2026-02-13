SELECT
  device.deviceCategory AS device,
  COUNT(DISTINCT fullVisitorId) AS users,
  SUM(totals.visits) AS sessions,
  SUM(totals.transactions) AS transactions,
  SUM(totals.transactionRevenue) / 1000000 AS revenue,
  SAFE_DIVIDE(SUM(totals.transactions), SUM(totals.visits)) AS conversion_rate
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20160831'
GROUP BY
  device
ORDER BY
  revenue DESC;
