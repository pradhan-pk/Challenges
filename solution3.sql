DELIMITER $$
CREATE PROCEDURE large_price_ranges()
BEGIN
	CREATE TEMPORARY TABLE t1 AS
		SELECT Date, Time, Open, Close FROM sample_dataset3 WHERE Time = 0931;
	CREATE TEMPORARY TABLE t2 AS
		SELECT Date, Time, Open, Close FROM sample_dataset3 WHERE Time = 1600;
	CREATE TEMPORARY TABLE t3 AS
		SELECT t1.Date, t1.Open, t2.Close, ROUND(ABS(t2.Close- t1.Open),2) AS "Range" 
			FROM t1 JOIN t2 ON t1.Date = t2.Date
			ORDER BY ABS(t2.Close- t1.Open) DESC LIMIT 3;
	CREATE TEMPORARY TABLE t4 AS
		SELECT Date, MAX(High) AS maxHigh FROM sample_dataset3 
			WHERE Date in (SELECT Date FROM t3) GROUP BY Date;
	SELECT a.Date, t3.Range, a.Time AS "Time Max" FROM sample_dataset3 a
		JOIN t4 ON a.High = t4.maxHigh AND a.Date=t4.Date
		JOIN t3 ON t4.Date = t3.Date
		ORDER BY t3.Range DESC;
	DROP temporary table t1,t2,t3,t4;
END $$
DELIMITER ;

CALL large_price_ranges();