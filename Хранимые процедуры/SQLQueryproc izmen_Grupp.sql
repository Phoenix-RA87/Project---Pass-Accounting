USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[izmen_Grupp]    Script Date: 04/06/2016 13:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[izmen_Grupp]
@N_Grupp int,
@N_Special int,
@Kurs int,
@Naim_grupp varchar(50),
@Soc_ped char (150)
AS
Update Gruppa 
Set N_Special=@N_Special,
	Kurs=@Kurs,
	Naim_grupp=@Naim_grupp,
	Soc_ped=@Soc_ped
where N_Grupp=@N_Grupp