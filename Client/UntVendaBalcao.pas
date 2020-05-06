unit UntVendaBalcao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Vcl.Buttons,
  Vcl.StdCtrls, cxTextEdit, cxMemo, Vcl.ExtCtrls,
  ACBrBase, datasnap.dbclient, VDODmPrinter, VDOBasePrinter, VDOPrinter,
  VDOCaPrinter, ACBrNFe, ACBrNFeDANFEClass, ACBrNFeDANFEFR, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, Vcl.Menus, cxButtons,
  cxGroupBox, cxLabel, Vcl.Imaging.pngimage,UITypes,ACBrDFeSSL,ACBrECFClass,
  ACBrECF, ACBrSATExtratoClass, ACBrSATExtratoESCPOS, ACBrECFVirtual,
  ACBrECFVirtualBuffer, ACBrECFVirtualPrinter, ACBrECFVirtualSAT, ACBrSAT,
  ACBrPosPrinter,pcnConversao,AcbrUtil,ACBrSATClass, ACBrIntegrador,
  Vcl.OleCtrls, SHDocVw, Vcl.ComCtrls, ACBrSATExtratoReportClass,
  ACBrSATExtratoFortesFr, RLFilters, RLPDFFilter, ACBrDFeReport// RLPDFFilter,
  ;

