unit VvodDiscipl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, jpeg, StdCtrls, Buttons, DBCtrls;

type
  TFVvodDiscipl = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Image7: TImage;
    Image6: TImage;
    LabeledEdit1: TLabeledEdit;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    Image4: TImage;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodDiscipl: TFVvodDiscipl;

implementation

uses DM, FMenu, VvodGrupp, VvodPrepod, VvodSpec, VvodStud;

{$R *.dfm}

procedure TFVvodDiscipl.BitBtn3Click(Sender: TObject);
begin

FDM.ADOQueryVvodDiscipl.Open;
FDM.ADOStoredProcVVod_Discipl.Parameters.ParamByName('@Naim_Discipl').Value:=(LabeledEdit1.Text);

FDM.ADOStoredProcVVod_Discipl.ExecProc;

FDM.ADOQueryVvodDiscipl.Close;
FDM.ADOQueryVvodDiscipl.Open;
ShowMessage('????? ?????????? ?????????');

end;

procedure TFVvodDiscipl.FormActivate(Sender: TObject);
begin
FDM.ADOQueryVvodDiscipl.Active:=True;
FDM.ADOQueryVvodDiscipl.Open;
DBGrid1.Columns.Items[0].Title.Caption :='? ??????????';
DBGrid1.Columns.Items[1].Title.Caption :='???????? ??????????';
end;

end.
