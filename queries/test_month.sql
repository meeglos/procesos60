SELECT 
	date_part('quarter',x.fapert) as 'Trimestre',
	COUNT(x.numexp) as 'Exp'
FROM `tblexpfam` as x
WHERE date_part('year', x.fapert) = '1999'
GROUP BY 'Trimestre'
Order by 'Trimestre' asc;