type
  TfrmVendasBalcao = class(TForm)
    SPBIniciarVenda: TSpeedButton;
    spbCancelarItem: TSpeedButton;
    spbCancelarVenda: TSpeedButton;
    spbConfirmarVenda: TSpeedButton;
    spbConfirmarItem: TSpeedButton;
    spbCapturarVenda: TSpeedButton;
    spbImprimirCupom: TSpeedButton;
    spbCancelarCupomFiscal: TSpeedButton;
    spbVenderItem: TSpeedButton;
    spbFecharCupom: TSpeedButton;
    spbReducaoZ: TSpeedButton;
    spbCarregarAliquotas: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    VDOCaPrinter1: TVDOCaPrinter;
    spbCapturarDiversasComandas: TSpeedButton;
    spbConsultarPreco: TSpeedButton;
    Panel1: TPanel;
    Image2: TImage;
    Label6: TLabel;
    spbRetirada: TcxButton;
    spbAbrirCaixa: TcxButton;
    spbReforco: TcxButton;
    spbFecharCaixa: TcxButton;
    spbEfetuarPagamentoCliente: TcxButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxMemo1: TcxMemo;
    Label10: TLabel;
    Image1: TImage;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    img1: TImage;
    edtPesquisa: TEdit;
    edtQuantidade: TEdit;
    edtPreco: TEdit;
    edtPrecoTotal: TEdit;
    edtSubTotal: TEdit;
    edtDescricao: TEdit;
    lbl9: TLabel;
    btnTestarImpressao: TcxButton;
    Label9: TLabel;
    edtDesconto: TEdit;
    cxExtrato: TcxButton;
    cxButton1: TcxButton;
    ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS;
    ACBrECF1: TACBrECF;
    ACBrPosPrinter1: TACBrPosPrinter;
    mVendaEnviar: TcxMemo;
    RLPDFFilter1: TRLPDFFilter;
    ACBrSATExtratoFortes1: TACBrSATExtratoFortes;
    ACBrSAT1: TACBrSAT;
    procedure SPBIniciarVendaClick(Sender: TObject);
    procedure edtPesquisaExit(Sender: TObject);
    procedure spbConfirmarItemClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure cxMemo1PropertiesChange(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrecoTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtPrecoTotalExit(Sender: TObject);
    procedure spbConfirmarVendaClick(Sender: TObject);
    procedure spbCancelarItemClick(Sender: TObject);
    procedure spbCancelarVendaClick(Sender: TObject);
    procedure spbCapturarVendaClick(Sender: TObject);
    procedure spbImprimirCupomClick(Sender: TObject);
    procedure spbCancelarCupomFiscalClick(Sender: TObject);
    procedure spbVenderItemClick(Sender: TObject);
    procedure spbFecharCupomClick(Sender: TObject);
    procedure spbReducaoZClick(Sender: TObject);
    procedure spbCarregarAliquotasClick(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ImprimirCupomTassim(qFormaPagamento:string;qValorPago:Real);
    function AlinharADireita(qTexto:string;quantasCasas:integer):string;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbCapturarDiversasComandasClick(Sender: TObject);
    procedure spbConsultarPrecoClick(Sender: TObject);
    procedure spbGerarNFeClick(Sender: TObject);
    procedure spbAbrirCaixaClick(Sender: TObject);
    procedure spbReforcoClick(Sender: TObject);
    procedure spbRetiradaClick(Sender: TObject);
    procedure spbFecharCaixaClick(Sender: TObject);
    procedure spbEfetuarPagamentoClienteClick(Sender: TObject);
    procedure cxMemo2PropertiesChange(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AjustarAcbrSat;
    procedure GerarCupomSat(var mmSat : Tcxmemo);
    procedure ExcluirParcelamentoPedido(qPedido: integer);
    procedure ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
    procedure ACBrSAT1GetsignAC(var Chave: AnsiString);
    procedure ExtornarItem(qPedido: Integer);
    procedure btnTestarImpressaoClick(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure cxExtratoClick(Sender: TObject);
    procedure edtDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
    procedure ACBrSAT1MensagemSEFAZ(ACod: Integer; AMensagem: string);

  private
    { Private declarations }
    vStatusVenda : boolean;
    vLinhaInicialMemo,vTipoVenda:string;
    cdsProdutos : TClientDataSet;
    aIdentificadoresPedido : array of integer;

  public
    { Public declarations }
    Function GetImpressora: string;

  end;

var
  frmVendasBalcao: TfrmVendasBalcao;

implementation

{$R *.dfm}

uses UDataModul, UntConectaServidor, UProceduresClient, ULogin, UntLookUp,
  UntLookUpClientes, URelatorios, GroupedItems1, UntVendedores,
  UntLookUpVendedores, UntLookUpProdutos, UntLookUpFormasPagamentos,Printers, UntMovimentacao;

procedure TfrmVendasBalcao.ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := frmLogin.pCodigoAtivacao;
end;

procedure TfrmVendasBalcao.ACBrSAT1GetsignAC(var Chave: AnsiString);
begin
  Chave := frmLogin.pAssinatura;
end;

procedure TfrmVendasBalcao.ACBrSAT1MensagemSEFAZ(ACod: Integer;
  AMensagem: string);
begin
  MessageDlg( IntToStr(ACod)+'-'+AMensagem, mtWarning, [mbOK], 0);
end;

procedure TfrmVendasBalcao.AjustarAcbrSat;
begin
  with ACBrSAT1 do
   begin
     Modelo  := TACBrSATModelo(2) ;
     NomeDLL := frmLogin.pCaminhoDllSat;
     Config.ide_numeroCaixa := StrToInt(frmLogin.pNumeroCaixa);
     Config.ide_tpAmb       := TpcnTipoAmbiente(frmLogin.pTipoAmbienteSat);
     Config.ide_CNPJ        := frmLogin.pCNPJSoftwareHouse;
     Config.emit_CNPJ       := frmLogin.pCNPJEmitente;
     Config.emit_IE         := frmLogin.pInscricaoEstadual;
     Config.emit_IM         := frmLogin.pInscricaoMunicipal;
     Config.emit_cRegTrib      := TpcnRegTrib(frmLogin.pRegimeTributario) ;
     Config.emit_cRegTribISSQN := TpcnRegTribISSQN(frmLogin.pTributacaoISSQN) ;
     Config.emit_indRatISSQN   := TpcnindRatISSQN(frmLogin.pIndRatISSQN) ;
     // Config.PaginaDeCodigo     := sePagCod.Value;
     Config.EhUTF8 := True;
     Config.infCFe_versaoDadosEnt := StringToFloatDef('0.08', cversaoDadosEnt);
     Config.ArqSchema := ExtractFilePath(Application.ExeName)+'Schemas\CfeDadosVendaAPL_0008.xsd';
     //Config.XmlSignLib := TSSLXmlSignLib(2);
     //ConfigArquivos.SalvarCFe := True;
     //ConfigArquivos.SalvarEnvio := True;
     //ConfigArquivos.PastaCFeVenda:= ExtractFilePath(Application.ExeName)+'xml\CfeVenda';
     //ConfigArquivos.PastaEnvio:= ExtractFilePath(Application.ExeName)+'xml\CfeEnvio';
     //     PastaCFeVenda := ExtractFilePath(Application.ExeName)+'CfeVenda';
     //     PastaCFeCancelamento := ExtractFilePath(Application.ExeName)+'CfeCancelamento';
   end;
end;

function TfrmVendasBalcao.AlinharADireita(qTexto: string;
  quantasCasas: integer): string;
var
  I : integer;
  vTexto : string;
  vValorReal : integer;
begin
  vTexto := '';
  vValorReal := quantasCasas - Length(qTexto);
  if vValorReal > 0 then
  begin
    for I := 1 to vValorReal do
    begin
      vTexto := vTexto + ' ';
    end;
    Result := vTexto + qTexto;
  end
  else
    Result := qTexto;
end;

procedure TfrmVendasBalcao.spbAbrirCaixaClick(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  try
    Conexao.EfetuarAberturaDoCaixa(StrToInt(frmLogin.pNumeroCaixa),
                                   Conexao.RetornaIdentificadorUsuario(frmLogin.pNomeUsuario),0);
    frmLogin.pMovimentaCaixa := True;
    spbFecharCaixa.Enabled := True;
    spbAbrirCaixa.Enabled := False;
    spbReforco.Enabled := true;
    spbRetirada.Enabled := true;
    spbEfetuarPagamentoCliente.Enabled := True;
    MessageDlg('Abertura efetuada com sucesso',mtWarning,[mbOk],0);
  except
    MessageDlg('Não foi possível efetuar abertura do caixa',mtWarning,[mbOk],0);
    frmLogin.pMovimentaCaixa := False;
    spbFecharCaixa.Enabled := False;
    spbAbrirCaixa.Enabled := True;
    spbReforco.Enabled := False;
    spbRetirada.Enabled := False;
    spbEfetuarPagamentoCliente.Enabled := False;
  end;
  FreeAndNil(Conexao);
end;

procedure TfrmVendasBalcao.spbReforcoClick(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
  vValor : Double;
  vTexto : string;
begin
  vTexto := Trim(inputBox('Reforço caixa','Informe o valor ',''));
  if vTexto = '' then
    abort;
  try
    vValor := StrToFloat( stringReplace( vTexto,'.','',[] ) );
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    try
      vTexto := AnsiUpperCase(InputBox('Reforço','Motivo da movimentação',''));
      Conexao.MovimentarCaixa(StrToInt(frmlogin.pNumeroCaixa),
                              Conexao.RetornaIdentificadorUsuario(frmLogin.pNomeUsuario),0,
                              'C',vTexto,'Movimentação do caixa (Reforço)',vValor);
    MessageDlg('Reforço efetuado com sucesso',mtWarning,[mbOk],0);
    except
      MessageDlg('Não foi possível efetuar reforço do caixa',mtWarning,[mbOk],0);
    end;
    FreeAndNil(Conexao);
  except
    showmessage('Valor inválido');
  end;
end;

procedure TfrmVendasBalcao.spbRetiradaClick(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
  vValor : Double;
  vTexto : string;
begin
  vTexto := Trim(inputBox('Retirada caixa','Informe o valor ',''));
  if vTexto = '' then
    abort;
  try
    vValor := StrToFloat( stringReplace( vTexto,'.','',[] ) );
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    try
      vTexto := AnsiUpperCase(InputBox('Retirada','Motivo da movimentação',''));
      Conexao.MovimentarCaixa(StrToInt(frmlogin.pNumeroCaixa),
                              Conexao.RetornaIdentificadorUsuario(frmLogin.pNomeUsuario),0,
                              'D',vTexto,'Movimentação do caixa (Retirada)',vValor);
    MessageDlg('Retirada efetuada com sucesso',mtWarning,[mbOk],0);
    except
      MessageDlg('Não foi possível efetuar retirada do caixa',mtWarning,[mbOk],0);
    end;
    FreeAndNil(Conexao);
  except
    showmessage('Valor inválido');
  end;
end;

procedure TfrmVendasBalcao.spbFecharCaixaClick(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  try
    Conexao.EftuarFechamentoDoCaixa(StrToInt(frmlogin.pNumeroCaixa),
                                    Conexao.RetornaIdentificadorUsuario(frmLogin.pNomeUsuario),0);
    frmLogin.pMovimentaCaixa := False;
    spbFecharCaixa.Enabled := False;
    spbAbrirCaixa.Enabled := True;
    spbReforco.Enabled := False;
    spbRetirada.Enabled := False;
    spbEfetuarPagamentoCliente.Enabled := False;
    MessageDlg('Fechamento efetuado com sucesso',mtWarning,[mbOk],0);
  except
    MessageDlg('Não foi possível efetuar fechamento do caixa',mtWarning,[mbOk],0);
    frmLogin.pMovimentaCaixa := True;
    spbFecharCaixa.Enabled := True;
    spbAbrirCaixa.Enabled := False;
    spbReforco.Enabled := True;
    spbRetirada.Enabled := True;
    spbEfetuarPagamentoCliente.Enabled := True;
  end;
  FreeAndNil(Conexao);
end;

procedure TfrmVendasBalcao.btnTestarImpressaoClick(Sender: TObject);
var
  memo : TMemo;
begin
  try
    try
      memo := TMemo.Create(Self);
      memo.Parent := Self.Parent;
      memo.Visible := False;
      Memo.Left := -1000;
      Memo.lines.Clear;
      Memo.lines.Add('</fn></ce><n>Extrato No. 000000');
      Memo.lines.Add(ACBrStr('CUPOM FISCAL ELETRÔNICO - SAT</n>'));
      Memo.lines.Add(' ');
      Memo.lines.Add(' = T E S T E =');
      Memo.lines.Add(' ');
      Memo.lines.Add(StringOfChar('>',48));
      Memo.lines.Add(StringOfChar('>',48));
      Memo.lines.Add(StringOfChar('>',48));
      ACBrPosPrinter1.Imprimir(Memo.Text);
    except on e:Exception do
      begin
        ShowMessage('Erro gerado : '+e.Message);
      end;
    end;
  finally
    if Assigned(memo) then
    begin
      FreeAndNil(memo);
    end;
  end;
end;

procedure TfrmVendasBalcao.cxButton1Click(Sender: TObject);
var
  vDataInicial,vDataFinal,vString : string;
  vData : TDateTime;
  Rel : TfrmMovimentacao;
begin
  try
    vDataInicial := Trim(InputBox('Data inicial','Informe a data inicial'+#13+
                             'ex: xx/xx/xxxx',''));
    if vDataInicial <> '' then
      vData := StrToDate(vDataInicial);
  except on e:Exception do
    begin
      showmessage('Valor digitado é inválido'+#13+e.Message);
      abort;
    end;
  end;

  try
     vDataFinal := Trim(InputBox('Data final','Informe a data final'+#13+
                             'ex: xx/xx/xxxx',''));
    if vDataFinal <> '' then
      vData := StrToDate(vDataFinal);
  except on e:Exception do
    begin
      showmessage('Valor digitado é inválido'+#13+e.Message);
      abort;
    end;
  end;

  vDataInicial := stringReplace(vDataInicial,'/','.',[]);
  vDataFinal := stringReplace(vDataFinal,'/','.',[]);

  vString:= 'SELECT M.ID_PEDIDO, M.ID_PRODUTO,IT.DESCRICAO_PRODUTO,M.DATA,M.HORA, M.QTDE_ANTERIOR, M.QTDE_MOVIMENTADA,M.TIPO_MOVIMENTACAO '+
            '  FROM MOVIMENTACOES M '+
            '  LEFT OUTER JOIN PEDIDOS P ON P.ID_PEDIDO = M.ID_PEDIDO '+
            '  LEFT OUTER JOIN PEDIDOS_ITENS IT ON IT.ID_PEDIDO = P.ID_PEDIDO AND IT.ID_PRODUTO = M.ID_PRODUTO '+
            ' WHERE M.DATA >= '+ QuotedStr(vDataInicial) + ' and M.DATA <= ' + QuotedStr(vDataFinal);

  if not Assigned(Rel) then
    Rel := TfrmMovimentacao.Create(Self);


  Rel.cdsRelatorioGerencial.Close;
  Rel.cdsRelatorioGerencial.CommandText := vString;
  Rel.cdsRelatorioGerencial.Open;
  Rel.QRRelatorioGerencial.Preview;
  FreeAndNil(Rel);
end;

procedure TfrmVendasBalcao.cxExtratoClick(Sender: TObject);
var
  ///vString,
  //vNome,vCpf,vEndereco,Aliquota,vPermiteTroco,
  //vEfetuaMovimentacaoCliente,vTexto,vTextoAux : string;
  //vContador,vFormaPagamento,vContadorCPF:integer;
  //vSomaValorTotal,vValorPago,vLimiteCliente : Real;
//  vConectaServidor : TDSModuleDbClient;
  //iRetorno : integer;
//  LookUp : TfrmLookUp;
  //vCPFCorreto : boolean;
  //meuClient : TClientDataSet;
  //I: Integer;
  //TotalItem,TotalGeralItem:Double;
  memo : TcxMemo;
begin
  DM.OpenDialog1.Title:='Escolha um arquivo xml para emitir a 2ª via do extrato';
  DM.OpenDialog1.filter:='Arquivos XML (*.xml)|*.xml|Todos os arquivos|*.*';
  if DM.OpenDialog1.Execute then
  begin
    ACBrSAT1.CFe.Clear;
    ACBrSAT1.CFe.IdentarXML := True;
    ACBrSAT1.CFe.TamanhoIdentacao := 3;
    AjustarAcbrSat;
    ACBrSAT1.InicializaCFe ;
    ACBrSAT1.CFe.LoadFromFile(DM.OpenDialog1.FileName);
    memo := TcxMemo.Create(Self);
    memo.Parent := Self.Parent;
    memo.Visible := False;

    memo.Lines.Clear;
    memo.Lines.Text := ACBrSAT1.CFe.AsXMLString;

    (*ACBrPosPrinter1.Device.Baud := 115200;
    ACBrPosPrinter1.ColunasFonteNormal := 48;
    ACBrPosPrinter1.EspacoEntreLinhas := 0;
    ACBrPosPrinter1.LinhasEntreCupons := 0;
    ACBrPosPrinter1.ConfigQRCode.Tipo := 2;
    ACBrPosPrinter1.ConfigQRCode.LarguraModulo := 4;
    ACBrPosPrinter1.ConfigQRCode.ErrorLevel := 0;
    ACBrPosPrinter1.ConfigLogo.KeyCode1 := 32;
    ACBrPosPrinter1.ConfigLogo.KeyCode2 := 32;
    ACBrPosPrinter1.ConfigLogo.FatorX := 1;
    ACBrPosPrinter1.ConfigLogo.FatorY := 1;
    ACBrPosPrinter1.ConfigBarras.LarguraLinha := 0;
    ACBrPosPrinter1.ConfigBarras.Altura := 0;
    ACBrPosPrinter1.ConfigBarras.MostrarCodigo := False;*)
    //GerarCupomSat(memo);
    //ACBrPosPrinter1.Imprimir(memo.Text);
    ACBrSATExtratoFortes1.Impressora:= GetImpressora;
    ACBrSATExtratoFortes1.LarguraBobina       := 286;
    ACBrSATExtratoFortes1.MargemSuperior      := 0;
    ACBrSATExtratoFortes1.MargemInferior    := 0;
    ACBrSATExtratoFortes1.MargemEsquerda := 4;
    ACBrSATExtratoFortes1.MargemDireita     := 2;

    ACBrSAT1.Extrato := ACBrSATExtratoFortes1;
    ACBrSAT1.Extrato.ImprimeQRCode:= false;
    //ACBrSAT1.Extrato.ImprimeMsgOlhoNoImposto:= true;
    ACBrSAT1.Extrato.ImprimeDescAcrescItem:= true;
    ACBrSAT1.Extrato.ImprimeEmUmaLinha:= true;
            //ACBrSAT1.Extrato.
            //ACBrSATExtratoFortes1.MostrarPreview   := true;
    ACBrSAT1.ImprimirExtrato;
  end;
end;

procedure TfrmVendasBalcao.cxMemo1PropertiesChange(Sender: TObject);
begin
  if vStatusVenda  = False then
  begin
    cxMemo1.Lines.Clear;
  end;
end;

procedure TfrmVendasBalcao.cxMemo2PropertiesChange(Sender: TObject);
begin
  if vStatusVenda  = False then
  begin
    cxMemo1.Lines.Clear;
  end;
end;

procedure TfrmVendasBalcao.edtDescontoExit(Sender: TObject);
var
  vDesconto: real;
  vTeste : string;
begin
  if vStatusVenda then
  begin
    vTeste := Copy(edtDesconto.Text,1,1);
    if vTeste <> '' then
    begin
      if not (vTeste[1] in ['0'..'9']) then
      begin
        showmessage('Valor digitado é inválido');
        edtDesconto.SetFocus;
      end
      else
      begin
        try
          if edtDesconto.Text <> '' then
            edtSubTotal.Text := FormatFloat('###,###,##0.00',StrToFloat( stringReplace(edtPrecoTotal.Text,'.','',[]) ) - StrToFloat( stringReplace(edtDesconto.Text,'.','',[]) ) )
          else
            edtSubTotal.Text := FormatFloat('###,###,##0.00',StrToFloat( stringReplace(edtPrecoTotal.Text,'.','',[]) ) );

        except
          edtSubTotal.Text:= FormatFloat('###,###,##0.00',0);
        end;
      end;
    end;
  end;
end;

procedure TfrmVendasBalcao.edtDescontoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    edtPrecoTotal.SetFocus;
end;

procedure TfrmVendasBalcao.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmVendasBalcao.edtPesquisaExit(Sender: TObject);
begin
  if vStatusVenda then
  begin
    if Trim(edtPesquisa.Text) <> '' then
    begin
      cdsProdutos.Close;
      cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_EAN13 = '+QuotedStr(edtPesquisa.Text)+
                               ' OR PRO_CODIGO = '+QuotedStr(edtPesquisa.Text);
      cdsProdutos.Active := True;
      if cdsProdutos.RecordCount = 0 then
      begin
        //Escolhendo o produto
        if not Assigned(FrmLookUpProdutos) then
          FrmLookUpProdutos := TFrmLookUpProdutos.Create(Self);
        FrmLookUpProdutos.Left := Trunc(Screen.Width / 2) - 200;
        FrmLookUpProdutos.Top := Trunc(Screen.Height / 2) - 200;
        if not DM.cdsProdutos.Active then
          dm.cdsProdutos.Active := True;
        FrmLookUpProdutos.edtProdutos.Text := edtPesquisa.Text;
        FrmLookUpProdutos.ShowModal;

        if dm.cdsProdutosPRO_ID.AsInteger = 0 then
        begin
          showmessage('Produto não encontrado');
          edtPesquisa.Clear;
          FreeAndNil(FrmLookUpProdutos);
          abort;
        end
        else
        begin
          cdsProdutos.Close;
          cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_ID = '+IntToStr(dm.cdsProdutosPRO_ID.AsInteger);
          cdsProdutos.Active := True;
          edtPesquisa.Text := dm.cdsProdutos.FieldByName('PRO_CODIGO').AsString;
          edtDescricao.Text := dm.cdsProdutos.FieldByName('PRO_DESCRICAO').AsString;
          edtPreco.Text := FormatFloat('###,###,##0.00',dm.cdsProdutos.FieldByName('PRECO_VENDA').AsFloat);
          if dm.cdsProdutos.FieldByName('PRO_CAMINHO_IMAGEM').AsString = '' then
            Image1.Visible := False
          else
          begin
            if FileExists(dm.cdsProdutos.FieldByName('PRO_CAMINHO_IMAGEM').AsString) then
            begin
              Image1.Visible := True;
              try
                Image1.Picture.LoadFromFile(dm.cdsProdutos.FieldByName('PRO_CAMINHO_IMAGEM').AsString);
              except
              end;
            end
            else
              Image1.Visible := False;
          end;
          edtQuantidade.SetFocus;
          FreeAndNil(FrmLookUpProdutos);
        end;
      end
      else
      begin
        edtDescricao.Text := cdsProdutos.FieldByName('PRO_DESCRICAO').AsString;
        edtPreco.Text := FormatFloat('###,###,##0.00',cdsProdutos.FieldByName('PRECO_VENDA').AsFloat);
        if cdsProdutos.FieldByName('PRO_CAMINHO_IMAGEM').AsString = '' then
          Image1.Visible := False
        else
        begin
          if FileExists(cdsProdutos.FieldByName('PRO_CAMINHO_IMAGEM').AsString) then
          begin
            Image1.Visible := True;
            try
              Image1.Picture.LoadFromFile(cdsProdutos.FieldByName('PRO_CAMINHO_IMAGEM').AsString);
            except
            end;
          end
          else
            Image1.Visible := False;
        end;
        edtQuantidade.SetFocus;
      end;
    end
    else
      edtPesquisa.SetFocus;
  end;
end;

procedure TfrmVendasBalcao.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if vStatusVenda then
      edtQuantidade.SetFocus
    else
    begin
      showmessage('Venda não foi iniciada');
      edtPesquisa.Clear;
      edtPesquisa.SetFocus;
    end;
  end;
end;

procedure TfrmVendasBalcao.edtPrecoExit(Sender: TObject);
var
  vPrecoTotal:real;
  vTeste : string;
begin
  if vStatusVenda then
  begin
    vTeste := Copy(edtPreco.Text,1,1);
    if vTeste <> '' then
    begin
      if not (vTeste[1] in ['0'..'9']) then
      begin
        showmessage('Valor digitado é inválido');
        edtPreco.SetFocus;
      end
      else
      begin
        try
          vPrecoTotal := StrToFloat( stringReplace(edtQuantidade.Text,'.','',[]) ) * StrToFloat( stringReplace(edtPreco.Text,'.','',[]) );
          edtPrecoTotal.Text := FormatFloat('###,###,##0.00',vPrecoTotal);
        except
          edtPrecoTotal.Text := '';
        end;
      end;
    end;
  end
  else
  begin
    showmessage('Venda não foi iniciada');
    edtPesquisa.Clear;
    if edtPesquisa.CanFocus then
      edtPesquisa.SetFocus;
  end;
end;

procedure TfrmVendasBalcao.edtPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    edtDesconto.SetFocus;
end;

procedure TfrmVendasBalcao.edtPrecoTotalExit(Sender: TObject);
begin
  if vStatusVenda then
    spbConfirmarItemClick(Self)
  else
  begin
    try
      edtPesquisa.Clear;
      edtPesquisa.SetFocus;
    except
    end;
  end;
end;

procedure TfrmVendasBalcao.edtPrecoTotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    edtSubTotal.SetFocus;
end;

procedure TfrmVendasBalcao.edtQuantidadeExit(Sender: TObject);
var
  vTeste : string;
begin
  if vStatusVenda then
  begin
    vTeste := Copy(edtQuantidade.Text,1,1);
    if vTeste = '' then
    begin
      showmessage('Por favor, informe a quantidade');
      edtQuantidade.SetFocus;
    end
    else
    begin
      try
        if (vTeste[1] in ['0'..'9']) then
        begin
          if Trim(edtPreco.Text) <> '' then
            edtPrecoTotal.Text := FormatFloat('###,###,##0.00',StrToFloat( stringReplace(edtQuantidade.Text,'.','',[]) ) * StrToFloat( stringReplace(edtPreco.Text,'.','',[]) ));
        end;
      except
        edtPrecoTotal.Text := '';
      end;
    end;
  end;
end;

procedure TfrmVendasBalcao.edtQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    edtPreco.SetFocus;
end;

procedure TfrmVendasBalcao.ExcluirParcelamentoPedido(qPedido: integer);
begin
  if not dm.cdsGenerico.Active then
    dm.cdsGenerico.Active := True;
  dm.cdsGenerico.Close;
  dm.cdsGenerico.CommandText := 'DELETE FROM PEDIDOS_FORMAS_CONDICOES WHERE ORIGEM = 0 AND ID_PEDIDO = '+IntToStr(qPedido);
  dm.cdsGenerico.Execute;
end;

procedure TfrmVendasBalcao.ExtornarItem(qPedido: Integer);
var
  vConectaServidor : TDSModuleDbClient;
begin
  DM.cdsGenerico.Close;
  DM.cdsGenerico.CommandText := 'SELECT ID_PRODUTO,QUANTIDADE FROM PEDIDOS_ITENS WHERE ID_PEDIDO = '+InttoStr(qPedido);
  DM.cdsGenerico.Open;
  DM.cdsGenerico.First;

  vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  while not DM.cdsGenerico.Eof do
  begin
    if vConectaServidor.InserirEmMovimentacoes(DM.cdsGenerico.FieldByName('ID_PRODUTO').AsInteger,qPedido,
                                               DM.cdsGenerico.FieldByName('QUANTIDADE').AsFloat,'Cancel. Venda','E') = 0 then
    begin
      break;
    end;
    DM.cdsGenerico.Next;
  end;
  FreeAndNil(vConectaServidor);
  DM.cdsGenerico.Close;
end;

procedure TfrmVendasBalcao.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Conexao : TDSModuleDbClient;
begin
  if vStatusVenda then
  begin
    spbCancelarVendaClick(Self);
    vStatusVenda := False;
  end;

  if frmLogin.pNumeroCaixa <> '' then
  begin
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    if Conexao.VerificaCaixaEstaAberto(StrToInt(frmLogin.pNumeroCaixa)) then
    begin
      MessageDlg('Atenção, caixa está aberto'+#13+
                 'Caso esteja efetuando o fechamento da loja,'+#13+
                 'efetue o fechamento do caixa'+#13+
                 'ou o mesmo ficará com movimentação errada.',
                 mtWarning,[mbOK],0);
      FreeAndNil(Conexao);
    end;
  end;
  cxMemo1.Lines.Clear;
  if ACBrSAT1.Inicializado then
    ACBrSAT1.DesInicializar;
end;

procedure TfrmVendasBalcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F1) then
    if (frmLogin.pMovimentaCaixa) then
      SPBIniciarVendaClick(Self)
    else
      MessageDlg('Caixa não está aberto.'+#13+
                 'Efetue a abertura do caixa'+#13+
                 'antes de efetuar venda',mtWarning,[mbOK],0);

  if Key = VK_F3 then
    spbConsultarPrecoClick(Self);

  if Key = VK_F6 then
    spbCapturarVendaClick(Self);

  if Key = VK_F7 then
    spbCancelarCupomFiscalClick(self);


  if (vStatusVenda) and (frmLogin.pMovimentaCaixa)  then
  begin
    if Key = VK_F2 then
      spbCancelarItemClick(Self);

    if Key = VK_F5 then
      spbCancelarVendaClick(Self);

    if Key = VK_F10 then
      spbConfirmarVendaClick(Self);
  end;
end;

procedure TfrmVendasBalcao.FormShow(Sender: TObject);
var
  vValorAliquota,vDescricao, mensagem :string;
  vAliquota : TACBrECFAliquota;
  vFormaPagamento : TACBrECFFormaPagamento;
  meuClient : TClientDataSet;
  Conexao : TDSModuleDbClient;
  TipoAliquota : Char;
begin
//  if AnsiUpperCase(frmLogin.pNomeUsuario) = 'BUSINESS' then
//  begin
//    btnTestarImpressao.Visible := True;
//  end
//  else
//  begin
//    btnTestarImpressao.Visible := False;
//  end;
  if frmLogin.pSat_ECF = 0 then
  begin
    cdsProdutos := TClientDataSet.Create(Self);
    cdsProdutos.ProviderName := DM.cdsProdutos.ProviderName;
    cdsProdutos.RemoteServer := dm.cdsProdutos.RemoteServer;
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'ALTERAR PRECO VENDA CAIXA') then
      edtPreco.ReadOnly := True;

    if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'UTILIZAR CAIXA') then
    begin
      spbFecharCaixa.Visible := False;
      spbReforco.Visible := False;
      spbRetirada.Visible := False;
      spbAbrirCaixa.Visible := False;
      spbEfetuarPagamentoCliente.Enabled := False;
      if frmLogin.pNumeroCaixa <> '' then
      begin
        if not Conexao.VerificaCaixaEstaAberto(StrToInt(frmLogin.pNumeroCaixa)) then
          frmLogin.pMovimentaCaixa := False
        else
          frmLogin.pMovimentaCaixa := True;
      end;
    end
    else
    begin
      if frmLogin.pNumeroCaixa <> '' then
      begin
        if not Conexao.VerificaCaixaEstaAberto(StrToInt(frmLogin.pNumeroCaixa)) then
        begin
          MessageDlg('Atenção, caixa não está aberto'+#13+
                     'Sistema não irá fazer movimentação do caixa'+#13+
                     'até que o mesmo seja aberto',mtWarning,[mbOK],0);
          frmLogin.pMovimentaCaixa := False;
          spbFecharCaixa.Enabled := False;
          spbReforco.Enabled := False;
          spbRetirada.Enabled := False;
          spbEfetuarPagamentoCliente.Enabled := False;
        end
        else
        begin
          frmLogin.pMovimentaCaixa := True;
          spbAbrirCaixa.Enabled := False;
          spbReforco.Enabled := True;
          spbRetirada.Enabled := True;
          spbEfetuarPagamentoCliente.Enabled := True;
        end;
      end;
    end;
    FreeAndNil(Conexao);
    vStatusVenda := False;
    vTipoVenda := '';
    DM.cdsPedidos.Close;
    DM.cdsPedidos.Open;
    //DM.cdsPedidos_Itens.Close;
    //DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := -1;
    //dm.cdsPedidos_Itens.Open;

    dm.cdsPedidos_Itens.close;
    dm.cdsPedidos_Itens.Filtered := False;
    dm.cdsPedidos_Itens.Filter := '';
    dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
    dm.cdsPedidos_Itens.Open;


    if (frmLogin.pModeloImpressora <> '7') and (frmLogin.pModeloImpressora <> '9') then
    begin
      ACBrECF1.Porta := frmLogin.pPortaImpressora;
      ACBrECF1.Modelo := VerificaImpressora;
      ACBrECF1.Operador := frmLogin.pNomeUsuario;
      if not ACBrECF1.Ativo then
        ACBrECF1.Ativar;

      if not dm.cdsFormasDePagamento.active then
        dm.cdsFormasDePagamento.Active := True;

      DM.cdsFormasDePagamento.First;
      while not dm.cdsFormasDePagamento.Eof do
      begin
        try
          vFormaPagamento := ACBrECF1.AchaFPGIndice(IntToStr(DM.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger));
        except
          vFormaPagamento := ACBrECF1.AchaFPGIndice(IntToStr(DM.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger));
        end;
        if vFormaPagamento = nil then
        begin
          vDescricao := DM.cdsFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO.AsString;
          try
            ACBrECF1.ProgramaFormaPagamento(vDescricao,True,
                                            inttostr(DM.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger));
          except on e:exception do
            begin
              MessageDlg('O sistema não conseguiu carregar as formas de pagamento na impressora fiscal',mtError,[mbOK],0);
            end;
          end;
        end;
        DM.cdsFormasDePagamento.Next;
      end;
      if not dm.cdsGenerico.Active then
        dm.cdsGenerico.Active := True;

      dm.cdsGenerico.Close;
      dm.cdsGenerico.CommandText := 'SELECT DISTINCT(ALIQUOTA_ICMS) AS ALIQUOTA_ICMS FROM PRODUTOS ORDER BY ALIQUOTA_ICMS';
      dm.cdsGenerico.Open;
      dm.cdsGenerico.First;
      ACBrECF1.LerTotaisAliquota;
      while not dm.cdsGenerico.Eof do
      begin
        if dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsInteger < 0 then
          vValorAliquota := '0'+IntToStr(dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsInteger)
        else
          vValorAliquota := IntToStr(dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsInteger);

        vAliquota := ACBrECF1.AchaICMSAliquota(StrToFloat( stringReplace( vValorAliquota,'.','',[]) ));
        if vAliquota = nil then
          try
            ACBrECF1.ProgramaAliquota(StrToFloat(stringReplace( vValorAliquota,'.','',[])),'T','');
          except on e:exception do
            begin
              MessageDlg('O sistema não conseguiu programar a alíquota na impressora fiscal'+#13+
                         'Valor informado para a alíquota : '+vValorAliquota+#13+
                         'Erro mencionado pelo sistema : '+e.Message,mtWarning,[mbOK],0);
            end;
          end;
        dm.cdsGenerico.Next;
      end;

      try
        ACBrECF1.TestaPodeAbrirCupom;
      except on e:exception do
        begin
          MessageDlg('O sistema ainda não está preparado para efetuar a abertura do cupom fiscal.'+#13+
                     'Por favor,verifique se foi realizada leitura x e/ou redução Z'+#13+
                      'Erro retornado pelo sistema : '+e.Message+#13+
                      'O sistema não irá funcionar corretamente até que este erro seja corrigido',mtError,[mbOK],0);
        end;
      end;
    end
  end
  else
  begin
    if not ACBrSAT1.Inicializado then
    begin
      mensagem := '';
      vStatusVenda := False;
      vTipoVenda := '';
      cdsProdutos := TClientDataSet.Create(Self);
      cdsProdutos.ProviderName := DM.cdsProdutos.ProviderName;
      cdsProdutos.RemoteServer := dm.cdsProdutos.RemoteServer;
      Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
      if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'ALTERAR PRECO VENDA CAIXA') then
        edtPreco.ReadOnly := True;

      if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'UTILIZAR CAIXA') then
      begin
        spbFecharCaixa.Visible := False;
        spbReforco.Visible := False;
        spbRetirada.Visible := False;
        spbAbrirCaixa.Visible := False;
        spbEfetuarPagamentoCliente.Enabled := False;
        if frmLogin.pNumeroCaixa <> '' then
        begin
          if not Conexao.VerificaCaixaEstaAberto(StrToInt(frmLogin.pNumeroCaixa)) then
            frmLogin.pMovimentaCaixa := False
          else
            frmLogin.pMovimentaCaixa := True;
        end;
      end
      else
      begin
        if frmLogin.pNumeroCaixa <> '' then
        begin
          if not Conexao.VerificaCaixaEstaAberto(StrToInt(frmLogin.pNumeroCaixa)) then
          begin
            MessageDlg('Atenção, caixa não está aberto'+#13+
                       'Sistema não irá fazer movimentação do caixa'+#13+
                       'até que o mesmo seja aberto',mtWarning,[mbOK],0);
            frmLogin.pMovimentaCaixa := False;
            spbFecharCaixa.Enabled := False;
            spbReforco.Enabled := False;
            spbRetirada.Enabled := False;
            spbEfetuarPagamentoCliente.Enabled := False;
          end
          else
          begin
            frmLogin.pMovimentaCaixa := True;
            spbAbrirCaixa.Enabled := False;
            spbReforco.Enabled := True;
            spbRetirada.Enabled := True;
            spbEfetuarPagamentoCliente.Enabled := True;
          end;
        end;
      end;
      if ACBrSAT1.Extrato = ACBrSATExtratoESCPOS1 then
      begin
        ACBrPosPrinter1.Desativar;
        //ACBrPosPrinter1.Modelo := TACBrPosPrinterModelo(1);//TACBrPosPrinterModelo( cbxModeloPosPrinter.ItemIndex );
        //ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo( cbxPagCodigo.ItemIndex );
        ACBrPosPrinter1.Porta := frmLogin.pPortaImpressora;
        //ACBrPosPrinter1.ColunasFonteNormal := seColunas.Value;
        //ACBrPosPrinter1.LinhasEntreCupons := seLinhasPular.Value;
        //ACBrPosPrinter1.EspacoEntreLinhas := seEspLinhas.Value;
        ACBrSATExtratoESCPOS1.ImprimeQRCode := false;
        //ACBrSATExtratoESCPOS1.ImprimeEmUmaLinha := cbImprimir1Linha.Checked;
      end;
      vStatusVenda := False;
      vTipoVenda := '';
      DM.cdsPedidos.Close;
      DM.cdsPedidos.Open;
//      DM.cdsPedidos_Itens.Close;
//      dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = :ID_PEDIDO';
//      DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := -1;
//      dm.cdsPedidos_Itens.Open;
      dm.cdsPedidos_Itens.close;
      dm.cdsPedidos_Itens.Filtered := False;
      dm.cdsPedidos_Itens.Filter := '';
      dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
      dm.cdsPedidos_Itens.Open;

      AjustarAcbrSat;
      ACBrSAT1.Inicializar;
    end;
  end;
  Self.SetFocus;
end;

procedure TfrmVendasBalcao.GerarCupomSat(var mmSat: Tcxmemo);
var
  nCFe: String;
  function FormatarCEP(const AValue: String): String;
  Var S : String ;
  begin
    S := PadLeft( OnlyNumber(AValue), 8, '0') ; { Prenche zeros a direita }
    Result := copy(S,1,5) + '-' + copy(S,6,3) ;
  end;

  function FormatarCNPJ(const AValue: String): String;
  Var S : String ;
  begin
    S := PadLeft( OnlyNumber(AValue), 14, '0') ;
    Result := copy(S,1,2) + '.' + copy(S,3,3) + '.' +
              copy(S,6,3) + '/' + copy(S,9,4) + '-' + copy(S,13,2) ;
  end;

  function FormatarCPF(const AValue: String): String;
  Var S : String ;
  begin
    S := PadLeft( OnlyNumber(AValue), 11, '0') ;
    Result := copy(S,1,3) + '.' + copy(S,4 ,3) + '.' +
              copy(S,7,3) + '-' + copy(S,10,2) ;
  end;

  function FormatarCNPJouCPF(const AValue: String): String;
  var
    S: String;
  begin
    S := OnlyNumber(AValue);
    if Length(S) = 0 then
       Result := S
    else
    begin
      if Length(S) = 14 then
        Result := FormatarCNPJ(S)
      else
        Result := FormatarCPF(S);
    end;
  end;

  procedure GerarCabecalho;
  begin
    mmSat.lines.Add('</zera></ce></logo>');
    mmSat.lines.Add('<n>'+ACBrSAT1.CFe.Emit.xFant+'</n>');

    mmSat.lines.Add('<c>'+ACBrSAT1.CFe.Emit.xNome);
    mmSat.lines.Add(Trim(ACBrSAT1.CFe.Emit.EnderEmit.xLgr)+' '+
                           Trim(ACBrSAT1.CFe.Emit.EnderEmit.nro)+' '+
                           Trim(ACBrSAT1.CFe.Emit.EnderEmit.xCpl)+' '+
                           Trim(ACBrSAT1.CFe.Emit.EnderEmit.xBairro)+'-'+
                           Trim(ACBrSAT1.CFe.Emit.EnderEmit.xMun)+'-'+
                           FormatarCEP(IntToStr(ACBrSAT1.CFe.Emit.EnderEmit.CEP)));

    mmSat.lines.Add( '</ae><c>'+
                            'CNPJ:'+FormatarCNPJ(ACBrSAT1.CFe.Emit.CNPJ)+
                             ' IE:'+Trim(ACBrSAT1.CFe.Emit.IE)+
                             ' IM:'+Trim(ACBrSAT1.CFe.Emit.IM));
    mmSat.lines.Add('</linha_simples>');


    if ACBrSAT1.CFe.ide.tpAmb = taHomologacao then
    begin
      mmSat.lines.Add('</fn></ce><n>Extrato No. 000000');
      mmSat.lines.Add(ACBrStr('CUPOM FISCAL ELETRÔNICO - SAT</n>'));
      mmSat.lines.Add(' ');
      mmSat.lines.Add(' = T E S T E =');
      mmSat.lines.Add(' ');
      mmSat.lines.Add(StringOfChar('>',48));
      mmSat.lines.Add(StringOfChar('>',48));
      mmSat.lines.Add(StringOfChar('>',48));
    end
    else
    begin
      nCFe := IntToStrZero( ACBrSAT1.CFE.ide.nCFe, 6);

      mmSat.lines.Add('</fn></ce><n>Extrato No. '+ nCFe );
      mmSat.lines.Add( ACBrStr('CUPOM FISCAL ELETRÔNICO - SAT</n>'));
    end;

    mmSat.lines.Add('</linha_simples>');
    mmSat.lines.Add('</ae><c>CPF/CNPJ do Consumidor: '+
                           FormatarCNPJouCPF(ACBrSAT1.CFe.Dest.CNPJCPF));
  end;

  procedure GerarItens;
  var
    i: Integer;
    nTamDescricao: Integer;
    fQuant, VlrLiquido: Double;
    sItem, sCodigo, sDescricao, sQuantidade, sUnidade, sVlrUnitario, sVlrProduto,
      sVlrImpostos, LinhaCmd: String;
  begin
    mmSat.lines.Add('</ae><c></linha_simples>');
    mmSat.lines.Add(PadSpace('#|COD|DESC|QTD|UN|VL UN R$|(VLTR R$)*|VL ITEM R$',
                                    ACBrPosPrinter1.ColunasFonteCondensada, '|'));
    mmSat.lines.Add('</linha_simples>');

    for i := 0 to ACBrSAT1.CFe.Det.Count - 1 do
    begin
      sItem        := IntToStrZero(ACBrSAT1.CFe.Det.Items[i].nItem, 3);
      sDescricao   := Trim(ACBrSAT1.CFe.Det.Items[i].Prod.xProd);
      sUnidade     := Trim(ACBrSAT1.CFe.Det.Items[i].Prod.uCom);
      sVlrProduto  := FormatFloat('#,###,##0.00', ACBrSAT1.CFe.Det.Items[i].Prod.vProd);

      if (Length( Trim( ACBrSAT1.CFe.Det.Items[i].Prod.cEAN ) ) > 0) and (ACBrSATExtratoESCPOS1.ImprimeCodigoEan) then
        sCodigo := Trim(ACBrSAT1.CFe.Det.Items[i].Prod.cEAN)
      else
        sCodigo := Trim(ACBrSAT1.CFe.Det.Items[i].Prod.cProd);

      // formatar conforme configurado
      sVlrUnitario := FormatFloatBr(ACBrSAT1.CFe.Det.Items[i].Prod.VUnCom,'0.00');
      if ACBrSAT1.CFe.Det.Items[i].Imposto.vItem12741 > 0 then
        sVlrImpostos := ' ('+FormatFloatBr(ACBrSAT1.CFe.Det.Items[i].Imposto.vItem12741, '0.00')+') '
      else
        sVlrImpostos := ' ';

      // formatar conforme configurado somente quando houver decimais
      // caso contrário mostrar somente o número inteiro
      fQuant := ACBrSAT1.CFe.Det.Items[i].Prod.QCom;
      if Frac(fQuant) > 0 then
        sQuantidade := FormatFloatBr(fQuant, '0.00' )
      else
        sQuantidade := FloatToStr(fQuant);

      if ACBrSATExtratoESCPOS1.ImprimeEmUmaLinha then
      begin
        LinhaCmd := sItem + ' ' + sCodigo + ' ' + '[DesProd] ' + sQuantidade + ' ' +
          sUnidade + ' X ' + sVlrUnitario + sVlrImpostos + sVlrProduto;

        // acerta tamanho da descrição
        nTamDescricao := ACBrPosPrinter1.ColunasFonteCondensada - Length(LinhaCmd) + 9;
        sDescricao := PadRight(Copy(sDescricao, 1, nTamDescricao), nTamDescricao);

        LinhaCmd := StringReplace(LinhaCmd, '[DesProd]', sDescricao, [rfReplaceAll]);
        mmSat.lines.Add('</ae><c>' + LinhaCmd);
      end
      else
      begin
        LinhaCmd := sItem + ' ' + sCodigo + ' ' + sDescricao;
        mmSat.lines.Add('</ae><c>' + LinhaCmd);

        LinhaCmd :=
          PadRight(sQuantidade, 15) + ' ' + PadRight(sUnidade, 6) + ' X ' +
          PadRight(sVlrUnitario, 13) + '|' + sVlrImpostos + sVlrProduto;

        LinhaCmd := padSpace(LinhaCmd, ACBrPosPrinter1.ColunasFonteCondensada, '|');
        mmSat.lines.Add('</ae><c>' + LinhaCmd);
      end;

      if ACBrSATExtratoESCPOS1.ImprimeDescAcrescItem then
      begin
        // desconto
        if ACBrSAT1.CFe.Det.Items[i].Prod.vDesc > 0 then
        begin
          VlrLiquido := ACBrSAT1.CFe.Det.Items[i].Prod.vProd - ACBrSAT1.CFe.Det.Items[i].Prod.vDesc;

          LinhaCmd := '</ae><c>' + padSpace(
              'desconto ' + padLeft(FormatFloatBr(ACBrSAT1.CFe.Det.Items[i].Prod.vDesc, '-0.00'), 15, ' ')
              + '|' + FormatFloatBr(VlrLiquido, '0.00'),
              Acbrposprinter1.ColunasFonteCondensada, '|');
          mmSat.lines.Add('</ae><c>' + LinhaCmd);
        end;

        // ascrescimo
        if ACBrSAT1.CFe.Det.Items[i].Prod.vOutro > 0 then
        begin
          VlrLiquido := ACBrSAT1.CFe.Det.Items[i].Prod.vProd + ACBrSAT1.CFe.Det.Items[i].Prod.vOutro;

          LinhaCmd := '</ae><c>' + ACBrStr(padSpace(
              'acréscimo ' + padLeft(FormatFloatBr(ACBrSAT1.CFe.Det.Items[i].Prod.vOutro, '+0.00'), 15, ' ')
              + '|' + FormatFloatBr(VlrLiquido, '0.00'),
              Acbrposprinter1.ColunasFonteCondensada, '|'));
          mmSat.lines.Add('</ae><c>' + LinhaCmd);
        end;
      end;

      if ACBrSAT1.CFe.Det.Items[i].Imposto.ISSQN.vDeducISSQN > 0 then
      begin
        mmSat.lines.Add(ACBrStr(PadSpace('Dedução para ISSQN|'+
           FormatFloatBr(ACBrSAT1.CFe.Det.Items[i].Imposto.ISSQN.vDeducISSQN, '-#,###,##0.00'),
           Acbrposprinter1.ColunasFonteCondensada, '|')));
        mmSat.lines.Add(ACBrStr(PadSpace('Base de cálculo ISSQN|'+
           FormatFloatBr(ACBrSAT1.CFe.Det.Items[i].Imposto.ISSQN.vBC, '#,###,##0.00'),
           Acbrposprinter1.ColunasFonteCondensada, '|')));
      end;
    end;
  end;

  procedure GerarTotais(Resumido: Boolean = False);
  var
    Descontos, Acrescimos: Double;
  begin
    if not Resumido then
     begin
       Descontos  := (ACBrSAT1.CFe.Total.ICMSTot.vDesc  + ACBrSAT1.CFe.Total.DescAcrEntr.vDescSubtot);
       Acrescimos := (ACBrSAT1.CFe.Total.ICMSTot.vOutro + ACBrSAT1.CFe.Total.DescAcrEntr.vAcresSubtot);

       if (Descontos > 0) or (Acrescimos > 0) then
          mmSat.Lines.Add('<c>'+PadSpace('Subtotal|'+
             FormatFloatBr(ACBrSAT1.CFe.Total.ICMSTot.vProd, '#,###,##0.00'),
             ACBrPosPrinter1.ColunasFonteCondensada, '|'));

       if Descontos > 0 then
          mmSat.Lines.Add('<c>'+PadSpace('Descontos|'+
             FormatFloatBr(Descontos, '-#,###,##0.00'),
             ACBrPosPrinter1.ColunasFonteCondensada, '|'));

       if Acrescimos > 0 then
          mmSat.Lines.Add('<c>'+ACBrStr(PadSpace('Acréscimos|'+
             FormatFloatBr(Acrescimos, '+#,###,##0.00'),
             ACBrPosPrinter1.ColunasFonteCondensada, '|')));
     end;

     mmSat.Lines.Add('</ae></fn><e>'+PadSpace('TOTAL R$|'+
       FormatFloatBr(ACBrSAT1.CFe.Total.vCFe, '#,###,##0.00'),
       trunc(ACBrPosPrinter1.ColunasFonteExpandida), '|')+'</e>');
  end;

  procedure GerarPagamentos(Resumido : Boolean = False );
  var
    i : integer;
  begin
    if not Resumido then
      mmSat.Lines.Add('');

    for i:=0 to ACBrSAT1.CFe.Pagto.Count - 1 do
    begin
      mmSat.Lines.Add('<c>'+ACBrStr(PadSpace(CodigoMPToDescricao(ACBrSAT1.CFe.Pagto.Items[i].cMP)+'|'+
                  FormatFloatBr(ACBrSAT1.CFe.Pagto.Items[i].vMP, '#,###,##0.00'),
                  ACBrPosPrinter1.ColunasFonteCondensada, '|')));
    end;

    if ACBrSAT1.CFe.Pagto.vTroco > 0 then
      mmSat.Lines.Add('<c>'+PadSpace('Troco R$|'+
         FormatFloatBr(ACBrSAT1.CFe.Pagto.vTroco, '#,###,##0.00'),
         ACBrPosPrinter1.ColunasFonteCondensada, '|'));
  end;

  procedure GerarObsFisco;
  var
    i : integer;
  begin
    if (ACBrSAT1.CFe.InfAdic.obsFisco.Count > 0) or
       (ACBrSAT1.CFe.Emit.cRegTrib = RTSimplesNacional) then
       mmSat.Lines.Add('');

    if ACBrSAT1.CFe.Emit.cRegTrib = RTSimplesNacional then
       mmSat.Lines.Add('<c>' + Msg_ICMS_123_2006 );

    for i:=0 to ACBrSAT1.CFe.InfAdic.obsFisco.Count - 1 do
       mmSat.Lines.Add('<c>'+ACBrSAT1.CFe.InfAdic.obsFisco.Items[i].xCampo+'-'+
                                    ACBrSAT1.CFe.InfAdic.obsFisco.Items[i].xTexto);

  end;

  procedure GerarDadosEntrega;
  begin
    if Trim(ACBrSAT1.CFe.Entrega.xLgr)+
       Trim(ACBrSAT1.CFe.Entrega.nro)+
       Trim(ACBrSAT1.CFe.Entrega.xCpl)+
       Trim(ACBrSAT1.CFe.Entrega.xBairro)+
       Trim(ACBrSAT1.CFe.Entrega.xMun) <> '' then
     begin
       mmSat.Lines.Add('</fn></linha_simples>');
       mmSat.Lines.Add('DADOS PARA ENTREGA');
       mmSat.Lines.Add('<c>'+Trim(ACBrSAT1.CFe.Entrega.xLgr)+' '+
                                    Trim(ACBrSAT1.CFe.Entrega.nro)+' '+
                                    Trim(ACBrSAT1.CFe.Entrega.xCpl)+' '+
                                    Trim(ACBrSAT1.CFe.Entrega.xBairro)+' '+
                                    Trim(ACBrSAT1.CFe.Entrega.xMun));
       mmSat.Lines.Add(ACBrSAT1.CFe.Dest.xNome);
     end;
  end;

  procedure GerarObsContribuinte(Resumido : Boolean = False );
  var
    CabecalhoGerado: Boolean;

    procedure GerarCabecalhoObsContribuinte;
    begin
      mmSat.Lines.Add('</fn></linha_simples>');
      mmSat.Lines.Add(ACBrStr('OBSERVAÇÕES DO CONTRIBUINTE'));
      CabecalhoGerado := True;
    end;

  begin
    CabecalhoGerado := False;

    if Trim(ACBrSAT1.CFe.InfAdic.infCpl) <> '' then
    begin
      GerarCabecalhoObsContribuinte;
      mmSat.Lines.Add('<c>'+StringReplace(Trim(ACBrSAT1.CFe.InfAdic.infCpl),';',sLineBreak,[rfReplaceAll]));
    end;

    if ACBrSAT1.CFe.Total.vCFeLei12741 > 0 then
    begin
      if not CabecalhoGerado then
        GerarCabecalhoObsContribuinte
      else
        mmSat.Lines.Add(' ');

      if not Resumido then
        mmSat.Lines.Add('<c>*Valor aproximado dos tributos do item');

      mmSat.Lines.Add('<c>'+PadSpace('Valor aproximado dos tributos deste cupom R$ |<n>'+
                  FormatFloatBr(ACBrSAT1.CFe.Total.vCFeLei12741, '#,###,##0.00'),
                  ACBrPosPrinter1.ColunasFonteCondensada, '|'));
      mmSat.Lines.Add('</n>(conforme Lei Fed. 12.741/2012)');
    end;
  end;

  function CalcularConteudoQRCode(ID: String;
    dEmi_hEmi:TDateTime; Valor: Double; CNPJCPF: String;
    assinaturaQRCODE: String): String;
  begin
    Result := ID + '|' +
              FormatDateTime('yyyymmddhhmmss',dEmi_hEmi) + '|' +
              FloatToString(Valor,'.','0.00') + '|' +
              Trim(CNPJCPF) + '|' +
              assinaturaQRCODE;
  end;

  function FormatarChaveAcesso(AValue: String): String;
  var
    I: Integer;
  begin
    AValue := OnlyNumber(AValue);
    I := 1;
    Result := '';
    while I < Length(AValue) do
    begin
      Result := Result+copy(AValue,I,4)+' ';
      Inc( I, 4);
    end;
    Result := Trim(Result);
  end;

  procedure GerarRodape(CortaPapel: Boolean = True; Cancelamento: Boolean = False);
  var
    QRCode: AnsiString;
    ConfigQRCodeTipo, ConfigQRCodeErrorLevel: Integer;
  begin
    mmSat.Lines.Add('</fn></linha_simples>');
    if Cancelamento then
       mmSat.Lines.Add(ACBrStr('<n>DADOS DO CUPOM FISCAL ELETRÔNICO CANCELADO</n>'));

    mmSat.Lines.Add('</ce>SAT No. <n>'+IntToStr(ACBrSAT1.CFe.ide.nserieSAT)+'</n>');
    mmSat.Lines.Add(FormatDateTimeBr(ACBrSAT1.CFe.ide.dEmi + ACBrSAT1.CFe.ide.hEmi));
    mmSat.Lines.Add('<c>'+FormatarChaveAcesso(ACBrSAT1.CFe.infCFe.ID)+'</fn>');

    mmSat.Lines.Add('<code128>'+copy(ACBrSAT1.CFe.infCFe.ID,1,22)+'</code128>');
    mmSat.Lines.Add('<code128>'+copy(ACBrSAT1.CFe.infCFe.ID,23,22)+'</code128>');

    if ACBrSATExtratoESCPOS1.ImprimeQRCode then
    begin
      ConfigQRCodeTipo := ACBrPosPrinter1.ConfigQRCode.Tipo;
      ConfigQRCodeErrorLevel := ACBrPosPrinter1.ConfigQRCode.ErrorLevel;

      QRCode := CalcularConteudoQRCode( ACBrSAT1.CFe.infCFe.ID,
                                        ACBrSAT1.CFe.ide.dEmi+ACBrSAT1.CFe.ide.hEmi,
                                        ACBrSAT1.CFe.Total.vCFe,
                                        Trim(ACBrSAT1.CFe.Dest.CNPJCPF),
                                        ACBrSAT1.CFe.ide.assinaturaQRCODE );

      mmSat.Lines.Add('<qrcode_tipo>2</qrcode_tipo>'+
                             '<qrcode_error>0</qrcode_error>'+
                             '<qrcode>'+QRCode+'</qrcode>'+
                             '<qrcode_tipo>'+IntToStr(ConfigQRCodeTipo)+'</qrcode_tipo>'+
                             '<qrcode_error>'+IntToStr(ConfigQRCodeErrorLevel)+'</qrcode_error>');
    end;

    mmSat.Lines.Add('</pular_linhas>');
    mmSat.Lines.Add('</pular_linhas>');
    if CortaPapel then
    begin
      if ACBrPosPrinter1.CortaPapel then
        mmSat.Lines.Add('</corte_total>')
      else
        mmSat.Lines.Add('</pular_linhas>');
    end;
  end;

begin
  mmSat.lines.Clear;
  GerarCabecalho;
  GerarItens;
  GerarTotais;
  GerarPagamentos;
  //  GerarObsFisco;
  GerarDadosEntrega;
  GerarObsContribuinte;
  GerarRodape;
end;

function TfrmVendasBalcao.GetImpressora: string;
begin
    if(Printer.PrinterIndex > 0)then
    begin
      Showmessage(Printer.Printers[Printer.PrinterIndex]);
      Result := Printer.Printers[Printer.PrinterIndex];
    end
    else
    begin
      Result := 'SemImpressora';
    end;
end;

procedure TfrmVendasBalcao.Image2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmVendasBalcao.ImprimirCupomTassim(qFormaPagamento:string;qValorPago:Real);
var
  vValorTotal : Real;
  meuClient : TClientDataSet;
begin
  meuClient := TClientDataSet.Create(Self);
  meuClient.ProviderName := DM.cdsProdutos.ProviderName;
  meuClient.RemoteServer := dm.cdsProdutos.RemoteServer;
  vValorTotal := 0;
  with VDOCaPrinter1 do
  begin
    BeginDoc;
    Font.Size := 10;
    ShowDialog:=false;
    ShowPreview:=False;
  end;
  DM.cdsPedidos_Itens.First;
  VDOCaPrinter1.Print(10,'Bem Vindo(a) a '+frmLogin.sFantasia,True);
  VDOCaPrinter1.Print(0,'Data : '+FormatDateTime('dd/mm/yyyy',Now));
  VDOCaPrinter1.Print(20,'Pedido : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger),True);
  VDOCaPrinter1.Print(0,'---------------------------------------',True);
  VDOCaPrinter1.Print(0,'Codigo   Descricao            ',True);
  VDOCaPrinter1.Print(0,'   Qtde.   V.Unit.   V.Total',True);
  while not DM.cdsPedidos_Itens.Eof do
  begin
    meuClient.Close;
    meuClient.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_ID = '+ IntToStr(DM.cdsPedidos_ItensID_PRODUTO.AsInteger);
    meuClient.Active := True;
    vValorTotal := vValorTotal + DM.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
    VDOCaPrinter1.Print(0,meuClient.FieldByName('PRO_CODIGO').AsString);
    VDOCaPrinter1.Print(11,DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString,True);
    VDOCaPrinter1.Print(3,AlinharADireita(FloatToStr(DM.cdsPedidos_ItensQUANTIDADE.AsFloat),4));
    VDOCaPrinter1.Print(13,'X');
    VDOCaPrinter1.Print(16,AlinharADireita(FormatFloat('###,###,##0.00',DM.cdsPedidos_ItensVALOR_UNITARIO.AsFloat),6));
    VDOCaPrinter1.Print(24,'=');
    VDOCaPrinter1.Print(26,AlinharADireita(FormatFloat('###,###,##0.00',DM.cdsPedidos_ItensVALOR_TOTAL.AsFloat),7),True);
    DM.cdsPedidos_Itens.Next;
  end;
  VDOCaPrinter1.Print(0,'TOTAL');
  VDOCaPrinter1.Print(26,AlinharADireita(FormatFloat('###,###,##0.00',vValorTotal),7),True);
  VDOCaPrinter1.Print(0,Copy(qFormaPagamento,1,20));
  VDOCaPrinter1.Print(26,AlinharADireita(FormatFloat('###,###,##0.00',qValorPago),7),True);
  VDOCaPrinter1.Print(0,'Troco');
  VDOCaPrinter1.Print(26,AlinharADireita(FormatFloat('###,###,##0.00',qValorPago - vValorTotal),7),True);
  VDOCaPrinter1.Print(0,'---------------------------------------',True);
  VDOCaPrinter1.Print(0,'Operador : '+frmLogin.pNomeUsuario,True);
  VDOCaPrinter1.NewLine(1);
  VDOCaPrinter1.Print(0,'*** NAO POSSUI VALOR FISCAL ***',True);
  VDOCaPrinter1.EndDoc;
  FreeAndNil(meuClient);
end;

procedure TfrmVendasBalcao.SPBIniciarVendaClick(Sender: TObject);
var
  vString : string;
  Conexao : TDSModuleDbClient;
  vPedido : integer;
begin
  if vTipoVenda = 'VENDA CAPTURADA' then
  begin
    showmessage('Não é possível iniciar nova venda com Pedido capturada');
    abort;
  end;

  if vTipoVenda = 'VENDA INICIADA' then
  begin
    showmessage('Não é possível capturar venda com Pedido aberta');
    abort;
  end;

  vStatusVenda := True;
  vTipoVenda := 'VENDA INICIADA';
  vString := '   Bem vindo(a) a '+frmLogin.sFantasia +'Data : '+DateToStr(Date)+'  Hora : '+
                 FormatDateTime('hh:mm:ss',Time);
  vLinhaInicialMemo := vString;
  cxMemo1.Lines.Add(vString);
  vStatusVenda := True;
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  if not DM.cdsPedidos.Active then
    DM.cdsPedidos.Active := true;
  DM.cdsPedidos.Insert;
  DM.cdsPedidosTIPO_OPERACAO.Value := 'VD';
  //  DM.cdsPedidosDATA_PEDIDO.Value := Date;
  //  DM.cdsPedidosHORA_PEDIDO.Value := Time;
  //  dm.cdsPedidosID_CLIENTE.Value := 0;
  //  dm.cdsPedidosID_USUARIO.Value := Conexao.RetornaIdentificadorUsuario(frmLogin.pNomeUsuario);
  DM.cdsPedidosSTATUS.Value := 'P';
  vPedido := DM.cdsPedidosID_PEDIDO.AsInteger;
  DM.cdsPedidos.Post;
  DM.cdsPedidos.Close;
  DM.cdsPedidos.CommandText := 'SELECT * FROM PEDIDOS WHERE ID_PEDIDO = '+IntToStr(vPedido);
  DM.cdsPedidos.Open;
  vString := '   Pedido Nº : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
  //DM.cdsPedidos_Itens.Close;
  //DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
  //dm.cdsPedidos_Itens.Open;
  dm.cdsPedidos_Itens.close;
  dm.cdsPedidos_Itens.Filtered := False;
  dm.cdsPedidos_Itens.Filter := '';
  dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
  dm.cdsPedidos_Itens.Open;
  cxMemo1.Lines.Add(vString);
  FreeAndNil(Conexao);
  Application.ProcessMessages;
  edtPesquisa.SetFocus;
end;

procedure TfrmVendasBalcao.spbCancelarCupomFiscalClick(Sender: TObject);
var
  IdPedido : Integer;
  numeroCupom :string;
begin
  if frmLogin.pSat_ECF=0 then
  begin
    if not ACBrECF1.Ativo then
      ACBrECF1.Ativar;
    numeroCupom := ACBrECF1.NumCupom;
    if messagedlg('Deseja realmente cancelar o cupom nº : '+ACBrECF1.NumCupom,mtWarning,[mbOK,mbNo],0)= mrOk then
    begin
      if Trim(frmLogin.pModeloImpressora) <> '7' then
      begin
        ACBrECF1.CancelaCupom;
      end
      else
      begin
        ACBrECF1.CancelaNaoFiscal;
      end;

      DM.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'SELECT ID_PEDIDO FROM PEDIDOS WHERE NUMEROCUPOMFISCAL = '+QuotedStr(numeroCupom);
      DM.cdsGenerico.Open;
      IdPedido := DM.cdsGenerico.FieldByName('ID_PEDIDO').AsInteger;
      ExtornarItem(IdPedido);
      DM.cdsPedidos.Locate('ID_PEDIDO',IdPedido,[]);
      DM.cdsPedidos.Edit;
      DM.cdsPedidosSTATUS.AsString := 'Cancelado';
      DM.cdsPedidos.Post;
      MessageDlg('O pedido nº '+IntToStr(idpedido) +' foi cancelado'+#13+
                 'assim como o cupom fiscal nº '+ACBrECF1.NumCupom,mtConfirmation,[mbOK],0);
    end;
  end
  else
  begin
    try
      ACBrSAT1.CancelarUltimaVenda;
      ACBrSATExtratoFortes1.Impressora:= GetImpressora;
      ACBrSATExtratoFortes1.LarguraBobina       := 286;
      ACBrSATExtratoFortes1.MargemSuperior      := 0;
      ACBrSATExtratoFortes1.MargemInferior      := 0;
      ACBrSATExtratoFortes1.MargemEsquerda      := 4;
      ACBrSATExtratoFortes1.MargemDireita       := 2;

      ACBrSAT1.Extrato := ACBrSATExtratoFortes1;
      ACBrSAT1.Extrato.ImprimeQRCode:= false;
      //ACBrSAT1.Extrato.ImprimeMsgOlhoNoImposto:= true;
      ACBrSAT1.Extrato.ImprimeDescAcrescItem:= true;
      ACBrSAT1.Extrato.ImprimeEmUmaLinha:= true;
      ACBrSAT1.Extrato.Sistema:= 'Business Controller';
      ACBrSAT1.ImprimirExtratoCancelamento;

      MessageDlg('O pedido nº '+IntToStr(idpedido) +' foi cancelado'+#13+
                 'assim como o NFc-e nº '+ACBrsat1.CFe.infCFe.ID,mtConfirmation,[mbOK],0);
    except on e:Exception do
      begin
        MessageDlg('Não foi possível efetuar cancelamento do pedido nº '+IntToStr(idpedido),mtConfirmation,[mbOK],0);
      end;
    end;
  end;
end;

procedure TfrmVendasBalcao.spbReducaoZClick(Sender: TObject);
begin
  if not ACBrECF1.Ativo then
    ACBrECF1.Ativar;
  ACBrECF1.ReducaoZ(Now);
end;

procedure TfrmVendasBalcao.spbVenderItemClick(Sender: TObject);
var
  Aliquota : string;
begin
  Aliquota := '18,00';
  if not ACBrECF1.Ativo then
    ACBrECF1.Ativar;
  ACBrECF1.VendeItem('1232','Teste',Aliquota,10,10,0,'pç','','D');
end;

procedure TfrmVendasBalcao.SpeedButton1Click(Sender: TObject);
var
  teste:string;
begin
  showmessage(ACBrECF1.MemoParams.Text);
  ACBrECF1.Porta := 'COM11';
  ACBrECF1.AbreNaoFiscal('29230507890','Daniel','');
  ACBrECF1.LerTotaisComprovanteNaoFiscal;
  ACBrECF1.RegistraItemNaoFiscal('01',10,'');
  //ACBrECF1.RegistraItemNaoFiscal('01',10,'pc');
  ACBrECF1.SubtotalizaNaoFiscal(0,'cupom não fiscal');
  ACBrECF1.EfetuaPagamentoNaoFiscal('01',50,'');
  ACBrECF1.FechaNaoFiscal();
  ACBrECF1.CortaPapel();
end;

procedure TfrmVendasBalcao.SpeedButton2Click(Sender: TObject);
begin
  ACBrECF1.CancelaNaoFiscal;
end;

procedure TfrmVendasBalcao.SpeedButton3Click(Sender: TObject);
begin
with VDOCaPrinter1 do
  begin
    BeginDoc;
    Font.Size := 10;
    ShowDialog:=false;
    ShowPreview:=False;
  end;
  VDOCaPrinter1.Print(16,frmLogin.sFantasia,True);
  VDOCaPrinter1.Print(3,'Data : '+FormatDateTime('dd/mm/yyyy',Now));
  VDOCaPrinter1.Print(31,'Pedido : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger),True);
  VDOCaPrinter1.EndDoc;
end;


procedure TfrmVendasBalcao.spbGerarNFeClick(Sender: TObject);
//var
//  Conexao : TDSModuleDbClient;
//  vNfe : TACBrNFe;
//  vRetorno,vCodigoRetorno,vMotivoRetorno,
//  vChaveNFe,vCaminhoXml : string;
//  dialog : TOpenDialog;
begin
//  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
//  vRetorno := Conexao.EnviarNFe;
//  vCodigoRetorno := Copy(vRetorno,1,Pos('|',vRetorno) - 1);
//  vRetorno := Copy(vRetorno,Pos('|',vRetorno) + 1,Length(vRetorno));
//  vMotivoRetorno := Copy(vRetorno,1,Pos('|',vRetorno) - 1);
//  vRetorno := Copy(vRetorno,Pos('|',vRetorno) + 1,Length(vRetorno));
//  vChaveNFe := Copy(vRetorno,1,Pos('|',vRetorno) - 1);
//  vRetorno := Copy(vRetorno,Pos('|',vRetorno) + 1,Length(vRetorno));
//  vCaminhoXml := vRetorno;
//  if StrToInt(vCodigoRetorno) = 100 then
//  begin
//    showmessage(vMotivoRetorno);
//    vNfe := TACBrNFe.Create(Self);
//    vNfe.NotasFiscais.Clear;
//    vNfe.NotasFiscais.LoadFromFile(vCaminhoXml);
//    ACBrNFeDANFEFR1.ACBrNFe := vNfe;
//    ACBrNFeDANFEFR1.PathPDF := ExtractFilePath(Application.ExeName);
//    ACBrNFeDANFEFR1.FastFile := ExtractFilePath(Application.ExeName)+'DANFE.fr3';
//    vNfe.NotasFiscais.Items[0].Imprimir;
//  end
//  else
//    showmessage(vMotivoRetorno);
//  FreeAndNil(vNfe);
end;

procedure TfrmVendasBalcao.spbCapturarDiversasComandasClick(Sender: TObject);
var
  vNumeroComandas,I : smallint;
  vComanda,vString : string;
  Conexao : TDSModuleDbClient;
  vSubTotal : Real;
  vIdentificadorPedido : integer;
begin
  if vTipoVenda = 'VENDA INICIADA' then
  begin
    showmessage('Não é possível capturar venda com pedido aberta');
    abort;
  end;

  if vTipoVenda = 'VENDA CAPTURADA' then
  begin
    showmessage('Já existe uma venda capturada');
    abort;
  end;
  try
    vNumeroComandas := StrToInt(InputBox('Capturar diversos pedidos','Informe em numeros a quantidade de pedido',''));
  except on e:exception do
    begin
      showmessage('O valor digitado é inválido'+#13+e.Message);
      abort;
    end;
  end;
  SetLength(aIdentificadoresPedido,vNumeroComandas);
  for I := 0 to vNumeroComandas - 1 do
  begin
    vComanda := '';
    vComanda := InputBox('Captura de pedido','Informe o numero da pedido','');
    if Trim(vComanda) = '' then
      abort;

    DM.cdsComandas.Close;
    DM.cdsComandas.CommandText := 'SELECT * FROM COMANDAS WHERE NUMERO_COMANDA = '+ Quotedstr(vComanda);
    DM.cdsComandas.Open;
    if DM.cdsComandasNUMERO_COMANDA.AsString = '' then
    begin
      showmessage('O numero de Pedido informado não está cadastrado no sistema ');
      edtDescricao.Clear;
      edtQuantidade.Clear;
      edtPreco.Clear;
      edtPrecoTotal.Clear;
      edtDesconto.Clear;
      edtPesquisa.Clear;
      Image1.Visible := False;
      edtPesquisa.SetFocus;
      Abort;
    end;

    //Verifico se a comanda possui pedido
    DM.cdsPedidos.Close;
    DM.cdsPedidos.CommandText := 'SELECT * FROM PEDIDOS WHERE NUMERO_COMANDA = '+ QuotedStr(vComanda);
    DM.cdsPedidos.Open;

    if Trim(DM.cdsPedidosNUMERO_COMANDA.AsString) = '' then
    begin
      MessageDlg('Não existe nenhum registro para este pedido',mtWarning,[mbOK],0);
      edtDescricao.Clear;
      edtQuantidade.Clear;
      edtPreco.Clear;
      edtPrecoTotal.Clear;
      edtDesconto.Clear;
      edtPesquisa.Clear;
      Image1.Visible := False;
      edtPesquisa.SetFocus;
      abort;
    end;

    //Verifico se a comanda está presa em outro ponto de venda
    if DM.cdsPedidosPEDIDO_EM_VENDA.AsString = 'S' then
    begin
      showmessage('Este numero de pedido já está aberta em outro ponto de venda.');
      edtDescricao.Clear;
      edtQuantidade.Clear;
      edtPreco.Clear;
      edtPrecoTotal.Clear;
      edtDesconto.Clear;
      edtPesquisa.Clear;
      Image1.Visible := False;
      edtPesquisa.SetFocus;
      Exit;
    end;

    //Travo as comandas para que outro pdv não possa capturar
    try
      aIdentificadoresPedido[I] := DM.cdsPedidosID_PEDIDO.AsInteger;
    except
      showmessage('Sistema não conseguiu bloquear o pedido '+DM.cdsPedidosNUMERO_COMANDA.AsString+' em outros pontos de venda');
      abort;
    end;
  end;

  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  DM.cdsPedidos.Insert;
  vIdentificadorPedido := Conexao.GeneratorIncrementado('NOVO_PEDIDO');
  DM.cdsPedidosID_PEDIDO.Value := vIdentificadorPedido;
  DM.cdsPedidosTIPO_OPERACAO.Value := 'VD';
  DM.cdsPedidosDATA_PEDIDO.Value := Date;
  DM.cdsPedidosHORA_PEDIDO.Value := Time;
  DM.cdsPedidosSTATUS.Value := 'P';
  DM.cdsPedidos.Post;
  try
    DM.cdsPedidos.ApplyUpdates(0);
  except on e:exception do
    begin
      DM.cdsPedidos.CancelUpdates;
      showmessage('Não foi possível capturar estes pedidos'+#13+e.message);
      abort;
    end;
  end;
  //Começo a inserir os itens
  for I := 0 to vNumeroComandas - 1 do
  begin
    if not Conexao.InserirItenDoPedidoDeAcordoComNumeroDaComanda(vIdentificadorPedido,aIdentificadoresPedido[I]) then
    begin
      showmessage('O sistema não conseguiu efetuar captura dos pedidos informados');
      exit;
    end;
  end;
  DM.cdsPedidos.Close;
  DM.cdsPedidos.CommandText := 'select * from pedidos where id_pedido = '+IntToStr(vIdentificadorPedido);
  DM.cdsPedidos.Open;
  vStatusVenda := True;
  if vLinhaInicialMemo = '' then
    vLinhaInicialMemo := '   Bem vindo(a) a '+frmLogin.sFantasia +'. Data : '+DateToStr(Date)+'  Hora : '+
               FormatDateTime('hh:mm:ss',Time);
  vString := '';
  cxMemo1.Lines.Clear;
  vString := vLinhaInicialMemo;
  cxMemo1.Lines.Add(vString);
  vString := '   Pedido Nº : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
  cxMemo1.Lines.Add(vString);
  DM.cdsPedidos_Itens.Close;
  dm.cdsPedidos_Itens.Open;
  DM.cdsPedidos_Itens.First;
  vSubTotal := 0;
  while not dm.cdsPedidos_Itens.Eof do
  begin
    if edtDesconto.Text <> '' then
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat) +
                 '  =  ' +'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat) +
                 ' - '+ FormatFloat('###,###,##0.00',StrToFloat( stringReplace( edtDesconto.Text,'.','',[]) ))
    else
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat)+
                 '  =  ' + 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat);

    cxMemo1.Lines.Add(vString);
    vSubTotal := vSubTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
    dm.cdsPedidos_Itens.Next;
  end;
  vTipoVenda := 'VENDA CAPTURADA';

  if edtDesconto.Text <> '' then
    edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal - StrToFloat( stringReplace( edtDesconto.Text,'.','',[]) ))
  else
    edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal);
end;

procedure TfrmVendasBalcao.spbCapturarVendaClick(Sender: TObject);
var
  vString,vComanda : string;
  vSubTotal : real;
begin
  if vTipoVenda = 'VENDA INICIADA' then
  begin
    showmessage('Não é possível capturar venda com pedido aberto');
    abort;
  end;

  if vTipoVenda = 'VENDA CAPTURADA' then
  begin
    showmessage('Já existe uma venda capturada');
    abort;
  end;

  vComanda := InputBox('Captura de pedido','Informe o numero do pedido','');
  if Trim(vComanda) = '' then
    abort;

  DM.cdsComandas.Close;
  DM.cdsComandas.CommandText := 'SELECT * FROM COMANDAS WHERE NUMERO_COMANDA = '+ Quotedstr(vComanda);
  DM.cdsComandas.Open;
  if DM.cdsComandasNUMERO_COMANDA.AsString = '' then
  begin
    showmessage('O numero de pedido informado não está cadastrado no sistema ');
    edtDescricao.Clear;
    edtQuantidade.Clear;
    edtPreco.Clear;
    edtPrecoTotal.Clear;
    edtDesconto.Clear;
    edtPesquisa.Clear;
    Image1.Visible := False;
    edtPesquisa.SetFocus;
    Exit;
  end;


  DM.cdsPedidos.Close;
  DM.cdsPedidos.CommandText := 'SELECT * FROM PEDIDOS WHERE NUMERO_COMANDA = '+ QuotedStr(vComanda);
  DM.cdsPedidos.Open;

  if Trim(DM.cdsPedidosNUMERO_COMANDA.AsString) = '' then
  begin
    MessageDlg('Não existe nenhum pedido para este pedido',mtWarning,[mbOK],0);
    edtDescricao.Clear;
    edtQuantidade.Clear;
    edtPreco.Clear;
    edtPrecoTotal.Clear;
    edtDesconto.Clear;
    edtPesquisa.Clear;
    Image1.Visible := False;
    edtPesquisa.SetFocus;
    Exit;
  end;

  if DM.cdsPedidosPEDIDO_EM_VENDA.AsString = 'S' then
  begin
    showmessage('Este numero de pedido já está aberta em outro ponto de venda.');
    edtDescricao.Clear;
    edtQuantidade.Clear;
    edtPreco.Clear;
    edtPrecoTotal.Clear;
    edtDesconto.Clear;
    edtPesquisa.Clear;
    Image1.Visible := False;
    edtPesquisa.SetFocus;
    Exit;
  end;

  
  vStatusVenda := True;
  if vLinhaInicialMemo = '' then
    vLinhaInicialMemo := '   Bem vindo(a) a '+frmLogin.sFantasia+'. Data : '+DateToStr(Date)+'  Hora : '+
               FormatDateTime('hh:mm:ss',Time);
  vString := '';
  cxMemo1.Lines.Clear;
  vString := vLinhaInicialMemo;
  cxMemo1.Lines.Add(vString);
  vString := '   Pedido Nº : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
  cxMemo1.Lines.Add(vString);

//  DM.cdsPedidos_Itens.Close;
//  DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
//  dm.cdsPedidos_Itens.Open;
  dm.cdsPedidos_Itens.close;
  dm.cdsPedidos_Itens.Filtered := False;
  dm.cdsPedidos_Itens.Filter := '';
  dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
  dm.cdsPedidos_Itens.Open;

  DM.cdsPedidos_Itens.First;
  vSubTotal := 0;
  while not dm.cdsPedidos_Itens.Eof do
  begin
    if edtDesconto.Text <> '' then
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat) +'  =  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat) + '  -  '+
                 FormatFloat('###,###,##0.00',StrToFloat( stringReplace( edtDesconto.Text,'.','',[]) ))
    else
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat) +'  =  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat);
    cxMemo1.Lines.Add(vString);
    vSubTotal := vSubTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
    dm.cdsPedidos_Itens.Next;
  end;
  if edtDesconto.Text <> '' then
    edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal - StrToFloat( stringReplace(edtDesconto.Text,'.','',[]) ))
  else
    edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal);      
  vTipoVenda := 'VENDA CAPTURADA';
