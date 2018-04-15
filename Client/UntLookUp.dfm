object frmLookUp: TfrmLookUp
  Left = 233
  Top = 94
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'HeadSystem'
  ClientHeight = 300
  ClientWidth = 502
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 41
    Align = alTop
    TabOrder = 0
    object lblLookUp: TLabel
      Left = 222
      Top = 14
      Width = 59
      Height = 15
      Caption = 'lblLookUp'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Lucida Handwriting'
      Font.Style = []
      ParentFont = False
    end
    object DBNLookUp: TDBNavigator
      Left = 10
      Top = 8
      Width = 196
      Height = 25
      DataSource = DM.dsGenerico
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 0
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 502
    Height = 259
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 88
    ExplicitTop = 72
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyDown = cxGrid1DBTableView1KeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM.dsGenerico
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
