unit Svod_Otch_o_prop_zan_po_Discip_v_gr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, jpeg, ExtCtrls,
  excel2000,comobj,ShellApi,DBCtrls;

type
  TFSvod_Otch_o_prop_zan_po_Discip_v_gr = class(TForm)
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSvod_Otch_o_prop_zan_po_Discip_v_gr: TFSvod_Otch_o_prop_zan_po_Discip_v_gr;
       OE1,OList :Variant;
     istr:integer;
  s:string;
  f:textfile;
  
implementation

uses DM;

{$R *.dfm}

procedure TFSvod_Otch_o_prop_zan_po_Discip_v_gr.BitBtn1Click(Sender: TObject);
begin

OE1:=CreateOleObject('Excel.Application'); //�������OLE-������ Excel
OE1.WorkBooks.Add();                      // ������� ������� ����� Excel
OE1.Visible:=True;                         // ������� Excel �������
//������� � ������ ��������- ���������� ��������� ������
OE1.Cells[1,1].Value:='������� ����� � ��������� ������� �� ������ '+
'�� ������'+' '+'c'+' '+DateToStr(DateTimePicker1.Date)+' '+'��'+' '+DateToStr(DateTimePicker2.Date);
OE1.Cells[2,1].Value:='� �/�';
OE1.Cells[2,2].value:='��� ��������';
OE1.Cells[2,3].Value:='��������� �����';
OE1.Cells[2,4].Value:='������������ ����������';
OE1.Cells[2,5].Value:='�����';



istr:=3;                           // �����
fdm.ADOQueryOtch.First;               //������� �� ������ ������
while not fdm.ADOQueryOtch.Eof do  // ���� �� ����� ��������� ����� �����
begin
//�������� � ������ Excel ���������� �����

OE1.Cells[istr,1].Value:=fdm.ADOQueryOtch.FieldByName('�_�/�').AsString;
OE1.Cells[istr,2].Value:=fdm.ADOQueryOtch.FieldByName('���_��������').AsString;
OE1.Cells[istr,3].Value:=fdm.ADOQueryOtch.FieldByName('���������_�����').AsString;
OE1.Cells[istr,4].Value:=fdm.ADOQueryOtch.FieldByName('������������_����������').AsString;
OE1.Cells[istr,5].Value:=fdm.ADOQueryOtch.FieldByName('�����').AsString;


//������� �� ��������� ������
FDM.ADOQueryOtch.Next;
////��������� ����� ������   � Excel
 istr:=istr+1;
//
end;
//begin
 //�������������� ������� ��� ��������������
OE1.Range['A3:H'+IntToStr(istr+1)].Select;   // �������� ������
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
     OE1.Range['A1:h'+inttostr(istr-1)].Select;
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

procedure TFSvod_Otch_o_prop_zan_po_Discip_v_gr.BitBtn2Click(Sender: TObject);
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
writeln(f,'<th>'+'� �/�'+'</th>')  ;
writeln(f,'<th>'+'��� ��������'+'</th>');
writeln(f,'<th>'+'��������� �����'+'</th>');
writeln(f,'<th>'+'������������ ����������'+'</th>');
writeln(f,'<th>'+'�����'+'</th>');
fdm.ADOQueryOtch.First;               //������� �� ������ ������
while not fdm.ADOQueryOtch.Eof do
  begin
writeln(f,'<tr>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('�_�/�').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('���_��������').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('���������_�����').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('������������_����������').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('�����').AsString+ '</td>');;
writeln(f,'</tr>');
FDM.ADOQueryOtch.Next;
end;
writeln(f,'</table>');
writeln(f,'</body>');
writeln(f,'</html>');
closefile(f);
shellexecute(Handle,'open',Pchar(extractfiledir(Application.ExeName)+'\������� ����� � ��������� ������� �� ������������ � ������.html'),nil,nil,SW_SHOWNORMAL);

end;

procedure TFSvod_Otch_o_prop_zan_po_Discip_v_gr.DateTimePicker1Change(
  Sender: TObject);
begin

fdm.ADOQueryOtch.SQL.Text:='exec Svod_otchPoDiscip' +
IntToStr(fdm.ADOQueryVvodGrupp.FieldByName('N_Grupp').Value)+','+
QuotedStr(DateToStr(DateTimePicker1.date))+','+
QuotedStr(DateToStr(DateTimePicker2.Date));
fdm.ADOQueryOtch.Close;
fdm.ADOQueryOtch.Open;
// DBGrid1.Columns.Items[0].Title.Caption :='� �/�';
// DBGrid1.Columns.Items[1].Title.Caption :='��������� �����';
// DBGrid1.Columns.Items[2].Title.Caption :='������������ ����������';
// DBGrid1.Columns.Items[3].Title.Caption :='�����';
end;

procedure TFSvod_Otch_o_prop_zan_po_Discip_v_gr.FormActivate(Sender: TObject);
begin
fdm.ADOQueryVvodGrupp.Open;
DateTimePicker1.Date:=date;
DateTimePicker2.Date:=date;
DateTimePicker1Change(self);

end;

end.
