unit OtchZamDirPoUMR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Grids, DBGrids, ComCtrls, DBCtrls, Buttons,
  comobj, excel2000, ShellApi;

type
  TFOtchZamDirPoUMR = class(TForm)
    Panel3: TPanel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOtchZamDirPoUMR: TFOtchZamDirPoUMR;
   OE1,OList :Variant;
     istr:integer;
  s:string;
  f:textfile;

implementation

uses DM;

{$R *.dfm}

procedure TFOtchZamDirPoUMR.BitBtn1Click(Sender: TObject);
begin
OE1:=CreateOleObject('Excel.Application'); //�������OLE-������ Excel
OE1.WorkBooks.Add();                      // ������� ������� ����� Excel
OE1.Visible:=True;                         // ������� Excel �������
//������� � ������ ��������- ���������� ��������� ������
OE1.Cells[1,1].Value:='����� � ��������� ������� ���������'+
'�� ������'+' '+'c'+' '+DateToStr(DateTimePicker1.Date)+' '+'��'+' '+DateToStr(DateTimePicker2.Date);
OE1.Cells[2,1].Value:='����';
OE1.Cells[2,2].value:='��������� �����';
OE1.Cells[2,3].Value:='�������������';
OE1.Cells[3,3].Value:='����������';
OE1.Cells[4,3].Value:='����� ��������� �����';



istr:=3;                           // �����
FDM.ADOQueryOtch.First;               //������� �� ������ ������
while not FDM.ADOQueryOtch.Eof do  // ���� �� ����� ��������� ����� �����
begin
//�������� � ������ Excel ���������� �����

OE1.Cells[istr,1].Value:= FDM.ADOQueryOtch.FieldByName('Data_I').AsString;
OE1.Cells[istr,2].Value:=FDM.ADOQueryOtch.FieldByName('Progul_chasi').AsString;
OE1.Cells[istr,3].Value:=FDM.ADOQueryOtch.FieldByName('FIO').AsString;
OE1.Cells[istr,4].Value:=FDM.ADOQueryOtch.FieldByName('Naim_Discipl').AsString;
OE1.Cells[istr,5].Value:=FDM.ADOQueryOtch.FieldByName('vsego_propucsh_chas').AsString;


//������� �� ��������� ������
FDM.ADOQueryOtch.Next;
////��������� ����� ������   � Excel
 istr:=istr+1;
//
end;
//begin
 //�������������� ������� ��� ��������������
OE1.Range['A3:C'+IntToStr(istr+1)].Select;   // �������� ������
//���������� �������� ������ ���� ���������� �����
     OE1.Selection.Borders[xlEdgeLeft].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeRight].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeTop].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeBottom].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlInsideVertical].LineStyle:=xlContinuous;
 OE1.Selection.Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
      OE1.Cells[istr,5].Value:='=SUM(E3:E'+IntToStr(istr-1)+')';



   // OE1.Selection.MergeCells:=True;
//OE1.Selection.HorizontalAlignment := xlLeft;
    /// OE1.Selection.VerticalAlignment := xlCenter;
     OE1.Range['A1:E'+inttostr(istr-1)].Select;
OE1.Selection.ColumnWidth:=30;// ������ �������

  // ��������� ������ - �������
        OE1.ActiveSheet.PageSetup.LeftMargin:= 0.39;
        OE1.ActiveSheet.PageSetup.RightMargin := 0.39;
        OE1.ActiveSheet.PageSetup.TopMargin := 2.78;
        OE1.ActiveSheet.PageSetup.BottomMargin := 0.78;
  // ��������� ������ - ����������
        OE1.ActiveSheet.PageSetup.Orientation := xlLandscape;
        OE1.ActiveSheet.PageSetup.Zoom := False ;
// ����������� �� 1 �������� �� ������        OE1.ActiveSheet.PageSetup.FitToPagesWide := 1
// ����������� �� 10 ��������� �� ������        OE1.ActiveSheet.PageSetup.FitToPagesTall := 10;
//������ ���������� �����
OE1.ActiveSheet.PageSetup.RightFooter := DateToStr(Date) ;
//��������������� ��������
OE1.ActiveSheet.PrintPreview;
end;

procedure TFOtchZamDirPoUMR.BitBtn2Click(Sender: TObject);
begin

//// 1.������� ���� ��������� html
////2. ������� � ���� ���������� �� ����� html
//������� ����
//��������� ����

 assignfile(f,extractfiledir(Application.ExeName)+'\����� � ��������� ��������� �� ������.html');
ReWrite(f);
writeln(f,'<html>');
writeln(f,'<head>');
writeln(f,'<LINK  REL=STYLESHEET  TYPE=text/css HREF=table.css>');
writeln(f,'</head>');
writeln(f,'<body>');
writeln(f,'<p></p>');
writeln(f,'<table>');
writeln(f,'<th>'+'����'+'</th>')  ;
writeln(f,'<th>'+'��������� �����'+'</th>');
writeln(f,'<th>'+'�������������'+'</th>');
writeln(f,'<th>'+'����������'+'</th>');
writeln(f,'<th>'+'����� ��������� �����'+'</th>');
FDM.ADOQueryOtch.First;               //������� �� ������ ������
while not FDM.ADOQueryOtch.Eof do
  begin
writeln(f,'<tr>');
writeln(f,'<td>'+FDM.ADOQueryOtch.FieldByName('Data_I').AsString+ '</td>');
writeln(f,'<td>'+FDM.ADOQueryOtch.FieldByName('Progul_chasi').AsString+ '</td>');
writeln(f,'<td>'+FDM.ADOQueryOtch.FieldByName('FIO').AsString+ '</td>');
writeln(f,'<td>'+FDM.ADOQueryOtch.FieldByName('Naim_Discipl').AsString+ '</td>');
writeln(f,'<td>'+FDM.ADOQueryOtch.FieldByName('Vsego_propucsh_chas').AsString+ '</td>');
writeln(f,'</tr>');
FDM.ADOQueryOtch.Next;
end;
writeln(f,'</table>');
writeln(f,'</body>');
writeln(f,'</html>');
closefile(f);
shellexecute(Handle,'open',Pchar(extractfiledir(Application.ExeName)+'\����� � ��������� ��������� �� ������.html'),nil,nil,SW_SHOWNORMAL);

end;

procedure TFOtchZamDirPoUMR.DateTimePicker1Change(Sender: TObject);
begin
FDM.ADOQueryOtch.SQL.Text:='exec Otchet_o_Prop_Studentom '
+QuotedStr(DateToStr(DateTimePicker1.date))+','+
 QuotedStr(DateToStr(DateTimePicker2.Date))+','+
inttostr(FDM.ADOQueryVvodStud.FieldByName('N_Student').Value);
FDM.ADOQueryOtch.Close;
FDM.ADOQueryOtch.Open;

 DBGrid1.Columns.Items[0].Title.Caption :='����';
 DBGrid1.Columns.Items[1].Title.Caption :='��������� �����';
 DBGrid1.Columns.Items[2].Title.Caption :='�������������';
 DBGrid1.Columns.Items[3].Title.Caption :='����������';
 DBGrid1.Columns.Items[4].Title.Caption :='����� �����';
end;

procedure TFOtchZamDirPoUMR.DateTimePicker2Change(Sender: TObject);
begin
;
end;

procedure TFOtchZamDirPoUMR.FormActivate(Sender: TObject);
begin
FDM.ADOQueryVvodStud.Open;
DateTimePicker1.Date:=date;
DateTimePicker2.Date:=date;
DateTimePicker1Change(self);
end;

end.
