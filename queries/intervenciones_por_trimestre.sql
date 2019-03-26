-- Intervenciones por trimestre
SELECT 
	date_part('year', w.fini) AS "ANO",
	CASE 
		WHEN  date_part('quarter', w.fini)=1 THEN '1 Trimestre'
		WHEN  date_part('quarter', w.fini)=2 THEN '2 Trimestre'
		WHEN  date_part('quarter', w.fini)=3 THEN '3 Trimestre'
		WHEN  date_part('quarter', w.fini)=4 THEN '4 Trimestre'
	END AS "PERIODO",
	COUNT(w.numexp) AS "Nº Interv"
FROM tblinter w
WHERE date_part('year', w.fini) IN ('2010')
GROUP BY 
	date_part('year', w.fini),
	date_part('quarter', w.fini)
ORDER BY 1 ASC, 2 ASC