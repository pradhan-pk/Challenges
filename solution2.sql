DELIMITER $$
CREATE PROCEDURE vwap(IN start_date_time BIGINT)
BEGIN
	SET @datein = STR_TO_DATE(start_date_time,'%Y%m%d%H%i');
	SET @time_gap = 5;
	SELECT 
    DATE_FORMAT(STR_TO_DATE(`<date>`,'%Y%m%d%H%i'), '%d/%m/%Y') AS Start_Date,
	DATE_FORMAT(STR_TO_DATE(`<date>`,'%Y%m%d%H%i'), '%H:%i') AS Start_Time,
    DATE_FORMAT(DATE_ADD(str_to_date(@datein, '%Y-%m-%d %T'), INTERVAL @time_gap HOUR), '%H:%i') as End_Time,
    (SUM(`<vol>`*`<close>`)/SUM(`<vol>`)) as VWAP
	FROM sample_dataset2
	WHERE str_to_date(`<date>`,'%Y%m%d%H%i') BETWEEN
	str_to_date(@datein, '%Y-%m-%d %T') AND 
	DATE_ADD(str_to_date(@datein, '%Y-%m-%d %T'), INTERVAL @time_gap HOUR);
END $$
DELIMITER ;

CALL vwap(201010110900);