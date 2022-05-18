object SetupForm: TSetupForm
  Left = 0
  Top = 0
  Caption = 'SetupForm'
  ClientHeight = 542
  ClientWidth = 635
  Color = 8404992
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonGroup1: TButtonGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 542
    Align = alLeft
    BevelInner = bvLowered
    ButtonOptions = [gboFullSize, gboShowCaptions]
    Items = <
      item
        Caption = 'Allgemeines'
        OnClick = ButtonGroup1Items0Click
      end
      item
        Caption = 'Display'
        OnClick = ButtonGroup1Items1Click
      end>
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 121
    Top = 0
    Width = 514
    Height = 542
    ActivePage = AllgemeinSetup
    Align = alClient
    TabOrder = 1
    object AllgemeinSetup: TTabSheet
      Caption = 'AllgemeinSetup'
      TabVisible = False
      ExplicitLeft = 6
      ExplicitTop = 10
      object SpeedButton1: TSpeedButton
        Left = 430
        Top = 507
        Width = 73
        Height = 22
        Caption = 'Verwenden'
      end
      object SpeedButton2: TSpeedButton
        Left = 351
        Top = 507
        Width = 73
        Height = 22
        Caption = 'Abbrechen'
      end
      object SpeedButton3: TSpeedButton
        Left = 3
        Top = 165
        Width = 73
        Height = 22
        Caption = 'Abbrechen'
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 430
        Top = 0
        Width = 73
        Height = 22
        Caption = 'Reload'
        OnClick = SpeedButton3Click
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 3
        Top = 35
        Width = 145
        Height = 21
        KeyField = 'display_id'
        ListField = 'displayname'
        ListSource = DataSource1
        ReadOnly = True
        TabOrder = 0
      end
      object DBListBox1: TDBListBox
        Left = 2
        Top = 62
        Width = 146
        Height = 97
        DataField = 'displayname'
        DataSource = DataSource1
        ItemHeight = 13
        TabOrder = 1
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ImageIndex = 1
      TabVisible = False
    end
  end
  object Edit1: TEdit
    Left = 127
    Top = 8
    Width = 422
    Height = 21
    TabOrder = 2
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'Display_ID'
    Connection = DataForm.TSS_FE_Connection
    UpdateOptions.UpdateTableName = 'logumedia.displays'
    TableName = 'logumedia.displays'
    Left = 309
    Top = 38
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDTable1
    Left = 376
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = DataForm.TSS_FE_Connection
    SQL.Strings = (
      'Select * from logumedia.displays')
    Left = 360
    Top = 120
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = FDQuery1
    Left = 416
    Top = 128
  end
end