end;

procedure TfrmVendasBalcao.spbCarregarAliquotasClick(Sender: TObject);
var
  vValorAliquota :string;
  vAliquota : TACBrECFAliquota;
begin
  ACBrECF1.Ativar;
  ACBrECF1.LerTotaisAliquota;
  vValorAliquota := '1800';
  vAliquota := ACBrECF1.AchaICMSAliquota(StrToFloat( stringReplace( vValorAliquota,'.','',[] ) ));
  if vAliquota = nil then
    ACBrECF1.ProgramaAliquota(StrToFloat( stringReplace( vValorAliquota,'.','',[]) ),'T','');

end;

procedure TfrmVendasBalcao.spbCancelarVendaClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente cancelar o pedido '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger)+'?',mtInformation,[mbYes,mbNo],0) = mrYes then
  begin
//    DM.cdsPedidos_Itens.Close;
//    DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
//    dm.cdsPedidos_Itens.Open;
    dm.cdsPedidos_Itens.close;
    dm.cdsPedidos_Itens.Filtered := False;
    dm.cdsPedidos_Itens.Filter := '';
    dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
    dm.cdsPedidos_Itens.Open;
    DM.cdsPedidos_Itens.First;
    while not DM.cdsPedidos_Itens.Eof do
    begin
      DM.cdsPedidos_Itens.Delete;
      DM.cdsPedidos_Itens.Next;
    end;
    DM.cdsPedidos.Delete;
    try
      DM.cdsPedidos_Itens.ApplyUpdates(0);
      DM.cdsPedidos.ApplyUpdates(0);
      MessageDlg('Pedido Cancelado',mtWarning,[mbOk],0);
      vStatusVenda := False;
      vTipoVenda := '';
      cxMemo1.Lines.Clear;
      edtSubTotal.Text := '0,00';
      edtPrecoTotal.Clear;
      edtPreco.Clear;
      edtDesconto.Clear;
      edtQuantidade.Clear;
      edtDescricao.Clear;
      edtPesquisa.Clear;
      vTipoVenda := '';
    except
      MessageDlg('Pedido não pode ser Cancelado',mtWarning,[mbOk],0);
    end;
  end;
