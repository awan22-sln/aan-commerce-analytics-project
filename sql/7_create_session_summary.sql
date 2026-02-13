CREATE OR REPLACE TABLE
  `aan-commerce-analytics-project.analytics.session_summary`
AS
SELECT
  PARSE_DATE('%Y%m%d', date) AS session_date,
  fullVisitorId AS user_id,
  trafficSource.source AS source,
  device.deviceCategory AS device,
  geoNetwork.country AS country,
  totals.visits AS sessions,
  IFNULL(totals.transactions, 0) AS transactions,
  IFNULL(totals.transactionRevenue, 0) / 1000000 AS revenue
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20160831';
