SELECT 
	date_part('year', w.fini) AS "ANO",
	CASE 
		WHEN  date_part('quarter', w.fini)=1 THEN '1 Trimestre'
		WHEN  date_part('quarter', w.fini)=2 THEN '2 Trimestre'
		WHEN  date_part('quarter', w.fini)=3 THEN '3 Trimestre'
		WHEN  date_part('quarter', w.fini)=4 THEN '4 Trimestre'
	END AS "PERIODO",
	"count"(w.numexp) AS "NUM INTERVENCIONES",
	SUM(CASE WHEN w.codestd = 'A' THEN 1 ELSE 0 END) AS "Abiertas",
	SUM(CASE WHEN w.codestd = 'T' THEN 1 ELSE 0 END) AS "Terminadas",
	SUM(CASE WHEN w.codestd = 'C' THEN 1 ELSE 0 END) AS "Cerradas"
FROM tblinter w
WHERE date_part('year', w.fini) IN ('2010')
GROUP BY 
	date_part('year', w.fini),
	date_part('quarter', w.fini)
ORDER BY 1 ASC, 2 ASC