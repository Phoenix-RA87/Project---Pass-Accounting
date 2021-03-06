USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Otchet_o_Prop_Studentom]    Script Date: 04/14/2016 09:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  proc [dbo].[Otchet_o_Prop_Studentom]
@d1 date,
@d2 date,
@N_Student int
as
select Data_I, Progul_chasi,FIO,naim_Discipl, sum(Naim_Discipl*Progul_chasi) as vsego_propucsh_chas
from propusk,Prepodavat, nagruzka, Discipl 
where 
Nagruzka.N_Discipl=Discipl.N_Discipl and nagruzka.N_Prepodavat=Prepodavat.N_Prepodavat and @d1<=Data_I and @d2>=Data_I
and N_Student=@N_Student
group by 
 Data_I, Progul_chasi,FIO,Naim_discipl
