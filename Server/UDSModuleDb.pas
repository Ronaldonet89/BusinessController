unit UDSModuleDb;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,Dialogs,
  Data.DBXFirebird, Data.FMTBcd, Datasnap.Provider, Data.DB, Data.SqlExpr,
  Datasnap.DBClient,Variants,Forms, IniFiles, ACBrBase, ACBrDFe, ACBrNFe,
  pcnConversao, ACBrNFeDANFEFRDM, ACBrNFeDANFEClass, ACBrNFeDANFEFR,
  UITypes,pcnConversaoNFe,ACBrUtil, ACBrDFeUtil,StrUtils, DateUtils,
  pcnGerador, ACBrConsts, ACBrDFeException,  ACBrValidador, pcnAuxiliar,
  ACBrSocket, ACBrIBGE;


type
  TDSModuleDb = class(TDSServerModule)
    SQLConexao: TSQLConnection;
    SQLDSComandas: TSQLDataSet;
    DSPComandas: TDataSetProvider;
    cdsComandas: TClientDataSet;
    dsComandas: TDataSource;
    SQLDSComandasID_COMANDA: TIntegerField;
    SQLDSComandasNUMERO_COMANDA: TStringField;
    cdsComandasID_COMANDA: TIntegerField;
    cdsComandasNUMERO_COMANDA: TStringField;
    SQLDSUsuarios: TSQLDataSet;
    SQLDSUsuariosID_USUARIO: TIntegerField;
    SQLDSUsuariosUSUARIO: TStringField;
    SQLDSUsuariosSENHA: TStringField;
    SQLDSUsuariosTIPO_SKIN_TELA: TStringField;
    SQLDSUsuariosID_GRUPO: TIntegerField;
    DSPUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsUsuariosID_USUARIO: TIntegerField;
    cdsUsuariosUSUARIO: TStringField;
    cdsUsuariosSENHA: TStringField;
    DSUsuarios: TDataSource;
    SQLDSPermissoesUsuariosSistema: TSQLDataSet;
    SQLDSPermissoesUsuariosSistemaID_PERMISSAO_USUARIO_SISTEMA: TIntegerField;
    SQLDSPermissoesUsuariosSistemaPERMISSAO: TStringField;
    DSPPermissoesUsuariosSistema: TDataSetProvider;
    cdsPermissoesUsuariosSistema: TClientDataSet;
    cdsPermissoesUsuariosSistemaID_PERMISSAO_USUARIO_SISTEMA: TIntegerField;
    cdsPermissoesUsuariosSistemaPERMISSAO: TStringField;
    dsPermissoesUsuariossistema: TDataSource;
    SQLDSPermissoesVsUsuarios: TSQLDataSet;
    SQLDSPermissoesVsUsuariosID_PERMISSAO_VS_USUARIO: TIntegerField;
    SQLDSPermissoesVsUsuariosID_PERMISSAO_USUARIO_SISTEMA: TIntegerField;
    SQLDSPermissoesVsUsuariosID_USUARIO: TIntegerField;
    SQLDSPermissoesVsUsuariosPERMISSAO: TStringField;
    SQLDSPermissoesVsUsuariosPERMITE_OU_NAO: TStringField;
    DSPSQLDSPermissoesVsUsuarios: TDataSetProvider;
    CDSPermissoesVsUsuarios: TClientDataSet;
    CDSPermissoesVsUsuariosID_PERMISSAO_VS_USUARIO: TIntegerField;
    CDSPermissoesVsUsuariosID_PERMISSAO_USUARIO_SISTEMA: TIntegerField;
    CDSPermissoesVsUsuariosID_USUARIO: TIntegerField;
    CDSPermissoesVsUsuariosPERMISSAO: TStringField;
    CDSPermissoesVsUsuariosPERMITE_OU_NAO: TStringField;
    DSPermissoesVsUsuarios: TDataSource;
    SQLDSPedidos: TSQLDataSet;
    DSPPedidos: TDataSetProvider;
    SQLDSReceber: TSQLDataSet;
    SQLDSReceberID_RECEBER: TIntegerField;
    SQLDSReceberDESCRICAO_TITULO: TStringField;
    SQLDSReceberID_PEDIDO: TIntegerField;
    SQLDSReceberID_CLIENTE: TIntegerField;
    SQLDSReceberNOME_CLIENTE: TStringField;
    SQLDSReceberVENCIMENTO: TDateField;
    SQLDSReceberDATA_PAGAMENTO: TDateField;
    SQLDSReceberVALOR_TITULO: TFMTBCDField;
    SQLDSReceberVALOR_PAGO: TFMTBCDField;
    SQLDSReceberNUMERO_CHEQUE: TStringField;
    SQLDSReceberFORMA_PAGAMENTO: TStringField;
    SQLDSReceberSTATUS: TStringField;
    SQLDSCheques: TSQLDataSet;
    DSPReceber: TDataSetProvider;
    DSPCheques: TDataSetProvider;
    DSPGenerico: TDataSetProvider;
    SQLDSGenerica: TSQLDataSet;
    SQLDSPedidosItens: TSQLDataSet;
    SQLDSPedidosItensID_PEDIDO_ITEM: TIntegerField;
    SQLDSPedidosItensID_PEDIDO: TIntegerField;
    SQLDSPedidosItensID_PRODUTO: TIntegerField;
    SQLDSPedidosItensDESCRICAO_PRODUTO: TStringField;
    SQLDSPedidosItensQUANTIDADE: TFMTBCDField;
    SQLDSPedidosItensVALOR_UNITARIO: TFMTBCDField;
    SQLDSPedidosItensVALOR_TOTAL: TFMTBCDField;
    SQLDSPedidosItensALIQUOTA_ICMS: TIntegerField;
    SQLDSMovimentacao: TSQLDataSet;
    SQLDSMovimentacaoID_MOVIMENTACAO: TIntegerField;
    SQLDSMovimentacaoID_PEDIDO: TIntegerField;
    SQLDSMovimentacaoID_PRODUTO: TIntegerField;
    SQLDSMovimentacaoDATA: TDateField;
    SQLDSMovimentacaoHORA: TTimeField;
    SQLDSMovimentacaoQTDE_ANTERIOR: TFMTBCDField;
    SQLDSMovimentacaoQTDE_MOVIMENTADA: TFMTBCDField;
    SQLDSMovimentacaoQTDE_APOS_MOVIMENTACAO: TFMTBCDField;
    SQLDSMovimentacaoTIPO_MOVIMENTACAO: TStringField;
    DSPPedidosItens: TDataSetProvider;
    DSPMovimentacao: TDataSetProvider;
    SQLDSGrupoProdutos: TSQLDataSet;
    SQLDSGrupoProdutosID_GRUPO_PRODUTO: TIntegerField;
    SQLDSGrupoProdutosGRUPO_PRODUTO_DESCRICAO: TStringField;
    DSPGrupoProdutos: TDataSetProvider;
    DSPPagar: TDataSetProvider;
    SQLDSPagar: TSQLDataSet;
    SQLDSPagarID_PAGAR: TIntegerField;
    SQLDSPagarDESCRICAO_TITULO: TStringField;
    SQLDSPagarID_PEDIDO: TIntegerField;
    SQLDSPagarID_FORNECEDOR: TIntegerField;
    SQLDSPagarNOME_FORNECEDOR: TStringField;
    SQLDSPagarVENCIMENTO: TDateField;
    SQLDSPagarDATA_PAGAMENTO: TDateField;
    SQLDSPagarVALOR_TITULO: TFMTBCDField;
    SQLDSPagarVALOR_PAGO: TFMTBCDField;
    SQLDSPagarNUMERO_CHEQUE: TStringField;
    SQLDSPagarFORMA_PAGAMENTO: TStringField;
    SQLDSPagarSTATUS: TStringField;
    SQLDSProdutos: TSQLDataSet;
    SQLDSProdutosPRO_ID: TIntegerField;
    SQLDSProdutosPRO_DESCRICAO: TStringField;
    SQLDSProdutosPRO_EAN13: TStringField;
    SQLDSProdutosPRO_CODIGO: TStringField;
    SQLDSProdutosPRO_CAMINHO_IMAGEM: TStringField;
    SQLDSProdutosPRO_SALDO: TFMTBCDField;
    SQLDSProdutosPRECO_VENDA: TFMTBCDField;
    SQLDSProdutosID_GRUPO_PRODUTO: TIntegerField;
    SQLDSProdutosALIQUOTA_ICMS: TIntegerField;
    SQLDSProdutosCODIGO_NCM: TStringField;
    SQLDSProdutosORIGEM_MERCADORIA: TStringField;
    SQLDSProdutosUNIDADE: TStringField;
    SQLDSProdutosID_FORNECEDOR: TIntegerField;
    DSPProdutos: TDataSetProvider;
    DSPClientes: TDataSetProvider;
    SQLDSClientes: TSQLDataSet;
    SQLDSClientesID_CLIENTE: TIntegerField;
    SQLDSClientesRAZAO_SOCIAL: TStringField;
    SQLDSClientesFANTASIA: TStringField;
    SQLDSClientesCPF: TStringField;
    SQLDSClientesCNPJ: TStringField;
    SQLDSClientesINSCRICAO_ESTADUAL: TStringField;
    SQLDSClientesENDERECO: TStringField;
    SQLDSClientesNUMERO: TStringField;
    SQLDSClientesCEP: TStringField;
    SQLDSClientesBAIRRO: TStringField;
    SQLDSClientesTELEFONE: TStringField;
    SQLDSClientesCELULAR: TStringField;
    SQLDSClientesEMAIL: TStringField;
    SQLDSClientesEMAIL_DANFE: TStringField;
    SQLDSClientesSITUACAO_APURACAO: TStringField;
    SQLDSClientesCONSUMIDOR_FINAL: TStringField;
    SQLDSClientesPOSSUI_SUFRAMA: TStringField;
    SQLDSClientesCODIGO_SUFRAMA: TStringField;
    SQLDSClientesUF: TStringField;
    SQLDSClientesID_TRANSPORTADOR: TIntegerField;
    SQLDSClientesCIDADE: TStringField;
    SQLDSFornecedores: TSQLDataSet;
    SQLDSFornecedoresID_FORNECEDOR: TIntegerField;
    SQLDSFornecedoresRAZAO_SOCIAL: TStringField;
    SQLDSFornecedoresCPF: TStringField;
    SQLDSFornecedoresCNPJ: TStringField;
    SQLDSFornecedoresRG: TStringField;
    SQLDSFornecedoresINSCRICAO_ESTADUAL: TStringField;
    SQLDSFornecedoresCONTATO: TStringField;
    SQLDSFornecedoresEMAIL: TStringField;
    SQLDSFornecedoresTELEFONE: TStringField;
    SQLDSFornecedoresCELULAR: TStringField;
    SQLDSFornecedoresENDERECO: TStringField;
    SQLDSFornecedoresNUMERO: TStringField;
    SQLDSFornecedoresCOMPLEMENTO: TStringField;
    SQLDSFornecedoresBAIRRO: TStringField;
    SQLDSFornecedoresCEP: TStringField;
    SQLDSFornecedoresCIDADE: TStringField;
    SQLDSFornecedoresESTADO: TStringField;
    SQLDSFornecedoresOBSERVACAO: TMemoField;
    SQLDSFornecedoresTIPO_FORNECEDOR: TStringField;
    SQLDSFornecedoresFANTASIA: TStringField;
    SQLDSFornecedoresUF: TStringField;
    DSPFornecedores: TDataSetProvider;
    SQLDSProdutosMateriasPrimas: TSQLDataSet;
    SQLDSProdutosMateriasPrimasID_PRODUTO_MATERIA_PRIMA: TIntegerField;
    SQLDSProdutosMateriasPrimasID_MATERIA_PRIMA: TIntegerField;
    SQLDSProdutosMateriasPrimasID_PRODUTO: TIntegerField;
    SQLDSProdutosMateriasPrimasQUANTIDADE: TFMTBCDField;
    SQLDSProdutosMateriasPrimasDESCRICAO_MATERIA_PRIMA: TStringField;
    DSPProdutosMateriasPrimas: TDataSetProvider;
    SQLDSMateriasPrimas: TSQLDataSet;
    SQLDSMateriasPrimasPRO_ID: TIntegerField;
    SQLDSMateriasPrimasPRO_DESCRICAO: TStringField;
    SQLDSMateriasPrimasPRO_CODIGO: TStringField;
    SQLDSMateriasPrimasPRO_SALDO: TFMTBCDField;
    SQLDSMateriasPrimasPRECO_VENDA: TFMTBCDField;
    DSPMateriasPrimas: TDataSetProvider;
    SQLDSProdutosAcabados: TSQLDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    DSPProdutosAcabados: TDataSetProvider;
    SQLDSNotasFiscais: TSQLDataSet;
    SQLDSNotasFiscaisID_NOTA_FISCAL: TIntegerField;
    SQLDSNotasFiscaisID_TRANSPORTADOR: TIntegerField;
    SQLDSNotasFiscaisID_PEDIDO: TIntegerField;
    SQLDSNotasFiscaisID_CLIENTE: TIntegerField;
    SQLDSNotasFiscaisID_NATUREZA_OPERACAO: TIntegerField;
    SQLDSNotasFiscaisDATA_EMISSAO: TDateField;
    SQLDSNotasFiscaisDATA_SAIDA_ENTRADA: TDateField;
    SQLDSNotasFiscaisHORA_SAIDA_ENTRADA: TTimeField;
    SQLDSNotasFiscaisENTRADA_SAIDA: TStringField;
    SQLDSNotasFiscaisTIPO_EMISSAO: TStringField;
    SQLDSNotasFiscaisINFORMACAO_NFE: TStringField;
    SQLDSNotasFiscaisBASE_CALCULO_ICMS: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_ICMS: TFMTBCDField;
    SQLDSNotasFiscaisBASE_ST: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_ST: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_PRODUTOS: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_FRETE: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_SEGURO: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_DESCONTO: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_IMPOSTO_IMPORTACAO: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_IPI: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_PIS: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_COFINS: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_OUTROS: TFMTBCDField;
    SQLDSNotasFiscaisVALOR_TOTAL_NOTA: TFMTBCDField;
    SQLDSNotasFiscaisCHAVE: TStringField;
    SQLDSNotasFiscaisESPECIE: TStringField;
    SQLDSNotasFiscaisMARCA: TStringField;
    SQLDSNotasFiscaisNUMERO_VOLUME: TStringField;
    SQLDSNotasFiscaisPESO_LIQUIDO: TFMTBCDField;
    SQLDSNotasFiscaisPESO_BRUTO: TFMTBCDField;
    SQLDSNotasFiscaisNUMERO_NOTA_FISCAL: TIntegerField;
    SQLDSNotasFiscaisNUMERO_PROTOCOLO_RECEBIMENTO: TStringField;
    SQLDSNotasFiscaisMOTIVO_RECEBIMENTO: TStringField;
    SQLDSNotasFiscaisRESPONSAVEL_FRETE: TStringField;
    SQLDSNotasFiscaisDATA_HORA_RECEBIMENTO: TStringField;
    SQLDSNotasFiscaisNOME_CLIENTE: TStringField;
    SQLDSNotasFiscaisFORMA_PAGAMENTO: TStringField;
    SQLDSNotasFiscaisCONDICAO_PAGAMENTO: TStringField;
    SQLDSNotasFiscaisNUMERO_PARCELAS: TIntegerField;
    SQLDSNotasFiscaisNATUREZA_DE_OPERACAO: TStringField;
    SQLDSNotasFiscaisNFE_CALCULADA: TStringField;
    SQLDSNotasFiscaisID_FORMA_DE_ENTREGA: TIntegerField;
    SQLDSNotasFiscaisID_FORMA_DE_PAGAMENTO: TIntegerField;
    SQLDSNotasFiscaisID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    SQLDSNotasFiscaisBASE_CALCULO_PIS: TFMTBCDField;
    SQLDSNotasFiscaisNUMERO_BASE_CALCULO_ICMS: TIntegerField;
    SQLDSNotasFiscaisNUMERO_BASE_CALCULO_ICMS_ST: TIntegerField;
    SQLDSNotasFiscaisNUMERO_PROTOCOLO_CANCELAMENTO: TStringField;
    SQLDSNotasFiscaisDATA_HORA_CANCELAMENTO: TStringField;
    SQLDSNotasFiscaisMOTIVO_CANCELAMENTO: TStringField;
    DSPNotasFiscais: TDataSetProvider;
    cdsGenerico: TClientDataSet;
    SQLDSNotasFiscaisEntrada: TSQLDataSet;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    DateField1: TDateField;
    DateField2: TDateField;
    TimeField1: TTimeField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FMTBCDField3: TFMTBCDField;
    FMTBCDField4: TFMTBCDField;
    FMTBCDField5: TFMTBCDField;
    FMTBCDField6: TFMTBCDField;
    FMTBCDField7: TFMTBCDField;
    FMTBCDField8: TFMTBCDField;
    FMTBCDField9: TFMTBCDField;
    FMTBCDField10: TFMTBCDField;
    FMTBCDField11: TFMTBCDField;
    FMTBCDField12: TFMTBCDField;
    FMTBCDField13: TFMTBCDField;
    FMTBCDField14: TFMTBCDField;
    FMTBCDField15: TFMTBCDField;
    FMTBCDField16: TFMTBCDField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FMTBCDField17: TFMTBCDField;
    FMTBCDField18: TFMTBCDField;
    IntegerField7: TIntegerField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    IntegerField8: TIntegerField;
    StringField17: TStringField;
    StringField18: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    FMTBCDField19: TFMTBCDField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    SQLDSNotasFiscaisEntradaNOME_FORNECEDOR: TStringField;
    SQLDSNotasFiscaisEntradaID_FORNECEDOR: TIntegerField;
    SQLDSNotasFiscaisEntradaSTATUS: TStringField;
    DSPNotasFiscaisEntrada: TDataSetProvider;
    SQLDSNotasFiscaisEntradaItens: TSQLDataSet;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    FMTBCDField20: TFMTBCDField;
    StringField22: TStringField;
    StringField23: TStringField;
    FMTBCDField21: TFMTBCDField;
    FMTBCDField22: TFMTBCDField;
    StringField24: TStringField;
    FMTBCDField23: TFMTBCDField;
    FMTBCDField24: TFMTBCDField;
    StringField25: TStringField;
    FMTBCDField25: TFMTBCDField;
    FMTBCDField26: TFMTBCDField;
    StringField26: TStringField;
    FMTBCDField27: TFMTBCDField;
    FMTBCDField28: TFMTBCDField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    FMTBCDField29: TFMTBCDField;
    FMTBCDField30: TFMTBCDField;
    FMTBCDField31: TFMTBCDField;
    FMTBCDField32: TFMTBCDField;
    FMTBCDField33: TFMTBCDField;
    StringField31: TStringField;
    FMTBCDField34: TFMTBCDField;
    StringField32: TStringField;
    FMTBCDField35: TFMTBCDField;
    FMTBCDField36: TFMTBCDField;
    FMTBCDField37: TFMTBCDField;
    FMTBCDField38: TFMTBCDField;
    FMTBCDField39: TFMTBCDField;
    StringField33: TStringField;
    StringField34: TStringField;
    SQLDSNotasFiscaisEntradaItensDESCRICAO_PRODUTO_XML: TStringField;
    DSPNotasFiscaisEntradaItens: TDataSetProvider;
    SQLDSPedidosDeCompra: TSQLDataSet;
    SQLDSPedidosDeCompraID_PEDIDO_DE_COMPRA: TIntegerField;
    SQLDSPedidosDeCompraID_FORNECEDOR: TIntegerField;
    SQLDSPedidosDeCompraID_USUARIO: TIntegerField;
    SQLDSPedidosDeCompraNOME_FORNECEDOR: TStringField;
    SQLDSPedidosDeCompraDATA_PEDIDO: TDateField;
    SQLDSPedidosDeCompraHORA_PEDIDO: TDateField;
    SQLDSPedidosDeCompraDATA_VENCIMENTO: TDateField;
    SQLDSPedidosDeCompraDATA_PAGAMENTO: TDateField;
    SQLDSPedidosDeCompraFORMA_PAGAMENTO: TStringField;
    SQLDSPedidosDeCompraCONDICAO_PAGAMENTO: TStringField;
    SQLDSPedidosDeCompraDATA_ENTREGA: TDateField;
    SQLDSPedidosDeCompraFORMA_ENTREGA: TStringField;
    SQLDSPedidosDeCompraVALOR_FRETE: TFMTBCDField;
    SQLDSPedidosDeCompraVALOR_ICMS: TFMTBCDField;
    SQLDSPedidosDeCompraVALOR_IPI: TFMTBCDField;
    SQLDSPedidosDeCompraDATA_NF: TDateField;
    SQLDSPedidosDeCompraNUMERO_NF: TIntegerField;
    SQLDSPedidosDeCompraNUMERO_PARCELAS: TIntegerField;
    SQLDSPedidosDeCompraOBSERVACAO: TMemoField;
    SQLDSPedidosDeCompraPERCENTUAL_ICMS: TFMTBCDField;
    SQLDSPedidosDeCompraPERCENTUAL_IPI: TFMTBCDField;
    SQLDSPedidosDeCompraVALOR_TOTAL: TFMTBCDField;
    SQLDSPedidosDeCompraSTATUS: TStringField;
    DSPPedidosDeCompra: TDataSetProvider;
    SQLDSPedidosDeCompraItens: TSQLDataSet;
    SQLDSPedidosDeCompraItensID_PEDIDO_DE_COMPRA_ITEM: TIntegerField;
    SQLDSPedidosDeCompraItensID_PEDIDO_DE_COMPRA: TIntegerField;
    SQLDSPedidosDeCompraItensID_PRODUTO: TIntegerField;
    SQLDSPedidosDeCompraItensDESCRICAO_PRODUTO: TStringField;
    SQLDSPedidosDeCompraItensQUANTIDADE: TFMTBCDField;
    SQLDSPedidosDeCompraItensVALOR_UNITARIO: TFMTBCDField;
    SQLDSPedidosDeCompraItensVALOR_TOTAL: TFMTBCDField;
    SQLDSPedidosDeCompraItensALIQUOTA_ICMS: TIntegerField;
    DSPPedidosDeCompraItens: TDataSetProvider;
    SQLDSNotasFiscaisItens: TSQLDataSet;
    SQLDSNotasFiscaisItensID_NOTA_FISCAL_ITEM: TIntegerField;
    SQLDSNotasFiscaisItensID_PRODUTO: TIntegerField;
    SQLDSNotasFiscaisItensID_NOTA_FISCAL: TIntegerField;
    SQLDSNotasFiscaisItensQUANTIDADE: TFMTBCDField;
    SQLDSNotasFiscaisItensCFOP: TStringField;
    SQLDSNotasFiscaisItensCST_ICMS: TStringField;
    SQLDSNotasFiscaisItensPERCENTUAL_ICMS: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_ICMS: TFMTBCDField;
    SQLDSNotasFiscaisItensCST_IPI: TStringField;
    SQLDSNotasFiscaisItensPERCENTUAL_IPI: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_IPI: TFMTBCDField;
    SQLDSNotasFiscaisItensCST_PIS: TStringField;
    SQLDSNotasFiscaisItensPERCENTUAL_PIS: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_PIS: TFMTBCDField;
    SQLDSNotasFiscaisItensCST_COFINS: TStringField;
    SQLDSNotasFiscaisItensPERCENTUAL_COFINS: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_COFINS: TFMTBCDField;
    SQLDSNotasFiscaisItensDESCRICAO_PRODUTO: TStringField;
    SQLDSNotasFiscaisItensCODIGO_PRODUTO: TStringField;
    SQLDSNotasFiscaisItensNCM_PRODUTO: TStringField;
    SQLDSNotasFiscaisItensUNIDADE: TStringField;
    SQLDSNotasFiscaisItensVALOR_UNITARIO: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_TOTAL: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_FRETE: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_SEGURO: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_DESCONTO: TFMTBCDField;
    SQLDSNotasFiscaisItensINFORMACOES_ADICIONAIS: TStringField;
    SQLDSNotasFiscaisItensBASE_CALCULO_ICMS: TFMTBCDField;
    SQLDSNotasFiscaisItensCST_ICMS_ST: TStringField;
    SQLDSNotasFiscaisItensPERCENTUAL_ICMS_ST: TFMTBCDField;
    SQLDSNotasFiscaisItensVALOR_ICMS_ST: TFMTBCDField;
    SQLDSNotasFiscaisItensBASE_CALCULO_ICMS_ST: TFMTBCDField;
    SQLDSNotasFiscaisItensBASE_CALCULO_IPI: TFMTBCDField;
    SQLDSNotasFiscaisItensBASE_CALCULO_COFINS: TFMTBCDField;
    SQLDSNotasFiscaisItensEAN13: TStringField;
    SQLDSNotasFiscaisItensORIGEM_MERCADORIA: TStringField;
    DSPNotasFiscaisItens: TDataSetProvider;
    SQLDStransportadores: TSQLDataSet;
    SQLDStransportadoresID_TRANSPORTADOR: TIntegerField;
    SQLDStransportadoresCNPJ: TStringField;
    SQLDStransportadoresINSCRICAO_ESTADUAL: TStringField;
    SQLDStransportadoresRAZAO_SOCIAL: TStringField;
    SQLDStransportadoresENDERECO: TStringField;
    SQLDStransportadoresNUMERO: TStringField;
    SQLDStransportadoresBAIRRO: TStringField;
    SQLDStransportadoresCIDADE: TStringField;
    SQLDStransportadoresTELEFONE: TStringField;
    SQLDStransportadoresUF: TStringField;
    SQLDStransportadoresCEP: TStringField;
    SQLDStransportadoresEMAIL: TStringField;
    SQLDStransportadoresFANTASIA: TStringField;
    DSPTransportadores: TDataSetProvider;
    SQLDSDuplicatasNotasFiscais: TSQLDataSet;
    SQLDSDuplicatasNotasFiscaisID_DUPLICATA_NOTA_FISCAL: TIntegerField;
    SQLDSDuplicatasNotasFiscaisNUMERO_FATURA: TIntegerField;
    SQLDSDuplicatasNotasFiscaisVENCIMENTO: TDateField;
    SQLDSDuplicatasNotasFiscaisVALOR: TFMTBCDField;
    SQLDSDuplicatasNotasFiscaisID_NOTA_FISCAL: TIntegerField;
    DSPDuplicatasNotasFiscais: TDataSetProvider;
    SQLDSTipoOperacao: TSQLDataSet;
    SQLDSTipoOperacaoID_TIPO_OPERACAO: TIntegerField;
    SQLDSTipoOperacaoCFOP_DENTRO_ESTADO: TStringField;
    SQLDSTipoOperacaoCFOP_FORA_ESTADO: TStringField;
    SQLDSTipoOperacaoCFOP_DENTRO_ESTADO_COM_ST: TStringField;
    SQLDSTipoOperacaoCFOP_FORA_ESTADO_COM_ST: TStringField;
    SQLDSTipoOperacaoCST_ICMS_NORMAL: TStringField;
    SQLDSTipoOperacaoCST_ICMS_COM_ST: TStringField;
    SQLDSTipoOperacaoCST_ICMS_COM_REDUCAO: TStringField;
    SQLDSTipoOperacaoCST_ICMS_COM_ST_E_REDUCAO: TStringField;
    SQLDSTipoOperacaoCST_IPI: TStringField;
    SQLDSTipoOperacaoCST_PIS: TStringField;
    SQLDSTipoOperacaoCST_COFINS: TStringField;
    SQLDSTipoOperacaoDESCRICAO_TIPO_OPERACAO: TStringField;
    SQLDSTipoOperacaoMODALIDADE_BASE_CALCULO_ICMS: TStringField;
    SQLDSTipoOperacaoMODALIDADE_BASE_CALCULO_ICMS_ST: TStringField;
    SQLDSTipoOperacaoNUMERO_BASE_CALCULO_ICMS: TIntegerField;
    SQLDSTipoOperacaoNUMERO_BASE_CALCULO_ICMS_ST: TIntegerField;
    DSPTipoOperacao: TDataSetProvider;
    SQLDSConveniosNCM: TSQLDataSet;
    SQLDSConveniosNCMID_CONVENIO_NCM: TIntegerField;
    SQLDSConveniosNCMCODIGO_NCM: TStringField;
    SQLDSConveniosNCMUF_DESTINO: TStringField;
    SQLDSConveniosNCMPERCENTUAL_IVA: TFMTBCDField;
    SQLDSConveniosNCMALIQUOTA_ICMS: TFMTBCDField;
    SQLDSConveniosNCMPERCENTUAL_REDUCAO: TFMTBCDField;
    SQLDSConveniosNCMALIQUOTA_IPI: TFMTBCDField;
    DSPConveniosNCM: TDataSetProvider;
    SQLDSFormasDeEntrega: TSQLDataSet;
    SQLDSFormasDeEntregaID_FORMA_DE_ENTREGA: TIntegerField;
    SQLDSFormasDeEntregaFORMA_DE_ENTREGA: TStringField;
    DSPFormasDeEntrega: TDataSetProvider;
    SQLDSFormasDePagamento: TSQLDataSet;
    DSPFormasDePagamento: TDataSetProvider;
    SQLDSCondicoesDePagamento: TSQLDataSet;
    SQLDSCondicoesDePagamentoID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    SQLDSCondicoesDePagamentoCONDICAO_DE_PAGAMENTO: TStringField;
    SQLDSCondicoesDePagamentoNUMERO_DE_PARCELAS: TIntegerField;
    DSPCondicoesDePagamento: TDataSetProvider;
    SQLDSVendedores: TSQLDataSet;
    SQLDSVendedoresID_VENDEDOR: TIntegerField;
    SQLDSVendedoresPERCENTUAL_COMISSAO: TFMTBCDField;
    SQLDSVendedoresNOME_VENDEDOR: TStringField;
    DSPVendedores: TDataSetProvider;
    SQLDSPedidos_Formas_Condicoes: TSQLDataSet;
    SQLDSPedidos_Formas_CondicoesID_PEDIDO_FORMA_CONDICAO: TIntegerField;
    SQLDSPedidos_Formas_CondicoesID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    SQLDSPedidos_Formas_CondicoesID_FORMA_DE_PAGAMENTO: TIntegerField;
    SQLDSPedidos_Formas_CondicoesVALOR: TFMTBCDField;
    SQLDSPedidos_Formas_CondicoesDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    SQLDSPedidos_Formas_CondicoesCONDICAO_DE_PAGAMENTO: TStringField;
    SQLDSPedidos_Formas_CondicoesID_PEDIDO: TIntegerField;
    DSPPedidos_Formas_Condicoes: TDataSetProvider;
    SQLDSFormasVSCondicoes: TSQLDataSet;
    SQLDSFormasVSCondicoesID_FORMA_VS_CONDICAO: TIntegerField;
    SQLDSFormasVSCondicoesID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    SQLDSFormasVSCondicoesCONDICAO_DE_PAGAMENTO: TStringField;
    SQLDSFormasVSCondicoesID_FORMA_DE_PAGAMENTO: TIntegerField;
    SQLDSFormasVSCondicoesDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    DSPFormasVSCondicoes: TDataSetProvider;
    SQLDSGraficoCaixa: TSQLDataSet;
    SQLDSGraficoCaixaID_PEDIDO: TIntegerField;
    SQLDSGraficoCaixaDATA_PEDIDO: TDateField;
    SQLDSGraficoCaixaDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    SQLDSGraficoCaixaCONDICAO_DE_PAGAMENTO: TStringField;
    SQLDSGraficoCaixaVALOR: TFMTBCDField;
    DSPGraficoCaixa: TDataSetProvider;
    SQLDSCartasDeCorrecao: TSQLDataSet;
    SQLDSCartasDeCorrecaoID_CARTA_DE_CORRECAO: TIntegerField;
    SQLDSCartasDeCorrecaoTEXTO_CARTA_CORRECAO: TStringField;
    SQLDSCartasDeCorrecaoDATA_HORA: TStringField;
    SQLDSCartasDeCorrecaoNUMERO_PROTOCOLO: TStringField;
    SQLDSCartasDeCorrecaoMOTIVO: TStringField;
    SQLDSCartasDeCorrecaoCHAVE: TStringField;
    DSPCartasDeCorrecao: TDataSetProvider;
    SQLDSAlmoxarifados: TSQLDataSet;
    SQLDSAlmoxarifadosID_ALMOXARIFADO: TIntegerField;
    SQLDSAlmoxarifadosDESCRICAO: TStringField;
    SQLDSAlmoxarifadosPERMITE_TRANSFERENCIA: TStringField;
    DSPAlmoxarifados: TDataSetProvider;
    SQLDSProdutos_X_Almoxarifados: TSQLDataSet;
    SQLDSProdutos_X_AlmoxarifadosID_PRODUTO_X_ALMOXARIFADO: TIntegerField;
    SQLDSProdutos_X_AlmoxarifadosID_ALMOXARIFADO: TIntegerField;
    SQLDSProdutos_X_AlmoxarifadosID_PRODUTO: TIntegerField;
    SQLDSProdutos_X_AlmoxarifadosDESCRICAO: TStringField;
    SQLDSProdutos_X_AlmoxarifadosSALDO: TFMTBCDField;
    DSPProdutos_X_Almoxarifados: TDataSetProvider;
    SQLDSMovimentacoesAlmoxarifado: TSQLDataSet;
    SQLDSMovimentacoesAlmoxarifadoID_MOVIMENTACAO_ALMOXARIFADO: TIntegerField;
    SQLDSMovimentacoesAlmoxarifadoID_PRODUTO: TIntegerField;
    SQLDSMovimentacoesAlmoxarifadoID_ALMOXARIFADO: TIntegerField;
    SQLDSMovimentacoesAlmoxarifadoDATA: TDateField;
    SQLDSMovimentacoesAlmoxarifadoHORA: TTimeField;
    SQLDSMovimentacoesAlmoxarifadoQTDE_ANTERIOR: TFMTBCDField;
    SQLDSMovimentacoesAlmoxarifadoQTDE_MOVIMENTADA: TFMTBCDField;
    SQLDSMovimentacoesAlmoxarifadoTIPO_MOVIMENTACAO: TStringField;
    SQLDSMovimentacoesAlmoxarifadoID_NOTA_FISCAL: TIntegerField;
    SQLDSMovimentacoesAlmoxarifadoID_PEDIDO: TIntegerField;
    SQLDSMovimentacoesAlmoxarifadoID_PEDIDO_DE_COMPRA: TIntegerField;
    SQLDSMovimentacoesAlmoxarifadoID_NOTA_FISCAL_ENTRADA: TIntegerField;
    SQLDSMovimentacoesAlmoxarifadoQTDE_APOS_MOVIMENTACAO: TFMTBCDField;
    DSPMovimentacoesAlmoxarifados: TDataSetProvider;
    ACBrNFe1: TACBrNFe;
    SQLDSProdutosCFOP: TStringField;
    SQLDSFormasDePagamentoID_FORMA_DE_PAGAMENTO: TIntegerField;
    SQLDSFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    SQLDSFormasDePagamentoPERMITE_TROCO: TStringField;
    SQLDSFormasDePagamentoEFETUA_MOVIMENTACAO_CLIENTE: TStringField;
    SQLDSFormasDePagamentoEFETUA_REALIZACAO_DO_TITULO: TStringField;
    SQLDSFormasDePagamentoEFETUA_MOVIMENTACAO_CAIXA: TStringField;
    SQLDSFormasDePagamentoORDEM_IMPRESSORA_FISCAL: TIntegerField;
    SQLDSPedidosID_PEDIDO: TIntegerField;
    SQLDSPedidosID_CLIENTE: TIntegerField;
    SQLDSPedidosID_USUARIO: TIntegerField;
    SQLDSPedidosNOME_CLIENTE: TStringField;
    SQLDSPedidosDATA_PEDIDO: TDateField;
    SQLDSPedidosHORA_PEDIDO: TDateField;
    SQLDSPedidosDATA_VENCIMENTO: TDateField;
    SQLDSPedidosDATA_PAGAMENTO: TDateField;
    SQLDSPedidosFORMA_PAGAMENTO: TStringField;
    SQLDSPedidosCONDICAO_PAGAMENTO: TStringField;
    SQLDSPedidosDATA_ENTREGA: TDateField;
    SQLDSPedidosFORMA_ENTREGA: TStringField;
    SQLDSPedidosVALOR_FRETE: TFMTBCDField;
    SQLDSPedidosVALOR_ICMS: TFMTBCDField;
    SQLDSPedidosVALOR_IPI: TFMTBCDField;
    SQLDSPedidosDATA_NF: TDateField;
    SQLDSPedidosNUMERO_NF: TIntegerField;
    SQLDSPedidosNUMERO_PARCELAS: TIntegerField;
    SQLDSPedidosOBSERVACAO: TMemoField;
    SQLDSPedidosPERCENTUAL_ICMS: TFMTBCDField;
    SQLDSPedidosPERCENTUAL_IPI: TFMTBCDField;
    SQLDSPedidosVALOR_TOTAL: TFMTBCDField;
    SQLDSPedidosSTATUS: TStringField;
    SQLDSPedidosTIPO_OPERACAO: TStringField;
    SQLDSPedidosID_FORMA_DE_ENTREGA: TIntegerField;
    SQLDSPedidosID_FORMA_DE_PAGAMENTO: TIntegerField;
    SQLDSPedidosID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    SQLDSPedidosID_VENDEDOR: TIntegerField;
    SQLDSPedidosID_ORCAMENTO: TIntegerField;
    SQLDSPedidosNOME_VENDEDOR: TStringField;
    SQLDSPedidosDATA_DO_PARTO: TDateField;
    SQLDSPedidosNUMEROCUPOMFISCAL: TStringField;
    SQLDSPedidosPEDIDO_JA_CAPTURADO_BALCAO: TStringField;
    SQLDSPedidosNOME_DO_BEBE: TStringField;
    SQLDSPedidosVALOR_TOTAL_PRODUTOS: TFMTBCDField;
    SQLDSPedidosPERCENTUAL_DESCONTO: TFMTBCDField;
    SQLDSPedidosVALOR_DESCONTO: TFMTBCDField;
    SQLDSPedidosID_USUARIO_EXCLUSAO: TIntegerField;
    SQLDSPedidosDATA_EXCLUSAO: TSQLTimeStampField;
    SQLDSPedidosSITUACAO: TIntegerField;
    SQLDSPedidosID_PEDIDO_PAI: TIntegerField;
    SQLDSPedidosNUMERO_COMANDA: TStringField;
    SQLDSPedidosPEDIDO_EM_VENDA: TStringField;
    SQLDSPedidosDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    SQLDSPedidosNUMERO_CUPOM: TStringField;
    SQLDSPedidosItensDESCONTO: TFMTBCDField;
    SQLDSProdutosCOR: TStringField;
    SQLDSProdutosTAMANHO: TStringField;
    SQLDSProdutosMINIMO: TFMTBCDField;
    SQLDSProdutosMAXIMO: TFMTBCDField;
    SQLDSProdutosCUSTO: TFMTBCDField;
    SQLDSPedidosItensCODIGO: TStringField;
    SQLDSProdutosCOD_PROD: TIntegerField;
    //ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    //ACBrIBGE1: TACBrIBGE;
    SQLDSTipoOperacaoALIQUOTA_IPI: TFMTBCDField;
    SQLDSTipoOperacaoALIQUOTA_PIS: TFMTBCDField;
    SQLDSTipoOperacaoALIQUOTA_COFINS: TFMTBCDField;
    SQLDCFOP: TSQLDataSet;
    DSPCFOP: TDataSetProvider;
    SQLDCFOPID: TIntegerField;
    SQLDCFOPCODIGO: TIntegerField;
    SQLDCFOPDESCRICAO: TStringField;
    SQLDCFOPCFOPENTRADA: TIntegerField;
    SQLDCFOPTIPO: TSmallintField;
    SQLDCFOPAPLICACAO: TStringField;
    SQLDSNotasFiscaisCFOP: TIntegerField;
    SQLDSNotasFiscaisCFOPDESCRICAO: TStringField;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    SQLDSClientesCODMUNICIPIO: TIntegerField;
    SQLDSNotasFiscaisItensCOR: TStringField;
    SQLDSNotasFiscaisItensTAMANHO: TStringField;
    SQLDSPedidosItensCOR: TStringField;
    SQLDSPedidosItensTAMANHO: TStringField;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure CDSFormasPagamentosAfterPost(DataSet: TDataSet);
    procedure CDSFormasPagamentosAfterDelete(DataSet: TDataSet);
    procedure cdsUsuariosAfterDelete(DataSet: TDataSet);
    procedure cdsUsuariosAfterInsert(DataSet: TDataSet);
    procedure cdsUsuariosAfterPost(DataSet: TDataSet);
    procedure cdsPermissoesUsuariosSistemaAfterDelete(DataSet: TDataSet);
    procedure cdsPermissoesUsuariosSistemaAfterPost(DataSet: TDataSet);
    procedure cdsPermissoesUsuariosSistemaAfterInsert(DataSet: TDataSet);
    procedure cdsUsuariosBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    procedure AjustarSaldoProduto(qIdProduto:integer;qValor:real);
    procedure AjustarLimiteCompraClientes(qCliente:integer);
  public
    { Public declarations }
    sNumItem     : Integer;
    sTipoConta   : Integer;
    sProcessoQui : Integer;
    sArquivo     : TextFile;
    sTotalReg    : Integer;
    sLBloco,sLArquivo,sLRegistro : Integer;
    // configurações do AcBr
    sFormas, sAmbiente,sUltNumNFe : Integer;
    sSalvaArq : Boolean;
    sLogoMarca, sPathArq, sCertificado, sSenha, sSerial,
    sRazao, sFantasia, sCNPJ, sIE, sEndereco, sNum,
    sBairro, sCidade, sCEP, sUF, sCodMun, sUFWS, sHost,
    sPorta, sUsuario, sSenhaWS, sFone, sSituacaoTributaria,
    sAliquotaPis, sAliquotaCofins,sEmissaoNFeServidorOuClient : String;
    function GeneratorIncrementado(qGenerator:string):integer;
    function InserirEmMovimentacoes(qIdProduto,qIdPedido:integer;qQuantidade:double;vTipoMovimentacao,EntradaOuSaida:string):integer;
    function VerificaSeUsuarioEstaCadastrado(qUsuario:string):boolean;
    function VerificaSeSenhaEstaCorreta(qSenha:string):boolean;
    function CadastrarSenha(qUsuario,qSenha:string):boolean;
    function VerificaPermissao(qUsuario,qPermissao:string):boolean;
    function EfetuarAberturaDoCaixa(qCaixa,qUsuario : Integer;qSaldo:Double):boolean;
    function EftuarFechamentoDoCaixa(qCaixa,qusuario:integer;qsaldo:Double):boolean;
    function MovimentarCaixa(qCaixa,qUsuario,qIdPedido:integer;qTipoMovimentacao,qObservacao,
             qDescricao:string;qValorMovimentado:Double):boolean;
    function CadastrarCaixa(qCaixa:integer):boolean;
    function RetornaIdentificadorUsuario(qUsuario:string):integer;
    function VerificaCaixaEstaAberto(qCaixa:integer):boolean;
    function RetornaIdentificadorDoCaixa(qCaixa:integer):integer;
    function EfetuarMovimentacaoCliente(qCliente,qUsuario,qIdPedido:integer;qDebitoCredito,qDescricao,qObservacao:string;qValorMovimentado:Double):boolean;
    function InserirItenDoPedidoDeAcordoComNumeroDaComanda(qPedidoNovo,qPedido : integer):boolean;
    function DeletarPedidosEItensDeAcordoComONumeroDaComanda(qPedido:integer):boolean;
    procedure LeArqIni;
    procedure GravaArqIni;
    procedure AtualizaConfigAcBr;
    function EnviarNFe(qIdNotaFiscal:integer): string;
    function RetornaUfEmitente:string;
    function RetornaAliquotaPis:string;
    function RetornaAliquotaCofins:string;
    function RetornaSituacaotributaria:string;
    function RetornaLocalEmissaoNFe:string;
  end;
