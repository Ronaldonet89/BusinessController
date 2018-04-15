unit UDataModul;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,messages,dialogs,
  Data.DBXCommon, Data.DB, Datasnap.DBClient, Datasnap.DSConnect, Data.SqlExpr,midaslib,
  Data.DBXFirebird, Data.FMTBcd, Datasnap.Provider,UITypes, Grids, StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TDM = class(TDataModule)
    SQLConexao: TSQLConnection;
    dsProdutos: TDataSource;
    DSProviderClient: TDSProviderConnection;
    dsGruposProdutos: TDataSource;
    cdsGruposProdutos: TClientDataSet;
    cdsGruposProdutosID_GRUPO_PRODUTO: TIntegerField;
    cdsGruposProdutosGRUPO_PRODUTO_DESCRICAO: TStringField;
    cdsProdutos: TClientDataSet;
    cdsPedidos: TClientDataSet;
    DSPedidos: TDataSource;
    dsPedidos_Itens: TDataSource;
    cdsPedidos_Itens: TClientDataSet;
    dsNotasFiscais: TDataSource;
    cdsMovimentacoes: TClientDataSet;
    dsMovimentacoes: TDataSource;
    cdsFornecedores: TClientDataSet;
    dsFornecedores: TDataSource;
    cdsNotasFiscaisItens: TClientDataSet;
    dsNotasFiscaisItens: TDataSource;
    cdsPedidosDeCompraItens: TClientDataSet;
    dsPedidosDeCompraItens: TDataSource;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    cdsNotasFiscais: TClientDataSet;
    cdsPagar: TClientDataSet;
    dsPagar: TDataSource;
    cdsTransportadores: TClientDataSet;
    dsTransportadores: TDataSource;
    cdsCheques: TClientDataSet;
    cdsChequesID_CHEQUE: TIntegerField;
    cdsChequesID_CLIENTE: TIntegerField;
    cdsChequesNOME_CLIENTE: TStringField;
    cdsChequesID_PEDIDO: TIntegerField;
    cdsChequesORIGEM_CHEQUE: TStringField;
    cdsChequesVALOR: TFMTBCDField;
    cdsChequesSTATUS: TStringField;
    cdsChequesDATA_EMISSAO: TDateField;
    cdsChequesBANCO: TStringField;
    cdsChequesAGENCIA: TStringField;
    cdsChequesDIGTO_AGENCIA: TStringField;
    cdsChequesCONTA: TStringField;
    cdsChequesDIGITO_CONTA: TStringField;
    cdsChequesEMITIDO_RECEBIDO: TStringField;
    cdsChequesNUMERO_CHEQUE: TStringField;
    cdsReceber: TClientDataSet;
    dsCheques: TDataSource;
    dsReceber: TDataSource;
    cdsGenerico: TClientDataSet;
    dsGenerico: TDataSource;
    cdsDuplicatasNotasFiscais: TClientDataSet;
    dsDuplicatasNotasFiscais: TDataSource;
    cdsPedidosDeCompra: TClientDataSet;
    dsPedidosDeCompra: TDataSource;
    cdsMovimentacoesID_MOVIMENTACAO: TIntegerField;
    cdsMovimentacoesID_PEDIDO: TIntegerField;
    cdsMovimentacoesID_PRODUTO: TIntegerField;
    cdsMovimentacoesDATA: TDateField;
    cdsMovimentacoesHORA: TTimeField;
    cdsMovimentacoesQTDE_ANTERIOR: TFMTBCDField;
    cdsMovimentacoesQTDE_MOVIMENTADA: TFMTBCDField;
    cdsMovimentacoesQTDE_APOS_MOVIMENTACAO: TFMTBCDField;
    cdsMovimentacoesTIPO_MOVIMENTACAO: TStringField;
    cdsFornecedoresID_FORNECEDOR: TIntegerField;
    cdsFornecedoresRAZAO_SOCIAL: TStringField;
    cdsFornecedoresCPF: TStringField;
    cdsFornecedoresCNPJ: TStringField;
    cdsFornecedoresRG: TStringField;
    cdsFornecedoresINSCRICAO_ESTADUAL: TStringField;
    cdsFornecedoresCONTATO: TStringField;
    cdsFornecedoresEMAIL: TStringField;
    cdsFornecedoresTELEFONE: TStringField;
    cdsFornecedoresCELULAR: TStringField;
    cdsFornecedoresENDERECO: TStringField;
    cdsFornecedoresNUMERO: TStringField;
    cdsFornecedoresCOMPLEMENTO: TStringField;
    cdsFornecedoresBAIRRO: TStringField;
    cdsFornecedoresCEP: TStringField;
    cdsFornecedoresCIDADE: TStringField;
    cdsFornecedoresESTADO: TStringField;
    cdsFornecedoresOBSERVACAO: TMemoField;
    cdsFornecedoresTIPO_FORNECEDOR: TStringField;
    cdsClientesID_CLIENTE: TIntegerField;
    cdsClientesRAZAO_SOCIAL: TStringField;
    cdsClientesFANTASIA: TStringField;
    cdsClientesCPF: TStringField;
    cdsClientesCNPJ: TStringField;
    cdsClientesINSCRICAO_ESTADUAL: TStringField;
    cdsClientesENDERECO: TStringField;
    cdsClientesNUMERO: TStringField;
    cdsClientesCEP: TStringField;
    cdsClientesBAIRRO: TStringField;
    cdsClientesTELEFONE: TStringField;
    cdsClientesCELULAR: TStringField;
    cdsClientesEMAIL: TStringField;
    cdsClientesEMAIL_DANFE: TStringField;
    cdsPedidos_ItensID_PEDIDO_ITEM: TIntegerField;
    cdsPedidos_ItensID_PEDIDO: TIntegerField;
    cdsPedidos_ItensID_PRODUTO: TIntegerField;
    cdsPedidos_ItensDESCRICAO_PRODUTO: TStringField;
    cdsPedidos_ItensQUANTIDADE: TFMTBCDField;
    cdsPedidos_ItensVALOR_UNITARIO: TFMTBCDField;
    cdsPedidos_ItensVALOR_TOTAL: TFMTBCDField;
    cdsPedidos_ItensALIQUOTA_ICMS: TIntegerField;
    cdsProdutosMateriasPrimas: TClientDataSet;
    dsProdutosMateriasPrimas: TDataSource;
    cdsProdutosMateriasPrimasID_PRODUTO_MATERIA_PRIMA: TIntegerField;
    cdsProdutosMateriasPrimasID_MATERIA_PRIMA: TIntegerField;
    cdsProdutosMateriasPrimasID_PRODUTO: TIntegerField;
    cdsProdutosMateriasPrimasQUANTIDADE: TFMTBCDField;
    cdsProdutosMateriasPrimasDESCRICAO_MATERIA_PRIMA: TStringField;
    cdsNotasFiscaisID_NOTA_FISCAL: TIntegerField;
    cdsNotasFiscaisID_TRANSPORTADOR: TIntegerField;
    cdsNotasFiscaisID_PEDIDO: TIntegerField;
    cdsNotasFiscaisID_CLIENTE: TIntegerField;
    cdsNotasFiscaisID_NATUREZA_OPERACAO: TIntegerField;
    cdsNotasFiscaisDATA_EMISSAO: TDateField;
    cdsNotasFiscaisDATA_SAIDA_ENTRADA: TDateField;
    cdsNotasFiscaisHORA_SAIDA_ENTRADA: TTimeField;
    cdsNotasFiscaisENTRADA_SAIDA: TStringField;
    cdsNotasFiscaisTIPO_EMISSAO: TStringField;
    cdsNotasFiscaisINFORMACAO_NFE: TStringField;
    cdsNotasFiscaisBASE_CALCULO_ICMS: TFMTBCDField;
    cdsNotasFiscaisVALOR_ICMS: TFMTBCDField;
    cdsNotasFiscaisBASE_ST: TFMTBCDField;
    cdsNotasFiscaisVALOR_ST: TFMTBCDField;
    cdsNotasFiscaisVALOR_PRODUTOS: TFMTBCDField;
    cdsNotasFiscaisVALOR_FRETE: TFMTBCDField;
    cdsNotasFiscaisVALOR_SEGURO: TFMTBCDField;
    cdsNotasFiscaisVALOR_DESCONTO: TFMTBCDField;
    cdsNotasFiscaisVALOR_IMPOSTO_IMPORTACAO: TFMTBCDField;
    cdsNotasFiscaisVALOR_IPI: TFMTBCDField;
    cdsNotasFiscaisVALOR_PIS: TFMTBCDField;
    cdsNotasFiscaisVALOR_COFINS: TFMTBCDField;
    cdsNotasFiscaisVALOR_OUTROS: TFMTBCDField;
    cdsNotasFiscaisVALOR_TOTAL_NOTA: TFMTBCDField;
    cdsNotasFiscaisCHAVE: TStringField;
    cdsNotasFiscaisESPECIE: TStringField;
    cdsNotasFiscaisMARCA: TStringField;
    cdsNotasFiscaisNUMERO_VOLUME: TStringField;
    cdsNotasFiscaisPESO_LIQUIDO: TFMTBCDField;
    cdsNotasFiscaisPESO_BRUTO: TFMTBCDField;
    cdsPedidosDeCompraID_PEDIDO_DE_COMPRA: TIntegerField;
    cdsPedidosDeCompraID_FORNECEDOR: TIntegerField;
    cdsPedidosDeCompraID_USUARIO: TIntegerField;
    cdsPedidosDeCompraDATA_PEDIDO: TDateField;
    cdsPedidosDeCompraHORA_PEDIDO: TDateField;
    cdsPedidosDeCompraDATA_VENCIMENTO: TDateField;
    cdsPedidosDeCompraDATA_PAGAMENTO: TDateField;
    cdsPedidosDeCompraFORMA_PAGAMENTO: TStringField;
    cdsPedidosDeCompraCONDICAO_PAGAMENTO: TStringField;
    cdsPedidosDeCompraDATA_ENTREGA: TDateField;
    cdsPedidosDeCompraFORMA_ENTREGA: TStringField;
    cdsPedidosDeCompraVALOR_FRETE: TFMTBCDField;
    cdsPedidosDeCompraVALOR_ICMS: TFMTBCDField;
    cdsPedidosDeCompraVALOR_IPI: TFMTBCDField;
    cdsPedidosDeCompraDATA_NF: TDateField;
    cdsPedidosDeCompraNUMERO_NF: TIntegerField;
    cdsPedidosDeCompraNUMERO_PARCELAS: TIntegerField;
    cdsPedidosDeCompraOBSERVACAO: TMemoField;
    cdsPedidosDeCompraPERCENTUAL_ICMS: TFMTBCDField;
    cdsPedidosDeCompraPERCENTUAL_IPI: TFMTBCDField;
    cdsPedidosDeCompraVALOR_TOTAL: TFMTBCDField;
    cdsPedidosDeCompraSTATUS: TStringField;
    cdsPedidosDeCompraItensID_PEDIDO_DE_COMPRA_ITEM: TIntegerField;
    cdsPedidosDeCompraItensID_PEDIDO_DE_COMPRA: TIntegerField;
    cdsPedidosDeCompraItensID_PRODUTO: TIntegerField;
    cdsPedidosDeCompraItensDESCRICAO_PRODUTO: TStringField;
    cdsPedidosDeCompraItensQUANTIDADE: TFMTBCDField;
    cdsPedidosDeCompraItensVALOR_UNITARIO: TFMTBCDField;
    cdsPedidosDeCompraItensVALOR_TOTAL: TFMTBCDField;
    cdsPedidosDeCompraItensALIQUOTA_ICMS: TIntegerField;
    cdsNotasFiscaisNUMERO_NOTA_FISCAL: TIntegerField;
    cdsNotasFiscaisNUMERO_PROTOCOLO_RECEBIMENTO: TStringField;
    cdsNotasFiscaisMOTIVO_RECEBIMENTO: TStringField;
    cdsNotasFiscaisRESPONSAVEL_FRETE: TStringField;
    cdsNotasFiscaisDATA_HORA_RECEBIMENTO: TStringField;
    cdsNotasFiscaisNOME_CLIENTE: TStringField;
    cdsNotasFiscaisFORMA_PAGAMENTO: TStringField;
    cdsNotasFiscaisCONDICAO_PAGAMENTO: TStringField;
    cdsNotasFiscaisNUMERO_PARCELAS: TIntegerField;
    cdsNotasFiscaisNATUREZA_DE_OPERACAO: TStringField;
    cdsTransportadoresID_TRANSPORTADOR: TIntegerField;
    cdsTransportadoresCNPJ: TStringField;
    cdsTransportadoresINSCRICAO_ESTADUAL: TStringField;
    cdsTransportadoresRAZAO_SOCIAL: TStringField;
    cdsTransportadoresENDERECO: TStringField;
    cdsTransportadoresNUMERO: TStringField;
    cdsTransportadoresBAIRRO: TStringField;
    cdsTransportadoresCIDADE: TStringField;
    cdsTransportadoresTELEFONE: TStringField;
    cdsTransportadoresUF: TStringField;
    cdsTransportadoresCEP: TStringField;
    cdsTransportadoresEMAIL: TStringField;
    cdsDuplicatasNotasFiscaisID_DUPLICATA_NOTA_FISCAL: TIntegerField;
    cdsDuplicatasNotasFiscaisNUMERO_FATURA: TIntegerField;
    cdsDuplicatasNotasFiscaisVENCIMENTO: TDateField;
    cdsDuplicatasNotasFiscaisVALOR: TFMTBCDField;
    cdsDuplicatasNotasFiscaisID_NOTA_FISCAL: TIntegerField;
    cdsTiposDeOperacao: TClientDataSet;
    dsTiposDeOperacao: TDataSource;
    cdsTiposDeOperacaoID_TIPO_OPERACAO: TIntegerField;
    cdsTiposDeOperacaoCFOP_DENTRO_ESTADO: TStringField;
    cdsTiposDeOperacaoCFOP_FORA_ESTADO: TStringField;
    cdsTiposDeOperacaoCFOP_DENTRO_ESTADO_COM_ST: TStringField;
    cdsTiposDeOperacaoCFOP_FORA_ESTADO_COM_ST: TStringField;
    cdsTiposDeOperacaoCST_ICMS_NORMAL: TStringField;
    cdsTiposDeOperacaoCST_ICMS_COM_ST: TStringField;
    cdsTiposDeOperacaoCST_ICMS_COM_REDUCAO: TStringField;
    cdsTiposDeOperacaoCST_ICMS_COM_ST_E_REDUCAO: TStringField;
    cdsTiposDeOperacaoCST_IPI: TStringField;
    cdsTiposDeOperacaoCST_PIS: TStringField;
    cdsTiposDeOperacaoCST_COFINS: TStringField;
    cdsTiposDeOperacaoDESCRICAO_TIPO_OPERACAO: TStringField;
    cdsConveniosNCM: TClientDataSet;
    dsConveniosNCM: TDataSource;
    cdsConveniosNCMID_CONVENIO_NCM: TIntegerField;
    cdsConveniosNCMCODIGO_NCM: TStringField;
    cdsConveniosNCMUF_DESTINO: TStringField;
    cdsConveniosNCMPERCENTUAL_IVA: TFMTBCDField;
    cdsConveniosNCMALIQUOTA_ICMS: TFMTBCDField;
    cdsConveniosNCMPERCENTUAL_REDUCAO: TFMTBCDField;
    cdsClientesSITUACAO_APURACAO: TStringField;
    cdsClientesCONSUMIDOR_FINAL: TStringField;
    cdsClientesPOSSUI_SUFRAMA: TStringField;
    cdsClientesCODIGO_SUFRAMA: TStringField;
    cdsNotasFiscaisNFE_CALCULADA: TStringField;
    cdsNotasFiscaisItensID_NOTA_FISCAL_ITEM: TIntegerField;
    cdsNotasFiscaisItensID_PRODUTO: TIntegerField;
    cdsNotasFiscaisItensID_NOTA_FISCAL: TIntegerField;
    cdsNotasFiscaisItensQUANTIDADE: TFMTBCDField;
    cdsNotasFiscaisItensCFOP: TStringField;
    cdsNotasFiscaisItensCST_ICMS: TStringField;
    cdsNotasFiscaisItensPERCENTUAL_ICMS: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_ICMS: TFMTBCDField;
    cdsNotasFiscaisItensCST_IPI: TStringField;
    cdsNotasFiscaisItensPERCENTUAL_IPI: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_IPI: TFMTBCDField;
    cdsNotasFiscaisItensCST_PIS: TStringField;
    cdsNotasFiscaisItensPERCENTUAL_PIS: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_PIS: TFMTBCDField;
    cdsNotasFiscaisItensCST_COFINS: TStringField;
    cdsNotasFiscaisItensPERCENTUAL_COFINS: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_COFINS: TFMTBCDField;
    cdsNotasFiscaisItensDESCRICAO_PRODUTO: TStringField;
    cdsNotasFiscaisItensCODIGO_PRODUTO: TStringField;
    cdsNotasFiscaisItensNCM_PRODUTO: TStringField;
    cdsNotasFiscaisItensUNIDADE: TStringField;
    cdsNotasFiscaisItensVALOR_UNITARIO: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_TOTAL: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_FRETE: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_SEGURO: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_DESCONTO: TFMTBCDField;
    cdsNotasFiscaisItensINFORMACOES_ADICIONAIS: TStringField;
    cdsClientesUF: TStringField;
    cdsConveniosNCMALIQUOTA_IPI: TFMTBCDField;
    cdsClientesID_TRANSPORTADOR: TIntegerField;
    cdsNotasFiscaisItensBASE_CALCULO_ICMS: TFMTBCDField;
    cdsNotasFiscaisItensCST_ICMS_ST: TStringField;
    cdsNotasFiscaisItensPERCENTUAL_ICMS_ST: TFMTBCDField;
    cdsNotasFiscaisItensVALOR_ICMS_ST: TFMTBCDField;
    cdsNotasFiscaisItensBASE_CALCULO_ICMS_ST: TFMTBCDField;
    cdsNotasFiscaisItensBASE_CALCULO_IPI: TFMTBCDField;
    cdsNotasFiscaisItensBASE_CALCULO_COFINS: TFMTBCDField;
    cdsNotasFiscaisItensEAN13: TStringField;
    cdsFornecedoresFANTASIA: TStringField;
    cdsFornecedoresUF: TStringField;
    cdsTransportadoresFANTASIA: TStringField;
    cdsClientesCIDADE: TStringField;
    cdsFormasDePagamento: TClientDataSet;
    dsFormasDePagamento: TDataSource;
    cdsCondicoesDePagamento: TClientDataSet;
    dsCondicoesDePagamento: TDataSource;
    cdsCondicoesDePagamentoID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    cdsCondicoesDePagamentoCONDICAO_DE_PAGAMENTO: TStringField;
    cdsFormasDeEntrega: TClientDataSet;
    dsFormasDeEntrega: TDataSource;
    cdsFormasDeEntregaID_FORMA_DE_ENTREGA: TIntegerField;
    cdsFormasDeEntregaFORMA_DE_ENTREGA: TStringField;
    cdsReceberID_RECEBER: TIntegerField;
    cdsReceberDESCRICAO_TITULO: TStringField;
    cdsReceberID_PEDIDO: TIntegerField;
    cdsReceberID_CLIENTE: TIntegerField;
    cdsReceberNOME_CLIENTE: TStringField;
    cdsReceberVENCIMENTO: TDateField;
    cdsReceberDATA_PAGAMENTO: TDateField;
    cdsReceberVALOR_TITULO: TFMTBCDField;
    cdsReceberVALOR_PAGO: TFMTBCDField;
    cdsReceberNUMERO_CHEQUE: TStringField;
    cdsReceberFORMA_PAGAMENTO: TStringField;
    cdsReceberSTATUS: TStringField;
    cdsPagarID_PAGAR: TIntegerField;
    cdsPagarDESCRICAO_TITULO: TStringField;
    cdsPagarID_PEDIDO: TIntegerField;
    cdsPagarID_FORNECEDOR: TIntegerField;
    cdsPagarNOME_FORNECEDOR: TStringField;
    cdsPagarVENCIMENTO: TDateField;
    cdsPagarDATA_PAGAMENTO: TDateField;
    cdsPagarVALOR_TITULO: TFMTBCDField;
    cdsPagarVALOR_PAGO: TFMTBCDField;
    cdsPagarNUMERO_CHEQUE: TStringField;
    cdsPagarFORMA_PAGAMENTO: TStringField;
    cdsPagarSTATUS: TStringField;
    cdsPedidosDeCompraNOME_FORNECEDOR: TStringField;
    cdsVendedores: TClientDataSet;
    dsVendedores: TDataSource;
    cdsVendedoresID_VENDEDOR: TIntegerField;
    cdsVendedoresPERCENTUAL_COMISSAO: TFMTBCDField;
    cdsPedidos_Formas_Condicoes: TClientDataSet;
    dsPedidos_Formas_Condicoes: TDataSource;
    cdsPedidos_Formas_CondicoesID_PEDIDO_FORMA_CONDICAO: TIntegerField;
    cdsPedidos_Formas_CondicoesID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    cdsPedidos_Formas_CondicoesID_FORMA_DE_PAGAMENTO: TIntegerField;
    cdsPedidos_Formas_CondicoesVALOR: TFMTBCDField;
    cdsPedidos_Formas_CondicoesDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    cdsPedidos_Formas_CondicoesCONDICAO_DE_PAGAMENTO: TStringField;
    cdsCondicoesDePagamentoNUMERO_DE_PARCELAS: TIntegerField;
    cdsVendedoresNOME_VENDEDOR: TStringField;
    cdsFormasVSCondicoes: TClientDataSet;
    dsFormasVSCondicoes: TDataSource;
    cdsFormasVSCondicoesID_FORMA_VS_CONDICAO: TIntegerField;
    cdsFormasVSCondicoesID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    cdsFormasVSCondicoesCONDICAO_DE_PAGAMENTO: TStringField;
    cdsFormasVSCondicoesID_FORMA_DE_PAGAMENTO: TIntegerField;
    cdsFormasVSCondicoesDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    cdsPedidos_Formas_CondicoesID_PEDIDO: TIntegerField;
    cdsGraficoCaixa: TClientDataSet;
    cdsGraficoCaixaID_PEDIDO: TIntegerField;
    cdsGraficoCaixaDATA_PEDIDO: TDateField;
    cdsGraficoCaixaDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    cdsGraficoCaixaCONDICAO_DE_PAGAMENTO: TStringField;
    cdsGraficoCaixaVALOR: TFMTBCDField;
    dsgraficoCaixa: TDataSource;
    cdsCaixasAberturasFechamentos: TClientDataSet;
    cdsCaixasAberturasFechamentosUSUARIO_ABERTURA_FECHAMENTO: TStringField;
    cdsCaixasAberturasFechamentosNUMERO_CAIXA: TIntegerField;
    cdsCaixasAberturasFechamentosID_CAIXA_ABERTURA_FECHAMENTO: TIntegerField;
    cdsCaixasAberturasFechamentosDATA_ABERTURA: TDateField;
    cdsCaixasAberturasFechamentosHORA_ABERTURA: TStringField;
    cdsCaixasAberturasFechamentosSALDO_ABERTURA: TFMTBCDField;
    cdsCaixasAberturasFechamentosDATA_FECHAMENTO: TDateField;
    cdsCaixasAberturasFechamentosHORA_FECHAMENTO: TStringField;
    cdsCaixasAberturasFechamentosSALDO_FECHAMENTO: TFMTBCDField;
    dsCaixasAberturasFechamentos: TDataSource;
    cdsMovimentacoesCaixas: TClientDataSet;
    cdsMovimentacoesCaixasUSUARIO_MOVIMENTACAO: TStringField;
    cdsMovimentacoesCaixasID_CAIXA_ABERTURA_FECHAMENTO: TIntegerField;
    cdsMovimentacoesCaixasVALOR_MOVIMENTADO: TFMTBCDField;
    cdsMovimentacoesCaixasDESCRICAO_MOVIMENTACAO: TStringField;
    cdsMovimentacoesCaixasOBSERVACAO: TStringField;
    cdsMovimentacoesCaixasID_PEDIDO: TIntegerField;
    cdsMovimentacoesCaixasDEBITO_CREDITO: TStringField;
    dsMovimentacoesCaixas: TDataSource;
    cdsComandas: TClientDataSet;
    cdsComandasID_COMANDA: TIntegerField;
    cdsComandasNUMERO_COMANDA: TStringField;
    dscomandas: TDataSource;
    cdsProdutosPRO_ID: TIntegerField;
    cdsProdutosPRO_DESCRICAO: TStringField;
    cdsProdutosPRO_EAN13: TStringField;
    cdsProdutosPRO_CODIGO: TStringField;
    cdsProdutosPRO_CAMINHO_IMAGEM: TStringField;
    cdsProdutosPRO_SALDO: TFMTBCDField;
    cdsProdutosPRECO_VENDA: TFMTBCDField;
    cdsProdutosID_GRUPO_PRODUTO: TIntegerField;
    cdsProdutosALIQUOTA_ICMS: TIntegerField;
    cdsProdutosCODIGO_NCM: TStringField;
    cdsProdutosORIGEM_MERCADORIA: TStringField;
    cdsProdutosUNIDADE: TStringField;
    cdsProdutosID_FORNECEDOR: TIntegerField;
    cdsProdutosCFOP: TStringField;
    cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO: TIntegerField;
    cdsFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    cdsFormasDePagamentoPERMITE_TROCO: TStringField;
    cdsFormasDePagamentoEFETUA_MOVIMENTACAO_CLIENTE: TStringField;
    cdsFormasDePagamentoEFETUA_REALIZACAO_DO_TITULO: TStringField;
    cdsFormasDePagamentoEFETUA_MOVIMENTACAO_CAIXA: TStringField;
    cdsFormasDePagamentoORDEM_IMPRESSORA_FISCAL: TIntegerField;
    cdsPedidosID_PEDIDO: TIntegerField;
    cdsPedidosID_CLIENTE: TIntegerField;
    cdsPedidosID_USUARIO: TIntegerField;
    cdsPedidosNOME_CLIENTE: TStringField;
    cdsPedidosDATA_PEDIDO: TDateField;
    cdsPedidosHORA_PEDIDO: TDateField;
    cdsPedidosDATA_VENCIMENTO: TDateField;
    cdsPedidosDATA_PAGAMENTO: TDateField;
    cdsPedidosFORMA_PAGAMENTO: TStringField;
    cdsPedidosCONDICAO_PAGAMENTO: TStringField;
    cdsPedidosDATA_ENTREGA: TDateField;
    cdsPedidosFORMA_ENTREGA: TStringField;
    cdsPedidosVALOR_FRETE: TFMTBCDField;
    cdsPedidosVALOR_ICMS: TFMTBCDField;
    cdsPedidosVALOR_IPI: TFMTBCDField;
    cdsPedidosDATA_NF: TDateField;
    cdsPedidosNUMERO_NF: TIntegerField;
    cdsPedidosNUMERO_PARCELAS: TIntegerField;
    cdsPedidosOBSERVACAO: TMemoField;
    cdsPedidosPERCENTUAL_ICMS: TFMTBCDField;
    cdsPedidosPERCENTUAL_IPI: TFMTBCDField;
    cdsPedidosVALOR_TOTAL: TFMTBCDField;
    cdsPedidosSTATUS: TStringField;
    cdsPedidosTIPO_OPERACAO: TStringField;
    cdsPedidosID_FORMA_DE_ENTREGA: TIntegerField;
    cdsPedidosID_FORMA_DE_PAGAMENTO: TIntegerField;
    cdsPedidosID_CONDICAO_DE_PAGAMENTO: TIntegerField;
    cdsPedidosID_VENDEDOR: TIntegerField;
    cdsPedidosID_ORCAMENTO: TIntegerField;
    cdsPedidosNOME_VENDEDOR: TStringField;
    cdsPedidosDATA_DO_PARTO: TDateField;
    cdsPedidosNUMEROCUPOMFISCAL: TStringField;
    cdsPedidosPEDIDO_JA_CAPTURADO_BALCAO: TStringField;
    cdsPedidosNOME_DO_BEBE: TStringField;
    cdsPedidosVALOR_TOTAL_PRODUTOS: TFMTBCDField;
    cdsPedidosPERCENTUAL_DESCONTO: TFMTBCDField;
    cdsPedidosVALOR_DESCONTO: TFMTBCDField;
    cdsPedidosID_USUARIO_EXCLUSAO: TIntegerField;
    cdsPedidosDATA_EXCLUSAO: TSQLTimeStampField;
    cdsPedidosSITUACAO: TIntegerField;
    cdsPedidosID_PEDIDO_PAI: TIntegerField;
    cdsPedidosNUMERO_COMANDA: TStringField;
    cdsPedidosPEDIDO_EM_VENDA: TStringField;
    cdsPedidosDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    cdsPedidosNUMERO_CUPOM: TStringField;
    cdsPedidos_ItensDESCONTO: TFMTBCDField;
    OpenDialog1: TOpenDialog;
    cdsProd: TClientDataSet;
    cdsProdCODIGO: TStringField;
    cdsProdPRODUTO: TStringField;
    cdsProdCOR: TStringField;
    cdsProdTAMANHO: TStringField;
    cdsProdQIDE: TStringField;
    cdsProdPROMO: TStringField;
    cdsProdVALOR: TStringField;
    cdsProdutosCOR: TStringField;
    cdsProdutosTAMANHO: TStringField;
    FDConnection1: TFDConnection;
    FDQConsulta: TFDQuery;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQBusca: TFDQuery;
    cdsProdutosMINIMO: TFMTBCDField;
    cdsProdutosMAXIMO: TFMTBCDField;
    cdsProdutosCUSTO: TFMTBCDField;
    cdsProdutosCOD_PROD: TIntegerField;
    cdsPedidos_ItensCODIGO: TStringField;
    FDConnection2: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDQNFE: TFDQuery;
    FDQCliente: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsProdutosAfterPost(DataSet: TDataSet);
    procedure cdsProdutosAfterInsert(DataSet: TDataSet);
    procedure cdsProdutosAfterDelete(DataSet: TDataSet);
    procedure cdsClientesAfterInsert(DataSet: TDataSet);
    procedure cdsClientesAfterDelete(DataSet: TDataSet);
    procedure cdsClientesAfterPost(DataSet: TDataSet);
    procedure cdsFornecedoresAfterDelete(DataSet: TDataSet);
    procedure cdsFornecedoresAfterPost(DataSet: TDataSet);
    procedure cdsFornecedoresAfterInsert(DataSet: TDataSet);
    procedure cdsReceberAfterDelete(DataSet: TDataSet);
    procedure cdsReceberAfterPost(DataSet: TDataSet);
    procedure cdsPagarAfterDelete(DataSet: TDataSet);
    procedure cdsPagarAfterPost(DataSet: TDataSet);
    procedure cdsPagarAfterInsert(DataSet: TDataSet);
    procedure cdsReceberAfterInsert(DataSet: TDataSet);
    procedure cdsPedidosAfterDelete(DataSet: TDataSet);
    procedure cdsPedidosAfterPost(DataSet: TDataSet);
    procedure cdsPedidosAfterInsert(DataSet: TDataSet);
    procedure cdsPedidos_ItensAfterInsert(DataSet: TDataSet);
    procedure cdsPedidos_ItensAfterPost(DataSet: TDataSet);
    procedure cdsPedidos_ItensAfterDelete(DataSet: TDataSet);
    procedure cdsProdutosMateriasPrimasAfterDelete(DataSet: TDataSet);
    procedure cdsProdutosMateriasPrimasAfterPost(DataSet: TDataSet);
    procedure cdsProdutosMateriasPrimasAfterInsert(DataSet: TDataSet);
    procedure cdsNotasFiscaisAfterDelete(DataSet: TDataSet);
    procedure cdsNotasFiscaisAfterPost(DataSet: TDataSet);
    procedure cdsNotasFiscaisAfterInsert(DataSet: TDataSet);
    procedure cdsNotasFiscaisItensAfterDelete(DataSet: TDataSet);
    procedure cdsNotasFiscaisItensAfterPost(DataSet: TDataSet);
    procedure cdsNotasFiscaisItensAfterInsert(DataSet: TDataSet);
    procedure cdsNotasFiscaisItensBeforePost(DataSet: TDataSet);
    procedure cdsTransportadoresAfterDelete(DataSet: TDataSet);
    procedure cdsTransportadoresAfterPost(DataSet: TDataSet);
    procedure cdsTransportadoresAfterInsert(DataSet: TDataSet);
    procedure cdsDuplicatasNotasFiscaisAfterDelete(DataSet: TDataSet);
    procedure cdsDuplicatasNotasFiscaisAfterPost(DataSet: TDataSet);
    procedure cdsDuplicatasNotasFiscaisAfterInsert(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsTiposDeOperacaoAfterDelete(DataSet: TDataSet);
    procedure cdsTiposDeOperacaoAfterPost(DataSet: TDataSet);
    procedure cdsConveniosNCMAfterDelete(DataSet: TDataSet);
    procedure cdsConveniosNCMAfterPost(DataSet: TDataSet);
    procedure cdsTiposDeOperacaoAfterInsert(DataSet: TDataSet);
    procedure cdsConveniosNCMAfterInsert(DataSet: TDataSet);
    procedure cdsPedidosDeCompraAfterDelete(DataSet: TDataSet);
    procedure cdsPedidosDeCompraAfterPost(DataSet: TDataSet);
    procedure cdsPedidosDeCompraAfterInsert(DataSet: TDataSet);
    procedure cdsPedidosDeCompraItensAfterDelete(DataSet: TDataSet);
    procedure cdsPedidosDeCompraItensAfterPost(DataSet: TDataSet);
    procedure cdsPedidosDeCompraItensAfterInsert(DataSet: TDataSet);
    procedure cdsFormasDePagamentoAfterDelete(DataSet: TDataSet);
    procedure cdsCondicoesDePagamentoAfterDelete(DataSet: TDataSet);
    procedure cdsFormasDeEntregaAfterDelete(DataSet: TDataSet);
    procedure cdsFormasDeEntregaAfterPost(DataSet: TDataSet);
    procedure cdsCondicoesDePagamentoAfterPost(DataSet: TDataSet);
    procedure cdsFormasDePagamentoAfterPost(DataSet: TDataSet);
    procedure cdsFormasDePagamentoAfterInsert(DataSet: TDataSet);
    procedure cdsCondicoesDePagamentoAfterInsert(DataSet: TDataSet);
    procedure cdsFormasDeEntregaAfterInsert(DataSet: TDataSet);
    procedure cdsGruposProdutosAfterDelete(DataSet: TDataSet);
    procedure cdsGruposProdutosAfterPost(DataSet: TDataSet);
    procedure cdsGruposProdutosAfterInsert(DataSet: TDataSet);
    procedure cdsVendedoresAfterPost(DataSet: TDataSet);
    procedure cdsVendedoresAfterDelete(DataSet: TDataSet);
    procedure cdsVendedoresAfterInsert(DataSet: TDataSet);
    procedure cdsPedidos_Formas_CondicoesAfterDelete(DataSet: TDataSet);
    procedure cdsPedidos_Formas_CondicoesAfterPost(DataSet: TDataSet);
    procedure cdsPedidos_Formas_CondicoesAfterInsert(DataSet: TDataSet);
    procedure cdsFormasVSCondicoesAfterDelete(DataSet: TDataSet);
    procedure cdsFormasVSCondicoesAfterPost(DataSet: TDataSet);
    procedure cdsFormasVSCondicoesAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
    stg: TStringGrid;

  public
    { Public declarations }
      vDescricaoProduto,vCodigoProduto : string;
      vIdProduto : integer;
    function SEMCHAR(Str: string): string;
  end;
var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ULogin, UntConectaServidor, GroupedItems1, UntLookUpProdutos;

{$R *.dfm}

procedure TDM.cdsClientesAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  DM.cdsClientesID_CLIENTE.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_CLIENTE');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsPagarAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPagarAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsPagarID_PAGAR.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_PAGAR');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsPagarAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidosAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidosAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsPedidosID_PEDIDO.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_PEDIDO');
  cdsPedidosSTATUS.AsString := 'Pendente';
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsPedidosAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidosDeCompraAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidosDeCompraAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_PEDIDO_DE_COMPRA');
  cdsPedidosDeCompraSTATUS.AsString := 'Pendente';
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsPedidosDeCompraAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidosDeCompraItensAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidosDeCompraItensAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsPedidosDeCompraItensID_PEDIDO_DE_COMPRA_ITEM.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_PEDIDO_DE_COMPRA_ITEM');
  cdsPedidosDeCompraItensID_PEDIDO_DE_COMPRA.AsInteger := cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger;
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsPedidosDeCompraItensAfterPost(DataSet: TDataSet);
var
   vTotal,vIpi,vICMS : Real;
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
  vTotal := 0;
  dm.cdsPedidosDeCompraItens.DisableControls;
  dm.cdsPedidosDeCompraItens.First;
  while not dm.cdsPedidosDeCompraItens.Eof do
  begin
    vTotal := vTotal  + (dm.cdsPedidosDeCompraItensQUANTIDADE.AsFloat *
                         dm.cdsPedidosDeCompraItensVALOR_UNITARIO.AsFloat);
    dm.cdsPedidosDeCompraItens.Next;
  end;
  dm.cdsPedidosDeCompraItens.First;
  dm.cdsPedidosDeCompraItens.EnableControls;
  vIpi := 0;
  vIpi := (vTotal * dm.cdsPedidosDeCompraPERCENTUAL_IPI.AsFloat)/100;
  vICMS := 0;
  vICMS := (vTotal * dm.cdsPedidosDeCompraPERCENTUAL_ICMS.AsFloat)/100;
  dm.cdsPedidosDeCompra.Edit;
  dm.cdsPedidosDeCompraVALOR_TOTAL.AsFloat := vTotal + vIpi + vICMS;
  dm.cdsPedidosDeCompraVALOR_ICMS.AsFloat := vICMS;
  dm.cdsPedidosDeCompraVALOR_IPI.AsFloat := vIpi;
  dm.cdsPedidosDeCompra.Post;