end;

procedure TfrmVendasBalcao.spbCancelarItemClick(Sender: TObject);
var
  vQualCodigo,vString : string;
  vQuantidade,vSubTotal : real;
begin
  if vStatusVenda = False then
  begin
    MessageDlg('No momento, não está sendo feita nenhuma venda',mtError,[mbOk],0);
    abort;
  end;
//  DM.cdsPedidos_Itens.Close;
//  DM.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS WHERE ID_PEDIDO = '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
//  DM.cdsPedidos_Itens.Open;
  vQualCodigo := InputBox('Pedido nº : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger),'Informe o código EAN13 do produto','');
  if vQualCodigo = '' then
    abort;

  cdsProdutos.Close;
  cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_EAN13 = '+QuotedStr(vQualCodigo);
  cdsProdutos.Active := True;
  if cdsProdutos.RecordCount = 0 then
  begin
    showmessage('Produto não encontrado');
    abort;
  end;
  if DM.cdsPedidos_Itens.Locate('ID_PRODUTO',cdsProdutos.FieldByName('PRO_ID').AsInteger,[]) = False then
  begin
    MessageDlg('Produto não encontrado neste pedido',mtError,[mbOk],0);
    abort;
  end
  else
  begin
    try
      vQuantidade := StrToFloat( stringReplace( InputBox('Cancelamento de item','Informe a quantidade'+#13+
                                       'a ser retirada',''),'.','',[])   );
    except
      showmessage('Quantidade inválida');
      abort;
    end;

    if vQuantidade > DM.cdsPedidos_ItensQUANTIDADE.AsFloat then
    begin
      showmessage('A quantidade informada é maior que a quantidade deste item');
      abort;
    end;

    if vQuantidade = DM.cdsPedidos_ItensQUANTIDADE.AsFloat then
      DM.cdsPedidos_Itens.Delete
    else
    begin
      DM.cdsPedidos_Itens.Edit;
      DM.cdsPedidos_ItensQUANTIDADE.AsFloat := DM.cdsPedidos_ItensQUANTIDADE.AsFloat - vQuantidade;
      dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat := DM.cdsPedidos_ItensQUANTIDADE.AsFloat  * dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat;
      DM.cdsPedidos_Itens.Post;
    end;
    cxMemo1.Lines.Clear;
    vString := vLinhaInicialMemo;
    cxMemo1.Lines.Add(vString);
    vString := '   Pedido Nº : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
    cxMemo1.Lines.Add(vString);
//    DM.cdsPedidos_Itens.Filtered := False;
//    DM.cdsPedidos_Itens.Filter := 'ID_PEDIDO = '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
//    dm.cdsPedidos_Itens.Filtered := True;
    DM.cdsPedidos_Itens.Close;
    DM.cdsPedidos_Itens.Open;
    DM.cdsPedidos_Itens.First;
    vSubTotal := 0;
    while not dm.cdsPedidos_Itens.Eof do
    begin
//      DM.cdsProdutos.Close;
//      DM.cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_ID = '+ IntToStr(DM.cdsPedidos_ItensID_PRODUTO.AsInteger);
//      DM.cdsProdutos.Active := True;

    if edtDesconto.Text <> '' then
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat) +
                 '  =  ' +'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat) +
                 ' - '+ FormatFloat('###,###,##0.00',StrToFloat( stringReplace( edtDesconto.Text ,'.','',[]) ))
    else
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat)+
                 '  =  ' + 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat);

      cxMemo1.Lines.Add(vString);
      vSubTotal := vSubTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
