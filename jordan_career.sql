---Use Database ---Run this command, first! 
Use Nba

---Regular season statistical averages - Jordan
SELECT 
	   ROUND(AVG(pts),4) AS avg_pointspergame,
	   Round(AVG(fg),4) AS avg_field_goals,
           ROUND(AVG(fga),4) AS avg_field_goal_attempts,
	   ROUND(AVG(fgp),4) AS avg_fieldgoal_percentage,
	   ROUND(AVG(ftp),4) AS avg_freethrow_percentage,
	   ROUND(AVG(ast),4) AS avg_assists,
	   ROUND(AVG(tov),4) AS avg_turnovers,
	   ROUND(AVG( ast/NULLIF(tov,0)),4) AS assists_to_turnover_ratio,
	   ROUND(AVG(stl),4) AS avg_stls,
	   ROUND(AVG(blk),4) AS avg_blks
FROM dbo.jordan_career