select a.hacker_id , a.name
from hackers a 
join 
(select a.hacker_id , count(a.score) as score 
from submissions a 
join
(SELECT a.challenge_id , b.score
from challenges a
join difficulty b
on a.difficulty_level = b.difficulty_level
) b
on a.challenge_id = b.challenge_id and a.score = b.score
group by a.hacker_id
) b
on a.hacker_id = b.hacker_id and b.score > 1
order by b.score desc , a.hacker_id