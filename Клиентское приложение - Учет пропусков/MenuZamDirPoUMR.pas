unit MenuZamDirPoUMR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons, Menus;

type
  TFMenuZamDirPoUMR = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image4: TImage;
    Image5: TImage;
    Image2: TImage;
    Image1: TImage;
    Image6: TImage;
    Image7: TImage;
    BitBtn1: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuZamDirPoUMR: TFMenuZamDirPoUMR;

implementation

uses OtchZamDirPoUMR, Otch_o_Prop_Zan_po_Discipl, Srav_analiz_prop_zan_po_tex,
  Sved_o_prich_prop_zan_po_tex, Svod_otch_o_prich_prop_zan_v_grupp,
  Svod_Otch_o_prop_zan_po_Discip_v_gr, Svod_otch_o_prop_zan_po_discipl;

{$R *.dfm}

procedure TFMenuZamDirPoUMR.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('Закончить работу программы?', mtConfirmation,[mbOk, mbCancel], 0) = mrOk then
begin
Close;
Application.Terminate;
end;
end;

procedure TFMenuZamDirPoUMR.N2Click(Sender: TObject);
begin
FOtchZamDirPoUMR.ShowModal();
end;

procedure TFMenuZamDirPoUMR.N3Click(Sender: TObject);
begin
FOtch_o_Prop_Zan_po_Discipl.ShowModal();
end;

procedure TFMenuZamDirPoUMR.N4Click(Sender: TObject);
begin
FSvod_Otch_o_prop_zan_po_Discip_v_gr.ShowModal();
end;

procedure TFMenuZamDirPoUMR.N5Click(Sender: TObject);
begin
FSvod_otch_o_prop_zan_po_discipl.ShowModal();
end;

procedure TFMenuZamDirPoUMR.N6Click(Sender: TObject);
begin
FSvod_otch_o_prich_prop_zan_v_grupp.ShowModal();
end;

procedure TFMenuZamDirPoUMR.N7Click(Sender: TObject);
begin
FSved_o_prich_prop_zan_po_tex.ShowModal();
end;

procedure TFMenuZamDirPoUMR.N8Click(Sender: TObject);
begin
FSrav_analiz_prop_zan_po_tex.ShowModal();
end;

end.