//      DM.cdsProdutos.Filtered := False;
      dm.cdsPedidos_Itens.Next;
    end;
    if edtDesconto.Text <> '' then    
      edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal - StrToFloat( stringReplace( edtDesconto.Text, '.','',[] ) ))
    else
      edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal);  
  end;
end;

procedure TfrmVendasBalcao.spbConfirmarItemClick(Sender: TObject);
var
  vString : string;
  Conexao : TDSModuleDbClient;
  vQuantidade,vValorTotal,vSubTotal,vTotalAuxiliar,
  vValorUnitario, vDesconto :Real;
  label
    vProximoPasso;
begin
  vValorUnitario := 0;
  vValorUnitario := StrToFloat( stringReplace(edtPreco.Text,'.','',[]) );
  if edtDesconto.text <> '' then
    vDesconto := StrToFloat( stringReplace(edtDesconto.Text,'.','',[]) )
  else
    vDesconto := 0;

//  DM.cdsPedidos_Itens.Close;
//  DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
//  dm.cdsPedidos_Itens.Open;
  dm.cdsPedidos_Itens.close;
  dm.cdsPedidos_Itens.Filtered := False;
  dm.cdsPedidos_Itens.Filter := '';
  dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
  dm.cdsPedidos_Itens.Open;

  if DM.cdsPedidos_Itens.Locate('ID_PRODUTO;ID_PEDIDO;VALOR_UNITARIO',VarArrayOf([cdsProdutos.FieldByName('PRO_ID').AsInteger,
                                                                                  DM.cdsPedidosID_PEDIDO.AsInteger,
                                                                                  vValorUnitario]),[]) = False then
  begin
    if cdsProdutos.FieldByName('PRO_SALDO').AsFloat > 0 then
    begin
       if StrToFloat( stringReplace( edtQuantidade.Text,'.','',[] ) ) <= cdsProdutos.FieldByName('PRO_SALDO').AsFloat then
      begin
        Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
        DM.cdsPedidos_Itens.Insert;
        DM.cdsPedidos_ItensQUANTIDADE.Value := StrToFloat( stringReplace( edtQuantidade.Text, '.','',[] ) );
        vTotalAuxiliar := (StrToFloat( stringReplace( edtQuantidade.Text,'.','',[]) ) * vValorUnitario) - vDesconto;
        DM.cdsPedidos_ItensVALOR_TOTAL.asfloat := vTotalAuxiliar;
        FreeAndNil(Conexao);
      end
      else if (frmLogin.pSaldoNegativo = 'S') then
      begin
        Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
        DM.cdsPedidos_Itens.Insert;
        DM.cdsPedidos_ItensQUANTIDADE.Value := StrToFloat( stringReplace( edtQuantidade.Text,'.','',[] ) );
        vTotalAuxiliar := (StrToFloat(stringReplace( edtQuantidade.Text,'.','',[])) * vValorUnitario) - vDesconto;
        DM.cdsPedidos_ItensVALOR_TOTAL.asfloat := vTotalAuxiliar;
        FreeAndNil(Conexao);
      end
      else if (frmLogin.pSaldoNegativo <> 'S') then
      begin
        MessageDlg('O produto '+cdsProdutos.FieldByName('PRO_DESCRICAO').AsString+' não possui saldo suficiente'+#13+
                 'para realizar esta venda',mtError,[mbok],0);
        goto vProximoPasso;
      end;
    end
    else if (frmLogin.pSaldoNegativo = 'S') then
    begin
      Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
      DM.cdsPedidos_Itens.Insert;
      DM.cdsPedidos_ItensQUANTIDADE.Value := StrToFloat( stringReplace( edtQuantidade.Text,'.','',[] ));
      vTotalAuxiliar := (StrToFloat( stringReplace( edtQuantidade.Text,'.','',[] ) ) * vValorUnitario) - vDesconto;
      DM.cdsPedidos_ItensVALOR_TOTAL.asfloat := vTotalAuxiliar;
      FreeAndNil(Conexao);
    end
    else if (frmLogin.pSaldoNegativo <> 'S') then
    begin
      MessageDlg('O produto '+cdsProdutos.FieldByName('PRO_DESCRICAO').AsString+' não possui saldo suficiente'+#13+
                 'para realizar esta venda',mtError,[mbok],0);
      goto vProximoPasso;
    end;
  end
  else
  begin
    if (DM.cdsPedidos_ItensQUANTIDADE.AsFloat + StrToFloat( stringReplace( edtQuantidade.Text,'.','',[] ) )) <= cdsProdutos.FieldByName('PRO_SALDO').AsFloat then
    begin
      DM.cdsPedidos_Itens.Edit;
      DM.cdsPedidos_ItensQUANTIDADE.Value := DM.cdsPedidos_ItensQUANTIDADE.AsFloat + StrToFloat( stringReplace(edtQuantidade.Text,'.','',[]) );
      DM.cdsPedidos_ItensVALOR_TOTAL.Value := DM.cdsPedidos_ItensVALOR_TOTAL.AsFloat + StrToFloat( stringReplace(edtPrecoTotal.Text,'.','',[]) );
    end
    else if (frmLogin.pSaldoNegativo = 'S') then
    begin
      DM.cdsPedidos_Itens.Edit;
      DM.cdsPedidos_ItensQUANTIDADE.Value := DM.cdsPedidos_ItensQUANTIDADE.AsFloat + StrToFloat(stringReplace( edtQuantidade.Text,',','',[]) );
      DM.cdsPedidos_ItensVALOR_TOTAL.Value := DM.cdsPedidos_ItensVALOR_TOTAL.AsFloat + StrToFloat( stringReplace(edtPrecoTotal.Text,'.','',[]) );
    end
    else
    begin
      MessageDlg('O produto '+cdsProdutos.FieldByName('PRO_DESCRICAO').AsString+' não possui saldo suficiente'+#13+
                 'para realizar esta venda',mtError,[mbok],0);
      goto vProximoPasso;
    end;
  end;
  //  DM.cdsPedidos_ItensID_PEDIDO.Value := DM.cdsPedidosID_PEDIDO.AsInteger;
  DM.cdsPedidos_ItensDESCRICAO_PRODUTO.Value := edtDescricao.Text;
  DM.cdsPedidos_ItensID_PRODUTO.Value := cdsProdutos.FieldByName('PRO_ID').AsInteger;
  DM.cdsPedidos_ItensVALOR_UNITARIO.AsFloat := vValorUnitario;//StrToFloat(edtPreco.Text);
  DM.cdsPedidos_ItensALIQUOTA_ICMS.value := cdsProdutos.FieldByName('ALIQUOTA_ICMS').AsInteger;
  DM.cdsPedidos_ItensDESCONTO.value := vDesconto;
  DM.cdsPedidos_Itens.Post;
  vString := '';
  cxMemo1.Lines.Clear;
  vString := vLinhaInicialMemo;
  cxMemo1.Lines.Add(vString);
  vString := '   Pedido Nº : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
  cxMemo1.Lines.Add(vString);
  //DM.cdsPedidos_Itens.Filtered := False;
  //DM.cdsPedidos_Itens.Filter := 'ID_PEDIDO = '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
  //dm.cdsPedidos_Itens.Filtered := True;
