unit VvodNagruzki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, jpeg, StdCtrls, DBCtrls, Buttons;

type
  TFVvodNagruzki = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image6: TImage;
    Image7: TImage;
    Image5: TImage;
    LabeledEdit1: TLabeledEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodNagruzki: TFVvodNagruzki;

implementation

uses DM, FMenu, VvodDiscipl, VvodGrupp, VvodPrepod, VvodSpec, VvodStud;

{$R *.dfm}



procedure TFVvodNagruzki.BitBtn3Click(Sender: TObject);
begin
FDM.ADOQueryVvodNagruzki.Open;
FDM.ADOStoredProcVvodNagruzki.Parameters.ParamByName('@N_Prepodavat').Value:=FDM.ADOQueryVvodPrepod.FieldByName('N_Prepodavat').Value;
FDM.ADOStoredProcVvodNagruzki.Parameters.ParamByName('@N_Grupp').Value:=FDM.ADOQueryVvodGrupp.FieldByName('N_Grupp').Value;
FDM.ADOStoredProcVvodNagruzki.Parameters.ParamByName('@N_Discipl').Value:=FDM.ADOQueryVvodDiscipl.FieldByName('N_Discipl').Value;
FDM.ADOStoredProcVVodNagruzki.Parameters.ParamByName('@Ucheb_god').Value:=(LabeledEdit1.Text);

FDM.ADOStoredProcVVodNagruzki.ExecProc;

FDM.ADOQueryVvodNagruzki.Close;
FDM.ADOQueryVvodNagruzki.Open;
ShowMessage('???????? ?????????')
end;


procedure TFVvodNagruzki.FormActivate(Sender: TObject);
begin
FDM.ADOQueryVvodNagruzki.Active:=True;
FDM.ADOQueryVvodNagruzki.Open;
DBGrid1.Columns.Items[0].Title.Caption :='? ??????????????';
DBGrid1.Columns.Items[1].Title.Caption :='? ?????';
DBGrid1.Columns.Items[2].Title.Caption :='? ?????????';
DBGrid1.Columns.Items[3].Title.Caption :='???? ?';
DBGrid1.Columns.Items[4].Title.Caption :='???? ??';
end;

end.
