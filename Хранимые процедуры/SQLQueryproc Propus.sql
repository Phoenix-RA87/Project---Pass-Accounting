USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Propus]    Script Date: 04/01/2016 14:46:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Propus]
@N_Nagruzka int,
@N_Student int,
@Data_I date,
@Prichina char(90),
@Progul_chasi int,
@Oprav_dok char(90)
AS
Insert into Propusk(N_Nagruzka, N_Student, Data_I, Prichina, Progul_chasi, Oprav_dok)
Values(@N_Nagruzka, @N_Student, @Data_I, @Prichina, @Progul_chasi, @Oprav_dok)