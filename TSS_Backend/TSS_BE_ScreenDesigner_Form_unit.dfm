object TSS_BE_ScreenDesigner_Form: TTSS_BE_ScreenDesigner_Form
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Bildschirm Schema erstellen & '#228'ndern'
  ClientHeight = 542
  ClientWidth = 1594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 479
    Width = 129
    Height = 26
    Caption = 'Aufteilung R'#252'cksetzen'
    OnClick = SpeedButton1Click
  end
  object SelectCountLAbel: TLabel
    Left = 143
    Top = 479
    Width = 3
    Height = 13
  end
  object SpeedButton2: TSpeedButton
    Left = 231
    Top = 479
    Width = 106
    Height = 26
    Caption = 'Zusammenfassen'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 455
    Top = 479
    Width = 106
    Height = 26
    Caption = 'vertikal Trennen'
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 567
    Top = 479
    Width = 106
    Height = 26
    Caption = 'horizontal Trennen'
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 679
    Top = 479
    Width = 106
    Height = 26
    Caption = 'umbenenen'
    OnClick = SpeedButton5Click
  end
  object SpeedButton6: TSpeedButton
    Left = 791
    Top = 479
    Width = 106
    Height = 26
    Caption = 'Inhalt bearbeiten'
    OnClick = SpeedButton6Click
  end
  object SpeedButton7: TSpeedButton
    Left = 343
    Top = 479
    Width = 106
    Height = 26
    Caption = 'l'#246'schen'
    OnClick = SpeedButton7Click
  end
  object Label8: TLabel
    Left = 154
    Top = 513
    Width = 41
    Height = 13
    Caption = 'Display :'
  end
  object SpeedButton8: TSpeedButton
    Left = 8
    Top = 508
    Width = 129
    Height = 26
    Caption = 'Aufteilung auslesen'
    OnClick = SpeedButton8Click
  end
  object SpeedButton9: TSpeedButton
    Left = 567
    Top = 508
    Width = 129
    Height = 26
    Caption = 'Aufteilung abspeichern'
    OnClick = SpeedButton9Click
  end
  object SpeedButton19: TSpeedButton
    Left = 538
    Top = 510
    Width = 23
    Height = 23
    Caption = '+'
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 889
    Height = 465
    BevelInner = bvLowered
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 903
    Top = 8
    Width = 673
    Height = 497
    BevelInner = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 463
      Width = 55
      Height = 13
      Caption = 'Buttonbild :'
    end
    object Label4: TLabel
      Left = 8
      Top = 479
      Width = 55
      Height = 13
      Caption = 'Buttonbild :'
    end
    object Notebook1: TNotebook
      Left = 8
      Top = 47
      Width = 657
      Height = 410
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Kundenfeld'
        object SpeedButton10: TSpeedButton
          Left = 592
          Top = 376
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
        object SpeedButton15: TSpeedButton
          Left = 529
          Top = 376
          Width = 57
          Height = 25
          Caption = 'speichern'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton15Click
        end
        object Label1: TLabel
          Left = 8
          Top = 32
          Width = 68
          Height = 13
          Caption = 'Buttonkunde :'
        end
        object SpeedButton18: TSpeedButton
          Left = 398
          Top = 32
          Width = 23
          Height = 22
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
        object Label2: TLabel
          Left = 8
          Top = 60
          Width = 55
          Height = 13
          Caption = 'Buttonbild :'
        end
        object Image1: TImage
          Left = 464
          Top = 6
          Width = 185
          Height = 73
          Proportional = True
          Stretch = True
        end
        object SpeedButton20: TSpeedButton
          Left = 419
          Top = 32
          Width = 23
          Height = 22
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3300333333333333330033333333333333003300033300033300307F70307F70
            330030F7F030F7F0330030FF7030FF7033003800070700033300330333333303
            3300330303333303030033303333333033003333333333333300333333333333
            33003333333333333300}
          OnClick = SpeedButton20Click
        end
        object Label5: TLabel
          Left = 8
          Top = 111
          Width = 89
          Height = 13
          Caption = 'Zentrale Playliste :'
        end
        object SpeedButton21: TSpeedButton
          Left = 503
          Top = 111
          Width = 42
          Height = 22
          Caption = '+'
          OnClick = SpeedButton21Click
        end
        object SpeedButton22: TSpeedButton
          Left = 503
          Top = 131
          Width = 42
          Height = 22
          Caption = '-'
          OnClick = SpeedButton22Click
        end
        object SpeedButton23: TSpeedButton
          Left = 503
          Top = 151
          Width = 42
          Height = 22
          Caption = '^'
        end
        object SpeedButton24: TSpeedButton
          Left = 503
          Top = 171
          Width = 42
          Height = 22
          Caption = 'v'
        end
        object SpeedButton25: TSpeedButton
          Left = 378
          Top = 32
          Width = 23
          Height = 22
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFF202020404040404040202020FFFFFFFFFFFFFFFFFFFFFFFF4040404040
            40404040FFFFFFFFFFFFFFFFFFFFFFFF000000505050505050505050909090FF
            FFFFFFFFFFFFFFFF202020505050505050808080404040FFFFFFFFFFFFFFFFFF
            0000006060606F6F6F000000909090FFFFFFFFFFFFFFFFFF000000DFDFDF0000
            00505050404040FFFFFFFFFFFFFFFFFF0000006060606F6F6F00000090909040
            4040404040404040000000DFDFDF000000505050606060FFFFFFFFFFFFFFFFFF
            2020203030303030300000005050505050508080805050500000006F6F6F0000
            00505050A0A0A0606060FFFFFF3030303030300000006F6F6F00000000000000
            00002020206F6F6F000000000000000000303030808080909090003F3F9FDFDF
            6F6F6F000000606060000000000000C0C0C00000006060600000000000000000
            00306F6F5050509090903F7F7F7FFFFF7FFFFF3F3F3F30303000000000000060
            60600000003030300000000000000000007FBFBF5050509090903F7F7F7FFFFF
            7FFFFF7FFFFF3F7F7F3030300000000000003F7F7F3030300000000000007FFF
            FF7FFFFF5050509090903F7F7F7FFFFF7FFFFF7FFFFF7FFFFF3030303030303F
            7F7F7FFFFF3030303030303F7F7F7FFFFF7FFFFF5050509090903F7F7F7FFFFF
            7FFFFF7FFFFF7FFFFF3030303030303F7F7F7FFFFF3030303030303F7F7F7FFF
            FF7FFFFF5050509090903F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F
            FFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF5050509090903F7F7F7FFFFF
            7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFF
            FF7FFFFF4040402020203F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F
            FFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF205F5F202020FFFFFF0000003F3F00
            7F7F007F7F007F7F007F7F007F7F000000000000000000000000000000000000
            00FFFFFFFFFFFFFFFFFFFFFFFF0000007F7F007F7F007F7F007F7F003F3F00FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton25Click
        end
        object Label6: TLabel
          Left = 8
          Top = 89
          Width = 76
          Height = 13
          Caption = 'Vertragsdaten :'
        end
        object SpeedButton26: TSpeedButton
          Left = 407
          Top = 85
          Width = 138
          Height = 22
          Caption = 'einsehen und bearbeiten'
          OnClick = SpeedButton21Click
        end
        object DBText1: TDBText
          Left = 164
          Top = 89
          Width = 65
          Height = 17
          DataField = 'vertragsdatum'
          DataSource = DataSource7
        end
        object Label7: TLabel
          Left = 104
          Top = 89
          Width = 54
          Height = 13
          Caption = 'Abschluss :'
        end
        object Label9: TLabel
          Left = 231
          Top = 89
          Width = 49
          Height = 13
          Caption = 'Freigabe :'
        end
        object DBText2: TDBText
          Left = 291
          Top = 89
          Width = 65
          Height = 17
          DataField = 'freigabe_datum'
          DataSource = DataSource7
        end
        object Label10: TLabel
          Left = 8
          Top = 8
          Width = 81
          Height = 13
          Caption = 'Kundennummer :'
        end
        object DBText3: TDBText
          Left = 95
          Top = 8
          Width = 94
          Height = 17
          DataField = 'kundennummer'
          DataSource = DataSource4
        end
        object Label11: TLabel
          Left = 9
          Top = 249
          Width = 90
          Height = 13
          Caption = 'Button Click Aktiv :'
        end
        object Label12: TLabel
          Left = 8
          Top = 271
          Width = 178
          Height = 13
          Caption = 'Aktion bei Click auf inaktiven Button :'
        end
        object Label13: TLabel
          Left = 8
          Top = 317
          Width = 170
          Height = 13
          Caption = 'Aktion bei Click auf aktiven Button :'
        end
        object SpeedButton27: TSpeedButton
          Left = 503
          Top = 336
          Width = 66
          Height = 22
          Caption = 'Bearbeiten'
          OnClick = SpeedButton21Click
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 104
          Top = 33
          Width = 273
          Height = 21
          KeyField = 'kunden_id'
          ListField = 'kundenkurzname'
          ListSource = DataSource3
          TabOrder = 0
          OnCloseUp = DBLookupComboBox1CloseUp
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 104
          Top = 60
          Width = 345
          Height = 21
          KeyField = 'media_id'
          ListField = 'media_file'
          ListSource = DataSource5
          TabOrder = 1
          OnCloseUp = DBLookupComboBox3CloseUp
          OnEnter = DBLookupComboBox3Enter
        end
        object DBGrid1: TDBGrid
          Left = 103
          Top = 111
          Width = 394
          Height = 120
          DataSource = DataSource6
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'media_file'
              Title.Caption = 'Video - Datei'
              Width = 277
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'playlist_playtime'
              Title.Caption = 'Laufzeit'
              Visible = True
            end>
        end
        object CheckBox1: TCheckBox
          Left = 105
          Top = 248
          Width = 97
          Height = 17
          Caption = '- Button Clickbar ?'
          TabOrder = 3
        end
        object ComboBox1: TComboBox
          Left = 104
          Top = 290
          Width = 393
          Height = 21
          TabOrder = 4
          Text = 'ComboBox1'
          Items.Strings = (
            'Keine Aktion'
            '"In Arbeit"-Seite einblenden'
            'Signalton')
        end
        object ComboBox2: TComboBox
          Left = 104
          Top = 336
          Width = 393
          Height = 21
          TabOrder = 5
          Text = 'ComboBox2'
          OnCloseUp = ComboBox2CloseUp
          Items.Strings = (
            '1 zentrales Video des Kunden einzeln spielen'
            'Gesondertes Video f'#252'r den Kunde spielen'
            'Eine Gallerie des Kunden anzeigen'
            'Eigene Anwendung eines Kunden '
            'Kontaktinformationen anzeigen'
            'Keine Aktion'
            '"In Arbeit"-Seite einblenden'
            'Signalton')
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 144
          Top = 363
          Width = 353
          Height = 21
          KeyField = 'media_id'
          ListField = 'media_file'
          ListSource = DataSource6
          TabOrder = 6
        end
        object DBLookupComboBox5: TDBLookupComboBox
          Left = 144
          Top = 363
          Width = 353
          Height = 21
          KeyField = 'media_id'
          ListField = 'media_file'
          ListSource = TSS_BE_KDMedia_Source
          TabOrder = 7
        end
        object DBLookupComboBox6: TDBLookupComboBox
          Left = 144
          Top = 363
          Width = 353
          Height = 21
          KeyField = 'UID'
          ListField = 'Name'
          ListSource = TSS_BE_Gallery_Source
          TabOrder = 8
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DisplayFeld'
        ExplicitWidth = 0
        ExplicitHeight = 0
        object SpeedButton11: TSpeedButton
          Left = 592
          Top = 376
          Width = 57
          Height = 25
          Caption = 'abbrechen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton11Click
        end
        object SpeedButton14: TSpeedButton
          Left = 529
          Top = 376
          Width = 57
          Height = 25
          Caption = 'speichern'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton14Click
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'InfoFeld'
        ExplicitWidth = 0
        ExplicitHeight = 0
        object SpeedButton12: TSpeedButton
          Left = 592
          Top = 376
          Width = 57
          Height = 25
          Caption = 'abbrechen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton12Click
        end
        object SpeedButton16: TSpeedButton
          Left = 529
          Top = 376
          Width = 57
          Height = 25
          Caption = 'speichern'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Free'
        ExplicitWidth = 0
        ExplicitHeight = 0
        object SpeedButton13: TSpeedButton
          Left = 592
          Top = 376
          Width = 57
          Height = 25
          Caption = 'abbrechen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton13Click
        end
        object SpeedButton17: TSpeedButton
          Left = 529
          Top = 376
          Width = 57
          Height = 25
          Caption = 'speichern'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 0
      Width = 657
      Height = 49
      Columns = 4
      Items.Strings = (
        'Tastenfeld mit Kunde'
        'Displayfl'#228'che f'#252'r Videos'
        'Tastenfeld f'#252'r Informationen'
        'Platzhalter')
      TabOrder = 1
    end
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 231
    Top = 511
    Width = 301
    Height = 21
    Color = clWhite
    DataField = 'schematic_id'
    KeyField = 'schematic_id'
    ListField = 'displayname'
    ListSource = DataSource1
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = TSS_BE_DataForm.TSS_BE_DisplayList
    Left = 320
    Top = 72
  end
  object TSS_BE_FeldData: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      
        'select f.*,m.* from logumedia.felder f inner join logumedia.sche' +
        'matic s on s.feld_id =f.feld_id left outer join logumedia.media ' +
        'm on m.media_id=f.button_media_id where s.schematic_id = :schema' +
        'tic_id ')
    Left = 360
    Top = 72
    ParamData = <
      item
        Name = 'SCHEMATIC_ID'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object TSS_BE_SingleFeld: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select f.* from logumedia.felder f where f.feld_id = :feld_id ')
    Left = 440
    Top = 72
    ParamData = <
      item
        Name = 'FELD_ID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource2: TDataSource
    DataSet = TSS_BE_SingleFeld
    Left = 480
    Top = 72
  end
  object TSS_BE_KundenDaten: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select k.* from logumedia.kunden k')
    Left = 536
    Top = 224
  end
  object DataSource3: TDataSource
    DataSet = TSS_BE_KundenDaten
    Left = 536
    Top = 264
  end
  object TSS_BE_KundendatenSingle: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      
        'select k.* from logumedia.kunden k where k.kunden_id = :kunden_i' +
        'd ')
    Left = 664
    Top = 72
    ParamData = <
      item
        Name = 'KUNDEN_ID'
        ParamType = ptInput
      end>
  end
  object DataSource4: TDataSource
    DataSet = TSS_BE_KundenDaten
    Left = 704
    Top = 72
  end
  object TSS_BE_BildMedien: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      
        'select m.* from logumedia.media m where media_typ=101 and schema' +
        'tic_id=:schematicid')
    Left = 792
    Top = 72
    ParamData = <
      item
        Name = 'SCHEMATICID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource5: TDataSource
    DataSet = TSS_BE_BildMedien
    Left = 832
    Top = 72
  end
  object TSS_BE_CenterPlaylist: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      
        'select m.*,pl.* from logumedia.media m inner join logumedia.play' +
        'lists pl on pl.playlist_media_id =m.media_id where pl.playlist_u' +
        'id = :playlist_uid ')
    Left = 360
    Top = 128
    ParamData = <
      item
        Name = 'PLAYLIST_UID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource6: TDataSource
    DataSet = TSS_BE_CenterPlaylist
    Left = 320
    Top = 128
  end
  object TSS_BE_Vertragsdaten: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      
        'select v.* from logumedia.vertrag v where v.feld_uuid = :feld_ui' +
        'd ')
    Left = 440
    Top = 128
    ParamData = <
      item
        Name = 'FELD_UID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object DataSource7: TDataSource
    DataSet = TSS_BE_Vertragsdaten
    Left = 480
    Top = 128
  end
  object FDQuery1: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      
        'select m.*,pl.* from logumedia.media m inner join logumedia.play' +
        'lists pl on pl.playlist_media_id =m.media_id where pl.playlist_u' +
        'id = :playlist_uid ')
    Left = 792
    Top = 128
    ParamData = <
      item
        Name = 'PLAYLIST_UID'
        ParamType = ptInput
      end>
  end
  object DataSource8: TDataSource
    DataSet = FDQuery1
    Left = 832
    Top = 128
  end
  object TSS_BE_KDMedia_Source: TDataSource
    DataSet = TSS_BE_KDMedia
    Left = 832
    Top = 184
  end
  object TSS_BE_KDMedia: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select m.* from logumedia.media m where m.kunden_id = :kuid'
      '')
    Left = 792
    Top = 184
    ParamData = <
      item
        Name = 'KUID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object TSS_BE_Gallery: TFDQuery
    Connection = TSS_BE_DataForm.TSS_FE_Connection
    SQL.Strings = (
      'select g.* from logumedia.gallery g where g.kundenid = :kuid'
      '')
    Left = 792
    Top = 240
    ParamData = <
      item
        Name = 'KUID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object TSS_BE_Gallery_Source: TDataSource
    DataSet = TSS_BE_Gallery
    Left = 832
    Top = 240
  end
end
