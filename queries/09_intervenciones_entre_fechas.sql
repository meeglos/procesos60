-- Intervenciones entre fechas, agrupadas por meses
SELECT 
	date_part('month', w.fini) AS "Nº MES",
	CASE 
		WHEN  date_part('month', w.fini)=1 THEN 'Enero'
		WHEN  date_part('month', w.fini)=2 THEN 'Febrero'
		WHEN  date_part('month', w.fini)=3 THEN 'Marzo'
		WHEN  date_part('month', w.fini)=1 THEN 'Abril'
		WHEN  date_part('month', w.fini)=1 THEN 'Mayo'
		WHEN  date_part('month', w.fini)=1 THEN 'Junio'
		WHEN  date_part('month', w.fini)=1 THEN 'Julio'
		WHEN  date_part('month', w.fini)=4 THEN 'Agosto'
	END AS "MES",
	COUNT(w.numexp) AS "Nº Interv"
FROM tblinter w
WHERE w.fini between '01-01-2010' and '31-08-2010'
GROUP BY 
	MES
ORDER BY 1 ASC