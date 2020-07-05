select concat(concat(concat(name,'('),substr(occupation,1,1)),')') from occupations order by name;
select concat(concat('There are a total of ',count(name)),concat(' ',concat(lower(occupation),'s.'))) tot from occupations group by occupation order by tot;
