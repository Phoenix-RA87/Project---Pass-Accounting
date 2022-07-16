program Zavuch;

uses
  Forms,
  FMenu in 'FMenu.pas' {FAvtorizacia},
  VvodDiscipl in 'VvodDiscipl.pas' {FVvodDiscipl},
  VvodSpec in 'VvodSpec.pas' {FVvodSprc},
  VvodPrepod in 'VvodPrepod.pas' {FVvodPrepod},
  VvodGrupp in 'VvodGrupp.pas' {FVvodGrupp},
  VvodStud in 'VvodStud.pas' {FVvodStud},
  DM in 'DM.pas' {FDM: TDataModule},
  VvodNagruzki in 'VvodNagruzki.pas' {FVvodNagruzki},
  Glavnai_Avtorizacia in 'Glavnai_Avtorizacia.pas' {FGlavnai_Avtorizacia},
  MenuZamDirPoUMR in 'MenuZamDirPoUMR.pas' {FMenuZamDirPoUMR},
  OtchZamDirPoUMR in 'OtchZamDirPoUMR.pas' {FOtchZamDirPoUMR},
  Menu_Prepod in 'Menu_Prepod.pas' {FMenu_Prepod},
  VvodPropusk in 'VvodPropusk.pas' {FVvodPropusk},
  Social_pedagog in 'Social_pedagog.pas' {FSocial_pedagog},
  VvodOpravDoc in 'VvodOpravDoc.pas' {FVvodOpravDoc},
  Otch_o_Prop_Zan_po_Discipl in 'Otch_o_Prop_Zan_po_Discipl.pas' {FOtch_o_Prop_Zan_po_Discipl},
  Svod_Otch_o_prop_zan_po_Discip_v_gr in 'Svod_Otch_o_prop_zan_po_Discip_v_gr.pas' {FSvod_Otch_o_prop_zan_po_Discip_v_gr},
  Svod_otch_o_prop_zan_po_discipl in 'Svod_otch_o_prop_zan_po_discipl.pas' {FSvod_otch_o_prop_zan_po_discipl},
  Svod_otch_o_prich_prop_zan_v_grupp in 'Svod_otch_o_prich_prop_zan_v_grupp.pas' {FSvod_otch_o_prich_prop_zan_v_grupp},
  Sved_o_prich_prop_zan_po_tex in 'Sved_o_prich_prop_zan_po_tex.pas' {FSved_o_prich_prop_zan_po_tex},
  Srav_analiz_prop_zan_po_tex in 'Srav_analiz_prop_zan_po_tex.pas' {FSrav_analiz_prop_zan_po_tex};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFAvtorizacia, FAvtorizacia);
  Application.CreateForm(TFVvodDiscipl, FVvodDiscipl);
  Application.CreateForm(TFVvodSprc, FVvodSprc);
  Application.CreateForm(TFVvodPrepod, FVvodPrepod);
  Application.CreateForm(TFVvodGrupp, FVvodGrupp);
  Application.CreateForm(TFVvodStud, FVvodStud);
  Application.CreateForm(TFDM, FDM);
  Application.CreateForm(TFVvodNagruzki, FVvodNagruzki);
  Application.CreateForm(TFGlavnai_Avtorizacia, FGlavnai_Avtorizacia);
  Application.CreateForm(TFMenuZamDirPoUMR, FMenuZamDirPoUMR);
  Application.CreateForm(TFOtchZamDirPoUMR, FOtchZamDirPoUMR);
  Application.CreateForm(TFMenu_Prepod, FMenu_Prepod);
  Application.CreateForm(TFVvodPropusk, FVvodPropusk);
  Application.CreateForm(TFSocial_pedagog, FSocial_pedagog);
  Application.CreateForm(TFVvodOpravDoc, FVvodOpravDoc);
  Application.CreateForm(TFOtch_o_Prop_Zan_po_Discipl, FOtch_o_Prop_Zan_po_Discipl);
  Application.CreateForm(TFSvod_Otch_o_prop_zan_po_Discip_v_gr, FSvod_Otch_o_prop_zan_po_Discip_v_gr);
  Application.CreateForm(TFSvod_otch_o_prop_zan_po_discipl, FSvod_otch_o_prop_zan_po_discipl);
  Application.CreateForm(TFSvod_otch_o_prich_prop_zan_v_grupp, FSvod_otch_o_prich_prop_zan_v_grupp);
  Application.CreateForm(TFSved_o_prich_prop_zan_po_tex, FSved_o_prich_prop_zan_po_tex);
  Application.CreateForm(TFSrav_analiz_prop_zan_po_tex, FSrav_analiz_prop_zan_po_tex);
  Application.Run;
end.