end;

procedure TDM.cdsPedidos_Formas_CondicoesAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidos_Formas_CondicoesAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsPedidos_Formas_CondicoesID_PEDIDO_FORMA_CONDICAO.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_PEDIDO_FORMA_CONDICAO');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsPedidos_Formas_CondicoesAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidos_ItensAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (DataSet as TClientDataSet).Refresh;
end;

procedure TDM.cdsPedidos_ItensAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsPedidos_ItensID_PEDIDO_ITEM.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_PEDIDO_ITEM');
  cdsPedidos_ItensID_PEDIDO.AsInteger := cdsPedidosID_PEDIDO.AsInteger;
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsPedidos_ItensAfterPost(DataSet: TDataSet);
var
  vTotal,vIpi,vICMS : Real;
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (DataSet as TClientDataSet).Refresh;

end;

procedure TDM.cdsProdutosAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsClientesAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (DataSet as TClientDataSet).Refresh;
end;

procedure TDM.cdsClientesAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (dataSet as TClientDataSet).Refresh;
end;

procedure TDM.cdsCondicoesDePagamentoAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsCondicoesDePagamentoAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsCondicoesDePagamentoID_CONDICAO_DE_PAGAMENTO.AsInteger := vConectaServidor.GeneratorIncrementado('NOVA_CONDICAO_PAGAMENTO');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsCondicoesDePagamentoAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsConveniosNCMAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsConveniosNCMAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsConveniosNCMID_CONVENIO_NCM.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_CONVENIO_NCM');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsConveniosNCMAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsDuplicatasNotasFiscaisAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsDuplicatasNotasFiscaisAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsDuplicatasNotasFiscaisID_DUPLICATA_NOTA_FISCAL.AsInteger := vConectaServidor.GeneratorIncrementado('NOVA_DUPLICATA_NOTA_FISCAL');
  cdsDuplicatasNotasFiscaisID_NOTA_FISCAL.AsInteger := cdsNotasFiscaisID_NOTA_FISCAL.AsInteger;
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsDuplicatasNotasFiscaisAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsFormasDeEntregaAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsFormasDeEntregaAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsFormasDeEntregaID_FORMA_DE_ENTREGA.AsInteger := vConectaServidor.GeneratorIncrementado('NOVA_FORMA_ENTREGA');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsFormasDeEntregaAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsFormasDePagamentoAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsFormasDePagamentoAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger := vConectaServidor.GeneratorIncrementado('NOVA_FORMA_PAGAMENTO');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsFormasDePagamentoAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsFormasVSCondicoesAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsFormasVSCondicoesAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsFormasVSCondicoesID_FORMA_VS_CONDICAO.AsInteger := vConectaServidor.GeneratorIncrementado('NOVA_FORMA_VS_CONDICAO');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsFormasVSCondicoesAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsFornecedoresAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsFornecedoresAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsFornecedoresID_FORNECEDOR.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_FORNECEDOR');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsFornecedoresAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsGruposProdutosAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsGruposProdutosAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsGruposProdutosID_GRUPO_PRODUTO.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_GRUPO_PRODUTO');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsGruposProdutosAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsNotasFiscaisAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsNotasFiscaisAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsNotasFiscaisId_Nota_Fiscal.AsInteger := vConectaServidor.GeneratorIncrementado('NOVA_NOTA_FISCAL');
  cdsNotasFiscaisDATA_EMISSAO.Value := Date;
  cdsNotasFiscaisHORA_SAIDA_ENTRADA.Value := Now;
  cdsNotasFiscaisNFE_CALCULADA.AsString := 'N';
  FreeAndNil(vConectaServidor);
  cdsNotasFiscaisItens.Close;
