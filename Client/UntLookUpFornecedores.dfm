object frmlookUpFornecedores: TfrmlookUpFornecedores
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmlookUpFornecedores'
  ClientHeight = 350
  ClientWidth = 657
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
    Width = 657
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 657
    Height = 308
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    ExplicitTop = -29
    ExplicitWidth = 646
    ExplicitHeight = 269
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyDown = cxGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM.dsFornecedores
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn
        Caption = 'Fornecedor'
        DataBinding.FieldName = 'RAZAO_SOCIAL'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
