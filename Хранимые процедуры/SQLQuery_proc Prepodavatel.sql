use Propusk
go
Create proc Prepodavatel
@FIO char (150),
@Pass char(8)
AS
Insert into Prepodavat(FIO, Pass) Values (@FIO, @Pass)