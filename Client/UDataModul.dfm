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
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end>
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
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 18
      Size = 2
    end
    object cdsNotasFiscaisItensVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
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
    AfterPost = cdsTiposDeOperacaoAfterPost
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
end
