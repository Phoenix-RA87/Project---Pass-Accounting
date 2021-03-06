USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Sved_propusk_tehnikum]    Script Date: 04/14/2016 13:02:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  proc [dbo].[Sved_propusk_tehnikum]
@dataNach date,
@datakonec date
as
begin
select Naim_grupp as Название_группы,SUM(Progul_Chasi)as Пропущенно_часов, 
SUM(case when Prichina='По болезни' then Progul_Chasi else 0 end) as По_болезни,
SUM(case when Prichina='МСЭК' then Progul_Chasi else 0 end) as МСЭК,
SUM(case when Prichina='Заявление' then Progul_Chasi else 0 end) as Заявление,
SUM(case when Prichina='Раз.администрации' then Progul_Chasi else 0 end) as С_разрешения_адимистрации,
SUM(case when Prichina='Другие причины' then Progul_Chasi else 0 end) as Другая_причина,
SUM(case when Prichina='' then Progul_Chasi else 0 end) as Прогулы

from Propusk,Student,Gruppa, Nagruzka
where
Propusk.N_Student=Student.N_Student and Nagruzka.N_Grupp=Gruppa.N_Grupp and Data_I>=@dataNach and @datakonec>=Data_I
group by Naim_Grupp
end