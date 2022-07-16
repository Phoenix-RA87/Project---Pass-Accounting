use  Propusk
go
Create Proc izmen_Prepod
@N_Prepodavat int,
@FIO char(150),
@Pass char(8)
AS
UPDATE Prepodavat
       SET FIO=@FIO,
           Pass=@Pass
     WHERE N_Prepodavat = @N_Prepodavat
