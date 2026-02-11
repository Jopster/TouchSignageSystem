object TSS_BE_DataForm: TTSS_BE_DataForm
  Left = 0
  Top = 0
  Caption = 'TSS_BE_DataForm'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 384
    Top = 184
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 0
  end
  object TSS_FE_Connection: TFDConnection
    Params.Strings = (
      'Server=logumedia-content.de'
      'User_Name=LoguUser'
      'Password=LM2020#DataBase'
      'Database=logumedia'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 152
    Top = 8
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\TSS\Frontend\libmariadb.dll'
    Left = 24
    Top = 8
  end
  object TSS_BE_DisplayList: TFDTable
    IndexFieldNames = 'Display_ID'
    Connection = TSS_FE_Connection
    UpdateOptions.UpdateTableName = 'logumedia.displays'
    TableName = 'logumedia.displays'
    Left = 128
    Top = 72
  end
  object TSS_FE_DisplayConfig: TFDQuery
    Connection = TSS_FE_Connection
    SQL.Strings = (
      
        'select g.*,d.* from logumedia.geraete g inner join logumedia.ger' +
        'aet_display gd on gd.geraete_id=g.geraete_id inner join logumedi' +
        'a.displays d on d.display_id = gd.display_id where g.geraete_uid' +
        '=:uuid')
    Left = 256
    Top = 72
    ParamData = <
      item
        Position = 1
        Name = 'UUID'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object TSS_BE_AlgQuery: TFDQuery
    Connection = TSS_FE_Connection
    SQL.Strings = (
      
        'select g.*,d.* from logumedia.geraete g inner join logumedia.ger' +
        'aet_display gd on gd.geraete_id=g.geraete_id inner join logumedi' +
        'a.displays d on d.display_id = gd.display_id where g.geraete_uid' +
        '=:uuid')
    Left = 128
    Top = 144
    ParamData = <
      item
        Position = 1
        Name = 'UUID'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
end
