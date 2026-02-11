object VideoSearchForm: TVideoSearchForm
  Left = 0
  Top = 0
  Caption = 'Videodatei suchen '
  ClientHeight = 409
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 11
    Width = 60
    Height = 13
    Caption = 'Videodatei : '
  end
  object SpeedButton18: TSpeedButton
    Left = 607
    Top = 6
    Width = 30
    Height = 26
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777700007FFFFFFFFFFFFFFFFFF700008777777777777777777F00008777
      777777777777777F00008777777077777777777F00008777777007777777777F
      00008777777000777777777F00008777777000077777777F0000877777700000
      7777777F00008777777000000777777F00008777777000007777777F00008777
      777000077777777F00008777777000777777777F00008777777007777777777F
      00008777777077777777777F00008777777777777777777F0000877777777777
      7777777F00007888888888888888888700007777777777777777777700007777
      77777777777777770000}
    OnClick = SpeedButton18Click
  end
  object SpeedButton10: TSpeedButton
    Left = 607
    Top = 376
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
  object SpeedButton1: TSpeedButton
    Left = 520
    Top = 376
    Width = 81
    Height = 25
    Caption = #252'bernehmen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 96
    Top = 8
    Width = 505
    Height = 21
    KeyField = 'media_id'
    ListField = 'media_file'
    ListSource = DataSource5
    TabOrder = 0
  end
  object WindowsMediaPlayer1: TWindowsMediaPlayer
    Left = 8
    Top = 38
    Width = 655
    Height = 323
    TabOrder = 1
    ControlData = {
      0003000008000200000000000500000000000000F03F03000000000005000000
      00000000000008000200000000000300010000000B00FFFF0300000000000B00
      FFFF08000200000000000300320000000B00000008000A0000006D0069006E00
      690000000B0000000B0000000B00FFFF0B0000000B0000000800020000000000
      0800020000000000080002000000000008000200000000000B000000B2430000
      62210000}
  end
  object TSS_BE_VideoMedien: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      
        'select m.* from logumedia.media m where media_typ=201 and schema' +
        'tic_id=:schematicid')
    Left = 614
    Top = 40
    ParamData = <
      item
        Name = 'SCHEMATICID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource5: TDataSource
    DataSet = TSS_BE_VideoMedien
    Left = 710
    Top = 40
  end
end
