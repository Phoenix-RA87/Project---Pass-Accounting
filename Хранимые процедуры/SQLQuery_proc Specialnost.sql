USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Specialnost]    Script Date: 04/02/2016 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Specialnost]
@Naim_special char(255),
@Shifr int
AS
Insert into Special(Naim_special, Shifr) 
Values (@Naim_special,@Shifr)