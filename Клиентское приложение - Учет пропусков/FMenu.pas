unit FMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons, Mask, Menus;

type
  TFAvtorizacia = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAvtorizacia: TFAvtorizacia;

implementation

uses DM, VvodDiscipl, VvodGrupp, VvodPrepod, VvodSpec, VvodStud,
  Glavnai_Avtorizacia, MenuZamDirPoUMR, Menu_Prepod, Social_pedagog;

{$R *.dfm}


procedure TFAvtorizacia.BitBtn1Click(Sender: TObject);
begin


if (ComboBox1.ItemIndex=0)  and (MaskEdit1.Text='000') then
 FMenuZamDirPoUMR.ShowModal();



if (ComboBox1.ItemIndex=1)  and (MaskEdit1.Text='111') then
 FMenu_Prepod.ShowModal();

   if (ComboBox1.ItemIndex=2)  and (MaskEdit1.Text='222') then
 FSocial_pedagog.ShowModal();



 if (ComboBox1.ItemIndex=3)  and (MaskEdit1.Text='333') then
 FGlavnai_Avtorizacia.ShowModal();
end;

procedure TFAvtorizacia.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('Закончить работу программы?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

end.
