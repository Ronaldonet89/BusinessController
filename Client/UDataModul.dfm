object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 549
  Width = 1058
  object SQLConexao: TSQLConnection
    DriverName = 'Datasnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=16.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Connected = True
    Left = 32
    Top = 8
    UniqueId = '{177021FE-69E8-43A7-B2EB-9A1F85292F98}'
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = cdsProdutos
    Left = 125
    Top = 56
  end
  object DSProviderClient: TDSProviderConnection
    ServerClassName = 'TDSModuleDb'
    Connected = True
    SQLConnection = SQLConexao
    Left = 32
    Top = 56
  end
  object dsGruposProdutos: TDataSource
    AutoEdit = False
    DataSet = cdsGruposProdutos
    Left = 125
    Top = 160
  end
  object cdsGruposProdutos: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsGruposProdutosIndex1'
        Fields = 'GRUPO_PRODUTO_DESCRICAO'
      end>
    PacketRecords = 30
    Params = <>
    ProviderName = 'DSPGrupoProdutos'
    RemoteServer = DSProviderClient
    StoreDefs = True
    AfterInsert = cdsGruposProdutosAfterInsert
    AfterPost = cdsGruposProdutosAfterPost
    AfterDelete = cdsGruposProdutosAfterDelete
    Left = 125
    Top = 112
    object cdsGruposProdutosID_GRUPO_PRODUTO: TIntegerField
      FieldName = 'ID_GRUPO_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGruposProdutosGRUPO_PRODUTO_DESCRICAO: TStringField
      FieldName = 'GRUPO_PRODUTO_DESCRICAO'
      Size = 255
    end
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'DSPProdutos'
    RemoteServer = DSProviderClient
    AfterInsert = cdsProdutosAfterInsert
    AfterPost = cdsProdutosAfterPost
    AfterDelete = cdsProdutosAfterDelete
    Left = 125
    Top = 8
    object cdsProdutosPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      Required = True
    end
    object cdsProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 255
    end
    object cdsProdutosPRO_EAN13: TStringField
      FieldName = 'PRO_EAN13'
    end
    object cdsProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Size = 255
    end
    object cdsProdutosPRO_CAMINHO_IMAGEM: TStringField
      FieldName = 'PRO_CAMINHO_IMAGEM'
      Size = 255
    end
    object cdsProdutosPRO_SALDO: TFMTBCDField
      FieldName = 'PRO_SALDO'
      Precision = 18
      Size = 2
    end
    object cdsProdutosPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object cdsProdutosID_GRUPO_PRODUTO: TIntegerField
      FieldName = 'ID_GRUPO_PRODUTO'
    end
    object cdsProdutosALIQUOTA_ICMS: TIntegerField
      FieldName = 'ALIQUOTA_ICMS'
    end
    object cdsProdutosCODIGO_NCM: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 12
    end
    object cdsProdutosORIGEM_MERCADORIA: TStringField
      FieldName = 'ORIGEM_MERCADORIA'
      Size = 1
    end
    object cdsProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object cdsProdutosID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsProdutosCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object cdsProdutosCOR: TStringField
      FieldName = 'COR'
      Size = 50
    end
    object cdsProdutosTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 80
    end
    object cdsProdutosMINIMO: TFMTBCDField
      FieldName = 'MINIMO'
      Precision = 18
      Size = 2
    end
    object cdsProdutosMAXIMO: TFMTBCDField
      FieldName = 'MAXIMO'
      Precision = 18
      Size = 2
    end
    object cdsProdutosCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object cdsProdutosCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
  end
  object cdsPedidos: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'DSPPedidos'
    RemoteServer = DSProviderClient
    AfterInsert = cdsPedidosAfterInsert
    AfterPost = cdsPedidosAfterPost
    AfterDelete = cdsPedidosAfterDelete
    Left = 221
    Top = 8
    object cdsPedidosID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsPedidosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsPedidosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object cdsPedidosNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 255
    end
    object cdsPedidosDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object cdsPedidosHORA_PEDIDO: TDateField
      FieldName = 'HORA_PEDIDO'
    end
    object cdsPedidosDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object cdsPedidosDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object cdsPedidosFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object cdsPedidosCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 100
    end
    object cdsPedidosDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
    end
    object cdsPedidosFORMA_ENTREGA: TStringField
      FieldName = 'FORMA_ENTREGA'
      Size = 100
    end
    object cdsPedidosVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsPedidosVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsPedidosVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDATA_NF: TDateField
      FieldName = 'DATA_NF'
    end
    object cdsPedidosNUMERO_NF: TIntegerField
      FieldName = 'NUMERO_NF'
    end
    object cdsPedidosNUMERO_PARCELAS: TIntegerField
      FieldName = 'NUMERO_PARCELAS'
    end
    object cdsPedidosOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidosPERCENTUAL_ICMS: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsPedidosPERCENTUAL_IPI: TFMTBCDField
      FieldName = 'PERCENTUAL_IPI'
      Precision = 18
      Size = 2
    end
    object cdsPedidosVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsPedidosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
    object cdsPedidosTIPO_OPERACAO: TStringField
      FieldName = 'TIPO_OPERACAO'
      Size = 2
    end
    object cdsPedidosID_FORMA_DE_ENTREGA: TIntegerField
      FieldName = 'ID_FORMA_DE_ENTREGA'
    end
    object cdsPedidosID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
    end
    object cdsPedidosID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
    end
    object cdsPedidosID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object cdsPedidosID_ORCAMENTO: TIntegerField
      FieldName = 'ID_ORCAMENTO'
    end
    object cdsPedidosNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 255
    end
    object cdsPedidosDATA_DO_PARTO: TDateField
      FieldName = 'DATA_DO_PARTO'
    end
    object cdsPedidosNUMEROCUPOMFISCAL: TStringField
      FieldName = 'NUMEROCUPOMFISCAL'
      Size = 255
    end
    object cdsPedidosPEDIDO_JA_CAPTURADO_BALCAO: TStringField
      FieldName = 'PEDIDO_JA_CAPTURADO_BALCAO'
      Size = 1
    end
    object cdsPedidosNOME_DO_BEBE: TStringField
      FieldName = 'NOME_DO_BEBE'
      Size = 100
    end
    object cdsPedidosVALOR_TOTAL_PRODUTOS: TFMTBCDField
      FieldName = 'VALOR_TOTAL_PRODUTOS'
      Precision = 18
      Size = 2
    end
    object cdsPedidosPERCENTUAL_DESCONTO: TFMTBCDField
      FieldName = 'PERCENTUAL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsPedidosVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsPedidosID_USUARIO_EXCLUSAO: TIntegerField
      FieldName = 'ID_USUARIO_EXCLUSAO'
    end
    object cdsPedidosDATA_EXCLUSAO: TSQLTimeStampField
      FieldName = 'DATA_EXCLUSAO'
    end
    object cdsPedidosSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
    end
    object cdsPedidosID_PEDIDO_PAI: TIntegerField
      FieldName = 'ID_PEDIDO_PAI'
    end
    object cdsPedidosNUMERO_COMANDA: TStringField
      FieldName = 'NUMERO_COMANDA'
      Size = 100
    end
    object cdsPedidosPEDIDO_EM_VENDA: TStringField
      FieldName = 'PEDIDO_EM_VENDA'
      Size = 1
    end
    object cdsPedidosDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object cdsPedidosNUMERO_CUPOM: TStringField
      FieldName = 'NUMERO_CUPOM'
      Size = 100
    end
  end
  object DSPedidos: TDataSource
    AutoEdit = False
    DataSet = cdsPedidos
    Left = 221
    Top = 56
  end
  object dsPedidos_Itens: TDataSource
    AutoEdit = False
    DataSet = cdsPedidos_Itens
    Left = 221
    Top = 160
  end
  object cdsPedidos_Itens: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    MasterSource = DSPedidos
    PacketRecords = 30
    Params = <>
    ProviderName = 'DSPPedidosItens'
    RemoteServer = DSProviderClient
    AfterInsert = cdsPedidos_ItensAfterInsert
    AfterPost = cdsPedidos_ItensAfterPost
    AfterDelete = cdsPedidos_ItensAfterDelete
    Left = 221
    Top = 112
    object cdsPedidos_ItensID_PEDIDO_ITEM: TIntegerField
      FieldName = 'ID_PEDIDO_ITEM'
      Required = True
    end
    object cdsPedidos_ItensID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsPedidos_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsPedidos_ItensDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 255
    end
    object cdsPedidos_ItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidos_ItensVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidos_ItensVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidos_ItensALIQUOTA_ICMS: TIntegerField
      FieldName = 'ALIQUOTA_ICMS'
    end
    object cdsPedidos_ItensDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object cdsPedidos_ItensCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 200
    end
    object cdsPedidos_ItensCOR: TStringField
      FieldName = 'COR'
      Size = 50
    end
    object cdsPedidos_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 80
    end
  end
  object dsNotasFiscais: TDataSource
    AutoEdit = False
    DataSet = cdsNotasFiscais
    Left = 528
    Top = 264
  end
  object cdsMovimentacoes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_MOVIMENTACAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_PEDIDO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_PRODUTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'HORA'
        Attributes = [faRequired]
        DataType = ftTime
      end
      item
        Name = 'QTDE_ANTERIOR'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'QTDE_MOVIMENTADA'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'QTDE_APOS_MOVIMENTACAO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'TIPO_MOVIMENTACAO'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'cdsMovimentacoesIndex1'
        Fields = 'ID_MOVIMENTACAO'
      end>
    IndexFieldNames = 'ID_MOVIMENTACAO'
    PacketRecords = 30
    Params = <>
    ProviderName = 'DSPMovimentacao'
    RemoteServer = DSProviderClient
    StoreDefs = True
    Left = 125
    Top = 216
    object cdsMovimentacoesID_MOVIMENTACAO: TIntegerField
      FieldName = 'ID_MOVIMENTACAO'
      Required = True
    end
    object cdsMovimentacoesID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsMovimentacoesID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsMovimentacoesDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object cdsMovimentacoesHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object cdsMovimentacoesQTDE_ANTERIOR: TFMTBCDField
      FieldName = 'QTDE_ANTERIOR'
      Precision = 18
      Size = 2
    end
    object cdsMovimentacoesQTDE_MOVIMENTADA: TFMTBCDField
      FieldName = 'QTDE_MOVIMENTADA'
      Precision = 18
      Size = 2
    end
    object cdsMovimentacoesQTDE_APOS_MOVIMENTACAO: TFMTBCDField
      FieldName = 'QTDE_APOS_MOVIMENTACAO'
      Precision = 18
      Size = 2
    end
    object cdsMovimentacoesTIPO_MOVIMENTACAO: TStringField
      FieldName = 'TIPO_MOVIMENTACAO'
      Size = 100
    end
  end
  object dsMovimentacoes: TDataSource
    AutoEdit = False
    DataSet = cdsMovimentacoes
    Left = 125
    Top = 264
  end
  object cdsFornecedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPFornecedores'
    RemoteServer = DSProviderClient
    AfterInsert = cdsFornecedoresAfterInsert
    AfterPost = cdsFornecedoresAfterPost
    AfterDelete = cdsFornecedoresAfterDelete
    Left = 32
    Top = 112
    object cdsFornecedoresID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Required = True
    end
    object cdsFornecedoresRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 255
    end
    object cdsFornecedoresCPF: TStringField
      FieldName = 'CPF'
    end
    object cdsFornecedoresCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsFornecedoresRG: TStringField
      FieldName = 'RG'
    end
    object cdsFornecedoresINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object cdsFornecedoresCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 255
    end
    object cdsFornecedoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object cdsFornecedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 100
    end
    object cdsFornecedoresCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 100
    end
    object cdsFornecedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 255
    end
    object cdsFornecedoresNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsFornecedoresCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 255
    end
    object cdsFornecedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 255
    end
    object cdsFornecedoresCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsFornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 255
    end
    object cdsFornecedoresESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 100
    end
    object cdsFornecedoresOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFornecedoresTIPO_FORNECEDOR: TStringField
      FieldName = 'TIPO_FORNECEDOR'
      Size = 30
    end
    object cdsFornecedoresFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 255
    end
    object cdsFornecedoresUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object dsFornecedores: TDataSource
    AutoEdit = False
    DataSet = cdsFornecedores
    Left = 32
    Top = 160
  end
  object cdsNotasFiscaisItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPNotasFiscaisItens'
    RemoteServer = DSProviderClient
    AfterInsert = cdsNotasFiscaisItensAfterInsert
    BeforePost = cdsNotasFiscaisItensBeforePost
    AfterPost = cdsNotasFiscaisItensAfterPost
    AfterDelete = cdsNotasFiscaisItensAfterDelete
    Left = 525
    Top = 321
    object cdsNotasFiscaisItensID_NOTA_FISCAL_ITEM: TIntegerField
      FieldName = 'ID_NOTA_FISCAL_ITEM'
      Required = True
    end
    object cdsNotasFiscaisItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsNotasFiscaisItensID_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
      Required = True
    end
    object cdsNotasFiscaisItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object cdsNotasFiscaisItensCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 4
    end
    object cdsNotasFiscaisItensPERCENTUAL_ICMS: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 4
    end
    object cdsNotasFiscaisItensPERCENTUAL_IPI: TFMTBCDField
      FieldName = 'PERCENTUAL_IPI'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 4
    end
    object cdsNotasFiscaisItensPERCENTUAL_PIS: TFMTBCDField
      FieldName = 'PERCENTUAL_PIS'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_PIS: TFMTBCDField
      FieldName = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 4
    end
    object cdsNotasFiscaisItensPERCENTUAL_COFINS: TFMTBCDField
      FieldName = 'PERCENTUAL_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_COFINS: TFMTBCDField
      FieldName = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 255
    end
    object cdsNotasFiscaisItensCODIGO_PRODUTO: TStringField
      FieldName = 'CODIGO_PRODUTO'
      Size = 255
    end
    object cdsNotasFiscaisItensNCM_PRODUTO: TStringField
      FieldName = 'NCM_PRODUTO'
      Size = 15
    end
    object cdsNotasFiscaisItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensINFORMACOES_ADICIONAIS: TStringField
      FieldName = 'INFORMACOES_ADICIONAIS'
      Size = 255
    end
    object cdsNotasFiscaisItensBASE_CALCULO_ICMS: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensCST_ICMS_ST: TStringField
      FieldName = 'CST_ICMS_ST'
      Size = 4
    end
    object cdsNotasFiscaisItensPERCENTUAL_ICMS_ST: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_ICMS_ST: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensBASE_CALCULO_ICMS_ST: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensBASE_CALCULO_IPI: TFMTBCDField
      FieldName = 'BASE_CALCULO_IPI'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensBASE_CALCULO_COFINS: TFMTBCDField
      FieldName = 'BASE_CALCULO_COFINS'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensEAN13: TStringField
      FieldName = 'EAN13'
    end
    object cdsNotasFiscaisItensCOR: TStringField
      FieldName = 'COR'
      Size = 50
    end
    object cdsNotasFiscaisItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 80
    end
  end
  object dsNotasFiscaisItens: TDataSource
    AutoEdit = False
    DataSet = cdsNotasFiscaisItens
    Left = 528
    Top = 376
  end
  object cdsPedidosDeCompraItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPedidosDeCompraItens'
    RemoteServer = DSProviderClient
    AfterInsert = cdsPedidosDeCompraItensAfterInsert
    AfterPost = cdsPedidosDeCompraItensAfterPost
    AfterDelete = cdsPedidosDeCompraItensAfterDelete
    Left = 526
    Top = 112
    object cdsPedidosDeCompraItensID_PEDIDO_DE_COMPRA_ITEM: TIntegerField
      FieldName = 'ID_PEDIDO_DE_COMPRA_ITEM'
      Required = True
    end
    object cdsPedidosDeCompraItensID_PEDIDO_DE_COMPRA: TIntegerField
      FieldName = 'ID_PEDIDO_DE_COMPRA'
      Required = True
    end
    object cdsPedidosDeCompraItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsPedidosDeCompraItensDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 255
    end
    object cdsPedidosDeCompraItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraItensVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraItensVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraItensALIQUOTA_ICMS: TIntegerField
      FieldName = 'ALIQUOTA_ICMS'
    end
  end
  object dsPedidosDeCompraItens: TDataSource
    AutoEdit = False
    DataSet = cdsPedidosDeCompraItens
    Left = 526
    Top = 168
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPClientes'
    RemoteServer = DSProviderClient
    AfterInsert = cdsClientesAfterInsert
    AfterPost = cdsClientesAfterPost
    AfterDelete = cdsClientesAfterDelete
    Left = 221
    Top = 216
    object cdsClientesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object cdsClientesRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 255
    end
    object cdsClientesFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 255
    end
    object cdsClientesCPF: TStringField
      FieldName = 'CPF'
    end
    object cdsClientesCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsClientesINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object cdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 255
    end
    object cdsClientesNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 255
    end
    object cdsClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 100
    end
    object cdsClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 100
    end
    object cdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsClientesEMAIL_DANFE: TStringField
      FieldName = 'EMAIL_DANFE'
      Size = 100
    end
    object cdsClientesSITUACAO_APURACAO: TStringField
      FieldName = 'SITUACAO_APURACAO'
    end
    object cdsClientesCONSUMIDOR_FINAL: TStringField
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object cdsClientesPOSSUI_SUFRAMA: TStringField
      FieldName = 'POSSUI_SUFRAMA'
      Size = 1
    end
    object cdsClientesCODIGO_SUFRAMA: TStringField
      FieldName = 'CODIGO_SUFRAMA'
      Size = 50
    end
    object cdsClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsClientesID_TRANSPORTADOR: TIntegerField
      FieldName = 'ID_TRANSPORTADOR'
    end
    object cdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsClientesCODMUNICIPIO: TIntegerField
      FieldName = 'CODMUNICIPIO'
    end
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = cdsClientes
    Left = 221
    Top = 272
  end
  object cdsNotasFiscais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPNotasFiscais'
    RemoteServer = DSProviderClient
    AfterInsert = cdsNotasFiscaisAfterInsert
    AfterPost = cdsNotasFiscaisAfterPost
    AfterDelete = cdsNotasFiscaisAfterDelete
    Left = 528
    Top = 216
    object cdsNotasFiscaisID_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
      Required = True
    end
    object cdsNotasFiscaisID_TRANSPORTADOR: TIntegerField
      FieldName = 'ID_TRANSPORTADOR'
    end
    object cdsNotasFiscaisID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsNotasFiscaisID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object cdsNotasFiscaisID_NATUREZA_OPERACAO: TIntegerField
      FieldName = 'ID_NATUREZA_OPERACAO'
      Required = True
    end
    object cdsNotasFiscaisDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object cdsNotasFiscaisDATA_SAIDA_ENTRADA: TDateField
      FieldName = 'DATA_SAIDA_ENTRADA'
    end
    object cdsNotasFiscaisHORA_SAIDA_ENTRADA: TTimeField
      FieldName = 'HORA_SAIDA_ENTRADA'
    end
    object cdsNotasFiscaisENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
    end
    object cdsNotasFiscaisTIPO_EMISSAO: TStringField
      FieldName = 'TIPO_EMISSAO'
      Size = 100
    end
    object cdsNotasFiscaisINFORMACAO_NFE: TStringField
      FieldName = 'INFORMACAO_NFE'
      Size = 100
    end
    object cdsNotasFiscaisBASE_CALCULO_ICMS: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_ST: TFMTBCDField
      FieldName = 'VALOR_ST'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_PRODUTOS: TFMTBCDField
      FieldName = 'VALOR_PRODUTOS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_IMPOSTO_IMPORTACAO: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO_IMPORTACAO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_PIS: TFMTBCDField
      FieldName = 'VALOR_PIS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_COFINS: TFMTBCDField
      FieldName = 'VALOR_COFINS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_OUTROS: TFMTBCDField
      FieldName = 'VALOR_OUTROS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisVALOR_TOTAL_NOTA: TFMTBCDField
      FieldName = 'VALOR_TOTAL_NOTA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object cdsNotasFiscaisESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 100
    end
    object cdsNotasFiscaisMARCA: TStringField
      FieldName = 'MARCA'
      Size = 100
    end
    object cdsNotasFiscaisNUMERO_VOLUME: TStringField
      FieldName = 'NUMERO_VOLUME'
      Size = 10
    end
    object cdsNotasFiscaisPESO_LIQUIDO: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisPESO_BRUTO: TFMTBCDField
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
    end
    object cdsNotasFiscaisNUMERO_PROTOCOLO_RECEBIMENTO: TStringField
      FieldName = 'NUMERO_PROTOCOLO_RECEBIMENTO'
      Size = 255
    end
    object cdsNotasFiscaisMOTIVO_RECEBIMENTO: TStringField
      FieldName = 'MOTIVO_RECEBIMENTO'
      Size = 255
    end
    object cdsNotasFiscaisRESPONSAVEL_FRETE: TStringField
      FieldName = 'RESPONSAVEL_FRETE'
      Size = 1
    end
    object cdsNotasFiscaisDATA_HORA_RECEBIMENTO: TStringField
      FieldName = 'DATA_HORA_RECEBIMENTO'
      Size = 100
    end
    object cdsNotasFiscaisNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 255
    end
    object cdsNotasFiscaisFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object cdsNotasFiscaisCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 100
    end
    object cdsNotasFiscaisNUMERO_PARCELAS: TIntegerField
      FieldName = 'NUMERO_PARCELAS'
    end
    object cdsNotasFiscaisNATUREZA_DE_OPERACAO: TStringField
      FieldName = 'NATUREZA_DE_OPERACAO'
      Size = 60
    end
    object cdsNotasFiscaisNFE_CALCULADA: TStringField
      FieldName = 'NFE_CALCULADA'
      Size = 1
    end
    object cdsNotasFiscaisCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object cdsNotasFiscaisCFOPDESCRICAO: TStringField
      FieldName = 'CFOPDESCRICAO'
    end
    object cdsNotasFiscaisDATA_HORA_CANCELAMENTO: TStringField
      FieldName = 'DATA_HORA_CANCELAMENTO'
      Size = 100
    end
    object cdsNotasFiscaisMOTIVO_CANCELAMENTO: TStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 255
    end
  end
  object cdsPagar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPagar'
    RemoteServer = DSProviderClient
    AfterInsert = cdsPagarAfterInsert
    AfterPost = cdsPagarAfterPost
    AfterDelete = cdsPagarAfterDelete
    Left = 309
    Top = 112
    object cdsPagarID_PAGAR: TIntegerField
      FieldName = 'ID_PAGAR'
      Required = True
    end
    object cdsPagarDESCRICAO_TITULO: TStringField
      FieldName = 'DESCRICAO_TITULO'
      Size = 255
    end
    object cdsPagarID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsPagarID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsPagarNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 255
    end
    object cdsPagarVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsPagarDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object cdsPagarVALOR_TITULO: TFMTBCDField
      FieldName = 'VALOR_TITULO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPagarVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPagarNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      Size = 100
    end
    object cdsPagarFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object cdsPagarSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
  end
  object dsPagar: TDataSource
    AutoEdit = False
    DataSet = cdsPagar
    Left = 309
    Top = 160
  end
  object cdsTransportadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTransportadores'
    RemoteServer = DSProviderClient
    AfterInsert = cdsTransportadoresAfterInsert
    AfterPost = cdsTransportadoresAfterPost
    AfterDelete = cdsTransportadoresAfterDelete
    Left = 32
    Top = 320
    object cdsTransportadoresID_TRANSPORTADOR: TIntegerField
      FieldName = 'ID_TRANSPORTADOR'
      Required = True
    end
    object cdsTransportadoresCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsTransportadoresINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object cdsTransportadoresRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 255
    end
    object cdsTransportadoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 255
    end
    object cdsTransportadoresNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsTransportadoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object cdsTransportadoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsTransportadoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 100
    end
    object cdsTransportadoresUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsTransportadoresCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsTransportadoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsTransportadoresFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 255
    end
  end
  object dsTransportadores: TDataSource
    AutoEdit = False
    DataSet = cdsTransportadores
    Left = 32
    Top = 368
  end
  object cdsCheques: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCheques'
    RemoteServer = DSProviderClient
    Left = 432
    Top = 216
    object cdsChequesID_CHEQUE: TIntegerField
      FieldName = 'ID_CHEQUE'
      Required = True
    end
    object cdsChequesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsChequesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 255
    end
    object cdsChequesID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsChequesORIGEM_CHEQUE: TStringField
      FieldName = 'ORIGEM_CHEQUE'
      Size = 255
    end
    object cdsChequesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsChequesSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
    object cdsChequesDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object cdsChequesBANCO: TStringField
      FieldName = 'BANCO'
      Size = 255
    end
    object cdsChequesAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 50
    end
    object cdsChequesDIGTO_AGENCIA: TStringField
      FieldName = 'DIGTO_AGENCIA'
      Size = 50
    end
    object cdsChequesCONTA: TStringField
      FieldName = 'CONTA'
      Size = 50
    end
    object cdsChequesDIGITO_CONTA: TStringField
      FieldName = 'DIGITO_CONTA'
      Size = 50
    end
    object cdsChequesEMITIDO_RECEBIDO: TStringField
      FieldName = 'EMITIDO_RECEBIDO'
      Size = 50
    end
    object cdsChequesNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      Size = 100
    end
  end
  object cdsReceber: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPReceber'
    RemoteServer = DSProviderClient
    AfterInsert = cdsReceberAfterInsert
    AfterPost = cdsReceberAfterPost
    AfterDelete = cdsReceberAfterDelete
    Left = 309
    Top = 8
    object cdsReceberID_RECEBER: TIntegerField
      FieldName = 'ID_RECEBER'
      Required = True
    end
    object cdsReceberDESCRICAO_TITULO: TStringField
      FieldName = 'DESCRICAO_TITULO'
      Size = 255
    end
    object cdsReceberID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsReceberID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsReceberNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 255
    end
    object cdsReceberVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsReceberDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object cdsReceberVALOR_TITULO: TFMTBCDField
      FieldName = 'VALOR_TITULO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsReceberVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsReceberNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      Size = 100
    end
    object cdsReceberFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object cdsReceberSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
  end
  object dsCheques: TDataSource
    AutoEdit = False
    DataSet = cdsCheques
    Left = 432
    Top = 272
  end
  object dsReceber: TDataSource
    AutoEdit = False
    DataSet = cdsReceber
    Left = 309
    Top = 57
  end
  object cdsGenerico: TClientDataSet
    Aggregates = <>
    Filter = '-'
    Params = <>
    ProviderName = 'DSPGenerico'
    RemoteServer = DSProviderClient
    Left = 32
    Top = 217
  end
  object dsGenerico: TDataSource
    AutoEdit = False
    DataSet = cdsGenerico
    Left = 32
    Top = 264
  end
  object cdsDuplicatasNotasFiscais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPDuplicatasNotasFiscais'
    RemoteServer = DSProviderClient
    AfterInsert = cdsDuplicatasNotasFiscaisAfterInsert
    AfterPost = cdsDuplicatasNotasFiscaisAfterPost
    AfterDelete = cdsDuplicatasNotasFiscaisAfterDelete
    Left = 176
    Top = 320
    object cdsDuplicatasNotasFiscaisID_DUPLICATA_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_DUPLICATA_NOTA_FISCAL'
      Required = True
    end
    object cdsDuplicatasNotasFiscaisNUMERO_FATURA: TIntegerField
      FieldName = 'NUMERO_FATURA'
    end
    object cdsDuplicatasNotasFiscaisVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object cdsDuplicatasNotasFiscaisVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsDuplicatasNotasFiscaisID_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
      Required = True
    end
  end
  object dsDuplicatasNotasFiscais: TDataSource
    AutoEdit = False
    DataSet = cdsDuplicatasNotasFiscais
    Left = 176
    Top = 367
  end
  object cdsPedidosDeCompra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPedidosDeCompra'
    RemoteServer = DSProviderClient
    AfterInsert = cdsPedidosDeCompraAfterInsert
    AfterPost = cdsPedidosDeCompraAfterPost
    AfterDelete = cdsPedidosDeCompraAfterDelete
    Left = 520
    Top = 8
    object cdsPedidosDeCompraID_PEDIDO_DE_COMPRA: TIntegerField
      FieldName = 'ID_PEDIDO_DE_COMPRA'
      Required = True
    end
    object cdsPedidosDeCompraID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsPedidosDeCompraID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object cdsPedidosDeCompraDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object cdsPedidosDeCompraHORA_PEDIDO: TDateField
      FieldName = 'HORA_PEDIDO'
    end
    object cdsPedidosDeCompraDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object cdsPedidosDeCompraDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object cdsPedidosDeCompraFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object cdsPedidosDeCompraCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 100
    end
    object cdsPedidosDeCompraDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
    end
    object cdsPedidosDeCompraFORMA_ENTREGA: TStringField
      FieldName = 'FORMA_ENTREGA'
      Size = 100
    end
    object cdsPedidosDeCompraVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraDATA_NF: TDateField
      FieldName = 'DATA_NF'
    end
    object cdsPedidosDeCompraNUMERO_NF: TIntegerField
      FieldName = 'NUMERO_NF'
    end
    object cdsPedidosDeCompraNUMERO_PARCELAS: TIntegerField
      FieldName = 'NUMERO_PARCELAS'
    end
    object cdsPedidosDeCompraOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPedidosDeCompraPERCENTUAL_ICMS: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraPERCENTUAL_IPI: TFMTBCDField
      FieldName = 'PERCENTUAL_IPI'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsPedidosDeCompraSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
    object cdsPedidosDeCompraNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 255
    end
  end
  object dsPedidosDeCompra: TDataSource
    AutoEdit = False
    DataSet = cdsPedidosDeCompra
    Left = 520
    Top = 63
  end
  object cdsProdutosMateriasPrimas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPProdutosMateriasPrimas'
    RemoteServer = DSProviderClient
    AfterInsert = cdsProdutosMateriasPrimasAfterInsert
    AfterPost = cdsProdutosMateriasPrimasAfterPost
    AfterDelete = cdsProdutosMateriasPrimasAfterDelete
    Left = 320
    Top = 216
    object cdsProdutosMateriasPrimasID_PRODUTO_MATERIA_PRIMA: TIntegerField
      FieldName = 'ID_PRODUTO_MATERIA_PRIMA'
      Required = True
    end
    object cdsProdutosMateriasPrimasID_MATERIA_PRIMA: TIntegerField
      FieldName = 'ID_MATERIA_PRIMA'
      Required = True
    end
    object cdsProdutosMateriasPrimasID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsProdutosMateriasPrimasQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object cdsProdutosMateriasPrimasDESCRICAO_MATERIA_PRIMA: TStringField
      FieldName = 'DESCRICAO_MATERIA_PRIMA'
      Size = 255
    end
  end
  object dsProdutosMateriasPrimas: TDataSource
    AutoEdit = False
    DataSet = cdsProdutosMateriasPrimas
    Left = 320
    Top = 272
  end
  object cdsTiposDeOperacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTipoOperacao'
    RemoteServer = DSProviderClient
    AfterInsert = cdsTiposDeOperacaoAfterInsert
    AfterDelete = cdsTiposDeOperacaoAfterDelete
    Left = 661
    Top = 9
    object cdsTiposDeOperacaoID_TIPO_OPERACAO: TIntegerField
      FieldName = 'ID_TIPO_OPERACAO'
      Required = True
    end
    object cdsTiposDeOperacaoCFOP_DENTRO_ESTADO: TStringField
      FieldName = 'CFOP_DENTRO_ESTADO'
      Size = 4
    end
    object cdsTiposDeOperacaoCFOP_FORA_ESTADO: TStringField
      FieldName = 'CFOP_FORA_ESTADO'
      Size = 4
    end
    object cdsTiposDeOperacaoCFOP_DENTRO_ESTADO_COM_ST: TStringField
      FieldName = 'CFOP_DENTRO_ESTADO_COM_ST'
      Size = 4
    end
    object cdsTiposDeOperacaoCFOP_FORA_ESTADO_COM_ST: TStringField
      FieldName = 'CFOP_FORA_ESTADO_COM_ST'
      Size = 4
    end
    object cdsTiposDeOperacaoCST_ICMS_NORMAL: TStringField
      FieldName = 'CST_ICMS_NORMAL'
      Size = 4
    end
    object cdsTiposDeOperacaoCST_ICMS_COM_ST: TStringField
      FieldName = 'CST_ICMS_COM_ST'
      Size = 4
    end
    object cdsTiposDeOperacaoCST_ICMS_COM_REDUCAO: TStringField
      FieldName = 'CST_ICMS_COM_REDUCAO'
      Size = 4
    end
    object cdsTiposDeOperacaoCST_ICMS_COM_ST_E_REDUCAO: TStringField
      FieldName = 'CST_ICMS_COM_ST_E_REDUCAO'
      Size = 4
    end
    object cdsTiposDeOperacaoCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 4
    end
    object cdsTiposDeOperacaoCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 4
    end
    object cdsTiposDeOperacaoCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 4
    end
    object cdsTiposDeOperacaoDESCRICAO_TIPO_OPERACAO: TStringField
      FieldName = 'DESCRICAO_TIPO_OPERACAO'
      Size = 60
    end
    object cdsTiposDeOperacaoALIQUOTA_PIS: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS'
      Size = 18
    end
    object cdsTiposDeOperacaoALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Size = 18
    end
    object cdsTiposDeOperacaoALIQUOTA_IPI: TFMTBCDField
      FieldName = 'ALIQUOTA_IPI'
      Size = 18
    end
  end
  object dsTiposDeOperacao: TDataSource
    AutoEdit = False
    DataSet = cdsTiposDeOperacao
    Left = 664
    Top = 64
  end
  object cdsConveniosNCM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConveniosNCM'
    RemoteServer = DSProviderClient
    AfterInsert = cdsConveniosNCMAfterInsert
    AfterPost = cdsConveniosNCMAfterPost
    AfterDelete = cdsConveniosNCMAfterDelete
    Left = 661
    Top = 113
    object cdsConveniosNCMID_CONVENIO_NCM: TIntegerField
      FieldName = 'ID_CONVENIO_NCM'
      Required = True
    end
    object cdsConveniosNCMCODIGO_NCM: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 15
    end
    object cdsConveniosNCMUF_DESTINO: TStringField
      FieldName = 'UF_DESTINO'
      Size = 2
    end
    object cdsConveniosNCMPERCENTUAL_IVA: TFMTBCDField
      FieldName = 'PERCENTUAL_IVA'
      Precision = 18
      Size = 2
    end
    object cdsConveniosNCMALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object cdsConveniosNCMPERCENTUAL_REDUCAO: TFMTBCDField
      FieldName = 'PERCENTUAL_REDUCAO'
      Precision = 18
      Size = 2
    end
    object cdsConveniosNCMALIQUOTA_IPI: TFMTBCDField
      FieldName = 'ALIQUOTA_IPI'
      Precision = 18
      Size = 2
    end
  end
  object dsConveniosNCM: TDataSource
    AutoEdit = False
    DataSet = cdsConveniosNCM
    Left = 664
    Top = 168
  end
  object cdsFormasDePagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPFormasDePagamento'
    RemoteServer = DSProviderClient
    AfterInsert = cdsFormasDePagamentoAfterInsert
    AfterPost = cdsFormasDePagamentoAfterPost
    AfterDelete = cdsFormasDePagamentoAfterDelete
    Left = 664
    Top = 220
    object cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
      Required = True
    end
    object cdsFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object cdsFormasDePagamentoPERMITE_TROCO: TStringField
      FieldName = 'PERMITE_TROCO'
      Size = 1
    end
    object cdsFormasDePagamentoEFETUA_MOVIMENTACAO_CLIENTE: TStringField
      FieldName = 'EFETUA_MOVIMENTACAO_CLIENTE'
      Size = 1
    end
    object cdsFormasDePagamentoEFETUA_REALIZACAO_DO_TITULO: TStringField
      FieldName = 'EFETUA_REALIZACAO_DO_TITULO'
      Size = 1
    end
    object cdsFormasDePagamentoEFETUA_MOVIMENTACAO_CAIXA: TStringField
      FieldName = 'EFETUA_MOVIMENTACAO_CAIXA'
      Size = 1
    end
    object cdsFormasDePagamentoORDEM_IMPRESSORA_FISCAL: TIntegerField
      FieldName = 'ORDEM_IMPRESSORA_FISCAL'
    end
  end
  object dsFormasDePagamento: TDataSource
    AutoEdit = False
    DataSet = cdsFormasDePagamento
    Left = 667
    Top = 275
  end
  object cdsCondicoesDePagamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCondicoesDePagamento'
    RemoteServer = DSProviderClient
    AfterInsert = cdsCondicoesDePagamentoAfterInsert
    AfterPost = cdsCondicoesDePagamentoAfterPost
    AfterDelete = cdsCondicoesDePagamentoAfterDelete
    Left = 664
    Top = 324
    object cdsCondicoesDePagamentoID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
      Required = True
    end
    object cdsCondicoesDePagamentoCONDICAO_DE_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_DE_PAGAMENTO'
      Size = 100
    end
    object cdsCondicoesDePagamentoNUMERO_DE_PARCELAS: TIntegerField
      FieldName = 'NUMERO_DE_PARCELAS'
    end
  end
  object dsCondicoesDePagamento: TDataSource
    AutoEdit = False
    DataSet = cdsCondicoesDePagamento
    Left = 667
    Top = 379
  end
  object cdsFormasDeEntrega: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPFormasDeEntrega'
    RemoteServer = DSProviderClient
    AfterInsert = cdsFormasDeEntregaAfterInsert
    AfterPost = cdsFormasDeEntregaAfterPost
    AfterDelete = cdsFormasDeEntregaAfterDelete
    Left = 312
    Top = 320
    object cdsFormasDeEntregaID_FORMA_DE_ENTREGA: TIntegerField
      FieldName = 'ID_FORMA_DE_ENTREGA'
      Required = True
    end
    object cdsFormasDeEntregaFORMA_DE_ENTREGA: TStringField
      FieldName = 'FORMA_DE_ENTREGA'
      Size = 100
    end
  end
  object dsFormasDeEntrega: TDataSource
    AutoEdit = False
    DataSet = cdsFormasDeEntrega
    Left = 315
    Top = 375
  end
  object cdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPVendedores'
    RemoteServer = DSProviderClient
    AfterInsert = cdsVendedoresAfterInsert
    AfterPost = cdsVendedoresAfterPost
    AfterDelete = cdsVendedoresAfterDelete
    Left = 32
    Top = 428
    object cdsVendedoresID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
      Required = True
    end
    object cdsVendedoresPERCENTUAL_COMISSAO: TFMTBCDField
      FieldName = 'PERCENTUAL_COMISSAO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendedoresNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 200
    end
  end
  object dsVendedores: TDataSource
    AutoEdit = False
    DataSet = cdsVendedores
    Left = 35
    Top = 483
  end
  object cdsPedidos_Formas_Condicoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPedidos_Formas_Condicoes'
    RemoteServer = DSProviderClient
    AfterInsert = cdsPedidos_Formas_CondicoesAfterInsert
    AfterPost = cdsPedidos_Formas_CondicoesAfterPost
    AfterDelete = cdsPedidos_Formas_CondicoesAfterDelete
    Left = 200
    Top = 428
    object cdsPedidos_Formas_CondicoesID_PEDIDO_FORMA_CONDICAO: TIntegerField
      FieldName = 'ID_PEDIDO_FORMA_CONDICAO'
      Required = True
    end
    object cdsPedidos_Formas_CondicoesID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
      Required = True
    end
    object cdsPedidos_Formas_CondicoesID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
      Required = True
    end
    object cdsPedidos_Formas_CondicoesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsPedidos_Formas_CondicoesDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object cdsPedidos_Formas_CondicoesCONDICAO_DE_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_DE_PAGAMENTO'
      Size = 255
    end
    object cdsPedidos_Formas_CondicoesID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
  end
  object dsPedidos_Formas_Condicoes: TDataSource
    AutoEdit = False
    DataSet = cdsPedidos_Formas_Condicoes
    Left = 203
    Top = 483
  end
  object cdsFormasVSCondicoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPFormasVSCondicoes'
    RemoteServer = DSProviderClient
    AfterInsert = cdsFormasVSCondicoesAfterInsert
    AfterPost = cdsFormasVSCondicoesAfterPost
    AfterDelete = cdsFormasVSCondicoesAfterDelete
    Left = 384
    Top = 428
    object cdsFormasVSCondicoesID_FORMA_VS_CONDICAO: TIntegerField
      FieldName = 'ID_FORMA_VS_CONDICAO'
      Required = True
    end
    object cdsFormasVSCondicoesID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
      Required = True
    end
    object cdsFormasVSCondicoesCONDICAO_DE_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_DE_PAGAMENTO'
      Size = 255
    end
    object cdsFormasVSCondicoesID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
      Required = True
    end
    object cdsFormasVSCondicoesDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
  end
  object dsFormasVSCondicoes: TDataSource
    AutoEdit = False
    DataSet = cdsFormasVSCondicoes
    Left = 387
    Top = 483
  end
  object cdsGraficoCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPGraficoCaixa'
    RemoteServer = DSProviderClient
    Left = 768
    Top = 8
    object cdsGraficoCaixaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsGraficoCaixaDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object cdsGraficoCaixaDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object cdsGraficoCaixaCONDICAO_DE_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_DE_PAGAMENTO'
      Size = 255
    end
    object cdsGraficoCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object dsgraficoCaixa: TDataSource
    DataSet = cdsGraficoCaixa
    Left = 768
    Top = 65
  end
  object cdsCaixasAberturasFechamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCaixasAberturasFechamentos'
    RemoteServer = DSProviderClient
    Left = 949
    Top = 17
    object cdsCaixasAberturasFechamentosUSUARIO_ABERTURA_FECHAMENTO: TStringField
      FieldName = 'USUARIO_ABERTURA_FECHAMENTO'
      Size = 255
    end
    object cdsCaixasAberturasFechamentosNUMERO_CAIXA: TIntegerField
      FieldName = 'NUMERO_CAIXA'
    end
    object cdsCaixasAberturasFechamentosID_CAIXA_ABERTURA_FECHAMENTO: TIntegerField
      FieldName = 'ID_CAIXA_ABERTURA_FECHAMENTO'
      Required = True
    end
    object cdsCaixasAberturasFechamentosDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
    end
    object cdsCaixasAberturasFechamentosHORA_ABERTURA: TStringField
      FieldName = 'HORA_ABERTURA'
      Size = 10
    end
    object cdsCaixasAberturasFechamentosSALDO_ABERTURA: TFMTBCDField
      FieldName = 'SALDO_ABERTURA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixasAberturasFechamentosDATA_FECHAMENTO: TDateField
      FieldName = 'DATA_FECHAMENTO'
    end
    object cdsCaixasAberturasFechamentosHORA_FECHAMENTO: TStringField
      FieldName = 'HORA_FECHAMENTO'
      Size = 10
    end
    object cdsCaixasAberturasFechamentosSALDO_FECHAMENTO: TFMTBCDField
      FieldName = 'SALDO_FECHAMENTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dsCaixasAberturasFechamentos: TDataSource
    AutoEdit = False
    DataSet = cdsCaixasAberturasFechamentos
    Left = 952
    Top = 72
  end
  object cdsMovimentacoesCaixas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPMovimentacoesCaixas'
    RemoteServer = DSProviderClient
    Left = 952
    Top = 128
    object cdsMovimentacoesCaixasUSUARIO_MOVIMENTACAO: TStringField
      FieldName = 'USUARIO_MOVIMENTACAO'
      Size = 255
    end
    object cdsMovimentacoesCaixasID_CAIXA_ABERTURA_FECHAMENTO: TIntegerField
      FieldName = 'ID_CAIXA_ABERTURA_FECHAMENTO'
      Required = True
    end
    object cdsMovimentacoesCaixasVALOR_MOVIMENTADO: TFMTBCDField
      FieldName = 'VALOR_MOVIMENTADO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsMovimentacoesCaixasDESCRICAO_MOVIMENTACAO: TStringField
      FieldName = 'DESCRICAO_MOVIMENTACAO'
      Size = 255
    end
    object cdsMovimentacoesCaixasOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsMovimentacoesCaixasID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsMovimentacoesCaixasDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      FixedChar = True
      Size = 7
    end
  end
  object dsMovimentacoesCaixas: TDataSource
    AutoEdit = False
    DataSet = cdsMovimentacoesCaixas
    Left = 952
    Top = 184
  end
  object cdsComandas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPComandas'
    RemoteServer = DSProviderClient
    Left = 792
    Top = 128
    object cdsComandasID_COMANDA: TIntegerField
      FieldName = 'ID_COMANDA'
      Required = True
    end
    object cdsComandasNUMERO_COMANDA: TStringField
      FieldName = 'NUMERO_COMANDA'
      Size = 100
    end
  end
  object dscomandas: TDataSource
    AutoEdit = False
    DataSet = cdsComandas
    Left = 792
    Top = 176
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos CSV (*.csv)|*.csv|Todos os arquivos|*.*'
    Left = 408
    Top = 152
  end
  object cdsProd: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 464
    object cdsProdCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 15
    end
    object cdsProdPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 200
    end
    object cdsProdCOR: TStringField
      FieldName = 'COR'
      Size = 50
    end
    object cdsProdTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 80
    end
    object cdsProdQIDE: TStringField
      FieldName = 'QIDE'
    end
    object cdsProdPROMO: TStringField
      FieldName = 'PROMO'
      Size = 30
    end
    object cdsProdVALOR: TStringField
      FieldName = 'VALOR'
      Size = 30
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=186.202.148.141'
      'Database=site1369233040'
      'User_Name=site1369233040'
      'MetaDefSchema=dbo'
      'MetaDefCatalog=site1369233040'
      'Password=ag556999*'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 391
    Top = 8
  end
  object FDQConsulta: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produtos')
    Left = 403
    Top = 108
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 392
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 448
    Top = 8
  end
  object FDQBusca: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produtos')
    Left = 411
    Top = 332
  end
  object FDConnection2: TFDConnection
    Params.Strings = (
      'Database=C:\Sat\BancoDados\HMNFE.FDB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'DriverID=FB')
    LoginPrompt = False
    Left = 784
    Top = 328
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 784
    Top = 264
  end
  object FDQNFE: TFDQuery
    Connection = FDConnection2
    Left = 792
    Top = 384
  end
  object FDQCliente: TFDQuery
    Connection = FDConnection2
    Left = 776
    Top = 440
  end
  object cdsCFOP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCFOP'
    RemoteServer = DSProviderClient
    AfterInsert = cdsCFOPAfterInsert
    AfterPost = cdsCFOPAfterPost
    AfterDelete = cdsCFOPAfterDelete
    Left = 667
    Top = 434
    object cdsCFOPID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCFOPCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsCFOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 300
    end
    object cdsCFOPCFOPENTRADA: TIntegerField
      FieldName = 'CFOPENTRADA'
    end
    object cdsCFOPTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object cdsCFOPAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Size = 2000
    end
  end
  object dsCFOP: TDataSource
    AutoEdit = False
    DataSet = cdsCFOP
    Left = 584
    Top = 432
  end
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.1.9'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 42467.626106678200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'const '
      '  LINHAS_DADOS_ADICIONAIS = 12;'
      'var'
      
        '  FooterHeight : Double;                                        ' +
        '                 '
      '  '
      
        'procedure DadosProdutosFooterOnBeforePrint(Sender: TfrxComponent' +
        ');'
      'var'
      
        '  FatorEspaco : Extended;                                       ' +
        '                                  '
      'begin'
      '  FatorEspaco := DadosAdicionais.Height + PageFooter.Height;'
      '  if <Parametros."poscanhoto"> = '#39'1'#39' then'
      
        '    FatorEspaco := FatorEspaco + CanhotoRodape.Height;          ' +
        '                                                                ' +
        '                   '
      '  if Engine.FinalPass then'
      '  begin'
      '    while ( Engine.FreeSpace > FatorEspaco ) do'
      '      Engine.ShowBand(Child1);'
      '    Engine.ShowBand(Child2);'
      '  end;            '
      'end;'
      ''
      
        'procedure DadosProdutosHeaderOnBeforePrint(Sender: TfrxComponent' +
        ');'
      'begin'
      '  if Engine.FinalPass then'
      '  begin    '
      '    set('#39'LinhasImpressas'#39',0);'
      '  end;              '
      'end;'
      ''
      'procedure DadosProdutosOnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin    '
      '    set('#39'LinhasImpressas'#39',StrToInt(get('#39'LinhasImpressas'#39'))+1);'
      
        '    if (StrToInt(VarToStr(<Parametros."LinhasPorPagina">)) > 0) ' +
        'then'
      '    begin              '
      
        '      if (StrToInt(get('#39'LinhasImpressas'#39')) = StrToInt(VarToStr(<' +
        'Parametros."LinhasPorPagina">))) then    '
      '        Engine.ShowBand(DadosProdutosFooter);              '
      '    end;'
      '  end;            '
      'end;'
      ''
      'procedure EmitenteOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin              '
      '    if Trim(VarToStr(<Parametros."Imagem">)) <> '#39#39' then'
      '    begin              '
      '      if Trim(VarToStr(<Parametros."LogoExpandido">)) = '#39'1'#39' then'
      '      begin'
      '        MemEmitente.Font.Color := clWhite;'
      '        MemDadosEmitente.Visible := False;'
      '        imgLogo.Top := 5;'
      
        '        imgLogo.Height := memDadosEmitente.Height + (memDadosEmi' +
        'tente.Top - imgLogo.Top);                                       ' +
        '                                '
      
        '        imgLogo.Width := memDadosEmitente.Width + (memDadosEmite' +
        'nte.Left - imgLogo.Left);                                       ' +
        '       '
      '      end;'
      '    end '
      '    else'
      '    begin'
      '      MemDadosEmitente.Left := MemEmitente.Left;'
      '      MemDadosEmitente.Width := MemEmitente.Width;        '
      
        '      imgLogo.Visible := False;                                 ' +
        '                                     '
      '    end;'
      ''
      
        '    if (Trim(VarToStr(<Parametros."Contingencia_ID">)) = '#39#39') the' +
        'n'
      '      BarCodeContigencia.Visible := False;'
      ''
      '    // Restaura a altura original da PageFooter'
      '    if ( <Page> = 1 ) then'
      '    begin              '
      '      PageFooter.Height := FooterHeight;'
      '      PageFooter.Visible := True;'
      '    end'
      '    else'
      '    begin'
      '      PageFooter.Height := 0;'
      '      PageFooter.Visible := False;'
      '    end;            '
      '  end;'
      'end;'
      ''
      'procedure PageFooterOnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '{  if Engine.FinalPass then'
      '  begin              '
      '  //Fabio'
      '    PageFooter.Height := 0;      '
      '    PageFooter.Visible := False;'
      '  end;'
      '  }      '
      'end;'
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  sLinha : String;                              '
      'begin'
      '  Canhoto.Visible := <Parametros."poscanhoto"> = '#39'0'#39';'
      '  CanhotoRodape.Visible := <Parametros."poscanhoto"> = '#39'1'#39';'
      '    '
      '  // Salva a altura atual da band Footer'
      '  FooterHeight := PageFooter.Height;'
      '    '
      '  // verifica se existem mais de  linhas nas observa'#231#245'es'
      '  memOBS.Lines.Text := <InformacoesAdicionais."OBS">;      '
      '  memContInfAdicionais.Lines.Clear;'
      
        '  // Se a quantidade de linhas for maior que LINHAS_DADOS_ADICIO' +
        'NAIS, exibe a se'#231#227'o "continua'#231#227'o dos dados adicionais", sen'#227'o oc' +
        'ulta.                                                           ' +
        '                                                                ' +
        '                                                                ' +
        '                                                                ' +
        '            '
      '  if ( memOBS.Lines.Count > LINHAS_DADOS_ADICIONAIS ) then'
      '    pgContDadosAdicionais.Visible := True'
      '  else'
      '    pgContDadosAdicionais.Visible := False;'
      ''
      
        '  //Se a quantidade de linhas for maior que LINHAS_DADOS_ADICION' +
        'AIS, copia as demais linhas para a se'#231#227'o "continua'#231#227'o dos dados ' +
        'adicionais"'
      '  while ( memOBS.Lines.Count > LINHAS_DADOS_ADICIONAIS ) do'
      '  begin              '
      '    sLinha := memOBS.Lines.Strings(LINHAS_DADOS_ADICIONAIS-1);'
      
        '    // Copia a linha para a continua'#231#227'o das informa'#231#245'es adiciona' +
        'is                                                              ' +
        '                                                                ' +
        '                          '
      '    memContInfAdicionais.Lines.Add(sLinha);'
      '    // Apaga a linha do memOBS'
      
        '    memOBS.Lines.Delete(LINHAS_DADOS_ADICIONAIS-1);             ' +
        '               '
      '  end;'
      '    '
      '  if Engine.FinalPass then'
      '  begin'
      ''
      '    if  ('
      '          ( Trim(VarToStr(<ISSQN."vBC">)) = '#39#39' ) or'
      '          ( Trim(VarToStr(<ISSQN."vBC">)) ='#39'0'#39') and    '
      '          ( Trim(VarToStr(<ISSQN."vISS">)) = '#39#39' ) or'
      '          ( Trim(VarToStr(<ISSQN."vISS">)) ='#39'0'#39') and    '
      '          ( Trim(VarToStr(<ISSQN."vServ">)) = '#39#39' ) or'
      '          ( Trim(VarToStr(<ISSQN."vServ">)) ='#39'0'#39') '
      '       )  then'
      '          begin'
      '             ColumnFooter1.Visible := False;'
      '             ColumnFooter1.Height := 0;'
      '          end;                  '
      '  end;                       '
      'end;'
      ''
      'procedure ImpostoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass then'
      '  begin              '
      
        '    if (StrToFloat(VarToStr(<CalculoImposto."VTotTrib">)) = 0) t' +
        'hen        '
      '    begin              '
      '      QuadroVTOTTRIB.Visible:=False;'
      '      memVTOTTRIB.Visible:=False;'
      '    '
      '      QuadroVST.Left := QuadroVST.Left+QuadroVTOTTRIB.Width;'
      '      memVST.Left := QuadroVST.Left;                       '
      ''
      '      QuadroVBCST.Left := QuadroVBCST.Left+QuadroVTOTTRIB.Width;'
      '      memVBCST.Left := QuadroVBCST.Left;                       '
      ''
      
        '      QuadroVBC.Width := QuadroVBC.Width+(QuadroVTOTTRIB.Width/2' +
        ');'
      
        '      memVBC.Width := QuadroVBC.Width;                          ' +
        '                      '
      '      QuadroVICMS.Left := QuadroVBC.Width;'
      ''
      '      memVICMS.Left := QuadroVICMS.Left;'
      
        '      QuadroVICMS.Width := QuadroVICMS.Width+(QuadroVTOTTRIB.Wid' +
        'th/2);'
      
        '      memVICMS.Width := QuadroVICMS.Width;                      ' +
        '           '
      '    end;                                            '
      '  end;                   '
      'end;'
      ''
      'procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Engine.ShowBand(Emitente);                                    ' +
        '                           '
      'end;'
      ''
      'procedure FaturaOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Fatura.Visible     := ( VarToStr(<Fatura."iForma">) <> '#39'2'#39');  ' +
        '  '
      
        '  MemoFatura.Visible := ( Trim( VarToStr(<Fatura."nfat">)) <> '#39#39 +
        ');'
      'end;'
      ''
      'begin'
      ''
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 904
    Top = 272
    Datasets = <
      item
        DataSetName = 'CalculoImposto'
      end
      item
        DataSetName = 'DadosProdutos'
      end
      item
        DataSetName = 'Destinatario'
      end
      item
        DataSetName = 'Duplicatas'
      end
      item
        DataSetName = 'Emitente'
      end
      item
        DataSetName = 'Fatura'
      end
      item
        DataSetName = 'Identificacao'
      end
      item
        DataSetName = 'InformacoesAdicionais'
      end
      item
        DataSetName = 'ISSQN'
      end
      item
        DataSetName = 'LocalEntrega'
      end
      item
        DataSetName = 'LocalRetirada'
      end
      item
        DataSetName = 'Pagamento'
      end
      item
        DataSetName = 'Parametros'
      end
      item
        DataSetName = 'Transportador'
      end
      item
        DataSetName = 'Veiculo'
      end
      item
        DataSetName = 'Volumes'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 6.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 7.000000000000000000
      BottomMargin = 7.000000000000000000
      BackPictureVisible = False
      LargeDesignHeight = True
      OnBeforePrint = 'Page1OnBeforePrint'
      object DadosProdutos: TfrxMasterData
        FillType = ftBrush
        Height = 11.338582680000000000
        Top = 1062.047930000000000000
        Width = 744.567410000000000000
        OnAfterPrint = 'DadosProdutosOnAfterPrint'
        DataSetName = 'DadosProdutos'
        RowCount = 0
        Stretched = True
        object Memo131: TfrxMemoView
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DadosProdutos."CProd"]')
          ParentFont = False
        end
        object Memo132: TfrxMemoView
          Left = 60.472480000000000000
          Width = 222.992089370000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haBlock
          Memo.UTF8W = (
            '[DadosProdutos."DescricaoProduto"]')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 283.464537640000000000
          Width = 37.795300000000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DadosProdutos."NCM"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo134: TfrxMemoView
          Left = 321.259813230000000000
          Width = 26.456695350000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DadosProdutos."ORIGEM"][DadosProdutos."CST"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo135: TfrxMemoView
          Left = 347.716506140000000000
          Width = 24.566929130000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DadosProdutos."CFOP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo136: TfrxMemoView
          Left = 372.283493860000000000
          Width = 22.677180000000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DadosProdutos."Unidade"]')
          ParentFont = False
        end
        object memqCom: TfrxMemoView
          Left = 394.960659210000000000
          Width = 43.464574250000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."Quantidade"]')
          ParentFont = False
        end
        object memvUnCom: TfrxMemoView
          Left = 438.425480000000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."ValorUnitario"]')
          ParentFont = False
        end
        object Memo139: TfrxMemoView
          Left = 491.338900000000000000
          Width = 45.354360000000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."vDesc"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo140: TfrxMemoView
          Left = 536.693260000000000000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VProd"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo141: TfrxMemoView
          Left = 578.268090000000000000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VBC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo142: TfrxMemoView
          Left = 619.842920000000000000
          Width = 41.574803150000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VICMS"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo143: TfrxMemoView
          Left = 661.417322830000000000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[DadosProdutos."VIPI"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo144: TfrxMemoView
          Left = 702.992125980000000000
          Width = 20.787401570000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DadosProdutos."PICMS"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo145: TfrxMemoView
          Left = 723.779527560000000000
          Width = 20.787401570000000000
          Height = 11.338582680000000000
          StretchMode = smMaxHeight
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[DadosProdutos."PIPI"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Canhoto: TfrxReportTitle
        FillType = ftBrush
        Height = 79.370078740000000000
        Top = 18.897650000000000000
        Width = 744.567410000000000000
        object Memo2: TfrxMemoView
          Width = 642.520100000000000000
          Height = 37.795275590000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            
              'Recebemos de [Emitente."XNome"] os produtos e/ou servi'#231'os consta' +
              'ntes da Nota Fiscal Eletr'#244'nica indicada ao lado. '
            '[Parametros."ResumoCanhoto"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 143.622140000000000000
          Top = 37.795275590000000000
          Width = 498.897960000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O E ASSINATURA DO RECEBEDOR')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 37.795275590000000000
          Width = 143.622140000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DATA DO RECEBIMENTO')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 73.811070000000000000
          Width = 744.567410000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
        object Memo17: TfrxMemoView
          Left = 642.520100000000000000
          Width = 102.047212360000000000
          Height = 68.031496060000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'NF-e'
            'N'#186' [Identificacao."NNF"]'
            'S'#233'rie [Identificacao."Serie" #n#000]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Emitente: TfrxPageHeader
        FillType = ftBrush
        Height = 173.858362910000000000
        Top = 120.944960000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'EmitenteOnBeforePrint'
        object BarCodeContigencia: TfrxBarCodeView
          ShiftMode = smWhenOverlapped
          Left = 469.764070000000000000
          Top = 84.370130000000000000
          Width = 233.000000000000000000
          Height = 34.015745590000000000
          BarType = bcCode128C
          DataField = 'Contingencia_ID'
          DataSetName = 'Parametros'
          Rotation = 0
          ShowText = False
          Text = '123456789012345678901234567890123456'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object memConsultaAutenticidade: TfrxMemoView
          Left = 423.307360000000000000
          Top = 79.370130000000000000
          Width = 321.260050000000000000
          Height = 41.574805590000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."ConsultaAutenticidade"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 423.307360000000000000
          Width = 321.259842520000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object BarCodeChave: TfrxBarCodeView
          Left = 445.677177560000000000
          Top = 5.559060000000000000
          Width = 277.000000000000000000
          Height = 37.795275590000000000
          BarType = bcCode128C
          DataField = 'Id'
          DataSetName = 'Identificacao'
          Rotation = 0
          ShowText = False
          Text = '12345678901234567890123456789012345678901234'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Memo6: TfrxMemoView
          Left = 423.307360000000000000
          Top = 49.133890000000000000
          Width = 321.260050000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CHAVE DE ACESSO')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 423.307360000000000000
          Top = 56.692913390000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."Chave"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          Left = 309.921460000000000000
          Width = 113.385826770000000000
          Height = 120.944960000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DANFE')
          ParentFont = False
        end
        object memEmitente: TfrxMemoView
          Width = 309.921460000000000000
          Height = 120.944960000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 1.000000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Emitente."XNome"]')
          ParentFont = False
        end
        object memDadosEmitente: TfrxMemoView
          Left = 100.826840000000000000
          Top = 37.795275590000000000
          Width = 207.874020630000000000
          Height = 81.259842520000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 1.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Emitente."DADOS_ENDERECO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 313.157700000000000000
          Top = 16.897650000000000000
          Width = 105.826840000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Documento Auxiliar da '
            'Nota Fiscal Eletr'#244'nica')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 321.716760000000000000
          Top = 70.811070000000000000
          Width = 98.267780000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'N'#186' [Identificacao."NNF"]'
            '   S'#201'RIE [Identificacao."Serie" #n#000]'
            '   FOLHA [Page]/[TotalPages#]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 313.716760000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '0 - ENTRADA'
            '1 - SA'#205'DA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 389.748300000000000000
          Top = 45.354330710000000000
          Width = 22.677165350000000000
          Height = 22.677165350000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."TpNF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 120.944960000000000000
          Width = 423.307360000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NATUREZA DA OPERA'#199#195'O')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Top = 129.259842520000000000
          Width = 423.307360000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Identificacao."NatOp"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo21: TfrxMemoView
          Left = 423.307360000000000000
          Top = 120.944960000000000000
          Width = 321.260050000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            '[Parametros."Contingencia_Descricao"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 423.307360000000000000
          Top = 129.259842520000000000
          Width = 321.260050000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."Contingencia_Valor"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo23: TfrxMemoView
          Top = 147.401670000000000000
          Width = 253.228510000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Top = 156.850410790000000000
          Width = 253.228510000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Emitente."IE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo25: TfrxMemoView
          Left = 253.228510000000000000
          Top = 147.401670000000000000
          Width = 253.228510000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL DO SUBSTITUTO TRIBUT'#193'RIO')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 253.228510000000000000
          Top = 156.850410790000000000
          Width = 253.228510000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Emitente."IEST"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo27: TfrxMemoView
          Left = 506.457020000000000000
          Top = 147.401670000000000000
          Width = 238.110390000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CNPJ')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 506.457020000000000000
          Top = 156.850410790000000000
          Width = 238.110390000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Emitente."CNPJ"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object imgLogo: TfrxPictureView
          Left = 1.889763780000000000
          Top = 37.795275590000000000
          Width = 98.267711650000000000
          Height = 81.259842520000000000
          Center = True
          DataField = 'LogoCarregado'
          DataSetName = 'Parametros'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter: TfrxPageFooter
        FillType = ftBrush
        Height = 14.117988190000000000
        Top = 2683.466300000000000000
        Width = 744.567410000000000000
        OnAfterPrint = 'PageFooterOnAfterPrint'
        object memDataHora: TfrxMemoView
          Align = baLeft
          Top = 0.889641730000221100
          Width = 445.984540000000000000
          Height = 13.228346460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            
              'DATA E HORA DA IMPRESS'#195'O: [Date #ddd/mm/yyyy] [Time #dhh:mm:ss] ' +
              '[Parametros."Usuario"]')
          ParentFont = False
        end
        object memSistema: TfrxMemoView
          Align = baRight
          Left = 453.543600000000000000
          Top = 0.889641730000221100
          Width = 291.023810000000000000
          Height = 13.228346460000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Parametros."Sistema"]')
          ParentFont = False
        end
      end
      object Destinatario: TfrxMasterData
        FillType = ftBrush
        Height = 96.267762910000000000
        Top = 355.275820000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'DestinatarioOnBeforePrint'
        DataSetName = 'Identificacao'
        RowCount = 1
        object Memo29: TfrxMemoView
          Top = 16.897650000000000000
          Width = 468.661720000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NOME / RAZ'#195'O SOCIAL')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Top = 26.346390790000000000
          Width = 464.882190000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Destinatario."XNome"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          Left = 631.181510000000000000
          Top = 16.897650000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DATA DA EMISS'#195'O')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 631.181510000000000000
          Top = 26.346390790000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."DEmi"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo33: TfrxMemoView
          Left = 631.181510000000000000
          Top = 43.354360000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DATA DA SA'#205'DA')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 631.181510000000000000
          Top = 52.803100790000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."DSaiEnt"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo35: TfrxMemoView
          Left = 631.181510000000000000
          Top = 69.811070000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'HORA DA SA'#205'DA')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 631.181510000000000000
          Top = 79.259810790000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Identificacao."HoraSaida"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo37: TfrxMemoView
          Left = 468.661720000000000000
          Top = 16.897650000000000000
          Width = 162.519790000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 468.661720000000000000
          Top = 26.346390790000000000
          Width = 162.519790000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Destinatario."CNPJCPF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo39: TfrxMemoView
          Left = 555.590910000000000000
          Top = 43.354360000000000000
          Width = 75.590600000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 555.590910000000000000
          Top = 52.803100790000000000
          Width = 75.590600000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Destinatario."CEP"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo41: TfrxMemoView
          Left = 385.512060000000000000
          Top = 43.354360000000000000
          Width = 170.078850000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'BAIRRO / DISTRITO')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 385.512060000000000000
          Top = 52.803100790000000000
          Width = 170.078850000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Destinatario."XBairro"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Top = 43.354360000000000000
          Width = 385.512060000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Top = 52.803100790000000000
          Width = 381.732530000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            
              '[Destinatario."XLgr"], [Destinatario."Nro"]  [Destinatario."XCpl' +
              '"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo45: TfrxMemoView
          Top = 69.811070000000000000
          Width = 355.275820000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'MUNIC'#205'PIO')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Top = 79.259810790000000000
          Width = 351.496290000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Destinatario."XMun"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo47: TfrxMemoView
          Left = 355.275820000000000000
          Top = 69.811070000000000000
          Width = 30.236240000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 355.275820000000000000
          Top = 79.259810790000000000
          Width = 30.236240000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Destinatario."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo49: TfrxMemoView
          Left = 385.512060000000000000
          Top = 69.811070000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'TELEFONE / FAX')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 385.512060000000000000
          Top = 79.259810790000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Destinatario."Fone"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo51: TfrxMemoView
          Left = 498.897960000000000000
          Top = 69.811070000000000000
          Width = 132.283550000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 498.897960000000000000
          Top = 79.259810790000000000
          Width = 132.283550000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Destinatario."IE"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo53: TfrxMemoView
          Top = 3.779530000000020000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'DESTINAT'#193'RIO / REMETENTE')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Fatura: TfrxMasterData
        FillType = ftBrush
        Height = 43.464566929133900000
        Top = 612.283860000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'FaturaOnBeforePrint'
        DataSetName = 'Fatura'
        RowCount = 0
        object Memo146: TfrxMemoView
          Align = baLeft
          Top = 17.007874015748000000
          Width = 744.566929130000000000
          Height = 20.787404020000000000
          OnBeforePrint = 'Memo191OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            '[Fatura."Pagamento"]  ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo190: TfrxMemoView
          Top = 3.779527560000020000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'FATURA')
          ParentFont = False
          VAlign = vaBottom
        end
        object MemoFatura: TfrxMemoView
          Left = 128.504508190000000000
          Top = 17.007874015748000000
          Width = 616.062901810000000000
          Height = 20.787404020000000000
          OnBeforePrint = 'Memo191OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            
              '  N'#250'mero:   [Fatura."nFat"]     -   Valor Original: R$ [Fatura."' +
              'vOrig" #n%2,2n]    -   Valor Desconto:  R$ [Fatura."vDesc" #n%2,' +
              '2n]    -   ValorL'#237'quido: R$ [Fatura."vLiq" #n%2,2n]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
        end
      end
      object DuplicatasHeader: TfrxGroupHeader
        FillType = ftBrush
        Height = 17.007874020000000000
        Top = 680.315400000000000000
        Width = 744.567410000000000000
        Condition = 'Duplicatas."ChaveNFe"'
        ReprintOnNewPage = True
        object Memo205: TfrxMemoView
          Top = 3.779530000000020000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'DUPLICATAS')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object DadosProdutosHeader: TfrxGroupHeader
        FillType = ftBrush
        Height = 41.196850390000000000
        Top = 997.795920000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'DadosProdutosHeaderOnBeforePrint'
        Condition = 'DadosProdutos."ChaveNFe"'
        ReprintOnNewPage = True
        object Memo115: TfrxMemoView
          Top = 3.779530000000020000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'DADOS DOS PRODUTOS / SERVI'#199'OS')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo116: TfrxMemoView
          Top = 18.338592440000000000
          Width = 60.472480000000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#211'DIGO'
            'PRODUTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 60.472480000000000000
          Top = 18.338592440000000000
          Width = 222.992089370000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'DESCRI'#199#195'O DO PRODUTO / SERVI'#199'O')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 283.464537640000000000
          Top = 18.338592440000000000
          Width = 37.795300000000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'NCM/SH')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 321.259813230000000000
          Top = 18.338592440000000000
          Width = 26.456695350000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Emitente."DESCR_CST"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo120: TfrxMemoView
          Left = 347.716506140000000000
          Top = 18.338592440000000000
          Width = 24.566929130000000000
          Height = 22.677167800000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'CFOP')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 372.283493860000000000
          Top = 18.338592440000000000
          Width = 22.677180000000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'UNID.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 394.960659210000000000
          Top = 18.338592440000000000
          Width = 43.464574250000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'QTDE.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo123: TfrxMemoView
          Left = 438.425480000000000000
          Top = 18.338592440000000000
          Width = 52.913420000000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'UNIT'#193'RIO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.338592440000000000
          Width = 45.354360000000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."Desconto"]'
            'DESCONTO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 536.693260000000000000
          Top = 18.338592440000000000
          Width = 41.574830000000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            '[Parametros."TotalLiquido"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo126: TfrxMemoView
          Left = 578.268090000000000000
          Top = 18.338592440000000000
          Width = 41.574830000000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'BASE DE '
            'C'#193'LC. ICMS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 619.842920000000000000
          Top = 18.338592440000000000
          Width = 41.574803150000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'ICMS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo128: TfrxMemoView
          Left = 661.417322830000000000
          Top = 18.338592440000000000
          Width = 41.574803150000000000
          Height = 22.677162910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'IPI')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 702.992125980000000000
          Top = 29.677182440000000000
          Width = 20.787401570000000000
          Height = 11.338572910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'ICMS')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo130: TfrxMemoView
          Left = 723.779527560000000000
          Top = 29.677182440000000000
          Width = 20.787401570000000000
          Height = 11.338572910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'IPI')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo189: TfrxMemoView
          Left = 702.992123540000000000
          Top = 18.338592440000000000
          Width = 41.574830000000000000
          Height = 11.338572910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'AL'#205'Q. %')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Imposto: TfrxMasterData
        FillType = ftBrush
        Height = 70.031525350000000000
        Top = 782.362710000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'ImpostoOnBeforePrint'
        DataSetName = 'CalculoImposto'
        RowCount = 1
        object Memo58: TfrxMemoView
          Top = 3.779530000000020000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'C'#193'LCULO DO IMPOSTO')
          ParentFont = False
          VAlign = vaBottom
        end
        object QuadroVBC: TfrxMemoView
          Top = 17.118122440000000000
          Width = 114.897637800000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'BASE DE C'#193'LCULO DO ICMS')
          ParentFont = False
        end
        object memVBC: TfrxMemoView
          Top = 26.566863230000000000
          Width = 114.897637800000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VBC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object QuadroVICMS: TfrxMemoView
          Left = 114.897637800000000000
          Top = 17.118122440000000000
          Width = 114.897637800000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR DO ICMS')
          ParentFont = False
        end
        object memVICMS: TfrxMemoView
          Left = 114.897637800000000000
          Top = 26.566863230000000000
          Width = 114.897637800000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VICMS"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object QuadroVBCST: TfrxMemoView
          Left = 229.795275590000000000
          Top = 17.118122440000000000
          Width = 128.504020000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'BASE DE C'#193'LCULO DO ICMS SUBST.')
          ParentFont = False
        end
        object memVBCST: TfrxMemoView
          Left = 229.795275590000000000
          Top = 26.566863230000000000
          Width = 128.504020000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VBCST"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object QuadrovST: TfrxMemoView
          Left = 358.299212600000000000
          Top = 17.118122440000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR DO ICMS SUBST.')
          ParentFont = False
        end
        object memVST: TfrxMemoView
          Left = 358.299212600000000000
          Top = 26.566863230000000000
          Width = 113.385900000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VST"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo67: TfrxMemoView
          Left = 597.165740000000000000
          Top = 17.118122440000000000
          Width = 147.401670000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR TOTAL DOS PRODUTOS')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 597.165740000000000000
          Top = 25.566863230000000000
          Width = 147.401670000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VProd"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo69: TfrxMemoView
          Left = 459.590848000000000000
          Top = 43.574832440000000000
          Width = 137.574892000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR DO IPI')
          ParentFont = False
        end
        object Memo70: TfrxMemoView
          Left = 459.590848000000000000
          Top = 53.023573230000000000
          Width = 137.574892000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VIPI"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo71: TfrxMemoView
          Left = 329.575016000000000000
          Top = 43.574832440000000000
          Width = 130.015832000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'OUTRAS DESPESAS ACESS'#211'RIAS')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          Left = 329.575016000000000000
          Top = 53.023573230000000000
          Width = 130.015832000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VOutro"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo73: TfrxMemoView
          Left = 229.795424000000000000
          Top = 43.574832440000000000
          Width = 99.779592000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DESCONTO')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          Left = 229.795424000000000000
          Top = 53.023573230000000000
          Width = 99.779592000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VDesc"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo75: TfrxMemoView
          Left = 114.897712000000000000
          Top = 43.574832440000000000
          Width = 114.897712000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR DO SEGURO')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          Left = 114.897712000000000000
          Top = 53.023573230000000000
          Width = 114.897712000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VSeg"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo77: TfrxMemoView
          Top = 43.574832440000000000
          Width = 114.897712000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR DO FRETE')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Top = 53.023573230000000000
          Width = 114.897712000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VFrete"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo79: TfrxMemoView
          Left = 597.165740000000000000
          Top = 43.574832440000000000
          Width = 147.401670000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR TOTAL DA NOTA')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 597.165740000000000000
          Top = 52.023573230000000000
          Width = 147.401670000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VNF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object QuadroVTOTTRIB: TfrxMemoView
          Left = 471.685029610000000000
          Top = 17.196850390000000000
          Width = 125.480339370000000000
          Height = 26.267716540000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'V.APROX. TRIBUTOS [CalculoImposto."VTribFonte"]')
          ParentFont = False
        end
        object memVTOTTRIB: TfrxMemoView
          Left = 472.441250000000000000
          Top = 26.645669290000000000
          Width = 124.724490000000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[CalculoImposto."VTotTrib"] ([CalculoImposto."VTribPerc"] %)')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
      end
      object TransportadorVolumes: TfrxMasterData
        FillType = ftBrush
        Height = 96.378045510000000000
        Top = 876.850960000000000000
        Width = 744.567410000000000000
        DataSetName = 'Transportador'
        RowCount = 1
        object Memo82: TfrxMemoView
          Top = 3.779530000000020000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'TRANSPORTADOR / VOLUMES TRANSPORTADOS')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 636.094512600000000000
          Top = 17.007932600000000000
          Width = 108.472433620000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo84: TfrxMemoView
          Left = 636.094512600000000000
          Top = 26.456673390000000000
          Width = 108.472433620000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Transportador."CNPJCPF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo85: TfrxMemoView
          Left = 608.504330000000000000
          Top = 17.007932600000000000
          Width = 27.590548740000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Memo86: TfrxMemoView
          Left = 608.504330000000000000
          Top = 26.456673390000000000
          Width = 27.590548740000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Veiculo."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo87: TfrxMemoView
          Left = 521.575140000000000000
          Top = 17.007932600000000000
          Width = 86.929190000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'PLACA DO VE'#205'CULO')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 521.575140000000000000
          Top = 26.456673390000000000
          Width = 86.929190000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Veiculo."PLACA"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo89: TfrxMemoView
          Left = 438.425480000000000000
          Top = 17.007932600000000000
          Width = 83.149660000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'C'#211'DIGO ANTT')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 438.425480000000000000
          Top = 26.456673390000000000
          Width = 79.370130000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Veiculo."RNTC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo91: TfrxMemoView
          Left = 355.275820000000000000
          Top = 17.007932600000000000
          Width = 83.149660000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'FRETE POR CONTA')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 355.275820000000000000
          Top = 26.456673390000000000
          Width = 83.149660000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Transportador."ModFrete"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo93: TfrxMemoView
          Top = 17.007932600000000000
          Width = 355.275820000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NOME / RAZ'#195'O SOCIAL')
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Top = 26.456673390000000000
          Width = 355.275820000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Transportador."XNome"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo95: TfrxMemoView
          Left = 608.504330000000000000
          Top = 43.464642600000000000
          Width = 27.590548740000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 608.504330000000000000
          Top = 52.913383390000000000
          Width = 27.590548740000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[Transportador."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo97: TfrxMemoView
          Left = 636.094512600000000000
          Top = 43.464642600000000000
          Width = 108.472433620000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 636.094512600000000000
          Top = 52.913383390000000000
          Width = 108.472433620000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Transportador."IE"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo99: TfrxMemoView
          Left = 355.275820000000000000
          Top = 43.464642600000000000
          Width = 253.228510000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'MUNIC'#205'PIO')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 355.275820000000000000
          Top = 52.913383390000000000
          Width = 253.228510000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Transportador."XMun"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo101: TfrxMemoView
          Top = 43.464642600000000000
          Width = 355.275820000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Top = 52.913383390000000000
          Width = 355.275820000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Transportador."XEnder"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo103: TfrxMemoView
          Top = 69.921352600000000000
          Width = 59.212636670000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HideZeros = True
          Memo.UTF8W = (
            'QUANTIDADE')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Top = 79.370093390000000000
          Width = 59.212636670000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[Volumes."QVol"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo105: TfrxMemoView
          Left = 59.212636670000000000
          Top = 69.921352600000000000
          Width = 153.700886670000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'ESP'#201'CIE')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 59.212636670000000000
          Top = 79.370093390000000000
          Width = 153.700886670000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Volumes."Esp"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo107: TfrxMemoView
          Left = 212.913523330000000000
          Top = 69.921352600000000000
          Width = 142.362296670000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'MARCA')
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 212.913523330000000000
          Top = 79.370093390000000000
          Width = 142.362296670000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Volumes."Marca"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo109: TfrxMemoView
          Left = 355.275820000000000000
          Top = 69.921352600000000000
          Width = 161.259946670000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'NUMERA'#199#195'O')
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 355.275820000000000000
          Top = 79.370093390000000000
          Width = 161.259946670000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Volumes."NVol"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo111: TfrxMemoView
          Left = 516.535766670000000000
          Top = 69.921352600000000000
          Width = 119.685116670000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'PESO BRUTO')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 516.535766670000000000
          Top = 79.370093390000000000
          Width = 119.685116670000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[Volumes."PesoB"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo113: TfrxMemoView
          Left = 636.220883330000000000
          Top = 69.921352600000000000
          Width = 108.346526670000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'PESO L'#205'QUIDO')
          ParentFont = False
        end
        object Memo114: TfrxMemoView
          Left = 636.220883330000000000
          Top = 79.370093390000000000
          Width = 108.346526670000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          HideZeros = True
          Memo.UTF8W = (
            '[Volumes."PesoL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
      end
      object MarcaDagua: TfrxOverlay
        FillType = ftBrush
        Height = 1122.519685040000000000
        Top = 1432.441870000000000000
        Width = 744.567410000000000000
        object memWatermark: TfrxMemoView
          Align = baClient
          Width = 744.567410000000000000
          Height = 1122.519685040000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14211288
          Font.Height = -67
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Parametros."Mensagem0"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 3.779527560000000000
        Top = 1118.740880000000000000
        Width = 744.567410000000000000
        object Memo161: TfrxMemoView
          Width = 60.472480000000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo162: TfrxMemoView
          Left = 60.472480000000000000
          Width = 222.992270000000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object Memo163: TfrxMemoView
          Left = 283.464750000000000000
          Width = 37.795300000000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo164: TfrxMemoView
          Left = 321.260050000000000000
          Width = 26.456695350000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo165: TfrxMemoView
          Left = 347.716564720000000000
          Width = 24.566929130000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          ParentFont = False
        end
        object Memo166: TfrxMemoView
          Left = 372.283493860000000000
          Width = 22.677180000000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
        end
        object Memo167: TfrxMemoView
          Left = 394.960659210000000000
          Width = 43.464574250000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo168: TfrxMemoView
          Left = 438.425480000000000000
          Width = 52.913385826771700000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo169: TfrxMemoView
          Left = 491.338582677165000000
          Width = 45.354360000000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          HideZeros = True
          ParentFont = False
        end
        object Memo170: TfrxMemoView
          Left = 536.692913385827000000
          Width = 41.574803150000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo171: TfrxMemoView
          Left = 578.267716535433000000
          Width = 41.574830000000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo172: TfrxMemoView
          Left = 619.842920000000000000
          Width = 41.574803150000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo173: TfrxMemoView
          Left = 661.417322830000000000
          Width = 41.574803150000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo174: TfrxMemoView
          Left = 702.992125980000000000
          Width = 20.787401570000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
        object Memo175: TfrxMemoView
          Left = 723.779527560000000000
          Width = 20.787401570000000000
          Height = 3.779527560000000000
          StretchMode = smActualHeight
          DisplayFormat.FormatStr = ',0.00##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haRight
          HideZeros = True
          ParentFont = False
        end
      end
      object DadosProdutosFooter: TfrxGroupFooter
        FillType = ftBrush
        Top = 1096.063700000000000000
        Width = 744.567410000000000000
        OnBeforePrint = 'DadosProdutosFooterOnBeforePrint'
      end
      object Child2: TfrxChild
        FillType = ftBrush
        Top = 1145.197590000000000000
        Width = 744.567410000000000000
        Child = frxReport1.DadosAdicionais
        object Line2: TfrxLineView
          Align = baWidth
          Width = 744.567410000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
      end
      object LocalRetirada: TfrxMasterData
        FillType = ftBrush
        Height = 43.354342910000000000
        Top = 476.220780000000000000
        Width = 744.567410000000000000
        DataSetName = 'LocalRetirada'
        RowCount = 0
        object Memo10: TfrxMemoView
          Top = 16.897650000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 26.346390790000000000
          Width = 113.385826770000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[LocalRetirada."CNPJ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo14: TfrxMemoView
          Left = 113.385900000000000000
          Top = 16.897650000000000000
          Width = 631.181510000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.346390790000000000
          Width = 631.181510000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            
              '[LocalRetirada."XLgr"] [LocalRetirada."Nro"] [LocalRetirada."XCp' +
              'l"] - [LocalRetirada."XBairro"] - [LocalRetirada."XMun"] - [Loca' +
              'lRetirada."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo185: TfrxMemoView
          Top = 3.779530000000020000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'LOCAL RETIRADA')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object LocalEntrega: TfrxMasterData
        FillType = ftBrush
        Height = 43.354342910000000000
        Top = 544.252320000000000000
        Width = 744.567410000000000000
        DataSetName = 'LocalEntrega'
        RowCount = 0
        object Memo54: TfrxMemoView
          Top = 16.897650000000000000
          Width = 113.385900000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CNPJ / CPF')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 26.346390790000000000
          Width = 113.385826770000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[LocalEntrega."CNPJ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo56: TfrxMemoView
          Left = 113.385900000000000000
          Top = 16.897650000000000000
          Width = 631.181510000000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.346390790000000000
          Width = 631.181510000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            
              '[LocalEntrega."XLgr"] [LocalEntrega."Nro"] [LocalEntrega."XCpl"]' +
              ' - [LocalEntrega."XBairro"] - [LocalEntrega."XMun"] - [LocalEntr' +
              'ega."UF"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo81: TfrxMemoView
          Top = 3.779530000000020000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'LOCAL ENTREGA')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object ColumnFooter1: TfrxColumnFooter
        FillType = ftBrush
        Height = 43.464566930000000000
        Top = 2615.434760000000000000
        Width = 744.567410000000000000
        object ISSQN: TfrxSubreport
          Width = 744.567410000000000000
          Height = 43.464566930000000000
          Page = frxReport1.PageISSQN
          PrintOnParent = True
        end
      end
      object CanhotoRodape: TfrxChild
        FillType = ftBrush
        Height = 77.370105590000000000
        Top = 1330.394560000000000000
        Width = 744.567410000000000000
        Stretched = True
        object canhotorodaperecebemos: TfrxMemoView
          Top = 9.338590000000070000
          Width = 642.520100000000000000
          Height = 37.795275590000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            
              'Recebemos de [Emitente."XNome"] os produtos e/ou servi'#231'os consta' +
              'ntes da Nota Fiscal Eletr'#244'nica indicada ao lado. '
            '[Parametros."ResumoCanhoto"]')
          ParentFont = False
          WordWrap = False
        end
        object canhotorodapeassinatura: TfrxMemoView
          Left = 143.622140000000000000
          Top = 47.133865589999900000
          Width = 498.897960000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O E ASSINATURA DO RECEBEDOR')
          ParentFont = False
        end
        object canhotorodapedata: TfrxMemoView
          Top = 47.133865589999900000
          Width = 143.622140000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'DATA DO RECEBIMENTO')
          ParentFont = False
        end
        object canhotorodapelinha: TfrxLineView
          Align = baWidth
          Top = 3.779530000000020000
          Width = 744.567410000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
          Frame.Width = 0.500000000000000000
        end
        object canhotorodapenumeronfe: TfrxMemoView
          Left = 642.520100000000000000
          Top = 9.338590000000070000
          Width = 102.047212360000000000
          Height = 68.031496060000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'NF-e'
            'N'#186' [Identificacao."NNF"]'
            'S'#233'rie [Identificacao."Serie" #n#000]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object DadosAdicionais: TfrxChild
        FillType = ftBrush
        Height = 141.401589450000000000
        Top = 1167.874770000000000000
        Width = 744.567410000000000000
        Child = frxReport1.CanhotoRodape
        Stretched = True
        object memFisco: TfrxMemoView
          Left = 487.559055120000000000
          Top = 16.677179999999900000
          Width = 257.007852050000000000
          Height = 124.724409450000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'RESERVADO AO FISCO')
          ParentFont = False
        end
        object memInformacoesComplementares: TfrxMemoView
          Top = 16.677179999999900000
          Width = 487.559055120000000000
          Height = 124.724402130000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'INFORMA'#199#213'ES COMPLEMENTARES')
          ParentFont = False
        end
        object memOBS: TfrxMemoView
          ShiftMode = smWhenOverlapped
          Top = 23.881862910000100000
          Width = 485.669288900000000000
          Height = 117.165354330000000000
          ExpressionDelimiters = '[%,%]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
        object memDadosAdicionais: TfrxMemoView
          Top = 1.889763780000070000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'DADOS ADICIONAIS')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Duplicatas: TfrxMasterData
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 721.890230000000000000
        Width = 744.567410000000000000
        Columns = 5
        ColumnWidth = 148.913385826772000000
        DataSetName = 'Duplicatas'
        RowCount = 0
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 744.567410000000000000
          Height = 37.795300000000000000
          Frame.Width = 0.500000000000000000
        end
        object Memo66: TfrxMemoView
          Width = 148.913385830000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            'N'#250'mero'
            'Vencimento'
            'Valor')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo138: TfrxMemoView
          Left = 56.692950000000000000
          Width = 3.779530000000000000
          Height = 37.795275590000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          LineSpacing = 3.000000000000000000
          Memo.UTF8W = (
            ':'
            ':'
            ':')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo147: TfrxMemoView
          Left = 60.472480000000000000
          Width = 86.929190000000000000
          Height = 12.472440940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            '[Duplicatas."NDup"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo148: TfrxMemoView
          Left = 60.472480000000000000
          Top = 12.472440940000000000
          Width = 86.929190000000000000
          Height = 12.472440940000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            '[Duplicatas."DVenc"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo156: TfrxMemoView
          Left = 60.472480000000000000
          Top = 24.944881890000000000
          Width = 86.929190000000000000
          Height = 12.472440940000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 3.000000000000000000
          Memo.UTF8W = (
            '[Duplicatas."VDup"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
    object PageISSQN: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object subISSQN: TfrxMasterData
        FillType = ftBrush
        Height = 43.354342910000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSetName = 'ISSQN'
        RowCount = 0
        object Memo5: TfrxMemoView
          Top = 3.779530000000000000
          Width = 430.866420000000000000
          Height = 13.228344020000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            'C'#193'LCULO DO ISSQN')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo7: TfrxMemoView
          Top = 16.897650000000000000
          Width = 217.322859060000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'INSCRI'#199#195'O MUNICIPAL')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Top = 26.346390790000000000
          Width = 217.322859060000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          Memo.UTF8W = (
            '[Emitente."IM"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo60: TfrxMemoView
          Left = 217.322859060000000000
          Top = 16.897650000000000000
          Width = 179.527559060000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR TOTAL DOS SERVI'#199'OS')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 217.322859060000000000
          Top = 26.346390790000000000
          Width = 179.527559060000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[ISSQN."VServ"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo62: TfrxMemoView
          Left = 396.850418110000000000
          Top = 16.897650000000000000
          Width = 179.527559060000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'BASE DE C'#193'LCULO DO ISSQN')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 396.850418110000000000
          Top = 26.346390790000000000
          Width = 179.527559060000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[ISSQN."VBC"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo64: TfrxMemoView
          Left = 576.377977170000000000
          Top = 16.897650000000000000
          Width = 179.527559060000000000
          Height = 26.456692910000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'VALOR TOTAL DO ISSQN')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 576.377977170000000000
          Top = 26.346390790000000000
          Width = 179.527559060000000000
          Height = 17.007874020000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapX = 5.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[ISSQN."VISS"]')
          ParentFont = False
          VAlign = vaBottom
        end
      end
    end
    object pgContDadosAdicionais: TfrxReportPage
      Visible = False
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 7.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 7.000000000000000000
      BottomMargin = 7.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 124.724490000000000000
        Top = 90.708720000000000000
        Width = 740.787880000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        RowCount = 1
        Stretched = True
        object Memo137: TfrxMemoView
          Width = 740.787565120000000000
          Height = 124.724402130000000000
          StretchMode = smMaxHeight
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          Memo.UTF8W = (
            'CONTINUACAO DAS INFORMA'#199#213'ES COMPLEMENTARES')
          ParentFont = False
        end
        object memContInfAdicionais: TfrxMemoView
          Top = 11.000000000000000000
          Width = 738.897798900000000000
          Height = 109.606294330000000000
          StretchMode = smMaxHeight
          ExpressionDelimiters = '[%,%]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Width = 0.500000000000000000
          GapY = 2.000000000000000000
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 11.338590000000000000
        Top = 18.897650000000000000
        Width = 740.787880000000000000
        OnBeforePrint = 'PageHeader1OnBeforePrint'
      end
    end
  end
  object FDBusca2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produtos')
    Left = 419
    Top = 388
  end
end
