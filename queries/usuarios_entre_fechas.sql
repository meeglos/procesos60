-- Usuarios entre fechas dadas agrupados por meses

SELECT 
	date_part('month', x.fapert) AS "Nº MES",
	CASE 
		WHEN  date_part('month', x.fapert)=1 THEN 'Enero'
		WHEN  date_part('month', x.fapert)=2 THEN 'Febrero'
		WHEN  date_part('month', x.fapert)=3 THEN 'Marzo'
		WHEN  date_part('month', x.fapert)=4 THEN 'Abril'
		WHEN  date_part('month', x.fapert)=5 THEN 'Mayo'
		WHEN  date_part('month', x.fapert)=6 THEN 'Junio'
		WHEN  date_part('month', x.fapert)=7 THEN 'Julio'
		WHEN  date_part('month', x.fapert)=8 THEN 'Agosto'
		WHEN  date_part('month', x.fapert)=9 THEN 'Septiembre'
		WHEN  date_part('month', x.fapert)=10 THEN 'Octubre'
		WHEN  date_part('month', x.fapert)=11 THEN 'Noviembre'
		WHEN  date_part('month', x.fapert)=12 THEN 'Diciembre'
	END AS "MES",
	COUNT(w.numexp) AS "Nº Usuarios"
FROM tblmiemb w, tblexpfam x
WHERE x.fapert between '01-01-2010' and '31-08-2010'
AND w.numexp = x.numexp
GROUP BY 
	1,
	2
ORDER BY 1 ASC, 2 ASC