create Proc izmen_Prop
@N_Propuska int,
@Prichina char (90)

AS
UPDATE Propusk
       SET Prichina=@Prichina
     WHERE N_Propuska = @N_Propuska
