unit Srav_analiz_prop_zan_po_tex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, jpeg, ExtCtrls,
  excel2000,comobj,ShellApi;


type
  TFSrav_analiz_prop_zan_po_tex = class(TForm)
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Edit1: TEdit;
    Label3: TLabel;
    BitBtn2: TBitBtn;
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
  FSrav_analiz_prop_zan_po_tex: TFSrav_analiz_prop_zan_po_tex;
  OE1,OList :Variant;
istr:integer;
s:string;
f:textfile;
implementation

uses DM;

{$R *.dfm}

procedure TFSrav_analiz_prop_zan_po_tex.BitBtn1Click(Sender: TObject);
begin

OE1:=CreateOleObject('Excel.Application'); //СоздатьOLE-объект Excel
OE1.WorkBooks.Add();                      // Создать рабочую книгу Excel
OE1.Visible:=True;                         // Сделать Excel видимым
//Занести в ячейку значение- напечатать заголовок отчета
OE1.Cells[1,1].Value:='Сравнительный анализ о пропусках занятий по техникуму '+
'За период'+' '+'c'+' '+DateToStr(DateTimePicker1.Date)+' '+'по'+' '+DateToStr(DateTimePicker2.Date);
OE1.Cells[2,1].Value:='Годы';
OE1.Cells[2,2].value:='Пропущено часов всего';
OE1.Cells[2,3].Value:='По болезни';
OE1.Cells[2,4].Value:='МСЭК';
OE1.Cells[2,5].Value:='Заявление';
OE1.Cells[2,6].Value:='С разрешения администрации';
OE1.Cells[2,7].Value:='другие причины';
OE1.Cells[2,8].Value:='Прогулы';


istr:=3;                           // Номер
fdm.ADOQueryOtch.First;               //Перейти на первую запись
while not fdm.ADOQueryOtch.Eof do  // Пока не будет достигнут конец файла
begin
//Заносить в ячейку Excel содержимое полей

OE1.Cells[istr,0].Value:=fdm.ADOQueryOtch.FieldByName('Годы').AsString;
OE1.Cells[istr,1].Value:=fdm.ADOQueryOtch.FieldByName('Пропущено_часов').AsString;
OE1.Cells[istr,2].Value:=fdm.ADOQueryOtch.FieldByName('По_болезни').AsString;
OE1.Cells[istr,3].Value:=fdm.ADOQueryOtch.FieldByName('МСЭК').AsString;
OE1.Cells[istr,4].Value:=fdm.ADOQueryOtch.FieldByName('Заявление').AsString;
OE1.Cells[istr,5].Value:=fdm.ADOQueryOtch.FieldByName('С_разрешения_администрации').AsString;
OE1.Cells[istr,6].Value:=fdm.ADOQueryOtch.FieldByName('Другие_причины').AsString;
OE1.Cells[istr,7].Value:=fdm.ADOQueryOtch.FieldByName('Прогулы').AsString;


//Перейти на следующую запись
FDM.ADOQueryOtch.Next;
////Увеличить номер строки   в Excel
 istr:=istr+1;
//
end;
//begin
 //Дополнительные команды для форматирования
OE1.Range['A3:H'+IntToStr(istr+1)].Select;   // Выделить ячейки
//Обрамление сплошной линией всех выделенных ячеек
     OE1.Selection.Borders[xlEdgeLeft].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeRight].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeTop].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlEdgeBottom].LineStyle:=xlContinuous;
     OE1.Selection.Borders[xlInsideVertical].LineStyle:=xlContinuous;
 OE1.Selection.Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
   // OE1.Selection.MergeCells:=True;
//OE1.Selection.HorizontalAlignment := xlLeft;
    /// OE1.Selection.VerticalAlignment := xlCenter;
     OE1.Range['A1:E'+inttostr(istr-1)].Select;
