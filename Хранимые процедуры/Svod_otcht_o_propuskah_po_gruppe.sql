USE [Propusk]
GO
/****** Object:  StoredProcedure [dbo].[Svod_otcht_o_propuskah_po_gruppe]    Script Date: 04/14/2016 22:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  proc [dbo].[Svod_otcht_o_propuskah_po_gruppe]
@N_Grupp int,
@dataNach date,
@datakonec date
as
begin
select Student.N_Student as Номер_Студента, 
FIO_Student as ФИО_Студента,
SUM(Progul_Chasi)as Пропущено_часов, 
SUM(case when Prichina='По болезни' then Progul_Chasi else 0 end) as По_болезни,
SUM(case when Prichina='МСЭК' then Progul_Chasi else 0 end) as МСЭК,
SUM(case when Prichina='Заявление' then Progul_Chasi else 0 end) as Заявление,
SUM(case when Prichina='Раз.администрации' then Progul_Chasi else 0 end) as С_разрешени_администратора,
SUM(case when Prichina='Другие причины' then Progul_Chasi else 0 end) as Другие_причины,
SUM(case when Prichina='' then Progul_Chasi else 0 end) as Прогулы
from Propusk, Student, Nagruzka
where
Propusk.N_Student=Student.N_Student and Nagruzka.N_Grupp =@N_Grupp  and Data_I>=@dataNach and @datakonec>=Data_I
group by Student.N_Student, FIO_Student
end