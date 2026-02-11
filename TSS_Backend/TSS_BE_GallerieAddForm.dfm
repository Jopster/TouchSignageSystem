object GallerieAddForm: TGallerieAddForm
  Left = 0
  Top = 0
  Caption = 'Gallerie hinzuf'#252'gen'
  ClientHeight = 174
  ClientWidth = 387
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
    Top = 32
    Width = 278
    Height = 13
    Caption = 'Name der Gallerie : ( z.b. Produkte .. Ferien ... Werke ...)'
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 126
    Height = 13
    Caption = 'Kunden f'#252'r diese Gallerie :'
  end
  object SpeedButton2: TSpeedButton
    Left = 350
    Top = 92
    Width = 23
    Height = 23
    Glyph.Data = {
      D6000000424DD60000000000000076000000280000000C0000000C0000000100
      0400000000006000000000000000000000001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0000307888888880000030F777777780000030F777077780000030F777077780
      000030F700000780000030F777077780000030F777077780000030F777777780
      000030FFFFFFFF70000030000000000000003333333333330000}
  end
  object SpeedButton4: TSpeedButton
    Left = 211
    Top = 144
    Width = 81
    Height = 22
    Caption = 'Speichern'
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 298
    Top = 144
    Width = 81
    Height = 22
    Caption = 'Abbrechen'
    OnClick = SpeedButton5Click
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 8
    Width = 113
    Height = 17
    Caption = 'Allgemeine Gallerie'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 176
    Top = 8
    Width = 113
    Height = 17
    Caption = 'Kundengallerie'
    TabOrder = 1
    OnClick = RadioButton2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 48
    Width = 361
    Height = 21
    TabOrder = 2
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 8
    Top = 94
    Width = 345
    Height = 21
    Color = clWhite
    KeyField = 'kunden_id'
    ListField = 'kundenkurzname'
    ListSource = TSS_BE_Kunden_Source
    TabOrder = 3
  end
  object TSS_BE_Kunden: TFDTable
    Active = True
    IndexFieldNames = 'kunden_id'
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    UpdateOptions.UpdateTableName = 'kunden'
    TableName = 'kunden'
    Left = 312
    Top = 8
  end
  object TSS_BE_Kunden_Source: TDataSource
    DataSet = TSS_BE_Kunden
    Left = 272
    Top = 56
  end
end
