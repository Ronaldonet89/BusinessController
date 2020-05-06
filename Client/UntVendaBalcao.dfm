object frmVendasBalcao: TfrmVendasBalcao
  Left = 113
  Top = 64
  BorderStyle = bsNone
  ClientHeight = 644
  ClientWidth = 1236
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    1236
    644)
  PixelsPerInch = 96
  TextHeight = 13
  object SPBIniciarVenda: TSpeedButton
    Left = 790
    Top = 588
    Width = 72
    Height = 22
    Caption = '&Iniciar Venda'
    Visible = False
    OnClick = SPBIniciarVendaClick
  end
  object spbCancelarItem: TSpeedButton
    Left = 1052
    Top = 532
    Width = 88
    Height = 22
    Caption = '&Cancelar Item'
    Visible = False
    OnClick = spbCancelarItemClick
  end
  object spbCancelarVenda: TSpeedButton
    Left = 866
    Top = 560
    Width = 86
    Height = 22
    Caption = 'C&ancelar Venda'
    Visible = False
    OnClick = spbCancelarVendaClick
  end
  object spbConfirmarVenda: TSpeedButton
    Left = 1052
    Top = 560
    Width = 93
    Height = 22
    Caption = 'C&onfirmar Venda'
    Visible = False
    OnClick = spbConfirmarVendaClick
  end
  object spbConfirmarItem: TSpeedButton
    Left = 636
    Top = 616
    Width = 83
    Height = 22
    Caption = 'Co&nfirmar Item'
    Visible = False
    OnClick = spbConfirmarItemClick
  end
  object spbCapturarVenda: TSpeedButton
    Left = 415
    Top = 616
    Width = 88
    Height = 22
    Caption = 'Capturar Venda'
    Visible = False
    OnClick = spbCapturarVendaClick
  end
  object spbImprimirCupom: TSpeedButton
    Left = 958
    Top = 560
    Width = 88
    Height = 22
    Caption = 'Abrir cupom'
    Visible = False
    OnClick = spbImprimirCupomClick
  end
  object spbCancelarCupomFiscal: TSpeedButton
    Left = 852
    Top = 616
    Width = 88
    Height = 22
    Caption = 'Cancelar Cupom'
    Visible = False
    OnClick = spbCancelarCupomFiscalClick
  end
  object spbVenderItem: TSpeedButton
    Left = 958
    Top = 532
    Width = 88
    Height = 22
    Caption = 'Vender Item'
    Visible = False
    OnClick = spbVenderItemClick
  end
  object spbFecharCupom: TSpeedButton
    Left = 864
    Top = 523
    Width = 88
    Height = 22
    Caption = 'Fechar Cupom'
    Visible = False
    OnClick = spbFecharCupomClick
  end
  object spbReducaoZ: TSpeedButton
    Left = 321
    Top = 616
    Width = 88
    Height = 22
    Caption = 'Redu'#231#227'o Z'
    Visible = False
    OnClick = spbReducaoZClick
  end
  object spbCarregarAliquotas: TSpeedButton
    Left = 1052
    Top = 616
    Width = 96
    Height = 22
    Caption = 'Carregar Aliquotas'
    Visible = False
    OnClick = spbCarregarAliquotasClick
  end
  object SpeedButton1: TSpeedButton
    Left = 509
    Top = 616
    Width = 121
    Height = 22
    Caption = 'Abrir cupom n'#227'o fiscal'
    Visible = False
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 725
    Top = 616
    Width = 121
    Height = 22
    Caption = 'cancelar cupom'
    Visible = False
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 1035
    Top = 588
    Width = 113
    Height = 22
    Caption = 'teste vdo print'
    Visible = False
    OnClick = SpeedButton3Click
  end
  object spbCapturarDiversasComandas: TSpeedButton
    Left = 868
    Top = 588
    Width = 161
    Height = 22
    Caption = 'Capturar diversas comandas'
    Visible = False
    OnClick = spbCapturarDiversasComandasClick
  end
  object spbConsultarPreco: TSpeedButton
    Left = 946
    Top = 616
    Width = 100
    Height = 22
    Caption = 'Consultar Pre'#231'o'
    Visible = False
    OnClick = spbConsultarPrecoClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1236
    Height = 67
    Align = alTop
    ParentColor = True
    TabOrder = 2
    object Image2: TImage
      Left = 12
      Top = 10
      Width = 53
      Height = 47
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
        002808060000008CFEB86D000000097048597300000B1300000B1301009A9C18
        00000A4F6943435050686F746F73686F70204943432070726F66696C65000078
        DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A21
        09104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807E4
        21A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C
        9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173FD
        230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA42995C
        01808401C07491384B08801400407A8E42A600404601809D98265300A0040060
        CB6362E300502D0060277FE6D300809DF8997B01005B94211501A09100201365
        884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0B7
        00C0CE100BB200080C00305188852900047B0060C8232378008499001446F257
        3CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE49172B
        14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE0E
        AECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2F
        B31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370F8
        7E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3C
        FCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB7
        0BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525D2
        FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F700
        00F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E44
        242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC6036
        844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C051
        688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA8801
        628A58238E08179985F821C14804128B2420C9881451224B91354831528A5420
        55481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB543
        B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F
        3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB056
        AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A820
        1C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C23
        D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E5223
        E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE421
        F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52DD
        A8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D31A
        681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D861583
        C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F99
        6F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB54
        8FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67A8
        6F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B
        0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352
        F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB931
        655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A
        275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477
        BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806
        B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E184
        91B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE
        9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDF
        B7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB346
        AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806
        DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D
        5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613
        CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BD
        E44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E
        593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F91
        57ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8
        B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02FB
        F87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC
        90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C2785878557863F
        8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3E
        AA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDF
        FCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A96404C
        884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D8435C
        2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A
        9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC6585
        B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B26765
        5766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A586
        4B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD54F
        ABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D
        4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCABF
        99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40D
        DF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A4
        54F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB
        5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203
        FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D55
        8D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A
        429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794A
        F354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F
        6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6D
        EA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4
        BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727
        EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7
        068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA743
        CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5
        FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE4
        7C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB0000033549
        44415478DAD5995B884D5118C7BF41EEB9873CC82D728D1AF2666888071AB9DF
        2991BCF0424892104F5E1029F73B9978182133DEC4D44CAE11461E84DC468331
        19C7FF6F7D5BBB7DF6DEF63A679F39DBBF7E9DBDD6D97B9FFF5E6B7FDFFAF63E
        05A9544A2CD51AF404856002180DFA81B69EFDBE8117E02EB8092AC11B506FF3
        63051606DB80223007CC00ED2D2FAC0E5C04674105F81EA7C149602598CE633C
        DF3D05CFC17BD05CFB1A4137D01F0CF4ECCF1FBC040E806BD91AE4A86D05CB41
        6757FF3D701ADC06AFC15BF00534D3EF7F810EA007E805C682796084EB1C9FC0
        21B0256C34C30CF6D5AB9CE8EA7B0C76E895BF8B32F42E75D799D80806BBFAAF
        EBECD4D8181C004E8231DAAE057BC136B1BCC97DC420DB0C56838EDA77072C00
        CFA218EC2DE6662ED4F613B0065CCDD2985793C11E3048DB8C7206DFAB30838C
        4CDEC0C5DA7E04668A99DA5C88537D010CD1F60D3181581764701758A7DB0FC0
        EC1C9A739B3C0786697B3758EF6790A3560ADA89B9E7E64AFCD31A244EF71931
        F7E45750A2A3F9D7604B3109B4440F60A46E6A22738EB68B8970D181E282D0E0
        189CA29D34CA291D057E443C711FC5AB974A54B5025562A6BC4107AB8C0619F6
        07C122DD71A198141345234139E8E4E9FF0CC6836ACB5164AA39A1DBC7C10A1A
        645A79282682EF8B596F3FE6C11CD545CC3A3D5C4C240FA541A691F3BA03EF81
        9D7932E768839818A066D1E03E6CAC12B3C017EB158489A66A72648E1A272682
        5B80FD34C87A8DAB0693F23431954998B9721DC15C98A358FD5CD1CF4A1A6499
        D4155C06F3C5E4211B73D45A4B73D57A517E622E64A5C4CCF28106994E985E18
        3D8BC5D46B36E6321147BB22E03BD69B47C564953F7990B51853CD2935D8E873
        50558CE6FE659045EF3131B3591FD5E061B0345F069D2966625C22FE531CB749
        AB297682A44C4C595E1B72E22093CBC09198CCA705899366F8F033553FC3946B
        936969C649D43FC524EA5B114E12143471984C4BD4992C756169275B93694B5D
        A6C5422E4CFA160BD9945B6126F96C516A69D0B7DC62239B82352E0516AC22FF
        41C94F25FAA1C951A21F3BA9C43FB853897EF5E128D12F8F1C25FAF59BA344BF
        C0742BB1AF80BDA35924097D89EE5693FE0DF11BDAF4882E59C5497700000000
        49454E44AE426082}
      OnClick = Image2Click
    end
    object Label6: TLabel
      Left = 70
      Top = -6
      Width = 126
      Height = 74
      Caption = 'Caixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -56
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 1167
      Top = 1
      Width = 68
      Height = 65
      Align = alRight
      Alignment = taCenter
      Anchors = [akBottom]
      Caption = 'Vers'#227'o : 1.0.2'
      ExplicitHeight = 13
    end
    object spbRetirada: TcxButton
      Left = 212
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Retirada'
      LookAndFeel.NativeStyle = False
      TabOrder = 4
      OnClick = spbRetiradaClick
    end
    object spbAbrirCaixa: TcxButton
      Left = 212
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Abrir Caixa'
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnClick = spbAbrirCaixaClick
    end
    object spbReforco: TcxButton
      Left = 293
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Refor'#231'o'
      LookAndFeel.NativeStyle = False
      TabOrder = 1
      OnClick = spbReforcoClick
    end
    object spbFecharCaixa: TcxButton
      Left = 293
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Fechar Caixa'
      LookAndFeel.NativeStyle = False
      TabOrder = 2
      OnClick = spbFecharCaixaClick
    end
    object spbEfetuarPagamentoCliente: TcxButton
      Left = 374
      Top = 31
      Width = 154
      Height = 25
      Caption = 'Efetuar Pagamento Cliente'
      LookAndFeel.NativeStyle = False
      TabOrder = 3
      Visible = False
      OnClick = spbEfetuarPagamentoClienteClick
    end
    object btnTestarImpressao: TcxButton
      Left = 1033
      Top = 22
      Width = 105
      Height = 25
      Caption = 'Teste Impress'#227'o'
      Enabled = False
      TabOrder = 5
      Visible = False
      OnClick = btnTestarImpressaoClick
    end
    object cxExtrato: TcxButton
      Left = 374
      Top = 4
      Width = 154
      Height = 25
      Caption = '2'#170' Via do Extrato'
      LookAndFeel.NativeStyle = False
      TabOrder = 6
      OnClick = cxExtratoClick
    end
    object cxButton1: TcxButton
      Left = 534
      Top = 4
      Width = 96
      Height = 25
      Caption = 'Movimenta'#231#227'o'
      LookAndFeel.NativeStyle = False
      TabOrder = 7
      OnClick = cxButton1Click
    end
  end
  object Panel2: TPanel
    Left = 9
    Top = 419
    Width = 1218
    Height = 225
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      1218
      225)
    object Label1: TLabel
      Left = 1
      Top = 7
      Width = 88
      Height = 13
      Caption = #193'rea de pesquisa'
    end
    object Label2: TLabel
      Left = 264
      Top = 7
      Width = 111
      Height = 13
      Caption = 'Descri'#231#227'o do Produto'
    end
    object Label3: TLabel
      Left = 0
      Top = 71
      Width = 61
      Height = 13
      Caption = 'Quantidade'
    end
    object Label4: TLabel
      Left = 136
      Top = 71
      Width = 28
      Height = 13
      Caption = 'Pre'#231'o'
    end
    object Label5: TLabel
      Left = 112
      Top = 89
      Width = 18
      Height = 37
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 395
      Top = 71
      Width = 55
      Height = 13
      Caption = 'Valor Total'
    end
    object Label8: TLabel
      Left = 373
      Top = 83
      Width = 19
      Height = 37
      Caption = '='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 1
      Top = 209
      Width = 1216
      Height = 15
      Align = alBottom
      Caption = 
        'F1 = Iniciar venda / F2 = Cancelar Item / F3 = Consultar pre'#231'o /' +
        ' F5 = Cancelar Venda / F6 = Capturar Comanda / F7 = Cancelar Cup' +
        'om / F10 = Confirmar venda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 865
    end
    object Image1: TImage
      Left = 774
      Top = 3
      Width = 444
      Height = 223
      Anchors = [akLeft, akTop, akRight]
      Stretch = True
      ExplicitWidth = 356
    end
    object pnl1: TPanel
      Left = 3
      Top = 0
      Width = 1218
      Height = 225
      Anchors = [akLeft, akTop, akRight, akBottom]
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        1218
        225)
      object lbl1: TLabel
        Left = -2
        Top = 7
        Width = 88
        Height = 13
        Caption = #193'rea de pesquisa'
      end
      object lbl2: TLabel
        Left = 261
        Top = 7
        Width = 111
        Height = 13
        Caption = 'Descri'#231#227'o do Produto'
      end
      object lbl3: TLabel
        Left = 0
        Top = 71
        Width = 61
        Height = 13
        Caption = 'Quantidade'
      end
      object lbl4: TLabel
        Left = 136
        Top = 71
        Width = 28
        Height = 13
        Caption = 'Pre'#231'o'
      end
      object lbl5: TLabel
        Left = 112
        Top = 88
        Width = 18
        Height = 37
        Caption = 'X'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 395
        Top = 71
        Width = 55
        Height = 13
        Caption = 'Valor Total'
      end
      object lbl7: TLabel
        Left = 247
        Top = 84
        Width = 11
        Height = 37
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl8: TLabel
        Left = 508
        Top = 71
        Width = 48
        Height = 13
        Caption = 'Sub Total'
      end
      object img1: TImage
        Left = 781
        Top = 3
        Width = 444
        Height = 223
        Anchors = [akLeft, akTop, akRight]
        Stretch = True
        Visible = False
        ExplicitWidth = 356
      end
      object Label9: TLabel
        Left = 263
        Top = 71
        Width = 49
        Height = 13
        Caption = 'Desconto'
      end
      object edtPesquisa: TEdit
        Left = 1
        Top = 26
        Width = 252
        Height = 39
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
      object edtQuantidade: TEdit
        Left = 0
        Top = 90
        Width = 106
        Height = 31
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnExit = edtQuantidadeExit
        OnKeyDown = edtQuantidadeKeyDown
      end
      object edtPreco: TEdit
        Left = 136
        Top = 90
        Width = 106
        Height = 31
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnExit = edtPrecoExit
        OnKeyDown = edtPrecoKeyDown
      end
      object edtPrecoTotal: TEdit
        Left = 393
        Top = 90
        Width = 106
        Height = 31
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        OnExit = edtPrecoTotalExit
        OnKeyDown = edtPrecoTotalKeyDown
      end
      object edtSubTotal: TEdit
        Left = 505
        Top = 90
        Width = 130
        Height = 31
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '0,00'
        OnKeyDown = edtPrecoTotalKeyDown
      end
      object edtDescricao: TEdit
        Left = 264
        Top = 26
        Width = 497
        Height = 39
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnKeyDown = edtDescricaoKeyDown
      end
      object edtDesconto: TEdit
        Left = 264
        Top = 90
        Width = 106
        Height = 31
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnExit = edtDescontoExit
        OnKeyDown = edtDescontoKeyDown
      end
    end
  end
  object mVendaEnviar: TcxMemo
    Left = 7
    Top = 66
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Properties.ScrollBars = ssVertical
    Properties.OnChange = cxMemo1PropertiesChange
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebs3D
    Style.Color = clCream
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Height = 354
    Width = 1219
  end
  object cxMemo1: TcxMemo
    Left = 9
    Top = 62
    Anchors = [akLeft, akTop, akRight]
    ParentFont = False
    Properties.ScrollBars = ssVertical
    Properties.OnChange = cxMemo1PropertiesChange
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebs3D
    Style.Color = clCream
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.HotTrack = False
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 354
    Width = 1219
  end
  object VDOCaPrinter1: TVDOCaPrinter
    ShowDialog = False
    ShowPreview = False
    ShowProgress = True
    Title = 'VDOPrint Document'
    Font.Align = taLeftJustify
    Font.Color = clBlack
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Size = 10
    Font.Style = []
    LineSpacing = 10
    Orientation = poPortrait
    Paper.AutoNewPage = False
    Paper.Columns = 119
    Paper.Lines = 72
    Paper.MarginLeft = 0
    Paper.MarginRight = 0
    Left = 1088
    Top = 480
  end
  object ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    Site = 'http://www.projetoacbr.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    FormularioContinuo = True
    PosPrinter = ACBrPosPrinter1
    Left = 945
    Top = 291
  end
  object ACBrECF1: TACBrECF
    QuebraLinhaRodape = False
    Porta = 'COM1'
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 729
    Top = 291
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    Modelo = ppEscPosEpson
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    Left = 793
    Top = 283
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 672
    Top = 240
  end
  object ACBrSATExtratoFortes1: TACBrSATExtratoFortes
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 4.000000000000000000
    MargemSuperior = 2.000000000000000000
    MargemEsquerda = 2.000000000000000000
    MargemDireita = 2.000000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    ACBrSAT = ACBrSAT1
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    FormularioContinuo = True
    Left = 640
    Top = 352
  end
  object ACBrSAT1: TACBrSAT
    Extrato = ACBrSATExtratoFortes1
    Config.infCFe_versaoDadosEnt = 0.070000000000000010
    Config.ide_numeroCaixa = 0
    Config.ide_tpAmb = taHomologacao
    Config.emit_cRegTrib = RTSimplesNacional
    Config.emit_cRegTribISSQN = RTISSMicroempresaMunicipal
    Config.emit_indRatISSQN = irSim
    Config.EhUTF8 = False
    Config.PaginaDeCodigo = 0
    Config.XmlSignLib = xsNone
    ConfigArquivos.PrefixoArqCFe = 'AD'
    ConfigArquivos.PrefixoArqCFeCanc = 'ADC'
    Rede.tipoInter = infETHE
    Rede.seg = segNONE
    Rede.tipoLan = lanDHCP
    Rede.proxy = 0
    Rede.proxy_porta = 0
    Left = 752
    Top = 376
  end
end
