object frmlookUpFormaPagamento: TfrmlookUpFormaPagamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmlookUpFormaPagamento'
  ClientHeight = 662
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
    TabOrder = 0
    Height = 42
    Width = 807
    object cxButton1: TcxButton
      Left = 744
      Top = 8
      Width = 59
      Height = 29
      Caption = 'Cancelar'
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxlblValorPedido: TcxLabel
      Left = 6
      Top = 12
      Caption = 'cxlblValorPedido'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold, fsItalic]
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Transparent = True
    end
    object cxlblValorParcelado: TcxLabel
      Left = 269
      Top = 11
      Caption = 'cxlblValorPedido'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold, fsItalic]
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Transparent = True
    end
    object cxLblSaldo: TcxLabel
      Left = 503
      Top = 12
      Caption = 'cxlblValorPedido'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold, fsItalic]
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Transparent = True
    end
    object cxButton2: TcxButton
      Left = 679
      Top = 8
      Width = 59
      Height = 29
      Caption = 'Excluir'
      LookAndFeel.NativeStyle = False
      TabOrder = 4
      OnClick = cxButton2Click
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 42
    Align = alLeft
    Caption = 'Formas de pagamentos'
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 334
    Width = 409
    object cxGridFormaPagamento: TcxGrid
      Left = 2
      Top = 18
      Width = 405
      Height = 314
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      object cxGridFormaPagamentoDBTableView1: TcxGridDBTableView
        OnKeyDown = cxGridFormaPagamentoDBTableView1KeyDown
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DM.dsFormasDePagamento
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridFormaPagamentoDBTableView1FORMA_DE_PAGAMENTO: TcxGridDBColumn
          Caption = 'Forma de pagamento'
          DataBinding.FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
        end
      end
      object cxGridFormaPagamentoLevel1: TcxGridLevel
        GridView = cxGridFormaPagamentoDBTableView1
      end
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 128
      Width = 121
      Height = 21
      DataField = 'ID_FORMA_DE_PAGAMENTO'
      DataSource = DM.dsFormasDePagamento
      TabOrder = 1
      Visible = False
      OnChange = DBEdit1Change
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 376
    Align = alBottom
    Caption = 'Condi'#231#245'es deste pedido'
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Height = 286
    Width = 807
    object cxGrid3: TcxGrid
      Left = 2
      Top = 18
      Width = 803
      Height = 266
      Align = alClient
      TabOrder = 0
      OnEnter = cxGrid3Enter
      OnExit = cxGrid3Exit
      LookAndFeel.NativeStyle = False
      object cxGrid3DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DM.dsPedidos_Formas_Condicoes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGrid3DBTableView1DESCRICAO_FORMA_DE_PAGAMENTO: TcxGridDBColumn
          Caption = 'Forma de pagamento'
          DataBinding.FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
          Width = 200
        end
        object cxGrid3DBTableView1CONDICAO_DE_PAGAMENTO: TcxGridDBColumn
          Caption = 'Condi'#231#227'o de pagamento'
          DataBinding.FieldName = 'CONDICAO_DE_PAGAMENTO'
          Width = 200
        end
        object cxGrid3DBTableView1VALOR: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'VALOR'
        end
      end
      object cxGrid3Level1: TcxGridLevel
        GridView = cxGrid3DBTableView1
      end
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 409
    Top = 42
    Align = alClient
    Caption = 'Condi'#231#245'es de pagamento'
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Height = 334
    Width = 398
    object cxGridCondicao: TcxGrid
      Left = 2
      Top = 18
      Width = 394
      Height = 314
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      object cxGridCondicaoDBTableView1: TcxGridDBTableView
        OnKeyDown = cxGridCondicaoDBTableView1KeyDown
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DM.dsFormasVSCondicoes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridCondicaoDBTableView1CONDICAO_DE_PAGAMENTO: TcxGridDBColumn
          Caption = 'Condi'#231#227'o de pagamento'
          DataBinding.FieldName = 'CONDICAO_DE_PAGAMENTO'
        end
      end
      object cxGridCondicaoLevel1: TcxGridLevel
        GridView = cxGridCondicaoDBTableView1
      end
    end
  end
end
