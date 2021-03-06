USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Svod_otchPoDiscip]    Script Date: 04/13/2016 10:58:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Svod_otchPoDiscip]
@Data_Nach date,
@Data_Kon date,
@N_Grupp int
as
select Student.N_Student, FIO_Student, Naim_Discipl, SUM(Progul_chasi)as Kolich
from Propusk, Student, Nagruzka, Discipl
where Propusk.N_Student=Student.N_Student and Nagruzka.N_Discipl=Discipl.N_Discipl
and Data_I>=@Data_Nach and Data_I<=@Data_Kon
group by Student.N_Student,FIO_Student,Naim_Discipl