object TSS_BE_MediaForm: TTSS_BE_MediaForm
  Left = 0
  Top = 0
  Caption = 'Medien verwalten und pflegen'
  ClientHeight = 712
  ClientWidth = 1144
  Color = clBtnFace
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
  object Label1: TLabel
    Left = 8
    Top = 347
    Width = 58
    Height = 13
    Caption = 'Dateiname :'
  end
  object Label3: TLabel
    Left = 439
    Top = 347
    Width = 71
    Height = 13
    Caption = 'Pfad bzw. Url :'
  end
  object Label4: TLabel
    Left = 687
    Top = 347
    Width = 39
    Height = 13
    Caption = 'Server :'
  end
  object Label5: TLabel
    Left = 855
    Top = 347
    Width = 41
    Height = 13
    Caption = 'Display :'
  end
  object Neubtn: TSpeedButton
    Left = 8
    Top = 319
    Width = 97
    Height = 22
    Caption = 'Neu hinzuf'#252'gen'
    OnClick = NeubtnClick
  end
  object Editbtn: TSpeedButton
    Left = 111
    Top = 319
    Width = 81
    Height = 22
    Caption = 'Bearbeiten'
    Enabled = False
    OnClick = EditbtnClick
  end
  object Delbtn: TSpeedButton
    Left = 198
    Top = 319
    Width = 81
    Height = 22
    Caption = 'L'#246'schen'
    Enabled = False
    OnClick = DelbtnClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 32
    Width = 1129
    Height = 281
    DataSource = TSS_BE_MediaList_Source
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnExit = DBGrid1Exit
  end
  object ToggleSwitch1: TToggleSwitch
    Left = 8
    Top = 6
    Width = 214
    Height = 20
    StateCaptions.CaptionOn = 'Alle Medien zeigen'
    StateCaptions.CaptionOff = 'Nur Medien des Standorts zeigen'
    TabOrder = 1
    ThumbColor = clLime
    OnClick = ToggleSwitch1Click
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 366
    Width = 417
    Height = 21
    Color = clSilver
    DataField = 'media_file'
    DataSource = TSS_BE_MediaList_Source
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 439
    Top = 366
    Width = 234
    Height = 21
    Color = clSilver
    DataField = 'media_path'
    DataSource = TSS_BE_MediaList_Source
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 687
    Top = 366
    Width = 162
    Height = 21
    Color = clSilver
    DataField = 'media_server'
    DataSource = TSS_BE_MediaList_Source
    ReadOnly = True
    TabOrder = 4
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 855
    Top = 366
    Width = 234
    Height = 21
    Color = clSilver
    DataField = 'schematic_id'
    DataSource = TSS_BE_MediaList_Source
    KeyField = 'schematic_id'
    ListField = 'displayname'
    ListSource = TSS_BE_Displays_Source
    ReadOnly = True
    TabOrder = 5
  end
  object EditPanel: TPanel
    Left = 8
    Top = 400
    Width = 1129
    Height = 304
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    Visible = False
    object Label2: TLabel
      Left = 8
      Top = 51
      Width = 58
      Height = 13
      Caption = 'Dateiname :'
    end
    object Label6: TLabel
      Left = 8
      Top = 78
      Width = 71
      Height = 13
      Caption = 'Pfad bzw. Url :'
    end
    object Label7: TLabel
      Left = 8
      Top = 105
      Width = 39
      Height = 13
      Caption = 'Server :'
    end
    object Label8: TLabel
      Left = 8
      Top = 199
      Width = 41
      Height = 13
      Caption = 'Display :'
    end
    object SpeedButton4: TSpeedButton
      Left = 961
      Top = 274
      Width = 81
      Height = 22
      Caption = 'Speichern'
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 1040
      Top = 274
      Width = 81
      Height = 22
      Caption = 'Abbrechen'
      OnClick = SpeedButton5Click
    end
    object SpeedButton1: TSpeedButton
      Left = 592
      Top = 50
      Width = 23
      Height = 22
      OnClick = SpeedButton1Click
    end
    object Label9: TLabel
      Left = 8
      Top = 11
      Width = 52
      Height = 13
      Caption = 'Herkunft : '
    end
    object Label10: TLabel
      Left = 8
      Top = 137
      Width = 59
      Height = 13
      Caption = 'Zuordnung :'
    end
    object Label11: TLabel
      Left = 8
      Top = 226
      Width = 37
      Height = 13
      Caption = 'Kunde :'
    end
    object Label12: TLabel
      Left = 386
      Top = 205
      Width = 27
      Height = 13
      Caption = 'Feld :'
    end
    object Label13: TLabel
      Left = 386
      Top = 232
      Width = 42
      Height = 13
      Caption = 'Gallerie :'
    end
    object SpeedButton18: TSpeedButton
      Left = 663
      Top = 228
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
      OnClick = SpeedButton18Click
    end
    object SpeedButton2: TSpeedButton
      Left = 316
      Top = 225
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
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 340
      Top = 225
      Width = 23
      Height = 23
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3030
        30909090202000202000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF3030309090902020005F9F7F5F5F3FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3030309090902020
        005F9F7F7F7F3F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF3030309090902020005F9F7F7F7F3F000000FFFFFFFFFFFFFFFFFF
        FFFFFF303030909090C0C0C0C0C0C0909090606060C0C0C02020005F9F7F7F7F
        3F000000FFFFFFFFFFFFFFFFFFFFFFFF60606060606000000000000000000050
        50508080803050505F5F3F5F5F3F000000FFFFFFFFFFFFFFFFFFFFFFFF606060
        303030606060DFDF60DFDF60DFDF606060603030302020003F3F3FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000303030DFDF60EFEF30BFBF7FBFBF7FDFDFDFFF
        FF3F9F9F60303030808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3030306F6F30
        FFFF00EFEF30DFDF60CFCF30909030BFBF9FFFFF3F606060505050606060FFFF
        FFFFFFFFFFFFFFFFFFFF000000DFDF60FFFF7FFFFF3FFFFF00FFFF00EFEF3090
        9030DFDFDFDFDF60000000606060FFFFFFFFFFFFFFFFFFFFFFFF000000DFDF60
        FFFFBFFFFF3FFFFF3FFFFF00FFFF00CFCF30BFBF7FDFDF60000000606060FFFF
        FFFFFFFFFFFFFFFFFFFF000000CFCF90FFFF7FFFFFBFFFFF3FFFFF7FFFFF00DF
        DF60BFBF7FDFDF60000000303030FFFFFFFFFFFFFFFFFFFFFFFF303030606060
        EFEF30FFFFBFFFFFBFFFFFBFFFFF3FEFEF30EFEF305F5F20303030FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000303030909090EFEF30FFFF7FFFFF7FFFFF3FEF
        EF30CFCF90303030000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        303030606060CFCF90DFDF60CFCF90606060303030000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000030303000000000000000000030
        3030000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton3Click
    end
    object DBEdit4: TDBEdit
      Left = 85
      Top = 51
      Width = 501
      Height = 21
      Color = clWhite
      DataField = 'media_file'
      DataSource = TSS_BE_MediaList_Source
      TabOrder = 0
    end
    object DBEdit5: TDBEdit
      Left = 85
      Top = 78
      Width = 234
      Height = 21
      Color = clWhite
      DataField = 'media_path'
      DataSource = TSS_BE_MediaList_Source
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 85
      Top = 105
      Width = 162
      Height = 21
      Color = clWhite
      DataField = 'media_server'
      DataSource = TSS_BE_MediaList_Source
      TabOrder = 2
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 85
      Top = 199
      Width = 234
      Height = 21
      Color = clWhite
      DataField = 'schematic_id'
      DataSource = TSS_BE_MediaList_Source
      KeyField = 'schematic_id'
      ListField = 'displayname'
      ListSource = TSS_BE_Displays_Source
      TabOrder = 3
      OnCloseUp = DBLookupComboBox2CloseUp
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 85
      Top = 8
      Width = 1036
      Height = 36
      Columns = 3
      DataField = 'media_typ'
      DataSource = TSS_BE_MediaList_Source
      Items.Strings = (
        '101 | JPG - Aus Internet laden'
        '201 | MP4 Video - Aus Internet laden')
      TabOrder = 4
      Values.Strings = (
        '101'
        '201'
        '301')
    end
    object FileList: TListBox
      Left = 688
      Top = 50
      Width = 433
      Height = 218
      ItemHeight = 13
      TabOrder = 5
      Visible = False
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 85
      Top = 128
      Width = 597
      Height = 68
      Columns = 2
      DataField = 'zuordnung_typ'
      DataSource = TSS_BE_MediaList_Source
      Items.Strings = (
        'Medium einen Display zuordnen'
        'Medium einen Kunde zuordnen'
        'Medium einem Feld zuordnen'
        'Medium ist Teil einer Alg. Gallerie'
        'Medium ist Teil einer Kundengallerie')
      TabOrder = 6
      Values.Strings = (
        '10'
        '20'
        '30'
        '40'
        '50')
      OnChange = DBRadioGroup2Change
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 85
      Top = 226
      Width = 234
      Height = 21
      Color = clWhite
      DataField = 'kunden_id'
      DataSource = TSS_BE_MediaList_Source
      KeyField = 'kunden_id'
      ListField = 'kundenkurzname'
      ListSource = TSS_BE_Kunden_Source
      TabOrder = 7
      OnCloseUp = DBLookupComboBox3CloseUp
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 431
      Top = 202
      Width = 234
      Height = 21
      Color = clWhite
      DataField = 'feld_uid'
      DataSource = TSS_BE_MediaList_Source
      KeyField = 'feld_id'
      ListField = 'feld_name'
      ListSource = DataSource1
      TabOrder = 8
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 431
      Top = 229
      Width = 234
      Height = 21
      Color = clWhite
      DataField = 'Gallery_uid'
      DataSource = TSS_BE_MediaList_Source
      KeyField = 'UID'
      ListField = 'Name'
      ListSource = DataSource2
      TabOrder = 9
    end
    object DBEdit7: TDBEdit
      Left = 128
      Top = 253
      Width = 191
      Height = 21
      Color = clWhite
      DataField = 'kunden_uid'
      DataSource = TSS_BE_MediaList_Source
      TabOrder = 10
    end
    object DBEdit8: TDBEdit
      Left = 85
      Top = 253
      Width = 37
      Height = 21
      Color = clWhite
      DataField = 'kunden_id'
      DataSource = TSS_BE_MediaList_Source
      TabOrder = 11
    end
  end
  object TSS_BE_MediaList_Source: TDataSource
    DataSet = TSS_BE_MediaList
    Left = 40
    Top = 72
  end
  object TSS_BE_MediaList: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select * from logumedia.media')
    Left = 40
    Top = 16
  end
  object TSS_BE_Displays: TFDTable
    IndexFieldNames = 'display_id'
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    UpdateOptions.UpdateTableName = 'logumedia.displays'
    TableName = 'logumedia.displays'
    Left = 144
    Top = 16
  end
  object TSS_BE_Displays_Source: TDataSource
    DataSet = TSS_BE_Displays
    Left = 144
    Top = 72
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'JPEG-Grafikdatei (*.jpg)|*.jpg'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
    Left = 976
    Top = 320
  end
  object OpenPictureDialog2: TOpenPictureDialog
    Filter = 'Mp4 Videodateieni (*.mp4)|*.mp4'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
    Left = 1072
    Top = 320
  end
  object TSS_BE_Kunden_Source: TDataSource
    DataSet = TSS_BE_Kunden
    Left = 232
    Top = 72
  end
  object TSS_BE_Kunden: TFDTable
    IndexFieldNames = 'kunden_id'
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    UpdateOptions.UpdateTableName = 'kunden'
    TableName = 'kunden'
    Left = 232
    Top = 16
  end
  object TSS_BE_Felder: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      
        'select f.* from logumedia.felder f inner join logumedia.schemati' +
        'c s on s.feld_id=f.feld_id where s.schematic_id=:1')
    Left = 320
    Top = 16
    ParamData = <
      item
        Name = '1'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource1: TDataSource
    DataSet = TSS_BE_Felder
    Left = 320
    Top = 72
  end
  object TSS_BE_GALQuery: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select g.* from logumedia.Gallery g where kundenid=0')
    Left = 384
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = TSS_BE_GALQuery
    Left = 384
    Top = 72
  end
end