//  DM.cdsPedidos_Itens.Close;
//  DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
//  dm.cdsPedidos_Itens.Open;

  dm.cdsPedidos_Itens.close;
  dm.cdsPedidos_Itens.Filtered := False;
  dm.cdsPedidos_Itens.Filter := '';
  dm.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS where id_pedido = '+inttostr(dm.cdsPedidosID_PEDIDO.AsInteger) + ' ORDER BY ID_PEDIDO_ITEM';
  dm.cdsPedidos_Itens.Open;
  DM.cdsPedidos_Itens.First;
  vSubTotal := 0;
  while not dm.cdsPedidos_Itens.Eof do
  begin
    //DM.cdsProdutos.Close;
    //DM.cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_ID = '+ IntToStr(DM.cdsPedidos_ItensID_PRODUTO.AsInteger);
    //DM.cdsProdutos.Active := True;
    if edtDesconto.Text <> '' then
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat) +
                 '  =  ' +'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat) +
                 ' - '+ FormatFloat('###,###,##0.00',StrToFloat( stringReplace( edtDesconto.Text,'.','',[] ) ))
    else
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat)+
                 '  =  ' + 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat);
    cxMemo1.Lines.Add(vString);
    vSubTotal := vSubTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
    //DM.cdsProdutos.Filtered := False;
    dm.cdsPedidos_Itens.Next;
  end;
  if edtDesconto.Text <> '' then  
    edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal - StrToFloat( stringReplace( edtDesconto.Text,'.','',[] ) ))
  else
    edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal); 
         
  vProximoPasso:
  edtDescricao.Clear;
  edtQuantidade.Clear;
  edtPreco.Clear;
  edtPrecoTotal.Clear;
  edtDesconto.Clear;
  edtPesquisa.Clear;
  Image1.Visible := False;
  edtPesquisa.SetFocus;
end;

procedure TfrmVendasBalcao.spbConfirmarVendaClick(Sender: TObject);
var
  vString,vNome,vCpf,vEndereco,Aliquota,vPermiteTroco,
  vEfetuaMovimentacaoCliente,vTexto,vTextoAux, Erro : string;
  vContador,vFormaPagamento,vContadorCPF:integer;
  vSomaValorTotal,vValorPago,vLimiteCliente, Troco, vdesc : Real;
  vConectaServidor : TDSModuleDbClient;
  iRetorno : integer;
  LookUp : TfrmLookUp;
  vCPFCorreto : boolean;
  meuClient : TClientDataSet;
  I: Integer;
  TotalItem,TotalGeralItem:Double;
  memo : TMemo;

