
'remove data before year 2004'

CREATE VIEW year2004 as
select * from inpe_brazilian_amazon_fires ibaf 
WHERE "year" > 2003


'correlation between number of firespots and deforestation area'

select corr (fire, "AMZ LEGAL") from
(select sum(firespots) as fire, "AMZ LEGAL" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
group by "AMZ LEGAL") as q


'correlation between number of firespots and deforestation area for particular states'

select state, corr (fire, "ac") from
(select state, sum(firespots) as fire, "ac" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'ACRE'
group by "ac", state) as q
group by state

union

select state, corr (fire, "am") from
(select state, sum(firespots) as fire, "am" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'AMAZONAS'
group by "am", state) as q
group by state

union

select state, corr (fire, "ap") from
(select state, sum(firespots) as fire, "ap" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'AMAPA'
group by "ap", state) as q
group by state

union

select state, corr (fire, "ma") from
(select state, sum(firespots) as fire, "ma" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'MARANHAO'
group by "ma", state) as q
group by state

union 

select state, corr (fire, "mt") from
(select state, sum(firespots) as fire, "mt" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'MATO GROSSO'
group by "mt", state) as q
group by state

union 

select state, corr (fire, "pa") from
(select state, sum(firespots) as fire, "pa" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'PARA'
group by "pa", state) as q
group by state

union 

select state, corr (fire, "ro") from
(select state, sum(firespots) as fire, "ro" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'RONDONIA'
group by "ro", state) as q
group by state

union 

select state, corr (fire, "rr") from
(select state, sum(firespots) as fire, "rr" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'RORAIMA'
group by "rr", state) as q
group by state

union 

select state, corr (fire, "TO") from
(select state, sum(firespots) as fire, "TO" from year2004 
left join def_area da on da."Ano/Estados" = year2004."year"
where state = 'TOCANTINS'
group by "TO", state) as q
group by state

'data for tableau'

select *, 
case when "year" > 0 then 'Brazil'
else 'no'
end as country
from year2004 y 