var
  DSModuleDb: TDSModuleDb;

implementation

{$R *.dfm}

uses USplash, UPrincipal, UntPackage;

procedure TDSModuleDb.AjustarLimiteCompraClientes(qCliente: integer);
var
   Transacao : TTransactionDesc;
   vMinhaQuery : TSQLQuery;
   qString : string;
   vValorMovimentadoCredito,vValorMovimentadoDebito,vLimiteDisponivel : double;
begin
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  vLimiteDisponivel := 0;
  qString := '';
  qString := 'SELECT COALESCE(LIMITE_DE_COMPRA,0) AS LIMITE_DE_COMPRA FROM CLIENTES WHERE ID_CLIENTE =:ID_CLIENTE ';
  with vMinhaQuery do
  begin
    Close;
    CommandText := qString;
    ParamByName('ID_CLIENTE').Value := qCliente;
    Open;
  end;
  vLimiteDisponivel := vMinhaQuery.FieldByName('LIMITE_DE_COMPRA').AsFloat;

  qString := '';
  qString := 'SELECT COALESCE(VALOR_MOVIMENTADO,0) AS VALOR_MOVIMENTADO,DEBITO_CREDITO FROM MOVIMENTACOES_CLIENTES WHERE ID_CLIENTE =:ID_CLIENTE '+
             ' ORDER BY ID_MOVIMENTACAO_CLIENTE ';
  with vMinhaQuery do
  begin
    Close;
    CommandText := qString;
    ParamByName('ID_CLIENTE').Value := qCliente;
    Open;
  end;

  vMinhaQuery.First;
  vValorMovimentadoCredito := 0;
  vValorMovimentadoDebito := 0;
  while not vMinhaQuery.Eof do
  begin
    if AnsiUpperCase(vMinhaQuery.FieldByName('DEBITO_CREDITO').AsString) = 'C' then
      vValorMovimentadoCredito := vValorMovimentadoCredito + vMinhaQuery.FieldByName('VALOR_MOVIMENTADO').AsFloat
    else
      vValorMovimentadoDebito := vValorMovimentadoDebito + vMinhaQuery.FieldByName('VALOR_MOVIMENTADO').AsFloat;
    vMinhaQuery.Next;
  end;


  qString := 'UPDATE CLIENTES SET SALDO_DISPONIVEL =:SALDO_DISPONIVEL WHERE ID_CLIENTE =:ID_CLIENTE';
  with vMinhaQuery do
  begin
    Close;
    CommandText := qString;
    ParamByName('SALDO_DISPONIVEL').Value := (vLimiteDisponivel + vValorMovimentadoCredito) - vValorMovimentadoDebito;
    ParamByName('ID_CLIENTE').Value := qCliente;
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREADCOMMITTED;
    DSModuleDb.SQLConexao.StartTransaction(Transacao);
    try
      ExecSQL();
      DSModuleDb.SQLConexao.Commit(Transacao);
    except
      DSModuleDb.SQLConexao.Rollback(Transacao);
      MessageDlg('Não foi possível ajustar o saldo do cliente nº: '+IntToStr(qCliente),mtError,[mbOK],0);
    end;
  end;
