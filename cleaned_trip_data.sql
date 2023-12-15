--Creates a table that separates started_at and ended_at into dates, hours, and trip length. 
SELECT 
  *,
  date(started_at) as start_date,
  date(ended_at) as end_date,
  FORMAT_TIMESTAMP('%H:00:00', started_at) AS start_time,
  FORMAT_TIMESTAMP('%H:00:00', ended_at) AS end_time,
  timestamp_diff(ended_at, started_at, MINUTE) as trip_length 

FROM `sonic-charmer-407302.bike_share_data.2023_trip_combined_data`

--Removes outlying rows that don't benefit the analysis. Keeps nulls to focus on trip analysis.
WHERE
end_station_id <> "OH Charging Stx - Test" or end_station_id is null;
