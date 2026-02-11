object KundenAddForm: TKundenAddForm
  Left = 0
  Top = 0
  Caption = 'Neuen Kunde anlegen'
  ClientHeight = 424
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 781
    Height = 201
  end
  object Label1: TLabel
    Left = 15
    Top = 43
    Width = 54
    Height = 13
    Caption = 'Kurzname :'
  end
  object Label2: TLabel
    Left = 15
    Top = 70
    Width = 43
    Height = 13
    Caption = 'Name 1 :'
  end
  object Label3: TLabel
    Left = 15
    Top = 97
    Width = 43
    Height = 13
    Caption = 'Name 2 :'
  end
  object Label4: TLabel
    Left = 15
    Top = 124
    Width = 43
    Height = 13
    Caption = 'Strasse :'
  end
  object Label5: TLabel
    Left = 399
    Top = 124
    Width = 69
    Height = 13
    Caption = 'Hausnummer :'
  end
  object Label6: TLabel
    Left = 15
    Top = 151
    Width = 24
    Height = 13
    Caption = 'PLZ :'
  end
  object Label7: TLabel
    Left = 167
    Top = 151
    Width = 23
    Height = 13
    Caption = 'Ort :'
  end
  object SpeedButton19: TSpeedButton
    Left = 761
    Top = 40
    Width = 23
    Height = 23
    Caption = '+'
  end
  object Label8: TLabel
    Left = 15
    Top = 178
    Width = 30
    Height = 13
    Caption = 'Land :'
  end
  object Label9: TLabel
    Left = 286
    Top = 178
    Width = 62
    Height = 13
    Caption = 'Bundesland :'
  end
  object Bevel2: TBevel
    Left = 8
    Top = 214
    Width = 781
    Height = 123
  end
  object SpeedButton15: TSpeedButton
    Left = 659
    Top = 343
    Width = 57
    Height = 25
    Caption = 'speichern'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton15Click
  end
  object SpeedButton10: TSpeedButton
    Left = 722
    Top = 343
    Width = 57
    Height = 25
    Caption = 'abbrechen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton10Click
  end
  object Label10: TLabel
    Left = 15
    Top = 230
    Width = 88
    Height = 13
    Caption = 'Ansprechpartner :'
  end
  object Label11: TLabel
    Left = 15
    Top = 257
    Width = 52
    Height = 13
    Caption = 'Telefon 1 :'
  end
  object Label12: TLabel
    Left = 399
    Top = 257
    Width = 70
    Height = 13
    Caption = 'Telefon Mobil :'
  end
  object Label13: TLabel
    Left = 15
    Top = 311
    Width = 47
    Height = 13
    Caption = 'Internet :'
  end
  object Label14: TLabel
    Left = 399
    Top = 311
    Width = 35
    Height = 13
    Caption = 'E-Mail :'
  end
  object Label15: TLabel
    Left = 15
    Top = 284
    Width = 43
    Height = 13
    Caption = 'Telefax :'
  end
  object Label16: TLabel
    Left = 399
    Top = 284
    Width = 36
    Height = 13
    Caption = 'Skype :'
  end
  object Label17: TLabel
    Left = 15
    Top = 16
    Width = 57
    Height = 13
    Caption = 'Kundennr. :'
  end
  object SpeedButton6: TSpeedButton
    Left = 767
    Top = 374
    Width = 23
    Height = 22
    OnClick = SpeedButton6Click
  end
  object DBEdit1: TDBEdit
    Left = 87
    Top = 40
    Width = 457
    Height = 21
    DataField = 'kundenkurzname'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 87
    Top = 67
    Width = 457
    Height = 21
    DataField = 'kunden_name_1'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 87
    Top = 94
    Width = 457
    Height = 21
    DataField = 'kunden_name_2'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 87
    Top = 121
    Width = 305
    Height = 21
    DataField = 'kunden_strasse'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 474
    Top = 121
    Width = 70
    Height = 21
    DataField = 'kunden_hausnr'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 87
    Top = 148
    Width = 70
    Height = 21
    DataField = 'kunden_plz'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 207
    Top = 148
    Width = 337
    Height = 21
    DataField = 'kunden_ort'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 6
  end
  object DBImage1: TDBImage
    Left = 553
    Top = 40
    Width = 207
    Height = 156
    DataField = 'kunden_logo'
    DataSource = TSS_BE_KundenTable_source
    Proportional = True
    Stretch = True
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 87
    Top = 175
    Width = 193
    Height = 21
    DataField = 'kunden_land'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 351
    Top = 175
    Width = 193
    Height = 21
    DataField = 'kunden_bundesland'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 9
  end
  object DBEdit10: TDBEdit
    Left = 109
    Top = 227
    Width = 651
    Height = 21
    DataField = 'kunden_ansprechpartner_name'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 10
  end
  object DBEdit11: TDBEdit
    Left = 109
    Top = 254
    Width = 267
    Height = 21
    DataField = 'kunden_telefon1'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 11
  end
  object DBEdit12: TDBEdit
    Left = 493
    Top = 254
    Width = 267
    Height = 21
    DataField = 'kunden_telefon2'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 12
  end
  object DBEdit13: TDBEdit
    Left = 109
    Top = 308
    Width = 267
    Height = 21
    DataField = 'kunden_internet'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 13
  end
  object DBEdit14: TDBEdit
    Left = 493
    Top = 308
    Width = 267
    Height = 21
    DataField = 'kunden_mail'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 14
  end
  object DBEdit15: TDBEdit
    Left = 109
    Top = 281
    Width = 267
    Height = 21
    DataField = 'kunden_fax'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 15
  end
  object DBEdit16: TDBEdit
    Left = 493
    Top = 281
    Width = 267
    Height = 21
    DataField = 'kunden_skype'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 16
  end
  object DBEdit17: TDBEdit
    Left = 87
    Top = 13
    Width = 138
    Height = 21
    DataField = 'kundennummer'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 17
  end
  object DBCheckBox1: TDBCheckBox
    Left = 251
    Top = 17
    Width = 97
    Height = 17
    Caption = 'Kunde Aktiv'
    DataField = 'aktiv'
    DataSource = TSS_BE_KundenTable_source
    TabOrder = 18
  end
  object Edit1: TEdit
    Left = 8
    Top = 374
    Width = 752
    Height = 21
    TabOrder = 19
    Text = 'Edit1'
  end
  object TSS_BE_KundenTable: TFDTable
    IndexFieldNames = 'kunden_id'
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    UpdateOptions.UpdateTableName = 'logumedia.kunden'
    TableName = 'logumedia.kunden'
    Left = 503
    Top = 344
  end
  object TSS_BE_KundenTable_source: TDataSource
    DataSet = TSS_BE_KundenTable
    Left = 439
    Top = 344
  end
end
