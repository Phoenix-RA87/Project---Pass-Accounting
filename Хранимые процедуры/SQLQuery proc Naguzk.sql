USE Propusk
GO

Create proc Nagruzk
@N_Prepodavat int,
@N_Grupp int,
@N_Discipl int,
@Ucheb_god int
AS
Insert into Nagruzka(N_Prepodavat, N_Grupp, N_Discipl, Ucheb_god) 
Values (@N_Prepodavat, @N_Grupp, @N_Discipl, @Ucheb_god)