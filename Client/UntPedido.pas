unit UntPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxButtons, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  cxLabel, cxScrollBox, Vcl.Mask, Vcl.DBCtrls, Vcl.DBCGrids, cxTextEdit,
  cxDBEdit, cxPCdxBarPopupMenu, cxPC, cxMemo, cxMaskEdit, cxDropDownEdit,
  cxDBLabel, cxDBNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxPSCore, dxPScxCommon,
  {dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light,} dxBarBuiltInMenu,UITypes, Vcl.Samples.Gauges;

type
  TfrmPedidos = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    cxbtnPesquisa: TcxButton;
    cxButton3: TcxButton;
    cxButton5: TcxButton;
    cxBtnrealizarPedido: TcxButton;
    cxPCPrincipal: TcxPageControl;
    cxTSPesquisa: TcxTabSheet;
    cxTSInserirDados: TcxTabSheet;
    pnlPrincipal: TPanel;
    pnlDadosFornecedor: TPanel;
    cxGBDadosCliente: TcxGroupBox;
    cxLblRazaosocial: TcxLabel;
    cxLblEndereco: TcxLabel;
    cxLblMunicipio: TcxLabel;
    cxLblCnpj: TcxLabel;
    cxLblBairro: TcxLabel;
    cxLblFone: TcxLabel;
    cxScrollBox1: TcxScrollBox;
    cxGroupBox1: TcxGroupBox;
    cxGridProdutos: TcxGrid;
    cxGridProdutosDBTableView1: TcxGridDBTableView;
    cxGridProdutosLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    DBCtrlGrid1: TDBCtrlGrid;
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxGBEdicao: TcxGroupBox;
    cxButton4: TcxButton;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxdbtNumeroParcelas: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    cxLabel14: TcxLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    cxLabel17: TcxLabel;
    cxDBTextEdit14: TcxDBTextEdit;
    cxLabel18: TcxLabel;
    cxDBTextEdit15: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    cxDBTextEdit16: TcxDBTextEdit;
    cxLabel20: TcxLabel;
    cxDBTextEdit17: TcxDBTextEdit;
    cxPCPesquisa: TcxPageControl;
    cxtspedidos: TcxTabSheet;
    cxtsclientes: TcxTabSheet;
    cxGridPedidos: TcxGrid;
    cxGridPedidosDBTableView1: TcxGridDBTableView;
    cxGridPedidosDBTableView1ID_PEDIDO: TcxGridDBColumn;
    cxGridPedidosDBTableView1NOME_CLIENTE: TcxGridDBColumn;
    cxGridPedidosDBTableView1DATA_PEDIDO: TcxGridDBColumn;
    cxGridPedidosDBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGridPedidosDBTableView1DATA_PAGAMENTO: TcxGridDBColumn;
    cxGridPedidosDBTableView1FORMA_PAGAMENTO: TcxGridDBColumn;
    cxGridPedidosDBTableView1CONDICAO_PAGAMENTO: TcxGridDBColumn;
    cxGridPedidosDBTableView1FORMA_ENTREGA: TcxGridDBColumn;
    cxGridPedidosLevel1: TcxGridLevel;
    cxGridClientesDBTableView1: TcxGridDBTableView;
    cxGridClientesLevel1: TcxGridLevel;
    cxGridClientes: TcxGrid;
    cxGridClientesDBTableView1ID_CLIENTE: TcxGridDBColumn;
    cxGridClientesDBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    cxGridClientesDBTableView1FANTASIA: TcxGridDBColumn;
    cxGridClientesDBTableView1CPF: TcxGridDBColumn;
    cxGridClientesDBTableView1CNPJ: TcxGridDBColumn;
    cxGridClientesDBTableView1INSCRICAO_ESTADUAL: TcxGridDBColumn;
    cxGridProdutosDBTableView1PRO_DESCRICAO: TcxGridDBColumn;
    cxGridProdutosDBTableView1PRO_CODIGO: TcxGridDBColumn;
    cxGridProdutosDBTableView1PRO_SALDO: TcxGridDBColumn;
    cxGridProdutosDBTableView1PRECO_VENDA: TcxGridDBColumn;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTQuantidade: TcxDBTextEdit;
    cxDBTValorUnitario: TcxDBTextEdit;
    cxDBTValorTotal: TcxDBTextEdit;
    cxLabel21: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBNavigator1: TcxDBNavigator;
    cxGroupBox8: TcxGroupBox;
    cxDBNavigator2: TcxDBNavigator;
    cxGridPedidosDBTableView1Column1: TcxGridDBColumn;
    cxBtnGerarNFe: TcxButton;
    cxbtnRelatorios: TcxButton;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton6: TcxButton;
    BtImportar: TcxButton;
    Gauge1: TGauge;
    procedure GridPanel1Click(Sender: TObject);

    procedure BackToMainForm(Sender: TObject);
    procedure cxbtnPesquisaClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGridPedidosDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure cxGridClientesDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridProdutosDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxtsclientesShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxtspedidosShow(Sender: TObject);
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure cxBtnrealizarPedidoClick(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxBtnGerarNFeClick(Sender: TObject);
    procedure cxbtnRelatoriosClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxDBNavigator2ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure BtImportarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ImportarCSV(sPedido,sItemPed :string);

  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses GroupedItems1, SplitItemDetail1, UDataModul, ULogin, UntConectaServidor,
  UntLookUpTiposDeOperacao, UntFormasDePagamento, UProceduresClient,
  UntLookUpCondicaoDePagamento, UntFormasDeEntrega, URelatorios;

procedure TfrmPedidos.BtImportarClick(Sender: TObject);
var
  ped,Cod: integer;
  Dat,filtro: string;
begin
  filtro := 'T';
  if not inputquery('Importar pedido pelo código ou importar todos','Informe o código do pedido ou digite T para todos ',filtro) then
    abort;

  filtro:= Uppercase(filtro);

  Dm.cdsGenerico.Close;
  Dm.cdsGenerico.CommandText := 'SELECT EXTRACT(YEAR FROM MAX(Data_pedido)) || ''-'' || EXTRACT(MONTH FROM MAX(Data_pedido)) || ''-'' || EXTRACT(DAY FROM MAX(Data_pedido)) AS Dat '+
   ' FROM pedidos  ';
  DM.cdsGenerico.open;

  Dat:= Dm.cdsGenerico.FieldByName('Dat').AsString;

  with Dm.FDQConsulta,Sql do
  begin
    Close;
    Clear;
    Add('select count(*) cont from pedidos p ');
    Add(' where exists (select 1 from cesta c where p.cod_cesta = c.cod_cesta)');

    if filtro <> 'T' then
      Add('   and p.cod_ped = '+inttostr(strtoint(filtro)-1000))
    else
      Add('   and data >= '+ Dat );
    Open;
    Gauge1.Visible := true;
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := Dm.FDQConsulta.FieldByName('cont').AsInteger;
    Close;
    Clear;
    Add('select cod_ped, cod_cesta, p.cod_cad,CONVERT(VARCHAR(10), data, 101) dat,data,');
    Add('       subtotal,desconto,frete,total,nome');
	  Add('  from pedidos p');
    Add('  left outer join cadastros cc on (cc.cod_cad = p.cod_cad)');
    Add(' where exists (select 1 from cesta c where p.cod_cesta = c.cod_cesta)');

    if filtro <> 'T' then
      Add('   and p.cod_ped = '+inttostr(strtoint(filtro)-1000))
    else
      Add('   and data >= '+ Dat );
    Open;
  end;
  try
    Dm.FDQConsulta.First;
    while not Dm.FDQConsulta.eof do
    begin
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'Select count(*) cont from Pedidos where id_pedido = '+inttostr(Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000);
      DM.cdsGenerico.open;

      if Dm.cdsGenerico.FieldByName('cont').AsInteger > 0 then
      begin
//        Dm.cdsGenerico.Close;
//        DM.cdsGenerico.CommandText := 'UPDATE PEDIDOS SET '+
//        '  STATUS = :STATUS,'+
//        '  DATA_PEDIDO = :DATA_PEDIDO,'+
//        '  ID_CLIENTE = :ID_CLIENTE,'+
//        '  NUMERO_COMANDA = :NUMERO_COMANDA,'+
//        '  NOME_CLIENTE = :NOME_CLIENTE,'+
//        '  VALOR_TOTAL = :VALOR_TOTAL,'+
//        '  VALOR_FRETE = :VALOR_FRETE'+
//        '  WHERE ID_PEDIDO = :ID_PEDIDO';
//        DM.cdsGenerico.Params.ParambyName('ID_PEDIDO').AsInteger:= (Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000);
//        DM.cdsGenerico.Params.ParambyName('STATUS').AsString:= 'Ativo';
//        DM.cdsGenerico.Params.ParambyName('DATA_PEDIDO').AsDatetime:= Dm.FDQConsulta.FieldByName('data').AsDatetime;
//        DM.cdsGenerico.Params.ParambyName('ID_CLIENTE').AsInteger:= Dm.FDQConsulta.FieldByName('cod_cad').AsInteger;
//        DM.cdsGenerico.Params.ParambyName('NUMERO_COMANDA').AsString:= inttostr(Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000);
//        DM.cdsGenerico.Params.ParambyName('NOME_CLIENTE').AsString:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);
//        DM.cdsGenerico.Params.ParambyName('VALOR_TOTAL').AsFloat:= Dm.FDQConsulta.FieldByName('total').AsFloat;
//        DM.cdsGenerico.Params.ParambyName('VALOR_FRETE').AsFloat:= Dm.FDQConsulta.FieldByName('frete').AsFloat;
//        DM.cdsGenerico.Execute;
      end
      else
      begin
        Dm.cdsGenerico.Close;
        DM.cdsGenerico.CommandText := 'INSERT INTO PEDIDOS '+
        '(ID_PEDIDO, STATUS, DATA_PEDIDO, ID_CLIENTE, NUMERO_COMANDA,'+
        ' NOME_CLIENTE,  VALOR_TOTAL, VALOR_FRETE)' +
        ' VALUES (:ID_PEDIDO,:STATUS,:DATA_PEDIDO,:ID_CLIENTE,:NUMERO_COMANDA,'+
        ' :NOME_CLIENTE, :VALOR_TOTAL,:VALOR_FRETE)';
        DM.cdsGenerico.Params.ParambyName('ID_PEDIDO').AsInteger:= (Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000);
        DM.cdsGenerico.Params.ParambyName('STATUS').AsString:= 'Ativo';
        DM.cdsGenerico.Params.ParambyName('DATA_PEDIDO').AsDatetime:= Dm.FDQConsulta.FieldByName('data').AsDatetime;
        DM.cdsGenerico.Params.ParambyName('ID_CLIENTE').AsInteger:= Dm.FDQConsulta.FieldByName('cod_cad').AsInteger;
        DM.cdsGenerico.Params.ParambyName('NUMERO_COMANDA').AsString:= inttostr(Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000);
        DM.cdsGenerico.Params.ParambyName('NOME_CLIENTE').AsString:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('VALOR_TOTAL').AsFloat:= Dm.FDQConsulta.FieldByName('total').AsFloat;
        DM.cdsGenerico.Params.ParambyName('VALOR_FRETE').AsFloat:= Dm.FDQConsulta.FieldByName('frete').AsFloat;
        DM.cdsGenerico.Execute;
        Dm.cdsGenerico.Close;
        DM.cdsGenerico.CommandText := 'INSERT INTO COMANDAS (id_comanda,numero_comanda) '+
        'VALUES (GEN_ID(NOVA_COMANDA, 1),'+Quotedstr(inttostr(Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000) )+')';
        DM.cdsGenerico.Execute;
      end;
      with Dm.FDQBusca,Sql do
      begin
        Close;
        Clear;
        Add('select cod_cesta, cod_prod,codigo, produto,cestapreco, qt,desconto');
	      Add('  from cesta ');
	      Add(' where cod_cesta = :cesta and cod_cesta is not null');
        ParamByName('cesta').AsInteger:= Dm.FDQConsulta.FieldByName('cod_cesta').AsInteger;
        Open;
      end;
      Dm.FDQBusca.First;
      while not Dm.FDQBusca.Eof do
      begin
        Dm.cdsGenerico.Close;
        DM.cdsGenerico.CommandText := 'Select count(*) cont from PEDIDOS_ITENS where id_pedido = '+inttostr(Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000)
        +' and id_produto = '+ Dm.FDQBusca.FieldByName('cod_prod').AsString;
        DM.cdsGenerico.open;

        if Dm.cdsGenerico.FieldByName('cont').AsInteger > 0 then
        begin
//          Dm.cdsGenerico.Close;
//          DM.cdsGenerico.CommandText := 'UPDATE PEDIDOS_ITENS SET '+
//          ' DESCRICAO_PRODUTO =:DESCRICAO_PRODUTO,'+
//          ' CODIGO=:CODIGO,'+
//          ' QUANTIDADE =:QUANTIDADE,'+
//          ' VALOR_UNITARIO =:VALOR_UNITARIO,'+
//          ' VALOR_TOTAL =:VALOR_TOTAL,'+
//          ' DESCONTO =:DESCONTO'+
//          ' WHERE ID_PEDIDO =:ID_PEDIDO AND ID_PRODUTO =:ID_PRODUTO';
//          DM.cdsGenerico.Params.ParambyName('ID_PEDIDO').AsInteger:= (Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000);
//          DM.cdsGenerico.Params.ParambyName('ID_PRODUTO').AsInteger:= Dm.FDQBusca.FieldByName('cod_prod').AsInteger;
//          DM.cdsGenerico.Params.ParambyName('CODIGO').AsString:= TRIM(Copy(Dm.FDQBusca.FieldByName('codigo').AsString,1,200));
//          DM.cdsGenerico.Params.ParambyName('DESCRICAO_PRODUTO').AsString:= Copy(Dm.FDQBusca.FieldByName('produto').AsString,1,255);
//          DM.cdsGenerico.Params.ParambyName('QUANTIDADE').AsFloat:= Dm.FDQBusca.FieldByName('qt').AsFloat;
//          DM.cdsGenerico.Params.ParambyName('VALOR_UNITARIO').AsFloat:= Dm.FDQBusca.FieldByName('cestapreco').AsFloat;
//          DM.cdsGenerico.Params.ParambyName('DESCONTO').AsFloat:= Dm.FDQBusca.FieldByName('desconto').AsFloat;
//          DM.cdsGenerico.Params.ParambyName('VALOR_TOTAL').AsFloat:= Dm.FDQBusca.FieldByName('cestapreco').AsFloat * Dm.FDQBusca.FieldByName('qt').AsFloat;
//          DM.cdsGenerico.Execute;
        end
        else
        begin
          Dm.cdsGenerico.Close;
          DM.cdsGenerico.CommandText := 'INSERT INTO PEDIDOS_ITENS ( ID_PEDIDO_ITEM, ID_PEDIDO, ID_PRODUTO, CODIGO, DESCRICAO_PRODUTO,'+
          'QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL,DESCONTO) '+
          'VALUES (GEN_ID(NOVO_PEDIDO_ITEM, 1), :ID_PEDIDO,:ID_PRODUTO,:CODIGO,:DESCRICAO_PRODUTO, '+
          ':QUANTIDADE,:VALOR_UNITARIO,:VALOR_TOTAL,:DESCONTO)';
          DM.cdsGenerico.Params.ParambyName('ID_PEDIDO').AsInteger:= (Dm.FDQConsulta.FieldByName('cod_ped').AsInteger+1000);
          DM.cdsGenerico.Params.ParambyName('ID_PRODUTO').AsInteger:= Dm.FDQBusca.FieldByName('cod_prod').AsInteger;
          DM.cdsGenerico.Params.ParambyName('CODIGO').AsString:= TRIM(Copy(Dm.FDQBusca.FieldByName('codigo').AsString,1,200));
          DM.cdsGenerico.Params.ParambyName('DESCRICAO_PRODUTO').AsString:= Copy(Dm.FDQBusca.FieldByName('produto').AsString,1,255);
          DM.cdsGenerico.Params.ParambyName('QUANTIDADE').AsFloat:= Dm.FDQBusca.FieldByName('qt').AsFloat;
          DM.cdsGenerico.Params.ParambyName('VALOR_UNITARIO').AsFloat:= Dm.FDQBusca.FieldByName('cestapreco').AsFloat;
          DM.cdsGenerico.Params.ParambyName('DESCONTO').AsFloat:= Dm.FDQBusca.FieldByName('desconto').AsFloat;
          DM.cdsGenerico.Params.ParambyName('VALOR_TOTAL').AsFloat:= Dm.FDQBusca.FieldByName('cestapreco').AsFloat * Dm.FDQBusca.FieldByName('qt').AsFloat;
          DM.cdsGenerico.Execute;
        end;
        Dm.FDQBusca.Next;
      end;
      inc(ped);
      Gauge1.Progress := ped;
      Dm.FDQConsulta.Next;
    end;
  except on e:exception do
    begin
     MessageDlg('Não foi possível importar tabela de pedidos!'+#13+
                 e.Message, mtError,[mbYes],0);
     exit;
    end;
  end;
  if not dm.cdsPedidos.Active then
    dm.cdsPedidos.Active := True
  else
  begin
    dm.cdsPedidos.Close;
    dm.cdsPedidos.Open;
  end;
  with Dm.FDQConsulta,Sql do
  begin
    Close;
    Clear;
    Add('select max(cod_ped) + 1000 as cod from pedidos');
    Open;
  end;
  Dm.cdsGenerico.Close;
  DM.cdsGenerico.CommandText := 'SET GENERATOR NOVO_PEDIDO TO '+Dm.FDQConsulta.FieldByName('cod').Asstring;
  DM.cdsGenerico.Execute;
  Gauge1.visible:= false;
  MessageDlg('Foram importados ' +inttostr(ped)+ ' pedidos!', mtInformation,[mbYes],0);
end;

procedure TfrmPedidos.cxBtnGerarNFeClick(Sender: TObject);
begin
  if not dm.cdsNotasFiscais.Active then
    dm.cdsNotasFiscais.Active := true;
  dm.cdsNotasFiscais.Insert;
  dm.cdsNotasFiscaisID_PEDIDO.AsInteger := dm.cdsPedidosID_PEDIDO.AsInteger;
  dm.cdsNotasFiscaisID_CLIENTE.AsInteger := dm.cdsPedidosID_CLIENTE.AsInteger;
//  dm.cdsNotasFiscaisNOME_CLIENTE.AsString := dm.cdsPedidosNOME_CLIENTE.AsString;
  dm.cdsNotasFiscaisDATA_EMISSAO.AsDateTime := Date;
//  dm.cdsNotasFiscaisVALOR_PRODUTOS.AsFloat :=
//  dm.cdsNotasFiscaisFORMA_PAGAMENTO.AsString := dm.cdsPedidosFORMA_PAGAMENTO.AsString;
//  dm.cdsNotasFiscaisCONDICAO_PAGAMENTO.AsString := dm.cdsPedidosCONDICAO_PAGAMENTO.AsString;
//  dm.cdsNotasFiscaisNUMERO_PARCELAS.AsInteger := dm.cdsPedidosNUMERO_PARCELAS.AsInteger;
  Dm.cdsGenerico.Close;
  DM.cdsGenerico.CommandText :=' SELECT * FROM PEDIDOS_FORMAS_CONDICOES WHERE ID_PEDIDO = ' +inttostr(dm.cdsPedidosID_PEDIDO.AsInteger);
  Dm.cdsGenerico.Open;

  dm.cdsNotasFiscaisFORMA_PAGAMENTO.AsString := Dm.cdsGenerico.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;
  dm.cdsNotasFiscaisCONDICAO_PAGAMENTO.AsString := Dm.cdsGenerico.FieldByName('CONDICAO_DE_PAGAMENTO').AsString;

  dm.cdsNotasFiscaisNUMERO_PARCELAS.AsInteger := 1;


    dm.cdsClientes.close;
    dm.cdsClientes.Filtered := False;
    dm.cdsClientes.Filter := '';
    dm.cdsClientes.CommandText := 'select * from Clientes where ID_CLIENTE = ' + IntToStr(dm.cdsPedidosID_CLIENTE.AsInteger) + ' order by id_cliente';
    dm.cdsClientes.open;


  dm.cdsNotasFiscaisNOME_CLIENTE.AsString := dm.cdsClientesRAZAO_SOCIAL.AsString;

  if dm.cdsClientesID_TRANSPORTADOR.AsInteger > 0 then
    dm.cdsNotasFiscaisID_TRANSPORTADOR.AsInteger := dm.cdsClientesID_TRANSPORTADOR.AsInteger;
  dm.cdsClientes.Filter := '';
  dm.cdsClientes.Filtered := False;


  dm.cdsNotasFiscaisNFE_CALCULADA.AsString := 'N';
  if not Assigned(frmlookUpTiposDeoperacao) then
    frmlookUpTiposDeoperacao := TfrmlookUpTiposDeoperacao.Create(Self);
  frmlookUpTiposDeoperacao.Left := Trunc(Screen.Width / 2) - 200;
  frmlookUpTiposDeoperacao.Top := Trunc(Screen.Height / 2) - 200;
  if not dm.cdsTiposDeOperacao.Active then
    dm.cdsTiposDeOperacao.Active := True;
  frmlookUpTiposDeoperacao.ShowModal;
  dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger := dm.cdsTiposDeOperacaoID_TIPO_OPERACAO.AsInteger;
  dm.cdsNotasFiscaisNATUREZA_DE_OPERACAO.AsString := DM.cdsTiposDeOperacaoDESCRICAO_TIPO_OPERACAO.AsString;
  dm.cdsNotasFiscais.Post;

  if not dm.cdsNotasFiscaisItens.Active then
    dm.cdsNotasFiscaisItens.Active := true;

  Dm.cdsGenerico.Close;

  dm.cdsPedidos_Itens.close;
  dm.cdsPedidos_Itens.Filtered := False;
  dm.cdsPedidos_Itens.Filter := '';
  dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
  dm.cdsPedidos_Itens.Open;

//      dm.cdsPedidos_Itens.Filtered := False;
//      dm.cdsPedidos_Itens.Filter := '';
//      dm.cdsPedidos_Itens.Filter := ' ID_PEDIDO = '+IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger);
//      dm.cdsPedidos_Itens.Filtered := true;
  //    dm.cdsPedidos_Itens.close;
  //    dm.cdsPedidos_Itens.Params.ParamByName('ID_PEDIDO').AsInteger := dm.cdsPedidosID_PEDIDO.AsInteger;
  //    dm.cdsPedidos_Itens.Open;


  dm.cdsPedidos_Itens.First;
  while not dm.cdsPedidos_Itens.Eof do
  begin
    dm.cdsNotasFiscaisItens.Insert;
    dm.cdsNotasFiscaisItensID_NOTA_FISCAL.AsInteger := dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger;
    dm.cdsNotasFiscaisItensID_PRODUTO.AsInteger := dm.cdsPedidos_ItensID_PRODUTO.AsInteger;
    dm.cdsNotasFiscaisItensQUANTIDADE.AsFloat := dm.cdsPedidos_ItensQUANTIDADE.AsFloat;
    dm.cdsNotasFiscaisItensDESCRICAO_PRODUTO.AsString := dm.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString;
    dm.cdsNotasFiscaisItensVALOR_UNITARIO.AsFloat := dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat;
    dm.cdsNotasFiscaisItensVALOR_DESCONTO.AsFloat := dm.cdsPedidos_ItensDESCONTO.AsFloat;
    dm.cdsNotasFiscaisItensVALOR_FRETE.AsFloat := 0.00;
    dm.cdsNotasFiscaisItensVALOR_SEGURO.AsFloat := 0.00;
    dm.cdsProdutos.Close;
    //dm.cdsProdutos.Filtered := False;
    //dm.cdsProdutos.Filter := '';
    //dm.cdsProdutos.Filter := ' PRO_ID = '+IntToStr(dm.cdsPedidos_ItensID_PRODUTO.AsInteger);
    dm.cdsProdutos.CommandText:= 'SELECT * FROM PRODUTOS WHERE COD_PROD = ' + IntToStr(dm.cdsPedidos_ItensID_PRODUTO.AsInteger)+
    ' AND PRO_CODIGO = ' + QuotedStr( dm.cdsPedidos_ItensCodigo.asstring) +
    ' ORDER BY PRO_DESCRICAO';
    dm.cdsProdutos.Open;


    dm.cdsNotasFiscaisItensCODIGO_PRODUTO.AsString := dm.cdsProdutosPRO_CODIGO.AsString;
    dm.cdsNotasFiscaisItensNCM_PRODUTO.AsString := RetirarPontosETracos(dm.cdsProdutosCODIGO_NCM.AsString);
    dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsProdutos.FieldByName('CFOP').AsString;
    dm.cdsNotasFiscaisItensUNIDADE.AsString:= dm.cdsProdutosUNIDADE.AsString;

    Dm.cdsGenerico.Close;
    DM.cdsGenerico.CommandText :=' select * from TIPOS_DE_OPERACAO';
    Dm.cdsGenerico.Open;

  (*  "ID_TIPO_OPERACAO" integer NOT NULL,
	"CFOP_DENTRO_ESTADO" varchar(4),
	"CFOP_FORA_ESTADO" varchar(4),
	"CFOP_DENTRO_ESTADO_COM_ST" varchar(4),
	"CFOP_FORA_ESTADO_COM_ST" varchar(4),
	"CST_ICMS_NORMAL" varchar(4),
	"CST_ICMS_COM_ST" varchar(4),
	"CST_ICMS_COM_REDUCAO" varchar(4),
	"CST_ICMS_COM_ST_E_REDUCAO" varchar(4),
	"CST_IPI" varchar(4),
	"CST_PIS" varchar(4),
	"CST_COFINS" varchar(4),
	"DESCRICAO_TIPO_OPERACAO" varchar(60),
	"MODALIDADE_BASE_CALCULO_ICMS" varchar(50),
	"MODALIDADE_BASE_CALCULO_ICMS_ST" varchar(50),
	"NUMERO_BASE_CALCULO_ICMS" integer,
	"NUMERO_BASE_CALCULO_ICMS_ST" integer,
    *)


    (*
    dm.cdsNotasFiscaisItensBASE_CALCULO_COFINS.AsFloat
    dm.cdsNotasFiscaisItensBASE_CALCULO_IPI.AsFloat
    dm.cdsNotasFiscaisItensVALOR_ICMS_ST.AsFloat
    dm.cdsNotasFiscaisItensVALOR_COFINS.AsFloat
    dm.cdsNotasFiscaisItensVALOR_PIS.AsFloat
    dm.cdsNotasFiscaisItensVALOR_IPI.AsFloat
    dm.cdsNotasFiscaisItensVALOR_ICMS.AsFloat
      *)
    dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS_ST.AsString := Dm.cdsGenerico.FieldByName('MODALIDADE_BASE_CALCULO_ICMS').AsString;
    dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsString := Dm.cdsGenerico.FieldByName('MODALIDADE_BASE_CALCULO_ICMS_ST').AsString;
    dm.cdsNotasFiscaisItensCST_COFINS.AsString := Dm.cdsGenerico.FieldByName('CST_COFINS').AsString;
    dm.cdsNotasFiscaisItensCST_PIS.AsString := Dm.cdsGenerico.FieldByName('CST_PIS').AsString;
    dm.cdsNotasFiscaisItensCST_IPI.AsString := Dm.cdsGenerico.FieldByName('CST_IPI').AsString;
    dm.cdsNotasFiscaisItensCST_ICMS.AsString := Dm.cdsGenerico.FieldByName('CST_ICMS_NORMAL').AsString;
    dm.cdsNotasFiscaisItensCST_ICMS_ST.AsString := Dm.cdsGenerico.FieldByName('CST_ICMS_COM_ST').AsString;

    Dm.cdsGenerico.Close;
    DM.cdsGenerico.CommandText :=' select * from CONVENIOS_NCM';
    Dm.cdsGenerico.Open;

    dm.cdsNotasFiscaisItensPERCENTUAL_IPI.AsFloat := Dm.cdsGenerico.FieldByName('ALIQUOTA_IPI').AsFloat;
    dm.cdsNotasFiscaisItensPERCENTUAL_ICMS.AsFloat := Dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsFloat;

     (*
    dm.cdsNotasFiscaisItensPERCENTUAL_COFINS.AsFloat
    dm.cdsNotasFiscaisItensPERCENTUAL_PIS.AsFloat
       *)
    dm.cdsNotasFiscaisItens.Post;
    dm.cdsPedidos_Itens.Next;
  end;
  dm.cdsProdutos.Filtered := False;
  dm.cdsProdutos.Filter := '';
  MessageDlg('NF-e gerada com sucesso',mtConfirmation,[mbOK],0);
end;

procedure TfrmPedidos.cxbtnPesquisaClick(Sender: TObject);
begin
  cxPCPrincipal.Visible := true;
  cxPCPrincipal.ActivePage := cxTSPesquisa;
  cxPCPesquisa.ActivePage := cxtspedidos;
  cxtspedidos.TabVisible := true;
  cxtsclientes.TabVisible := False;
  cxTSInserirDados.TabVisible := False;
  cxGBEdicao.Visible := true;
  cxGridPedidos.SetFocus;

  dm.cdsPedidos.Close;
  dm.cdsPedidos.Open;

  dm.cdsClientes.Close;
  //dm.cdsClientes.Filtered := False;
  dm.cdsClientes.CommandText:= 'select * from Clientes where ID_CLIENTE = '+ IntToStr(dm.cdsPedidosID_CLIENTE.AsInteger);
  //dm.cdsClientes.Filtered := true;
  dm.cdsClientes.Open;
end;

procedure TfrmPedidos.cxButton1Click(Sender: TObject);
begin
  if DM.cdsPedidos.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(frmLookUpFormaDePagamento) then
      frmLookUpFormaDePagamento := TfrmLookUpFormaDePagamento.Create(Self);
    frmLookUpFormaDePagamento.Left := Trunc(Screen.Width / 2) - 200;
    frmLookUpFormaDePagamento.Top := Trunc(Screen.Height / 2) - 200;
//    frmlookUpTiposDeoperacao.cxGrid1DBTableView1.DataController.DataSource := dm.dsClientes;
    if not dm.cdsFormasDePagamento.Active then
      dm.cdsFormasDePagamento.Active := True;
    frmLookUpFormaDePagamento.ShowModal;
//    dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger := dm.cdsTiposDeOperacaoID_TIPO_OPERACAO.AsInteger;
//    dm.cdsPedidosFORMA_PAGAMENTO.AsString := DM.cdsFormasDePagamentoFORMA_DE_PAGAMENTO.AsString;
  end;
end;

procedure TfrmPedidos.cxButton2Click(Sender: TObject);
begin
  if DM.cdsPedidos.State in [dsEdit,dsInsert] then
  begin
  {
    if dm.cdsPedidosFORMA_PAGAMENTO.AsString <> '' then
    begin
      if not Assigned(frmLookUpCondicaoDePagamento) then
        frmLookUpCondicaoDePagamento := TfrmLookUpCondicaoDePagamento.Create(Self);
      frmLookUpCondicaoDePagamento.Left := Trunc(Screen.Width / 2) - 200;
      frmLookUpCondicaoDePagamento.Top := Trunc(Screen.Height / 2) - 200;

      if not dm.cdsFormasVSCondicoes.Active then
        dm.cdsFormasVSCondicoes.Active := True;
      dm.cdsFormasVSCondicoes.Close;
      dm.cdsFormasVSCondicoes.CommandText := 'SELECT * FROM FORMAS_VS_CONDICOES '+
                                                 ' WHERE DESCRICAO_FORMA_DE_PAGAMENTO = '+
                                                 QuotedStr(dm.cdsPedidosFORMA_PAGAMENTO.AsString);
      dm.cdsFormasVSCondicoes.Open;
      frmLookUpCondicaoDePagamento.ShowModal;

      dm.cdsPedidosCONDICAO_PAGAMENTO.AsString := DM.cdsFormasVSCondicoesCONDICAO_DE_PAGAMENTO.AsString;
      dm.cdsFormasVSCondicoes.Close;
      dm.cdsFormasVSCondicoes.CommandText := 'SELECT * FROM FORMAS_VS_CONDICOES ';
      dm.cdsFormasVSCondicoes.Open;
      FreeAndNil(frmLookUpCondicaoDePagamento);
    end
    else
      MessageDlg('Primeiro, escolha uma forma de pagamento',mtWarning,[mbOK],0);
    }
  end;
end;

procedure TfrmPedidos.cxButton3Click(Sender: TObject);
begin
  try
    cxPCPrincipal.Visible := true;
    cxPCPrincipal.ActivePage := cxTSPesquisa;
    cxPCPesquisa.ActivePage := cxtsclientes;
    cxtspedidos.TabVisible := False;
    cxtsclientes.TabVisible := True;
    cxTSInserirDados.TabVisible := False;
    cxGBEdicao.Visible := False;
    cxGridClientes.SetFocus;
    if not dm.cdsPedidos.Active then
      dm.cdsPedidos.Active := True
    else
    begin
      dm.cdsPedidos.Close;
      dm.cdsPedidos.Open;
    end;

    if not dm.cdsClientes.Active then
      dm.cdsClientes.Active := True
    else
    begin
      dm.cdsClientes.Close;
      dm.cdsClientes.Open;
    end;
  except on e:exception do
    begin
      MessageDlg('Não foi possível concluir operação'+#13+
                 e.Message,mtError,[mbOK],0);
    end;
  end;
end;

procedure TfrmPedidos.cxButton4Click(Sender: TObject);
begin
  cxTSInserirDados.TabVisible := True;
  cxPCPrincipal.ActivePage := cxTSInserirDados;
  cxTSPesquisa.TabVisible := False;
end;

procedure TfrmPedidos.cxButton5Click(Sender: TObject);
begin
  if dm.cdsPedidosSTATUS.AsString <> 'Concluido' then
    MessageDlg('Este pedido não está Concluido',mtWarning,[mbOK],0)
  else
  begin
    dm.cdsPedidos.Edit;
    dm.cdsPedidosSTATUS.AsString := 'Cancelado';
    dm.cdsPedidos.Post;
  end;
end;

procedure TfrmPedidos.cxButton6Click(Sender: TObject);
begin
  if DM.cdsPedidos.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(frmFormasDeEntrega) then
      frmFormasDeEntrega := TfrmFormasDeEntrega.Create(Self);
    frmFormasDeEntrega.Left := Trunc(Screen.Width / 2) - 200;
    frmFormasDeEntrega.Top := Trunc(Screen.Height / 2) - 200;
//    frmlookUpTiposDeoperacao.cxGrid1DBTableView1.DataController.DataSource := dm.dsClientes;
    if not dm.cdsFormasDeEntrega.Active then
      dm.cdsFormasDeEntrega.Active := True;
    frmFormasDeEntrega.ShowModal;
//    dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger := dm.cdsTiposDeOperacaoID_TIPO_OPERACAO.AsInteger;
//    dm.cdsPedidosFORMA_ENTREGA.AsString := DM.cdsFormasDeEntregaFORMA_DE_ENTREGA.AsString;
  end;
end;

procedure TfrmPedidos.cxBtnrealizarPedidoClick(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
  vString,vStringAuxiliar : string;
  vContador : integer;
begin
  if Ansiuppercase(dm.cdsPedidosSTATUS.AsString) <> 'PENDENTE' then
    MessageDlg('Este pedido de compra não está pendente',mtWarning,[mbOK],0)
  else
  begin
    {
    if dm.cdsPedidosNUMERO_PARCELAS.IsNull then
      MessageDlg('Não foi informado o numero de parcelas a serem geradas no financeiro '+#13+
                 'Este pedido não será realizado até que esta informação seja preenchida',mtWarning,[mbOK],0)
    else
    begin
      dm.cdsPedidos_Itens.First;
      if dm.cdsPedidos_Itens.RecordCount = 0 then
        MessageDlg('Este pedido de compra não possui nenhum item',mtWarning,[mbOK],0)
      else
      begin
        Conexao := TDSModuleDbClient.Create(dm.SQLConexao.DBXConnection);
        dm.cdsPedidos_Itens.First;
        while not dm.cdsPedidos_Itens.Eof do
        begin
          Conexao.InserirEmMovimentacoes(dm.cdsPedidos_ItensID_PRODUTO.AsInteger,dm.cdsPedidosID_PEDIDO.AsInteger,
                                         dm.cdsPedidos_ItensQUANTIDADE.AsFloat,'VENDA','S');
          dm.cdsPedidos_Itens.Next;
        end;
        dm.cdsPedidos.Edit;
        dm.cdsPedidosSTATUS.AsString := 'Realizado';
        dm.cdsPedidos.Post;
        //
        if dm.cdsPedidosNUMERO_PARCELAS.AsInteger > 0 then
        begin
          if not dm.cdsReceber.Active then
            dm.cdsReceber.Active := true;

          if Trim(dm.cdsPedidosCONDICAO_PAGAMENTO.AsString) <> '' then
          begin
            try
              vString := dm.cdsPedidosCONDICAO_PAGAMENTO.AsString;
              if AnsiUpperCase(vString) = '0' then
              begin
                dm.cdsReceber.Insert;
                dm.cdsReceberDESCRICAO_TITULO.AsString := 'Pedido de venda Nº '+IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger);
                DM.cdsReceberID_PEDIDO.AsInteger := dm.cdsPedidosID_PEDIDO.AsInteger;
                dm.cdsReceberID_CLIENTE.AsInteger := dm.cdsPedidosID_CLIENTE.AsInteger;
                dm.cdsReceberNOME_CLIENTE.AsString := dm.cdsPedidosNOME_CLIENTE.AsString;
                dm.cdsReceberVENCIMENTO.AsDateTime := Date;
                dm.cdsReceberVALOR_TITULO.AsFloat := dm.cdsPedidosVALOR_TOTAL.AsFloat;
                DM.cdsReceberFORMA_PAGAMENTO.AsString := dm.cdsPedidosFORMA_PAGAMENTO.AsString;
                dm.cdsReceberSTATUS.AsString :=  'Aguardando recebimento';
                dm.cdsreceber.Post;
              end
              else
              begin
                vContador := 0;
                repeat
                  vStringAuxiliar := Copy(vString,1,2);
                  dm.cdsReceber.Insert;
                  Inc(vContador);
                  dm.cdsReceberDESCRICAO_TITULO.AsString := 'Pedido de venda Nº '+IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger);
                  dm.cdsReceberID_PEDIDO.AsInteger := dm.cdsPedidosID_PEDIDO.AsInteger;
                  dm.cdsReceberID_CLIENTE.AsInteger := dm.cdsPedidosID_CLIENTE.AsInteger;
                  dm.cdsReceberNOME_CLIENTE.AsString := dm.cdsPedidosNOME_CLIENTE.AsString;
                  dm.cdsReceberVENCIMENTO.AsDateTime := Date + StrToInt(vStringAuxiliar);
                  dm.cdsReceberVALOR_TITULO.AsFloat := dm.cdsPedidosVALOR_TOTAL.AsFloat /
                                                               dm.cdsPedidosNUMERO_PARCELAS.AsInteger;
                  DM.cdsReceberFORMA_PAGAMENTO.AsString := dm.cdsPedidosFORMA_PAGAMENTO.AsString;
                  dm.cdsReceberSTATUS.AsString :=  'Aguardando recebimento';
                  dm.cdsReceber.Post;
                  vString := Copy(vString,Pos('/',vString)+1,Length(vString));
                until vContador =  dm.cdsPedidosNUMERO_PARCELAS.AsInteger ;
              end;
            except on e:exception do
              begin
                MessageDlg('Não foi possível efetuar a geração das duplicatas.'+#13+
                           'Erro gerado pelo sistema : '+e.Message,mtError,[mbOK],0);
              end;
            end;
          end
          else
            MessageDlg('Não será possível gerar parcelas no financeiro receber pois ainda não fora'+#13+
                       'informada a condição de pagamento para este pedido',mtError,[mbOK],0);
        end;
        //
        MessageDlg('Pedido realizado com sucesso',mtConfirmation,[mbOK],0);
      end;
    end;
    }
  end;
