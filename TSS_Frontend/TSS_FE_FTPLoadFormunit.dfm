object TSS_FE_FTPLoadForm: TTSS_FE_FTPLoadForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FTPLoad'
  ClientHeight = 600
  ClientWidth = 975
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clGreen
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Wlabel: TLabel
    Left = 135
    Top = 132
    Width = 674
    Height = 37
    Alignment = taCenter
    AutoSize = False
    Caption = 'Es wird beim n'#228'chsten Update eingespielt .'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -31
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object Label1: TLabel
    Left = 135
    Top = 20
    Width = 674
    Height = 37
    Alignment = taCenter
    AutoSize = False
    Caption = 'Display leider - offline'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -31
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 76
    Width = 945
    Height = 37
    Alignment = taCenter
    AutoSize = False
    Caption = 'Leider ist der Inhalt des Kunden nicht Offline verf'#252'gbar.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -31
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object Label3: TLabel
    Left = 15
    Top = 244
    Width = 930
    Height = 37
    Alignment = taCenter
    AutoSize = False
    Caption = 'Es kann versucht werden ob der Inhalt erreichbar ist.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -31
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object DsFancyButton2: TDsFancyButton
    Left = 383
    Top = 312
    Width = 145
    Height = 49
    Caption = 'Neu versuchen'
    FancyEffects.FaceColor = clBlack
    FancyEffects.FrameColor = clLime
    FancyEffects.FrameStyle = fmGradient
    FancyEffects.FrameWidth = 4
    FancyEffects.HoverColor = clMaroon
    FancyEffects.Shape = btnCapsule
    FancyEffects.CornerRadius = 6
    FancyEffects.TextStyle = txLowered
    Glyphs.Layout = lyLeft
    Glyphs.Number = 1
    Glyphs.Distance = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
end
