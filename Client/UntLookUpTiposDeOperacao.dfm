object frmlookUpTiposDeoperacao: TfrmlookUpTiposDeoperacao
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmlookUpTiposDeoperacao'
  ClientHeight = 299
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 25
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
    ExplicitLeft = -183
    ExplicitWidth = 646
    Height = 42
    Width = 649
    object cxButton1: TcxButton
      Left = 568
      Top = 3
      Width = 75
      Height = 36
      Caption = 'Cancelar'
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object cxGridTiposDeOperacao: TcxGrid
    Left = 0
    Top = 42
    Width = 649
    Height = 257
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    ExplicitLeft = -183
    ExplicitTop = -29
    ExplicitWidth = 646
    ExplicitHeight = 269
    object cxGridTiposDeOperacaoDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridTiposDeOperacaoDBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM.dsTiposDeOperacao
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGridTiposDeOperacaoDBTableView1DESCRICAO_TIPO_OPERACAO: TcxGridDBColumn
        Caption = 'Tipo de Opera'#231#227'o'
        DataBinding.FieldName = 'DESCRICAO_TIPO_OPERACAO'
      end
    end
    object cxGridTiposDeOperacaoLevel1: TcxGridLevel
      GridView = cxGridTiposDeOperacaoDBTableView1
    end
  end
end
