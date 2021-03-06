unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TFDM = class(TDataModule)
    DataSourceVvodSpec: TDataSource;
    DataSourceVvodDiscipl: TDataSource;
    DataSourceVvodPrepod: TDataSource;
    DataSourceVvodGrupp: TDataSource;
    DataSourceVvodStud: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQueryVvodSpec: TADOQuery;
    ADOQueryVvodDiscipl: TADOQuery;
    ADOQueryVvodPrepod: TADOQuery;
    ADOQueryVvodGrupp: TADOQuery;
    ADOQueryVvodStud: TADOQuery;
    ADOStoredProcVvodSpec: TADOStoredProc;
    ADOStoredProcVvodPrepod: TADOStoredProc;
    ADOStoredProcVvodGrupp: TADOStoredProc;
    ADOQueryOtch: TADOQuery;
    DataSourceOtch: TDataSource;
    ADOStoredProcVVod_Discipl: TADOStoredProc;
    ADOStoredProcVvodStud: TADOStoredProc;
    DataSourceVvodNagruzki: TDataSource;
    ADOStoredProcVvodNagruzki: TADOStoredProc;
    DataSourceVvodProppusk: TDataSource;
    ADOQueryVvodPropusk: TADOQuery;
    ADOStoredProcVvodPropusk: TADOStoredProc;
    ADOQueryVvodNagruzki: TADOQuery;
    ADOQueryVvodNagruzkiN_Nagruzka: TAutoIncField;
    ADOQueryVvodNagruzkiN_Prepodavat: TIntegerField;
    ADOQueryVvodNagruzkiN_Grupp: TIntegerField;
    ADOQueryVvodNagruzkiN_Discipl: TIntegerField;
    ADOQueryVvodNagruzkiUcheb_god: TIntegerField;
    ADOQueryVvodNagruzkiN_Discipl_1: TAutoIncField;
    ADOQueryVvodNagruzkiNaim_discipl: TStringField;
    ADOQueryVvodNagruzkiN_Prepodavat_1: TAutoIncField;
    ADOQueryVvodNagruzkiFIO: TStringField;
    ADOQueryVvodNagruzkiPass: TStringField;
    ADOQueryVvodNagruzkiN_Grupp_1: TAutoIncField;
    ADOQueryVvodNagruzkiN_Special: TIntegerField;
    ADOQueryVvodNagruzkiKurs: TIntegerField;
    ADOQueryVvodNagruzkiNaim_grupp: TStringField;
    ADOQueryVvodNagruzkiSoc_ped: TStringField;
    ADOStoredProciZMENpROP: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDM: TFDM;

implementation

uses FMenu, VvodDiscipl, VvodGrupp, VvodPrepod, VvodSpec, VvodStud,
  Otch_o_Prop_Zan_po_Discipl, OtchZamDirPoUMR, Srav_analiz_prop_zan_po_tex,
  Sved_o_prich_prop_zan_po_tex, Svod_otch_o_prich_prop_zan_v_grupp,
  Svod_Otch_o_prop_zan_po_Discip_v_gr, Svod_otch_o_prop_zan_po_discipl;

{$R *.dfm}

end.
