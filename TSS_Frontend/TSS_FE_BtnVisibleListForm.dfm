object BtnVisibleList: TBtnVisibleList
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ButtonListe & Visible Buttons'
  ClientHeight = 734
  ClientWidth = 434
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 307
    Top = 694
    Width = 118
    Height = 25
    Caption = 'Anz. und Speichern'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 183
    Top = 694
    Width = 118
    Height = 25
    Caption = 'Abbrechen'
    TabOrder = 1
    OnClick = Button2Click
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 8
    Width = 417
    Height = 665
    ItemHeight = 13
    TabOrder = 2
  end
end