begin

  if vStatusVenda then
  begin
    if (strtofloat( stringReplace( edtSubTotal.text,'.','',[] ) ) <= 0) then
    BEGIN
    MessageDlg('Não foi calculado o SubTotal'+#13+
                 'Verifique a quantidade e o produto'+#13+
                 'antes de confirmar venda',mtWarning,[mbOK],0);
                 EXIT;
    END;
    //ecf
    if frmLogin.pSat_ECF = 0 then
    begin
      try
        vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
      except
        MessageDlg('Sistema não está conectado ao servidor',mtError,[mbOK],0);
        abort;
      end;
      vContador := 0;
      vSomaValorTotal := 0;
      vDesc:= 0;
      //DM.cdsPedidos_Itens.Close;
      //DM.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS WHERE ID_PEDIDO = '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
      //dm.cdsPedidos_Itens.Open;
      DM.cdsPedidos_Itens.First;
      while not dm.cdsPedidos_Itens.Eof do
      begin
        Inc(vContador);
        vSomaValorTotal := vSomaValorTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
        dm.cdsPedidos_Itens.Next;
      end;


      DM.cdsPedidos.Edit;
      dm.cdsPedidosVALOR_TOTAL.Value := vSomaValorTotal;
      dm.cdsPedidosSTATUS.Value := 'Realizado';
      DM.cdsPedidosDATA_PEDIDO.Value := Date;
      DM.cdsPedidosHORA_PEDIDO.Value := Time;

      //Escolhendo o vendedor
      if not Assigned(frmlookupVendedores) then
        frmlookupVendedores := TfrmlookupVendedores.Create(Self);
      frmlookupVendedores.Left := Trunc(Screen.Width / 2) - 200;
      frmlookupVendedores.Top := Trunc(Screen.Height / 2) - 200;
      if not DM.cdsVendedores.Active then
        dm.cdsVendedores.Active := True;
      frmlookupVendedores.ShowModal;
      dm.cdsPedidosID_VENDEDOR.AsInteger := dm.cdsVendedoresID_VENDEDOR.AsInteger;
      DM.cdsPedidos.Post;
      FreeAndNil(frmlookupVendedores);

      //Escolhendo a forma de pagamento
      if not Assigned(frmlookUpFormaPagamento) then
        frmlookUpFormaPagamento := TfrmlookUpFormaPagamento.Create(Self);
      frmlookUpFormaPagamento.Left := Trunc(Screen.Width / 2) - 300;
      frmlookUpFormaPagamento.Top := Trunc(Screen.Height / 2) - 300;
      if not DM.cdsFormasDePagamento.Active then
        dm.cdsFormasDePagamento.Active := True;
      frmlookUpFormaPagamento.ShowModal;
      troco:= frmlookUpFormaPagamento.vtroco;
      FreeAndNil(frmlookUpFormaPagamento);

      //Primeiro irei movimentar os produtos, caso não consiga
      //não gravo o pedido
      DM.cdsPedidos_Itens.First;
      while not dm.cdsPedidos_Itens.Eof do
      begin
          if vConectaServidor.InserirEmMovimentacoes(DM.cdsPedidos_ItensID_PRODUTO.AsInteger,DM.cdsPedidos_ItensID_PEDIDO.AsInteger,
                                                     DM.cdsPedidos_ItensQUANTIDADE.AsFloat,'Venda','S') = 0 then
            break;
        dm.cdsPedidos_Itens.Next;
      end;
      //Sem imprssora
      if frmLogin.pModeloImpressora = '9' then
      begin

      end
      else
      //Impressora não fiscal
      if frmLogin.pModeloImpressora = '7' then
      begin
        vValorPago := DM.cdsPedidosVALOR_TOTAL.AsFloat;
        ImprimirCupomTassim('Teste',vValorPago);
      end
      else
      begin
        if MessageDlg('Deseja imprimir o nº do cpf/CNPJ ?',mtWarning,[mbok,mbno],0)=mrNo then
          vCpf := 'NAO INFORMADO'
        else
        begin
          if not dm.cdsGenerico.Active then
            dm.cdsGenerico.Active;
          dm.cdsGenerico.Close;
          dm.cdsGenerico.CommandText := 'select ven.nome_vendedor from vendedores ven where ven.id_vendedor = '+IntToStr(dm.cdsPedidosID_VENDEDOR.AsInteger);
          dm.cdsGenerico.Active := true;
          ACBrECF1.Operador := dm.cdsGenerico.FieldByName('nome_vendedor').AsString;
          try
            vContadorCPF := 0;
            repeat
              vCpf := Inputbox('Numero do CPF','Informe o nº do cpf/cnpj','');
              if Length(vCpf) <= 11 then
              begin
                if VerificaCPF(vCPF) then
                  vCPFCorreto := True;
              end
              else
              if (Length(vCpf) > 11) and (Length(vCpf) <= 14)  then
              begin
                if VerificaCNPJ(vCpf) then
                  vCPFCorreto := True;
              end
              else
              begin
                Inc(vContadorCPF);
                if vContadorCPF >= 3 then
                begin
                  showmessage('Valor inválido,o sistema não irá inserir o nº do cpf no cupom fiscal');
                  vCpf := 'NAO INFORMADO'
                end
                else
                begin
                  vCPFCorreto := False;
                  showmessage('Cpf informado está incorreto.Por favor,digite novamente.'+#13+
                              'CPF informado ao sistema : '+vCpf+#13+
                              'Você possui 3 Tentativas para digitar corretamente o numero'+#13+
                              'do cpf. Ainda restam '+IntToStr(3 - vContadorCPF)+' tentativas'+#13+
                              'após 3 tentativas, o sistema não irá preencher o cpf para esta venda');
                end;
              end;
            until (vCPFCorreto);
          except
            showmessage('Valor inválido,o sistema não irá inserir o nº do cpf no cupom fiscal');
            vCpf := 'NAO INFORMADO';
          end;
        end;
        try
          ACBrECF1.AbreCupom(vCpf,vNome,vEndereco,false);
        except on e:exception do
            begin
              MessageDlg('O sistema não conseguiu abrir o cupom fiscal'+#13+
                         'Erro reportado pelo sistema : '+e.Message,mtError,[mbOK],0);
            end;
        end;
        meuClient := TClientDataSet.Create(Self);
        meuClient.ProviderName := DM.cdsProdutos.ProviderName;
        meuClient.RemoteServer := dm.cdsProdutos.RemoteServer;
        meuClient.Close;
        dm.cdsPedidos_Itens.First;
        while not dm.cdsPedidos_Itens.Eof do
        begin
          Aliquota := IntToStr(dm.cdsPedidos_ItensALIQUOTA_ICMS.AsInteger)+',00';
          meuClient.Close;
          meuClient.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_ID = '+IntToStr(dm.cdsPedidos_ItensID_PRODUTO.AsInteger);
          meuClient.Open;
          aLIQUOTA := Trim(Aliquota);
          try
            ACBrECF1.VendeItem(IntToStr(meuClient.FieldByName('PRO_ID').AsInteger),dm.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString,Aliquota,
                               dm.cdsPedidos_ItensQUANTIDADE.AsFloat,dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat,
                               0,'','','D');
          except on e:exception do
            begin
              MessageDlg('O sistema não conseguiu vender um item no cupom fiscal'+#13+
                         'Erro reportado pelo sistema : '+e.Message,mtError,[mbOK],0);
              ACBrECF1.CancelaCupom;
              exit;
            end;
          end;
          dm.cdsPedidos_Itens.Next;
        end;
        vValorPago := DM.cdsPedidosVALOR_TOTAL.AsFloat;
        try
          ACBrECF1.SubtotalizaCupom(0,'');
        except on e:exception do
          begin
            MessageDlg('O sistema não conseguiu subtotalizar cupom fiscal'+#13+
                       'Erro reportado pelo sistema : '+e.Message,mtError,[mbOK],0);
            ACBrECF1.CancelaCupom;
            exit;
          end;
        end;

        if not dm.cdsGenerico.Active then
          dm.cdsGenerico.Active := true;
        dm.cdsGenerico.Close;
        dm.cdsGenerico.CommandText := 'SELECT ID_FORMA_DE_PAGAMENTO,VALOR FROM  PEDIDOS_FORMAS_CONDICOES WHERE ID_PEDIDO = '+
                                                       IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger)+
                                                       ' ORDER BY VALOR';
        dm.cdsGenerico.Active := True;

        while not dm.cdsGenerico.Eof do
        begin
          try
            //Bematech
            if (frmLogin.pModeloImpressora = '0') and (dm.cdsGenerico.FieldByName('ID_FORMA_DE_PAGAMENTO').AsInteger = 1) then
            begin
              ACBrECF1.EfetuaPagamento(('0'+IntToStr(dm.cdsGenerico.FieldByName('ID_FORMA_DE_PAGAMENTO').AsInteger)),dm.cdsGenerico.FieldByName('VALOR').AsFloat,'',False);
            end
            else
              ACBrECF1.EfetuaPagamento(IntToStr(dm.cdsGenerico.FieldByName('ID_FORMA_DE_PAGAMENTO').AsInteger),dm.cdsGenerico.FieldByName('VALOR').AsFloat,'',False);
          except on e:exception do
            begin
              MessageDlg('O sistema não conseguiu efetuar o pagamento do cupom fiscal'+#13+
                       'Erro reportado pelo sistema : '+e.Message,mtError,[mbOK],0);
              ACBrECF1.CancelaCupom;
              exit;
            end;
          end;
          dm.cdsGenerico.Next;
        end;
        try
          ACBrECF1.FechaCupom('Obrigado e volte sempre',0);
        except on e:exception do
          begin
            MessageDlg('O sistema não conseguiu efetuar o fechamento do cupom fiscal'+#13+
                       'Erro reportado pelo sistema : '+e.Message,mtError,[mbOK],0);
            ACBrECF1.CancelaCupom;
            exit;
          end;
        end;
      end;

      if not vConectaServidor.MovimentarCaixa(StrToInt(frmLogin.pNumeroCaixa),vConectaServidor.RetornaIdentificadorUsuario(frmLogin.pNomeUsuario),
                                              DM.cdsPedidosID_PEDIDO.AsInteger,'C','','Venda balcão',DM.cdsPedidosVALOR_TOTAL.AsFloat) then
        MessageDlg('O sistema não conseguiu efetuar movimentação do caixa',mtError,[mbOK],0);
      try
        {
          vConectaServidor.EfetuarMovimentacaoCliente(DM.cdsPedidosID_CLIENTE.AsInteger,vConectaServidor.RetornaIdentificadorUsuario(frmLogin.pNomeUsuario),
                                                      DM.cdsPedidosID_PEDIDO.AsInteger,'D','Venda a vale','',DM.cdsPedidosVALOR_TOTAL_PEDIDO.AsFloat);

        }

        DM.cdsPedidos.Edit;
        dm.cdsPedidosVALOR_TOTAL.Value := vSomaValorTotal - dm.cdsPedidosVALOR_DESCONTO.Value;
        dm.cdsPedidosVALOR_TOTAL_PRODUTOS.Value := vSomaValorTotal;

        DM.cdsPedidosPEDIDO_EM_VENDA.AsString := 'N';
        DM.cdsPedidosNUMERO_COMANDA.AsString := '';
        DM.cdsPedidos.Post;
        DM.cdsPedidos.ApplyUpdates(0);
        dm.cdsPedidos_Itens.ApplyUpdates(0);
        if Length(aIdentificadoresPedido) > 0 then
        begin
          for I := 0 to Length(aIdentificadoresPedido)-1 do
            vConectaServidor.DeletarPedidosEItensDeAcordoComONumeroDaComanda(aIdentificadoresPedido[I]);

          SetLength(aIdentificadoresPedido,0);

        end;
        vString := '';
        vString := '________________________________________________________________';
        cxMemo1.Lines.Add(vString);
        vString := 'Quantidade de Itens : '+IntToStr(vContador);
        cxMemo1.Lines.Add(vString);
        vString := 'Valor Total dos Itens : '+FormatFloat('###,###,##0.00',vSomaValorTotal);
        cxMemo1.Lines.Add(vString);
        vString := 'Valor Total do Desconto : '+FormatFloat('###,###,##0.00',dm.cdsPedidosVALOR_DESCONTO.AsFloat);
        cxMemo1.Lines.Add(vString);
        vString := 'Valor Troco : '+FormatFloat('###,###,##0.00',Troco);
        cxMemo1.Lines.Add(vString);
        vString := 'Obrigado e Volte Sempre';
        cxMemo1.Lines.Add(vString);
        MessageDlg('Venda finalizada com sucesso',mtConfirmation,[mbOk],0);
        vTipoVenda := '';
        edtPesquisa.Clear;
        edtDescricao.Clear;
        edtQuantidade.Clear;
        edtPreco.Clear;
        edtPrecoTotal.Clear;
        edtDesconto.Clear;
        edtPesquisa.SetFocus;
        vStatusVenda := False;
        edtSubTotal.Text := '0,00';
        //      Sleep(1000);
        cxMemo1.Lines.Clear;
      except
        DM.cdsPedidos_Itens.CancelUpdates;
        DM.cdsPedidos.CancelUpdates;
        MessageDlg('Não foi possível efetuar esta venda.',mtError,[mbOk],0);
      end;
      FreeAndNil(meuClient);
    end
    else
    //sat
    if frmLogin.pSat_ECF=1 then
    begin
      try
        try
          if not Assigned(vConectaServidor) then
          begin
            try
              vConectaServidor := TDSModuleDBClient.Create(dm.SQLConexao.DBXConnection);
            except on e:Exception do
              begin
                MessageDlg('Não foi possível efetuar esta venda.'+#13+
                           'Verifique a conexão com o servidor.'+#13+
                           'Erro : '+e.Message,mtError,[mbOk],0);
              end;
            end;
          end;
          // Trasnferindo Informações de Config para o CFe //
          ACBrSAT1.CFe.IdentarXML := True;
          ACBrSAT1.CFe.TamanhoIdentacao := 3;
          AjustarAcbrSat;
          ACBrSAT1.InicializaCFe ;
          ACBrSAT1.Cfe.ide.numeroCaixa := 1;
          ACBrSAT1.Cfe.ide.cNF := DM.cdsPedidosID_PEDIDO.AsInteger;
          ACBrSAT1.CFe.RetirarAcentos:= true;
          DM.cdsgenerico.Close;
          DM.cdsGenerico.CommandText :='SELECT TRIM(CPF) CPF, RAZAO_SOCIAL FROM CLIENTES WHERE ID_CLIENTE = '+IntToStr(dm.cdsPedidosID_CLIENTE.AsInteger);
          DM.cdsGenerico.Open;
          if RetirarPontosETracos( DM.cdsGenerico.FieldByName('CPF').Asstring) = '' then
          begin
            if MessageDlg('Deseja imprimir o nº do CPF/CNPJ ?',mtWarning,[mbok,mbno],0)=mrNo then
              vCpf := 'NAO INFORMADO'
            else
            begin
              try
                vContadorCPF := 0;
                repeat
                  vCpf := Inputbox('Numero do CPF','Informe o nº do cpf/cnpj','');
                  if Length(vCpf) <= 11 then
                  begin
                    if vCpf <> '' then
                    begin
                      if VerificaCPF(vCPF) then
                        vCPFCorreto := True;
                    end
                    else
                    begin
                      vCpf := 'NAO INFORMADO';
                      vCPFCorreto := False;
                    end;
                  end
                  else
                  if (Length(vCpf) > 11) and (Length(vCpf) <= 14)  then
                  begin
                    if VerificaCNPJ(vCpf) then
                      vCPFCorreto := True;
                  end
                  else
                  begin
                    Inc(vContadorCPF);
                    if vContadorCPF >= 3 then
                    begin
                      showmessage('Valor inválido, sistema não irá inserir o nº do cpf no cupom fiscal');
                      vCpf := 'NAO INFORMADO'
                    end
                    else
                    begin
                      vCPFCorreto := False;
                      showmessage('CPF/CNPJ informado está incorreto.Por favor,digite novamente.'+#13+
                                  'CPF/CNPJ informado ao sistema : '+vCpf+#13+
                                  'Você possui 3 Tentativas para digitar corretamente o numero'+#13+
                                  'do CPF/CNPJ. Ainda restam '+IntToStr(3 - vContadorCPF)+' tentativas'+#13+
                                  'após 3 tentativas, o sistema não irá preencher o CPF/CNPJ para esta venda');
                    end;
                  end;
                until (vCPFCorreto);
              except
                showmessage('Valor inválido, sistema não irá inserir o nº do cpf no cupom fiscal');
                vCpf := 'NAO INFORMADO';
              end;
            end;
            if vCpf <> 'NAO INFORMADO' then
            begin
              ACBrSAT1.CFe.Dest.CNPJCPF := vCpf;
            end;
          end
          else
          begin
            vCpf :=  RetirarPontosETracos( DM.cdsGenerico.FieldByName('CPF').Asstring);
            try
              if Length(vCpf) <= 11 then
              begin
                if VerificaCPF(vCPF) then
                  vCPFCorreto := True
                else
                  vCPFCorreto := false;
              end
              else
              if (Length(vCpf) > 11) and (Length(vCpf) <= 14)  then
              begin
                if VerificaCNPJ(vCpf) then
                  vCPFCorreto := True
                else
                  vCPFCorreto := false;
              end;

              if not vCPFCorreto  then
              begin
                showmessage('Valor inválido,o sistema não irá inserir o nº do CPF/CNPJ no cupom fiscal');
                vCpf := 'NAO INFORMADO'
              end;
            except
              showmessage('Valor inválido,o sistema não irá inserir o nº do cpf no cupom fiscal');
              vCpf := 'NAO INFORMADO';
            end;
          end;
          if vCpf <> 'NAO INFORMADO' then
          begin
            ACBrSAT1.CFe.Dest.xNome:= DM.cdsGenerico.FieldByName('RAZAO_SOCIAL').Asstring;
            ACBrSAT1.CFe.Dest.CNPJCPF := vCpf;
          end;

          if ACBrSAT1.CFe.Dest.xNome = '' then
          begin
            DM.cdsgenerico.Close;
            DM.cdsGenerico.CommandText := 'SELECT TRIM(CPF) CPF, RAZAO_SOCIAL FROM CLIENTES WHERE ID_CLIENTE = '+IntToStr(frmlogin.pClintePadrao);
            DM.cdsGenerico.Open;
            if ACBrSAT1.CFe.Dest.xNome = '' then
            begin
              ACBrSAT1.CFe.Dest.xNome:= DM.cdsGenerico.FieldByName('RAZAO_SOCIAL').Asstring;
              if DM.cdsGenerico.FieldByName('CPF').Asstring <> '' then
                ACBrSAT1.CFe.Dest.CNPJCPF := DM.cdsGenerico.FieldByName('CPF').Asstring;
            end;
          end;

          //Verificando se os campos basicos estao preenchidos
          DM.cdsgenerico.Close;
          DM.cdsGenerico.CommandText := 'select ' + #13#10 +
                                        ' pit.DESCRICAO_PRODUTO, ' + #13#10 +
                                        ' prod.cfop, ' + #13#10 +
                                        ' prod.unidade, ' + #13#10 +
                                        ' prod.codigo_ncm ' + #13#10 +
                                        ' from pedidos_itens pit ' + #13#10 +
                                        ' inner join produtos prod on prod.pro_id=pit.id_produto ' + #13#10 +
                                        ' where pit.id_pedido = '+ IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger) + #13#10 +
                                        '   and ' + #13#10 +
                                        ' (prod.cfop is null or ' + #13#10 +
                                        ' prod.unidade is null ' + #13#10 +
                                        ')';
          DM.cdsGenerico.Open;
          DM.cdsGenerico.First;
          if (DM.cdsGenerico.RecordCount > 0) and (not DM.cdsGenerico.eof) then
          begin
            vTexto := '';
            vTextoAux := '';
            while not DM.cdsGenerico.eof do
            begin
              vTexto :=  vTexto+'O produto '+DM.cdsGenerico.FieldByName('DESCRICAO_PRODUTO').AsString+' está com os seguintes campos sem preenchimento :'#13#10;
              if DM.cdsGenerico.FieldByName('cfop').AsString = '' then
              begin
                vTextoAux := vTextoAux + 'CFOP' +#13#10;
              end;
              if DM.cdsGenerico.FieldByName('unidade').AsString = '' then
              begin
                vTextoAux := vTextoAux + 'UNIDADE'+#13#10;
              end;
              vTexto :=  vTexto +#13#10+vTextoAux;
              DM.cdsGenerico.Next;
            end;
            MessageDlg('O processo será interrompido devido ao erro mencionado abaixo.'+#13+
                       vTexto,mtError,[mbOK],0);
            DM.cdsGenerico.Close;
            Abort;
          end;
          // Montando uma Venda //

          vContador := 0;
          vSomaValorTotal := 0;
          TotalGeralItem := 0;

          DM.cdsPedidos_Itens.First;
          while not DM.cdsPedidos_Itens.Eof do
          begin
            Inc(vContador);
            vSomaValorTotal := vSomaValorTotal + DM.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
            with ACBrSAT1.CFe do
            begin
              with Det.New do
              begin
                DM.cdsGenerico.Close;
                dm.cdsGenerico.CommandText := ' select first 1 '+#13+
                                              ' produtos.pro_codigo, '+#13+
                                              ' produtos.pro_ean13, '+#13+
                                              ' produtos.codigo_ncm, '+#13+
                                              ' produtos.unidade, '+#13+
                                              ' produtos.CFOP '+#13+
                                              ' from produtos '+#13+
                                              ' where 1 = 1 ' +#13;

                if (DM.cdsPedidos_ItensID_PRODUTO.AsInteger > 0) then
                  dm.cdsGenerico.CommandText := dm.cdsGenerico.CommandText +' and produtos.COD_PROD = '+IntToStr(DM.cdsPedidos_ItensID_PRODUTO.AsInteger);
                if (DM.cdsPedidos_ItensCodigo.AsString <> '') then
                  dm.cdsGenerico.CommandText := dm.cdsGenerico.CommandText +'  and produtos.PRO_CODIGO = '+QuotedStr( DM.cdsPedidos_ItensCodigo.AsString);
                DM.cdsGenerico.Open;

                if (DM.cdsGenerico.Recordcount <= 0) then
                begin
                  DM.cdsGenerico.Close;
                  dm.cdsGenerico.CommandText := ' select first 1 '+#13+
                                              ' produtos.pro_codigo, '+#13+
                                              ' produtos.pro_ean13, '+#13+
                                              ' produtos.codigo_ncm, '+#13+
                                              ' produtos.unidade, '+#13+
                                              ' produtos.CFOP '+#13+
                                              ' from produtos '+#13+
                                              ' where 1 = 1 ' +#13+
                                              ' and produtos.pro_id = '+ IntToStr(DM.cdsPedidos_ItensID_PRODUTO.AsInteger);
                  DM.cdsGenerico.Open;
                end;


                nItem := vContador;
                Prod.cProd := DM.cdsGenerico.FieldByName('pro_codigo').AsString;
                // Prod.cEAN := RetirarPontosETracos(DM.cdsGenerico.FieldByName('pro_ean13').AsString);
                Prod.xProd := copy(DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString,1,120);
                prod.NCM := RetirarPontosETracos(DM.cdsGenerico.FieldByName('codigo_ncm').AsString);
                Prod.CFOP := DM.cdsGenerico.FieldByName('CFOP').AsString;
                Prod.uCom := DM.cdsGenerico.FieldByName('unidade').AsString;
                Prod.qCom := DM.cdsPedidos_ItensQUANTIDADE.AsFloat;
                Prod.vUnCom := DM.cdsPedidos_ItensVALOR_UNITARIO.AsFloat;
                Prod.indRegra := irTruncamento;
                Prod.vDesc := DM.cdsPedidos_ItensDESCONTO.AsFloat;
                vDesc:=vDesc + DM.cdsPedidos_ItensDESCONTO.AsFloat;
                //Showmessage( DM.cdsGenerico.FieldByName('CFOP').AsString + ' - ' +DM.cdsGenerico.FieldByName('unidade').AsString);

                TotalItem := RoundABNT((Prod.qCom * Prod.vUnCom) + Prod.vOutro - Prod.vDesc,-2);
                Imposto.vItem12741 := TotalItem * frmLogin.pAliqIcm;
                TotalGeralItem := RoundABNT(TotalGeralItem + (TotalItem * frmLogin.pAliqIcm),-2);
                Imposto.ICMS.orig := oeNacional;
                Imposto.ICMS.CSOSN := csosn102;

                Imposto.PIS.CST := pis49;
                Imposto.PIS.vBC := TotalItem;
                Imposto.PIS.pPIS := frmLogin.pAliqPis;

                Imposto.COFINS.CST := cof49;
                Imposto.COFINS.vBC := TotalItem;
                Imposto.COFINS.pCOFINS := frmLogin.pAliqCofins;
                infAdProd := '';
              end;

            end;
            DM.cdsPedidos_Itens.Next;
          end;
          DM.cdsPedidos.Edit;
          dm.cdsPedidosVALOR_TOTAL.Value := vSomaValorTotal;
          DM.cdsPedidos.Post;

          //Escolhendo a forma de pagamento
          if not Assigned(frmlookUpFormaPagamento) then
            frmlookUpFormaPagamento := TfrmlookUpFormaPagamento.Create(Self);
          frmlookUpFormaPagamento.Left := Trunc(Screen.Width / 2) - 300;
          frmlookUpFormaPagamento.Top := Trunc(Screen.Height / 2) - 300;
          if not DM.cdsFormasDePagamento.Active then
            dm.cdsFormasDePagamento.Active := True;


          frmlookUpFormaPagamento.ShowModal;
          if not frmlookUpFormaPagamento.vContinua then
          begin
            if not dm.cdsGenerico.Active then
              ExcluirParcelamentoPedido(dm.cdsPedidosID_PEDIDO.AsInteger);
            abort;
          end;

          dm.cdsPedidos_Formas_Condicoes.First;
          while not dm.cdsPedidos_Formas_Condicoes.Eof do
          begin
            with ACBrSAT1.CFe.Pagto.New do
            begin
              if (AnsiUpperCase(dm.cdsPedidos_Formas_CondicoesDESCRICAO_FORMA_DE_PAGAMENTO.AsString) = 'DINHEIRO') AND (dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat > 0) then
              begin
                cMP := MPDinheiro;
                vMP := dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat;
                ACBrSAT1.CFe.Pagto.vTroco:= frmlookUpFormaPagamento.vtroco;
              end
              else
              if (AnsiUpperCase(dm.cdsPedidos_Formas_CondicoesDESCRICAO_FORMA_DE_PAGAMENTO.AsString) = 'CREDITO') AND (dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat > 0) then
              begin
                cMP := mpCartaodeCredito;
                vMP := dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat;
              end
              else
              if (AnsiUpperCase(dm.cdsPedidos_Formas_CondicoesDESCRICAO_FORMA_DE_PAGAMENTO.AsString) = 'DEBITO') AND (dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat > 0) then
              begin
                cMP := mpCartaodeDebito;
                vMP := dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat;
              end
              else
              begin
                if (dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat > 0) then
                begin
                  cMP := mpOutros;
                  vMP := dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat;
                end;
              end;
            end;
            dm.cdsPedidos_Formas_Condicoes.Next;
          end;


          ACBrSAT1.CFe.InfAdic.infCpl := ' ';

          ACBrSAT1.CFe.Total.vCFeLei12741 := TotalGeralItem;
          ACBrSAT1.CFe.Total.DescAcrEntr.vDescSubtot :=  dm.cdsPedidosVALOR_DESCONTO.AsFloat;

          DM.cdsPedidos.Edit;
          dm.cdsPedidosVALOR_TOTAL.Value := vSomaValorTotal - dm.cdsPedidosVALOR_DESCONTO.Value;
          dm.cdsPedidosVALOR_TOTAL_PRODUTOS.Value := vSomaValorTotal;
          DM.cdsPedidosPEDIDO_EM_VENDA.Value := 'S';
          DM.cdsPedidos.Post;

          memo := TMemo.Create(Self);
          memo.Parent := Self.Parent;
          mVendaEnviar.Visible := true;
          memo.Left := -1000;
          memo.Lines.Text := ACBrSAT1.CFe.GerarXML( True );
         // mVendaEnviar.Clear;

          //mVendaEnviar.Lines.Text := ACBrSAT1.CFe.GerarXML( True );

          //mVendaEnviar.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'\Pedido-'+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger)+'CFe-'+IntToStrZero(ACBrSAT1.numeroSessao,6)+'.xml');

          //   mVendaEnviar.Lines.Clear;
          //  mVendaEnviar.Lines.Text := ACBrSAT1.CFe.AsXMLString;
          //  mVendaEnviar.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'Res\Pedido-'+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger)+' CFe-'+ACBrSAT1.CFe.infCFe.ID+'-rec.xml');

          //GeraVenda(Ememo.Text);    // True = Gera apenas as TAGs da aplicação
          //Showmessage('test');

          //if ACBrSAT1.Inicializado then
          //begin
          //  Showmessage('Inicializado!')

          //end
          //else
          //begin
          //  Showmessage('Desinicializado!');
          //  ACBrSAT1.Inicializar;
          //end;


          //if not ACBrSAT1.ValidarDadosVenda( mVendaEnviar.Text, Erro ) then
          //begin
          //   Showmessage('Erro ao efetuar venda'+#13+Erro);
          //   exit;
          //end;
          //ACBrSAT1.Inicializado := not ACBrSAT1.Inicializado ;


          ACBrSAT1.EnviarDadosVenda( memo.Text);

          if ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
          begin
            //ForceDirectories(ExtractFilePath(Application.ExeName)+'Env');
            //ForceDirectories(ExtractFilePath(Application.ExeName)+'Res');
            //mVendaEnviar.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'Env\Pedido-'+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger)+' CFe-'+IntToStrZero(ACBrSAT1.numeroSessao,6)+'.xml');

            memo.Lines.Clear;
            memo.Lines.Text := ACBrSAT1.CFe.AsXMLString;
            memo.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'Res\Pedido-'+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger)+' CFe-'+ACBrSAT1.CFe.infCFe.ID+'-rec.xml');

            (*ACBrPosPrinter1.Desativar;
            ACBrPosPrinter1.Device.Baud := 115200;
            ACBrPosPrinter1.ColunasFonteNormal := 48;
            ACBrPosPrinter1.EspacoEntreLinhas := 0;*)
            // ACBrPosPrinter1.Buffer := 0;
            (*ACBrPosPrinter1.LinhasEntreCupons := 0;
            ACBrPosPrinter1.ConfigQRCode.Tipo := 2;
            ACBrPosPrinter1.ConfigQRCode.LarguraModulo := 4;
            ACBrPosPrinter1.ConfigQRCode.ErrorLevel := 0;
            ACBrPosPrinter1.ConfigLogo.KeyCode1 := 32;
            ACBrPosPrinter1.ConfigLogo.KeyCode2 := 32;
            ACBrPosPrinter1.ConfigLogo.FatorX := 1;
            ACBrPosPrinter1.ConfigLogo.FatorY := 1;
            ACBrPosPrinter1.ConfigBarras.LarguraLinha := 0;
            ACBrPosPrinter1.ConfigBarras.Altura := 0;
            ACBrPosPrinter1.ConfigBarras.MostrarCodigo := False;
            ACBrSATExtratoESCPOS1.ImprimeQRCode := True;*)
            //GerarCupomSat(mVendaEnviar);
            //ACBrPosPrinter1.Imprimir(mVendaEnviar.Text);

            //ACBrSATExtratoFortes1.
            ACBrSATExtratoFortes1.Impressora:= GetImpressora;
            //ACBrSATExtratoFortes1.Margens.Esquerda:= 2;
            //ACBrSATExtratoFortes1.Margens.Direita:= 2;
            //ACBrSATExtratoFortes1.LarguraBobina:= 286;

            ACBrSATExtratoFortes1.LarguraBobina       := 286;
            ACBrSATExtratoFortes1.MargemSuperior        := 0;
            ACBrSATExtratoFortes1.MargemInferior      := 0;
            ACBrSATExtratoFortes1.MargemEsquerda := 5;
            ACBrSATExtratoFortes1.MargemDireita      := 1;


            ACBrSAT1.Extrato := ACBrSATExtratoFortes1;
            ACBrSAT1.Extrato.ImprimeQRCode:= true;
            ACBrSAT1.Extrato.ImprimeMsgOlhoNoImposto:= true;
            ACBrSAT1.Extrato.ImprimeDescAcrescItem:= true;
            ACBrSAT1.Extrato.Sistema:= 'Business Controller';
            //showmessage('aqui');
            //ACBrSATExtratoFortes1.MostrarPreview   := true;
            ACBrSAT1.ImprimirExtrato;

            dm.cdsPedidos.Edit;
            dm.cdsPedidosSTATUS.Value := 'Realizado';
            DM.cdsPedidosNUMEROCUPOMFISCAL.AsString := IntToStr(ACBrSAT1.CFe.ide.cNF);
            DM.cdsPedidosPEDIDO_EM_VENDA.AsString := 'N';
            DM.cdsPedidosNUMERO_COMANDA.AsString := '';
            DM.cdsPedidosDATA_PEDIDO.Value := Date;
            DM.cdsPedidosHORA_PEDIDO.Value := Time;
            dm.cdsPedidos.Post;

            //Movimentação do produto
            //Ambiente produção sat
            if frmLogin.pTipoAmbienteSat=0 then
            begin
              DM.cdsPedidos_Itens.First;
              while not dm.cdsPedidos_Itens.Eof do
              begin
                if vConectaServidor.InserirEmMovimentacoes(DM.cdsPedidos_ItensID_PRODUTO.AsInteger,DM.cdsPedidos_ItensID_PEDIDO.AsInteger,
                                                               DM.cdsPedidos_ItensQUANTIDADE.AsFloat,'Venda','S') = 0 then
                  break;

                dm.cdsPedidos_Itens.Next;
              end;
            end;

            DM.cdsPedidos.ApplyUpdates(0);
            dm.cdsPedidos_Itens.ApplyUpdates(0);

            if Length(aIdentificadoresPedido) > 0 then
            begin
              for I := 0 to Length(aIdentificadoresPedido)-1 do
                vConectaServidor.DeletarPedidosEItensDeAcordoComONumeroDaComanda(aIdentificadoresPedido[I]);

              SetLength(aIdentificadoresPedido,0);
            end;
            vString := '';
            vString := '________________________________________________________________';
            cxMemo1.Lines.Add(vString);
            vString := 'Quantidade de Itens : '+IntToStr(vContador);
            cxMemo1.Lines.Add(vString);
            vString := 'Valor Total dos Itens : '+FormatFloat('###,###,##0.00',vSomaValorTotal);
            cxMemo1.Lines.Add(vString);
            vString := 'Valor Total do Desconto : '+FormatFloat('###,###,##0.00',dm.cdsPedidosVALOR_DESCONTO.AsFloat);
            cxMemo1.Lines.Add(vString);
            vString := 'Obrigado e Volte Sempre';
            cxMemo1.Lines.Add(vString);
            MessageDlg('Venda finalizada com sucesso',mtConfirmation,[mbOk],0);
            vTipoVenda := '';
            edtPesquisa.Clear;
            edtDescricao.Clear;
            edtQuantidade.Clear;
            edtPreco.Clear;
            edtPrecoTotal.Clear;
            edtDesconto.Clear;
            //edtPesquisa.SetFocus;
            vStatusVenda := False;
            edtSubTotal.Text := '0,00';
            //      Sleep(1000);
            cxMemo1.Lines.Clear;
          end
          else
          begin
            DM.cdsPedidos_Itens.CancelUpdates;
            DM.cdsPedidos.CancelUpdates;
            MessageDlg('Erro na emissão do Sat'+#13+ACBrSAT1.RespostaComando+#13+
            inttostr(ACBrSAT1.Resposta.codigoDeErro)+ACBrSAT1.Resposta.RetornoStr+#13+
            inttostr(ACBrSAT1.Resposta.codigoSEFAZ)+ACBrSAT1.Resposta.mensagemSEFAZ+#13+
            inttostr(ACBrSAT1.Resposta.codigoDeRetorno)+'-'+ACBrSAT1.Resposta.mensagemRetorno,mtConfirmation,[mbOk],0);
            vTipoVenda := '';
            cxMemo1.Lines.Clear;
          end;
          if memo.Lines.Count < 1 then
          begin
            ACBrSAT1.CancelarUltimaVenda;
          end;
          if ACBrSAT1.Resposta.codigoDeRetorno = 7000 then
          begin
            MessageDlg('Venda cancelada',mtConfirmation,[mbOk],0);
          end;
        except on e:Exception do
          begin
            MessageDlg('Erro ao efetuar venda'+#13+
                       'Mensagem de erro : '+e.Message ,mtConfirmation,[mbOk],0);
          end;
        end;
      finally
        if Assigned(memo) then
        begin
          FreeAndNil(memo);
        end;
        if not Assigned(vConectaServidor) then
        begin
          FreeAndNil(vConectaServidor);
        end;
        FreeAndNil(frmlookUpFormaPagamento);

      end;
    end;
  end
  else
  begin
    MessageDlg('Venda não foi iniciada.',mtError,[mbOk],0);
  end;
end;

procedure TfrmVendasBalcao.spbConsultarPrecoClick(Sender: TObject);
var
  Rel : TfrmRelatorios;
begin
  Rel := TfrmRelatorios.Create(Self);
  Rel.ConsultarPreco;
  FreeAndNil(Rel);
end;

procedure TfrmVendasBalcao.spbEfetuarPagamentoClienteClick(Sender: TObject);
begin
//
end;

procedure TfrmVendasBalcao.spbFecharCupomClick(Sender: TObject);
begin
  if not ACBrECF1.Ativo then
    ACBrECF1.Ativar;
  ACBrECF1.SubtotalizaCupom(0,'Dinheiro');
  ACBrECF1.EfetuaPagamento('01',100,'Teste',False);
  ACBrECF1.FechaCupom('Obrigado e volte sempre',0);
end;

procedure TfrmVendasBalcao.spbImprimirCupomClick(Sender: TObject);
//var
//  iRetorno : integer;
//  vString,vString2,vString3:string;
begin
 //ACBrECF1.VendeItem('1232','Teste','00,00',10,10,0,'pç','','D');
  //ACBrECF1.FechaCupom('fechou',0);
end;

end.
