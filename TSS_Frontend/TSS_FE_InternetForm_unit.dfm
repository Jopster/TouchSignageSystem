object TSS_FE_InternetForm: TTSS_FE_InternetForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TSS_FE_InternetForm'
  ClientHeight = 846
  ClientWidth = 1293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1112
    Top = 0
    Width = 181
    Height = 846
    Align = alRight
    Caption = 'Panel1'
    TabOrder = 0
    DesignSize = (
      181
      846)
    object SpeedButton1: TSpeedButton
      Left = 6
      Top = 776
      Width = 171
      Height = 57
      Anchors = [akRight, akBottom]
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 6
      Top = 6
      Width = 171
      Height = 57
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 6
      Top = 69
      Width = 171
      Height = 57
    end
    object SpeedButton4: TSpeedButton
      Left = 6
      Top = 132
      Width = 171
      Height = 57
    end
  end
  object ChromiumWindow1: TChromiumWindow
    Left = 0
    Top = 0
    Width = 1112
    Height = 846
    Align = alClient
    TabStop = True
    TabOrder = 1
    ExplicitTop = 31
    ExplicitWidth = 1038
    ExplicitHeight = 594
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 1136
    Top = 217
  end
end
