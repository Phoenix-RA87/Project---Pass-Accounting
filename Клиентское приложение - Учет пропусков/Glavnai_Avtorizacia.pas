unit Glavnai_Avtorizacia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Mask, Buttons, Menus;

type
  TFGlavnai_Avtorizacia = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Image4: TImage;
    Image5: TImage;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    Image7: TImage;
    Image6: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    vo: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N6: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure voClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGlavnai_Avtorizacia: TFGlavnai_Avtorizacia;

implementation

uses FMenu, DM, MenuZamDirPoUMR, VvodDiscipl, VvodGrupp, VvodNagruzki,
  VvodPrepod, VvodSpec, VvodStud;

{$R *.dfm}

procedure TFGlavnai_Avtorizacia.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('????????? ?????? ??????????', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFGlavnai_Avtorizacia.N2Click(Sender: TObject);
begin
FVvodSprc.ShowModal();
end;

procedure TFGlavnai_Avtorizacia.N3Click(Sender: TObject);
begin
FVvodDiscipl.ShowModal();
end;

procedure TFGlavnai_Avtorizacia.N4Click(Sender: TObject);
begin
FVvodPrepod.ShowModal();
end;

procedure TFGlavnai_Avtorizacia.N5Click(Sender: TObject);
begin
FVvodGrupp.ShowModal();
end;

procedure TFGlavnai_Avtorizacia.N6Click(Sender: TObject);
begin
Close();
end;

procedure TFGlavnai_Avtorizacia.N7Click(Sender: TObject);
begin
FVvodNagruzki.ShowModal();
end;

procedure TFGlavnai_Avtorizacia.voClick(Sender: TObject);
begin
FVvodStud.ShowModal();
end;

end.
