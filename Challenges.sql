select c.hacker_id,h.name,count(c.hacker_id) from challenges c,hackers h where c.hacker_id = h.hacker_id group by c.hacker_id,h.name having count(c.hacker_id) IN (select m from (select m,count(m) n from (select count(hacker_id) m from challenges group by hacker_id order by count(hacker_id) desc) x1 group by m order by m desc) where m = 50 or n = 1) order by count(c.hacker_id) desc,c.hacker_id;
