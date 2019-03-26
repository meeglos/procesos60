-- Intervenciones por periodo , estado y número de usuarios
select 
	date_part('year', i.fini) as "ANO",
	CASE 
		WHEN  date_part('quarter', i.fini)=1 THEN '1 Trimestre'
		WHEN  date_part('quarter', i.fini)=2 THEN '2 Trimestre'
		WHEN  date_part('quarter', i.fini)=3 THEN '3 Trimestre'
		WHEN  date_part('quarter', i.fini)=4 THEN '4 Trimestre'
	END as "PERIODO",
	t.afectados "Nº Usuarios", count(t.numinter) "Nº Intervenciones",
	SUM(CASE WHEN i.codestd = 'A' THEN 1 ELSE 0 END) AS "Abiertas",
	SUM(CASE WHEN i.codestd = 'T' THEN 1 ELSE 0 END) AS "Terminadas",
	SUM(CASE WHEN i.codestd = 'C' THEN 1 ELSE 0 END) AS "Cerradas"
from (
	select i.fini, u.numexp,u.numinter, count(u.numinter) afectados
	from tblusuinter u, tblinter i
	where u.numexp  = i.numexp and u.numinter = i.numinter
	group by u.numexp, u.numinter, i.fini
	order by i.fini asc ) as t,
	tblinter i
where date_part('year', t.fini) = '1995'
	and i.numexp = t.numexp
	and i.numinter = t.numinter
	and i.fini = t.fini
	--and t.numinter = i.numinter
group by 2,t.afectados,1
order by 1,2,t.afectados asc
