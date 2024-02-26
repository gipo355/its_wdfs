select top 1 id
from Valuations
order by Valuation desc

select *,
       (select avg(Valuation)
        from viewValuation v
        where surname = v.surname
          and name = v.name)
