unit VvodGrupp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, jpeg, DBCtrls, StdCtrls, Buttons;

type
  TFVvodGrupp = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodGrupp: TFVvodGrupp;

implementation

uses DM, FMenu, VvodDiscipl, VvodPrepod, VvodSpec, VvodStud;

{$R *.dfm}



procedure TFVvodGrupp.BitBtn1Click(Sender: TObject);
begin
FDM.ADOQueryVvodGrupp.Open;
FDM.ADOStoredProcVvodGrupp.Parameters.ParamByName('@N_Special').Value:=FDM.ADOQueryVvodSpec.FieldByName('N_Special').Value;
FDM.ADOStoredProcVVodGrupp.Parameters.ParamByName('@Kurs').Value:=(LabeledEdit1.Text);
FDM.ADOStoredProcVVodGrupp.Parameters.ParamByName('@Naim_Grupp').Value:=(LabeledEdit2.Text);
FDM.ADOStoredProcVVodGrupp.Parameters.ParamByName('@Soc_ped').Value:=(LabeledEdit3.Text);



FDM.ADOStoredProcVVodGrupp.ExecProc;

FDM.ADOQueryVvodGrupp.Close;
FDM.ADOQueryVvodGrupp.Open;
ShowMessage('????? ?????? ?????????')
end;

procedure TFVvodGrupp.FormActivate(Sender: TObject);
begin
FDM.ADOQueryVvodGrupp.Active:=True;
FDM.ADOQueryVvodGrupp.Open;
DBGrid1.Columns.Items[0].Title.Caption :='? ??????';
DBGrid1.Columns.Items[1].Title.Caption :='? ?????????????';
DBGrid1.Columns.Items[2].Title.Caption :='????';
DBGrid1.Columns.Items[3].Title.Caption :='???????? ??????';
DBGrid1.Columns.Items[4].Title.Caption :='??? ??????????? ????????';
end;

end.