end;

procedure TDSModuleDb.AjustarSaldoProduto(qIdProduto: integer; qValor: real);
var
   Transacao : TTransactionDesc;
   vMinhaQuery : TSQLQuery;
   qString : string;
begin
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  qString := '';
  qString := 'UPDATE PRODUTOS SET PRO_SALDO =:PRO_SALDO WHERE PRO_ID =:ID_PRODUTO';
  with vMinhaQuery do
  begin
    Close;
    CommandText := qString;
    ParamByName('ID_PRODUTO').Value := qIdProduto;
    ParamByName('PRO_SALDO').Value := qValor;

    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREADCOMMITTED;
    DSModuleDb.SQLConexao.StartTransaction(Transacao);
    try
      ExecSQL();
      DSModuleDb.SQLConexao.Commit(Transacao);
    except
      DSModuleDb.SQLConexao.Rollback(Transacao);
      MessageDlg('Não foi possível ajustar o saldo do produto nº: '+IntToStr(qIdProduto),mtError,[mbOK],0);
    end;
  end;
end;

procedure TDSModuleDb.AtualizaConfigAcBr;
var OK : Boolean;
begin

  // realiza a leidura dos dados do arquivo de configuração
  LeArqIni;
  // Repassa Dados para componente AcBrNFe
  {$IFDEF AcBrMFeOpenSSL}
    ACBrNFe1.configuracoes.Certificados.Certificado := sCertificado;
    AcBrNFe1.Configuracoes.Certificados.Senha       := sSenha;
  {$ELSE}
    AcBrNFe1.Configuracoes.Certificados.NumeroSerie := sSerial;
  {$ENDIF}
  // Geral
  ACBrNFe1.Configuracoes.Geral.FormaEmissao         := StrToTpEmis(OK,IntToStr(sFormas));
  ACBrNFe1.Configuracoes.Geral.Salvar               := sSalvaArq;
  ACBrNFe1.Configuracoes.Arquivos.PathSalvar           := sPathArq;
  // WebServices
  ACBrNFe1.Configuracoes.WebServices.UF             := sUFWS;
  if sAmbiente = 0 then
    ACBrNFe1.Configuracoes.WebServices.Ambiente       := StrToTpAmb(OK,IntToStr(1))
  else
    ACBrNFe1.Configuracoes.WebServices.Ambiente       := StrToTpAmb(OK,IntToStr(2));

