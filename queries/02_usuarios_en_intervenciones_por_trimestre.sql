-- Usuarios en intervenciones por trimestre

SELECT 
	date_part('year', x.fini) AS "ANO",
	CASE 
		WHEN  date_part('quarter', x.fini)=1 THEN '1 Trimestre'
		WHEN  date_part('quarter', x.fini)=2 THEN '2 Trimestre'
		WHEN  date_part('quarter', x.fini)=3 THEN '3 Trimestre'
		WHEN  date_part('quarter', x.fini)=4 THEN '4 Trimestre'
	END AS "PERIODO",
	COUNT(w.numexp) AS "Nº Usuarios"
FROM tblmiemb w, tblinter x
WHERE date_part('year', x.fini) IN ('2010')
AND w.numexp = x.numexp
GROUP BY 
	date_part('year', x.fini),
	date_part('quarter', x.fini)
ORDER BY 1 ASC, 2 ASC