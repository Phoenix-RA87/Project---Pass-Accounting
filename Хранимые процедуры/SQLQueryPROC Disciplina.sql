USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Disciplina]    Script Date: 04/02/2016 22:06:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[Disciplina]
@Naim_Discipl char (64)
AS
Insert into Discipl(Naim_Discipl) values (@Naim_Discipl)