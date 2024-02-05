SELECT CASE WHEN grade < 8 then null else name end as name ,  grade , marks
from (SELECT a.name , a.marks , b.grade
FROM Students a
JOIN GRADES b
on a.marks >= b.min_mark and a.marks <= b.max_mark
) a
order by grade desc , a.name asc 