//  ACBrNFe1.Configuracoes.WebServices.Ambiente       := StrToTpAmb(OK,IntToStr(sAmbiente));
  ACBrNFe1.Configuracoes.WebServices.Visualizar     := False;
  ACBrNFe1.Configuracoes.WebServices.ProxyHost      := sHost;
  ACBrNFe1.Configuracoes.WebServices.ProxyPort      := sPorta;
  ACBrNFe1.Configuracoes.WebServices.ProxyUser      := sUsuario;
  ACBrNFe1.Configuracoes.WebServices.ProxyPass      := sSenhaWS;

  if ACBrNFe1.DANFE <> nil then
  begin
    ACBrNFe1.DANFE.TipoDANFE := StrToTpImp(OK,'1');
    ACBrNFe1.DANFE.Logo      := sLogoMarca;
  end;
end;

function TDSModuleDb.CadastrarCaixa(qCaixa: integer): boolean;
var
  vMinhaQuery,vQueryMovimentacao : TSQLQuery;
  qIdCaixaAberturaFechamento : integer;
  Transacao : TTransactionDesc;
  qString,qString2 : string;
  vValorMovimentado : Double;
begin
  Result := True;
  qString := '';
  qString := 'INSERT INTO CAIXAS ( ID_CAIXA, VINCULADO, NUMERO_CAIXA)'+
             '  VALUES           (:ID_CAIXA,:VINCULADO,:NUMERO_CAIXA)';
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  with vMinhaQuery do
  begin
    Close;
    CommandText := qString;
    ParamByName('ID_CAIXA').Value := GeneratorIncrementado('NOVO_CAIXA');
    ParamByName('VINCULADO').Value := 'S';
    ParamByName('NUMERO_CAIXA').Value := qCaixa;
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREADCOMMITTED;
    DSModuleDb.SQLConexao.StartTransaction(Transacao);
    try
      ExecSQL();
      DSModuleDb.SQLConexao.Commit(Transacao);
    except
      DSModuleDb.SQLConexao.Rollback(Transacao);
      Result := False;
    end;
  end;
  FreeAndNil(vMinhaQuery);
end;

function TDSModuleDb.CadastrarSenha(qUsuario,qSenha:string): boolean;
var
  vMinhaQuery : TSQLQuery;
  Transacao : TTransactionDesc;
  qString : string;
  vIdentificador : integer;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT ID_USUARIO FROM USUARIOS WHERE UPPER(USUARIO) =:USUARIO';
    ParamByName('USUARIO').Value := qUsuario;
    Open;
  end;
  if vMinhaQuery.FieldByName('ID_USUARIO').AsInteger = 0 then
    Result := False
  else
  begin
    vIdentificador := vMinhaQuery.FieldByName('ID_USUARIO').AsInteger;
    qString := '';
    qString := 'UPDATE USUARIOS SET SENHA =:SENHA WHERE ID_USUARIO =:ID_USUARIO';
    with vMinhaQuery do
    begin
      Close;
      CommandText := qString;
      ParamByName('ID_USUARIO').Value := vIdentificador;
      ParamByName('SENHA').Value := qSenha;
      Transacao.TransactionID := 1;
      Transacao.IsolationLevel := xilREADCOMMITTED;
      DSModuleDb.SQLConexao.StartTransaction(Transacao);
      try
        ExecSQL();
        DSModuleDb.SQLConexao.Commit(Transacao);
      except
        DSModuleDb.SQLConexao.Rollback(Transacao);
        Result := False;
      end;
    end;
  end;
  cdsUsuarios.Close;
  cdsUsuarios.Open;
  FreeAndNil(vMinhaQuery);
end;

procedure TDSModuleDb.CDSFormasPagamentosAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDSModuleDb.CDSFormasPagamentosAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;

end;

