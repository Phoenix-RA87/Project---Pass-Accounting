use Propusk
go
create proc izmen_Spec
@N_Special int,
@Shifr int,
@Naim_special char (255)
AS
UPDATE Special SET Shifr = @Shifr, Naim_special = @Naim_special  WHERE N_Special = @N_Special
