unit Social_pedagog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Menus;

type
  TFSocial_pedagog = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Image6: TImage;
    Image7: TImage;
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSocial_pedagog: TFSocial_pedagog;

implementation

uses DM, FMenu, VvodOpravDoc;

{$R *.dfm}

procedure TFSocial_pedagog.N2Click(Sender: TObject);
begin
FVvodOpravDoc.ShowModal();
end;

procedure TFSocial_pedagog.N4Click(Sender: TObject);
begin
if MessageDlg('????????? ?????? ??????????', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

end.
