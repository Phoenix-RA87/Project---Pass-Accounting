unit Otch_o_Prop_Zan_po_Discipl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, jpeg, ExtCtrls, StdCtrls, ComCtrls, ShellApi, Buttons,
  excel2000, comobj,  DBCtrls;

type
  TFOtch_o_Prop_Zan_po_Discipl = class(TForm)
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOtch_o_Prop_Zan_po_Discipl: TFOtch_o_Prop_Zan_po_Discipl;
   OE1, OList :Variant;
   istr:integer;
   f:textfile;
   s:string;

implementation

uses DM;

{$R *.dfm}



procedure TFOtch_o_Prop_Zan_po_Discipl.BitBtn1Click(Sender: TObject);
begin
// ��������� ����� Excel
OE1:=CreateOleObject('Excel.Application'); //�������OLE-������ Excel
OE1.WorkBooks.Add(); // ������� ������� ����� Excel
OE1.Visible:=True; // ������� Excel �������
//������� � ������ ��������- ���������� ��������� ������
OE1.Cells[1,1].Value:='�� ������'+' '+DateToStr(DateTimePicker1.Date)+' �� '+' '
+DateToStr(DateTimePicker2.Date);
OE1.Cells[2,1].Value:='� ��������';
OE1.Cells[2,2].Value:='��� ��������';
OE1.Cells[2,3].Value:='���� ��������';
OE1.Cells[2,4].Value:='���-�� �����';
OE1.Cells[2,5].Value:='�������';
istr:=3; // �����
FDM.ADOQueryOtch.First; //������� �� ������ ������
while not FDM.ADOQueryOtch.Eof do // ���� �� ����� ��������� ����� �����
begin
//�������� � ������ Excel ���������� �����
OE1.Cells[istr,1].Value:= FDM.ADOQueryOtch.FieldByName('N_Student').AsString;
OE1.Cells[istr,2].Value:= FDM.ADOQueryOtch.FieldByName('FIO_Student').AsString;
OE1.Cells[istr,3].Value:= FDM.ADOQueryOtch.FieldByName('Data_I').AsString;
OE1.Cells[istr,4].Value:= FDM.ADOQueryOtch.FieldByName('Progul_chasi').AsString;
OE1.Cells[istr,5].Value:= FDM.ADOQueryOtch.FieldByName('Prichina').AsString;
OE1.Range['C6:F'+IntToStr(istr+1)].Select; // �������� ������ 1 ������� 1 ������
OE1.Selection.WrapText:= True;
////������� �� ��������� ������
FDM.ADOQueryOtch.Next;
/////��������� ����� ������ � Excel
istr:=istr+1;
////
end;
////
begin
//�������������� ������� ��� ��������������
OE1.Range['A1:I'+IntToStr(istr+1)].Select; // �������� ������ 
//���������� �������� ������ ���� ���������� �����
OE1.Selection.Borders[xlEdgeLeft].LineStyle:=xlContinuous; 
OE1.Selection.Borders[xlEdgeRight].LineStyle:=xlContinuous;
OE1.Selection.Borders[xlEdgeTop].LineStyle:=xlContinuous; 
OE1.Selection.Borders[xlEdgeBottom].LineStyle:=xlContinuous;
OE1.Selection.Borders[xlInsideVertical].LineStyle:=xlContinuous; 
OE1.Selection.Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
// OE1.Selection.MergeCells:=True; 
//OE1.Selection.HorizontalAlignment := xlLeft;
/// OE1.Selection.VerticalAlignment := xlCenter; 
OE1.Range['A1:I'+inttostr(istr-1)].Select;
OE1.Selection.ColumnWidth:=30;// ������ ������� 
// ��������� ������ - �������
OE1.ActiveSheet.PageSetup.LeftMargin:= 0.39; 
OE1.ActiveSheet.PageSetup.RightMargin := 0.39;
OE1.ActiveSheet.PageSetup.TopMargin := 2.78;
OE1.ActiveSheet.PageSetup.BottomMargin := 0.78;
// ��������� ������ - ����������
OE1.ActiveSheet.PageSetup.Orientation := xlLandscape;
OE1.ActiveSheet.PageSetup.Zoom := False ;
// ����������� �� 1 �������� �� ������ OE1.ActiveSheet.PageSetup.FitToPagesWide := 1
// ����������� �� 10 ��������� �� ������ OE1.ActiveSheet.PageSetup.FitToPagesTall := 10;
//������ ���������� �����
OE1.ActiveSheet.PageSetup.RightFooter := DateToStr(Date) ;
//��������������� ��������
OE1.ActiveSheet.PrintPreview;
end;
end;

