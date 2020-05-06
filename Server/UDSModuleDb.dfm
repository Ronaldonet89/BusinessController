object DSModuleDb: TDSModuleDb
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  Height = 630
  Width = 1293
  object SQLConexao: TSQLConnection
    ConnectionName = 'FBCONNECTION'
    DriverName = 'Firebird'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=16.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'ErrorResourceFile='
      'ServerCharSet='
      'drivername=Firebird'
      'Database=C:\Sat\Server\BIJOUXNET_OFICIAL.FDB'
      'rolename=RoleName'
      'user_name=sysdba'
      'Password=masterkey'
      'sqldialect=3'
      'localecode=0000'
      'blobsize=-1'
      'commitretain=False'
      'waitonlocks=True'
      'isolationlevel=ReadCommitted'
      'trim char=False')
    Left = 32
    Top = 10
  end
  object SQLDSComandas: TSQLDataSet
    CommandText = 'SELECT * FROM COMANDAS ORDER BY ID_COMANDA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 1208
    Top = 16
    object SQLDSComandasID_COMANDA: TIntegerField
      FieldName = 'ID_COMANDA'
      Required = True
    end
    object SQLDSComandasNUMERO_COMANDA: TStringField
      FieldName = 'NUMERO_COMANDA'
      Size = 100
    end
  end
  object DSPComandas: TDataSetProvider
    DataSet = SQLDSComandas
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 1208
    Top = 64
  end
  object cdsComandas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPComandas'
    Left = 1208
    Top = 120
    object cdsComandasID_COMANDA: TIntegerField
      FieldName = 'ID_COMANDA'
      Required = True
    end
    object cdsComandasNUMERO_COMANDA: TStringField
      FieldName = 'NUMERO_COMANDA'
      Size = 100
    end
  end
  object dsComandas: TDataSource
    AutoEdit = False
    DataSet = cdsComandas
    Left = 1208
    Top = 176
  end
  object SQLDSUsuarios: TSQLDataSet
    CommandText = 'SELECT * FROM USUARIOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 380
    Top = 112
    object SQLDSUsuariosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object SQLDSUsuariosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 255
    end
    object SQLDSUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 255
    end
    object SQLDSUsuariosTIPO_SKIN_TELA: TStringField
      FieldName = 'TIPO_SKIN_TELA'
      Size = 50
    end
    object SQLDSUsuariosID_GRUPO: TIntegerField
      FieldName = 'ID_GRUPO'
    end
  end
  object DSPUsuarios: TDataSetProvider
    DataSet = SQLDSUsuarios
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 380
    Top = 168
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPUsuarios'
    AfterInsert = cdsUsuariosAfterInsert
    AfterPost = cdsUsuariosAfterPost
    BeforeDelete = cdsUsuariosBeforeDelete
    AfterDelete = cdsUsuariosAfterDelete
    Left = 380
    Top = 221
    object cdsUsuariosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object cdsUsuariosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 255
    end
    object cdsUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      EditMask = '*******************;1;_'
      Size = 255
    end
  end
  object DSUsuarios: TDataSource
    AutoEdit = False
    DataSet = cdsUsuarios
    Left = 380
    Top = 277
  end
  object SQLDSPermissoesUsuariosSistema: TSQLDataSet
    CommandText = 
      'SELECT * FROM PERMISSOES_USUARIOS_SISTEMA ORDER BY ID_PERMISSAO_' +
      'USUARIO_SISTEMA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 235
    Top = 112
    object SQLDSPermissoesUsuariosSistemaID_PERMISSAO_USUARIO_SISTEMA: TIntegerField
      FieldName = 'ID_PERMISSAO_USUARIO_SISTEMA'
      Required = True
    end
    object SQLDSPermissoesUsuariosSistemaPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Size = 255
    end
  end
  object DSPPermissoesUsuariosSistema: TDataSetProvider
    DataSet = SQLDSPermissoesUsuariosSistema
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 235
    Top = 168
  end
  object cdsPermissoesUsuariosSistema: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPermissoesUsuariosSistema'
    AfterInsert = cdsPermissoesUsuariosSistemaAfterInsert
    AfterPost = cdsPermissoesUsuariosSistemaAfterPost
    AfterDelete = cdsPermissoesUsuariosSistemaAfterDelete
    Left = 235
    Top = 222
    object cdsPermissoesUsuariosSistemaID_PERMISSAO_USUARIO_SISTEMA: TIntegerField
      FieldName = 'ID_PERMISSAO_USUARIO_SISTEMA'
      Required = True
    end
    object cdsPermissoesUsuariosSistemaPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Size = 255
    end
  end
  object dsPermissoesUsuariossistema: TDataSource
    AutoEdit = False
    DataSet = cdsPermissoesUsuariosSistema
    Left = 235
    Top = 280
  end
  object SQLDSPermissoesVsUsuarios: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT * FROM PERMISSOES_VS_USUARIOS '#13#10'  WHERE ID_USUARIO =:ID_U' +
      'SUARIO'
    DataSource = DSUsuarios
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_USUARIO'
        ParamType = ptInput
      end>
    SQLConnection = SQLConexao
    Left = 68
    Top = 112
    object SQLDSPermissoesVsUsuariosID_PERMISSAO_VS_USUARIO: TIntegerField
      FieldName = 'ID_PERMISSAO_VS_USUARIO'
      Required = True
    end
    object SQLDSPermissoesVsUsuariosID_PERMISSAO_USUARIO_SISTEMA: TIntegerField
      FieldName = 'ID_PERMISSAO_USUARIO_SISTEMA'
      Required = True
    end
    object SQLDSPermissoesVsUsuariosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object SQLDSPermissoesVsUsuariosPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Size = 255
    end
    object SQLDSPermissoesVsUsuariosPERMITE_OU_NAO: TStringField
      FieldName = 'PERMITE_OU_NAO'
      Size = 1
    end
  end
  object DSPSQLDSPermissoesVsUsuarios: TDataSetProvider
    DataSet = SQLDSPermissoesVsUsuarios
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 68
    Top = 168
  end
  object CDSPermissoesVsUsuarios: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_USUARIO'
    MasterFields = 'ID_USUARIO'
    MasterSource = DSUsuarios
    PacketRecords = 0
    Params = <>
    ProviderName = 'DSPSQLDSPermissoesVsUsuarios'
    Left = 68
    Top = 224
    object CDSPermissoesVsUsuariosID_PERMISSAO_VS_USUARIO: TIntegerField
      FieldName = 'ID_PERMISSAO_VS_USUARIO'
      Required = True
    end
    object CDSPermissoesVsUsuariosID_PERMISSAO_USUARIO_SISTEMA: TIntegerField
      FieldName = 'ID_PERMISSAO_USUARIO_SISTEMA'
      Required = True
    end
    object CDSPermissoesVsUsuariosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object CDSPermissoesVsUsuariosPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Size = 255
    end
    object CDSPermissoesVsUsuariosPERMITE_OU_NAO: TStringField
      FieldName = 'PERMITE_OU_NAO'
      Size = 1
    end
  end
  object DSPermissoesVsUsuarios: TDataSource
    AutoEdit = False
    DataSet = CDSPermissoesVsUsuarios
    Left = 68
    Top = 280
  end
  object SQLDSPedidos: TSQLDataSet
    CommandText = 'SELECT * FROM PEDIDOS ORDER BY ID_PEDIDO desc'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 112
    Top = 8
    object SQLDSPedidosID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object SQLDSPedidosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object SQLDSPedidosID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object SQLDSPedidosNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 255
    end
    object SQLDSPedidosDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object SQLDSPedidosHORA_PEDIDO: TDateField
      FieldName = 'HORA_PEDIDO'
    end
    object SQLDSPedidosDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object SQLDSPedidosDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object SQLDSPedidosFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object SQLDSPedidosCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 100
    end
    object SQLDSPedidosDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
    end
    object SQLDSPedidosFORMA_ENTREGA: TStringField
      FieldName = 'FORMA_ENTREGA'
      Size = 100
    end
    object SQLDSPedidosVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDATA_NF: TDateField
      FieldName = 'DATA_NF'
    end
    object SQLDSPedidosNUMERO_NF: TIntegerField
      FieldName = 'NUMERO_NF'
    end
    object SQLDSPedidosNUMERO_PARCELAS: TIntegerField
      FieldName = 'NUMERO_PARCELAS'
    end
    object SQLDSPedidosOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object SQLDSPedidosPERCENTUAL_ICMS: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosPERCENTUAL_IPI: TFMTBCDField
      FieldName = 'PERCENTUAL_IPI'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
    object SQLDSPedidosTIPO_OPERACAO: TStringField
      FieldName = 'TIPO_OPERACAO'
      Size = 2
    end
    object SQLDSPedidosID_FORMA_DE_ENTREGA: TIntegerField
      FieldName = 'ID_FORMA_DE_ENTREGA'
    end
    object SQLDSPedidosID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
    end
    object SQLDSPedidosID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
    end
    object SQLDSPedidosID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
    end
    object SQLDSPedidosID_ORCAMENTO: TIntegerField
      FieldName = 'ID_ORCAMENTO'
    end
    object SQLDSPedidosNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 255
    end
    object SQLDSPedidosDATA_DO_PARTO: TDateField
      FieldName = 'DATA_DO_PARTO'
    end
    object SQLDSPedidosNUMEROCUPOMFISCAL: TStringField
      FieldName = 'NUMEROCUPOMFISCAL'
      Size = 255
    end
    object SQLDSPedidosPEDIDO_JA_CAPTURADO_BALCAO: TStringField
      FieldName = 'PEDIDO_JA_CAPTURADO_BALCAO'
      Size = 1
    end
    object SQLDSPedidosNOME_DO_BEBE: TStringField
      FieldName = 'NOME_DO_BEBE'
      Size = 100
    end
    object SQLDSPedidosVALOR_TOTAL_PRODUTOS: TFMTBCDField
      FieldName = 'VALOR_TOTAL_PRODUTOS'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosPERCENTUAL_DESCONTO: TFMTBCDField
      FieldName = 'PERCENTUAL_DESCONTO'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosID_USUARIO_EXCLUSAO: TIntegerField
      FieldName = 'ID_USUARIO_EXCLUSAO'
    end
    object SQLDSPedidosDATA_EXCLUSAO: TSQLTimeStampField
      FieldName = 'DATA_EXCLUSAO'
    end
    object SQLDSPedidosSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
    end
    object SQLDSPedidosID_PEDIDO_PAI: TIntegerField
      FieldName = 'ID_PEDIDO_PAI'
    end
    object SQLDSPedidosNUMERO_COMANDA: TStringField
      FieldName = 'NUMERO_COMANDA'
      Size = 100
    end
    object SQLDSPedidosPEDIDO_EM_VENDA: TStringField
      FieldName = 'PEDIDO_EM_VENDA'
      Size = 1
    end
    object SQLDSPedidosDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object SQLDSPedidosNUMERO_CUPOM: TStringField
      FieldName = 'NUMERO_CUPOM'
      Size = 100
    end
  end
  object DSPPedidos: TDataSetProvider
    DataSet = SQLDSPedidos
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 112
    Top = 56
  end
  object SQLDSReceber: TSQLDataSet
    CommandText = 'SELECT * FROM RECEBER'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 385
    Top = 8
    object SQLDSReceberID_RECEBER: TIntegerField
      FieldName = 'ID_RECEBER'
      Required = True
    end
    object SQLDSReceberDESCRICAO_TITULO: TStringField
      FieldName = 'DESCRICAO_TITULO'
      Size = 255
    end
    object SQLDSReceberID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object SQLDSReceberID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object SQLDSReceberNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 255
    end
    object SQLDSReceberVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object SQLDSReceberDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object SQLDSReceberVALOR_TITULO: TFMTBCDField
      FieldName = 'VALOR_TITULO'
      Precision = 18
      Size = 2
    end
    object SQLDSReceberVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      Precision = 18
      Size = 2
    end
    object SQLDSReceberNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      Size = 100
    end
    object SQLDSReceberFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object SQLDSReceberSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
  end
  object SQLDSCheques: TSQLDataSet
    CommandText = 'SELECT * FROM CHEQUES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 473
    Top = 8
  end
  object DSPReceber: TDataSetProvider
    DataSet = SQLDSReceber
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 385
    Top = 56
  end
  object DSPCheques: TDataSetProvider
    DataSet = SQLDSCheques
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 473
    Top = 56
  end
  object DSPGenerico: TDataSetProvider
    DataSet = SQLDSGenerica
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 872
    Top = 72
  end
  object SQLDSGenerica: TSQLDataSet
    CommandText = 'select * from pedidos'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 872
    Top = 16
  end
  object SQLDSPedidosItens: TSQLDataSet
    CommandText = 'SELECT * FROM PEDIDOS_ITENS'#13#10'ORDER BY ID_PEDIDO_ITEM'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 198
    Top = 56
    object SQLDSPedidosItensID_PEDIDO_ITEM: TIntegerField
      FieldName = 'ID_PEDIDO_ITEM'
      Required = True
    end
    object SQLDSPedidosItensID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object SQLDSPedidosItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object SQLDSPedidosItensDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 255
    end
    object SQLDSPedidosItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosItensVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosItensVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosItensALIQUOTA_ICMS: TIntegerField
      FieldName = 'ALIQUOTA_ICMS'
    end
    object SQLDSPedidosItensDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosItensCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 200
    end
    object SQLDSPedidosItensCOR: TStringField
      FieldName = 'COR'
      Size = 50
    end
    object SQLDSPedidosItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 80
    end
  end
  object SQLDSMovimentacao: TSQLDataSet
    CommandText = 'SELECT * FROM MOVIMENTACOES ORDER BY'#13#10' ID_MOVIMENTACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 749
    Top = 112
    object SQLDSMovimentacaoID_MOVIMENTACAO: TIntegerField
      FieldName = 'ID_MOVIMENTACAO'
      Required = True
    end
    object SQLDSMovimentacaoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object SQLDSMovimentacaoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object SQLDSMovimentacaoDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object SQLDSMovimentacaoHORA: TTimeField
      FieldName = 'HORA'
      Required = True
    end
    object SQLDSMovimentacaoQTDE_ANTERIOR: TFMTBCDField
      FieldName = 'QTDE_ANTERIOR'
      Precision = 18
      Size = 2
    end
    object SQLDSMovimentacaoQTDE_MOVIMENTADA: TFMTBCDField
      FieldName = 'QTDE_MOVIMENTADA'
      Precision = 18
      Size = 2
    end
    object SQLDSMovimentacaoQTDE_APOS_MOVIMENTACAO: TFMTBCDField
      FieldName = 'QTDE_APOS_MOVIMENTACAO'
      Precision = 18
      Size = 2
    end
    object SQLDSMovimentacaoTIPO_MOVIMENTACAO: TStringField
      FieldName = 'TIPO_MOVIMENTACAO'
      Size = 100
    end
  end
  object DSPPedidosItens: TDataSetProvider
    DataSet = SQLDSPedidosItens
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 198
    Top = 8
  end
  object DSPMovimentacao: TDataSetProvider
    DataSet = SQLDSMovimentacao
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 749
    Top = 160
  end
  object SQLDSGrupoProdutos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM GRUPOS_PRODUTOS '#13#10'ORDER BY ID_GRUPO_PRODUTO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 746
    Top = 8
    object SQLDSGrupoProdutosID_GRUPO_PRODUTO: TIntegerField
      FieldName = 'ID_GRUPO_PRODUTO'
      Required = True
    end
    object SQLDSGrupoProdutosGRUPO_PRODUTO_DESCRICAO: TStringField
      FieldName = 'GRUPO_PRODUTO_DESCRICAO'
      Size = 255
    end
  end
  object DSPGrupoProdutos: TDataSetProvider
    DataSet = SQLDSGrupoProdutos
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 746
    Top = 56
  end
  object DSPPagar: TDataSetProvider
    DataSet = SQLDSPagar
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 569
    Top = 56
  end
  object SQLDSPagar: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select  *  from PAGAR ORDER BY ID_PAGAR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 569
    Top = 8
    object SQLDSPagarID_PAGAR: TIntegerField
      FieldName = 'ID_PAGAR'
      Required = True
    end
    object SQLDSPagarDESCRICAO_TITULO: TStringField
      FieldName = 'DESCRICAO_TITULO'
      Size = 255
    end
    object SQLDSPagarID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object SQLDSPagarID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object SQLDSPagarNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 255
    end
    object SQLDSPagarVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object SQLDSPagarDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object SQLDSPagarVALOR_TITULO: TFMTBCDField
      FieldName = 'VALOR_TITULO'
      Precision = 18
      Size = 2
    end
    object SQLDSPagarVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      Precision = 18
      Size = 2
    end
    object SQLDSPagarNUMERO_CHEQUE: TStringField
      FieldName = 'NUMERO_CHEQUE'
      Size = 100
    end
    object SQLDSPagarFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object SQLDSPagarSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
  end
  object SQLDSProdutos: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM '#13#10'PRODUTOS ORDER BY PRO_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 649
    Top = 8
    object SQLDSProdutosPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SQLDSProdutosPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 255
    end
    object SQLDSProdutosPRO_EAN13: TStringField
      FieldName = 'PRO_EAN13'
    end
    object SQLDSProdutosPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Size = 255
    end
    object SQLDSProdutosPRO_CAMINHO_IMAGEM: TStringField
      FieldName = 'PRO_CAMINHO_IMAGEM'
      Size = 255
    end
    object SQLDSProdutosPRO_SALDO: TFMTBCDField
      FieldName = 'PRO_SALDO'
      Precision = 18
      Size = 2
    end
    object SQLDSProdutosPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
    object SQLDSProdutosID_GRUPO_PRODUTO: TIntegerField
      FieldName = 'ID_GRUPO_PRODUTO'
    end
    object SQLDSProdutosALIQUOTA_ICMS: TIntegerField
      FieldName = 'ALIQUOTA_ICMS'
    end
    object SQLDSProdutosCODIGO_NCM: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 12
    end
    object SQLDSProdutosORIGEM_MERCADORIA: TStringField
      FieldName = 'ORIGEM_MERCADORIA'
      Size = 1
    end
    object SQLDSProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object SQLDSProdutosID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object SQLDSProdutosCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object SQLDSProdutosCOR: TStringField
      FieldName = 'COR'
      Size = 50
    end
    object SQLDSProdutosTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 80
    end
    object SQLDSProdutosMINIMO: TFMTBCDField
      FieldName = 'MINIMO'
      Precision = 18
      Size = 2
    end
    object SQLDSProdutosMAXIMO: TFMTBCDField
      FieldName = 'MAXIMO'
      Precision = 18
      Size = 2
    end
    object SQLDSProdutosCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object SQLDSProdutosCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
  end
  object DSPProdutos: TDataSetProvider
    DataSet = SQLDSProdutos
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 649
    Top = 56
  end
  object DSPClientes: TDataSetProvider
    DataSet = SQLDSClientes
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 289
    Top = 56
  end
  object SQLDSClientes: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'select  *  from Clientes order by id_cliente'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 289
    Top = 8
    object SQLDSClientesID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object SQLDSClientesRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 255
    end
    object SQLDSClientesFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 255
    end
    object SQLDSClientesCPF: TStringField
      FieldName = 'CPF'
    end
    object SQLDSClientesCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object SQLDSClientesINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object SQLDSClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 255
    end
    object SQLDSClientesNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object SQLDSClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object SQLDSClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 255
    end
    object SQLDSClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 100
    end
    object SQLDSClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 100
    end
    object SQLDSClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object SQLDSClientesEMAIL_DANFE: TStringField
      FieldName = 'EMAIL_DANFE'
      Size = 100
    end
    object SQLDSClientesSITUACAO_APURACAO: TStringField
      FieldName = 'SITUACAO_APURACAO'
    end
    object SQLDSClientesCONSUMIDOR_FINAL: TStringField
      FieldName = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object SQLDSClientesPOSSUI_SUFRAMA: TStringField
      FieldName = 'POSSUI_SUFRAMA'
      Size = 1
    end
    object SQLDSClientesCODIGO_SUFRAMA: TStringField
      FieldName = 'CODIGO_SUFRAMA'
      Size = 50
    end
    object SQLDSClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object SQLDSClientesID_TRANSPORTADOR: TIntegerField
      FieldName = 'ID_TRANSPORTADOR'
    end
    object SQLDSClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object SQLDSClientesCODMUNICIPIO: TIntegerField
      FieldName = 'CODMUNICIPIO'
    end
  end
  object SQLDSFornecedores: TSQLDataSet
    CommandText = 'SELECT * FROM FORNECEDORES '#13#10'ORDER BY ID_FORNECEDOR'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 472
    Top = 112
    object SQLDSFornecedoresID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Required = True
    end
    object SQLDSFornecedoresRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 255
    end
    object SQLDSFornecedoresCPF: TStringField
      FieldName = 'CPF'
    end
    object SQLDSFornecedoresCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object SQLDSFornecedoresRG: TStringField
      FieldName = 'RG'
    end
    object SQLDSFornecedoresINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object SQLDSFornecedoresCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 255
    end
    object SQLDSFornecedoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 255
    end
    object SQLDSFornecedoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 100
    end
    object SQLDSFornecedoresCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 100
    end
    object SQLDSFornecedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 255
    end
    object SQLDSFornecedoresNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object SQLDSFornecedoresCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 255
    end
    object SQLDSFornecedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 255
    end
    object SQLDSFornecedoresCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object SQLDSFornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 255
    end
    object SQLDSFornecedoresESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 100
    end
    object SQLDSFornecedoresOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object SQLDSFornecedoresTIPO_FORNECEDOR: TStringField
      FieldName = 'TIPO_FORNECEDOR'
      Size = 30
    end
    object SQLDSFornecedoresFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 255
    end
    object SQLDSFornecedoresUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object DSPFornecedores: TDataSetProvider
    DataSet = SQLDSFornecedores
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 472
    Top = 168
  end
  object SQLDSProdutosMateriasPrimas: TSQLDataSet
    CommandText = 
      'SELECT * FROM PRODUTOS_MATERIAS_PRIMAS'#13#10'ORDER BY ID_PRODUTO_MATE' +
      'RIA_PRIMA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 608
    Top = 112
    object SQLDSProdutosMateriasPrimasID_PRODUTO_MATERIA_PRIMA: TIntegerField
      FieldName = 'ID_PRODUTO_MATERIA_PRIMA'
      Required = True
    end
    object SQLDSProdutosMateriasPrimasID_MATERIA_PRIMA: TIntegerField
      FieldName = 'ID_MATERIA_PRIMA'
      Required = True
    end
    object SQLDSProdutosMateriasPrimasID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object SQLDSProdutosMateriasPrimasQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object SQLDSProdutosMateriasPrimasDESCRICAO_MATERIA_PRIMA: TStringField
      FieldName = 'DESCRICAO_MATERIA_PRIMA'
      Size = 255
    end
  end
  object DSPProdutosMateriasPrimas: TDataSetProvider
    DataSet = SQLDSProdutosMateriasPrimas
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 608
    Top = 159
  end
  object SQLDSMateriasPrimas: TSQLDataSet
    CommandText = 
      'SELECT PRO_ID, PRO_DESCRICAO, PRO_CODIGO,'#13#10'PRO_SALDO, PRECO_VEND' +
      'A FROM PRODUTOS'#13#10'WHERE PRO_ID NOT IN ('#13#10'  SELECT ID_PRODUTO FROM' +
      '  PRODUTOS_MATERIAS_PRIMAS)'#13#10'ORDER BY  PRO_ID'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 608
    Top = 214
    object SQLDSMateriasPrimasPRO_ID: TIntegerField
      FieldName = 'PRO_ID'
      Required = True
    end
    object SQLDSMateriasPrimasPRO_DESCRICAO: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 255
    end
    object SQLDSMateriasPrimasPRO_CODIGO: TStringField
      FieldName = 'PRO_CODIGO'
      Size = 255
    end
    object SQLDSMateriasPrimasPRO_SALDO: TFMTBCDField
      FieldName = 'PRO_SALDO'
      Precision = 18
      Size = 2
    end
    object SQLDSMateriasPrimasPRECO_VENDA: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
  end
  object DSPMateriasPrimas: TDataSetProvider
    DataSet = SQLDSMateriasPrimas
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 608
    Top = 261
  end
  object SQLDSProdutosAcabados: TSQLDataSet
    CommandText = 
      'SELECT PRO_ID, PRO_DESCRICAO, PRO_CODIGO,'#13#10'PRO_SALDO, PRECO_VEND' +
      'A FROM PRODUTOS'#13#10'ORDER BY  PRO_ID'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 748
    Top = 215
    object IntegerField1: TIntegerField
      FieldName = 'PRO_ID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'PRO_DESCRICAO'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'PRO_CODIGO'
      Size = 255
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'PRO_SALDO'
      Precision = 18
      Size = 2
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'PRECO_VENDA'
      Precision = 18
      Size = 2
    end
  end
  object DSPProdutosAcabados: TDataSetProvider
    DataSet = SQLDSProdutosAcabados
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 748
    Top = 262
  end
  object SQLDSNotasFiscais: TSQLDataSet
    CommandText = 'SELECT * FROM NOTAS_FISCAIS'#13#10'  ORDER BY ID_NOTA_FISCAL DESC'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 480
    Top = 224
    object SQLDSNotasFiscaisID_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
      Required = True
    end
    object SQLDSNotasFiscaisID_TRANSPORTADOR: TIntegerField
      FieldName = 'ID_TRANSPORTADOR'
    end
    object SQLDSNotasFiscaisID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object SQLDSNotasFiscaisID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object SQLDSNotasFiscaisID_NATUREZA_OPERACAO: TIntegerField
      FieldName = 'ID_NATUREZA_OPERACAO'
      Required = True
    end
    object SQLDSNotasFiscaisDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object SQLDSNotasFiscaisDATA_SAIDA_ENTRADA: TDateField
      FieldName = 'DATA_SAIDA_ENTRADA'
    end
    object SQLDSNotasFiscaisHORA_SAIDA_ENTRADA: TTimeField
      FieldName = 'HORA_SAIDA_ENTRADA'
    end
    object SQLDSNotasFiscaisENTRADA_SAIDA: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
    end
    object SQLDSNotasFiscaisTIPO_EMISSAO: TStringField
      FieldName = 'TIPO_EMISSAO'
      Size = 100
    end
    object SQLDSNotasFiscaisINFORMACAO_NFE: TStringField
      FieldName = 'INFORMACAO_NFE'
      Size = 100
    end
    object SQLDSNotasFiscaisBASE_CALCULO_ICMS: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_ST: TFMTBCDField
      FieldName = 'VALOR_ST'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_PRODUTOS: TFMTBCDField
      FieldName = 'VALOR_PRODUTOS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_IMPOSTO_IMPORTACAO: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO_IMPORTACAO'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_PIS: TFMTBCDField
      FieldName = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_COFINS: TFMTBCDField
      FieldName = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_OUTROS: TFMTBCDField
      FieldName = 'VALOR_OUTROS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisVALOR_TOTAL_NOTA: TFMTBCDField
      FieldName = 'VALOR_TOTAL_NOTA'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object SQLDSNotasFiscaisESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 100
    end
    object SQLDSNotasFiscaisMARCA: TStringField
      FieldName = 'MARCA'
      Size = 100
    end
    object SQLDSNotasFiscaisNUMERO_VOLUME: TStringField
      FieldName = 'NUMERO_VOLUME'
      Size = 10
    end
    object SQLDSNotasFiscaisPESO_LIQUIDO: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisPESO_BRUTO: TFMTBCDField
      FieldName = 'PESO_BRUTO'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisNUMERO_NOTA_FISCAL: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
    end
    object SQLDSNotasFiscaisNUMERO_PROTOCOLO_RECEBIMENTO: TStringField
      FieldName = 'NUMERO_PROTOCOLO_RECEBIMENTO'
      Size = 255
    end
    object SQLDSNotasFiscaisMOTIVO_RECEBIMENTO: TStringField
      FieldName = 'MOTIVO_RECEBIMENTO'
      Size = 255
    end
    object SQLDSNotasFiscaisRESPONSAVEL_FRETE: TStringField
      FieldName = 'RESPONSAVEL_FRETE'
      Size = 1
    end
    object SQLDSNotasFiscaisDATA_HORA_RECEBIMENTO: TStringField
      FieldName = 'DATA_HORA_RECEBIMENTO'
      Size = 100
    end
    object SQLDSNotasFiscaisNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 255
    end
    object SQLDSNotasFiscaisFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object SQLDSNotasFiscaisCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 100
    end
    object SQLDSNotasFiscaisNUMERO_PARCELAS: TIntegerField
      FieldName = 'NUMERO_PARCELAS'
    end
    object SQLDSNotasFiscaisNATUREZA_DE_OPERACAO: TStringField
      FieldName = 'NATUREZA_DE_OPERACAO'
      Size = 60
    end
    object SQLDSNotasFiscaisNFE_CALCULADA: TStringField
      FieldName = 'NFE_CALCULADA'
      Size = 1
    end
    object SQLDSNotasFiscaisID_FORMA_DE_ENTREGA: TIntegerField
      FieldName = 'ID_FORMA_DE_ENTREGA'
    end
    object SQLDSNotasFiscaisID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
    end
    object SQLDSNotasFiscaisID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
    end
    object SQLDSNotasFiscaisBASE_CALCULO_PIS: TFMTBCDField
      FieldName = 'BASE_CALCULO_PIS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisNUMERO_BASE_CALCULO_ICMS: TIntegerField
      FieldName = 'NUMERO_BASE_CALCULO_ICMS'
    end
    object SQLDSNotasFiscaisNUMERO_BASE_CALCULO_ICMS_ST: TIntegerField
      FieldName = 'NUMERO_BASE_CALCULO_ICMS_ST'
    end
    object SQLDSNotasFiscaisNUMERO_PROTOCOLO_CANCELAMENTO: TStringField
      FieldName = 'NUMERO_PROTOCOLO_CANCELAMENTO'
      Size = 255
    end
    object SQLDSNotasFiscaisDATA_HORA_CANCELAMENTO: TStringField
      FieldName = 'DATA_HORA_CANCELAMENTO'
      Size = 100
    end
    object SQLDSNotasFiscaisMOTIVO_CANCELAMENTO: TStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 255
    end
    object SQLDSNotasFiscaisCFOP: TIntegerField
      FieldName = 'CFOP'
    end
    object SQLDSNotasFiscaisCFOPDESCRICAO: TStringField
      FieldName = 'CFOPDESCRICAO'
      Size = 300
    end
  end
  object DSPNotasFiscais: TDataSetProvider
    DataSet = SQLDSNotasFiscais
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 480
    Top = 280
  end
  object cdsGenerico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 872
    Top = 136
  end
  object SQLDSNotasFiscaisEntrada: TSQLDataSet
    CommandText = 
      'SELECT * FROM NOTAS_FISCAIS'#13#10'WHERE UPPER(ENTRADA_SAIDA) = '#39'E'#39#13#10' ' +
      ' ORDER BY ID_NOTA_FISCAL DESC'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 992
    Top = 16
    object IntegerField2: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_TRANSPORTADOR'
    end
    object IntegerField4: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object IntegerField5: TIntegerField
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'ID_NATUREZA_OPERACAO'
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object DateField2: TDateField
      FieldName = 'DATA_SAIDA_ENTRADA'
    end
    object TimeField1: TTimeField
      FieldName = 'HORA_SAIDA_ENTRADA'
    end
    object StringField3: TStringField
      FieldName = 'ENTRADA_SAIDA'
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'TIPO_EMISSAO'
      Size = 100
    end
    object StringField5: TStringField
      FieldName = 'INFORMACAO_NFE'
      Size = 100
    end
    object FMTBCDField3: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'BASE_ST'
      Precision = 18
      Size = 2
    end
    object FMTBCDField6: TFMTBCDField
      FieldName = 'VALOR_ST'
      Precision = 18
      Size = 2
    end
    object FMTBCDField7: TFMTBCDField
      FieldName = 'VALOR_PRODUTOS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField8: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object FMTBCDField9: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 18
      Size = 2
    end
    object FMTBCDField10: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object FMTBCDField11: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO_IMPORTACAO'
      Precision = 18
      Size = 2
    end
    object FMTBCDField12: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object FMTBCDField13: TFMTBCDField
      FieldName = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField14: TFMTBCDField
      FieldName = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField15: TFMTBCDField
      FieldName = 'VALOR_OUTROS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField16: TFMTBCDField
      FieldName = 'VALOR_TOTAL_NOTA'
      Precision = 18
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
    object StringField7: TStringField
      FieldName = 'ESPECIE'
      Size = 100
    end
    object StringField8: TStringField
      FieldName = 'MARCA'
      Size = 100
    end
    object StringField9: TStringField
      FieldName = 'NUMERO_VOLUME'
      Size = 10
    end
    object FMTBCDField17: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      Precision = 18
      Size = 2
    end
    object FMTBCDField18: TFMTBCDField
      FieldName = 'PESO_BRUTO'
      Precision = 18
      Size = 2
    end
    object IntegerField7: TIntegerField
      FieldName = 'NUMERO_NOTA_FISCAL'
    end
    object StringField10: TStringField
      FieldName = 'NUMERO_PROTOCOLO_RECEBIMENTO'
      Size = 255
    end
    object StringField11: TStringField
      FieldName = 'MOTIVO_RECEBIMENTO'
      Size = 255
    end
    object StringField12: TStringField
      FieldName = 'RESPONSAVEL_FRETE'
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'DATA_HORA_RECEBIMENTO'
      Size = 100
    end
    object StringField14: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 255
    end
    object StringField15: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object StringField16: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 100
    end
    object IntegerField8: TIntegerField
      FieldName = 'NUMERO_PARCELAS'
    end
    object StringField17: TStringField
      FieldName = 'NATUREZA_DE_OPERACAO'
      Size = 60
    end
    object StringField18: TStringField
      FieldName = 'NFE_CALCULADA'
      Size = 1
    end
    object IntegerField9: TIntegerField
      FieldName = 'ID_FORMA_DE_ENTREGA'
    end
    object IntegerField10: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
    end
    object IntegerField11: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
    end
    object FMTBCDField19: TFMTBCDField
      FieldName = 'BASE_CALCULO_PIS'
      Precision = 18
      Size = 2
    end
    object IntegerField12: TIntegerField
      FieldName = 'NUMERO_BASE_CALCULO_ICMS'
    end
    object IntegerField13: TIntegerField
      FieldName = 'NUMERO_BASE_CALCULO_ICMS_ST'
    end
    object StringField19: TStringField
      FieldName = 'NUMERO_PROTOCOLO_CANCELAMENTO'
      Size = 255
    end
    object StringField20: TStringField
      FieldName = 'DATA_HORA_CANCELAMENTO'
      Size = 100
    end
    object StringField21: TStringField
      FieldName = 'MOTIVO_CANCELAMENTO'
      Size = 255
    end
    object SQLDSNotasFiscaisEntradaNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 255
    end
    object SQLDSNotasFiscaisEntradaID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object SQLDSNotasFiscaisEntradaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
  end
  object DSPNotasFiscaisEntrada: TDataSetProvider
    DataSet = SQLDSNotasFiscaisEntrada
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 992
    Top = 72
  end
  object SQLDSNotasFiscaisEntradaItens: TSQLDataSet
    CommandText = 'SELECT * FROM NOTAS_FISCAIS_ITENS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 992
    Top = 128
    object IntegerField14: TIntegerField
      FieldName = 'ID_NOTA_FISCAL_ITEM'
      Required = True
    end
    object IntegerField15: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object IntegerField16: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
      Required = True
    end
    object FMTBCDField20: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object StringField22: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object StringField23: TStringField
      FieldName = 'CST_ICMS'
      Size = 4
    end
    object FMTBCDField21: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField22: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object StringField24: TStringField
      FieldName = 'CST_IPI'
      Size = 4
    end
    object FMTBCDField23: TFMTBCDField
      FieldName = 'PERCENTUAL_IPI'
      Precision = 18
      Size = 2
    end
    object FMTBCDField24: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object StringField25: TStringField
      FieldName = 'CST_PIS'
      Size = 4
    end
    object FMTBCDField25: TFMTBCDField
      FieldName = 'PERCENTUAL_PIS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField26: TFMTBCDField
      FieldName = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object StringField26: TStringField
      FieldName = 'CST_COFINS'
      Size = 4
    end
    object FMTBCDField27: TFMTBCDField
      FieldName = 'PERCENTUAL_COFINS'
      Precision = 18
      Size = 2
    end
    object FMTBCDField28: TFMTBCDField
      FieldName = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object StringField27: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 255
    end
    object StringField28: TStringField
      FieldName = 'CODIGO_PRODUTO'
      Size = 255
    end
    object StringField29: TStringField
      FieldName = 'NCM_PRODUTO'
      Size = 15
    end
    object StringField30: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object FMTBCDField29: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object FMTBCDField30: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object FMTBCDField31: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object FMTBCDField32: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 18
      Size = 2
    end
    object FMTBCDField33: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object StringField31: TStringField
      FieldName = 'INFORMACOES_ADICIONAIS'
      Size = 255
    end
    object FMTBCDField34: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS'
      Precision = 18
      Size = 2
    end
    object StringField32: TStringField
      FieldName = 'CST_ICMS_ST'
      Size = 4
    end
    object FMTBCDField35: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object FMTBCDField36: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object FMTBCDField37: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object FMTBCDField38: TFMTBCDField
      FieldName = 'BASE_CALCULO_IPI'
      Precision = 18
      Size = 2
    end
    object FMTBCDField39: TFMTBCDField
      FieldName = 'BASE_CALCULO_COFINS'
      Precision = 18
      Size = 2
    end
    object StringField33: TStringField
      FieldName = 'EAN13'
    end
    object StringField34: TStringField
      FieldName = 'ORIGEM_MERCADORIA'
      Size = 1
    end
    object SQLDSNotasFiscaisEntradaItensDESCRICAO_PRODUTO_XML: TStringField
      FieldName = 'DESCRICAO_PRODUTO_XML'
      Size = 255
    end
  end
  object DSPNotasFiscaisEntradaItens: TDataSetProvider
    DataSet = SQLDSNotasFiscaisEntradaItens
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 992
    Top = 181
  end
  object SQLDSPedidosDeCompra: TSQLDataSet
    CommandText = 'SELECT * FROM PEDIDOS_DE_COMPRA'#13#10'  ORDER BY ID_PEDIDO_DE_COMPRA'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 64
    Top = 342
    object SQLDSPedidosDeCompraID_PEDIDO_DE_COMPRA: TIntegerField
      FieldName = 'ID_PEDIDO_DE_COMPRA'
      Required = True
    end
    object SQLDSPedidosDeCompraID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object SQLDSPedidosDeCompraID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object SQLDSPedidosDeCompraNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 255
    end
    object SQLDSPedidosDeCompraDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object SQLDSPedidosDeCompraHORA_PEDIDO: TDateField
      FieldName = 'HORA_PEDIDO'
    end
    object SQLDSPedidosDeCompraDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
    end
    object SQLDSPedidosDeCompraDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
    end
    object SQLDSPedidosDeCompraFORMA_PAGAMENTO: TStringField
      FieldName = 'FORMA_PAGAMENTO'
      Size = 100
    end
    object SQLDSPedidosDeCompraCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 100
    end
    object SQLDSPedidosDeCompraDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
    end
    object SQLDSPedidosDeCompraFORMA_ENTREGA: TStringField
      FieldName = 'FORMA_ENTREGA'
      Size = 100
    end
    object SQLDSPedidosDeCompraVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraDATA_NF: TDateField
      FieldName = 'DATA_NF'
    end
    object SQLDSPedidosDeCompraNUMERO_NF: TIntegerField
      FieldName = 'NUMERO_NF'
    end
    object SQLDSPedidosDeCompraNUMERO_PARCELAS: TIntegerField
      FieldName = 'NUMERO_PARCELAS'
    end
    object SQLDSPedidosDeCompraOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object SQLDSPedidosDeCompraPERCENTUAL_ICMS: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraPERCENTUAL_IPI: TFMTBCDField
      FieldName = 'PERCENTUAL_IPI'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 100
    end
  end
  object DSPPedidosDeCompra: TDataSetProvider
    DataSet = SQLDSPedidosDeCompra
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 64
    Top = 389
  end
  object SQLDSPedidosDeCompraItens: TSQLDataSet
    CommandText = 
      'SELECT * FROM PEDIDOS_DE_COMPRA_ITENS'#13#10'  ORDER BY ID_PEDIDO_DE_C' +
      'OMPRA_ITEM'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 232
    Top = 334
    object SQLDSPedidosDeCompraItensID_PEDIDO_DE_COMPRA_ITEM: TIntegerField
      FieldName = 'ID_PEDIDO_DE_COMPRA_ITEM'
      Required = True
    end
    object SQLDSPedidosDeCompraItensID_PEDIDO_DE_COMPRA: TIntegerField
      FieldName = 'ID_PEDIDO_DE_COMPRA'
      Required = True
    end
    object SQLDSPedidosDeCompraItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object SQLDSPedidosDeCompraItensDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 255
    end
    object SQLDSPedidosDeCompraItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraItensVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraItensVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidosDeCompraItensALIQUOTA_ICMS: TIntegerField
      FieldName = 'ALIQUOTA_ICMS'
    end
  end
  object DSPPedidosDeCompraItens: TDataSetProvider
    DataSet = SQLDSPedidosDeCompraItens
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 232
    Top = 381
  end
  object SQLDSNotasFiscaisItens: TSQLDataSet
    CommandText = 'SELECT * FROM NOTAS_FISCAIS_ITENS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 480
    Top = 336
    object SQLDSNotasFiscaisItensID_NOTA_FISCAL_ITEM: TIntegerField
      FieldName = 'ID_NOTA_FISCAL_ITEM'
      Required = True
    end
    object SQLDSNotasFiscaisItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object SQLDSNotasFiscaisItensID_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
      Required = True
    end
    object SQLDSNotasFiscaisItensQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object SQLDSNotasFiscaisItensCST_ICMS: TStringField
      FieldName = 'CST_ICMS'
      Size = 4
    end
    object SQLDSNotasFiscaisItensPERCENTUAL_ICMS: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 4
    end
    object SQLDSNotasFiscaisItensPERCENTUAL_IPI: TFMTBCDField
      FieldName = 'PERCENTUAL_IPI'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 4
    end
    object SQLDSNotasFiscaisItensPERCENTUAL_PIS: TFMTBCDField
      FieldName = 'PERCENTUAL_PIS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_PIS: TFMTBCDField
      FieldName = 'VALOR_PIS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 4
    end
    object SQLDSNotasFiscaisItensPERCENTUAL_COFINS: TFMTBCDField
      FieldName = 'PERCENTUAL_COFINS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_COFINS: TFMTBCDField
      FieldName = 'VALOR_COFINS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 255
    end
    object SQLDSNotasFiscaisItensCODIGO_PRODUTO: TStringField
      FieldName = 'CODIGO_PRODUTO'
      Size = 255
    end
    object SQLDSNotasFiscaisItensNCM_PRODUTO: TStringField
      FieldName = 'NCM_PRODUTO'
      Size = 15
    end
    object SQLDSNotasFiscaisItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_UNITARIO: TFMTBCDField
      FieldName = 'VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_FRETE: TFMTBCDField
      FieldName = 'VALOR_FRETE'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_SEGURO: TFMTBCDField
      FieldName = 'VALOR_SEGURO'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_DESCONTO: TFMTBCDField
      FieldName = 'VALOR_DESCONTO'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensINFORMACOES_ADICIONAIS: TStringField
      FieldName = 'INFORMACOES_ADICIONAIS'
      Size = 255
    end
    object SQLDSNotasFiscaisItensBASE_CALCULO_ICMS: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensCST_ICMS_ST: TStringField
      FieldName = 'CST_ICMS_ST'
      Size = 4
    end
    object SQLDSNotasFiscaisItensPERCENTUAL_ICMS_ST: TFMTBCDField
      FieldName = 'PERCENTUAL_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensVALOR_ICMS_ST: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensBASE_CALCULO_ICMS_ST: TFMTBCDField
      FieldName = 'BASE_CALCULO_ICMS_ST'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensBASE_CALCULO_IPI: TFMTBCDField
      FieldName = 'BASE_CALCULO_IPI'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensBASE_CALCULO_COFINS: TFMTBCDField
      FieldName = 'BASE_CALCULO_COFINS'
      Precision = 18
      Size = 2
    end
    object SQLDSNotasFiscaisItensEAN13: TStringField
      FieldName = 'EAN13'
    end
    object SQLDSNotasFiscaisItensORIGEM_MERCADORIA: TStringField
      FieldName = 'ORIGEM_MERCADORIA'
      Size = 1
    end
    object SQLDSNotasFiscaisItensCOR: TStringField
      FieldName = 'COR'
      Size = 50
    end
    object SQLDSNotasFiscaisItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 80
    end
  end
  object DSPNotasFiscaisItens: TDataSetProvider
    DataSet = SQLDSNotasFiscaisItens
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 480
    Top = 389
  end
  object SQLDStransportadores: TSQLDataSet
    CommandText = 'SELECT * FROM TRANSPORTADORES'#13#10'  ORDER BY ID_TRANSPORTADOR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 363
    Top = 335
    object SQLDStransportadoresID_TRANSPORTADOR: TIntegerField
      FieldName = 'ID_TRANSPORTADOR'
      Required = True
    end
    object SQLDStransportadoresCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object SQLDStransportadoresINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object SQLDStransportadoresRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 255
    end
    object SQLDStransportadoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 255
    end
    object SQLDStransportadoresNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object SQLDStransportadoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object SQLDStransportadoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object SQLDStransportadoresTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 100
    end
    object SQLDStransportadoresUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object SQLDStransportadoresCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object SQLDStransportadoresEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object SQLDStransportadoresFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 255
    end
  end
  object DSPTransportadores: TDataSetProvider
    DataSet = SQLDStransportadores
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 363
    Top = 388
  end
  object SQLDSDuplicatasNotasFiscais: TSQLDataSet
    CommandText = 
      'SELECT * FROM DUPLICATAS_NOTAS_FISCAIS'#13#10'  ORDER BY ID_DUPLICATA_' +
      'NOTA_FISCAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 616
    Top = 337
    object SQLDSDuplicatasNotasFiscaisID_DUPLICATA_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_DUPLICATA_NOTA_FISCAL'
      Required = True
    end
    object SQLDSDuplicatasNotasFiscaisNUMERO_FATURA: TIntegerField
      FieldName = 'NUMERO_FATURA'
    end
    object SQLDSDuplicatasNotasFiscaisVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
    end
    object SQLDSDuplicatasNotasFiscaisVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object SQLDSDuplicatasNotasFiscaisID_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
      Required = True
    end
  end
  object DSPDuplicatasNotasFiscais: TDataSetProvider
    DataSet = SQLDSDuplicatasNotasFiscais
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 615
    Top = 389
  end
  object SQLDSTipoOperacao: TSQLDataSet
    CommandText = 'SELECT * FROM TIPOS_DE_OPERACAO'#13#10'ORDER BY ID_TIPO_OPERACAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 756
    Top = 335
    object SQLDSTipoOperacaoID_TIPO_OPERACAO: TIntegerField
      FieldName = 'ID_TIPO_OPERACAO'
      Required = True
    end
    object SQLDSTipoOperacaoCFOP_DENTRO_ESTADO: TStringField
      FieldName = 'CFOP_DENTRO_ESTADO'
      Size = 4
    end
    object SQLDSTipoOperacaoCFOP_FORA_ESTADO: TStringField
      FieldName = 'CFOP_FORA_ESTADO'
      Size = 4
    end
    object SQLDSTipoOperacaoCFOP_DENTRO_ESTADO_COM_ST: TStringField
      FieldName = 'CFOP_DENTRO_ESTADO_COM_ST'
      Size = 4
    end
    object SQLDSTipoOperacaoCFOP_FORA_ESTADO_COM_ST: TStringField
      FieldName = 'CFOP_FORA_ESTADO_COM_ST'
      Size = 4
    end
    object SQLDSTipoOperacaoCST_ICMS_NORMAL: TStringField
      FieldName = 'CST_ICMS_NORMAL'
      Size = 4
    end
    object SQLDSTipoOperacaoCST_ICMS_COM_ST: TStringField
      FieldName = 'CST_ICMS_COM_ST'
      Size = 4
    end
    object SQLDSTipoOperacaoCST_ICMS_COM_REDUCAO: TStringField
      FieldName = 'CST_ICMS_COM_REDUCAO'
      Size = 4
    end
    object SQLDSTipoOperacaoCST_ICMS_COM_ST_E_REDUCAO: TStringField
      FieldName = 'CST_ICMS_COM_ST_E_REDUCAO'
      Size = 4
    end
    object SQLDSTipoOperacaoCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 4
    end
    object SQLDSTipoOperacaoCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 4
    end
    object SQLDSTipoOperacaoCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 4
    end
    object SQLDSTipoOperacaoDESCRICAO_TIPO_OPERACAO: TStringField
      FieldName = 'DESCRICAO_TIPO_OPERACAO'
      Size = 60
    end
    object SQLDSTipoOperacaoMODALIDADE_BASE_CALCULO_ICMS: TStringField
      FieldName = 'MODALIDADE_BASE_CALCULO_ICMS'
      Size = 50
    end
    object SQLDSTipoOperacaoMODALIDADE_BASE_CALCULO_ICMS_ST: TStringField
      FieldName = 'MODALIDADE_BASE_CALCULO_ICMS_ST'
      Size = 50
    end
    object SQLDSTipoOperacaoNUMERO_BASE_CALCULO_ICMS: TIntegerField
      FieldName = 'NUMERO_BASE_CALCULO_ICMS'
    end
    object SQLDSTipoOperacaoNUMERO_BASE_CALCULO_ICMS_ST: TIntegerField
      FieldName = 'NUMERO_BASE_CALCULO_ICMS_ST'
    end
    object SQLDSTipoOperacaoALIQUOTA_IPI: TFMTBCDField
      FieldName = 'ALIQUOTA_IPI'
      Size = 18
    end
    object SQLDSTipoOperacaoALIQUOTA_PIS: TFMTBCDField
      FieldName = 'ALIQUOTA_PIS'
      Size = 18
    end
    object SQLDSTipoOperacaoALIQUOTA_COFINS: TFMTBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Size = 18
    end
  end
  object DSPTipoOperacao: TDataSetProvider
    DataSet = SQLDSTipoOperacao
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 756
    Top = 390
  end
  object SQLDSConveniosNCM: TSQLDataSet
    CommandText = 'SELECT * FROM CONVENIOS_NCM'#13#10'ORDER BY ID_CONVENIO_NCM'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 860
    Top = 335
    object SQLDSConveniosNCMID_CONVENIO_NCM: TIntegerField
      FieldName = 'ID_CONVENIO_NCM'
      Required = True
    end
    object SQLDSConveniosNCMCODIGO_NCM: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 15
    end
    object SQLDSConveniosNCMUF_DESTINO: TStringField
      FieldName = 'UF_DESTINO'
      Size = 2
    end
    object SQLDSConveniosNCMPERCENTUAL_IVA: TFMTBCDField
      FieldName = 'PERCENTUAL_IVA'
      Precision = 18
      Size = 2
    end
    object SQLDSConveniosNCMALIQUOTA_ICMS: TFMTBCDField
      FieldName = 'ALIQUOTA_ICMS'
      Precision = 18
      Size = 2
    end
    object SQLDSConveniosNCMPERCENTUAL_REDUCAO: TFMTBCDField
      FieldName = 'PERCENTUAL_REDUCAO'
      Precision = 18
      Size = 2
    end
    object SQLDSConveniosNCMALIQUOTA_IPI: TFMTBCDField
      FieldName = 'ALIQUOTA_IPI'
      Precision = 18
      Size = 2
    end
  end
  object DSPConveniosNCM: TDataSetProvider
    DataSet = SQLDSConveniosNCM
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 860
    Top = 390
  end
  object SQLDSFormasDeEntrega: TSQLDataSet
    CommandText = 'SELECT * FROM FORMAS_DE_ENTREGA'#13#10'  ORDER BY ID_FORMA_DE_ENTREGA'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 64
    Top = 446
    object SQLDSFormasDeEntregaID_FORMA_DE_ENTREGA: TIntegerField
      FieldName = 'ID_FORMA_DE_ENTREGA'
      Required = True
    end
    object SQLDSFormasDeEntregaFORMA_DE_ENTREGA: TStringField
      FieldName = 'FORMA_DE_ENTREGA'
      Size = 100
    end
  end
  object DSPFormasDeEntrega: TDataSetProvider
    DataSet = SQLDSFormasDeEntrega
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 64
    Top = 493
  end
  object SQLDSFormasDePagamento: TSQLDataSet
    CommandText = 
      'SELECT * FROM FORMAS_DE_PAGAMENTO'#13#10'  ORDER BY ID_FORMA_DE_PAGAME' +
      'NTO'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 200
    Top = 446
    object SQLDSFormasDePagamentoID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
      Required = True
    end
    object SQLDSFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object SQLDSFormasDePagamentoPERMITE_TROCO: TStringField
      FieldName = 'PERMITE_TROCO'
      Size = 1
    end
    object SQLDSFormasDePagamentoEFETUA_MOVIMENTACAO_CLIENTE: TStringField
      FieldName = 'EFETUA_MOVIMENTACAO_CLIENTE'
      Size = 1
    end
    object SQLDSFormasDePagamentoEFETUA_REALIZACAO_DO_TITULO: TStringField
      FieldName = 'EFETUA_REALIZACAO_DO_TITULO'
      Size = 1
    end
    object SQLDSFormasDePagamentoEFETUA_MOVIMENTACAO_CAIXA: TStringField
      FieldName = 'EFETUA_MOVIMENTACAO_CAIXA'
      Size = 1
    end
    object SQLDSFormasDePagamentoORDEM_IMPRESSORA_FISCAL: TIntegerField
      FieldName = 'ORDEM_IMPRESSORA_FISCAL'
    end
  end
  object DSPFormasDePagamento: TDataSetProvider
    DataSet = SQLDSFormasDePagamento
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 493
  end
  object SQLDSCondicoesDePagamento: TSQLDataSet
    CommandText = 
      'SELECT * FROM CONDICOES_DE_PAGAMENTO'#13#10'  ORDER BY ID_CONDICAO_DE_' +
      'PAGAMENTO'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 368
    Top = 446
    object SQLDSCondicoesDePagamentoID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
      Required = True
    end
    object SQLDSCondicoesDePagamentoCONDICAO_DE_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_DE_PAGAMENTO'
      Size = 100
    end
    object SQLDSCondicoesDePagamentoNUMERO_DE_PARCELAS: TIntegerField
      FieldName = 'NUMERO_DE_PARCELAS'
    end
  end
  object DSPCondicoesDePagamento: TDataSetProvider
    DataSet = SQLDSCondicoesDePagamento
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 368
    Top = 493
  end
  object SQLDSVendedores: TSQLDataSet
    CommandText = 'SELECT * FROM VENDEDORES'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 536
    Top = 446
    object SQLDSVendedoresID_VENDEDOR: TIntegerField
      FieldName = 'ID_VENDEDOR'
      Required = True
    end
    object SQLDSVendedoresPERCENTUAL_COMISSAO: TFMTBCDField
      FieldName = 'PERCENTUAL_COMISSAO'
      Precision = 18
      Size = 2
    end
    object SQLDSVendedoresNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 200
    end
  end
  object DSPVendedores: TDataSetProvider
    DataSet = SQLDSVendedores
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 536
    Top = 493
  end
  object SQLDSPedidos_Formas_Condicoes: TSQLDataSet
    CommandText = 'SELECT * FROM PEDIDOS_FORMAS_CONDICOES'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 688
    Top = 446
    object SQLDSPedidos_Formas_CondicoesID_PEDIDO_FORMA_CONDICAO: TIntegerField
      FieldName = 'ID_PEDIDO_FORMA_CONDICAO'
      Required = True
    end
    object SQLDSPedidos_Formas_CondicoesID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
      Required = True
    end
    object SQLDSPedidos_Formas_CondicoesID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
      Required = True
    end
    object SQLDSPedidos_Formas_CondicoesVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object SQLDSPedidos_Formas_CondicoesDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object SQLDSPedidos_Formas_CondicoesCONDICAO_DE_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_DE_PAGAMENTO'
      Size = 255
    end
    object SQLDSPedidos_Formas_CondicoesID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
  end
  object DSPPedidos_Formas_Condicoes: TDataSetProvider
    DataSet = SQLDSPedidos_Formas_Condicoes
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 688
    Top = 493
  end
  object SQLDSFormasVSCondicoes: TSQLDataSet
    CommandText = 'SELECT * FROM FORMAS_VS_CONDICOES'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 864
    Top = 446
    object SQLDSFormasVSCondicoesID_FORMA_VS_CONDICAO: TIntegerField
      FieldName = 'ID_FORMA_VS_CONDICAO'
      Required = True
    end
    object SQLDSFormasVSCondicoesID_CONDICAO_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_CONDICAO_DE_PAGAMENTO'
      Required = True
    end
    object SQLDSFormasVSCondicoesCONDICAO_DE_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_DE_PAGAMENTO'
      Size = 255
    end
    object SQLDSFormasVSCondicoesID_FORMA_DE_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_DE_PAGAMENTO'
      Required = True
    end
    object SQLDSFormasVSCondicoesDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
  end
  object DSPFormasVSCondicoes: TDataSetProvider
    DataSet = SQLDSFormasVSCondicoes
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 864
    Top = 493
  end
  object SQLDSGraficoCaixa: TSQLDataSet
    CommandText = 
      'SELECT ped.id_pedido, ped.data_pedido, pfc.descricao_forma_de_pa' +
      'gamento,pfc.condicao_de_pagamento,'#13#10'pfc.valor from pedidos ped'#13#10 +
      'left outer join  pedidos_formas_condicoes pfc on'#13#10'  pfc.id_pedid' +
      'o = ped.id_pedido'#13#10'order by ped.data_pedido'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 688
    Top = 550
    object SQLDSGraficoCaixaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object SQLDSGraficoCaixaDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
    end
    object SQLDSGraficoCaixaDESCRICAO_FORMA_DE_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_DE_PAGAMENTO'
      Size = 255
    end
    object SQLDSGraficoCaixaCONDICAO_DE_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_DE_PAGAMENTO'
      Size = 255
    end
    object SQLDSGraficoCaixaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
  end
  object DSPGraficoCaixa: TDataSetProvider
    DataSet = SQLDSGraficoCaixa
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 688
    Top = 597
  end
  object SQLDSCartasDeCorrecao: TSQLDataSet
    CommandText = 'SELECT * FROM CARTAS_DE_CORRECAO'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 544
    Top = 550
    object SQLDSCartasDeCorrecaoID_CARTA_DE_CORRECAO: TIntegerField
      FieldName = 'ID_CARTA_DE_CORRECAO'
      Required = True
    end
    object SQLDSCartasDeCorrecaoTEXTO_CARTA_CORRECAO: TStringField
      FieldName = 'TEXTO_CARTA_CORRECAO'
      Size = 1000
    end
    object SQLDSCartasDeCorrecaoDATA_HORA: TStringField
      FieldName = 'DATA_HORA'
      Size = 255
    end
    object SQLDSCartasDeCorrecaoNUMERO_PROTOCOLO: TStringField
      FieldName = 'NUMERO_PROTOCOLO'
      Size = 255
    end
    object SQLDSCartasDeCorrecaoMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 255
    end
    object SQLDSCartasDeCorrecaoCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 44
    end
  end
  object DSPCartasDeCorrecao: TDataSetProvider
    DataSet = SQLDSCartasDeCorrecao
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 544
    Top = 597
  end
  object SQLDSAlmoxarifados: TSQLDataSet
    CommandText = 'SELECT * FROM ALMOXARIFADOS'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 64
    Top = 550
    object SQLDSAlmoxarifadosID_ALMOXARIFADO: TIntegerField
      FieldName = 'ID_ALMOXARIFADO'
      Required = True
    end
    object SQLDSAlmoxarifadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object SQLDSAlmoxarifadosPERMITE_TRANSFERENCIA: TStringField
      FieldName = 'PERMITE_TRANSFERENCIA'
      Size = 1
    end
  end
  object DSPAlmoxarifados: TDataSetProvider
    DataSet = SQLDSAlmoxarifados
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 64
    Top = 597
  end
  object SQLDSProdutos_X_Almoxarifados: TSQLDataSet
    CommandText = 'SELECT * FROM PRODUTOS_X_ALMOXARIFADOS'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 216
    Top = 550
    object SQLDSProdutos_X_AlmoxarifadosID_PRODUTO_X_ALMOXARIFADO: TIntegerField
      FieldName = 'ID_PRODUTO_X_ALMOXARIFADO'
      Required = True
    end
    object SQLDSProdutos_X_AlmoxarifadosID_ALMOXARIFADO: TIntegerField
      FieldName = 'ID_ALMOXARIFADO'
      Required = True
    end
    object SQLDSProdutos_X_AlmoxarifadosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object SQLDSProdutos_X_AlmoxarifadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object SQLDSProdutos_X_AlmoxarifadosSALDO: TFMTBCDField
      FieldName = 'SALDO'
      Precision = 18
      Size = 2
    end
  end
  object DSPProdutos_X_Almoxarifados: TDataSetProvider
    DataSet = SQLDSProdutos_X_Almoxarifados
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 597
  end
  object SQLDSMovimentacoesAlmoxarifado: TSQLDataSet
    CommandText = 'SELECT * FROM MOVIMENTACOES_ALMOXARIFADOS'
    MaxBlobSize = 1
    Params = <>
    SQLConnection = SQLConexao
    Left = 392
    Top = 550
    object SQLDSMovimentacoesAlmoxarifadoID_MOVIMENTACAO_ALMOXARIFADO: TIntegerField
      FieldName = 'ID_MOVIMENTACAO_ALMOXARIFADO'
      Required = True
    end
    object SQLDSMovimentacoesAlmoxarifadoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object SQLDSMovimentacoesAlmoxarifadoID_ALMOXARIFADO: TIntegerField
      FieldName = 'ID_ALMOXARIFADO'
      Required = True
    end
    object SQLDSMovimentacoesAlmoxarifadoDATA: TDateField
      FieldName = 'DATA'
    end
    object SQLDSMovimentacoesAlmoxarifadoHORA: TTimeField
      FieldName = 'HORA'
    end
    object SQLDSMovimentacoesAlmoxarifadoQTDE_ANTERIOR: TFMTBCDField
      FieldName = 'QTDE_ANTERIOR'
      Precision = 18
      Size = 2
    end
    object SQLDSMovimentacoesAlmoxarifadoQTDE_MOVIMENTADA: TFMTBCDField
      FieldName = 'QTDE_MOVIMENTADA'
      Precision = 18
      Size = 2
    end
    object SQLDSMovimentacoesAlmoxarifadoTIPO_MOVIMENTACAO: TStringField
      FieldName = 'TIPO_MOVIMENTACAO'
      Size = 100
    end
    object SQLDSMovimentacoesAlmoxarifadoID_NOTA_FISCAL: TIntegerField
      FieldName = 'ID_NOTA_FISCAL'
    end
    object SQLDSMovimentacoesAlmoxarifadoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object SQLDSMovimentacoesAlmoxarifadoID_PEDIDO_DE_COMPRA: TIntegerField
      FieldName = 'ID_PEDIDO_DE_COMPRA'
    end
    object SQLDSMovimentacoesAlmoxarifadoID_NOTA_FISCAL_ENTRADA: TIntegerField
      FieldName = 'ID_NOTA_FISCAL_ENTRADA'
    end
    object SQLDSMovimentacoesAlmoxarifadoQTDE_APOS_MOVIMENTACAO: TFMTBCDField
      FieldName = 'QTDE_APOS_MOVIMENTACAO'
      Precision = 18
      Size = 2
    end
  end
  object DSPMovimentacoesAlmoxarifados: TDataSetProvider
    DataSet = SQLDSMovimentacoesAlmoxarifado
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 392
    Top = 597
  end
  object SQLDCFOP: TSQLDataSet
    CommandText = 'SELECT * FROM CFOP ORDER BY CODIGO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConexao
    Left = 869
    Top = 207
    object SQLDCFOPID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object SQLDCFOPCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object SQLDCFOPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 300
    end
    object SQLDCFOPCFOPENTRADA: TIntegerField
      FieldName = 'CFOPENTRADA'
    end
    object SQLDCFOPTIPO: TSmallintField
      FieldName = 'TIPO'
    end
    object SQLDCFOPAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Size = 2000
    end
  end
  object DSPCFOP: TDataSetProvider
    DataSet = SQLDCFOP
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 869
    Top = 262
  end
end
