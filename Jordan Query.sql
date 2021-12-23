---Use Database ---please run this command, first! 
Use Nba

---Regular season statistical averages by year for Michael Jordan
SELECT 
	   DATEPART(year, date) AS year, 
	   ROUND(AVG(pts),4) AS avg_pointspergame,
	   ROUND(AVG(fg),4) AS avg_field_goals,
       ROUND(AVG(fga),4) AS avg_field_goal_attempts,
	   ROUND(AVG(fgp),4) AS avg_fieldgoal_percentage,
	   ROUND(AVG(ftp),4) AS avg_freethrow_percentage,
	   ROUND(AVG(ast),4) AS avg_assists,
	   ROUND(AVG(tov),4) AS avg_turnovers,
	   ROUND(AVG( ast/NULLIF(tov,0)),4) AS assists_to_turnover_ratio,
	   ROUND(AVG(stl),4) AS avg_stls,
	   ROUND(AVG(blk),4) AS avg_blks
FROM dbo.jordan_career
GROUP BY DATEPART(year, date) 
ORDER BY 1 ASC

---Regular season career averages -- Lebron
SELECT 
       DATEPART(year, date) AS year,
	   ROUND(AVG(pts),4) AS avg_pointspergame,
	   ROUND(AVG(fg),4) AS average_field_goals,
       ROUND(AVG(fga),4) AS avg_field_goal_attempts,
	   ROUND(AVG(fgp),4) AS avg_fieldgoal_percentage,
	   ROUND(AVG(ftp),4) AS freethrow_percentage,
	   ROUND(AVG(ast),4) AS avg_assists,
	   ROUND(AVG(tov),4) AS avg_turnovers,
	   ROUND(AVG( ast/NULLIF(tov,0)),4) AS assists_to_turnover_ratio,
	   ROUND(AVG(stl),4) AS avg_stls,
	   ROUND(AVG(blk),4) AS blks,
	   ROUND(AVG( ast/NULLIF(tov,0)),4) AS assists_to_turnover_ratio
FROM dbo.lebron_career
GROUP BY DATEPART(year, date)
ORDER BY 1 ASC

---Lebron finals record and average statistics
SELECT DATEPART(year, date) AS year,
       series as Series,
	   IIF(COUNT(SUBSTRING(result,1,1)) < 4, 'Loss', 'Win') AS series_result,
       ROUND(AVG(pts),4) AS avg_pointspergame,
	   Round(AVG(fg),4) AS average_field_goals,
       ROUND(AVG(fga),4) AS avg_field_goal_attempts,
	   ROUND(AVG(fgp),4) AS avg_fieldgoal_percentage,
	   ROUND(AVG(ftp),4) AS freethrow_percentage,
	   ROUND(AVG(ast),4) AS avg_assists,
	   ROUND(AVG(tov),4) AS avg_turnovers,
	   ROUND(AVG( ast/NULLIF(tov,0)),4) AS assists_to_turnover_ratio,
	   ROUND(AVG(stl),4) AS avg_stls,
	   ROUND(AVG(blk),4) AS avg_blks
FROM lebron_playoffs 
WHERE result LIKE 'W%'
AND Series LIKE 'Fin'
GROUP BY series, DATEPART(year,date)

---Jordan finals record and average statistics 
SELECT DATEPART(year, date) AS year,
       series as Series,
	   IIF(COUNT(SUBSTRING(result,1,1)) < 4, 'Loss', 'Win') AS series_result,
       ROUND(AVG(pts),4) AS avg_pointspergame,
	   Round(AVG(fg),4) AS average_field_goals,
       ROUND(AVG(fga),4) AS avg_field_goal_attempts,
	   ROUND(AVG(fgp),4) AS avg_fieldgoal_percentage,
	   ROUND(AVG(ftp),4) AS freethrow_percentage,
	   ROUND(AVG(ast),4) AS avg_assists,
	   ROUND(AVG(tov),4) AS avg_turnovers,
	   ROUND(AVG( ast/NULLIF(tov,0)),4) AS assists_to_turnover_ratio,
	   ROUND(AVG(stl),4) AS avg_stls,
	   ROUND(AVG(blk),4) AS avg_blks
FROM jordan_playoffs
WHERE result LIKE 'W%'
AND Series LIKE 'Fin'
GROUP BY series, DATEPART(year,date)

---Playoff Results and statstics by series -- Lebron
SELECT COUNT(SUBSTRING(tb1.result,1,1)) AS Losses,
       series AS series,
	   DATEPART(year, date) AS playoff_year,
	   IIF(COUNT(SUBSTRING(tb1.result,1,1)) = 4, 'Win', 'Loss') AS series_result,
	  ROUND(AVG(pts),4) AS avg_pointspergame,
	   Round(AVG(fg),4) AS average_field_goals,
       ROUND(AVG(fga),4) AS avg_field_goal_attempts,
	   ROUND(AVG(fgp),4) AS avg_fieldgoal_percentage,
	   ROUND(AVG(ftp),4) AS freethrow_percentage,
	   ROUND(AVG(ast),4) AS avg_assists,
	   ROUND(AVG(tov),4) AS avg_turnovers,
	   ROUND(AVG( ast/NULLIF(tov,0)),4) AS assists_to_turnover_ratio,
	   ROUND(AVG(stl),4) AS avg_stls,
	   ROUND(AVG(blk),4) AS avg_blks
FROM lebron_playoffs AS tb1
WHERE tb1.result LIKE 'W%' AND series NOT LIKE 'Fin'
GROUP BY series, DATEPART(year, date)

---Playoff Results and statistics -- Jordan
SELECT COUNT(SUBSTRING(tb1.result,1,1)) AS Losses,
       series AS series,
	   DATEPART(year, date) AS playoff_year,
	   IIF(COUNT(SUBSTRING(tb1.result,1,1)) = 4, 'Win', 'Loss') AS series_result,
	   ROUND(AVG(pts),4) AS avg_pointspergame,
	   Round(AVG(fg),4) AS average_field_goals,
       ROUND(AVG(fga),4) AS avg_field_goal_attempts,
	   ROUND(AVG(fgp),4) AS avg_fieldgoal_percentage,
	   ROUND(AVG(ftp),4) AS freethrow_percentage,
	   ROUND(AVG(ast),4) AS avg_assists,
	   ROUND(AVG(tov),4) AS avg_turnovers,
	   ROUND(AVG( ast/NULLIF(tov,0)),4) AS assists_to_turnover_ratio,
	   ROUND(AVG(stl),4) AS avg_stls,
	   ROUND(AVG(blk),4) AS avg_blks
FROM lebron_playoffs AS tb1
WHERE tb1.result LIKE 'W%' AND series NOT LIKE 'Fin'
GROUP BY series, DATEPART(year, date)