procedure TDSModuleDb.cdsPermissoesUsuariosSistemaAfterDelete(
  DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDSModuleDb.cdsPermissoesUsuariosSistemaAfterInsert(
  DataSet: TDataSet);
begin
  cdsPermissoesUsuariosSistemaID_PERMISSAO_USUARIO_SISTEMA.Value := GeneratorIncrementado('NOVA_PERMISSAO_USUARIO_SISTEMA');
end;

procedure TDSModuleDb.cdsPermissoesUsuariosSistemaAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDSModuleDb.cdsUsuariosAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDSModuleDb.cdsUsuariosAfterInsert(DataSet: TDataSet);
begin
  cdsUsuariosID_USUARIO.Value := GeneratorIncrementado('NOVA_USUARIO');
end;

procedure TDSModuleDb.cdsUsuariosAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDSModuleDb.cdsUsuariosBeforeDelete(DataSet: TDataSet);
var
  vMinhaquery : TSQLQuery;
  Transacao : TTransactionDesc;
  qString : string;
  vIdentificador,I : integer;
begin
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;

  qString := '';
  qString := 'DELETE FROM PERMISSOES_VS_USUARIOS WHERE ID_USUARIO =:ID_USUARIO';
  with vMinhaQuery do
  begin
    Close;
    CommandText := qString;
    ParamByName('ID_USUARIO').Value := DSModuleDb.cdsUsuariosID_USUARIO.AsInteger;
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREADCOMMITTED;
    DSModuleDb.SQLConexao.StartTransaction(Transacao);
    try
      ExecSQL();
      DSModuleDb.SQLConexao.Commit(Transacao);
    except
      DSModuleDb.SQLConexao.Rollback(Transacao);
    end;
  end;
end;

function TDSModuleDb.DeletarPedidosEItensDeAcordoComONumeroDaComanda(
  qPedido: integer): boolean;
var
  vMinhaQuery,vMinhaQuery2,vQueryPedidos : TSQLQuery;
  Transacao : TTransactionDesc;
  qString : string;
  vContinua : boolean;
begin
  vContinua := True;
  vQueryPedidos := TSQLQuery.Create(nil);
  vQueryPedidos.SQLConnection := DSModuleDb.SQLConexao;

  with vQueryPedidos do
  begin
    Close;
    CommandText := 'SELECT * FROM PEDIDOS WHERE ID_PEDIDO =:ID_PEDIDO';
    Parambyname('ID_PEDIDO').Value := qPedido;
    Open;
  end;
  if vQueryPedidos.FieldByName('ID_PEDIDO').AsInteger > 0 then
  begin
    vMinhaQuery := TSQLQuery.Create(nil);
    vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
    vMinhaQuery2 := TSQLQuery.Create(nil);
    vMinhaQuery2.SQLConnection := DSModuleDb.SQLConexao;

    qString := '';
    qString := 'DELETE FROM PEDIDOS_ITENS WHERE ID_PEDIDO =:ID_PEDIDO';
    with vMinhaQuery do
    begin
      Close;
      CommandText := qString;
      ParamByName('ID_PEDIDO').Value :=  qPedido;
      Transacao.TransactionID := 1;
      Transacao.IsolationLevel := xilREADCOMMITTED;
      DSModuleDb.SQLConexao.StartTransaction(Transacao);
      ExecSQL();
    end;

    qString := '';
    qString := 'DELETE FROM PEDIDOS WHERE ID_PEDIDO = :ID_PEDIDO ';
    with vMinhaQuery2 do
    begin
      Close;
      CommandText := qString;
      ParamByName('ID_PEDIDO').Value :=  qPedido;
      ExecSQL();
    end;

    try
      DSModuleDb.SQLConexao.Commit(Transacao);
    except
      DSModuleDb.SQLConexao.Rollback(Transacao);
      vContinua := False;
    end;
  end
  else
    vContinua := False;

  if vContinua then
    Result := True
  else
    Result := False;

  FreeAndNil(vMinhaQuery);
  FreeAndNil(vMinhaQuery2);
  FreeAndNil(vQueryPedidos);
end;

procedure TDSModuleDb.DSServerModuleCreate(Sender: TObject);
begin
  SQLConexao.Connected := False;
  SQLConexao.CloseDataSets;
  SQLConexao.Params.Values['Database'] := frmSplash.pEnderecoBanco;
  DSPProdutos.DataSet := SQLDSProdutos;
//  DSPGrupo_Produtos.DataSet := SQLDSGrupo_Produtos;
  DSPPedidos.DataSet := SQLDSPedidos;
//  DSPPedidos_Itens.DataSet := SQLDSPedidos_Itens;
//  DSPPedidos_PedidosItens.DataSet := SQLDSPedidosPedidosItens;
  DSPComandas.DataSet := SQLDSComandas;
//  DSPMovimentacoes.DataSet := SQLDSMovimentacoes;

  try
    SQLConexao.Connected := True;
  except
    SQLConexao.Connected := False;
    showmessage('Endereço do banco de dados não foi informado.'+#13+
                'Por favor, entre em contato com a HeadSystems');
  end;
end;

function TDSModuleDb.EfetuarAberturaDoCaixa(qCaixa,qUsuario: Integer;qSaldo:Double): boolean;
var
  vMinhaQuery : TSQLQuery;
  IdCaixa : integer;
  Transacao : TTransactionDesc;
  qString : string;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  //Primeiro preciso verificar se o caixa está cadastrado
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT ID_CAIXA FROM CAIXAS WHERE NUMERO_CAIXA =:CAIXA';
    ParamByName('CAIXA').Value := qCaixa;
    Open;
  end;
  if vMinhaQuery.FieldByName('ID_CAIXA').AsInteger = 0 then
    Result := False
  else
  begin
    IdCaixa := vMinhaQuery.FieldByName('ID_CAIXA').AsInteger;
    //Agora, irei verificar se o caixa já está aberto
    with vMinhaQuery do
    begin
      Close;
      CommandText := 'SELECT FIRST 1 * FROM CAIXAS_ABERTURAS_FECHAMENTOS '+
                     'WHERE ID_CAIXA =:ID_CAIXA AND DATA_ABERTURA =:DATA_ABERTURA '+
                     'AND DATA_FECHAMENTO IS NULL '+
                     'ORDER BY HORA_ABERTURA DESC';
      ParamByName('ID_CAIXA').Value := IdCaixa;
      ParamByName('DATA_ABERTURA').Value := StrToDate(FormatDateTime('dd/mm/yyyy',Date));
      Open;
    end;
    if vMinhaQuery.FieldByName('ID_CAIXA').IsNull = False then
    begin
      Result := False;
      showmessage('Caixa já está aberto');
    end
    else
    begin
      //Irei fazer a abertura do caixa
      qString := '';
      qString := 'INSERT INTO CAIXAS_ABERTURAS_FECHAMENTOS(ID_CAIXA_ABERTURA_FECHAMENTO, ID_CAIXA,'+
                 ' DATA_ABERTURA, HORA_ABERTURA, SALDO_ABERTURA, ID_USUARIO)'+
                 'VALUES                                 (:ID_CAIXA_ABERTURA_FECHAMENTO,:ID_CAIXA,'+
                 ':DATA_ABERTURA,:HORA_ABERTURA,:SALDO_ABERTURA,:ID_USUARIO)';;
      with vMinhaQuery do
      begin
        Close;
        CommandText := qString;
        ParamByName('ID_CAIXA_ABERTURA_FECHAMENTO').Value := GeneratorIncrementado('NOVA_ABERTURA_FECHAMENTO');
        ParamByName('ID_CAIXA').Value := IdCaixa;
        ParamByName('DATA_ABERTURA').Value := StrToDate(FormatDateTime('dd/mm/yyyy',Date));
        ParamByName('HORA_ABERTURA').Value := FormatDateTime('hh:mm:ss',Now);
        ParamByName('SALDO_ABERTURA').Value := qSaldo;
        ParamByName('ID_USUARIO').Value := qUsuario;
        Transacao.TransactionID := 1;
        Transacao.IsolationLevel := xilREADCOMMITTED;
        DSModuleDb.SQLConexao.StartTransaction(Transacao);
        try
          ExecSQL();
          DSModuleDb.SQLConexao.Commit(Transacao);
        except
          DSModuleDb.SQLConexao.Rollback(Transacao);
          Result := False;
        end;
      end;
    end;
  end;
  FreeAndNil(vMinhaQuery);
end;

function TDSModuleDb.EfetuarMovimentacaoCliente(qCliente,qUsuario,qIdPedido: integer;qDebitoCredito,qDescricao,
                                                qObservacao:string;qValorMovimentado:Double): boolean;
var
  vMinhaQuery,vQueryMovimentacao : TSQLQuery;
  qIdCaixaAberturaFechamento : integer;
  Transacao : TTransactionDesc;
  qString,qString2 : string;
  vValorMovimentado : Double;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  //Verificando existencia do cliente informado
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT ID_CLIENTE FROM CLIENTES WHERE ID_CLIENTE =:ID_CLIENTE ';
    ParamByName('ID_CLIENTE').Value := qCliente;
    Open;
  end;
  if vMinhaQuery.FieldByName('ID_CLIENTE').AsInteger = 0 then
  begin
    Result := False;
    Exit;
  end;

  qString := '';
  qString := 'INSERT INTO MOVIMENTACOES_CLIENTES (ID_MOVIMENTACAO_CLIENTE, ID_USUARIO, ID_CLIENTE, DEBITO_CREDITO, VALOR_MOVIMENTADO, '+
             '                                    DESCRICAO_MOVIMENTACAO, OBSERVACAO, ID_PEDIDO)'+
             'VALUES                            (:ID_MOVIMENTACAO_CLIENTE,:ID_USUARIO,:ID_CLIENTE,:DEBITO_CREDITO,:VALOR_MOVIMENTADO, '+
             '                                   :DESCRICAO_MOVIMENTACAO,:OBSERVACAO,:ID_PEDIDO)';
  with vMinhaQuery do
  begin
    Close;
    CommandText := qString;
    ParamByName('ID_MOVIMENTACAO_CLIENTE').Value := GeneratorIncrementado('NOVA_MOVIMENTACAO_CLIENTE');
    ParamByName('ID_USUARIO').Value := qUsuario;
    ParamByName('ID_CLIENTE').Value := qCliente;
    ParamByName('DEBITO_CREDITO').Value := qDebitoCredito;
    ParamByName('VALOR_MOVIMENTADO').Value := qValorMovimentado;
    ParamByName('DESCRICAO_MOVIMENTACAO').Value := qDescricao;
    ParamByName('ID_PEDIDO').Value := qIdPedido;
    ParamByName('OBSERVACAO').Value := qObservacao;
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREADCOMMITTED;
    DSModuleDb.SQLConexao.StartTransaction(Transacao);
    try
      ExecSQL();
      DSModuleDb.SQLConexao.Commit(Transacao);
      AjustarLimiteCompraClientes(qCliente);
    except
      DSModuleDb.SQLConexao.Rollback(Transacao);
      Result := False;
    end;
  end;
  FreeAndNil(vMinhaQuery);
end;

function TDSModuleDb.EftuarFechamentoDoCaixa(qCaixa,qusuario: integer;
  qsaldo: Double): boolean;
var
  vMinhaQuery,vQueryMovimentacao : TSQLQuery;
  IdCaixa,vIdentificador : integer;
  Transacao : TTransactionDesc;
  qString,qString2 : string;
  vValorMovimentado : Double;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  IdCaixa := RetornaIdentificadorDoCaixa(qCaixa);
  //Primeiro preciso verificar se o caixa está cadastrado
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT ID_CAIXA FROM CAIXAS WHERE NUMERO_CAIXA =:CAIXA';
    ParamByName('CAIXA').Value := qCaixa;
    Open;
  end;
  if vMinhaQuery.FieldByName('ID_CAIXA').AsInteger = 0 then
    Result := False
  else
  begin
    IdCaixa := vMinhaQuery.FieldByName('ID_CAIXA').AsInteger;
    //Agora, irei verificar se o caixa  está fechado
    with vMinhaQuery do
    begin
      Close;
      CommandText := 'SELECT FIRST 1 * FROM CAIXAS_ABERTURAS_FECHAMENTOS '+
                       'WHERE ID_CAIXA =:ID_CAIXA AND DATA_ABERTURA =:DATA_ABERTURA '+
                       'ORDER BY HORA_ABERTURA DESC';
      ParamByName('ID_CAIXA').Value := IdCaixa;
      ParamByName('DATA_ABERTURA').Value := StrToDate(FormatDateTime('dd/mm/yyyy',Date));
      Open;
    end;
    if vMinhaQuery.FieldByName('DATA_FECHAMENTO').IsNull = false then
    begin
      Result := False;
      showmessage('Caixa já está fechado');
    end
    else
    begin
      vIdentificador := vMinhaQuery.FieldByName('ID_CAIXA_ABERTURA_FECHAMENTO').AsInteger;
      //Irei fazer o fechamento do caixa
      qString := '';
      qString := 'UPDATE CAIXAS_ABERTURAS_FECHAMENTOS SET DATA_FECHAMENTO =:DATA_FECHAMENTO,'+
                 ' HORA_FECHAMENTO =:HORA_FECHAMENTO, SALDO_FECHAMENTO =:SALDO_FECHAMENTO '+
                 ' WHERE ID_CAIXA_ABERTURA_FECHAMENTO =:ID_CAIXA_ABERTURA_FECHAMENTO';

      vQueryMovimentacao := TSQLQuery.Create(nil);
      vQueryMovimentacao.SQLConnection := DSModuleDb.SQLConexao;
      qString2 := 'SELECT COALESCE(VALOR_MOVIMENTADO,0) AS VALOR_MOVIMENTADO,DEBITO_CREDITO FROM MOVIMENTACOES_CAIXAS '+
                  ' WHERE ID_CAIXA_ABERTURA_FECHAMENTO =:ID_CAIXA_ABERTURA_FECHAMENTO'+
                  ' ORDER BY ID_MOVIMENTACAO_CAIXA';
      with vQueryMovimentacao do
      begin
        Close;
        CommandText := qString2;
        ParamByName('ID_CAIXA_ABERTURA_FECHAMENTO').Value := vIdentificador;
        Open;
      end;
      vValorMovimentado := 0;
      vQueryMovimentacao.First;
      while not vQueryMovimentacao.Eof do
      begin
        if AnsiUpperCase(vQueryMovimentacao.FieldByName('DEBITO_CREDITO').AsString) = 'D' then
          vValorMovimentado := vValorMovimentado - vQueryMovimentacao.FieldByName('VALOR_MOVIMENTADO').AsFloat
        else
          vValorMovimentado := vValorMovimentado + vQueryMovimentacao.FieldByName('VALOR_MOVIMENTADO').AsFloat;
        vQueryMovimentacao.Next;
      end;

      with vMinhaQuery do
      begin
        Close;
        CommandText := qString;
        ParamByName('ID_CAIXA_ABERTURA_FECHAMENTO').Value := vIdentificador;
        ParamByName('DATA_FECHAMENTO').Value := StrToDate(FormatDateTime('dd/mm/yyyy',Date));
        ParamByName('HORA_FECHAMENTO').Value := FormatDateTime('hh:mm:ss',Now);
        ParamByName('SALDO_FECHAMENTO').Value := vValorMovimentado;
        Transacao.TransactionID := 1;
        Transacao.IsolationLevel := xilREADCOMMITTED;
        DSModuleDb.SQLConexao.StartTransaction(Transacao);
        try
          ExecSQL();
          DSModuleDb.SQLConexao.Commit(Transacao);
        except
          DSModuleDb.SQLConexao.Rollback(Transacao);
          Result := False;
        end;
      end;
    end;
  end;
  FreeAndNil(vMinhaQuery);
  FreeAndNil(vQueryMovimentacao);
end;

function TDSModuleDb.EnviarNFe(qIdNotaFiscal: integer): string;
var
  vRetornoFuncao : string;
  vIdCliente,vContadorItem,vIdTransportador : integer;
begin
  LeArqIni;
  AtualizaConfigAcBr;
  //  ACBrNFe1.Configuracoes.Certificados.NumeroSerie := '55724df82f3454bf';
  //  ACBrNFe1.Configuracoes.Certificados.Senha := '2411';
  Inc(sUltNumNFe);
  ACBrNFeDANFEFR1.FastFile := ExtractFilePath(Application.ExeName)+'DANFE.fr3';
  SQLDSGenerica.Close;
  SQLDSGenerica.CommandText := 'SELECT * FROM NOTAS_FISCAIS WHERE ID_NOTA_FISCAL = '+IntToStr(qIdNotaFiscal);
  SQLDSGenerica.Open;
  vIdCliente := SQLDSGenerica.FieldByName('ID_CLIENTE').AsInteger;
  vIdTransportador := SQLDSGenerica.FieldByName('ID_TRANSPORTADOR').AsInteger;
  ACBrNFe1.NotasFiscais.Clear;
  with ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    Ide.tpImp     := tiPaisagem;
    Ide.cNF       := sUltNumNFe; //Caso não seja preenchido será gerado um número aleatório pelo componente
    Ide.natOp     := SQLDSGenerica.FieldByName('NATUREZA_DE_OPERACAO').AsString;//'VENDA PRODUCAO DO ESTAB.';
    Ide.indPag    := ipVista;
    Ide.modelo    := 55;
    Ide.serie     := 1;
    Ide.nNF       := sUltNumNFe;
    Ide.dEmi      := SQLDSGenerica.FieldByName('DATA_EMISSAO').AsDateTime;//Date;
    Ide.dSaiEnt   := SQLDSGenerica.FieldByName('DATA_SAIDA_ENTRADA').AsDateTime;//Date;
    Ide.hSaiEnt   := SQLDSGenerica.FieldByName('HORA_SAIDA_ENTRADA').AsDateTime;//Now;
    if Trim(AnsiUpperCase(SQLDSGenerica.FieldByName('ENTRADA_SAIDA').AsString)) = 'S' then
      Ide.tpNF      := tnSaida
    else
      Ide.tpNF      := tnEntrada;

    Ide.tpEmis    := teNormal;



    if sAmbiente = 0 then
      Ide.tpAmb := taProducao
    else
      Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta variável quando for para ambiente de produção

    Ide.verProc   := '1.0.0.0'; //Versão do seu sistema
    Ide.cUF       := UFparaCodigo('SP');
    Ide.cMunFG    := StrToInt('3500709');   //VERIFICAR O CODIGO DO MUNICIPIO

    if Trim(AnsiUpperCase(SQLDSGenerica.FieldByName('INFORMACAO_NFE').AsString)) =  'NORMAL' then
      Ide.finNFe    := fnNormal
    else
    if Trim(AnsiUpperCase(SQLDSGenerica.FieldByName('INFORMACAO_NFE').AsString)) =  'COMPLEMENTAR' then
      Ide.finNFe    := fnComplementar
    else
    if Trim(AnsiUpperCase(SQLDSGenerica.FieldByName('INFORMACAO_NFE').AsString)) =  'AJUSTE' then
      Ide.finNFe    := fnAjuste
    else
    if Trim(AnsiUpperCase(SQLDSGenerica.FieldByName('INFORMACAO_NFE').AsString)) =  'DEVOLUÇÃO' then
      Ide.finNFe    := fnDevolucao;


    Emit.CNPJCPF           := sCNPJ;//'50564244000175';
    Emit.IE                := sIE;//'635117647119';
    Emit.xNome             := sRazao;//'Business';
    Emit.xFant             := sFantasia;//'Business Controller';

    Emit.EnderEmit.fone    := sFone;//'0000000000';
    Emit.EnderEmit.CEP     := StrToInt(sCEP);//StrToInt('02879150');
    Emit.EnderEmit.xLgr    := sEndereco;//'Rua da Bica';
    Emit.EnderEmit.nro     := sNum;//'77';
    Emit.EnderEmit.xCpl    := '';
    Emit.EnderEmit.xBairro := sBairro;//'Alexandria';
    Emit.EnderEmit.cMun    := StrToInt(sCodMun);//StrToInt('3500709');
    Emit.EnderEmit.xMun    := sCidade;//'Tangamandapio';
    Emit.EnderEmit.UF      := sUF;//'SP';
    Emit.enderEmit.cPais   := 1058;
    Emit.enderEmit.xPais   := 'BRASIL';


    Total.ICMSTot.vBC     := SQLDSGenerica.FieldByName('BASE_CALCULO_ICMS').AsFloat;
    Total.ICMSTot.vICMS   := SQLDSGenerica.FieldByName('VALOR_ICMS').AsFloat;
    Total.ICMSTot.vBCST   := SQLDSGenerica.FieldByName('BASE_ST').AsFloat;
    Total.ICMSTot.vST     := SQLDSGenerica.FieldByName('VALOR_ST').AsFloat;
    Total.ICMSTot.vProd   := SQLDSGenerica.FieldByName('VALOR_PRODUTOS').AsFloat;
    Total.ICMSTot.vFrete  := SQLDSGenerica.FieldByName('VALOR_FRETE').AsFloat;
    Total.ICMSTot.vSeg    := SQLDSGenerica.FieldByName('VALOR_SEGURO').AsFloat;
    Total.ICMSTot.vDesc   := SQLDSGenerica.FieldByName('VALOR_DESCONTO').AsFloat;
    Total.ICMSTot.vII     := SQLDSGenerica.FieldByName('VALOR_IMPOSTO_IMPORTACAO').AsFloat;
    Total.ICMSTot.vIPI    := SQLDSGenerica.FieldByName('VALOR_IPI').AsFloat;
    Total.ICMSTot.vPIS    := SQLDSGenerica.FieldByName('VALOR_PIS').AsFloat;
    Total.ICMSTot.vCOFINS := SQLDSGenerica.FieldByName('VALOR_COFINS').AsFloat;
    Total.ICMSTot.vOutro  := SQLDSGenerica.FieldByName('VALOR_OUTROS').AsFloat;
    Total.ICMSTot.vNF     := SQLDSGenerica.FieldByName('VALOR_TOTAL_NOTA').AsFloat;

    Total.ISSQNtot.vServ   := 0;//100
    Total.ISSQNTot.vBC     := 0;//100
    Total.ISSQNTot.vISS    := 0;//2
    Total.ISSQNTot.vPIS    := 0;
    Total.ISSQNTot.vCOFINS := 0;

    if Trim(Ansiuppercase(SQLDSGenerica.FieldByName('RESPONSAVEL_FRETE').AsString)) = 'E' then
      Transp.modFrete := mfContaEmitente
    else
    if Trim(Ansiuppercase(SQLDSGenerica.FieldByName('RESPONSAVEL_FRETE').AsString)) = 'D' then
      Transp.modFrete := mfContaDestinatario
    else
    if Trim(Ansiuppercase(SQLDSGenerica.FieldByName('RESPONSAVEL_FRETE').AsString)) = 'T' then
      Transp.modFrete := mfContaTerceiros
    else
    if Trim(Ansiuppercase(SQLDSGenerica.FieldByName('RESPONSAVEL_FRETE').AsString)) = 'S' then
      Transp.modFrete := mfSemFrete;


    SQLDSGenerica.Close;
    SQLDSGenerica.CommandText := 'SELECT * FROM TRANSPORTADORES WHERE ID_TRANSPORTADOR = '+IntToStr(vIdTransportador);
    SQLDSGenerica.Open;

    Transp.Transporta.CNPJCPF  := SQLDSGenerica.FieldByName('CNPJ').AsString;
    Transp.Transporta.xNome    := SQLDSGenerica.FieldByName('RAZAO_SOCIAL').AsString;
    Transp.Transporta.IE       := SQLDSGenerica.FieldByName('INSCRICAO_ESTADUAL').AsString;
    Transp.Transporta.xEnder   := SQLDSGenerica.FieldByName('ENDERECO').AsString + ', '+
                                  SQLDSGenerica.FieldByName('NUMERO').AsString;
    Transp.Transporta.xMun     := SQLDSGenerica.FieldByName('CIDADE').AsString;
    Transp.Transporta.UF       := SQLDSGenerica.FieldByName('UF').AsString;

    Transp.veicTransp.placa := '';
    Transp.veicTransp.UF    := '';
    Transp.veicTransp.RNTC  := '';

    with Transp.Vol.Add do
    begin
      qVol  := 1;
      esp   := 'Especie';
      marca := 'Marca';
      nVol  := 'Numero';
      pesoL := 100;
      pesoB := 110;
    end;

    SQLDSGenerica.Close;
    SQLDSGenerica.CommandText := 'SELECT * FROM CLIENTES WHERE ID_CLIENTE = '+IntToStr(vIdCliente);
    SQLDSGenerica.Open;

    Emit.IEST              := '';//'442121245118';
    Emit.IM                := ''; // Preencher no caso de existir serviços na nota
    Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se é permitido
                                    // a inclusão de serviços na NFe
    Emit.CRT               := crtRegimeNormal;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)

    Dest.CNPJCPF           := SQLDSGenerica.FieldByName('CNPJ').AsString;//'05481336000137';
    Dest.IE                := SQLDSGenerica.FieldByName('INSCRICAO_ESTADUAL').AsString;//'687138770110';
    Dest.ISUF              := '';
    Dest.xNome             := SQLDSGenerica.FieldByName('RAZAO_SOCIAL').AsString;//'D.J. COM. E LOCAÇÃO DE SOFTWARES LTDA - ME';

    Dest.EnderDest.Fone    := SQLDSGenerica.FieldByName('TELEFONE').AsString;//'1532599600';
    Dest.EnderDest.CEP     := StrToInt(SQLDSGenerica.FieldByName('CEP').AsString);//18270170;
    Dest.EnderDest.xLgr    := SQLDSGenerica.FieldByName('ENDERECO').AsString;//'Rua Coronel Aureliano de Camargo';
    Dest.EnderDest.nro     := SQLDSGenerica.FieldByName('NUMERO').AsString;//'973';
    Dest.EnderDest.xCpl    := '';
    Dest.EnderDest.xBairro := SQLDSGenerica.FieldByName('BAIRRO').AsString;//'Centro';

    //if AcbrIbge1.BuscarPorNome(SQLDSGenerica.FieldByName('CIDADE').AsString,SQLDSGenerica.FieldByName('UF').AsString) > 0 then
    //  Dest.EnderDest.cMun    := AcbrIbge1.BuscarPorNome(SQLDSGenerica.FieldByName('CIDADE').AsString,SQLDSGenerica.FieldByName('UF').AsString)
    //else
      Dest.EnderDest.cMun    := StrToInt('3500709');
    Dest.EnderDest.xMun    := SQLDSGenerica.FieldByName('CIDADE').AsString;//'Centro';
    Dest.EnderDest.UF      := SQLDSGenerica.FieldByName('UF').AsString;//'Centro';
    Dest.EnderDest.cPais   := 1058;
    Dest.EnderDest.xPais   := 'BRASIL';

    vContadorItem := 0;
    SQLDSGenerica.Close;
    SQLDSGenerica.CommandText := 'SELECT * FROM NOTAS_FISCAIS_ITENS WHERE ID_NOTA_FISCAL = '+IntToStr(qIdNotaFiscal);
    SQLDSGenerica.Open;
    //Inserindo Produtos
    SQLDSGenerica.First;
    Det.Clear;
    while not SQLDSGenerica.Eof do
    begin
      with Det.Add do
      begin
        Inc(vContadorItem);
        Prod.nItem    := vContadorItem; // Número sequencial, para cada item deve ser incrementado
        Prod.cProd    := SQLDSGenerica.FieldByName('CODIGO_PRODUTO').AsString;
        Prod.cEAN     := SQLDSGenerica.FieldByName('EAN13').AsString;
        Prod.xProd    := SQLDSGenerica.FieldByName('DESCRICAO_PRODUTO').AsString;
        Prod.NCM      := SemPontosNemTracinhos(SQLDSGenerica.FieldByName('NCM_PRODUTO').AsString);
        Prod.EXTIPI   := SQLDSGenerica.FieldByName('CST_IPI').AsString;//'';
        Prod.CFOP     := SQLDSGenerica.FieldByName('CFOP').AsString;
        Prod.uCom     := SQLDSGenerica.FieldByName('UNIDADE').AsString;
        Prod.qCom     := SQLDSGenerica.FieldByName('QUANTIDADE').AsFloat ;
        Prod.vUnCom   := SQLDSGenerica.FieldByName('VALOR_UNITARIO').AsFloat;
        Prod.vProd    := SQLDSGenerica.FieldByName('VALOR_TOTAL').AsFloat ;

        Prod.cEANTrib  := '';
        Prod.uTrib     := 'UN';
        Prod.qTrib     := SQLDSGenerica.FieldByName('QUANTIDADE').AsFloat;
        Prod.vUnTrib   := SQLDSGenerica.FieldByName('VALOR_UNITARIO').AsFloat;

        Prod.vFrete    := SQLDSGenerica.FieldByName('VALOR_FRETE').AsFloat;
        Prod.vSeg      := SQLDSGenerica.FieldByName('VALOR_SEGURO').AsFloat;
        Prod.vDesc     := SQLDSGenerica.FieldByName('VALOR_DESCONTO').AsFloat;
        infAdProd      := 'Informação Adicional do Serviço';
      end ;
      SQLDSGenerica.Next;
    end;

    Cobr.Fat.nFat  := 'Numero da Fatura';
    Cobr.Fat.vOrig := 100 ;
    Cobr.Fat.vDesc := 0 ;
    Cobr.Fat.vLiq  := 100 ;


    //Parcelas de pagamento
    SQLDSGenerica.Close;
    SQLDSGenerica.CommandText := 'SELECT * FROM DUPLICATAS_NOTAS_FISCAIS WHERE ID_NOTA_FISCAL = '+IntToStr(qIdNotaFiscal)+' ORDER BY NUMERO_FATURA';
    SQLDSGenerica.Open;
    Cobr.Dup.Clear;
    SQLDSGenerica.First;
    while not SQLDSGenerica.Eof do
    begin
      with Cobr.Dup.Add do
      begin
        nDup  := IntToStr(SQLDSGenerica.FieldByName('NUMERO_FATURA').AsInteger);
        dVenc := SQLDSGenerica.FieldByName('VENCIMENTO').AsDateTime;
        vDup  := SQLDSGenerica.FieldByName('VALOR').AsFloat;
      end;
      SQLDSGenerica.Next;
    end;

    InfAdic.infCpl     :=  '';
    InfAdic.infAdFisco :=  '';

    with InfAdic.obsCont.Add do
    begin
      xCampo := '';
      xTexto := '';
    end;

    with InfAdic.obsFisco.Add do
    begin
      xCampo := '';
      xTexto := '';
    end;

    exporta.UFembarq   := '';;
    exporta.xLocEmbarq := '';

    compra.xNEmp := '';
    compra.xPed  := '';
    compra.xCont := '';
  end;
  try
    GravaArqIni;
    LeArqIni;
    ACBrNFe1.NotasFiscais.GerarNFe;
    ACBrNFe1.Enviar(1,False);
    vRetornoFuncao := '';
    vRetornoFuncao := IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat) + '|'+
                    ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo + '|'+
                    ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.chNFe + '|'+
                    sPathArq+'\'+ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.chNFe+'-nfe.xml';
    Result := vRetornoFuncao;
    try
      cdsGenerico.Close;
      while cdsGenerico.Fields.Count > 0 do
        cdsGenerico.Fields.Remove(cdsGenerico.Fields[0]);

      cdsGenerico.ProviderName := 'DSPNotasFiscais';
      cdsGenerico.Active := true;
      cdsGenerico.Locate('ID_NOTA_FISCAL',sUltNumNFe,[]);
      cdsGenerico.Edit;
      cdsGenerico.FieldByName('NUMERO_NOTA_FISCAL').AsInteger := sUltNumNFe;
      cdsGenerico.FieldByName('CHAVE').AsString := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.chNFe;
      cdsGenerico.FieldByName('NUMERO_PROTOCOLO_RECEBIMENTO').AsString := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt;
      cdsGenerico.FieldByName('DATA_HORA_RECEBIMENTO').AsString := FormatDateTime('dd/mm/yyyy - hh:mm:ss',ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);
      cdsGenerico.FieldByName('MOTIVO_RECEBIMENTO').AsString := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo;
      cdsGenerico.Post;
      cdsGenerico.ApplyUpdates(0);
    except
    end;
  except on e:exception do
    begin
      vRetornoFuncao := '';
      vRetornoFuncao := 'Erro|'+e.Message;
  Result := vRetornoFuncao;
    end;
  end;