end;

procedure TDM.cdsNotasFiscaisAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
  cdsNotasFiscaisItens.Filtered := false;
  cdsNotasFiscaisItens.Filter := '';
  cdsNotasFiscaisItens.Filter := ' ID_NOTA_FISCAL = '+IntToStr(cdsNotasFiscaisID_NOTA_FISCAL.AsInteger);
  cdsNotasFiscaisItens.Filtered := true;
  cdsNotasFiscaisItens.Active := true;
end;

procedure TDM.cdsNotasFiscaisItensAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsNotasFiscaisItensAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsNotasFiscaisItensID_NOTA_FISCAL_ITEM.AsInteger := vConectaServidor.GeneratorIncrementado('NOVA_NOTA_FISCAL_ITEM');
  cdsNotasFiscaisItensID_NOTA_FISCAL.AsInteger := cdsNotasFiscaisID_NOTA_FISCAL.AsInteger;
  cdsNotasFiscaisItensID_PRODUTO.AsInteger := cdsProdutosPRO_ID.AsInteger;
  cdsNotasFiscaisItensDESCRICAO_PRODUTO.AsString := cdsProdutosPRO_DESCRICAO.AsString;
  cdsNotasFiscaisItensCODIGO_PRODUTO.AsString := cdsProdutosPRO_CODIGO.AsString;
  cdsNotasFiscaisItensVALOR_UNITARIO.AsFloat := cdsProdutosPRECO_VENDA.AsFloat;
  cdsNotasFiscaisItensNCM_PRODUTO.AsString := cdsProdutosCODIGO_NCM.AsString;
  cdsNotasFiscaisItensEAN13.AsString := cdsProdutosPRO_EAN13.AsString;
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsNotasFiscaisItensAfterPost(DataSet: TDataSet);
var
  vTotalProdutos : Real;
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
  cdsNotasFiscaisItens.DisableControls;
  cdsNotasFiscaisItens.First;
  vTotalProdutos := 0;
  while not cdsNotasFiscaisItens.Eof do
  begin
    vTotalProdutos := vTotalProdutos + cdsNotasFiscaisItensVALOR_TOTAL.AsFloat;
    cdsNotasFiscaisItens.Next;
  end;
  cdsNotasFiscais.DisableControls;
  cdsNotasFiscais.Edit;
  cdsNotasFiscaisVALOR_PRODUTOS.AsFloat := vTotalProdutos;
  cdsNotasFiscaisVALOR_TOTAL_NOTA.AsFloat := vTotalProdutos + cdsNotasFiscaisVALOR_ICMS.AsFloat + cdsNotasFiscaisVALOR_ST.AsFloat +
                                             cdsNotasFiscaisVALOR_FRETE.AsFloat + cdsNotasFiscaisVALOR_SEGURO.AsFloat +
                                             cdsNotasFiscaisVALOR_DESCONTO.AsFloat + cdsNotasFiscaisVALOR_IMPOSTO_IMPORTACAO.AsFloat +
                                             cdsNotasFiscaisVALOR_IPI.AsFloat + cdsNotasFiscaisVALOR_PIS.AsFloat +
                                             cdsNotasFiscaisVALOR_COFINS.AsFloat + cdsNotasFiscaisVALOR_OUTROS.AsFloat;
  cdsNotasFiscais.Post;
  cdsNotasFiscais.EnableControls;
  cdsNotasFiscaisItens.First;
  cdsNotasFiscaisItens.EnableControls;
