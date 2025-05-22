declare @myOption as varchar(10) = 'Option B'

select case when @myOption = 'Option A' then 'First Option'
			when @myOption = 'Option B' then 'Second Option'
			else 'No Option' END as MyOptions
go

declare @myOption as varchar(10) = 'Option A' 
select case @MyOption when 'Option A' then 'first option'
					  when 'Option B' then 'second option'
					  else 'No Option' END as MyOptions
go

declare @myOption as varchar(10) = 'Option c'

select case when @myOption = 'Option A' then 'First Option'
			when @myOption = 'Option B' then 'Second Option'
			--else 'No Option' 
			END as MyOptions
go
