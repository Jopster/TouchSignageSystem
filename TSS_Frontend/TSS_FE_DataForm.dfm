object DataForm: TDataForm
  Left = 0
  Top = 0
  Caption = 'DataForm'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\TSS\Frontend\libmariadb.dll'
    Left = 24
    Top = 8
  end
  object TSS_FE_Connection: TFDConnection
    Params.Strings = (
      'Server=logumedia-content.de'
      'User_Name=LoguUser'
      'Password=LM2020#DataBase'
      'Database=logumedia'
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    OnError = TSS_FE_ConnectionError
    AfterConnect = TSS_FE_ConnectionAfterConnect
    Left = 152
    Top = 8
  end
  object TSS_FE_DisplayList: TFDTable
    IndexFieldNames = 'Display_ID'
    Connection = TSS_FE_Connection
    UpdateOptions.UpdateTableName = 'logumedia.displays'
    TableName = 'logumedia.displays'
    Left = 264
    Top = 64
  end
  object FDTransaction1: TFDTransaction
    Connection = TSS_FE_Connection
    Left = 264
    Top = 8
  end
  object TSS_FE_DisplayConfig: TFDQuery
    Connection = TSS_FE_Connection
    SQL.Strings = (
      
        'select g.*,d.* from logumedia.geraete g inner join logumedia.ger' +
        'aet_display gd on gd.geraete_id=g.geraete_id inner join logumedi' +
        'a.displays d on d.display_id = gd.display_id where g.geraete_uid' +
        '=:uuid')
    Left = 368
    Top = 64
    ParamData = <
      item
        Position = 1
        Name = 'UUID'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object TSS_FE_SchematicData: TFDQuery
    Connection = TSS_FE_Connection
    SQL.Strings = (
      
        'select s.*,f.*,k.* from logumedia.schematic s inner join logumed' +
        'ia.felder f on f.feld_id=s.feld_id inner join logumedia.kunden k' +
        ' on k.kunden_id=f.kunden_id where s.schematic_id=:sid')
    Left = 368
    Top = 120
    ParamData = <
      item
        Name = 'SID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object TSS_FE_MediaData: TFDQuery
    Connection = TSS_FE_Connection
    SQL.Strings = (
      'select m.* from logumedia.media m where m.media_id=:mid')
    Left = 368
    Top = 176
    ParamData = <
      item
        Name = 'MID'
        ParamType = ptInput
      end>
  end
  object TSS_FE_Playlists: TFDQuery
    Connection = TSS_FE_Connection
    SQL.Strings = (
      
        'select m.*,pl.* from logumedia.media m inner join logumedia.play' +
        'lists pl on m.media_id=pl.playlist_media_id where pl.playlist_ui' +
        'd=:plid')
    Left = 480
    Top = 176
    ParamData = <
      item
        Name = 'PLID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object TSS_FE_AlgQuery: TFDQuery
    Connection = TSS_FE_Connection
    OnError = TSS_FE_AlgQueryError
    SQL.Strings = (
      
        'select m.*,pl.* from logumedia.media m inner join logumedia.play' +
        'lists pl on m.media_id=pl.playlist_media_id where pl.playlist_ui' +
        'd=:plid')
    Left = 480
    Top = 88
    ParamData = <
      item
        Name = 'PLID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object TSS_FE_AlgQuery2: TFDQuery
    Connection = TSS_FE_Connection
    SQL.Strings = (
      
        'select m.*,pl.* from logumedia.media m inner join logumedia.play' +
        'lists pl on m.media_id=pl.playlist_media_id where pl.playlist_ui' +
        'd=:plid')
    Left = 560
    Top = 88
    ParamData = <
      item
        Name = 'PLID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object TSS_FE_LogQuery: TFDQuery
    Connection = TSS_FE_Connection
    OnError = TSS_FE_LogQueryError
    SQL.Strings = (
      
        'select m.*,pl.* from logumedia.media m inner join logumedia.play' +
        'lists pl on m.media_id=pl.playlist_media_id where pl.playlist_ui' +
        'd=:plid')
    Left = 256
    Top = 128
    ParamData = <
      item
        Name = 'PLID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