end;

procedure TDM.cdsNotasFiscaisItensBeforePost(DataSet: TDataSet);
begin
  cdsNotasFiscaisItensVALOR_TOTAL.AsFloat := cdsNotasFiscaisItensQUANTIDADE.AsFloat *
                                                cdsNotasFiscaisItensVALOR_UNITARIO.AsFloat;
end;

procedure TDM.cdsProdutosAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsProdutosPRO_ID.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_PRODUTO');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsProdutosAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;

end;

procedure TDM.cdsProdutosMateriasPrimasAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsProdutosMateriasPrimasAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsProdutosMateriasPrimasID_PRODUTO_MATERIA_PRIMA.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_PRODUTO_MATERIA_PRIMA');
  cdsProdutosMateriasPrimasID_PRODUTO.AsInteger := cdsProdutosPRO_ID.AsInteger;
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsProdutosMateriasPrimasAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsReceberAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsReceberAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsReceberID_RECEBER.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_RECEBER');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsReceberAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsTiposDeOperacaoAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsTiposDeOperacaoAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsTiposDeOperacaoID_TIPO_OPERACAO.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_TIPO_DE_OPERACAO');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsTiposDeOperacaoAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsTransportadoresAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsTransportadoresAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsTransportadoresID_TRANSPORTADOR.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_TRANSPORTADOR');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsTransportadoresAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsVendedoresAfterDelete(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.cdsVendedoresAfterInsert(DataSet: TDataSet);
var
  vConectaServidor : TDSModuleDbClient;
