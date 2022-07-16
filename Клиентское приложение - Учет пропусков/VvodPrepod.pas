unit VvodPrepod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, jpeg, StdCtrls, Buttons, Mask;

type
  TFVvodPrepod = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Image3: TImage;
    Image4: TImage;
    Image2: TImage;
    Panel3: TPanel;
    Image5: TImage;
    Image7: TImage;
    Image6: TImage;
    LabeledEdit1: TLabeledEdit;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodPrepod: TFVvodPrepod;

implementation

uses DM, FMenu, VvodDiscipl, VvodGrupp, VvodSpec, VvodStud;

{$R *.dfm}

procedure TFVvodPrepod.BitBtn1Click(Sender: TObject);
begin
FDM.ADOQueryVvodPrepod.Open;
FDM.ADOStoredProcVvodPrepod.Parameters.ParamByName('@FIO').Value:=(LabeledEdit1.Text);
FDM.ADOStoredProcVvodPrepod.Parameters.ParamByName('@Pass').Value:=(MaskEdit1.Text);

FDM.ADOStoredProcVvodPrepod.ExecProc;

FDM.ADOQueryVvodPrepod.Close;
FDM.ADOQueryVvodPrepod.Open;
ShowMessage('Новый преподаватель добавлен');
end;

procedure TFVvodPrepod.FormActivate(Sender: TObject);
begin
FDM.ADOQueryVvodPrepod.Active:=True;
FDM.ADOQueryVvodPrepod.Open;
DBGrid1.Columns.Items[0].Title.Caption :='№ Преподавателя';
DBGrid1.Columns.Items[1].Title.Caption :='ФИО Преподавателя';
DBGrid1.Columns.Items[2].Title.Caption :='Пароль';
end;

end.
