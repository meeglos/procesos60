select date_part('year', w.fapert) as aio,
       date_part('month', w.fapert)::text,
       "count"(w.numexp) as total_mes
from tblexpfam w
where w.fapert between '25-08-1998' and '31-12-1999'
group by date_part('year', w.fapert),
         date_part('month' :: text, w.fapert)
order by 1,
         2