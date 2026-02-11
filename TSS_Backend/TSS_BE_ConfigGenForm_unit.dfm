object TSS_BE_ConfigGenForm: TTSS_BE_ConfigGenForm
  Left = 0
  Top = 0
  Caption = 'Konfiguration erzeugen '
  ClientHeight = 648
  ClientWidth = 1166
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 129
    Height = 13
    Caption = 'Configuration f'#252'r Display : '
  end
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 109
    Height = 13
    Caption = 'Grundpfad der Daten :'
  end
  object Label3: TLabel
    Left = 8
    Top = 121
    Width = 113
    Height = 13
    Caption = 'Buttons generell Aktiv ?'
  end
  object Label4: TLabel
    Left = 8
    Top = 153
    Width = 137
    Height = 13
    Caption = 'Ger'#228't ist ein Online System ?'
  end
  object Label5: TLabel
    Left = 533
    Top = 232
    Width = 100
    Height = 13
    Caption = 'Aktuelle  UpdateID : '
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 0
    Width = 145
    Height = 34
    Caption = 'Konfiguration einlesen '
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 159
    Top = -1
    Width = 145
    Height = 34
    Caption = 'Konfiguration abspeichern'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 310
    Top = -1
    Width = 145
    Height = 34
    Caption = 'Konfiguration anzeigen'
  end
  object Label6: TLabel
    Left = 8
    Top = 382
    Width = 126
    Height = 13
    Caption = 'Sonderinhalt vorhanden  ?'
  end
  object SpeedButton4: TSpeedButton
    Left = 492
    Top = 53
    Width = 23
    Height = 23
    Glyph.Data = {
      F6000000424DF60000000000000076000000280000000B000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
      0000FFFFFFFFFFF00000FFFFFFF4FFF00000FFFFFF44FFF00000FFFFF424FFF0
      0000FFFF4224FFF00000FFF42224FFF00000FF422224FFF00000FFF42224FFF0
      0000FFFF4224FFF00000FFFFF424FFF00000FFFFFF44FFF00000FFFFFFF4FFF0
      0000FFFFFFFFFFF00000FFFFFFFFFFF00000FFFFFFFFFFF00000}
    OnClick = SpeedButton4Click
  end
  object Label7: TLabel
    Left = 8
    Top = 219
    Width = 91
    Height = 13
    Caption = 'Backoffice Server :'
  end
  object Label8: TLabel
    Left = 8
    Top = 316
    Width = 100
    Height = 13
    Caption = 'Desktop Boot - Bild  :'
  end
  object Label9: TLabel
    Left = 8
    Top = 349
    Width = 74
    Height = 13
    Caption = 'Partner Grafik :'
  end
  object DBText1: TDBText
    Left = 533
    Top = 82
    Width = 308
    Height = 17
    DataField = 'schematic_id'
    DataSource = TSS_BE_Displays_Source
  end
  object DBText2: TDBText
    Left = 533
    Top = 251
    Width = 308
    Height = 17
    DataField = 'UpdateID'
    DataSource = TSS_BE_Displays_Source
  end
  object Label10: TLabel
    Left = 8
    Top = 251
    Width = 107
    Height = 13
    Caption = 'CFG - UpdateVersion :'
  end
  object SpeedButton5: TSpeedButton
    Left = 492
    Top = 248
    Width = 23
    Height = 23
    Glyph.Data = {
      F6000000424DF60000000000000076000000280000000B000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
      0000FFFFFFFFFFF00000FFFFFFF4FFF00000FFFFFF44FFF00000FFFFF424FFF0
      0000FFFF4224FFF00000FFF42224FFF00000FF422224FFF00000FFF42224FFF0
      0000FFFF4224FFF00000FFFFF424FFF00000FFFFFF44FFF00000FFFFFFF4FFF0
      0000FFFFFFFFFFF00000FFFFFFFFFFF00000FFFFFFFFFFF00000}
    OnClick = SpeedButton5Click
  end
  object Label11: TLabel
    Left = 8
    Top = 186
    Width = 46
    Height = 13
    Caption = 'Loglevel :'
  end
  object Label12: TLabel
    Left = 8
    Top = 286
    Width = 66
    Height = 13
    Caption = 'Blackout Bild :'
  end
  object Label13: TLabel
    Left = 176
    Top = 445
    Width = 42
    Height = 13
    Caption = 'Gallerie :'
  end
  object Label14: TLabel
    Left = 176
    Top = 412
    Width = 120
    Height = 13
    Caption = 'Sonderinhalt ist Gallerie ?'
  end
  object Label15: TLabel
    Left = 176
    Top = 478
    Width = 132
    Height = 13
    Caption = 'Sonderinhalt ist Interaktiv ?'
  end
  object SpeedButton6: TSpeedButton
    Left = 636
    Top = 443
    Width = 23
    Height = 23
    Glyph.Data = {
      F6000000424DF60000000000000076000000280000000B000000100000000100
      04000000000080000000C40E0000C40E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFF0
      0000FFFFFFFFFFF00000FFFFFFF4FFF00000FFFFFF44FFF00000FFFFF424FFF0
      0000FFFF4224FFF00000FFF42224FFF00000FF422224FFF00000FFF42224FFF0
      0000FFFF4224FFF00000FFFFF424FFF00000FFFFFF44FFF00000FFFFFFF4FFF0
      0000FFFFFFFFFFF00000FFFFFFFFFFF00000FFFFFFFFFFF00000}
    OnClick = SpeedButton6Click
  end
  object DBText3: TDBText
    Left = 678
    Top = 472
    Width = 308
    Height = 17
    DataField = 'UID'
    DataSource = DataSource2
  end
  object Edit1: TEdit
    Left = 176
    Top = 55
    Width = 289
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 176
    Top = 87
    Width = 289
    Height = 21
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 176
    Top = 120
    Width = 97
    Height = 17
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 176
    Top = 152
    Width = 97
    Height = 17
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 176
    Top = 250
    Width = 289
    Height = 21
    TabOrder = 4
  end
  object CheckBox3: TCheckBox
    Left = 176
    Top = 380
    Width = 97
    Height = 17
    TabOrder = 5
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 533
    Top = 55
    Width = 308
    Height = 21
    Color = clWhite
    DataField = 'schematic_id'
    KeyField = 'schematic_id'
    ListField = 'displayname'
    ListSource = TSS_BE_Displays_Source
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 176
    Top = 217
    Width = 289
    Height = 21
    TabOrder = 7
  end
  object Edit5: TEdit
    Left = 176
    Top = 315
    Width = 289
    Height = 21
    TabOrder = 8
  end
  object Edit6: TEdit
    Left = 176
    Top = 347
    Width = 289
    Height = 21
    TabOrder = 9
  end
  object Edit7: TEdit
    Left = 176
    Top = 185
    Width = 289
    Height = 21
    TabOrder = 10
  end
  object Edit8: TEdit
    Left = 176
    Top = 282
    Width = 289
    Height = 21
    TabOrder = 11
  end
  object DBLookupComboBox5: TDBLookupComboBox
    Left = 678
    Top = 445
    Width = 251
    Height = 21
    Color = clWhite
    KeyField = 'UID'
    ListField = 'Name'
    ListSource = DataSource2
    TabOrder = 12
  end
  object CheckBox4: TCheckBox
    Left = 358
    Top = 413
    Width = 97
    Height = 17
    TabOrder = 13
  end
  object CheckBox5: TCheckBox
    Left = 358
    Top = 477
    Width = 97
    Height = 17
    TabOrder = 14
  end
  object Edit9: TEdit
    Left = 358
    Top = 445
    Width = 251
    Height = 21
    TabOrder = 15
  end
  object TSS_BE_Displays: TFDTable
    IndexFieldNames = 'display_id'
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    UpdateOptions.UpdateTableName = 'logumedia.displays'
    TableName = 'logumedia.displays'
    Left = 1112
  end
  object TSS_BE_Displays_Source: TDataSource
    DataSet = TSS_BE_Displays
    Left = 1112
    Top = 56
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Config File'
        FileMask = '*.ini'
      end
      item
        DisplayName = 'Alle Dateien'
        FileMask = '*.*'
      end>
    Options = []
    Left = 960
    Top = 56
  end
  object FileSaveDialog1: TFileSaveDialog
    DefaultExtension = '*.ini'
    DefaultFolder = 'C:\TSS'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Configurations Datei'
        FileMask = '*.ini'
      end
      item
        DisplayName = 'Alle Dateien'
        FileMask = '*.*'
      end>
    OkButtonLabel = 'Abspeichern'
    Options = []
    Left = 960
    Top = 112
  end
  object TSS_BE_MediaList: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select * from logumedia.media')
    Left = 1112
    Top = 120
  end
  object TSS_BE_MediaList_Source: TDataSource
    DataSet = TSS_BE_MediaList
    Left = 1112
    Top = 176
  end
  object DataSource2: TDataSource
    DataSet = TSS_BE_GALQuery
    Left = 1112
    Top = 288
  end
  object TSS_BE_GALQuery: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select g.* from logumedia.Gallery g where kundenid=0')
    Left = 1112
    Top = 232
  end
end
