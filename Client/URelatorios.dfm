object frmRelatorios: TfrmRelatorios
  Left = 188
  Top = 90
  Caption = 'HeadSystem'
  ClientHeight = 610
  ClientWidth = 1260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QRListagem: TQuickRep
    Left = 832
    Top = 40
    Width = 794
    Height = 1123
    DataSet = DM.cdsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 112
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        296.333333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 256
        Top = 8
        Width = 184
        Height = 23
        Size.Values = (
          60.854166666666670000
          677.333333333333300000
          21.166666666666670000
          486.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lanchonete Tassim'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRLabel2: TQRLabel
        Left = 128
        Top = 40
        Width = 446
        Height = 23
        Size.Values = (
          60.854166666666670000
          338.666666666666700000
          105.833333333333300000
          1180.041666666667000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Relat'#243'rio de produtos  para simples confer'#234'ncia'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 14
      end
      object QRLabel4: TQRLabel
        Left = 2
        Top = 93
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          246.062500000000000000
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 61
        Top = 93
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          161.395833333333300000
          246.062500000000000000
          314.854166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o do Produto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 306
        Top = 93
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          809.625000000000000000
          246.062500000000000000
          82.020833333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Saldo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 370
        Top = 93
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          978.958333333333300000
          246.062500000000000000
          232.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pre'#231'o de Venda'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 631
        Top = 93
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1669.520833333333000000
          246.062500000000000000
          89.958333333333330000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'EAN13'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 475
        Top = 93
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          1256.770833333333000000
          246.062500000000000000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'M'#233'dia Ponderada'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 150
      Width = 718
      Height = 21
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 586
        Top = 2
        Width = 127
        Height = 17
        Size.Values = (
          44.979166666666670000
          1550.458333333333000000
          5.291666666666667000
          336.020833333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DM.cdsProdutos
        DataField = 'PRO_EAN13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 2
        Top = 2
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          5.291666666666667000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DM.cdsProdutos
        DataField = 'PRO_CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 61
        Top = 2
        Width = 220
        Height = 17
        Size.Values = (
          44.979166666666670000
          161.395833333333300000
          5.291666666666667000
          582.083333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DM.cdsProdutos
        DataField = 'PRO_DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 283
        Top = 2
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          748.770833333333400000
          5.291666666666667000
          216.958333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DM.cdsProdutos
        DataField = 'PRO_SALDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 372
        Top = 2
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          984.249999999999900000
          5.291666666666667000
          232.833333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = DM.cdsProdutos
        DataField = 'PRECO_VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLMédiaPonderada: TQRLabel
        Left = 475
        Top = 2
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          1256.770833333333000000
          5.291666666666667000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'M'#233'dia Ponderada'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand3: TQRBand
      Left = 38
      Top = 171
      Width = 718
      Height = 26
      AlignToBottom = False
      BeforePrint = QRBand3BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel9: TQRLabel
        Left = 331
        Top = 5
        Width = 132
        Height = 17
        Size.Values = (
          44.979166666666670000
          875.770833333333300000
          13.229166666666670000
          349.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total : M'#233'dia Ponderada'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLTotalMediaPonderada: TQRLabel
        Left = 475
        Top = 5
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          1256.770833333333000000
          13.229166666666670000
          254.000000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'M'#233'dia Ponderada'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object QRComandas: TQuickRep
    Left = 32
    Top = 343
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand4: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 179
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        473.604166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRLabel10: TQRLabel
        Left = 130
        Top = 14
        Width = 76
        Height = 18
        Size.Values = (
          47.625000000000000000
          343.958333333333300000
          37.041666666666670000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Antuarte'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Handwriting'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLNumeroComanda: TQRLabel
        Left = 101
        Top = 120
        Width = 135
        Height = 18
        Size.Values = (
          47.625000000000000000
          267.229166666666700000
          317.500000000000000000
          357.187500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Bomboniere Tassin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Handwriting'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 336
        Top = 0
        Width = 1
        Height = 179
        Size.Values = (
          473.604166666666700000
          889.000000000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 0
        Width = 1
        Height = 179
        Size.Values = (
          473.604166666666700000
          0.000000000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 0
        Width = 337
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          0.000000000000000000
          891.645833333333300000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 0
        Top = 177
        Width = 337
        Height = 1
        Size.Values = (
          2.645833333333333000
          0.000000000000000000
          468.312500000000000000
          891.645833333333300000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 498
        Top = 14
        Width = 76
        Height = 18
        Size.Values = (
          47.625000000000000000
          1317.625000000000000000
          37.041666666666670000
          201.083333333333300000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Antuarte'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Handwriting'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLNumeroComanda2: TQRLabel
        Left = 469
        Top = 120
        Width = 135
        Height = 18
        Size.Values = (
          47.625000000000000000
          1240.895833333333000000
          317.500000000000000000
          357.187500000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Bomboniere Tassin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lucida Handwriting'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = 717
        Top = 0
        Width = 1
        Height = 179
        Size.Values = (
          473.604166666666700000
          1897.062500000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 381
        Top = 0
        Width = 337
        Height = 1
        Size.Values = (
          2.645833333333333000
          1008.062500000000000000
          0.000000000000000000
          891.645833333333300000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 381
        Top = 177
        Width = 337
        Height = 1
        Size.Values = (
          2.645833333333333000
          1008.062500000000000000
          468.312500000000000000
          891.645833333333300000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 381
        Top = 0
        Width = 1
        Height = 179
        Size.Values = (
          473.604166666666700000
          1008.062500000000000000
          0.000000000000000000
          2.645833333333333000)
        XLColumn = 0
        Brush.Color = clBlack
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
  object QRRelatorioGerencial: TQuickRep
    Left = 77
    Top = 352
    Width = 794
    Height = 1123
    DataSet = cdsRelatorioGerencial
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand5: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 64
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        169.333333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel12: TQRLabel
        Left = 329
        Top = 8
        Width = 66
        Height = 20
        Size.Values = (
          52.916666666666670000
          870.479166666666700000
          21.166666666666670000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Antuarte'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object qrlPeriodo: TQRLabel
        Left = 329
        Top = 32
        Width = 66
        Height = 20
        Size.Values = (
          52.916666666666670000
          870.479166666666700000
          84.666666666666670000
          174.625000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Antuarte'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
    end
    object QRGroup1: TQRGroup
      Left = 38
      Top = 102
      Width = 718
      Height = 43
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        113.770833333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'cdsRelatorioGerencial.DATA'
      FooterBand = QRBand7
      Master = QRRelatorioGerencial
      ReprintOnNewPage = False
      object QRDBText6: TQRDBText
        Left = 44
        Top = 4
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          116.416666666666700000
          10.583333333333330000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = cdsRelatorioGerencial
        DataField = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 8
        Top = 4
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data : '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 8
        Top = 24
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          63.500000000000000000
          312.208333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Forma de Pagamento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 358
        Top = 24
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          947.208333333333300000
          63.500000000000000000
          79.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand6: TQRBand
      Left = 38
      Top = 145
      Width = 718
      Height = 19
      AlignToBottom = False
      BeforePrint = QRBand6BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText7: TQRDBText
        Left = 8
        Top = 1
        Width = 289
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          2.645833333333333000
          764.645833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsRelatorioGerencial
        DataField = 'DESCRICAO_FORMA_DE_PAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 303
        Top = 1
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          801.687500000000000000
          2.645833333333333000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = cdsRelatorioGerencial
        DataField = 'VALOR_TOTAL_PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object QRBand7: TQRBand
      Left = 38
      Top = 164
      Width = 718
      Height = 25
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = QRBand7BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlValorTotalPedido: TQRLabel
        Left = 303
        Top = 3
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          801.687500000000000000
          7.937500000000000000
          216.958333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlValorTotalPedido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 237
        Top = 3
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          627.062500000000000000
          7.937500000000000000
          164.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total di'#225'rio : '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object pnlConsultarProduto: TPanel
    Left = 772
    Top = 8
    Width = 545
    Height = 433
    Caption = 'pnlConsultarProduto'
    TabOrder = 3
    Visible = False
    object spbConfirmar: TSpeedButton
      Left = 264
      Top = 376
      Width = 23
      Height = 22
      Visible = False
      OnClick = spbConfirmarClick
    end
    object Label1: TLabel
      Left = 12
      Top = 13
      Width = 93
      Height = 13
      Caption = 'Area para Pesquisa'
    end
    object Image1: TImage
      Left = 12
      Top = 152
      Width = 220
      Height = 241
      Stretch = True
    end
    object Label7: TLabel
      Left = 247
      Top = 162
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
    end
    object Label5: TLabel
      Left = 12
      Top = 78
      Width = 102
      Height = 13
      Caption = 'Descri'#231#227'o do produto'
    end
    object edtPesquisa: TEdit
      Left = 12
      Top = 32
      Width = 381
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnExit = edtPesquisaExit
      OnKeyDown = edtPesquisaKeyDown
    end
    object edtPreco: TEdit
      Left = 247
      Top = 178
      Width = 106
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtDescricao: TEdit
      Left = 13
      Top = 94
      Width = 381
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object Panel1: TPanel
      Left = 1
      Top = 391
      Width = 543
      Height = 41
      Align = alBottom
      Caption = 'F2 = Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Lucida Handwriting'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
  end
  object pnlVinculo: TPanel
    Left = 8
    Top = 21
    Width = 713
    Height = 316
    TabOrder = 4
    object cxGroupBox1: TcxGroupBox
      Left = 1
      Top = 1
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
      Height = 37
      Width = 711
      object cxBtnCancelar: TcxButton
        Left = 618
        Top = 3
        Width = 75
        Height = 31
        Caption = 'Cancelar'
        LookAndFeel.NativeStyle = False
        TabOrder = 0
        OnClick = cxBtnCancelarClick
      end
      object cxBtnConfirmar: TcxButton
        Left = 543
        Top = 3
        Width = 75
        Height = 31
        Caption = 'Confirmar'
        LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnClick = cxBtnConfirmarClick
      end
    end
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 1
      Top = 38
      Width = 711
      Height = 277
      Align = alClient
      DataSource = dsVinculo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      PanelHeight = 27
      PanelWidth = 694
      ParentFont = False
      TabOrder = 1
      RowCount = 10
      object DBEdit1: TDBEdit
        Left = 15
        Top = 4
        Width = 506
        Height = 21
        DataField = 'CONDICAO_PAGAMENTO'
        DataSource = dsVinculo
        ReadOnly = True
        TabOrder = 0
      end
      object dbnConfirmar: TDBCheckBox
        Left = 552
        Top = 5
        Width = 97
        Height = 17
        Caption = 'Confirmar'
        DataField = 'CONFIRMA'
        DataSource = dsVinculo
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  object cdsRelatorioGerencial: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 8
    object cdsRelatorioGerencialDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object cdsRelatorioGerencialVALOR_TOTAL_PEDIDO: TFloatField
      FieldName = 'VALOR_TOTAL_PEDIDO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object cdsRelatorioGerencialDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsRelatorioGerencialID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
  end
  object cdsVinculo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 104
    object cdsVinculoCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 255
    end
    object cdsVinculoCONFIRMA: TStringField
      FieldName = 'CONFIRMA'
      Size = 1
    end
    object cdsVinculoID_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_PAGAMENTO'
    end
    object cdsVinculoID_CONDICAO_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_PAGAMENTO'
    end
  end
  object dsVinculo: TDataSource
    DataSet = cdsVinculo
    Left = 40
    Top = 152
  end
end