end;

procedure TfrmPedidos.cxbtnRelatoriosClick(Sender: TObject);
begin
  {
  if not Assigned(frmRelatorios) then
    frmRelatorios := TfrmRelatorios.Create(Self);

  frmRelatorios.QRPedidoVenda.Preview;
  frmRelatorios.QRComplementoPedidoVenda.Preview;

  try
    frmRelatorios.QRCompositeReport1.Preview;
  except on e:exception do
    begin
      MessageDlg('Erro ao imprimir pedido'+#13+e.Message,mtWarning,[mbOK],0);
    end;
  end;
  }
end;

procedure TfrmPedidos.cxDBNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin

  if AButtonIndex = 10 then
  begin
    if dm.cdsPedidos_Itens.State in [dsEdit,dsInsert] then
    begin
      cxDBTValorTotal.SetFocus;
      dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat := dm.cdsPedidos_ItensQUANTIDADE.AsFloat *
                                                dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat;

    end;

    if not dm.cdsGenerico.Active then
      dm.cdsGenerico.Active := True;

    dm.cdsGenerico.Close;
    dm.cdsGenerico.CommandText := 'SELECT PRO_SALDO FROM PRODUTOS WHERE PRO_ID = '+IntToStr(dm.cdsPedidos_ItensID_PRODUTO.AsInteger);
    dm.cdsGenerico.Open;
    if dm.cdsGenerico.FieldByName('PRO_SALDO').AsFloat < dm.cdsPedidos_ItensQUANTIDADE.AsFloat then
    begin
      MessageDlg('O produto '+dm.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString+
                 ' não possui saldo suficiente'+#13+
                 'para efetuar esta venda',mtWarning,[mbOK],0);
      abort;
    end;
  end;

      //insert              //delete
  if (AButtonIndex = 6) or (AButtonIndex = 8) then
  begin
    if Ansiuppercase(dm.cdsPedidosSTATUS.AsString) = 'REALIZADO' then
    begin
      MessageDlg('Este pedido de venda está realizado'+#13+
                 'não podendo ser alterado',mtError,[mbOK],0);
      dm.cdsPedidos_Itens.CancelUpdates;
      abort;
    end;
  end;
end;

procedure TfrmPedidos.cxDBNavigator2ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex = 9 then
  begin
    if Ansiuppercase(dm.cdsPedidosSTATUS.AsString) = 'REALIZADO' then
    begin
      MessageDlg('Este pedido de venda está realizado'+#13+
                 'não podendo ser alterado',mtError,[mbOK],0);
      dm.cdsPedidos.CancelUpdates;
      abort;
    end;
  end;
end;

procedure TfrmPedidos.cxGridClientesDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  Conexao : TDSModuleDbClient;
  vIdPedido : integer;
begin
  if Key = VK_RETURN then
  begin
    cxPCPrincipal.ActivePage := cxTSInserirDados;
    cxTSPesquisa.TabVisible := False;
    if not dm.cdsPedidos.Active then
      dm.cdsPedidos.Active := True
    else
    begin
      dm.cdsPedidos.Close;
      dm.cdsPedidos.Open;
    end;

    dm.cdsPedidos.Insert;
    dm.cdsPedidosID_CLIENTE.AsInteger := dm.cdsClientesID_CLIENTE.AsInteger;
//    DM.cdsPedidosNOME_CLIENTE.AsString := dm.cdsClientesRAZAO_SOCIAL.AsString;
//    dm.cdsPedidosDATA_PEDIDO.Value := Date;
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
//    dm.cdsPedidosID_USUARIO.AsInteger := Conexao.RetornaIdentificadorUsuario(frmlogin.pNomeUsuario);
    FreeAndNil(Conexao);
    cxLblRazaosocial.Caption := dm.cdsClientesRAZAO_SOCIAL.AsString;
    cxLblEndereco.Caption := dm.cdsClientesENDERECO.AsString+','+
                             dm.cdsClientesNUMERO.AsString;
//    cxLblMunicipio.Caption := dm.cdsClientes.AsString;
    cxLblCnpj.Caption := dm.cdsClientesCNPJ.AsString;
    cxLblBairro.Caption := dm.cdsClientesBAIRRO.AsString;
    cxLblFone.Caption := dm.cdsClientesTELEFONE.AsString;
    dm.cdsPedidos.Post;
    if not dm.cdsPedidos_Itens.Active then
    begin
      //dm.cdsPedidos_Itens.Active;
      //dm.cdsPedidos_Itens.Filtered := False;
      //dm.cdsPedidos_Itens.Filter := '';

      //dm.cdsPedidos_Itens.Filtered := true;
      dm.cdsPedidos_Itens.close;
      dm.cdsPedidos_Itens.Filtered := False;
      dm.cdsPedidos_Itens.Filter := '';
      dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
      dm.cdsPedidos_Itens.Open;
      //dm.cdsPedidos_Itens.Close;
      //dm.cdsPedidos_Itens.Filter := ' ID_PEDIDO = '+IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger);
      //dm.cdsPedidos_Itens.Open;
    end
    else
    begin
      dm.cdsPedidos_Itens.DisableControls;
      dm.cdsPedidos_Itens.close;
      dm.cdsPedidos_Itens.Filtered := False;
      dm.cdsPedidos_Itens.Filter := '';
      dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
      dm.cdsPedidos_Itens.Open;
      //dm.cdsPedidos_Itens.Filtered := False;
      //dm.cdsPedidos_Itens.Filter := '';
      //dm.cdsPedidos_Itens.Filter := ' ID_PEDIDO = '+IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger);
      //dm.cdsPedidos_Itens.Filtered := true;
//      dm.cdsPedidos_Itens.Close;
//      dm.cdsPedidos_Itens.Open;
      dm.cdsPedidos_Itens.EnableControls;
    end;
  end;
end;

procedure TfrmPedidos.cxGridPedidosDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    cxPCPrincipal.ActivePage := cxTSInserirDados;
    cxTSPesquisa.TabVisible := False;
    if not dm.cdsPedidos_Itens.Active then
    begin
//      dm.cdsPedidos_Itens.Active;
//      dm.cdsPedidos_Itens.Filtered := False;
//      dm.cdsPedidos_Itens.Filter := '';
//      dm.cdsPedidos_Itens.Filter := ' ID_PEDIDO = '+IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger);
//      dm.cdsPedidos_Itens.Filtered := true;
//      dm.cdsPedidos_Itens.Close;
//      dm.cdsPedidos_Itens.Open;
        dm.cdsPedidos_Itens.close;
        dm.cdsPedidos_Itens.Filtered := False;
        dm.cdsPedidos_Itens.Filter := '';
        dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
        dm.cdsPedidos_Itens.Open;
    end
    else
    begin
      dm.cdsPedidos_Itens.DisableControls;
      dm.cdsPedidos_Itens.close;
      dm.cdsPedidos_Itens.Filtered := False;
      dm.cdsPedidos_Itens.Filter := '';
      dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
      dm.cdsPedidos_Itens.Open;
      dm.cdsPedidos_Itens.EnableControls;
    end;
    if not dm.cdsClientes.Active then
      dm.cdsClientes.Active := True;

    //dm.cdsClientes.Filtered := False;
    //dm.cdsClientes.Filter := ' ID_CLIENTE = '+ IntToStr(dm.cdsPedidosID_CLIENTE.AsInteger);
    //dm.cdsClientes.Filtered := true;
    dm.cdsClientes.close;
    dm.cdsClientes.Filtered := False;
    dm.cdsClientes.Filter := '';
    dm.cdsClientes.CommandText := 'select * from Clientes where ID_CLIENTE = ' + IntToStr(dm.cdsPedidosID_CLIENTE.AsInteger) + ' order by id_cliente';
    dm.cdsClientes.open;

    cxLblRazaosocial.Caption := dm.cdsClientesRAZAO_SOCIAL.AsString;
    cxLblEndereco.Caption := dm.cdsClientesENDERECO.AsString+','+
                             dm.cdsClientesNUMERO.AsString;
//    cxLblMunicipio.Caption := dm.cdsClientes.AsString;
    cxLblCnpj.Caption := dm.cdsClientesCNPJ.AsString;
    cxLblBairro.Caption := dm.cdsClientesBAIRRO.AsString;
    cxLblFone.Caption := dm.cdsClientesTELEFONE.AsString;
    dm.cdsClientes.Filtered := False;
    dm.cdsClientes.Filter := '';
  end;
end;

procedure TfrmPedidos.cxGridProdutosDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if not dm.cdsPedidos_Itens.Active then
      dm.cdsPedidos_Itens.Active := true;

    if dm.cdsPedidos_Itens.State = dsInsert then
    begin
      dm.cdsPedidos_ItensID_PEDIDO.AsInteger := dm.cdsPedidosID_PEDIDO.AsInteger;
      dm.cdsPedidos_ItensID_PRODUTO.AsInteger := dm.cdsProdutosPRO_ID.AsInteger;
      dm.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString := dm.cdsProdutosPRO_DESCRICAO.AsString;
      dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat := dm.cdsProdutosPRECO_VENDA.AsFloat;
      cxDBTQuantidade.SetFocus;
    end;
  end;
end;

procedure TfrmPedidos.cxtsclientesShow(Sender: TObject);
begin
  cxGridClientes.SetFocus;
end;

procedure TfrmPedidos.cxtspedidosShow(Sender: TObject);
begin
  cxGridPedidos.SetFocus;
end;

procedure TfrmPedidos.FormShow(Sender: TObject);
var
   Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'ALTERAR PRECO VENDA PEDIDO') then
    cxDBTValorUnitario.Properties.ReadOnly := True
  else
    cxDBTValorUnitario.Properties.ReadOnly := False;

  cxPCPrincipal.Visible := False;
  cxTSPesquisa.Caption := '';
  cxTSInserirDados.Caption := '';
  cxTSPesquisa.TabVisible := False;
  cxtspedidos.Caption := '';
  cxtspedidos.TabVisible := False;
  cxtsclientes.Caption := '';
  cxtsclientes.TabVisible := False;
  cxTSInserirDados.TabVisible := False;
  cxLblRazaosocial.Caption := '';
  cxLblEndereco.Caption := '';
  cxLblMunicipio.Caption := '';
  cxLblCnpj.Caption := '';
  cxLblBairro.Caption := '';
  cxLblFone.Caption := '';
  FreeAndNil(Conexao);
  cxbtnPesquisaClick(Self);
  if not dm.cdsPedidos.Active then
  begin
    dm.cdsPedidos.Active := True;
    dm.cdsPedidos_Itens.Active := True;
  end
  else
  begin
    dm.cdsPedidos.Close;
    dm.cdsPedidos.Open;
    dm.cdsPedidos_Itens.close;
    dm.cdsPedidos_Itens.Filtered := False;
    dm.cdsPedidos_Itens.Filter := '';
    dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
    dm.cdsPedidos_Itens.Open;
  end;