OE1.Selection.ColumnWidth:=30;// Ширина столбца

  // параметры печати - границы
        OE1.ActiveSheet.PageSetup.LeftMargin:= 0.39;
        OE1.ActiveSheet.PageSetup.RightMargin := 0.39;
        OE1.ActiveSheet.PageSetup.TopMargin := 2.78;
        OE1.ActiveSheet.PageSetup.BottomMargin := 0.78;
  // параметры печати - ориентация
        OE1.ActiveSheet.PageSetup.Orientation := xlLandscape;
        OE1.ActiveSheet.PageSetup.Zoom := False ;
// Расположить на 1 странице по ширине        OE1.ActiveSheet.PageSetup.FitToPagesWide := 1
// Расположить на 10 страницах по высоте        OE1.ActiveSheet.PageSetup.FitToPagesTall := 10;
//Правый колонтитул внизу
OE1.ActiveSheet.PageSetup.RightFooter := DateToStr(Date) ;
//Предварительный просмотр
OE1.ActiveSheet.PrintPreview;
end;

procedure TFSrav_analiz_prop_zan_po_tex.BitBtn2Click(Sender: TObject);
begin

//// 1.открыть файл раширение html
////2. вывести в файл информацию на языке html
//закрыть файл
//запустить файл

 assignfile(f,extractfiledir(Application.ExeName)+'\Сравнительный анализ о пропусках занятий по техникуму.html');
ReWrite(f);
writeln(f,'<html>');
writeln(f,'<head>');
writeln(f,'<LINK  REL=STYLESHEET  TYPE=text/css HREF=table.css>');
writeln(f,'</head>');
writeln(f,'<body>');
writeln(f,'<p></p>');
writeln(f,'<table>');
writeln(f,'<th>'+'Годы'+'</th>')  ;
writeln(f,'<th>'+'Пропущено часов'+'</th>');
writeln(f,'<th>'+'По болезни'+'</th>');
writeln(f,'<th>'+'МСЭК'+'</th>');
writeln(f,'<th>'+'Заявление'+'</th>');
writeln(f,'<th>'+'С разрешения администрации'+'</th>');
writeln(f,'<th>'+'Другие причины'+'</th>');
writeln(f,'<th>'+'Прогулы'+'</th>');
fdm.ADOQueryOtch.First;               //Перейти на первую запись
while not fdm.ADOQueryOtch.Eof do
  begin
writeln(f,'<tr>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('Годы').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('Пропущено_часов').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('По_болезни').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('МСЭК').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('Заявление').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('С_разрешения_администрации').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('другие_причины').AsString+ '</td>');
writeln(f,'<td>'+fdm.ADOQueryOtch.FieldByName('Прогулы').AsString+ '</td>');
writeln(f,'</tr>');
FDM.ADOQueryOtch.Next;
end;
writeln(f,'</table>');
writeln(f,'</body>');
writeln(f,'</html>');
closefile(f);
shellexecute(Handle,'open',Pchar(extractfiledir(Application.ExeName)+'\Сравнительный анализ о пропусках занятий по техникуму.html'),nil,nil,SW_SHOWNORMAL);

end;

procedure TFSrav_analiz_prop_zan_po_tex.DateTimePicker1Change(Sender: TObject);
begin
fdm.ADOQueryOtch.SQL.Text:='exec Srav_Analiz_propuskov_tehnikumu '+
QuotedStr(Edit1.Text);
fdm.ADOQueryOtch.Close;
fdm.ADOQueryOtch.Open;
 DBGrid1.Columns.Items[0].Title.Caption :='Годы';
 DBGrid1.Columns.Items[1].Title.Caption :='Пропущено часов всего';
 DBGrid1.Columns.Items[2].Title.Caption :='по болезни';
 DBGrid1.Columns.Items[3].Title.Caption :='МСЭК';
 DBGrid1.Columns.Items[4].Title.Caption :='Заявление';
 DBGrid1.Columns.Items[5].Title.Caption :='С разрешения администрации';
 DBGrid1.Columns.Items[6].Title.Caption :='Другие причины';
 DBGrid1.Columns.Items[7].Title.Caption :='Прогулы';
end;

procedure TFSrav_analiz_prop_zan_po_tex.FormActivate(Sender: TObject);
begin
DateTimePicker1.DateTime:=Now;
DateTimePicker2.DateTime:=Now;
end;

end.
