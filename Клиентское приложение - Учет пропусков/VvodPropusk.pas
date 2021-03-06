unit VvodPropusk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, jpeg, StdCtrls, DBCtrls, ComCtrls, Buttons,
  ValEdit;

type
  TFVvodPropusk = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image7: TImage;
    Image4: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    ValueListEditor1: TValueListEditor;
    procedure BitBtn3Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodPropusk: TFVvodPropusk;

implementation

uses DM, Menu_Prepod;

{$R *.dfm}



procedure TFVvodPropusk.BitBtn3Click(Sender: TObject);
var i:integer;
begin
i:=1;
FDM.ADOQueryVvodStud.First;
while not FDM.ADOQueryVvodStud.Eof do
begin
  if ValueListEditor1.Values[ValueListEditor1.Keys[i]]<>'' then
  begin
    FDM.ADOStoredProcVvodPropusk.Parameters.ParamByName('@N_Nagruzka').Value:=FDM.ADOQueryVvodNagruzki.FieldByName('N_Nagruzka').AsString;
    FDM.ADOStoredProcVvodPropusk.Parameters.ParamByName('@N_Student').Value:=FDM.ADOQueryVvodStud.FieldByName('N_Student').AsString;
    FDM.ADOStoredProcVvodPropusk.Parameters.ParamByName('@Data_I').Value:= DateToStr(DateTimePicker1.Date);
    FDM.ADOStoredProcVvodPropusk.Parameters.ParamByName('@Progul_chasi').Value:=ValueListEditor1.Values[ValueListEditor1.Keys[i]];
     FDM.ADOStoredProcVvodPropusk.ExecProc;
       ShowMessage('Добавленые пропуски');
      end;
    FDM.ADOQueryVvodStud.Next;
    i:=i+1;



end;

FDM.ADOQueryVvodPropusk.Close;
FDM.ADOQueryVvodPropusk.Open;

end;

procedure TFVvodPropusk.DBLookupComboBox1Click(Sender: TObject);
begin
FDM.ADOQueryVvodNagruzki.SQL.Text:='Select * from Nagruzka, Discipl, Prepodavat, Gruppa where Nagruzka.N_Discipl=Discipl.N_Discipl and Prepodavat.N_Prepodavat=Nagruzka.N_Prepodavat and Gruppa.N_Grupp=Nagruzka.N_Grupp'+
' and Nagruzka.N_Prepodavat='+ FDM.ADOQueryVvodPrepod.FieldByName('N_Prepodavat').AsString;
FDM.ADOQueryVvodNagruzki.Close;
FDM.ADOQueryVvodNagruzki.Open;
end;

procedure TFVvodPropusk.DBLookupComboBox2Click(Sender: TObject);
var
i:integer;
begin
FDM.ADOQueryVvodStud.SQL.Text:='Select * from Student'+
' where N_Grupp='+ FDM.ADOQueryVvodNagruzki.FieldByName('N_Grupp').AsString;
FDM.ADOQueryVvodStud.Close;
FDM.ADOQueryVvodStud.Open;
FDM.ADOQueryVvodStud.First;
i:=1;
ValueListEditor1.Strings.Clear;
while NOT FDM.ADOQueryVvodStud.Eof  do
begin
 ValueListEditor1.Strings.Add('');
  ValueListEditor1.Keys[i]:=FDM.ADOQueryVvodStud.FieldByName('FIO_Student').AsString;
  ValueListEditor1.ItemProps[i-1].EditStyle:=esPickList;
  ValueListEditor1.ItemProps[i-1].PickList.Add('2');
   ValueListEditor1.ItemProps[i-1].PickList.Add('1');
  i:=i+1;
  FDM.ADOQueryVvodStud.Next;
end;
end;



procedure TFVvodPropusk.FormActivate(Sender: TObject);
begin
DateTimePicker1.DateTime:=Now;
end;

end.