end;

function TDSModuleDb.GeneratorIncrementado(qGenerator: string): integer;
var
  vMinhaQuery : TSQLDataSet;
begin
  vMinhaQuery := TSQLDataSet.Create(self);
  vMinhaQuery.SQLConnection := SQLConexao;
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT GEN_ID('+qGenerator+',1) AS IDENTIFICADOR FROM RDB$DATABASE';
    Open;
  end;
  Result := vMinhaQuery.FieldByName('IDENTIFICADOR').AsInteger;
  FreeAndNil(vMinhaQuery);
end;

procedure TDSModuleDb.GravaArqIni;
var ArqINI : TIniFile;
vArquivo : string;
begin
  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'configNF_e.ini');
  // GERAL
  ArqINI.WriteInteger('GERAL','FORMA_EMISSAO',sFormas);
  ArqINI.WriteString('GERAL','LOGOMARCA',sLogoMarca);
  ArqINI.WriteBool('GERAL','SALVA_ARQUIVO',sSalvaArq);
  ArqINI.WriteString('GERAL','PATH_ARQUIVO',sPathArq);
  ArqINI.WriteInteger('GERAL','ULTIMO_NUMERO_NFE',sUltNumNFe);
  ArqINI.WriteString('GERAL','LOCAL_EMISSAO_NFE',sEmissaoNFeServidorOuClient);
  // CERTIFICADO
  ArqINI.WriteString('CERTIFICADO','PATH_CERTIFICADO',sCertificado);
  ArqINI.WriteString('CERTIFICADO','SENHA_CERT',sSenha);
  ArqINI.WriteString('CERTIFICADO','NUM_SERIE',sSerial);
  // emitente
  ArqINI.WriteString('EMITENTE','RAZAO',sRazao);
  ArqINI.WriteString('EMITENTE','FANTASIA',sFantasia);
  ArqINI.WriteString('EMITENTE','CNPJ',sCNPJ);
  ArqINI.WriteString('EMITENTE','I_ESTADUAL',sIE);
  ArqINI.WriteString('EMITENTE','ENDERECO',sEndereco);
  ArqINI.WriteString('EMITENTE','NUMERO',sNum);
  ArqINI.WriteString('EMITENTE','BAIRRO',sBairro);
  ArqINI.WriteString('EMITENTE','CIDADE',sCidade);
  ArqINI.WriteString('EMITENTE','CEP',sCEP);
  ArqINI.WriteString('EMITENTE','UF',sUF);
  ArqINI.WriteString('EMITENTE','MUNICIPIO',sCodMun);
  ArqINI.WriteString('EMITENTE','TELEFONE',sFone);

  ArqINI.WriteString('EMITENTE','SITUACAO_TRIBUTARIA',sSituacaoTributaria);
  ArqINI.WriteString('EMITENTE','ALIQUOTA_PIS',sAliquotaPis);
  ArqINI.WriteString('EMITENTE','ALIQUOTA_COFINS',sAliquotaCofins);
  // WebService
  ArqINI.WriteString('WS','UFWS',sUFWS);
  ArqINI.WriteInteger('WS','AMBIENTE',sAmbiente);
  ArqINI.WriteString('WS','HOST',sHost);
  ArqINI.WriteString('WS','PORTA',sPorta);
  ArqINI.WriteString('WS','USUARIO',sUsuario);
  ArqINI.WriteString('WS','SENHA',sSenhaWS);
  //
  ArqINI.Free;

