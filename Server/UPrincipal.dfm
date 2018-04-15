object frmPrincipal: TfrmPrincipal
  Left = 151
  Top = 77
  Caption = 'Servidor - HeadSystems Corporation'
  ClientHeight = 584
  ClientWidth = 1106
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
  object PCConfiguracoes: TPageControl
    Left = 0
    Top = 41
    Width = 1106
    Height = 543
    ActivePage = tsConfiguracoes
    Align = alClient
    TabOrder = 0
    object tsConfiguracoes: TTabSheet
      Caption = 'Configura'#231#245'es'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 369
        Height = 105
        Caption = 'Endere'#231'o do Banco de Dados'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 73
          Height = 13
          Caption = 'Endere'#231'o Atual'
        end
        object lblNovoEndereco: TLabel
          Left = 8
          Top = 62
          Width = 73
          Height = 13
          Caption = 'Novo Endere'#231'o'
          Visible = False
        end
        object spbSalvarEndereco: TSpeedButton
          Left = 270
          Top = 60
          Width = 96
          Height = 40
          Caption = 'Salvar altera'#231#227'o'
          Enabled = False
          OnClick = spbSalvarEnderecoClick
        end
        object spbEfetuarAlteracao: TSpeedButton
          Left = 269
          Top = 16
          Width = 96
          Height = 39
          Caption = 'Alterar endere'#231'o'
          OnClick = spbEfetuarAlteracaoClick
        end
        object edtEnderecoBancoAtual: TEdit
          Left = 8
          Top = 33
          Width = 258
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edtNovoEnereco: TEdit
          Left = 8
          Top = 79
          Width = 258
          Height = 21
          TabOrder = 1
          Visible = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 376
        Top = 0
        Width = 213
        Height = 105
        Caption = 'Porta de conex'#227'o Servidor'
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 16
          Width = 54
          Height = 13
          Caption = 'Porta Atual'
        end
        object Label4: TLabel
          Left = 8
          Top = 62
          Width = 54
          Height = 13
          Caption = 'Nova Porta'
        end
        object spbAlterarPorta: TSpeedButton
          Left = 87
          Top = 35
          Width = 96
          Height = 67
          Caption = 'Alterar Porta'
          OnClick = spbAlterarPortaClick
        end
        object edtPortaAtual: TEdit
          Left = 8
          Top = 33
          Width = 73
          Height = 21
          TabOrder = 0
        end
        object edtNovaPorta: TEdit
          Left = 8
          Top = 79
          Width = 73
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 595
        Top = 0
        Width = 185
        Height = 105
        Caption = 'Ajustar Banco de dados'
        TabOrder = 2
        object spbAjustarBancoDeDados: TSpeedButton
          Left = 16
          Top = 33
          Width = 137
          Height = 22
          Caption = 'Ajustar Banco de Dados'
          OnClick = spbAjustarBancoDeDadosClick
        end
        object spbInformacoesExecutavel: TSpeedButton
          Left = 16
          Top = 72
          Width = 137
          Height = 22
          Caption = 'Inf. do sistema'
          OnClick = spbInformacoesExecutavelClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 106
        Width = 369
        Height = 183
        Caption = 'Comandas'
        TabOrder = 3
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 365
          Height = 41
          Align = alTop
          TabOrder = 0
          object spbCadastrarComanda: TSpeedButton
            Left = 64
            Top = 8
            Width = 112
            Height = 22
            Caption = '&Cadastrar Comanda'
            OnClick = spbCadastrarComandaClick
          end
          object spbCancelarComanda: TSpeedButton
            Left = 184
            Top = 8
            Width = 105
            Height = 22
            Caption = 'C&ancelar Comanda'
            OnClick = spbCancelarComandaClick
          end
        end
        object DBGComandas: TDBGrid
          Left = 2
          Top = 56
          Width = 365
          Height = 125
          Align = alClient
          DataSource = DSModuleDb.dsComandas
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMERO_COMANDA'
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Comanda'
              Width = 330
              Visible = True
            end>
        end
      end
    end
    object TSChat: TTabSheet
      Caption = 'Chat'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblUsuariosConectadosChat: TLabel
        Left = 0
        Top = 360
        Width = 131
        Height = 13
        Caption = 'lblUsuariosConectadosChat'
      end
      object MMChat: TMemo
        Left = 0
        Top = 0
        Width = 577
        Height = 345
        Align = alCustom
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object TSVendas: TTabSheet
      Caption = 'Configura'#231#245'es vendas'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 761
        Height = 233
        Caption = 'Formas de pagamentos'
        TabOrder = 0
        object Panel3: TPanel
          Left = 2
          Top = 15
          Width = 757
          Height = 41
          Align = alTop
          TabOrder = 0
          object DBNavigator1: TDBNavigator
            Left = 8
            Top = 8
            Width = 240
            Height = 25
            TabOrder = 0
          end
        end
        object DBGrid1: TDBGrid
          Left = 2
          Top = 56
          Width = 757
          Height = 175
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_FORMA_DE_PAGAMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Identificador'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Forma de pagamento'
              Width = 200
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERMITE_TROCO'
              Title.Alignment = taCenter
              Title.Caption = 'Permite troco ?'
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'EFETUA_MOVIMENTACAO_CLIENTE'
              Title.Alignment = taCenter
              Title.Caption = 'Efet. Movim. Cliente ?'
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'EFETUA_REALIZACAO_DO_TITULO'
              Title.Alignment = taCenter
              Title.Caption = 'Efet. Realiz. T'#237'tulo ?'
              Width = 120
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'EFETUA_MOVIMENTACAO_CAIXA'
              Title.Alignment = taCenter
              Title.Caption = 'Efet.Movim.Caixa ?'
              Width = 120
              Visible = True
            end>
        end
      end
    end
    object TSUsuarios: TTabSheet
      Caption = 'Usu'#225'rios'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GBUsuarios: TGroupBox
        Left = 0
        Top = 0
        Width = 456
        Height = 242
        Align = alCustom
        Caption = 'Usu'#225'rios'
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 2
          Top = 43
          Width = 452
          Height = 197
          Align = alClient
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_USUARIO'
              Title.Alignment = taCenter
              Title.Caption = 'Identificador'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'USUARIO'
              Title.Alignment = taCenter
              Title.Caption = 'Usu'#225'rio'
              Width = 300
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 2
          Top = 15
          Width = 452
          Height = 28
          Align = alTop
          TabOrder = 1
          object DBNavigator2: TDBNavigator
            Left = 4
            Top = -1
            Width = 240
            Height = 25
            TabOrder = 0
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 462
        Top = 3
        Width = 633
        Height = 237
        Align = alCustom
        Caption = 'Permiss'#245'es'
        TabOrder = 1
        object Panel5: TPanel
          Left = 2
          Top = 15
          Width = 629
          Height = 28
          Align = alTop
          TabOrder = 0
          object spbCarregarPermissao: TSpeedButton
            Left = 248
            Top = 0
            Width = 113
            Height = 22
            Caption = 'Preencher permiss'#245'es'
            Flat = True
            OnClick = spbCarregarPermissaoClick
          end
          object DBNavigator3: TDBNavigator
            Left = 4
            Top = 0
            Width = 222
            Height = 25
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
            TabOrder = 0
          end
        end
        object DBGrid3: TDBGrid
          Left = 2
          Top = 43
          Width = 629
          Height = 192
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_PERMISSAO_USUARIO_SISTEMA'
              Title.Alignment = taCenter
              Title.Caption = 'Identificador'
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERMISSAO'
              Title.Alignment = taCenter
              Title.Caption = 'Permiss'#227'o'
              Width = 500
              Visible = True
            end>
        end
      end
      object GroupBox7: TGroupBox
        Left = 0
        Top = 245
        Width = 1098
        Height = 270
        Align = alBottom
        Caption = 'Permiss'#245'es deste usu'#225'rio'
        TabOrder = 2
        object Panel6: TPanel
          Left = 2
          Top = 15
          Width = 1094
          Height = 25
          Align = alTop
          TabOrder = 0
          object DBText1: TDBText
            Left = 56
            Top = 1
            Width = 396
            Height = 17
            DataField = 'USUARIO'
          end
          object Label2: TLabel
            Left = 8
            Top = 1
            Width = 46
            Height = 13
            Caption = 'Usu'#225'rio : '
          end
          object spbVincularPermissao: TSpeedButton
            Left = 468
            Top = 0
            Width = 109
            Height = 22
            Hint = 'Vincula permiss'#227'o a este usu'#225'rio'
            Caption = 'Vincular permiss'#227'o'
            ParentShowHint = False
            ShowHint = True
            OnClick = spbVincularPermissaoClick
          end
        end
        object DBGrid4: TDBGrid
          Left = 2
          Top = 40
          Width = 1094
          Height = 228
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = DBGrid4CellClick
          OnDrawColumnCell = DBGrid4DrawColumnCell
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERMISSAO'
              Title.Alignment = taCenter
              Title.Caption = 'Permiss'#227'o'
              Width = 500
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERMITE_OU_NAO'
              Title.Alignment = taCenter
              Title.Caption = 'Permite ?'
              Visible = True
            end>
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1106
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object ImageList1: TImageList
    Left = 100
    Top = 470
    Bitmap = {
      494C0101020008003C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDEDED00B5BDB500839B83006B976B006A986A0087A08700B7C0B700EDED
      ED00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00C2C8
      C2005A935A0021BA230009E00D0000F0060000F0050008E10D001DC02000539B
      5400C2CAC200FDFDFD0000000000000000000000000000000000FDFDFD009393
      950030305700E1E1E10000000000000000000000000000000000E1E1E1003030
      570093939500FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B4BDB400369E
      390002E60A0000F8080013E6190000FC070000FE070000FD070000FA080001EC
      08002DAA2F00B3C1B300000000000000000000000000FDFDFD007E7E85000202
      A9000505F3001E1E6100DBDBDB000000000000000000DBDBDB001E1E61000505
      F3000202A9007E7E8500FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7DBD7003C9A3D0001E4
      0A0000F90A0028E22F00B6C6B70027DE2C0000FF080000FF080000FE090000FA
      0A0000EA090030A83300D5DBD50000000000000000007C7C85000404B9000D0D
      FE000E0EFE000A0AF5001A1A6400D5D5D500D5D5D5001A1A64000A0AF5000E0E
      FE000D0DFE000404B9007C7C8500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFB00799F790006CF0D0000F1
      090030DC3600CDDDCD00F6F6F600AACCAB000AEF130000FF0A0000FF0A0000FD
      0A0000F5090002D90A0067A36800FBFBFB00000000006E6E77000202DC001313
      F9001616F9001616F9001111F30015156500151565001111F3001616F9001616
      F9001313F9000202DD006E6E7700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2E5E200309D320005D50D0059CE
      5D00D9DFD900F8F8F800C2E6C200F2F2F20081C8840002F70A0000FF070000FE
      070000F8080000E5090020A92300D9E1D90000000000F1F1F10038385A000404
      CF001B1BF3001F1FF4001F1FF4001919F0001919F0001F1FF4001F1FF4001B1B
      F3000404CF0038385A00F1F1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFCBBF0015AC190045D34A00DEF0
      DE00FEFEFE00C2E3C20011E71600E2F5E200E9E9E9006CCA6E0000FA060000FE
      060000F8080000E609000ABA0E00ADC3AD000000000000000000F1F1F1003A3A
      57000505C3002525EF002A2AEF002A2AEF002A2AEF002A2AEF002525EF000505
      C3003A3A5700F1F1F10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5C6B5000EAE120000DC090016E5
      1E0094E9970050E8550000FE09006AE96F00FEFEFE00E4E4E40068C96B0002F5
      0B0000F60A0000E1090001BD070094B99400000000000000000000000000F1F1
      F100303048000B0BCA003636EB003636EB003636EB003636EB000B0BCB003030
      4800F1F1F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B9CAB9000FA6120000D2080000EB
      090000F9080000FD080000FF080004F60C00C5EFC600FEFEFE00E9E9E90091C6
      930016DD1E0000D8080002B4070095BA9500000000000000000000000000B3B3
      B300101072003939E6004343E8004343E8004343E8004343E8003939E6001010
      7200B3B3B3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1DBD10018991B0004C40B0001DD
      080000F1060000FA060000FE060000FE07002AEC2F00EDF7ED00FEFEFE00E3E2
      E30017C81D0005C90C000BA30E00B8CCB8000000000000000000ABABAB000F0F
      75004747E4005151E6005151E6004545E4004545E4005151E6005151E6004747
      E4000F0F7500ABABAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F9F800469747000CB311000CCB
      120000DE060000ED060000F5070000F8080000F808004AE24F00F7FAF700DEDE
      DE0009BB0E0010B9150026932700E6ECE60000000000A1A1A100111179005555
      E2005F5FE4005F5FE4005151E1000A0AA7000A0AA7005151E1005F5FE4005F5F
      E4005555E20011117900A1A1A100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AAC3AA00129A15002EC0
      330008C70F0000D5080000E0080000E5080000E6080000E008004CCD5000E1E8
      E10035B1390012A3150083AF830000000000F5F5F50006064D005656DE006F6F
      E3006F6FE3005F5FE0000B0BA40042425400424255000B0BAA005F5FE0006F6F
      E3006F6FE3005656DE0006064D00F5F5F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9FAF90067A168002EA8
      31004CC54F0016BE1B0003C2080000C6050000C7050002C3070012BE17005CC0
      5F0041AD430047974800EDF2ED0000000000000000008585880010108F007171
      E0006C6CDF000C0CA70042425500F5F5F500F5F5F500424257000C0CB1006C6C
      DF007171E00010108E0085858800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFF3EF0067A0
      670046AA480083D1840067CC69004BC44D004AC44C0065CB670086D3870050B2
      51004D974E00DEE8DE00000000000000000000000000FDFDFD0078787E001414
      9A000D0DB40044445900F5F5F5000000000000000000F5F5F50044445D000D0D
      BE001414980078787E00FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9FB
      F900A9C5A900599E59006CAF6D0088C2880088C289006FB17000539C540095B9
      9500F2F6F2000000000000000000000000000000000000000000FDFDFD007070
      7B004A4A6400F5F5F50000000000000000000000000000000000F5F5F5004A4A
      650070707A00FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9FBF900D6E1D600B9CDB900B8CCB800D1DED100F6F9F6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F00FFFFF00000000C003C3C300000000
      C003818100000000800180010000000000008001000000000000800100000000
      0000C003000000000000E007000000000000E007000000000000C00300000000
      000080010000000080010000000000008001800100000000C003818100000000
      E007C3C300000000F81FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
