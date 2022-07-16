use Propusk
go
Create Proc izmen_Discipl
@N_Discipl int,
@Naim_discipl char(64)
AS
Update Discipl
   Set Naim_discipl=@Naim_discipl
Where N_Discipl=@N_Discipl