end;

procedure TfrmPedidos.GridPanel1Click(Sender: TObject);
//var
//  i: Integer;
//  s: String;
begin
{
  //set title and subtitle
  if Pos('Item', TControl(Sender).Name) > 0 then begin
    if Sender.ClassName = 'TImage' then begin
      i := Length(TControl(Sender).Name) - Length('ItemImage') - 1;
      s := Copy(TControl(Sender).Name, Length(TControl(Sender).Name) - i, Length(TControl(Sender).Name));
      ItemTitle.Caption := TLabel(TForm1.FindComponent('ItemTitle' + s)).Caption;
      ItemSubtitle.Caption := TLabel(TForm1.FindComponent('ItemSubTitle' + s)).Caption;
    end else if Pos('ItemSubTitle', TControl(Sender).Name) > 0 then begin
      ItemSubtitle.Caption := TLabel(Sender).Caption;
      i := Length(TControl(Sender).Name) - Length('ItemSubTitle') - 1;
      s := Copy(TControl(Sender).Name, Length(TControl(Sender).Name) - i, Length(TControl(Sender).Name));
      ItemTitle.Caption := TLabel(TForm1.FindComponent('ItemTitle' + s)).Caption;
    end else if Pos('ItemDescription', TControl(Sender).Name) > 0 then begin
      i := Length(TControl(Sender).Name) - Length('ItemDescription') - 1;
      s := Copy(TControl(Sender).Name, Length(TControl(Sender).Name) - i, Length(TControl(Sender).Name));
      ItemTitle.Caption := TLabel(TForm1.FindComponent('ItemTitle' + s)).Caption;
      ItemSubtitle.Caption := TLabel(TForm1.FindComponent('ItemSubTitle' + s)).Caption;
    end else begin
      ItemTitle.Caption := TLabel(Sender).Caption;
      i := Length(TControl(Sender).Name) - Length('ItemTitle') - 1;
      s := Copy(TControl(Sender).Name, Length(TControl(Sender).Name) - i, Length(TControl(Sender).Name));
      ItemSubTitle.Caption := TLabel(TForm1.FindComponent('ItemSubTitle' + s)).Caption;
    end;
  end;
  }
