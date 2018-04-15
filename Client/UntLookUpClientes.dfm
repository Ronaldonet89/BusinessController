object frmLookUpClientes: TfrmLookUpClientes
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmLookUpClientes'
  ClientHeight = 311
  ClientWidth = 646
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
    Width = 646
    object Label1: TLabel
      Left = 9
      Top = 12
      Width = 152
      Height = 13
      Caption = 'Pesquisa por nome do cliente'
    end
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
    object edtClientes: TEdit
      Left = 171
      Top = 9
      Width = 209
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edtClientesChange
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 42
    Width = 646
    Height = 269
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyDown = cxGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM.dsClientes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1ID_CLIENTE: TcxGridDBColumn
        Caption = 'Identificador'
        DataBinding.FieldName = 'ID_CLIENTE'
        Width = 80
      end
      object cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn
        Caption = 'Raz'#227'o social'
        DataBinding.FieldName = 'RAZAO_SOCIAL'
        Width = 300
      end
      object cxGrid1DBTableView1CNPJ: TcxGridDBColumn
        DataBinding.FieldName = 'CNPJ'
      end
      object cxGrid1DBTableView1INSCRICAO_ESTADUAL: TcxGridDBColumn
        Caption = 'Inscri'#231#227'o Estadual'
        DataBinding.FieldName = 'INSCRICAO_ESTADUAL'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
