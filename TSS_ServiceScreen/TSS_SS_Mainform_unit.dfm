object TSS_SS_MainForm: TTSS_SS_MainForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TSS_SS Hauptfenster'
  ClientHeight = 581
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 569
    Width = 1016
    Height = 12
    Align = alBottom
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -24
    ExplicitWidth = 1040
    DesignSize = (
      1016
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
      Left = 1000
      Top = 1
      Width = 11
      Height = 11
      Anchors = [akRight, akBottom]
      Caption = 'X'
      OnClick = SpeedButton1Click
    end
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 9800
    OnConnect = IdTCPServer1Connect
    OnExecute = IdTCPServer1Execute
    Left = 952
    Top = 488
  end
  object IdSchedulerOfThreadDefault1: TIdSchedulerOfThreadDefault
    MaxThreads = 0
    Left = 856
    Top = 488
  end
end
