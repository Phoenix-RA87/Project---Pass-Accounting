USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Grupp]    Script Date: 04/06/2016 13:15:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Grupp]
@N_Special int,
@Kurs int,
@Naim_grupp varchar(50),
@Soc_ped char(150)
AS
Insert into Gruppa(N_Special, Kurs, Naim_grupp, Soc_ped) values (@N_Special, @Kurs, @Naim_grupp, @Soc_ped)