end;

function TDSModuleDb.InserirEmMovimentacoes(qIdProduto, qIdPedido: integer;
  qQuantidade: double; vTipoMovimentacao,EntradaOuSaida: string): integer;
var
   Transacao : TTransactionDesc;
   vSaldoAnterior,vSaldo : Real;
   vMinhaQuery : TSQLQuery;
   qString : string;
begin
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  vSaldoAnterior := 0;
  vSaldo := 0;
  //Primeiro preciso pegar o saldo anterior da ultima movimentacao deste produto
  //caso não exista na tabela de movimentacao, o saldo anterior
  //será o próprio saldo do produto
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT FIRST 1 COALESCE(QTDE_APOS_MOVIMENTACAO,0) AS QTDE_APOS_MOVIMENTACAO FROM MOVIMENTACOES WHERE ID_PRODUTO =:ID_PRODUTO ORDER BY ID_MOVIMENTACAO DESC';
    ParamByName('ID_PRODUTO').Value := qIdProduto;
    Open;
  end;
  vMinhaQuery.First;
  if vMinhaQuery.FieldByName('QTDE_APOS_MOVIMENTACAO').AsFloat > 0 then
  begin
    //Aqui significa que encontrou registro deste produto
    //Então calculo o saldo através da movimentacao
    vSaldoAnterior := vMinhaQuery.FieldByName('QTDE_APOS_MOVIMENTACAO').AsFloat;
    qString := '';
    qString := 'INSERT INTO MOVIMENTACOES(ID_MOVIMENTACAO, ID_PEDIDO, ID_PRODUTO, DATA, HORA, QTDE_ANTERIOR,';
    qString := qString +'  QTDE_MOVIMENTADA, QTDE_APOS_MOVIMENTACAO, TIPO_MOVIMENTACAO)';

    qString := qString +'VALUES(         :ID_MOVIMENTACAO,:ID_PEDIDO,:ID_PRODUTO,:DATA,:HORA,:QTDE_ANTERIOR,';
    qString := qString +' :QTDE_MOVIMENTADA,:QTDE_APOS_MOVIMENTACAO,:TIPO_MOVIMENTACAO)';

    with vMinhaQuery do
    begin
      Close;
      CommandText := qString;
      ParamByName('ID_MOVIMENTACAO').Value := GeneratorIncrementado('NOVA_MOVIMENTACAO');
      ParamByName('ID_PEDIDO').Value := qIdPedido;
      ParamByName('ID_PRODUTO').Value := qIdProduto;
      ParamByName('DATA').Value := Date;
      ParamByName('HORA').Value := Now;
      ParamByName('QTDE_ANTERIOR').Value := vSaldoAnterior;
      ParamByName('QTDE_MOVIMENTADA').Value := qQuantidade;

      if AnsiUpperCase(EntradaOuSaida) = 'E' then
      begin
        vSaldo := vSaldoAnterior + qQuantidade;
        ParamByName('QTDE_APOS_MOVIMENTACAO').Value := vSaldo;
      end;

      if AnsiUpperCase(EntradaOuSaida) = 'S' then
      begin
        vSaldo :=  vSaldoAnterior - qQuantidade;
        ParamByName('QTDE_APOS_MOVIMENTACAO').Value := vSaldo;
      end;

      ParamByName('TIPO_MOVIMENTACAO').Value := vTipoMovimentacao;

      Transacao.TransactionID := 1;
      Transacao.IsolationLevel := xilREADCOMMITTED;
      DSModuleDb.SQLConexao.StartTransaction(Transacao);
      try
        ExecSQL();
        DSModuleDb.SQLConexao.Commit(Transacao);
        AjustarSaldoProduto(qIdProduto,vSaldo);
        Result := 1;
      except
        DSModuleDb.SQLConexao.Rollback(Transacao);
        Result := 0;
        MessageDlg('Não foi possível efetuar a movimentação do produto nº: '+IntToStr(qIdProduto),mtError,[mbOK],0);
      end;
    end;
  end
  else
  begin
    //Aqui significa que nao encontrou movimentacao deste produto, então
    //irei buscar o saldo anterior do cadastro de produtos
    with vMinhaQuery do
    begin
      Close;
      CommandText := 'SELECT COALESCE(PRO_SALDO,0) AS PRO_SALDO FROM PRODUTOS WHERE PRO_ID =:ID_PRODUTO ';
      ParamByName('ID_PRODUTO').Value := qIdProduto;
      Open;
    end;
    vSaldoAnterior := 0;
    vSaldoAnterior := vMinhaQuery.FieldByName('PRO_SALDO').AsFloat;
    qString := '';
    qString := 'INSERT INTO MOVIMENTACOES(ID_MOVIMENTACAO, ID_PEDIDO, ID_PRODUTO, DATA, HORA, QTDE_ANTERIOR,';
    qString := qString +'  QTDE_MOVIMENTADA, QTDE_APOS_MOVIMENTACAO, TIPO_MOVIMENTACAO)';

    qString := qString +'VALUES(         :ID_MOVIMENTACAO,:ID_PEDIDO,:ID_PRODUTO,:DATA,:HORA,:QTDE_ANTERIOR,';
    qString := qString +' :QTDE_MOVIMENTADA,:QTDE_APOS_MOVIMENTACAO,:TIPO_MOVIMENTACAO)';

    with vMinhaQuery do
    begin
      Close;
      CommandText := qString;
      ParamByName('ID_MOVIMENTACAO').Value := GeneratorIncrementado('NOVA_MOVIMENTACAO');
      ParamByName('ID_PEDIDO').Value := qIdPedido;
      ParamByName('ID_PRODUTO').Value := qIdProduto;
      ParamByName('DATA').Value := Date;
      ParamByName('HORA').Value := Now;
      ParamByName('QTDE_ANTERIOR').Value := vSaldoAnterior;
      ParamByName('QTDE_MOVIMENTADA').Value := qQuantidade;

      if AnsiUpperCase(EntradaOuSaida) = 'E' then
      begin
        vSaldo := vSaldoAnterior + qQuantidade;
        ParamByName('QTDE_APOS_MOVIMENTACAO').Value := vSaldo;
      end;

      if AnsiUpperCase(EntradaOuSaida) = 'S' then
      begin
        vSaldo :=  vSaldoAnterior - qQuantidade;
        ParamByName('QTDE_APOS_MOVIMENTACAO').Value := vSaldo;
      end;

      ParamByName('TIPO_MOVIMENTACAO').Value := vTipoMovimentacao;

      Transacao.TransactionID := 1;
      Transacao.IsolationLevel := xilREADCOMMITTED;
      DSModuleDb.SQLConexao.StartTransaction(Transacao);
      try
        ExecSQL();
        DSModuleDb.SQLConexao.Commit(Transacao);
        AjustarSaldoProduto(qIdProduto,vSaldo);
        Result := 1;
      except
        DSModuleDb.SQLConexao.Rollback(Transacao);
        Result := 0;
        MessageDlg('Não foi possível efetuar a movimentação do produto nº: '+IntToStr(qIdProduto),mtError,[mbOK],0);
      end;
    end;
  end;
  FreeAndNil(vMinhaQuery);
end;


function TDSModuleDb.InserirItenDoPedidoDeAcordoComNumeroDaComanda(
  qPedidoNovo,qPedido: integer):boolean;
var
  vMinhaQuery,vMinhaQuery2,vQueryPedidos,vQueryPedidosItens : TSQLQuery;
  Transacao : TTransactionDesc;
  qString : string;
  vContinua : boolean;
begin
  vContinua := True;
  vQueryPedidos := TSQLQuery.Create(nil);
  vQueryPedidos.SQLConnection := DSModuleDb.SQLConexao;

  with vQueryPedidos do
  begin
    Close;
    CommandText := 'SELECT * FROM PEDIDOS WHERE ID_PEDIDO =:ID_PEDIDO';
    Parambyname('ID_PEDIDO').Value := qPedidoNovo;
    Open;
  end;
  if vQueryPedidos.FieldByName('ID_PEDIDO').AsInteger > 0 then
  begin
    vQueryPedidosItens := TSQLQuery.Create(nil);
    vQueryPedidosItens.SQLConnection := DSModuleDb.SQLConexao;
    with vQueryPedidosItens do
    begin
      Close;
      CommandText := 'SELECT * FROM PEDIDOS_ITENS WHERE ID_PEDIDO =:ID_PEDIDO';
      Parambyname('ID_PEDIDO').Value := qPedidoNovo;
      Open;
    end;

    vMinhaQuery := TSQLQuery.Create(nil);
    vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
    vMinhaQuery2 := TSQLQuery.Create(nil);
    vMinhaQuery2.SQLConnection := DSModuleDb.SQLConexao;
    with vMinhaQuery do
    begin
      Close;
      CommandText := 'SELECT * FROM PEDIDOS_ITENS WHERE ID_PEDIDO =:ID_PEDIDO';
      ParamByName('ID_PEDIDO').Value := qPedido;
      Open;
    end;

    vMinhaQuery.First;
    while not vMinhaQuery.Eof do
    begin
      if vQueryPedidosItens.Locate('ID_PRODUTO;ID_PEDIDO',VarArrayOf([vMinhaQuery.FieldByName('ID_PRODUTO').AsInteger,
                                                                      qPedidoNovo]),[]) = False then
      begin
        qString := '';
        qString := 'INSERT INTO PEDIDOS_ITENS(ID_PEDIDO_ITEM,ID_PEDIDO,QUANTIDADE,VALOR_TOTAL,DESCRICAO_PRODUTO,ID_PRODUTO,VALOR_UNITARIO,ALIQUOTA_ICMS,DESCONTO)';
        qString := qString + ' VALUES (:ID_PEDIDO_ITEM,:ID_PEDIDO,:QUANTIDADE,:VALOR_TOTAL,:DESCRICAO_PRODUTO,:ID_PRODUTO,:VALOR_UNITARIO,:ALIQUOTA_ICMS,:DESCONTO)';
        with vMinhaQuery2 do
        begin
          Close;
          CommandText := qString;
          vMinhaQuery2.ParamByName('ID_PEDIDO_ITEM').Value := GeneratorIncrementado('NOVO_PEDIDO_ITEM');
          ParamByName('QUANTIDADE').Value :=  vMinhaQuery.FieldByName('QUANTIDADE').AsFloat;
          ParamByName('VALOR_TOTAL').Value := vMinhaQuery.FieldByName('VALOR_TOTAL').AsFloat;
          ParamByName('ID_PEDIDO').Value :=  qPedidoNovo;
          ParamByName('DESCRICAO_PRODUTO').Value := vMinhaQuery.FieldByName('DESCRICAO_PRODUTO').AsString;
          ParamByName('ID_PRODUTO').Value  := vMinhaQuery.FieldByName('ID_PRODUTO').AsInteger;
          ParamByName('VALOR_UNITARIO').Value := vMinhaQuery.FieldByName('VALOR_UNITARIO').AsFloat;
          ParamByName('ALIQUOTA_ICMS').Value := vMinhaQuery.FieldByName('ALIQUOTA_ICMS').AsInteger;
          ParamByName('DESCONTO').Value := vMinhaQuery.FieldByName('DESCONTO').AsFloat;
          Transacao.TransactionID := 1;
          Transacao.IsolationLevel := xilREADCOMMITTED;
          DSModuleDb.SQLConexao.StartTransaction(Transacao);
          ExecSQL();
        end;
      end
      else
      begin
        qString := '';
        qString := 'UPDATE PEDIDOS_ITENS SET QUANTIDADE = QUANTIDADE  + :QUANTIDADE, VALOR_TOTAL = VALOR_TOTAL + :VALOR_TOTAL';
        qString := qString + ' WHERE ID_PEDIDO = :ID_PEDIDO AND ID_PRODUTO =:ID_PRODUTO';
        with vMinhaQuery2 do
        begin
          Close;
          CommandText := qString;
          ParamByName('QUANTIDADE').Value :=  vMinhaQuery.FieldByName('QUANTIDADE').AsFloat;
          ParamByName('VALOR_TOTAL').Value := vMinhaQuery.FieldByName('VALOR_TOTAL').AsFloat;
          ParamByName('DESCONTO').Value := vMinhaQuery.FieldByName('DESCONTO').AsFloat;
          ParamByName('ID_PEDIDO').Value :=  qPedidoNovo;
          ParamByName('ID_PRODUTO').Value  := vMinhaQuery.FieldByName('ID_PRODUTO').AsInteger;
          Transacao.TransactionID := 1;
          Transacao.IsolationLevel := xilREADCOMMITTED;
          DSModuleDb.SQLConexao.StartTransaction(Transacao);
          ExecSQL();
        end;
      end;

      try
        DSModuleDb.SQLConexao.Commit(Transacao);
        vQueryPedidosItens.Close;
        vQueryPedidosItens.Open;
      except
        DSModuleDb.SQLConexao.Rollback(Transacao);
        vContinua := False;
        Break;
      end;
      vMinhaQuery.Next
    end;
  end
  else
    Result := False;

  if vContinua then
    Result := True
  else
    Result := False;

  FreeAndNil(vMinhaQuery);
  FreeAndNil(vMinhaQuery2);
  FreeAndNil(vQueryPedidos);
  FreeAndNil(vQueryPedidosItens);