begin
  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  cdsVendedoresID_VENDEDOR.AsInteger := vConectaServidor.GeneratorIncrementado('NOVO_VENDEDOR');
  FreeAndNil(vConectaServidor);
end;

procedure TDM.cdsVendedoresAfterPost(DataSet: TDataSet);
begin
  (DataSet as TClientDataSet).ApplyUpdates(0);
  (Dataset as TClientDataSet).Refresh;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  vstring : string;
  I: Integer;

begin
  cdsGruposProdutos.Close;
  SQLConexao.Connected := False;
  SQLConexao.Params.Values['HostName'] := frmLogin.pEnderecoServidor;
  SQLConexao.Params.Values['Port'] := frmLogin.pPortaServidor;
  FDConnection2.Params.Values['Database']:= frmLogin.pconexao;
  FDConnection2.Params.Values['Password']:='masterkey';
  FDConnection2.Params.Values['User_Name']:='SYSDBA';
  FDConnection2.Params.Values['DriverID']:='FB';

  try
    SQLConexao.Connected := True;
    FDConnection2.Connected := True;
    try
      cdsProdutos.RemoteServer := DSProviderClient;
      cdsProdutos.ProviderName := 'DSPProdutos';
    except
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de Produtos.',mtError,[mbOK],0);
    end;

    try
      cdsProdutosMateriasPrimas.RemoteServer := DSProviderClient;
      cdsProdutosMateriasPrimas.ProviderName := 'DSPProdutosMateriasPrimas';
    except
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de Produtos matÈrias primas.',mtError,[mbOK],0);
    end;

    try
