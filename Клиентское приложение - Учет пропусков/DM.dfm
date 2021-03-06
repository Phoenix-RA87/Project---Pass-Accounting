object FDM: TFDM
  OldCreateOrder = False
  Height = 468
  Width = 761
  object DataSourceVvodSpec: TDataSource
    DataSet = ADOQueryVvodSpec
    Left = 296
    Top = 32
  end
  object DataSourceVvodDiscipl: TDataSource
    DataSet = ADOQueryVvodDiscipl
    Left = 296
    Top = 104
  end
  object DataSourceVvodPrepod: TDataSource
    DataSet = ADOQueryVvodPrepod
    Left = 296
    Top = 176
  end
  object DataSourceVvodGrupp: TDataSource
    DataSet = ADOQueryVvodGrupp
    Left = 296
    Top = 248
  end
  object DataSourceVvodStud: TDataSource
    DataSet = ADOQueryVvodStud
    Left = 296
    Top = 328
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=Propusk;Data Source=127.0.0.1;Use Proce' +
      'dure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstat' +
      'ion ID=DESKTOP-9VBOF0G;Use Encryption for Data=False;Tag with co' +
      'lumn collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 32
  end
  object ADOQueryVvodSpec: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Special')
    Left = 176
    Top = 32
  end
  object ADOQueryVvodDiscipl: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Discipl')
    Left = 176
    Top = 104
  end
  object ADOQueryVvodPrepod: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Prepodavat')
    Left = 176
    Top = 176
  end
  object ADOQueryVvodGrupp: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Gruppa')
    Left = 176
    Top = 248
  end
  object ADOQueryVvodStud: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Student')
    Left = 176
    Top = 328
  end
  object ADOStoredProcVvodSpec: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Specialnost;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Naim_special'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = '0'
      end
      item
        Name = '@Shifr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 440
    Top = 32
  end
  object ADOStoredProcVvodPrepod: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Prepodavatel;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@FIO'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = ''
      end
      item
        Name = '@Pass'
        Attributes = [paNullable]
        DataType = ftString
        Size = 16
        Value = ''
      end>
    Left = 448
    Top = 176
  end
  object ADOStoredProcVvodGrupp: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Grupp;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@N_Special'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Kurs'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Naim_grupp'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = ''
      end
      item
        Name = '@Soc_ped'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = ''
      end>
    Left = 440
    Top = 248
  end
  object ADOQueryOtch: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 112
  end
  object DataSourceOtch: TDataSource
    DataSet = ADOQueryOtch
    Left = 48
    Top = 184
  end
  object ADOStoredProcVVod_Discipl: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Disciplina;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = -6
      end
      item
        Name = '@Naim_Discipl'
        Attributes = [paNullable]
        DataType = ftString
        Size = 64
        Value = ''
      end>
    Left = 448
    Top = 112
  end
  object ADOStoredProcVvodStud: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Stud;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@N_Grupp'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@FIO_Student'
        Attributes = [paNullable]
        DataType = ftString
        Size = 150
        Value = ''
      end
      item
        Name = '@Data_Vip'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 16
        Value = '0:00:00'
      end>
    Left = 440
    Top = 328
  end
  object DataSourceVvodNagruzki: TDataSource
    DataSet = ADOQueryVvodNagruzki
    Left = 608
    Top = 88
  end
  object ADOStoredProcVvodNagruzki: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Nagruzk;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@N_Prepodavat'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@N_Grupp'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@N_Discipl'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Ucheb_god'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 608
    Top = 144
  end
  object DataSourceVvodProppusk: TDataSource
    DataSet = ADOQueryVvodPropusk
    Left = 600
    Top = 280
  end
  object ADOQueryVvodPropusk: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Propusk')
    Left = 600
    Top = 216
  end
  object ADOStoredProcVvodPropusk: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'Propus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@N_Nagruzka'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@N_Student'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Data_I'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 16
        Value = '0:00:00'
      end
      item
        Name = '@Prichina'
        Attributes = [paNullable]
        DataType = ftString
        Size = 90
        Value = ''
      end
      item
        Name = '@Progul_chasi'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end
      item
        Name = '@Oprav_dok'
        Attributes = [paNullable]
        DataType = ftString
        Size = 90
        Value = '0'
      end>
    Left = 592
    Top = 336
  end
  object ADOQueryVvodNagruzki: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select * from Nagruzka, Discipl, Prepodavat, Gruppa where Nagruz' +
        'ka.N_Discipl=Discipl.N_Discipl and Prepodavat.N_Prepodavat=Nagru' +
        'zka.N_Prepodavat and Gruppa.N_Grupp=Nagruzka.N_Grupp')
    Left = 608
    Top = 32
    object ADOQueryVvodNagruzkiN_Nagruzka: TAutoIncField
      FieldName = 'N_Nagruzka'
      ReadOnly = True
    end
    object ADOQueryVvodNagruzkiN_Prepodavat: TIntegerField
      FieldName = 'N_Prepodavat'
    end
    object ADOQueryVvodNagruzkiN_Grupp: TIntegerField
      FieldName = 'N_Grupp'
    end
    object ADOQueryVvodNagruzkiN_Discipl: TIntegerField
      FieldName = 'N_Discipl'
    end
    object ADOQueryVvodNagruzkiUcheb_god: TIntegerField
      FieldName = 'Ucheb_god'
    end
    object ADOQueryVvodNagruzkiN_Discipl_1: TAutoIncField
      FieldName = 'N_Discipl_1'
      ReadOnly = True
    end
    object ADOQueryVvodNagruzkiNaim_discipl: TStringField
      DisplayWidth = 15
      FieldName = 'Naim_discipl'
      FixedChar = True
      Size = 64
    end
    object ADOQueryVvodNagruzkiN_Prepodavat_1: TAutoIncField
      FieldName = 'N_Prepodavat_1'
      ReadOnly = True
    end
    object ADOQueryVvodNagruzkiFIO: TStringField
      FieldName = 'FIO'
      FixedChar = True
      Size = 150
    end
    object ADOQueryVvodNagruzkiPass: TStringField
      FieldName = 'Pass'
      FixedChar = True
      Size = 8
    end
    object ADOQueryVvodNagruzkiN_Grupp_1: TAutoIncField
      FieldName = 'N_Grupp_1'
      ReadOnly = True
    end
    object ADOQueryVvodNagruzkiN_Special: TIntegerField
      FieldName = 'N_Special'
    end
    object ADOQueryVvodNagruzkiKurs: TIntegerField
      FieldName = 'Kurs'
    end
    object ADOQueryVvodNagruzkiSoc_ped: TStringField
      FieldName = 'Soc_ped'
      FixedChar = True
      Size = 150
    end
    object ADOQueryVvodNagruzkiNaim_grupp: TStringField
      DisplayWidth = 20
      FieldName = 'Naim_grupp'
      Size = 50
    end
  end
  object ADOStoredProciZMENpROP: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'izmen_Prop'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@N_Propuska'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Prichina'
        Attributes = [paNullable]
        DataType = ftString
        Size = 90
        Value = Null
      end>
    Left = 592
    Top = 392
  end
end
