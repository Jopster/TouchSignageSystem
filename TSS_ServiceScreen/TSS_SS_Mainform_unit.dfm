object TSS_SS_MainForm: TTSS_SS_MainForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TSS_SS Hauptfenster'
  ClientHeight = 886
  ClientWidth = 1462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 874
    Width = 1462
    Height = 12
    Align = alBottom
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1462
      12)
    object Label1: TLabel
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
    object Label2: TLabel
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
    object Label3: TLabel
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
    object Label4: TLabel
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
    object Label5: TLabel
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
    object dsLed1: TdsLed
      Left = 272
      Top = 0
      Width = 9
      Height = 9
      Bevel = blNone
      Shape = ltEllipse
      OnColor = clLime
      OffColor = clRed
      LedOn = False
      Style = lsStandard
    end
    object dsLed2: TdsLed
      Left = 287
      Top = 0
      Width = 9
      Height = 9
      Bevel = blNone
      Shape = ltEllipse
      OnColor = clLime
      OffColor = clRed
      LedOn = False
      Style = lsStandard
    end
    object dsLed3: TdsLed
      Left = 303
      Top = 0
      Width = 9
      Height = 9
      Bevel = blNone
      Shape = ltEllipse
      OnColor = clLime
      OffColor = clRed
      LedOn = False
      Style = lsStandard
    end
    object dsLed4: TdsLed
      Left = 318
      Top = 0
      Width = 9
      Height = 9
      Bevel = blNone
      Shape = ltEllipse
      OnColor = clLime
      OffColor = clRed
      LedOn = False
      Style = lsStandard
    end
    object SpeedButton1: TSpeedButton
      Left = 1446
      Top = 1
      Width = 11
      Height = 11
      Anchors = [akRight, akBottom]
      Caption = 'X'
      OnClick = SpeedButton1Click
      ExplicitLeft = 1000
    end
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 185
    Height = 25
    Caption = 'Connect/Activate System'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 0
    Top = 31
    Width = 185
    Height = 25
    Caption = 'Refresh Displayanzahl'
    TabOrder = 2
    OnClick = Button2Click
  end
  object IdTCPClient1: TIdTCPClient
    OnDisconnected = IdTCPClient1Disconnected
    OnWork = IdTCPClient1Work
    OnConnected = IdTCPClient1Connected
    ConnectTimeout = 0
    Host = '5.9.43.123'
    Port = 9900
    ReadTimeout = -1
    Left = 24
    Top = 64
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 24
    Top = 136
  end
end