procedure TFOtch_o_Prop_Zan_po_Discipl.BitBtn2Click(Sender: TObject);
begin
//// 1.������� ���� ��������� html
////2. ������� � ���� ���������� �� ����� html
//������� ����
//��������� ����

 assignfile(f,extractfiledir(Application.ExeName)+'\������� ����� � ��������� ������� �� ������.html');
ReWrite(f);
writeln(f,'<html>');
writeln(f,'<head>');
writeln(f,'<LINK  REL=STYLESHEET  TYPE=text/css HREF=table.css>');
writeln(f,'</head>');
writeln(f,'<body>');
writeln(f,'<p></p>');
writeln(f,'<table>');
writeln(f,'<th>'+'� ��������'+'</th>')  ;
writeln(f,'<th>'+'��� ��������'+'</th>');
writeln(f,'<th>'+'���� ��������'+'</th>');
writeln(f,'<th>'+'���-�� �����'+'</th>');
writeln(f,'<th>'+'�������'+'</th>');

fdm.ADOQueryOtch.First;               //������� �� ������ ������
while not fdm.ADOQueryOtch.Eof do
  begin
writeln(f,'<tr>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('N_Student').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('FIO_Student').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('Data_I').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('Progul_chasi').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('Prichina').AsString+ '</td>');

writeln(f,'</tr>');
FDM.ADOQueryOtch.Next;
end;
writeln(f,'</table>');
writeln(f,'</body>');
writeln(f,'</html>');
closefile(f);
shellexecute(Handle,'open',Pchar(extractfiledir(Application.ExeName)+'\����� � ��������� ������� �� ����������.html'),nil,nil,SW_SHOWNORMAL);

end;

procedure TFOtch_o_Prop_Zan_po_Discipl.DateTimePicker1Change(Sender: TObject);
begin

FDM.ADOQueryOtch.SQL.Text:=' Exec Otch_o_PropPoDiscip '+
inttostr(fdm.ADOQueryVvodDiscipl.FieldByName('N_Discipl').Value)+','+
 QuotedStr(DateToStr(DateTimePicker1.Date))
+ ','+ QuotedStr(DateToStr(DateTimePicker2.Date));
FDM.ADOQueryOtch.Open;
DBGrid1.Columns.Items[0].Title.Caption :='� ��������';
DBGrid1.Columns.Items[0].Width :=70;
DBGrid1.Columns.Items[1].Title.Caption :='��� ��������';
DBGrid1.Columns.Items[1].Width :=150;
DBGrid1.Columns.Items[2].Title.Caption :='���� ��������';
DBGrid1.Columns.Items[2].Width :=70;
DBGrid1.Columns.Items[3].Title.Caption :='���-�� �����';
DBGrid1.Columns.Items[3].Width :=70;
DBGrid1.Columns.Items[4].Title.Caption :='�������';
DBGrid1.Columns.Items[4].Width :=90;
end;




procedure TFOtch_o_Prop_Zan_po_Discipl.FormActivate(Sender: TObject);
begin
FDM.ADOQueryVvodNagruzki.Open;
FDM.ADOQueryVvodPropusk.Open;
FDM.ADOQueryVvodStud.Open;
DateTimePicker1.Date:=Date;
DateTimePicker2.Date:=Date;
end;

end.
