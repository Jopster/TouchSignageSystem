object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Watchdog - Hauptform'
  ClientHeight = 560
  ClientWidth = 830
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
  object SpeedButton1: TSpeedButton
    Left = 307
    Top = 48
    Width = 50
    Height = 22
    Caption = 'manuell'
  end
  object dsLed1: TdsLed
    Left = 24
    Top = 48
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clLime
    OffColor = clRed
    LedOn = False
    Style = lsStandard
  end
  object Label1: TLabel
    Left = 56
    Top = 52
    Width = 229
    Height = 13
    Caption = 'Lebensignal - Gr'#252'n gesendet -> Rot empfangen'
  end
  object Label2: TLabel
    Left = 56
    Top = 73
    Width = 184
    Height = 13
    Caption = 'Lebensignal -TSS_FE 30 sek. '#252'berf'#228'llig'
  end
  object dsLed2: TdsLed
    Left = 33
    Top = 71
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clOlive
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Label3: TLabel
    Left = 56
    Top = 92
    Width = 184
    Height = 13
    Caption = 'Lebensignal -TSS_FE 60 sek. '#252'berf'#228'llig'
  end
  object dsLed3: TdsLed
    Left = 33
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clYellow
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Label4: TLabel
    Left = 56
    Top = 111
    Width = 184
    Height = 13
    Caption = 'Lebensignal -TSS_FE 90 sek. '#252'berf'#228'llig'
  end
  object dsLed4: TdsLed
    Left = 33
    Top = 109
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed5: TdsLed
    Left = 49
    Top = 128
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clYellow
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Label5: TLabel
    Left = 72
    Top = 130
    Width = 139
    Height = 13
    Caption = 'Programm Neustart - TSS_FE'
  end
  object Image1: TImage
    Left = 614
    Top = 432
    Width = 192
    Height = 108
    Stretch = True
  end
  object Label6: TLabel
    Left = 24
    Top = 29
    Width = 18
    Height = 13
    Caption = 'ID :'
  end
  object Label7: TLabel
    Left = 592
    Top = 432
    Width = 16
    Height = 13
    Caption = 'File'
  end
  object SpeedButton2: TSpeedButton
    Left = 359
    Top = 176
    Width = 50
    Height = 22
    Caption = 'manuell'
    OnClick = SpeedButton2Click
  end
  object dsLed6: TdsLed
    Left = 33
    Top = 520
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clYellow
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Label8: TLabel
    Left = 56
    Top = 524
    Width = 126
    Height = 13
    Caption = 'Remote Watch verbunden'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 408
    Width = 401
    Height = 144
    Style = bsRaised
  end
  object Label9: TLabel
    Left = 127
    Top = 408
    Width = 126
    Height = 13
    Caption = 'Remote Watch verbunden'
  end
  object Bevel3: TBevel
    Left = 415
    Top = 408
    Width = 407
    Height = 144
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 8
    Top = 427
    Width = 401
    Height = 125
  end
  object Bevel4: TBevel
    Left = 415
    Top = 427
    Width = 407
    Height = 125
  end
  object Label10: TLabel
    Left = 559
    Top = 408
    Width = 54
    Height = 13
    Caption = 'Screenshot'
  end
  object Bevel5: TBevel
    Left = 14
    Top = 8
    Width = 401
    Height = 162
    Style = bsRaised
  end
  object Bevel6: TBevel
    Left = 14
    Top = 29
    Width = 401
    Height = 141
  end
  object Label11: TLabel
    Left = 114
    Top = 10
    Width = 140
    Height = 13
    Caption = 'LiveTicker  '#252'ber MessageQue'
  end
  object Bevel8: TBevel
    Left = 421
    Top = 8
    Width = 401
    Height = 161
    Style = bsRaised
  end
  object Bevel7: TBevel
    Left = 421
    Top = 29
    Width = 401
    Height = 140
  end
  object dsLed7: TdsLed
    Left = 432
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed8: TdsLed
    Left = 455
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed9: TdsLed
    Left = 478
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed10: TdsLed
    Left = 501
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed11: TdsLed
    Left = 524
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed12: TdsLed
    Left = 547
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Label12: TLabel
    Left = 559
    Top = 10
    Width = 76
    Height = 13
    Caption = 'Farberkennung '
  end
  object dsLed13: TdsLed
    Left = 570
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed14: TdsLed
    Left = 593
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed15: TdsLed
    Left = 616
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed16: TdsLed
    Left = 639
    Top = 40
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed17: TdsLed
    Left = 651
    Top = 63
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Label13: TLabel
    Left = 674
    Top = 64
    Width = 93
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'Programm Neustart'
    ParentBiDiMode = False
  end
  object SpeedButton3: TSpeedButton
    Left = 756
    Top = 36
    Width = 50
    Height = 22
    Caption = 'manuell'
    OnClick = SpeedButton3Click
  end
  object dsLed18: TdsLed
    Left = 432
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed19: TdsLed
    Left = 455
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed20: TdsLed
    Left = 478
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed21: TdsLed
    Left = 501
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed22: TdsLed
    Left = 524
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed23: TdsLed
    Left = 547
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed24: TdsLed
    Left = 570
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed25: TdsLed
    Left = 593
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed26: TdsLed
    Left = 616
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed27: TdsLed
    Left = 639
    Top = 90
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object dsLed28: TdsLed
    Left = 651
    Top = 113
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Label14: TLabel
    Left = 674
    Top = 118
    Width = 93
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'Programm Neustart'
    ParentBiDiMode = False
  end
  object Label15: TLabel
    Left = 674
    Top = 29
    Width = 40
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'Schwarz'
    ParentBiDiMode = False
  end
  object Label16: TLabel
    Left = 674
    Top = 83
    Width = 108
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'Olive (Main) oder Teal '
    ParentBiDiMode = False
  end
  object dsLed29: TdsLed
    Left = 421
    Top = 8
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Bevel9: TBevel
    Left = 8
    Top = 204
    Width = 401
    Height = 161
    Style = bsRaised
  end
  object Bevel10: TBevel
    Left = 8
    Top = 225
    Width = 401
    Height = 140
  end
  object Label17: TLabel
    Left = 135
    Top = 206
    Width = 84
    Height = 13
    Caption = 'Mustererkennung'
  end
  object dsLed30: TdsLed
    Left = 8
    Top = 206
    Width = 17
    Height = 17
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object DigiPoint_1: TdsLed
    Left = 25
    Top = 240
    Width = 10
    Height = 10
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object DigiPoint_2: TdsLed
    Left = 25
    Top = 255
    Width = 10
    Height = 10
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object DigiPoint_3: TdsLed
    Left = 25
    Top = 271
    Width = 10
    Height = 10
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object DigiPoint_4: TdsLed
    Left = 25
    Top = 286
    Width = 10
    Height = 10
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object DigiPoint_5: TdsLed
    Left = 25
    Top = 302
    Width = 10
    Height = 10
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object DigiPoint_6: TdsLed
    Left = 24
    Top = 317
    Width = 10
    Height = 10
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object DigiPoint_7: TdsLed
    Left = 24
    Top = 333
    Width = 10
    Height = 10
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object DigiPoint_8: TdsLed
    Left = 24
    Top = 348
    Width = 10
    Height = 10
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clRed
    OffColor = clBlack
    LedOn = False
    Style = lsStandard
  end
  object Label18: TLabel
    Left = 49
    Top = 256
    Width = 68
    Height = 71
    Caption = 'XX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -59
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object CheckBox1: TCheckBox
    Left = 484
    Top = 523
    Width = 97
    Height = 17
    Caption = 'Screenshot 10s'
    Checked = True
    State = cbChecked
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object Edit1: TEdit
    Left = 484
    Top = 496
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '1000'
  end
  object Edit2: TEdit
    Left = 432
    Top = 63
    Width = 49
    Height = 21
    TabOrder = 2
    Text = '1000'
  end
  object Edit3: TEdit
    Left = 515
    Top = 63
    Width = 49
    Height = 21
    TabOrder = 3
    Text = '500'
  end
  object Panel1: TPanel
    Left = 674
    Top = 48
    Width = 71
    Height = 19
    ParentBackground = False
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 674
    Top = 100
    Width = 71
    Height = 19
    ParentBackground = False
    TabOrder = 5
  end
  object Edit4: TEdit
    Left = 432
    Top = 113
    Width = 49
    Height = 21
    TabOrder = 6
    Text = '209'
  end
  object Edit5: TEdit
    Left = 515
    Top = 113
    Width = 49
    Height = 21
    TabOrder = 7
    Text = '1072'
  end
  object Edit6: TEdit
    Left = 515
    Top = 133
    Width = 49
    Height = 19
    TabOrder = 8
    Text = '5'
  end
  object TextTrayIcon1: TTextTrayIcon
    CycleInterval = 0
    Icon.Data = {
      0000010001001010200000000000680400001600000028000000100000002000
      000001002000000000000004000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0090DB
      FF00903A3A00FFFFDB00FFFFFF00DBFFFF00003A900000000000000000003A00
      0000FFDB9000DBFFFF00003A900000000000000000003A000000FFDB900090DB
      FF00903A3A00FFFFDB00FFFFFF0090DBFF00B6663A00FFFFFF00FFFFFF0090DB
      FF00903A3A0090DBDB00B6663A00FFFFFF00FFFFFF0090DBFF00903A3A0090DB
      FF00903A3A00FFFFDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6FF
      FF0066006600FFFFB600FFFFFF00FFFFFF00FFFFFF00B6FFFF006600660090DB
      FF00903A3A00FFFFDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF0066B6FF000000
      0000B6660000FFFFFF00FFFFFF00FFFFFF0066B6FF0000000000B666000090DB
      FF00903A3A00FFFFDB00FFFFFF00FFFFFF000066B60000000000B6660000FFFF
      FF00FFFFFF00FFFFFF000066B60000000000B6660000FFFFFF00FFFFFF0090DB
      FF00903A3A00FFFFDB00FFFFFF00B6FFFF0066006600FFFFB600FFFFFF00FFFF
      FF00FFFFFF00B6FFFF0066006600FFFFB600FFFFFF00FFFFFF00FFFFFF0090DB
      FF00903A3A00FFFFDB00FFFFFF00B6FFFF003A006600FFDB9000FFFFFF00B6FF
      FF00B6666600B6FFFF003A006600FFDB9000FFFFFF00B6FFFF00B66666000000
      0000000000000000000000000000DB903A0090DBFF0000003A00000000000000
      0000DB903A00FFFFFF0090DBFF0000003A000000000000000000DB903A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
    IconIndex = 0
    MinimizeToTray = True
    Text = 'TSS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clWhite
    Border = False
    Options.OffsetX = 0
    Options.OffsetY = 0
    Options.LineDistance = 0
    Left = 128
    Top = 24
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 296
    Top = 128
  end
  object OvertimeAllert: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = OvertimeAllertTimer
    Left = 208
    Top = 152
  end
  object RestartTimer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = RestartTimerTimer
    Left = 296
    Top = 80
  end
  object screenshottimer: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = screenshottimerTimer
    Left = 541
    Top = 440
  end
  object starttimer: TTimer
    Enabled = False
    OnTimer = starttimerTimer
    Left = 296
    Top = 32
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    Host = 'localhost'
    IPVersion = Id_IPv4
    Port = 9800
    ReadTimeout = -1
    Left = 64
    Top = 472
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 784
    Top = 40
  end
  object Timer3: TTimer
    Enabled = False
    OnTimer = Timer3Timer
    Left = 784
    Top = 88
  end
  object ColorTimer: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = ColorTimerTimer
    Left = 592
    Top = 80
  end
  object Timer4: TTimer
    Enabled = False
    OnTimer = Timer4Timer
    Left = 416
    Top = 208
  end
end
