unit VvodSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, jpeg, StdCtrls, Buttons, Mask;

type
  TFVvodSprc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    LabeledEdit1: TLabeledEdit;
    BitBtn1: TBitBtn;
    Image7: TImage;
    LabeledEdit2: TLabeledEdit;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVvodSprc: TFVvodSprc;

implementation

uses DM, FMenu, VvodDiscipl, VvodGrupp, VvodPrepod, VvodStud;

{$R *.dfm}

procedure TFVvodSprc.BitBtn1Click(Sender: TObject);
begin

FDM.ADOQueryVvodSpec.Open;
FDM.ADOStoredProcVvodSpec.Parameters.ParamByName('@Shifr').Value:=(LabeledEdit2.Text);
FDM.ADOStoredProcVvodSpec.Parameters.ParamByName('@Naim_Special').Value:=(LabeledEdit1.Text);

FDM.ADOStoredProcVvodSpec.ExecProc;

FDM.ADOQueryVvodSpec.Close;
FDM.ADOQueryVvodSpec.Open;
ShowMessage('����� ������������� ���������');
end;

procedure TFVvodSprc.FormActivate(Sender: TObject);
begin
FDM.ADOQueryVvodSpec.Active:=True;
FDM.ADOQueryVvodSpec.Open;
DBGrid1.Columns.Items[0].Title.Caption :='� �������������';
DBGrid1.Columns.Items[1].Title.Caption :='����';
DBGrid1.Columns.Items[2].Title.Caption :='�������� �������������';

end;

end.
