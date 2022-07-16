USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[izmen_Stud]    Script Date: 04/06/2016 14:31:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[izmen_Stud]
@N_Student int,
@N_Grupp int,
@FIO_Student char (150),
@Data_Vip date
AS
Update Student
   set N_Grupp=@N_Grupp,
	   FIO_Student=@FIO_Student,
	   Data_Vip=@Data_Vip
Where N_Student=@N_Student