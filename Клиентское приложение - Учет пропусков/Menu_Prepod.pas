unit Menu_Prepod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons, Menus;

type
  TFMenu_Prepod = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    GroupBox1: TGroupBox;
    Image5: TImage;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenu_Prepod: TFMenu_Prepod;

implementation

uses VvodPropusk;

{$R *.dfm}

procedure TFMenu_Prepod.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('????????? ?????? ??????????', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFMenu_Prepod.N3Click(Sender: TObject);
begin
FVvodPropusk.ShowModal();
end;

end.
