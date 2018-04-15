object frmLookUpFormaDePagamento: TfrmLookUpFormaDePagamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmLookUpFormaDePagamento'
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
    object cxButton1: TcxButton
      Left = 567
      Top = 8
      Width = 75
      Height = 33
      Caption = 'Cancelar'
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnClick = cxButton1Click
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
    LockedStateImageOptions.AssignedValues = [lsiavFont]
    LockedStateImageOptions.Font.Charset = ANSI_CHARSET
    LockedStateImageOptions.Font.Color = clWindowText
    LockedStateImageOptions.Font.Height = -11
    LockedStateImageOptions.Font.Name = 'Segoe UI'
    LockedStateImageOptions.Font.Style = []
    LookAndFeel.NativeStyle = False
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyDown = cxGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM.dsFormasDePagamento
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1FORMA_DE_PAGAMENTO: TcxGridDBColumn
        Caption = 'Forma de pagamento'
        DataBinding.FieldName = 'FORMA_DE_PAGAMENTO'
        Width = 645
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
