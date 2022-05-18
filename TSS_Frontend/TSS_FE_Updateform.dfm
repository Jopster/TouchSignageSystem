object UpdateForm: TUpdateForm
  Left = 0
  Top = 0
  Caption = 'Update wird durchgef'#252'hrt  !'
  ClientHeight = 219
  ClientWidth = 338
  Color = clBtnText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 88
    Width = 203
    Height = 13
    Caption = 'Schematik Datei vorhanden und Korrekt ??'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dsLed1: TdsLed
    Left = 280
    Top = 88
    Width = 17
    Height = 13
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clLime
    OffColor = clRed
    LedOn = False
    Style = lsStandard
  end
  object Label2: TLabel
    Left = 40
    Top = 107
    Width = 176
    Height = 13
    Caption = 'Neues Speicherverzeichniss erstellt ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dsLed2: TdsLed
    Left = 280
    Top = 107
    Width = 17
    Height = 13
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clLime
    OffColor = clRed
    LedOn = False
    Style = lsStandard
  end
  object Label3: TLabel
    Left = 40
    Top = 126
    Width = 150
    Height = 13
    Caption = 'Dateien vom Stick '#252'bertragen ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dsLed3: TdsLed
    Left = 280
    Top = 126
    Width = 17
    Height = 13
    Bevel = blNone
    Shape = ltEllipse
    OnColor = clLime
    OffColor = clRed
    LedOn = False
    Style = lsStandard
  end
  object Animate1: TAnimate
    Left = 40
    Top = 8
    Width = 272
    Height = 60
    CommonAVI = aviCopyFiles
    StopFrame = 34
  end
  object Panel1: TPanel
    Left = 40
    Top = 160
    Width = 272
    Height = 41
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel1'
    TabOrder = 1
    object ErrLAbel: TLabel
      Left = 8
      Top = 8
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 16
    Top = 72
  end
end
