unit VvodOpravDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ValEdit, DBCtrls, StdCtrls, Buttons,
  ComCtrls, jpeg;

type
  TFVvodOpravDoc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    ComboBox1: TComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Image2: TImage;
    Image3: TImage;
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodOpravDoc: TFVvodOpravDoc;

implementation

uses DM, Social_pedagog;

{$R *.dfm}

procedure TFVvodOpravDoc.BitBtn1Click(Sender: TObject);
//var i:integer;
begin
//i:=1;
FDM.ADOQueryVvodPropusk.First;
while not FDM.ADOQueryVvodPropusk.Eof do
begin
  FDM.ADOStoredProciZMENpROP.Parameters.ParamByName('@N_Propuska').Value:=FDM.ADOQueryVvodPropusk.FieldByName('N_Propuska').AsString;
  FDM.ADOStoredProciZMENpROP.Parameters.ParamByName('@Prichina').Value:= TRIM(ComboBox1.Text);

//  FDM.ADOStoredProcVvodPropusk.Parameters.ParamByName('@Progul_chasi').Value:=ValueListEditor1.Values[ValueListEditor1.Keys[i]];


FDM.ADOQueryVvodPropusk.Next;
//    i:=i+1;
  FDM.ADOStoredProciZMENpROP.ExecProc;
     ShowMessage('Добавлен оправдательный документ');
end;

FDM.ADOQueryVvodPropusk.Close;
FDM.ADOQueryVvodPropusk.Open;
end;
//
//
procedure TFVvodOpravDoc.DateTimePicker1Change(Sender: TObject);
begin
FDM.ADOQueryVvodPropusk.SQL.Text:='Select * from Propusk where N_Student='+
FDM.ADOQueryVvodStud.FieldByName('N_Student').AsString + ' and Data_I<='+QuotedStr(DateToStr(DateTimePicker2.date)) + ' and Data_I>='+QuotedStr(DateToStr(DateTimePicker1.date));
FDM.ADOQueryVvodPropusk.Close;
FDM.ADOQueryVvodPropusk.Open;
end;

procedure TFVvodOpravDoc.DBLookupComboBox1Click(Sender: TObject);
begin
FDM.ADOQueryVvodStud.SQL.Text:='Select * from Student where N_Grupp='+
FDM.ADOQueryVvodGrupp.FieldByName('N_Grupp').AsString;
FDM.ADOQueryVvodStud.Close;
FDM.ADOQueryVvodStud.Open;
end;

procedure TFVvodOpravDoc.DBLookupComboBox2Click(Sender: TObject);
var
i:integer;
begin




//FDM.ADOQueryVvodPropusk.First;
//i:=1;
//ValueListEditor1.Strings.Clear;
//while NOT FDM.ADOQueryVvodPropusk.Eof  do
//begin
//  ValueListEditor1.Strings.Add('');
//  ValueListEditor1.Keys[i]:=FDM.ADOQueryVvodPropusk.FieldByName('N_Propuska').AsString;
//  ValueListEditor1.ItemProps[i-1].EditStyle:=esPickList;
//  ValueListEditor1.ItemProps[i-1].PickList.Add('2');
//  ValueListEditor1.ItemProps[i-1].PickList.Add('1');
//  i:=i+1;
//  FDM.ADOQueryVvodPropusk.Next;
//end;
end;

procedure TFVvodOpravDoc.FormActivate(Sender: TObject);
begin
DateTimePicker1.DateTime:=Now;
DateTimePicker2.DateTime:=Now;

//FDM.ADOQueryVvodPropusk.Active:=True;
//FDM.ADOQueryVvodPropusk.Open;
//DBGrid1.Columns.Items[0].Title.Caption :='№ Пропуска';
//DBGrid1.Columns.Items[1].Title.Caption :='№ Нагрузки';
//DBGrid1.Columns.Items[2].Title.Caption :='№ Студента';
//DBGrid1.Columns.Items[3].Title.Caption :='Дата пропуска';
//DBGrid1.Columns.Items[4].Title.Caption :='Причина';
end;

end.
