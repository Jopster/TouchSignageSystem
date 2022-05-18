object TSS_BE_FTPForm: TTSS_BE_FTPForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'FTP Transfer ..'
  ClientHeight = 122
  ClientWidth = 316
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 297
    Height = 103
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 273
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'FTP Aktion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 37
      Width = 273
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'FTP Aktion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 51
      Width = 273
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'FTP Aktion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 70
      Width = 265
      Height = 17
      TabOrder = 0
    end
  end
  object IdFTP1: TIdFTP
    OnWork = IdFTP1Work
    OnWorkBegin = IdFTP1WorkBegin
    OnWorkEnd = IdFTP1WorkEnd
    OnConnected = IdFTP1Connected
    IPVersion = Id_IPv4
    Host = 'logumedia-content.de'
    ConnectTimeout = 0
    Password = 'LM2020#ContentFTP'
    TransferType = ftBinary
    Username = 'LoguMediaContentFTPU'
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 21
    Top = 16
  end
end
