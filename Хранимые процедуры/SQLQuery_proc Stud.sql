USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Stud]    Script Date: 04/06/2016 14:32:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Stud]
@N_Grupp int,
@FIO_Student char(150),
@Data_Vip date
AS
Insert into Student(N_Grupp, FIO_Student, Data_Vip)
Values(@N_Grupp, @FIO_Student, @Data_Vip)