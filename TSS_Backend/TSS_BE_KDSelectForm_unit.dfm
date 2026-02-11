object TSS_BE_KDSelectform: TTSS_BE_KDSelectform
  Left = 0
  Top = 0
  Caption = 'Kunden Auswahl'
  ClientHeight = 217
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 84
    Height = 13
    Caption = 'Kundennummer : '
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 129
    Height = 21
    TabOrder = 0
    OnKeyUp = Edit1KeyUp
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 54
    Width = 579
    Height = 120
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'kundennummer'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kundenkurzname'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kunden_name_1'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kunden_name_2'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kunden_ort'
        Width = 100
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 510
    Top = 184
    Width = 75
    Height = 25
    Caption = #220'bernehmen'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 429
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Abbrechen'
    TabOrder = 3
    OnClick = Button2Click
  end
  object TSS_BE_GALQuery: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select * from Kunden')
    Left = 384
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = TSS_BE_GALQuery
    Left = 384
    Top = 72
  end
end
