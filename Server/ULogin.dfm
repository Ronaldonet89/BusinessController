object frmLogin: TfrmLogin
  Left = 578
  Top = 320
  Caption = 'HeadSystems - Client'
  ClientHeight = 114
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spbConfirmar: TSpeedButton
    Left = 60
    Top = 80
    Width = 78
    Height = 22
    Caption = '&Confirmar'
    OnClick = spbConfirmarClick
  end
  object spbCancelar: TSpeedButton
    Left = 144
    Top = 80
    Width = 65
    Height = 22
    Caption = 'C&ancelar'
    OnClick = spbCancelarClick
  end
  object Label3: TLabel
    Left = 48
    Top = 42
    Width = 50
    Height = 17
    Caption = 'Senha'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Handwriting'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 32
    Top = 10
    Width = 66
    Height = 17
    Caption = 'Usu'#225'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Handwriting'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtUsuario: TEdit
    Left = 128
    Top = 8
    Width = 121
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 128
    Top = 41
    Width = 121
    Height = 19
    CharCase = ecUpperCase
    Ctl3D = False
    ParentCtl3D = False
    PasswordChar = '*'
    TabOrder = 1
  end
end
