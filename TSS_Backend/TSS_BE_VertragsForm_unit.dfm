object TSS_BE_VertragsForm: TTSS_BE_VertragsForm
  Left = 0
  Top = 0
  Caption = 'Vertragsdaten und Zeiten'
  ClientHeight = 547
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 8
    Top = 42
    Width = 781
    Height = 287
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 781
    Height = 32
  end
  object Label17: TLabel
    Left = 22
    Top = 19
    Width = 78
    Height = 13
    Caption = 'Vertragsdatum :'
  end
  object Label1: TLabel
    Left = 23
    Top = 53
    Width = 106
    Height = 13
    Caption = '1. Kontakt (mail/tel.) :'
  end
  object Label2: TLabel
    Left = 22
    Top = 81
    Width = 60
    Height = 13
    Caption = '1. Zuarbeit :'
  end
  object Label3: TLabel
    Left = 46
    Top = 108
    Width = 114
    Height = 13
    Caption = '1. Vorschlag an Kunde :'
  end
  object Label4: TLabel
    Left = 78
    Top = 163
    Width = 105
    Height = 13
    Caption = #196'nderung  an Kunde :'
  end
  object Label5: TLabel
    Left = 46
    Top = 220
    Width = 79
    Height = 13
    Caption = 'Freigabedatum :'
  end
  object Label6: TLabel
    Left = 408
    Top = 159
    Width = 111
    Height = 13
    Caption = #196'nderung 2 an Kunde :'
  end
  object Label7: TLabel
    Left = 46
    Top = 242
    Width = 125
    Height = 13
    Caption = 'Bemerkung zum Vorgang :'
  end
  object Bevel3: TBevel
    Left = 8
    Top = 335
    Width = 781
    Height = 178
  end
  object Label8: TLabel
    Left = 23
    Top = 349
    Width = 96
    Height = 13
    Caption = 'Rechnungnummer : '
  end
  object Label9: TLabel
    Left = 23
    Top = 381
    Width = 90
    Height = 13
    Caption = 'Rechnungsdatum :'
  end
  object Label10: TLabel
    Left = 399
    Top = 349
    Width = 114
    Height = 13
    Caption = 'Teilrechnungsnummer : '
  end
  object Label11: TLabel
    Left = 399
    Top = 381
    Width = 90
    Height = 13
    Caption = 'Rechnungsdatum :'
  end
  object Label12: TLabel
    Left = 23
    Top = 408
    Width = 101
    Height = 13
    Caption = 'Mahnungsadatum 1 :'
  end
  object Label13: TLabel
    Left = 23
    Top = 435
    Width = 101
    Height = 13
    Caption = 'Mahnungsadatum 2 :'
  end
  object Label14: TLabel
    Left = 23
    Top = 462
    Width = 101
    Height = 13
    Caption = 'Mahnungsadatum 3 :'
  end
  object Label15: TLabel
    Left = 23
    Top = 489
    Width = 74
    Height = 13
    Caption = 'Inkassodatum :'
  end
  object Label16: TLabel
    Left = 399
    Top = 408
    Width = 101
    Height = 13
    Caption = 'Mahnungsadatum 1 :'
  end
  object Label18: TLabel
    Left = 399
    Top = 435
    Width = 101
    Height = 13
    Caption = 'Mahnungsadatum 2 :'
  end
  object Label19: TLabel
    Left = 399
    Top = 462
    Width = 101
    Height = 13
    Caption = 'Mahnungsadatum 3 :'
  end
  object Label20: TLabel
    Left = 399
    Top = 489
    Width = 74
    Height = 13
    Caption = 'Inkassodatum :'
  end
  object SpeedButton10: TSpeedButton
    Left = 731
    Top = 519
    Width = 57
    Height = 25
    Caption = 'abbrechen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 648
    Top = 519
    Width = 77
    Height = 25
    Caption = 'uebernehmen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBDateTimePicker1: TDBDateTimePicker
    Left = 152
    Top = 15
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 0
  end
  object DBDateTimePicker2: TDBDateTimePicker
    Left = 152
    Top = 50
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 1
  end
  object DBDateTimePicker3: TDBDateTimePicker
    Left = 152
    Top = 77
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 2
  end
  object DBDateTimePicker4: TDBDateTimePicker
    Left = 176
    Top = 104
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 3
  end
  object DBDateTimePicker5: TDBDateTimePicker
    Left = 204
    Top = 159
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 4
  end
  object DBCheckBox1: TDBCheckBox
    Left = 78
    Top = 136
    Width = 139
    Height = 17
    Alignment = taLeftJustify
    Caption = #196'nderungsw'#252'nsche ?'
    TabOrder = 5
  end
  object DBCheckBox2: TDBCheckBox
    Left = 49
    Top = 189
    Width = 139
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Freigabe erteilt ?'
    TabOrder = 6
  end
  object DBDateTimePicker6: TDBDateTimePicker
    Left = 176
    Top = 212
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 7
  end
  object DBCheckBox3: TDBCheckBox
    Left = 408
    Top = 132
    Width = 153
    Height = 17
    Alignment = taLeftJustify
    Caption = 'weiterer '#196'nderungswunsch'
    TabOrder = 8
  end
  object DBDateTimePicker7: TDBDateTimePicker
    Left = 548
    Top = 155
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 9
  end
  object DBMemo1: TDBMemo
    Left = 177
    Top = 239
    Width = 568
    Height = 74
    TabOrder = 10
  end
  object DBEdit1: TDBEdit
    Left = 152
    Top = 346
    Width = 169
    Height = 21
    TabOrder = 11
  end
  object DBDateTimePicker8: TDBDateTimePicker
    Left = 152
    Top = 376
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 12
  end
  object DBEdit2: TDBEdit
    Left = 528
    Top = 346
    Width = 169
    Height = 21
    TabOrder = 13
  end
  object DBDateTimePicker9: TDBDateTimePicker
    Left = 528
    Top = 376
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 14
  end
  object DBDateTimePicker10: TDBDateTimePicker
    Left = 152
    Top = 403
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 15
  end
  object DBDateTimePicker11: TDBDateTimePicker
    Left = 152
    Top = 430
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 16
  end
  object DBDateTimePicker12: TDBDateTimePicker
    Left = 152
    Top = 457
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 17
  end
  object DBDateTimePicker13: TDBDateTimePicker
    Left = 152
    Top = 484
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 18
  end
  object DBDateTimePicker14: TDBDateTimePicker
    Left = 528
    Top = 403
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 19
  end
  object DBDateTimePicker15: TDBDateTimePicker
    Left = 528
    Top = 430
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 20
  end
  object DBDateTimePicker16: TDBDateTimePicker
    Left = 528
    Top = 457
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 21
  end
  object DBDateTimePicker17: TDBDateTimePicker
    Left = 528
    Top = 484
    Width = 186
    Height = 21
    Date = 44036.000000000000000000
    Time = 0.932246388889325300
    TabOrder = 22
  end
end