//      cdsGenerico.RemoteServer := DSProviderClient;
//      cdsGenerico.ProviderName := 'DSPGenerico';
    except
    end;


    try
      cdsGruposProdutos.RemoteServer := DSProviderClient;
      cdsGruposProdutos.ProviderName := 'DSPGrupoProdutos';
    except
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de grupo de produto.',mtError,[mbOK],0);
    end;

    try
//      cdsPedidos.RemoteServer := DSProviderClient;
//      cdsPedidos.ProviderName := 'DSPPedidos';
    except
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de Pedidos.',mtError,[mbOK],0);
    end;

//    try
//      cdsPedidos_Itens.RemoteServer := DSProviderClient;
//      cdsPedidos_Itens.ProviderName := 'DSPPedidos_Itens';
//    except
//      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
//                 'com a tabela de Itens do pedido.',mtError,[mbOK],0);
//    end;

//    try
//      cdsPedidos_PedidosItens.RemoteServer := DSProviderClient;
//      cdsPedidos_PedidosItens.ProviderName := 'DSPPedidos_PedidosItens';
//    except
//      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
//                 'com a tabela de Consulta de vendas.',mtError,[mbOK],0);
//    end;

    try
//      cdsMovimentacoes.RemoteServer := DSProviderClient;
//      cdsMovimentacoes.ProviderName := 'DSPMovimentacao';
    except
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de MovimentaÁıes.',mtError,[mbOK],0);
    end;

    try
