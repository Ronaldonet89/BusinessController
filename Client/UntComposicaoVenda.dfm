object FrmComposicaoVenda: TFrmComposicaoVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Composi'#231#227'o de Venda'
  ClientHeight = 265
  ClientWidth = 520
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
  object Label3: TLabel
    Left = 75
    Top = 76
    Width = 31
    Height = 13
    Caption = 'Troco:'
  end
  object Button1: TButton
    Left = 152
    Top = 233
    Width = 98
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
    Properties.OnChange = edtValorPropertiesChange
    TabOrder = 1
    Width = 126
  end
  object edtDesconto: TcxCurrencyEdit
    Left = 115
    Top = 45
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.OnChange = edtDescontoPropertiesChange
    TabOrder = 2
    Width = 126
  end
  object cxTroco: TcxCurrencyEdit
    Left = 115
    Top = 73
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.AssignedValues.EditFormat = True
    Properties.ReadOnly = True
    TabOrder = 3
    Width = 126
  end
  object Memo2: TMemo
    Left = 253
    Top = 16
    Width = 252
    Height = 209
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Button2: TButton
    Left = 276
    Top = 233
    Width = 97
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object ACBrTroco1: TACBrTroco
    StrCedula = 'C'#233'dula'
    StrMoeda = 'Moeda'
    Left = 112
    Top = 144
  end
end
