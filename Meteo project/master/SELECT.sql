select distinct sigfox_id, sensor_id, point_id, max(date) from master_log ml1 where date > CURRENT_DATE - INTERVAL '1 month' group by sigfox_id, sensor_id, point_id order by point_id;
