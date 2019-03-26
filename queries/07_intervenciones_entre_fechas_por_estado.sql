-- Intervenciones entre fechas, agrupadas por estado
SELECT 
	date_part('month', w.fini) AS "Nº MES",
	CASE 
		WHEN  date_part('month', w.fini)=1 THEN 'Enero'
		WHEN  date_part('month', w.fini)=2 THEN 'Febrero'
		WHEN  date_part('month', w.fini)=3 THEN 'Marzo'
		WHEN  date_part('month', w.fini)=4 THEN 'Abril'
		WHEN  date_part('month', w.fini)=5 THEN 'Mayo'
		WHEN  date_part('month', w.fini)=6 THEN 'Junio'
		WHEN  date_part('month', w.fini)=7 THEN 'Julio'
		WHEN  date_part('month', w.fini)=8 THEN 'Agosto'
		WHEN  date_part('month', w.fini)=9 THEN 'Septiembre'
		WHEN  date_part('month', w.fini)=10 THEN 'Octubre'
		WHEN  date_part('month', w.fini)=11 THEN 'Noviembre'
		WHEN  date_part('month', w.fini)=12 THEN 'Diciembre'
	END AS "MES",
	COUNT(w.numexp) AS "Nº Interv",
	SUM(CASE WHEN w.codestd = 'A' THEN 1 ELSE 0 END) AS "Abiertas",
	SUM(CASE WHEN w.codestd = 'T' THEN 1 ELSE 0 END) AS "Terminadas",
	SUM(CASE WHEN w.codestd = 'C' THEN 1 ELSE 0 END) AS "Cerradas"
FROM tblinter w
WHERE w.fini between '01-01-2010' and '31-03-2010'
GROUP BY 
	date_part('month', w.fini)
ORDER BY 1 ASC