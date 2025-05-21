select * from inserted
union 
select * from deleted

select convert(char(5), 'hi')
union
select convert(char(11), 'hello there')
union
select convert(char(11), 'bonjour')
union all
select convert(char(5), 'hi')

select convert(tinyint, 45) as myColumn
union 
select convert(bigint, 456)

select 'hi there'
union
select 4