//      cdsFornecedores.RemoteServer := DSProviderClient;
//      cdsFornecedores.ProviderName := 'DSPFornecedores';
    except
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de Fornecedores.',mtError,[mbOK],0);
    end;

    try
//      cdsFormasPagamentos.RemoteServer := DSProviderClient;
//      cdsFormasPagamentos.ProviderName := 'DSPFormasPagamentos';
    except
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de Formas de Pagamentos.',mtError,[mbOK],0);
    end;

//    try
//      cdsMovimentacoesClientes.RemoteServer := DSProviderClient;
//      cdsMovimentacoesClientes.ProviderName := 'DSPMovimentacoesClientes';
//    except
//      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
//                 'com a tabela de MovimentaÁıes de Clientes.',mtError,[mbOK],0);
//    end;

  except
    SQLConexao.Connected := False;
    MessageDlg('O sistema n„o conseguiu efetuar conex„o com o servidor central.'+#13+
                'Por favor, verifique se o servidor est· sendo executado e/ou'+#13+
                'se foi informado em configuraÁıes o endereÁo e a porta para conex„o'+#13+
                'com o servidor central',mtError,[mbOk],0);
  end;
  try
//    cdsClientes.Active := true;
  except on e:exception do
    begin
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de Clientes.'+#13+
                 e.Message,mtError,[mbOK],0);
    end;
  end;

  try
    cdsProdutos.Active := true;
  except on e:exception do
    begin
      MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de Produtos.'+#13+
                 e.Message,mtError,[mbOK],0);
    end;
  end;


  try
    FDConnection1.Connected := True;
  except on e:exception do
    begin
       MessageDlg('O sistema n„o conseguiu efetuar conex„o '+#13+
                 'com a tabela de .'+#13+
                 e.Message,mtError,[mbOK],0);
    end;
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Pred(ComponentCount) do
  begin
    if (Components[I] is TClientDataSet) then
      (Components[I] as TClientDataSet).Close;
  end;
  SQLConexao.Connected := False;
end;



function TDM.SEMCHAR(Str: string): string;
{FunÁ„o que serve para nao aceitar caracteres especiais tipo !@#$%^&*()}
Const
  ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
  NaoChar = '~`!@#$%^&*()_-+=|\<>,.?/Ê';
Var
  x : Integer;
begin
  For x := 1 to Length(Str) do
  begin
    if Pos(Str[x],ComAcento)<>0 Then
      Str[x] := SemAcento[Pos(Str[x],ComAcento)];

    if Pos(Str[x], NaoChar) = 0 then
      Str[x] := Str[x]
  end;
  Result := Str;
end;

end.