end;

procedure TDSModuleDb.LeArqIni;
var ArqINI : TIniFile;
    aux : String;
begin
  aux := ExtractFilePath(Application.ExeName)+'configNF_e.ini';
  ArqINI := TIniFile.Create(aux);
  // GERAL
  sFormas      := ArqINI.ReadInteger('GERAL','FORMA_EMISSAO',0);
  sLogoMarca   := ArqINI.ReadString('GERAL','LOGOMARCA','C:\logo.jpg');
  sSalvaArq    := ArqINI.ReadBool('GERAL','SALVA_ARQUIVO',true);
  sPathArq     := ArqINI.ReadString('GERAL','PATH_ARQUIVO','C:\');
  sUltNumNFe   := ArqINI.ReadInteger('GERAL','ULTIMO_NUMERO_NFE',0);
  sEmissaoNFeServidorOuClient := ArqINI.ReadString('GERAL','LOCAL_EMISSAO_NFE','SERVIDOR');
  // CERTIFICADO
  sCertificado := ArqINI.ReadString('CERTIFICADO','PATH_CERTIFICADO','');
  sSenha       := ArqINI.ReadString('CERTIFICADO','SENHA_CERT','');
  sSerial      := ArqINI.ReadString('CERTIFICADO','NUM_SERIE','');
  // emitente
  sRazao       := ArqINI.ReadString('EMITENTE','RAZAO','');
  sFantasia    := ArqINI.ReadString('EMITENTE','FANTASIA','');
  sCNPJ        := ArqINI.ReadString('EMITENTE','CNPJ','');
  sIE          := ArqINI.ReadString('EMITENTE','I_ESTADUAL','');
  sEndereco    := ArqINI.ReadString('EMITENTE','ENDERECO','');
  sNum         := ArqINI.ReadString('EMITENTE','NUMERO','');
  sBairro      := ArqINI.ReadString('EMITENTE','BAIRRO','');
  sCidade      := ArqINI.ReadString('EMITENTE','CIDADE','');
  sCEP         := ArqINI.ReadString('EMITENTE','CEP','');
  sUF          := ArqINI.ReadString('EMITENTE','UF','');
  sCodMun      := ArqINI.ReadString('EMITENTE','MUNICIPIO','');
  sFone        := ArqINI.ReadString('EMITENTE','TELEFONE','');
  sSituacaoTributaria := ArqINI.ReadString('EMITENTE','SITUACAO_TRIBUTARIA','');
  sAliquotaPis := ArqINI.ReadString('EMITENTE','ALIQUOTA_PIS','');
  sAliquotaCofins := ArqINI.ReadString('EMITENTE','ALIQUOTA_COFINS','');
  // WebService
  sUFWS        := ArqINI.ReadString('WS','UFWS','');
  sAmbiente    := ArqINI.ReadInteger('WS','AMBIENTE',0);
  sHost        := ArqINI.ReadString('WS','HOST','');
  sPorta       := ArqINI.ReadString('WS','PORTA','');
  sUsuario     := ArqINI.ReadString('WS','USUARIO','');
  sSenhaWS     := ArqINI.ReadString('WS','SENHA','');
  //
  ArqINI.Free;

end;

function TDSModuleDb.MovimentarCaixa(qCaixa, qUsuario,
  qIdPedido: integer;qTipoMovimentacao,qObservacao,qDescricao:string;qValorMovimentado:Double): boolean;
var
  vMinhaQuery,vQueryMovimentacao : TSQLQuery;
  qIdCaixaAberturaFechamento : integer;
  Transacao : TTransactionDesc;
  qString,qString2 : string;
  vValorMovimentado : Double;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;

  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT FIRST 1 ID_CAIXA_ABERTURA_FECHAMENTO FROM CAIXAS_ABERTURAS_FECHAMENTOS '+
                   'WHERE ID_CAIXA =:ID_CAIXA AND DATA_ABERTURA =:DATA_ABERTURA '+
                   'ORDER BY HORA_FECHAMENTO DESC';
    ParamByName('ID_CAIXA').Value := RetornaIdentificadorDoCaixa(qCaixa);
    ParamByName('DATA_ABERTURA').Value := StrToDate(FormatDateTime('dd/mm/yyyy',Date));
    Open;
  end;
  qIdCaixaAberturaFechamento := vMinhaQuery.FieldByName('ID_CAIXA_ABERTURA_FECHAMENTO').AsInteger;

  qString := '';
  qString := 'INSERT INTO MOVIMENTACOES_CAIXAS (ID_MOVIMENTACAO_CAIXA, ID_USUARIO, ID_CAIXA_ABERTURA_FECHAMENTO,'+
             '                                  DEBITO_CREDITO, VALOR_MOVIMENTADO, DESCRICAO_MOVIMENTACAO, ID_PEDIDO, OBSERVACAO)'+
             'VALUES                          (:ID_MOVIMENTACAO_CAIXA,:ID_USUARIO,:ID_CAIXA_ABERTURA_FECHAMENTO,'+
             '                                 :DEBITO_CREDITO,:VALOR_MOVIMENTADO,:DESCRICAO_MOVIMENTACAO,:ID_PEDIDO,:OBSERVACAO)';;
  with vMinhaQuery do
  begin
    Close;
    CommandText := qString;
    ParamByName('ID_MOVIMENTACAO_CAIXA').Value := GeneratorIncrementado('NOVA_MOVIMENTACAO_CAIXA');
    ParamByName('ID_USUARIO').Value := qUsuario;
    ParamByName('ID_CAIXA_ABERTURA_FECHAMENTO').Value := qIdCaixaAberturaFechamento;
    ParamByName('DEBITO_CREDITO').Value := qTipoMovimentacao;
    ParamByName('VALOR_MOVIMENTADO').Value := qValorMovimentado;
    ParamByName('DESCRICAO_MOVIMENTACAO').Value := qDescricao;
    ParamByName('ID_PEDIDO').Value := qIdPedido;
    ParamByName('OBSERVACAO').Value := qObservacao;
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREADCOMMITTED;
    DSModuleDb.SQLConexao.StartTransaction(Transacao);
    try
      ExecSQL();
      DSModuleDb.SQLConexao.Commit(Transacao);
    except
      DSModuleDb.SQLConexao.Rollback(Transacao);
      Result := False;
    end;
  end;
  FreeAndNil(vMinhaQuery);
end;



function TDSModuleDb.RetornaAliquotaCofins: string;
begin
  LeArqIni;
  Result := sAliquotaCofins;
end;

function TDSModuleDb.RetornaAliquotaPis: string;
begin
  LeArqIni;
  Result := sAliquotaPis;
end;

function TDSModuleDb.RetornaIdentificadorDoCaixa(qCaixa: integer): integer;
var
  vMinhaQuery : TSQLQuery;
begin
  Result := 0;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT ID_CAIXA FROM CAIXAS WHERE NUMERO_CAIXA =:NUMERO_CAIXA';
    ParamByName('NUMERO_CAIXA').Value := qCaixa;
    Open;
  end;
  Result := vMinhaQuery.FieldByName('ID_CAIXA').AsInteger;
  FreeAndNil(vMinhaQuery);
end;

function TDSModuleDb.RetornaIdentificadorUsuario(qUsuario: string): integer;
var
  vMinhaQuery : TSQLQuery;
begin
  Result := 0;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT ID_USUARIO FROM USUARIOS WHERE UPPER(USUARIO) =:USUARIO';
    ParamByName('USUARIO').Value := qUsuario;
    Open;
  end;
  Result := vMinhaQuery.FieldByName('ID_USUARIO').AsInteger;
  FreeAndNil(vMinhaQuery);
end;

function TDSModuleDb.RetornaLocalEmissaoNFe: string;
begin
  LeArqIni;
  Result := sEmissaoNFeServidorOuClient;
end;

function TDSModuleDb.RetornaSituacaotributaria: string;
begin
  LeArqIni;
  Result := sSituacaoTributaria;
end;

function TDSModuleDb.RetornaUfEmitente: string;
begin
  LeArqIni;
  Result := sUF;
end;

function TDSModuleDb.VerificaCaixaEstaAberto(qCaixa: integer): boolean;
var
  vMinhaQuery : TSQLQuery;
  IdCaixa : integer;
  Transacao : TTransactionDesc;
  qString : string;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  //Primeiro preciso verificar se o caixa está cadastrado
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT ID_CAIXA FROM CAIXAS WHERE NUMERO_CAIXA =:CAIXA';
    ParamByName('CAIXA').Value := qCaixa;
    Open;
  end;
  if vMinhaQuery.FieldByName('ID_CAIXA').AsInteger = 0 then
    Result := False
  else
  begin
    IdCaixa := vMinhaQuery.FieldByName('ID_CAIXA').AsInteger;
    //Agora, irei verificar se o caixa já está aberto
    with vMinhaQuery do
    begin
      Close;
      CommandText := 'SELECT FIRST 1 * FROM CAIXAS_ABERTURAS_FECHAMENTOS '+
                     'WHERE ID_CAIXA =:ID_CAIXA AND DATA_ABERTURA =:DATA_ABERTURA '+
                     'AND DATA_FECHAMENTO IS NULL '+
                     'ORDER BY HORA_ABERTURA DESC';
      ParamByName('ID_CAIXA').Value := IdCaixa;
      ParamByName('DATA_ABERTURA').Value := StrToDate(FormatDateTime('dd/mm/yyyy',Date));
      Open;
    end;
    if vMinhaQuery.FieldByName('ID_CAIXA').IsNull then
    begin
      Result := False;
    end;
  end;
end;

function TDSModuleDb.VerificaPermissao(qUsuario, qPermissao: string): boolean;
var
  vMinhaQuery : TSQLQuery;
  vIdUsuario,vIdPermissao : integer;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT PVS.PERMITE_OU_NAO FROM PERMISSOES_VS_USUARIOS PVS '+
                   'LEFT OUTER JOIN USUARIOS USU ON USU.ID_USUARIO = PVS.ID_USUARIO '+
                   'LEFT OUTER JOIN PERMISSOES_USUARIOS_SISTEMA PUS ON PUS.ID_PERMISSAO_USUARIO_SISTEMA = PVS.ID_PERMISSAO_USUARIO_SISTEMA '+
                   'WHERE UPPER(USU.USUARIO) =:USUARIO '+
                   'AND UPPER(PUS.PERMISSAO) =:PERMISSAO';
    ParamByName('USUARIO').Value := qUsuario;
    ParamByName('PERMISSAO').Value := qPermissao;
    Open;
  end;
  if vMinhaQuery.FieldByName('PERMITE_OU_NAO').AsString = 'N' then
    Result := False;
  FreeAndNil(vMinhaQuery);
end;

function TDSModuleDb.VerificaSeSenhaEstaCorreta(qSenha: string): boolean;
var
  vMinhaQuery : TSQLQuery;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT SENHA FROM USUARIOS WHERE UPPER(SENHA) =:SENHA';
    ParamByName('SENHA').Value := qSenha;
    Open;
  end;
  if vMinhaQuery.FieldByName('SENHA').AsString = '' then
    Result := False;
  FreeAndNil(vMinhaQuery);
  cdsUsuarios.Close;
  cdsUsuarios.Open;
end;

function TDSModuleDb.VerificaSeUsuarioEstaCadastrado(qUsuario: string): boolean;
var
  vMinhaQuery : TSQLQuery;
begin
  Result := true;
  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  with vMinhaQuery do
  begin
    Close;
    CommandText := 'SELECT COALESCE(USUARIO,'+QuotedStr('')+') AS USUARIO FROM USUARIOS WHERE UPPER(USUARIO) =:USUARIO';
    ParamByName('USUARIO').Value := qUsuario;
    Open;
  end;
  if Trim(vMinhaQuery.FieldByName('USUARIO').AsString) = '' then
    Result := False;
  FreeAndNil(vMinhaQuery);
  cdsUsuarios.Close;
  cdsUsuarios.Open;
end;


end.

