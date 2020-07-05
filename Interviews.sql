select fst.conid,fst.hid,fst.nm,sum(isnull(sec.ts,0)),sum(isnull(sec.tas,0)),sum(isnull(sec.tv,0)),sum(isnull(sec.tuv,0))

from

(select contests.contest_id conid,contests.hacker_id hid ,contests.name nm,colleges.college_id colid,challenges.challenge_id cid from contests join colleges on contests.contest_id = colleges.contest_id join challenges on colleges.college_id = challenges.college_id) fst 

left join

(select v.cid cid,v.tv tv,v.tuv tuv,s.ts ts,s.tas tas from

(select challenges.challenge_id cid,sum(isnull(total_views,0)) tv,sum(isnull(total_unique_views,0) ) tuv from challenges left join view_stats on view_stats.challenge_id =  challenges.challenge_id group by challenges.challenge_id) v

join

(select challenges.challenge_id cid,sum(isnull(total_submissions,0)) ts,
sum(isnull(total_accepted_submissions,0)) tas from challenges left join submission_stats on submission_stats.challenge_id =  challenges.challenge_id group by challenges.challenge_id) s

on s.cid = v.cid
) sec

on fst.cid = sec.cid  group by fst.conid,fst.hid,fst.nm;