object KDSearchForm: TKDSearchForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Kundensuche'
  ClientHeight = 198
  ClientWidth = 142
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
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 8
    Width = 127
    Height = 41
    Caption = 'Nach Kundennummer'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 55
    Width = 127
    Height = 41
    Caption = 'Nach Namens-Teil'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 8
    Top = 102
    Width = 127
    Height = 41
    Caption = 'Nach Ort/Strasse'
    OnClick = SpeedButton3Click
  end
  object SpeedButton10: TSpeedButton
    Left = 78
    Top = 158
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
end
