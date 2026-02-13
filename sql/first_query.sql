SELECT
  date,
  fullVisitorId,
  totals.visits,
  totals.transactions,
  totals.transactionRevenue,
  trafficSource.source,
  device.deviceCategory,
  geoNetwork.country
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
LIMIT 1000;
