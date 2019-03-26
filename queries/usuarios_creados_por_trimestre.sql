-- Número de usuarios creados por trimestre

SELECT 
	date_part('year', x.fapert) AS "ANO",
	CASE 
		WHEN  date_part('quarter', x.fapert)=1 THEN '1 Trimestre'
		WHEN  date_part('quarter', x.fapert)=2 THEN '2 Trimestre'
		WHEN  date_part('quarter', x.fapert)=3 THEN '3 Trimestre'
		WHEN  date_part('quarter', x.fapert)=4 THEN '4 Trimestre'
	END AS "PERIODO",
	COUNT(w.numexp) AS "Nº Usuarios"
FROM tblmiemb w, tblexpfam x
WHERE date_part('year', x.fapert) IN ('2010')
AND w.numexp = x.numexp
GROUP BY 
	date_part('year', x.fapert),
	date_part('quarter', x.fapert)
ORDER BY 1 ASC, 2 ASC