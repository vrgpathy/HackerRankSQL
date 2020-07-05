select s.hacker_id,h.name from hackers h, submissions s, challenges c , difficulty d where s.challenge_id = c.challenge_id and c.difficulty_level = d.difficulty_level and d.score = s.score and s.hacker_id = h.hacker_id group by s.hacker_id,h.name having count(s.hacker_id)>1 order by count(s.hacker_id) desc, s.hacker_id;