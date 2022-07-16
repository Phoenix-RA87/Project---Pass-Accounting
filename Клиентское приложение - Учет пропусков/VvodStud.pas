unit VvodStud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, jpeg, StdCtrls, DBCtrls, Buttons, ComCtrls;

type
  TFVvodStud = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    LabeledEdit3: TLabeledEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodStud: TFVvodStud;

implementation

uses DM, FMenu, VvodDiscipl, VvodGrupp, VvodPrepod, VvodSpec;

{$R *.dfm}



procedure TFVvodStud.BitBtn1Click(Sender: TObject);
begin
FDM.ADOQueryVvodStud.Open;
FDM.ADOStoredProcVvodStud.Parameters.ParamByName('@N_Grupp').Value:=FDM.ADOQueryVvodGrupp.FieldByName('N_Grupp').Value;
FDM.ADOStoredProcVVodStud.Parameters.ParamByName('@FIO_Student').Value:=LabeledEdit3.Text;
FDM.ADOStoredProcVVodStud.Parameters.ParamByName('@Data_Vip').Value:=DateToStr(DateTimePicker1.Date);

FDM.ADOStoredProcVVodStud.ExecProc;

FDM.ADOQueryVvodStud.Close;
FDM.ADOQueryVvodStud.Open;
ShowMessage('����� ������� ��������')
end;

procedure TFVvodStud.FormActivate(Sender: TObject);
begin
DateTimePicker1.DateTime:=Now;
FDM.ADOQueryVvodStud.Active:=True;
FDM.ADOQueryVvodStud.Open;
DBGrid1.Columns.Items[0].Title.Caption :='� ��������';
DBGrid1.Columns.Items[1].Title.Caption :='� ������';
DBGrid1.Columns.Items[2].Title.Caption :='��� ��������';
DBGrid1.Columns.Items[3].Title.Caption :='���� �������';
end;

end.
