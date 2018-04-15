object FrmComposicaoVenda: TFrmComposicaoVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Composi'#231#227'o de Venda'
  ClientHeight = 109
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 31
    Top = 19
    Width = 78
    Height = 13
    Caption = 'Informe o valor:'
  end
  object Label2: TLabel
    Left = 18
    Top = 49
    Width = 91
    Height = 13
    Caption = 'Total de Desconto:'
  end
  object Button1: TButton
    Left = 88
    Top = 74
    Width = 97
    Height = 25
    Caption = 'Confirma'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtValor: TcxCurrencyEdit
    Left = 115
    Top = 16
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.AssignedValues.EditFormat = True
    TabOrder = 1
    Width = 126
  end
  object edtDesconto: TcxCurrencyEdit
    Left = 115
    Top = 45
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 2
    Width = 126
  end
end
