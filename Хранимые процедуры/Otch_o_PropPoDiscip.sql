alter proc Otch_o_PropPoDiscip
@N_Discipl int,
@Data_Nach date, 
@Data_Kon date
as
select Student.N_Student,FIO_Student,Data_I,Progul_Chasi,Prichina 
from Student,Propusk, Nagruzka 
where Student.N_Student=Propusk.N_Student and Data_I>@Data_Nach and Data_I<@Data_Kon and Nagruzka.N_Discipl=@N_Discipl
