object FrmLookUpProdutos: TFrmLookUpProdutos
  Left = 0
  Top = 0
  Anchors = []
  BorderStyle = bsNone
  Caption = 'FrmLookUpProdutos'
  ClientHeight = 311
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 25
  object cxGrid1: TcxGrid
    Left = 0
    Top = 44
    Width = 736
    Height = 259
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.NativeStyle = False
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyDown = cxGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM.dsProdutos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'Id'
        DataBinding.FieldName = 'PRO_ID'
        Width = 61
      end
      object cxGrid1DBTableView1PRO_DESCRICAO: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'PRO_DESCRICAO'
        Width = 300
      end
      object cxGrid1DBTableView1PRO_CODIGO: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'PRO_CODIGO'
        Width = 91
      end
      object cxGrid1DBTableView1PRO_SALDO: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'PRO_SALDO'
        Width = 70
      end
      object cxGrid1DBTableView1PRECO_VENDA: TcxGridDBColumn
        Caption = 'V.Unit'#225'rio'
        DataBinding.FieldName = 'PRECO_VENDA'
        Width = 80
      end
      object cxGrid1DBTableView1COR: TcxGridDBColumn
        Caption = 'Cor'
        DataBinding.FieldName = 'COR'
        Width = 136
      end
      object cxGrid1DBTableView1TAMANHO: TcxGridDBColumn
        Caption = 'Tamanho'
        DataBinding.FieldName = 'TAMANHO'
        Width = 331
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    ExplicitWidth = 688
    Height = 42
    Width = 736
    object Label1: TLabel
      Left = 9
      Top = 12
      Width = 161
      Height = 13
      Caption = 'Pesquisa por nome do produto'
    end
    object cxButton1: TcxButton
      Left = 568
      Top = 7
      Width = 75
      Height = 33
      Caption = 'Cancelar'
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object edtProdutos: TEdit
      Left = 184
      Top = 9
      Width = 209
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edtProdutosChange
    end
  end
end
