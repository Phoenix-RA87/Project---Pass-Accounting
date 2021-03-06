USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Srav_Analiz_propuskov_tehnikumu]    Script Date: 04/14/2016 11:51:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  proc [dbo].[Srav_Analiz_propuskov_tehnikumu]
@Ucheb_god int
as
begin
select Ucheb_god as God,
SUM(Progul_Chasi)as Пропущено_часов, 
SUM(case when Prichina='По болезни' then Progul_Chasi else 0 end) as По_болезни,
SUM(case when Prichina='МСЭК' then Progul_Chasi else 0 end) as МСЭК,
SUM(case when Prichina='Заявление' then Progul_Chasi else 0 end) as Заявление,
SUM(case when Prichina='Раз.администрации' then Progul_Chasi else 0 end) as С_разрешения_адимистрации,
SUM(case when Prichina='Другие причины' then Progul_Chasi else 0 end) as Другая_причина,
SUM(case when Prichina='' then Progul_Chasi else 0 end) as Прогулы
from Propusk,Nagruzka,Discipl
where 
Discipl.N_Discipl=Nagruzka.N_Discipl and  Ucheb_god=@Ucheb_god
group by Ucheb_god
end