end;

procedure TfrmPedidos.ImportarCSV(sPedido, sItemPed: string);
var
  ArquivoCSV,ArquivoCSVItem: TextFile;
  Contador, I: Integer;
  Linha, LinhaItem: String;
  Lista, ListaItem: TStringList;
  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then
        break;
      ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := ValorMontado;
  end;
begin
  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, sPedido);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);

    Reset(ArquivoCSVItem);
    Readln(ArquivoCSVItem, LinhaItem);

    Lista:= TStringList.Create;
    Lista.LoadFromFile(sPedido);

    ListaItem:= TStringList.Create;
    ListaItem.LoadFromFile(sItemPed);

    Contador := 1;
    Gauge1.Visible := true;
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := Lista.Count + ListaItem.Count;

    while not Eoln(ArquivoCSV) do
    begin
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'INSERT INTO PEDVENDA (PEDIDO,STATUS,NOME,COD_USUARIO,COD_CESTA,EMAIL,FRETE,TOTAL,DATA)' +
      ' VALUES ('+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+ QuotedStr(MontaValor)+','+
      QuotedStr(MontaValor)+','+ QuotedStr(MontaValor)+','+ QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+')';
      DM.cdsGenerico.Execute;
      Readln(ArquivoCSV, Linha);
      Contador := Contador + 1;
      Gauge1.Progress := Contador;
    end;

    while not Eoln(ArquivoCSVItem) do
    begin
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'INSERT INTO ITEMPED (COD_CESTA,COD_PROD,CODIGO,PRODUTO,CESTAPRECO,QTD,COD_PED)' +
      ' VALUES ('+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+
      QuotedStr(MontaValor)+','+ QuotedStr(MontaValor)+','+ QuotedStr(MontaValor)+','+ QuotedStr(MontaValor)+')';
      DM.cdsGenerico.Execute;
      Readln(ArquivoCSVItem, LinhaItem);
      Contador := Contador + 1;
      Gauge1.Progress := Contador;
    end;

    try
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'INSERT INTO PEDIDOS '+
         '(ID_PEDIDO, STATUS, DATA_PEDIDO, ID_CLIENTE, NUMERO_COMANDA,'+
         ' NOME_CLIENTE,  VALOR_TOTAL, VALOR_FRETE) '+
         'SELECT CAST(PEDIDO AS INTEGER), STATUS,'+
         '       CAST(SUBSTRING(DATA FROM 1 FOR 10) AS DATE),'+
         '       COD_USUARIO,'+
         '  CAST(PEDIDO AS INTEGER), '+
         '  NOME, CAST(TOTAL AS NUMERIC), FRETE)'+
         '  FROM PEDVENDA P '+
         ' INNER JOIN ITEMPED I ON (I.COD_PED = P.PEDIDO) '+
         ' WHERE NOT EXISTS(SELECT 1 FROM PEDIDOS WHERE PED = I.ID_PEDIDO)';
      DM.cdsGenerico.Execute;

      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'INSERT INTO PEDIDOS_ITENS ( ID_PEDIDO_ITEM, ID_PEDIDO, ID_PRODUTO, DESCRICAO_PRODUTO,'+
                                    'QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL)'+
      'SELECT GEN_ID(NOVO_PEDIDO_ITEM, 1),'+
             'CAST(COD_PED AS INTEGER) PED,'+
             'CAST(COD_PROD AS INTEGER), PRODUTO,'+
             'CAST(QTD AS NUMERIC(15,2)),'+
             'CAST(REPLACE(REPLACE(CESTAPRECO,''.000'',''''),''.'','''') AS NUMERIC),'+
             'CAST(QTD AS NUMERIC(15,2)) * CAST(REPLACE( REPLACE(CESTAPRECO,''.000'',''''),''.'','''') AS NUMERIC)'+
       ' FROM ITEMPED '+
       'WHERE NOT EXISTS(SELECT 1 FROM PEDIDOS_ITENS WHERE ID_PEDIDO = PED)';
      DM.cdsGenerico.Execute;

      MessageDlg('Arquivo foi importado com sucesso!', mtInformation,[mbYes],0);
    except
      MessageDlg('Não foi possível importar tabela de produtos!', mtError,[mbYes],0);
    end;
  finally
    Gauge1.Visible := false;
    CloseFile(ArquivoCSV);
  end;
end;

procedure TfrmPedidos.BackToMainForm(Sender: TObject);
begin
  Close;
//  Hide;
//  SplitForm.BringToFront;
end;

end.
