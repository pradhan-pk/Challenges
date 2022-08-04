DELIMITER $$
CREATE PROCEDURE highest_gain()
BEGIN
	SELECT `<ticker>` AS Ticker, 
	(((`<close>`-`<open>`)/`<open>`)*100)  AS `Gain %` 
	FROM sample_dataset1
	ORDER BY `Gain %` DESC LIMIT 5;
END $$
DELIMITER ;

CALL highest_gain();