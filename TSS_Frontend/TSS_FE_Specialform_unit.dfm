object TSS_FE_Specialform: TTSS_FE_Specialform
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TSS_FE_Specialform'
  ClientHeight = 725
  ClientWidth = 1272
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 712
    Width = 1272
    Height = 13
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    DesignSize = (
      1272
      13)
    object Label9: TLabel
      Left = 0
      Top = -1
      Width = 16
      Height = 13
      Caption = '(c) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 116
      Top = -1
      Width = 35
      Height = 13
      Caption = 'SPACE '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 43
      Top = -1
      Width = 67
      Height = 13
      Caption = ' Logumedia && '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 152
      Top = -1
      Width = 47
      Height = 13
      Caption = 'Software '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 17
      Top = -1
      Width = 24
      Height = 13
      Caption = '2020'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton4: TSpeedButton
      Left = 487
      Top = -3
      Width = 14
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = '#'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton4Click
      ExplicitLeft = 471
      ExplicitTop = -4
    end
    object SpeedButton1: TSpeedButton
      Left = 503
      Top = -3
      Width = 14
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = '>'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 467
      Top = -3
      Width = 14
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'M'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object Panel5: TPanel
      Left = 205
      Top = 0
      Width = 7
      Height = 14
      BevelOuter = bvNone
      Color = clTeal
      ParentBackground = False
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = -28
    Top = -19
    Width = 1129
    Height = 699
    BevelOuter = bvNone
    TabOrder = 1
    object Wplayer1: TWindowsMediaPlayer
      Left = -616
      Top = -9
      Width = 245
      Height = 240
      TabOrder = 0
      ControlData = {
        000300000800000000000500000000000000F03F030000000000050000000000
        0000000008000200000000000300010000000B00FFFF0300000000000B00FFFF
        08000200000000000300320000000B00000008000A000000660075006C006C00
        00000B0000000B0000000B00FFFF0B00FFFF0B00000008000200000000000800
        020000000000080002000000000008000200000000000B00000052190000CE18
        0000}
    end
  end
  object Playtimer: TTimer
    Enabled = False
    OnTimer = PlaytimerTimer
    Left = 328
    Top = 64
  end
  object ImageList1: TImageList
    Left = 872
    Top = 568
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000001E2B23000E654400177748001B7D
      4F001D7B5200217A5200167C5200167C5200167C5200167C5200167C5200167C
      5200167C520013754900106A460013291D001E2B23000E654400177748001B7D
      4F001D7B5200217A5200167C5200167C5200167C5200167C5200167C5200167C
      5200167C520013754900106A460013291D001E2B23000E654400177748001B7D
      4F001D7B5200217A5200167C5200167C5200167C5200167C5200167C5200167C
      5200167C520013754900106A460013291D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000009552B0049F1AC0027E7900026E3
      8E002DE091002DE0910026E1910028E1910028E1910028E1910028E1910028E1
      910028E1910024DE8A003CE5A00019633F0009552B0049F1AC0027E7900026E3
      8E002DE091002DE0910026E1910028E1910028E1910028E1910028E1910028E1
      910028E1910024DE8A003CE5A00019633F0009552B0049F1AC0027E7900026E3
      8E002DE091002DE0910026E1910028E1910028E1910028E1910028E1910028E1
      910028E1910024DE8A003CE5A00019633F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000009000000613900008B5200008B
      5400008A5600008A5600008B5600008A5600008B5500008B5500008A5600008A
      5600008B550000854F0000653900000900000009000000613900008B5200008B
      5400008A5600008A5600008B5600008A5600008B5500008B5500008A5600008A
      5600008B550000854F0000653900000900000009000000613900008B5200008B
      5400008A5600008A5600008B5600008A5600008B5500008B5500008A5600008A
      5600008B550000854F0000653900000900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000030825F002FF3A7002FF8A10028F7
      A50028F8A40026F9A30027FD9E002FF3A10027EFA80030F0A30032F6A40036F4
      A5001FFAA30028F8A0002DF3AB0032886600348060002CF2AA002DF9A00028FB
      A5002BFAA8001CEBA1002FEFA80033F8A80029FDA40026F5A00035FFB40023F9
      A60032FCA30028F8A0002DF3AB0032886600327F640031F0AD002DF9A00021FC
      A10029F79E002BF5A2002AF2A40029F3A00026F39E002CFBA9002CFDA10025F9
      990022F69C0028F8A0002DF3AB00328866000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024865C001EF9A30026FC9D001DFB
      A1001DFD9E001DFD9D0032FAA2000D704000000900000019000018FE9E0019FD
      9E0022FC9D001FFC9B001BF9A700248D62001989590021F9A2001FFE9C0033F9
      A70000140000000B00000006060000010000000201000B010700000500002CA4
      740017F69A001FFC9B001BF9A700248D62002284600017F8A6001BFF9A0028FF
      A60000521500001300000305000000050000000F00000044190038FFAB001EFC
      9C0020F39D001FFC9B001BF9A700248D62000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024865C001EF9A30026FC9D001DFB
      A1001DFD9E001DFD9D0029FAA8000E6948000C000600000F00001BFF9C0018FF
      9C0022FC9E001FFC9B001BF9A700248D6200248759002CF7A0001DFE9C0021FC
      A600001400000005000005000700000001000004000000060000000B000020A5
      6C001DFF9E001FFC9B001BF9A700248D620020865D0017FAA30019FF9A0023F9
      A00000170000000800000004000000090000050C07000002000000753E0039FF
      AC0018FD9C001FFC9B001BF9A700248D62000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024865C001EF9A30026FC9D001DFB
      A1001DFD9E001DFD9D0018F89900006A4100000006000011000019FF990019FF
      99001FFC9E001CF9980017F5A300279065001586600013F9A60020FE9A000EFD
      9C003AF8A9001F9E6A00070504000004000069ECB30032ED9E003AFCA90023F7
      9D0015F897001CF9980017F5A3002790650022855F001FF7A60020FBA0001BFA
      A4003FE79B0038E39F0034EF9F0027F2950031A2700000080100000C00003ED5
      8F0014FF97001CF9980017F5A300279065000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024865C001EF9A30026FC9D001DFB
      A1001DFD9E001DFD9D001DFA94000B6C3A00090003000010000020FF99001FFF
      97001FFD9D001CF9980017F5A30027906500278261001CF7A70022FE9A0017FF
      9B0024FE99003FFFAE0000120000000200000014000042DDA00016F8A00017FC
      9F001FFB9D001CF9980017F5A3002790650022855F001FF5A90024F9A30017F9
      A1001AED8D001AFF9D0016FD960016FF980059DEA500000200000006000041C6
      8E0015FE9C001CF9980017F5A300279065000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024865C001EF9A30026FC9D001DFB
      A1001DFD9E001DFD9D001AF99700046C3D00000003000010000026FC9D0024FE
      99001DFF9A001CF9980017F5A3002790650020875A0017F9A4001BFD9E0018FD
      A00024F8940024FF9E0019EF90002BA46A0007020100000B010040EAA2001BFB
      9C0030FA9C001CF9980017F5A3002790650025845F001EF7A6001FFC9E001EFB
      9F001FF8970024F99C0028BF7A002CAB7300000A0000000507000060380046FE
      B00015FFA1001CF9980017F5A300279065000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000022875A001EF9A20022FC9D001BFC
      A1001FFC9E001DFD9D001BF799000B6A3E0000000400001000001DFD9D001DFF
      970020FE9A001CF9990019F4A300298F6500228858001EF9A30020FBA10016F6
      9E0020FA9B0020FF9D0019FF940036FDA200000F0000070204000074410028FD
      A70021F699001CF9990019F4A300298F650027855C001CF9A3001DFE9C0024FE
      9F0025FFA5003DFBAE00000C000001050000000100002B5A4A0043FBAD0016FA
      970029FFA6001CF9990019F4A300298F65000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000198959001EF9A20018FE9D001AFE
      9F0020FB9A001BFB9B002CFFAC000C6E400005000300000F00002DFC9A0019FF
      99001BFAA4001BF89A001BF5A100259262002084600021F6A70022FBA00022FC
      9E0026FFA00023FF9D0018FC9D0016FD9A003ECB980000000400000A00004CED
      A7001EFA9C001BF89A001BF5A1002592620019885C0018FAA3001FFE9C0026FF
      A00010FC980027FBA10033E9A20039DE9A00002B0A0000060000006631002DF6
      9F0019FE9D001BF89A001BF5A100259262000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000020855F0021F6A70026FB9E0022F6
      9D0034F9A30006B165003AF5A60007663A0014060800000D00001DFE9C0019FF
      990020FAA3001EF8990024F4A0002D90620022855D0021F7A40029FB9D0022FF
      A20033FFA20043FFAC0019F99A0013F996004EDBAA0000000400000900004EED
      A70013FE9C001EF8990024F4A0002D9062001E855F001FF7A60026FB9E001AF6
      98000AEB89002CFFA60017FF940019FF9A0063DBA100000400000015000056F6
      AE0020FF9B001EF8990024F4A0002D9062000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017875D001AF9A4001FFC9E0012F7
      A0002BE7A000001B0000000C0000000500000C000300001000002BFA9E002BFC
      9A0018FDA00015F89D0019F4A400259065001E8958001AFBA00024FD9C001BFB
      A3002C9B6500000E000000310C0006683A00000B000007000000001600003CF0
      A10014F9980015F89D0019F4A400259065001B865F0017F9A40022FD9C0011F8
      9C004CF5B0000016000000471B0000673400000E000000000300001A000053F9
      B2001BFFA20015F89D0019F4A400259065000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000238658001BF69C0022FF9C0018FE
      9E0036FFB00012A0650000120000000300000F0708000010000020FBA10022FD
      9C001BFD9E0027FFAA001FFAA900269264002487550013F89B0029FF9D0020F4
      9B00005C2100000E0000000500000004000000060000000C00002BCC880018F9
      9D0019FF9F0027FFAA001FFAA900269264002A835C0013F79E0025FF990024FF
      A00032CB86000010000000030200000301000001000000050000269E67003EF9
      A90021FFAB0027FFAA001FFAA900269264000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000075D3F0032FAB30027F5A20025F4
      A20027FEA90016FCA90027FAB00030EAA8005AEFB70040E8A60013FCA0001AFC
      9D001EFB9F001CF4A10030F7B30011725000075E3D0034FAB20027F5A3002DFF
      B1000CEE990031FDB2003EE8AE003EE1AA0045EFB5002AE9A40014F2980026FF
      A5002CFEAA001CF4A10030F7B300117250000E5A420032FAB3001DF99F0029FF
      AF0015F49F002CF2AB003DEDB80044E8AE0048EFAC0031EDA60019F6980024FF
      A40024FCA9001CF4A10030F7B300117250000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000202D2B00005E3C0026835C001D7F
      5B0029896000167E550023885B0027895D0025845F00288762001E875C002485
      5D0025855D00298A5E000D6749001B2B2A00163128000B5E38001F8659002686
      61002D8E6200258E6300188B5A00198557001E7F5F001A7E5B00218159002382
      5D001B806000298A5E000D6749001B2B2A00202C2C00075D3B0023855B001A82
      5900148151002284560020815F001C865D0019855A00208363001E835D001D86
      59001D835900298A5E000D6749001B2B2A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
