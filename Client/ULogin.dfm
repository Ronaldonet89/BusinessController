object frmLogin: TfrmLogin
  Left = 488
  Top = 165
  BorderStyle = bsNone
  Caption = 'frmLogin'
  ClientHeight = 146
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 25
  object cxLabel1: TcxLabel
    Left = 10
    Top = 12
    Caption = 'Usu'#225'rio '
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Lucida Handwriting'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 39
    Caption = 'Senha'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Lucida Handwriting'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.IsFontAssigned = True
  end
  object cxEdtSenha: TcxTextEdit
    Left = 136
    Top = 37
    Margins.Left = 0
    Margins.Top = 50
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Properties.EchoMode = eemPassword
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.SkinName = 'McSkin'
    Style.Shadow = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.SkinName = 'McSkin'
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.SkinName = 'McSkin'
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.SkinName = 'McSkin'
    TabOrder = 1
    Width = 121
  end
  object cxEdtUsuario: TcxTextEdit
    Left = 136
    Top = 10
    Margins.Left = 0
    Margins.Top = 50
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.SkinName = 'McSkin'
    Style.Shadow = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.SkinName = 'McSkin'
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.SkinName = 'McSkin'
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.SkinName = 'McSkin'
    TabOrder = 0
    Width = 121
  end
  object cxBtnConfirmar: TcxButton
    Left = 58
    Top = 71
    Width = 75
    Height = 25
    Caption = '&Confirmar'
    LookAndFeel.NativeStyle = False
    TabOrder = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = cxBtnConfirmarClick
  end
  object cxBtnCancelar: TcxButton
    Left = 160
    Top = 71
    Width = 73
    Height = 25
    Caption = 'C&ancelar'
    LookAndFeel.NativeStyle = False
    TabOrder = 3
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = cxBtnCancelarClick
  end
  object cxBtnCadastrarSenha: TcxButton
    Left = 263
    Top = 67
    Width = 106
    Height = 25
    Caption = 'Ca&dastrar senha'
    LookAndFeel.NativeStyle = False
    TabOrder = 5
    Visible = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = cxBtnCadastrarSenhaClick
  end
  object cxLblCadastrarSenha: TcxLabel
    Left = 8
    Top = 114
    Caption = 'Confir. Senha'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Lucida Handwriting'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.IsFontAssigned = True
    Visible = False
  end
  object cxEdtCadastrarSenha: TcxTextEdit
    Left = 136
    Top = 111
    Margins.Left = 0
    Margins.Top = 50
    ParentFont = False
    Properties.CharCase = ecUpperCase
    Properties.EchoMode = eemPassword
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.SkinName = 'McSkin'
    Style.Shadow = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.SkinName = 'McSkin'
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.SkinName = 'McSkin'
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.SkinName = 'McSkin'
    TabOrder = 4
    Visible = False
    Width = 121
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'LiquidSky'
    UseSkins = False
    Left = 24
    Top = 56
  end
  object cxLocalizer1: TcxLocalizer
    Left = 264
    Top = 12
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    SkinName = 'LiquidSky'
    Left = 56
    Top = 112
  end
end
