select round(((select abs((select lat_n from (select lat_n from station order by lat_n ) where rownum = 1) - (select lat_n from (select lat_n from station order by lat_n desc ) where rownum = 1)) from station where rownum = 1)+(select abs((select long_w from (select long_w from station order by long_w ) where rownum = 1) - (select long_w from (select long_w from station order by long_w desc ) where rownum = 1)) from station where rownum = 1)),4) from station where rownum = 1;