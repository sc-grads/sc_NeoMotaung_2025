--DBCC statements with info messages and then no info messages

dbcc checkdb ('AdventureWorks2022')

dbcc checkdb ('AdventureWorks2022') with no_infomsgs


--Changes database to single user to execute repair_rebuild command then immediately takes it back to multi_user mode.
alter database AdventureWorks2022 set single_user with rollback immediate
go

dbcc checkdb ('AdventureWorks2022', REPAIR_rebuild)

alter database AdventureWorks2022 set multi_user with rollback immediate
go