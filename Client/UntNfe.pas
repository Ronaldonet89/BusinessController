unit UntNfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  Vcl.Menus, cxButtons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Mask,
  Vcl.DBCtrls, cxGroupBox, cxRadioGroup, cxDBEdit, cxLabel, cxScrollBox,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxDBNavigator, ACBrNFe,pcnConversao,pcnNFe,
  ACBrNFeDANFEClass, ACBrNFeDANFEFR, Vcl.DBCGrids, cxPCdxBarPopupMenu, cxPC,
  ACBrBase, ACBrDFe, ACBrNFeDANFEFRDM, System.UITypes;

type
  TfrmNfe = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    ACBrNFeDANFEFR1: TACBrNFeDANFEFR;
    ACBrNFe1: TACBrNFe;
    cxPCPrincipal: TcxPageControl;
    cxTsPesquisa: TcxTabSheet;
    cxTSInserirNota: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxPCAuxiliarNotaFiscal: TcxPageControl;
    cxTSItensDaNota: TcxTabSheet;
    Panel1: TPanel;
    cxDBNavigator2: TcxDBNavigator;
    cxGroupBox2: TcxGroupBox;
    cxDBNavigator1: TcxDBNavigator;
    cxBtnEnviarNFe: TcxButton;
    cxGridNotasFiscaisDBTableView1: TcxGridDBTableView;
    cxGridNotasFiscaisLevel1: TcxGridLevel;
    cxGridNotasFiscais: TcxGrid;
    cxGridNotasFiscaisDBTableView1ID_NOTA_FISCAL: TcxGridDBColumn;
    cxGridNotasFiscaisDBTableView1ID_PEDIDO: TcxGridDBColumn;
    cxGridNotasFiscaisDBTableView1DATA_EMISSAO: TcxGridDBColumn;
    cxGridNotasFiscaisDBTableView1DATA_SAIDA_ENTRADA: TcxGridDBColumn;
    cxGridNotasFiscaisDBTableView1HORA_SAIDA_ENTRADA: TcxGridDBColumn;
    cxGridNotasFiscaisDBTableView1VALOR_TOTAL_NOTA: TcxGridDBColumn;
    cxGridNotasFiscaisDBTableView1CHAVE: TcxGridDBColumn;
    cxGridNotasFiscaisDBTableView1NUMERO_NOTA_FISCAL: TcxGridDBColumn;
    cxGridNotasFiscaisDBTableView1DATA_HORA_RECEBIMENTO: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxTSFaturas: TcxTabSheet;
    cxTSTransportadores: TcxTabSheet;
    cxDBTextEdit35: TcxDBTextEdit;
    cxDBTextEdit36: TcxDBTextEdit;
    cxDBTextEdit38: TcxDBTextEdit;
    cxDBTextEdit39: TcxDBTextEdit;
    cxDBTextEdit40: TcxDBTextEdit;
    cxDBTextEdit41: TcxDBTextEdit;
    cxDBTextEdit42: TcxDBTextEdit;
    cxDBTextEdit43: TcxDBTextEdit;
    cxDBTextEdit44: TcxDBTextEdit;
    cxDBTextEdit45: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel38: TcxLabel;
    cxLabel39: TcxLabel;
    cxLabel40: TcxLabel;
    cxLabel41: TcxLabel;
    cxLabel42: TcxLabel;
    cxLabel43: TcxLabel;
    cxLabel44: TcxLabel;
    cxLabel45: TcxLabel;
    cxButton3: TcxButton;
    DBEdit1: TDBEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxDBTextEdit37: TcxDBTextEdit;
    cxDBTextEdit34: TcxDBTextEdit;
    cxDBNavigator3: TcxDBNavigator;
    cxLabel46: TcxLabel;
    cxLabel47: TcxLabel;
    cxGrid1DBTableView1VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR: TcxGridDBColumn;
    cxPCNotasFiscais: TcxPageControl;
    cxTSPrincipal: TcxTabSheet;
    cxTSNotaFiscalImpostos: TcxTabSheet;
    cxLabel1: TcxLabel;
    DBEdit2: TDBEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit18: TcxDBTextEdit;
    cxButton2: TcxButton;
    cxDBTextEdit19: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxLabel15: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel18: TcxLabel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    cxDBRadioGroup2: TcxDBRadioGroup;
    cxDBRadioGroup3: TcxDBRadioGroup;
    cxLabel21: TcxLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxLabel31: TcxLabel;
    cxDBTextEdit16: TcxDBTextEdit;
    cxLabel16: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel26: TcxLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    cxLabel25: TcxLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    cxLabel20: TcxLabel;
    cxLabel22: TcxLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxLabel24: TcxLabel;
    cxDBTextEdit14: TcxDBTextEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    cxLabel30: TcxLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxLabel23: TcxLabel;
    cxLabel17: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel28: TcxLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxLabel27: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    cxLabel37: TcxLabel;
    DBEdit3: TDBEdit;
    cxDBTextEdit17: TcxDBTextEdit;
    cxLabel48: TcxLabel;
    cxLabel32: TcxLabel;
    cxDBTextEdit23: TcxDBTextEdit;
    cxLabel33: TcxLabel;
    cxDBTextEdit22: TcxDBTextEdit;
    cxLabel34: TcxLabel;
    cxDBTextEdit21: TcxDBTextEdit;
    cxLabel35: TcxLabel;
    cxDBTextEdit20: TcxDBTextEdit;
    cxLabel49: TcxLabel;
    cxLabel50: TcxLabel;
    cxdbtNumeroParcelas: TcxDBTextEdit;
    cxLabel51: TcxLabel;
    cxButton4: TcxButton;
    cxButton6: TcxButton;
    cxPCItensNF: TcxPageControl;
    cxTSProdutos: TcxTabSheet;
    cxTSImpostos: TcxTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    cxDBTextEdit24: TcxDBTextEdit;
    cxDBTextEdit25: TcxDBTextEdit;
    cxDBTextEdit26: TcxDBTextEdit;
    cxDBTextEdit27: TcxDBTextEdit;
    cxDBTextEdit33: TcxDBTextEdit;
    cxDBTextEdit28: TcxDBTextEdit;
    cxDBTextEdit29: TcxDBTextEdit;
    cxDBTextEdit30: TcxDBTextEdit;
    cxDBTextEdit32: TcxDBTextEdit;
    cxDBTextEdit31: TcxDBTextEdit;
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxGroupBox8: TcxGroupBox;
    cxGroupBox9: TcxGroupBox;
    cxLabel52: TcxLabel;
    cxLabel53: TcxLabel;
    cxLabel54: TcxLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    cxLabel55: TcxLabel;
    DBEdit7: TDBEdit;
    cxLabel56: TcxLabel;
    DBEdit8: TDBEdit;
    cxLabel57: TcxLabel;
    DBEdit9: TDBEdit;
    cxLabel58: TcxLabel;
    DBEdit10: TDBEdit;
    cxLabel59: TcxLabel;
    DBEdit11: TDBEdit;
    cxLabel60: TcxLabel;
    DBEdit12: TDBEdit;
    cxLabel61: TcxLabel;
    DBEdit13: TDBEdit;
    cxLabel62: TcxLabel;
    DBEdit14: TDBEdit;
    cxLabel63: TcxLabel;
    DBEdit15: TDBEdit;
    cxDBTextEdit46: TcxDBTextEdit;
    cxLabel64: TcxLabel;
    cxBtnEfetuarCalculo: TcxButton;
    cxGroupBox10: TcxGroupBox;
    cxLabel65: TcxLabel;
    DBEdit16: TDBEdit;
    cxLabel66: TcxLabel;
    DBEdit17: TDBEdit;
    cxLabel67: TcxLabel;
    DBEdit18: TDBEdit;
    cxDBTextEdit47: TcxDBTextEdit;
    cxDBTextEdit48: TcxDBTextEdit;
    cxButton5: TcxButton;
    cxButton7: TcxButton;
    procedure BackToMainForm(Sender: TObject);
    procedure cxBtnEnviarNFeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxDBNavigator2ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure cxGridNotasFiscaisDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure LocalizarFatura(qIdNotaFiscal : integer);
    procedure DBEdit2Change(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxTSItensDaNotaShow(Sender: TObject);
    procedure cxBtnEfetuarCalculoClick(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure EnviarNFe(qIdNotaFiscal:integer);
    procedure AtualizaConfigAcBr;
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNfe: TfrmNfe;

implementation

{$R *.dfm}

uses GroupedItems1, UDataModul, UntConectaServidor, ULogin, UntLookUpProdutos,
  UntCadastroCompraVenda, UntLookUpClientes, Unttransportadores,
  UntLookUpTransportadores, UntLookUpTiposDeOperacao, UProceduresClient,
  UntLookUpCondicaoDePagamento, UntFormasDePagamento;

{ TForm1 }

procedure TfrmNfe.AtualizaConfigAcBr;
var OK : Boolean;
begin
  // realiza a leidura dos dados do arquivo de configuração
  LeArqIni;
  // Repassa Dados para componente AcBrNFe
  {$IFDEF AcBrMFeOpenSSL}
    ACBrNFe1.configuracoes.Certificados.Certificado := frmLogin.sCertificado;
    AcBrNFe1.Configuracoes.Certificados.Senha       := frmLogin.sSenha;
  {$ELSE}
    AcBrNFe1.Configuracoes.Certificados.NumeroSerie := frmLogin.sSerial;
  {$ENDIF}
  // Geral
  ACBrNFe1.Configuracoes.Geral.FormaEmissao         := StrToTpEmis(OK,IntToStr(frmLogin.sFormas));
  ACBrNFe1.Configuracoes.Geral.Salvar               := frmLogin.sSalvaArq;
  ACBrNFe1.Configuracoes.Arquivos.PathSalvar           := frmLogin.sPathArq;
  // WebServices
  ACBrNFe1.Configuracoes.WebServices.UF             := frmLogin.sUFWS;
  if frmLogin.sAmbiente = 0 then
    ACBrNFe1.Configuracoes.WebServices.Ambiente       := StrToTpAmb(OK,IntToStr(1))
  else
    ACBrNFe1.Configuracoes.WebServices.Ambiente       := StrToTpAmb(OK,IntToStr(2));

//  ACBrNFe1.Configuracoes.WebServices.Ambiente       := StrToTpAmb(OK,IntToStr(sAmbiente));
  ACBrNFe1.Configuracoes.WebServices.Visualizar     := False;
  ACBrNFe1.Configuracoes.WebServices.ProxyHost      := frmLogin.sHost;
  ACBrNFe1.Configuracoes.WebServices.ProxyPort      := frmLogin.sPorta;
  ACBrNFe1.Configuracoes.WebServices.ProxyUser      := frmLogin.sUsuario;
  ACBrNFe1.Configuracoes.WebServices.ProxyPass      := frmLogin.sSenhaWS;

  if ACBrNFe1.DANFE <> nil then
  begin
    ACBrNFe1.DANFE.TipoDANFE := StrToTpImp(OK,'1');
    ACBrNFe1.DANFE.Logo      := frmLogin.sLogoMarca;
  end;
end;

procedure TfrmNfe.BackToMainForm(Sender: TObject);
begin
  Close;
//  Hide;
//  SplitForm.BringToFront;
end;

procedure TfrmNfe.cxBtnEfetuarCalculoClick(Sender: TObject);
var
  vConectaServidor : TDSModuleDbClient;
  vUFEmitente,vClientouServidor : string;
  vContinua : boolean;
  I : integer;
  vAliquotaPis,vAliquotaCofins : Real;
begin
  if not (dm.cdsNotasFiscais.State in [dsEdit,dsInsert]) then
  begin
    vContinua := True;
    vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);

    vClientouServidor := AnsiupperCase(vConectaServidor.RetornaLocalEmissaoNFe);
    if vClientouServidor = 'CLIENT' then
    begin
      LeArqIni;
      vUFEmitente :=  frmlogin.sUF;
      try
        vAliquotaPis := StrToFloat(frmLogin.sAliquotaPis);
      except
        messagedlg('Não foi informada a alíquota de PIS'+#13+
                   'O sistema não irá efetuar os cálculos'+#13+
                   'dos impostos desta NF-e',mtError,[mbOK],0);
        exit;
      end;

      try
        vAliquotaCofins := StrToFloat(frmlogin.sAliquotaCofins);
      except
        messagedlg('Não foi informada a alíquota de Cofins'#13+
                   'O sistema não irá efetuar os cálculos'+#13+
                   'dos impostos desta NF-e',mtError,[mbOK],0);
        exit;
      end;
      FreeAndNil(vConectaServidor);

      if not dm.cdsTiposDeOperacao.active then
        dm.cdsTiposDeOperacao.active := true;

//      dm.cdsTiposDeOperacao.Filtered := False;
//      dm.cdsTiposDeOperacao.Filter := '';
//      dm.cdsTiposDeOperacao.Filter := ' ID_TIPO_OPERACAO = '+IntToStr(dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger);
//      dm.cdsTiposDeOperacao.Filtered := True;

      dm.cdsTiposDeOperacao.close;
      dm.cdsTiposDeOperacao.CommandText :=' SELECT * FROM TIPOS_DE_OPERACAO where ID_TIPO_OPERACAO = ' +IntToStr(dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger)+
      ' ORDER BY ID_TIPO_OPERACAO ';
      dm.cdsTiposDeOperacao.Open;

      dm.cdsClientes.close;
      //dm.cdsClientes.Filtered := False;
      //dm.cdsClientes.Filter := '';
      dm.cdsClientes.CommandText := 'select * from Clientes where ID_CLIENTE = ' + IntToStr(dm.cdsNotasFiscaisID_CLIENTE.AsInteger);
      //dm.cdsClientes.Filter := ' ID_CLIENTE = '+IntToStr(dm.cdsNotasFiscaisID_CLIENTE.AsInteger);
      //dm.cdsClientes.Filtered := true;
      dm.cdsClientes.open;
      dm.cdsNotasFiscaisItens.First;
      for I := 0 to dm.cdsNotasFiscaisItens.recordCount - 1 do
      begin
        dm.cdsGenerico.Close;
        dm.cdsGenerico.CommandText := 'SELECT * FROM CONVENIOS_NCM WHERE CODIGO_NCM = '+
                                       QuotedStr(dm.cdsNotasFiscaisItensNCM_PRODUTO.AsString) +
                                       ' AND UF_DESTINO = '+QuotedStr(DM.cdsClientesUF.AsString);
        dm.cdsGenerico.Active := True;

        if dm.cdsGenerico.FieldByName('CODIGO_NCM').AsString = '' then
        begin
          MessageDlg('O produto '+dm.cdsNotasFiscaisItensDESCRICAO_PRODUTO.AsString+#13+
                     'não possui convênio NCM cadastrado.'+#13+
                     'Não será feito o calculo da NF-e até'+#13+
                     'até que o convênio seja feito',mtError,[mbOK],0);
          vContinua := False;
          Break;
        end;
        dm.cdsNotasFiscaisItens.Edit;

        if ansiupperCase(vUFEmitente) = AnsiupperCase(dm.cdsClientesUF.AsString) then
        begin
          if dm.cdsGenerico.FieldByName('PERCENTUAL_IVA').AsFloat > 0 then
            dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsTiposDeOperacaoCFOP_DENTRO_ESTADO_COM_ST.AsString
          else
            dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsTiposDeOperacaoCFOP_DENTRO_ESTADO.AsString;
        end
        else
        begin
          if dm.cdsGenerico.FieldByName('PERCENTUAL_IVA').AsFloat > 0 then
            dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsTiposDeOperacaoCFOP_FORA_ESTADO_COM_ST.AsString
          else
            dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsTiposDeOperacaoCFOP_FORA_ESTADO.AsString;
        end;

        //quando houver st e redução
        if (dm.cdsGenerico.FieldByName('PERCENTUAL_IVA').AsFloat > 0) and (dm.cdsGenerico.FieldByName('PERCENTUAL_REDUCAO').AsFloat > 0 ) then
          dm.cdsNotasFiscaisItensCST_ICMS.AsString := dm.cdsTiposDeOperacaoCST_ICMS_COM_ST_E_REDUCAO.AsString
        else
        //quando houver st
        if (dm.cdsGenerico.FieldByName('PERCENTUAL_IVA').AsFloat > 0)then
          dm.cdsNotasFiscaisItensCST_ICMS.AsString := dm.cdsTiposDeOperacaoCST_ICMS_COM_ST.AsString
        else
        //quando houver redução
        if dm.cdsGenerico.FieldByName('PERCENTUAL_REDUCAO').AsFloat > 0  then
          dm.cdsNotasFiscaisItensCST_ICMS.AsString := dm.cdsTiposDeOperacaoCST_ICMS_COM_REDUCAO.AsString
        else
        //quando for normal
          dm.cdsNotasFiscaisItensCST_ICMS.AsString := dm.cdsTiposDeOperacaoCST_ICMS_NORMAL.AsString;

        dm.cdsNotasFiscaisItensCST_IPI.AsString := dm.cdsTiposDeOperacaoCST_IPI.AsString;
        dm.cdsNotasFiscaisItensPERCENTUAL_IPI.AsFloat := dm.cdsGenerico.FieldByName('ALIQUOTA_IPI').AsFloat;
        if dm.cdsGenerico.FieldByName('ALIQUOTA_IPI').AsFloat > 0then
          dm.cdsNotasFiscaisItensVALOR_IPI.AsFloat := (dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat * dm.cdsGenerico.FieldByName('ALIQUOTA_IPI').AsFloat)/100;

        dm.cdsNotasFiscaisItensPERCENTUAL_ICMS.AsFloat := dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsFloat;
        if AnsiUpperCase(dm.cdsClientesCONSUMIDOR_FINAL.AsString) = 'S' then
        begin
          dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat := dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat + dm.cdsNotasFiscaisItensVALOR_IPI.AsFloat;
          dm.cdsNotasFiscaisItensVALOR_ICMS.AsFloat := (dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat * dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100;
        end
        else
        begin
          dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat := dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat;
          dm.cdsNotasFiscaisItensVALOR_ICMS.AsFloat := (dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat * dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100;
        end;
        dm.cdsNotasFiscaisItensCST_PIS.AsString := dm.cdsTiposDeOperacaoCST_PIS.AsString;
        dm.cdsNotasFiscaisItensPERCENTUAL_PIS.AsFloat := vAliquotaPis;
        dm.cdsNotasFiscaisItensVALOR_PIS.AsFloat := (dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat * vAliquotaPis) / 100;
        dm.cdsNotasFiscaisItensCST_COFINS.AsString := dm.cdsTiposDeOperacaoCST_COFINS.AsString;
        dm.cdsNotasFiscaisItensVALOR_COFINS.AsFloat := (dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat * vAliquotaCofins) / 100;
        dm.cdsNotasFiscaisItensPERCENTUAL_COFINS.AsFloat := vAliquotaCofins;
        dm.cdsNotasFiscaisItens.Post;
        dm.cdsNotasFiscaisItens.Next;
      end;
    end
    else
    begin
      vUFEmitente := vConectaServidor.RetornaUfEmitente;
      try
        if (vConectaServidor.RetornaAliquotaPis <> '') then
          vAliquotaPis := StrToFloat(vConectaServidor.RetornaAliquotaPis);
      except
        messagedlg('Não foi informada a alíquota de PIS'+#13+
                   'O sistema não irá efetuar os cálculos'+#13+
                   'dos impostos desta NF-e',mtError,[mbOK],0);
        exit;
      end;

      try
        if (vConectaServidor.RetornaAliquotaCofins <> '') then
          vAliquotaCofins := StrToFloat(vConectaServidor.RetornaAliquotaCofins);
      except
        messagedlg('Não foi informada a alíquota de Cofins'#13+
                   'O sistema não irá efetuar os cálculos'+#13+
                   'dos impostos desta NF-e',mtError,[mbOK],0);
        exit;
      end;
      FreeAndNil(vConectaServidor);

      if not dm.cdsTiposDeOperacao.active then
        dm.cdsTiposDeOperacao.active := true;

//      dm.cdsTiposDeOperacao.Filtered := False;
//      dm.cdsTiposDeOperacao.Filter := '';
//      dm.cdsTiposDeOperacao.Filter := ' ID_TIPO_OPERACAO = '+IntToStr(dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger);
//      dm.cdsTiposDeOperacao.Filtered := True;

      dm.cdsTiposDeOperacao.close;
      dm.cdsTiposDeOperacao.CommandText :=' SELECT * FROM TIPOS_DE_OPERACAO where ID_TIPO_OPERACAO = ' +IntToStr(dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger)+
      ' ORDER BY ID_TIPO_OPERACAO ';
      dm.cdsTiposDeOperacao.Open;


//      dm.cdsClientes.Filtered := False;
//      dm.cdsClientes.Filter := '';
//      dm.cdsClientes.Filter := ' ID_CLIENTE = '+IntToStr(dm.cdsNotasFiscaisID_CLIENTE.AsInteger);
      dm.cdsClientes.close;
      dm.cdsClientes.CommandText := 'select * from Clientes where ID_CLIENTE = ' + IntToStr(dm.cdsNotasFiscaisID_CLIENTE.AsInteger);
      dm.cdsClientes.Open;


      dm.cdsNotasFiscaisItens.First;
      for I := 0 to dm.cdsNotasFiscaisItens.recordCount - 1 do
      begin
        dm.cdsGenerico.Close;
        dm.cdsGenerico.CommandText := 'SELECT * FROM CONVENIOS_NCM WHERE CODIGO_NCM = '+
                                       QuotedStr(dm.cdsNotasFiscaisItensNCM_PRODUTO.AsString) +
                                       ' AND UF_DESTINO = '+QuotedStr(DM.cdsClientesUF.AsString);
        dm.cdsGenerico.Active := True;

        if dm.cdsGenerico.FieldByName('CODIGO_NCM').AsString = '' then
        begin
          MessageDlg('O produto '+dm.cdsNotasFiscaisItensDESCRICAO_PRODUTO.AsString+#13+
                     'não possui convênio NCM cadastrado.'+#13+
                     'Não será feito o calculo da NF-e até'+#13+
                     'até que o convênio seja feito',mtError,[mbOK],0);
          vContinua := False;
          Break;
        end;
        dm.cdsNotasFiscaisItens.Edit;

        if ansiupperCase(vUFEmitente) = AnsiupperCase(dm.cdsClientesUF.AsString) then
        begin
          if dm.cdsGenerico.FieldByName('PERCENTUAL_IVA').AsFloat > 0 then
            dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsTiposDeOperacaoCFOP_DENTRO_ESTADO_COM_ST.AsString
          else
            dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsTiposDeOperacaoCFOP_DENTRO_ESTADO.AsString;
        end
        else
        begin
          if dm.cdsGenerico.FieldByName('PERCENTUAL_IVA').AsFloat > 0 then
            dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsTiposDeOperacaoCFOP_FORA_ESTADO_COM_ST.AsString
          else
            dm.cdsNotasFiscaisItensCFOP.AsString := dm.cdsTiposDeOperacaoCFOP_FORA_ESTADO.AsString;
        end;

        //quando houver st e redução
        if (dm.cdsGenerico.FieldByName('PERCENTUAL_IVA').AsFloat > 0) and (dm.cdsGenerico.FieldByName('PERCENTUAL_REDUCAO').AsFloat > 0 ) then
          dm.cdsNotasFiscaisItensCST_ICMS.AsString := dm.cdsTiposDeOperacaoCST_ICMS_COM_ST_E_REDUCAO.AsString
        else
        //quando houver st
        if (dm.cdsGenerico.FieldByName('PERCENTUAL_IVA').AsFloat > 0)then
          dm.cdsNotasFiscaisItensCST_ICMS.AsString := dm.cdsTiposDeOperacaoCST_ICMS_COM_ST.AsString
        else
        //quando houver redução
        if dm.cdsGenerico.FieldByName('PERCENTUAL_REDUCAO').AsFloat > 0  then
          dm.cdsNotasFiscaisItensCST_ICMS.AsString := dm.cdsTiposDeOperacaoCST_ICMS_COM_REDUCAO.AsString
        else
        //quando for normal
          dm.cdsNotasFiscaisItensCST_ICMS.AsString := dm.cdsTiposDeOperacaoCST_ICMS_NORMAL.AsString;

        dm.cdsNotasFiscaisItensCST_IPI.AsString := dm.cdsTiposDeOperacaoCST_IPI.AsString;
        dm.cdsNotasFiscaisItensPERCENTUAL_IPI.AsFloat := dm.cdsGenerico.FieldByName('ALIQUOTA_IPI').AsFloat;
        if dm.cdsGenerico.FieldByName('ALIQUOTA_IPI').AsFloat > 0then
          dm.cdsNotasFiscaisItensVALOR_IPI.AsFloat := (dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat * dm.cdsGenerico.FieldByName('ALIQUOTA_IPI').AsFloat)/100;

        dm.cdsNotasFiscaisItensPERCENTUAL_ICMS.AsFloat := dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsFloat;
        if AnsiUpperCase(dm.cdsClientesCONSUMIDOR_FINAL.AsString) = 'S' then
        begin
          dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat := dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat + dm.cdsNotasFiscaisItensVALOR_IPI.AsFloat;
          dm.cdsNotasFiscaisItensVALOR_ICMS.AsFloat := (dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat * dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100;
        end
        else
        begin
          dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat := dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat;
          dm.cdsNotasFiscaisItensVALOR_ICMS.AsFloat := (dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat * dm.cdsGenerico.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100;
        end;
        dm.cdsNotasFiscaisItensCST_PIS.AsString := dm.cdsTiposDeOperacaoCST_PIS.AsString;
        dm.cdsNotasFiscaisItensPERCENTUAL_PIS.AsFloat := vAliquotaPis;
        dm.cdsNotasFiscaisItensVALOR_PIS.AsFloat := (dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat * vAliquotaPis) / 100;
        dm.cdsNotasFiscaisItensCST_COFINS.AsString := dm.cdsTiposDeOperacaoCST_COFINS.AsString;
        dm.cdsNotasFiscaisItensVALOR_COFINS.AsFloat := (dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat * vAliquotaCofins) / 100;
        dm.cdsNotasFiscaisItensPERCENTUAL_COFINS.AsFloat := vAliquotaCofins;
        dm.cdsNotasFiscaisItens.Post;
        dm.cdsNotasFiscaisItens.Next;
      end;
    end;

    if vContinua then
    begin
      dm.cdsNotasFiscais.Edit;
      dm.cdsNotasFiscaisNFE_CALCULADA.AsString := 'S';
      dm.cdsNotasFiscais.Post;
      MessageDlg('Calculo efetuado com êxito',mtConfirmation,[mbOK],0);
    end;
    dm.cdsNotasFiscaisItens.EnableControls;
  end;
end;

procedure TfrmNfe.cxButton1Click(Sender: TObject);
begin
  cxTSInserirNota.TabVisible := False;
  cxTsPesquisa.TabVisible := true;
  cxPCPrincipal.ActivePage := cxTsPesquisa;
  cxGridNotasFiscais.SetFocus;
end;

procedure TfrmNfe.cxButton2Click(Sender: TObject);
begin
  if DM.cdsNotasFiscais.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(frmLookUpClientes) then
      frmLookUpClientes := TfrmLookUpClientes.Create(Self);
    frmLookUpClientes.Left := Trunc(Screen.Width / 2) - 200;
    frmLookUpClientes.Top := Trunc(Screen.Height / 2) - 200;
//    frmLookUpClientes.cxGrid1DBTableView1.DataController.DataSource := dm.dsClientes;
    if not DM.cdsClientes.Active then
      dm.cdsClientes.Active := True;
    frmLookUpClientes.ShowModal;
    dm.cdsNotasFiscaisID_Cliente.AsInteger := DM.cdsClientesID_CLIENTE.AsInteger;
    dm.cdsNotasFiscaisNOME_CLIENTE.AsString := DM.cdsClientesRAZAO_SOCIAL.AsString;
    dm.cdsNotasFiscaisID_TRANSPORTADOR.AsInteger := dm.cdsClientesID_TRANSPORTADOR.AsInteger;
  end;
end;

procedure TfrmNfe.cxButton3Click(Sender: TObject);
begin
  if DM.cdsNotasFiscais.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(frmLookUpTransportadores ) then
      frmLookUpTransportadores := TfrmLookUpTransportadores.Create(Self);
    frmLookUpTransportadores.Left := Trunc(Screen.Width / 2) - 200;
    frmLookUpTransportadores.Top := Trunc(Screen.Height / 2) - 200;
//    if not dm.cdsTransportadores.Active then
//      dm.cdsTransportadores.Active := True;
    frmLookUpTransportadores.ShowModal;
    dm.cdsNotasFiscaisID_TRANSPORTADOR.AsInteger := dm.cdsTransportadoresID_TRANSPORTADOR.AsInteger;
    LocalizarTransportador(dm.cdsNotasFiscaisID_TRANSPORTADOR.AsInteger);
  end;
end;

procedure TfrmNfe.cxButton4Click(Sender: TObject);
var
  vString,vStringAuxiliar : string;
  vContador : integer;
begin
  if not (dm.cdsNotasFiscais.State in [dsEdit,dsInsert]) then
  begin
    if dm.cdsNotasFiscaisNUMERO_PARCELAS.AsInteger > 0 then
    begin
      if dm.cdsDuplicatasNotasFiscais.RecordCount > 0 then
        MessageDlg('Esta NF-e possui uma ou mais faturas geradas'+#13+
                   'O sistema não irá executar esta rotina até que'+#13+
                   'as faturas existentes sejam excluídas',mtWarning,[mbOK],0)
      else
      begin
        if Trim(dm.cdsNotasFiscaisCONDICAO_PAGAMENTO.AsString) <> '' then
        begin
          try
            vString := dm.cdsNotasFiscaisCONDICAO_PAGAMENTO.AsString;
            if AnsiUpperCase(vString) = '0' then
            begin
              dm.cdsDuplicatasNotasFiscais.Insert;
              dm.cdsDuplicatasNotasFiscaisNUMERO_FATURA.AsInteger := 1;
              dm.cdsDuplicatasNotasFiscaisVENCIMENTO.AsDateTime := Date;
              dm.cdsDuplicatasNotasFiscaisVALOR.AsFloat := dm.cdsNotasFiscaisVALOR_TOTAL_NOTA.AsFloat;
              dm.cdsDuplicatasNotasFiscais.Post;
            end
            else
            begin
              vContador := 0;
              repeat
                vStringAuxiliar := Copy(vString,1,2);
                dm.cdsDuplicatasNotasFiscais.Insert;
                Inc(vContador);
                dm.cdsDuplicatasNotasFiscaisNUMERO_FATURA.AsInteger := vContador;
                dm.cdsDuplicatasNotasFiscaisVENCIMENTO.AsDateTime := Date + StrToInt(vStringAuxiliar);
                dm.cdsDuplicatasNotasFiscaisVALOR.AsFloat := dm.cdsNotasFiscaisVALOR_TOTAL_NOTA.AsFloat /
                                                             dm.cdsNotasFiscaisNUMERO_PARCELAS.AsInteger;
                dm.cdsDuplicatasNotasFiscais.Post;
                vString := Copy(vString,Pos('/',vString)+1,Length(vString));
              until vContador =  dm.cdsNotasFiscaisNUMERO_PARCELAS.AsInteger ;
            end;
            MessageDlg('Duplicatas geradas com êxito.',mtError,[mbOK],0);
          except on e:exception do
            begin
              MessageDlg('Não foi possível efetuar a geração das duplicatas.'+#13+
                         'Erro gerado pelo sistema : '+e.Message,mtError,[mbOK],0);
            end;
          end;
        end
        else
          MessageDlg('Não será possível gerar parcelas pois ainda não fora'+#13+
                     'informada a condição de pagamento para esta NF-e',mtError,[mbOK],0);
      end;
    end
    else
      MessageDlg('Não será possível gerar parcelas pois ainda não fora'+#13+
                 'informada a quantidade de parcelas para esta NF-e',mtError,[mbOK],0);
  end;
end;

procedure TfrmNfe.cxButton5Click(Sender: TObject);
begin
  if DM.cdsNotasFiscais.State in [dsEdit,dsInsert] then
  begin
    if dm.cdsNotasFiscaisFORMA_PAGAMENTO.AsString <> '' then
    begin
      if not Assigned(frmLookUpCondicaoDePagamento) then
        frmLookUpCondicaoDePagamento := TfrmLookUpCondicaoDePagamento.Create(Self);
      frmLookUpCondicaoDePagamento.Left := Trunc(Screen.Width / 2) - 200;
      frmLookUpCondicaoDePagamento.Top := Trunc(Screen.Height / 2) - 200;
//    frmlookUpTiposDeoperacao.cxGrid1DBTableView1.DataController.DataSource := dm.dsClientes;

      if not dm.cdsFormasVSCondicoes.Active then
        dm.cdsFormasVSCondicoes.Active := True;
      dm.cdsFormasVSCondicoes.Close;
      dm.cdsFormasVSCondicoes.CommandText := 'SELECT * FROM FORMAS_VS_CONDICOES '+
                                                 ' WHERE DESCRICAO_FORMA_DE_PAGAMENTO = '+
                                                 QuotedStr(dm.cdsNotasFiscaisFORMA_PAGAMENTO.AsString);
      dm.cdsFormasVSCondicoes.Open;
      frmLookUpCondicaoDePagamento.ShowModal;
//    dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger := dm.cdsTiposDeOperacaoID_TIPO_OPERACAO.AsInteger;
      dm.cdsNotasFiscaisCONDICAO_PAGAMENTO.AsString := DM.cdsFormasVSCondicoesCONDICAO_DE_PAGAMENTO.AsString;
      dm.cdsFormasVSCondicoes.Close;
      dm.cdsFormasVSCondicoes.CommandText := 'SELECT * FROM FORMAS_VS_CONDICOES ';
      dm.cdsFormasVSCondicoes.Open;
      FreeAndNil(frmLookUpCondicaoDePagamento);
    end
    else
      MessageDlg('Primeiro, escolha uma forma de pagamento',mtWarning,[mbOK],0);
  end;
end;

procedure TfrmNfe.cxBtnEnviarNFeClick(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
  vNfe : TACBrNFe;
  vRetorno,vCodigoRetorno,vMotivoRetorno,
  vChaveNFe,vCaminhoXml : string;
  //dialog : TOpenDialog;
  vIdNotaFiscal : integer;
  vClientouServidor : string;
begin
  vNfe := TACBrNFe.Create(Self);
  if Trim(dm.cdsNotasFiscaisCHAVE.AsString) <> '' then
    MessageDlg('Esta NF-e já foi enviada sob o numero de potocolo '+dm.cdsNotasFiscaisNUMERO_PROTOCOLO_RECEBIMENTO.AsString+#13+
               'possuindo ainda chave numero '+dm.cdsNotasFiscaisCHAVE.AsString+#13+
               'não sendo popssível efetuar novamente seu envio a SEFAZ',mtError,[mbOK],0)
  else
  begin
    if Trim(dm.cdsNotasFiscaisNFE_CALCULADA.AsString) <> 'S' then
      MessageDlg('Esta NF-e já não foi calculada '+#13+
                 'Efetue o cálculo antes de efetuar'+#13+
                 'o envio da NF-e',mtWarning,[mbOK],0)
    else
    begin
      Conexao := TDSModuleDbClient.Create(dm.SQLConexao.DBXConnection);
      vClientouServidor := AnsiupperCase(Conexao.RetornaLocalEmissaoNFe);
      if vClientouServidor = 'CLIENT' then
      begin
        EnviarNFe(dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger);
      end
      else
      begin
        vIdNotaFiscal := dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger;
        vMotivoRetorno := '';
        vRetorno := Conexao.EnviarNFe(dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger);
        if Ansiuppercase(Copy(vRetorno,1,Pos('|',vRetorno) - 1)) = 'ERRO' then
          MessageDlg(Copy(vRetorno,Pos('|',vRetorno) + 1,Length(vRetorno)),mtError,[mbOK],0)
        else
        begin
          vCodigoRetorno := Copy(vRetorno,1,Pos('|',vRetorno) - 1);
          vRetorno := Copy(vRetorno,Pos('|',vRetorno) + 1,Length(vRetorno));
          vMotivoRetorno := Copy(vRetorno,1,Pos('|',vRetorno) - 1);
          vRetorno := Copy(vRetorno,Pos('|',vRetorno) + 1,Length(vRetorno));
          vChaveNFe := Copy(vRetorno,1,Pos('|',vRetorno) - 1);
          vRetorno := Copy(vRetorno,Pos('|',vRetorno) + 1,Length(vRetorno));
          vCaminhoXml := vRetorno;
          if StrToInt(vCodigoRetorno) = 100 then
          begin
            showmessage(vMotivoRetorno);
            if not Assigned(vNfe) then
              vNfe := TACBrNFe.Create(Self);
            vNfe.NotasFiscais.Clear;
            if Trim(frmlogin.pCaminhoMapeamentoServidor) <> '' then
            begin
              if Copy(frmlogin.pCaminhoMapeamentoServidor,1,Length(frmlogin.pCaminhoMapeamentoServidor)-1) = '\' then
                vCaminhoXml := frmlogin.pCaminhoMapeamentoServidor+vChaveNFe+'-nfe.xml'
              else
                vCaminhoXml := frmlogin.pCaminhoMapeamentoServidor +'\'+vChaveNFe+'-nfe.xml';
            end;
            vNfe.NotasFiscais.LoadFromFile(vCaminhoXml);
            ACBrNFeDANFEFR1.ACBrNFe := vNfe;
            ACBrNFeDANFEFR1.PathPDF := ExtractFilePath(Application.ExeName);
            ACBrNFeDANFEFR1.FastFile := ExtractFilePath(Application.ExeName)+'DANFE.fr3';
            vNfe.NotasFiscais.Items[0].Imprimir;
            vNfe.NotasFiscais.Items[0].ImprimirPDF;
            dm.cdsNotasFiscais.DisableControls;
            dm.cdsNotasFiscais.Close;
            dm.cdsNotasFiscais.Open;
            dm.cdsNotasFiscais.Locate('ID_NOTA_FISCAL',vIdNotaFiscal,[]);
            dm.cdsNotasFiscais.EnableControls;
          end
          else
            MessageDlg(vMotivoRetorno,mtError,[mbOK],0);
        end;
      end;
    end;
  end;
end;

procedure TfrmNfe.cxButton6Click(Sender: TObject);
begin
  if DM.cdsNotasFiscais.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(frmlookUpTiposDeoperacao) then
      frmlookUpTiposDeoperacao := TfrmlookUpTiposDeoperacao.Create(Self);
    frmlookUpTiposDeoperacao.Left := Trunc(Screen.Width / 2) - 200;
    frmlookUpTiposDeoperacao.Top := Trunc(Screen.Height / 2) - 200;
//    frmlookUpTiposDeoperacao.cxGrid1DBTableView1.DataController.DataSource := dm.dsClientes;
    if not dm.cdsTiposDeOperacao.Active then
      dm.cdsTiposDeOperacao.Active := True;
    frmlookUpTiposDeoperacao.ShowModal;
    dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger := dm.cdsTiposDeOperacaoID_TIPO_OPERACAO.AsInteger;
    dm.cdsNotasFiscaisNATUREZA_DE_OPERACAO.AsString := DM.cdsTiposDeOperacaoDESCRICAO_TIPO_OPERACAO.AsString;
  end;
end;

procedure TfrmNfe.cxButton7Click(Sender: TObject);
begin
  if DM.cdsNotasFiscais.State in [dsEdit,dsInsert] then
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
    dm.cdsNotasFiscaisFORMA_PAGAMENTO.AsString := DM.cdsFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO.AsString;
  end;
end;

procedure TfrmNfe.cxDBNavigator2ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin

  if AButtonIndex = 6 then
  begin
    {
    if dm.cdsNotasFiscaisItens.State = dsInsert then
      showmessage('está inserindo');
    PnlPrincipal.Visible := true;
    PnlPrincipal.Left := Trunc(Self.Width / 2) - 300;
    PnlPrincipal.Top := Trunc(Self.Height / 2) - 200;
    PnlPrincipal.Caption := 'Teste';
    PnlPrincipal.Width := 646;
    PnlPrincipal.Height := 338;
    PnlPrincipal.Parent := Self;
    if not Assigned(FrmLookUpProdutos) then
      FrmLookUpProdutos := TFrmLookUpProdutos.Create(Self);
    FrmLookUpProdutos.cxGrid1DBTableView1.DataController.DataSource := dm.dsProdutosAcabados;
    //FrmLookUpProdutos.Parent := PnlPrincipal;
    FrmLookUpProdutos.vContinua := true;
    if not dm.cdsProdutosAcabados.Active then
      dm.cdsProdutosAcabados.Active := True;
    FrmLookUpProdutos.ShowModal;
    PnlPrincipal.Visible := False;
    }
    if not Assigned(FrmLookUpProdutos) then
      FrmLookUpProdutos := TFrmLookUpProdutos.Create(Self);
    FrmLookUpProdutos.Left := Trunc(Screen.Width / 2) - 200;
    FrmLookUpProdutos.Top := Trunc(Screen.Height / 2) - 200;
    FrmLookUpProdutos.cxGrid1DBTableView1.DataController.DataSource := dm.dsProdutos;
    //FrmLookUpProdutos.Parent := PnlPrincipal;
    FrmLookUpProdutos.vContinua := true;
    if not dm.cdsProdutos.Active then
      dm.cdsProdutos.Active := True;
    FrmLookUpProdutos.ShowModal;
  end;
end;

procedure TfrmNfe.cxGridNotasFiscaisDBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  dm.cdsNotasFiscaisItens.Filtered := False;
//  dm.cdsNotasFiscaisItens.Filter := '';
//  dm.cdsNotasFiscaisItens.Filter := ' ID_NOTA_FISCAL = '+IntToStr(dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger);
//  dm.cdsNotasFiscaisItens.Filtered := True;
  dm.cdsNotasFiscaisItens.close;

  dm.cdsNotasFiscaisItens.CommandText:= 'SELECT * FROM NOTAS_FISCAIS_ITENS where ID_NOTA_FISCAL = ' +IntToStr(dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger);
  dm.cdsNotasFiscaisItens.Open;


  cxTSInserirNota.TabVisible := true;
  cxTsPesquisa.TabVisible := False;
  cxPCPrincipal.ActivePage := cxTSInserirNota;
  cxPCAuxiliarNotaFiscal.ActivePage := cxTSItensDaNota;
  cxPCNotasFiscais.ActivePage := cxTSPrincipal;
  LocalizarTransportador(dm.cdsNotasFiscaisID_TRANSPORTADOR.AsInteger);
  LocalizarFatura(dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger);
end;

procedure TfrmNfe.cxTSItensDaNotaShow(Sender: TObject);
begin
  cxPCItensNF.ActivePage := cxTSProdutos;
end;

procedure TfrmNfe.DBEdit2Change(Sender: TObject);
begin
  LocalizarTransportador(dm.cdsNotasFiscaisID_TRANSPORTADOR.AsInteger);
  LocalizarFatura(dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger);
end;

procedure TfrmNfe.EnviarNFe(qIdNotaFiscal: integer);
var
//  vRetornoFuncao : string;
  vIdCliente,vContadorItem,vIdTransportador : integer;
begin
  LeArqIni;
  AtualizaConfigAcBr;
//  ACBrNFe1.Configuracoes.Certificados.NumeroSerie := '55724df82f3454bf';
//  ACBrNFe1.Configuracoes.Certificados.Senha := '2411';
  Inc(frmLogin.sUltNumNFe);
  ACBrNFeDANFEFR1.FastFile := ExtractFilePath(Application.ExeName)+'DANFE.fr3';
  vIdCliente := dm.cdsNotasFiscaisID_CLIENTE.AsInteger;
  vIdTransportador := dm.cdsNotasFiscaisID_TRANSPORTADOR.AsInteger;
  ACBrNFe1.NotasFiscais.Clear;
  with ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    Ide.tpImp     := tiPaisagem;
    Ide.cNF       := frmLogin.sUltNumNFe; //Caso não seja preenchido será gerado um número aleatório pelo componente
    Ide.natOp     := dm.cdsNotasFiscaisNATUREZA_DE_OPERACAO.AsString;//'VENDA PRODUCAO DO ESTAB.';
    Ide.indPag    := ipVista;
    Ide.modelo    := 55;
    Ide.serie     := 1;
    Ide.nNF       := frmLogin.sUltNumNFe;
    Ide.dEmi      := dm.cdsNotasFiscaisDATA_EMISSAO.AsDateTime;//Date;
    Ide.dSaiEnt   := dm.cdsNotasFiscaisDATA_SAIDA_ENTRADA.AsDateTime;//Date;
    Ide.hSaiEnt   := dm.cdsNotasFiscaisHORA_SAIDA_ENTRADA.AsDateTime;//Now;
//    if Trim(AnsiUpperCase(dm.cdsNotasFiscaisENTRADA_SAIDA.AsString)) = 'S' then
//      Ide.tpNF      := tnSaida
//    else
//      Ide.tpNF      := tnEntrada;

    Ide.tpEmis    := teNormal;



    if frmLogin.sAmbiente = 0 then
      Ide.tpAmb := taProducao
    else
      Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta variável quando for para ambiente de produção

    Ide.verProc   := '1.0.0.0'; //Versão do seu sistema
//    Ide.cUF       :=  NotaUtil.UFtoCUF('SP');
    Ide.cMunFG    := StrToInt('3500709');   //VERIFICAR O CODIGO DO MUNICIPIO

//    if Trim(AnsiUpperCase(dm.cdsNotasFiscaisINFORMACAO_NFE.AsString)) =  'NORMAL' then
//      Ide.finNFe    := fnNormal
//    else
//    if Trim(AnsiUpperCase(dm.cdsNotasFiscaisINFORMACAO_NFE.AsString)) =  'COMPLEMENTAR' then
//      Ide.finNFe    := fnComplementar
//    else
//    if Trim(AnsiUpperCase(dm.cdsNotasFiscaisINFORMACAO_NFE.AsString)) =  'AJUSTE' then
//      Ide.finNFe    := fnAjuste
//    else
//    if Trim(AnsiUpperCase(dm.cdsNotasFiscaisINFORMACAO_NFE.AsString)) =  'DEVOLUÇÃO' then
//      Ide.finNFe    := fnDevolucao;


    Emit.CNPJCPF           := frmLogin.sCNPJ;//'50564244000175';
    Emit.IE                := frmLogin.sIE;//'635117647119';
    Emit.xNome             := frmLogin.sRazao;//'Business';
    Emit.xFant             := frmLogin.sFantasia;//'Business Controller';

    Emit.EnderEmit.fone    := frmLogin.sFone;//'0000000000';
    Emit.EnderEmit.CEP     := StrToInt(frmLogin.sCEP);//StrToInt('02879150');
    Emit.EnderEmit.xLgr    := frmLogin.sEndereco;//'Rua da Bica';
    Emit.EnderEmit.nro     := frmLogin.sNum;//'77';
    Emit.EnderEmit.xCpl    := '';
    Emit.EnderEmit.xBairro := frmLogin.sBairro;//'Alexandria';
    Emit.EnderEmit.cMun    := StrToInt(frmLogin.sCodMun);//StrToInt('3500709');
    Emit.EnderEmit.xMun    := frmLogin.sCidade;//'Tangamandapio';
    Emit.EnderEmit.UF      := frmLogin.sUF;//'SP';
    Emit.enderEmit.cPais   := 1058;
    Emit.enderEmit.xPais   := 'BRASIL';


    Total.ICMSTot.vBC     := dm.cdsNotasFiscaisBASE_CALCULO_ICMS.AsFloat;
    Total.ICMSTot.vICMS   := dm.cdsNotasFiscaisVALOR_ICMS.AsFloat;
    Total.ICMSTot.vBCST   := dm.cdsNotasFiscaisBASE_ST.AsFloat;
    Total.ICMSTot.vST     := dm.cdsNotasFiscaisVALOR_ST.AsFloat;
    Total.ICMSTot.vProd   := dm.cdsNotasFiscaisVALOR_PRODUTOS.AsFloat;
    Total.ICMSTot.vFrete  := dm.cdsNotasFiscaisVALOR_FRETE.AsFloat;
    Total.ICMSTot.vSeg    := dm.cdsNotasFiscaisVALOR_SEGURO.AsFloat;
    Total.ICMSTot.vDesc   := dm.cdsNotasFiscaisVALOR_DESCONTO.AsFloat;
    Total.ICMSTot.vII     := dm.cdsNotasFiscaisVALOR_IMPOSTO_IMPORTACAO.AsFloat;
    Total.ICMSTot.vIPI    := dm.cdsNotasFiscaisVALOR_IPI.AsFloat;
    Total.ICMSTot.vPIS    := dm.cdsNotasFiscaisVALOR_PIS.AsFloat;
    Total.ICMSTot.vCOFINS := dm.cdsNotasFiscaisVALOR_COFINS.AsFloat;
    Total.ICMSTot.vOutro  := dm.cdsNotasFiscaisVALOR_OUTROS.AsFloat;
    Total.ICMSTot.vNF     := dm.cdsNotasFiscaisVALOR_TOTAL_NOTA.AsFloat;

    Total.ISSQNtot.vServ   := 0;//100
    Total.ISSQNTot.vBC     := 0;//100
    Total.ISSQNTot.vISS    := 0;//2
    Total.ISSQNTot.vPIS    := 0;
    Total.ISSQNTot.vCOFINS := 0;

    if Trim(Ansiuppercase(dm.cdsNotasFiscaisRESPONSAVEL_FRETE.AsString)) = 'E' then
      Transp.modFrete := mfContaEmitente
    else
    if Trim(Ansiuppercase(dm.cdsNotasFiscaisRESPONSAVEL_FRETE.AsString)) = 'D' then
      Transp.modFrete := mfContaDestinatario
    else
    if Trim(Ansiuppercase(dm.cdsNotasFiscaisRESPONSAVEL_FRETE.AsString)) = 'T' then
      Transp.modFrete := mfContaTerceiros
    else
    if Trim(Ansiuppercase(dm.cdsNotasFiscaisRESPONSAVEL_FRETE.AsString)) = 'S' then
      Transp.modFrete := mfSemFrete;


    dm.cdsGenerico.Close;
    dm.cdsGenerico.CommandText := 'SELECT * FROM TRANSPORTADORES WHERE ID_TRANSPORTADOR = '+IntToStr(vIdTransportador);
    dm.cdsGenerico.Open;

    Transp.Transporta.CNPJCPF  := dm.cdsGenerico.FieldByName('CNPJ').AsString;
    Transp.Transporta.xNome    := dm.cdsGenerico.FieldByName('RAZAO_SOCIAL').AsString;
    Transp.Transporta.IE       := dm.cdsGenerico.FieldByName('INSCRICAO_ESTADUAL').AsString;
    Transp.Transporta.xEnder   := dm.cdsGenerico.FieldByName('ENDERECO').AsString + ', '+
                                  dm.cdsGenerico.FieldByName('NUMERO').AsString;
    Transp.Transporta.xMun     := dm.cdsGenerico.FieldByName('CIDADE').AsString;
    Transp.Transporta.UF       := dm.cdsGenerico.FieldByName('UF').AsString;

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

    dm.cdsGenerico.Close;
    dm.cdsGenerico.CommandText := 'SELECT * FROM CLIENTES WHERE ID_CLIENTE = '+IntToStr(vIdCliente);
    dm.cdsGenerico.Open;

    Emit.IEST              := '';//'442121245118';
    Emit.IM                := ''; // Preencher no caso de existir serviços na nota
    Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se é permitido
                                    // a inclusão de serviços na NFe
    Emit.CRT               := crtRegimeNormal;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)

    Dest.CNPJCPF           := dm.cdsGenerico.FieldByName('CNPJ').AsString;//'05481336000137';
    Dest.IE                := dm.cdsGenerico.FieldByName('INSCRICAO_ESTADUAL').AsString;//'687138770110';
    Dest.ISUF              := '';
    Dest.xNome             := dm.cdsGenerico.FieldByName('RAZAO_SOCIAL').AsString;//'D.J. COM. E LOCAÇÃO DE SOFTWARES LTDA - ME';

    Dest.EnderDest.Fone    := dm.cdsGenerico.FieldByName('TELEFONE').AsString;//'1532599600';
    Dest.EnderDest.CEP     := StrToInt(RetirarPontosETracos(dm.cdsGenerico.FieldByName('CEP').AsString));//18270170;
    Dest.EnderDest.xLgr    := dm.cdsGenerico.FieldByName('ENDERECO').AsString;//'Rua Coronel Aureliano de Camargo';
    Dest.EnderDest.nro     := dm.cdsGenerico.FieldByName('NUMERO').AsString;//'973';
    Dest.EnderDest.xCpl    := '';
    Dest.EnderDest.xBairro := dm.cdsGenerico.FieldByName('BAIRRO').AsString;//'Centro';
    Dest.EnderDest.cMun    := 3554003;
    Dest.EnderDest.xMun    := 'Tatuí';
    Dest.EnderDest.UF      := 'SP';
    Dest.EnderDest.cPais   := 1058;
    Dest.EnderDest.xPais   := 'BRASIL';

    vContadorItem := 0;

    //Inserindo Produtos
    dm.cdsNotasFiscaisItens.First;
    Det.Clear;
    while not dm.cdsNotasFiscaisItens.Eof do
    begin
      with Det.Add do
      begin
        Inc(vContadorItem);
        Prod.nItem    := vContadorItem; // Número sequencial, para cada item deve ser incrementado
        Prod.cProd    := dm.cdsNotasFiscaisItensCODIGO_PRODUTO.AsString;
        Prod.cEAN     := DM.cdsNotasFiscaisItensEAN13.AsString;
        Prod.xProd    := dm.cdsNotasFiscaisItensDESCRICAO_PRODUTO.AsString;
        Prod.NCM      := RetirarPontosETracos(dm.cdsNotasFiscaisItensNCM_PRODUTO.AsString);
        Prod.EXTIPI   := dm.cdsNotasFiscaisItensCST_IPI.AsString;
        Prod.CFOP     := dm.cdsNotasFiscaisItensCFOP.asstring;//  '5933';
        Prod.uCom     := dm.cdsNotasFiscaisItensUNIDADE.AsString;
        Prod.qCom     := dm.cdsNotasFiscaisItensQUANTIDADE.AsFloat ;
        Prod.vUnCom   := dm.cdsNotasFiscaisItensVALOR_UNITARIO.AsFloat;
        Prod.vProd    := dm.cdsNotasFiscaisItensVALOR_TOTAL.AsFloat ;
        Prod.cEANTrib  := '';
        Prod.uTrib     := 'UN';
        Prod.qTrib     := dm.cdsNotasFiscaisItensQUANTIDADE.AsFloat;
        Prod.vUnTrib   := dm.cdsNotasFiscaisItensVALOR_UNITARIO.AsFloat;

        Prod.vFrete    := dm.cdsNotasFiscaisItensVALOR_FRETE.AsFloat;
        Prod.vSeg      := dm.cdsNotasFiscaisItensVALOR_SEGURO.AsFloat;
        Prod.vDesc     := dm.cdsNotasFiscaisItensVALOR_DESCONTO.AsFloat;
//        infAdProd      := 'Informação Adicional do Serviço ou produto';

        Imposto.ICMS.CST := TpcnCSTIcms.cst00;// dm.cdsNotasFiscaisItensCST_ICMS.AsString;
        Imposto.ICMS.orig := TpcnOrigemMercadoria.oeNacional;
        Imposto.ICMS.vBC := dm.cdsNotasFiscaisItensBASE_CALCULO_ICMS.AsFloat;
        Imposto.ICMS.vICMS := dm.cdsNotasFiscaisItensVALOR_ICMS.AsFloat;
        Imposto.ICMS.pICMS := dm.cdsNotasFiscaisItensPERCENTUAL_ICMS.AsFloat;

        Imposto.PIS.CST :=  TpcnCstPis.pis01;// dm.cdsNotasFiscaisItensCST_PIS.AsString;
//        Imposto.PIS.vBC
        Imposto.PIS.pPIS := dm.cdsNotasFiscaisItensPERCENTUAL_PIS.AsFloat;
        Imposto.PIS.vPIS := dm.cdsNotasFiscaisItensVALOR_PIS.AsFloat;

        Imposto.IPI.CST :=  TpcnCstIpi.ipi00;
        Imposto.IPI.vBC := dm.cdsNotasFiscaisItensBASE_CALCULO_IPI.AsFloat;
        Imposto.IPI.pIPI := dm.cdsNotasFiscaisItensPERCENTUAL_IPI.AsFloat;
        Imposto.IPI.vIPI := dm.cdsNotasFiscaisItensVALOR_IPI.AsFloat;
      end ;
      dm.cdsNotasFiscaisItens.Next;
    end;

    //Fim da inserção de produtos

    {
    //Adicionando Serviços
      with Det.Add do
       begin
         Prod.nItem    := 1; // Número sequencial, para cada item deve ser incrementado
         Prod.cProd    := '123457';
         Prod.cEAN     := '';
         Prod.xProd    := 'Descrição do Serviço';
         Prod.NCM      := '99';
         Prod.EXTIPI   := '';
         Prod.CFOP     := '5933';
         Prod.uCom     := 'UN';
         Prod.qCom     := 1 ;
         Prod.vUnCom   := 100;
         Prod.vProd    := 100 ;

         Prod.cEANTrib  := '';
         Prod.uTrib     := 'UN';
         Prod.qTrib     := 1;
         Prod.vUnTrib   := 100;

         Prod.vFrete    := 0;
         Prod.vSeg      := 0;
         Prod.vDesc     := 0;

         infAdProd      := 'Informação Adicional do Serviço';
         {
//Grupo para serviços
         with Imposto.ISSQN do
         begin
           cSitTrib  := ISSQNcSitTribNORMAL;
           vBC       := 100;
           vAliq     := 2;
           vISSQN    := 2;
           cMunFG    := 3554003;
           cListServ := 1402; // Preencha este campo usando a tabela disponível
                              // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
         end;}
      // end ;}



    Cobr.Fat.nFat  := 'Numero da Fatura';
    Cobr.Fat.vOrig := 100 ;
    Cobr.Fat.vDesc := 0 ;
    Cobr.Fat.vLiq  := 100 ;


    //Parcelas de pagamento
    dm.cdsGenerico.Close;
    dm.cdsGenerico.CommandText := 'SELECT * FROM DUPLICATAS_NOTAS_FISCAIS WHERE ID_NOTA_FISCAL = '+IntToStr(qIdNotaFiscal)+' ORDER BY NUMERO_FATURA';
    dm.cdsGenerico.Open;
    Cobr.Dup.Clear;
    dm.cdsGenerico.First;
    while not dm.cdsGenerico.Eof do
    begin
      with Cobr.Dup.Add do
      begin
        nDup  := IntToStr(dm.cdsGenerico.FieldByName('NUMERO_FATURA').AsInteger);
        dVenc := dm.cdsGenerico.FieldByName('VENCIMENTO').AsDateTime;
        vDup  := dm.cdsGenerico.FieldByName('VALOR').AsFloat;
      end;
      dm.cdsGenerico.Next;
    end;
//    with Cobr.Dup.Add do
//    begin
//      nDup  := '1234';
//      dVenc := now+10;
//      vDup  := 50;
//    end;
//
//    with Cobr.Dup.Add do
//    begin
//      nDup  := '1235';
//      dVenc := now+10;
//      vDup  := 50;
//    end;


    InfAdic.infCpl     :=  '';
    InfAdic.infAdFisco :=  '';

    with InfAdic.obsCont.Add do
    begin
      xCampo := 'ObsCont';
      xTexto := 'Texto';
    end;

    with InfAdic.obsFisco.Add do
    begin
      xCampo := 'ObsFisco';
      xTexto := 'Texto';
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
    if ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat = 100 then
    begin
      showmessage(ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo);
      ACBrNFeDANFEFR1.ACBrNFe := ACBrNFe1;
      ACBrNFeDANFEFR1.PathPDF := ExtractFilePath(Application.ExeName);
      ACBrNFeDANFEFR1.FastFile := ExtractFilePath(Application.ExeName)+'DANFE.fr3';
      ACBrNFe1.NotasFiscais.Items[0].Imprimir;
      ACBrNFe1.NotasFiscais.Items[0].ImprimirPDF;
      try
        dm.cdsnotasfiscais.Edit;
        dm.cdsnotasfiscaisNUMERO_NOTA_FISCAL.AsInteger := frmLogin.sUltNumNFe;
        dm.cdsnotasfiscaisCHAVE.AsString := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.chNFe;
        dm.cdsnotasfiscaisNUMERO_PROTOCOLO_RECEBIMENTO.AsString := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt;
        dm.cdsnotasfiscaisDATA_HORA_RECEBIMENTO.AsString := FormatDateTime('dd/mm/yyyy - hh:mm:ss',ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);
        dm.cdsnotasfiscaisMOTIVO_RECEBIMENTO.AsString := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo;
        dm.cdsnotasfiscais.Post;
      except
      end;
    end
    else
      MessageDlg('Não foi possível efetuar o envio desta NF-e'+#13+
                 'Mensagem retornada pelo webservice '+#13+
                 ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo,mtWarning,[mbOK],0);
  except on e:exception do
    begin
      messageDlg('O sistema não conseguiu efetuar o envio desta NF-e'+#13+
                 'Erro retornado pelo webservice '+#13+e.Message,mtWarning,[mbOk],0);
    end;
  end;
end;

procedure TfrmNfe.FormShow(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
  vClientouServidor : string;
begin
  if not dm.cdsNotasFiscais.Active then
    dm.cdsNotasFiscais.Active := true;

  if not dm.cdsNotasFiscaisItens.Active then
    dm.cdsNotasFiscaisItens.Active := true;

  cxTsPesquisa.Caption := '';
  cxTSInserirNota.Caption := '';
  cxTSInserirNota.TabVisible := False;
  cxPCPrincipal.ActivePage := cxTsPesquisa;
  cxGridNotasFiscais.SetFocus;

  Conexao := TDSModuleDbClient.Create(dm.SQLConexao.DBXConnection);
  vClientouServidor := AnsiupperCase(Conexao.RetornaLocalEmissaoNFe);
  if vClientouServidor = 'CLIENT' then
    if not FileExists(ExtractFilePath(Application.ExeName)+'configNF_e_Client.ini') then
      cxBtnEnviarNFe.Visible := False
    else
    begin
      if not FileExists(ExtractFilePath(Application.ExeName)+'DANFE.fr3') then
        MessageDlg('O sistema não encontrou o arquivo DANFE.fr3 na pasta'+#13+
                   'onde está localizado o executável do sistema. Desta forma,'+#13+
                   'não será possível a emissão da NF-e e impressão do Danfe.'+#13+
                   'por favor, regularize esta questão antes de efetuar a emissão da NF-e',
                   mtError,[mbOK],0);

      if not FileExists(ExtractFilePath(Application.ExeName)+'DANFeRetrato_Basic.fr3') then
        MessageDlg('O sistema não encontrou o arquivo DANFeRetrato_Basic.fr3 na pasta'+#13+
                   'onde está localizado o executável do sistema. Desta forma,'+#13+
                   'não será possível a emissão da NF-e e impressão do Danfe.'+#13+
                   'por favor, regularize esta questão antes de efetuar a emissão da NF-e',
                   mtError,[mbOK],0);
      if not FileExists(ExtractFilePath(Application.ExeName)+'DANFeRetratoFS_Basic.fr3') then
        MessageDlg('O sistema não encontrou o arquivo DANFeRetratoFS_Basic.fr3 na pasta'+#13+
                   'onde está localizado o executável do sistema. Desta forma,'+#13+
                   'não será possível a emissão da NF-e e impressão do Danfe.'+#13+
                   'por favor, regularize esta questão antes de efetuar a emissão da NF-e',
                   mtError,[mbOK],0);
      cxBtnEnviarNFe.Visible := True;
    end;
  FreeAndNil(Conexao);

end;

procedure TfrmNfe.Image2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmNfe.LocalizarFatura(qIdNotaFiscal: integer);
begin
  if not dm.cdsDuplicatasNotasFiscais.Active then
    dm.cdsDuplicatasNotasFiscais.Active := true;

  dm.cdsDuplicatasNotasFiscais.close;
  dm.cdsDuplicatasNotasFiscais.CommandText:=' SELECT * FROM DUPLICATAS_NOTAS_FISCAIS where ID_NOTA_FISCAL = ' +IntToStr(dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger) +
  ' ORDER BY ID_DUPLICATA_NOTA_FISCAL';
  dm.cdsDuplicatasNotasFiscais.Open;
//  dm.cdsDuplicatasNotasFiscais.Filtered := False;
//  dm.cdsDuplicatasNotasFiscais.Filter := '';
//  dm.cdsDuplicatasNotasFiscais.Filter := ' ID_NOTA_FISCAL = '+IntToStr(dm.cdsNotasFiscaisID_NOTA_FISCAL.AsInteger);
//  dm.cdsDuplicatasNotasFiscais.Filtered := True;
end;

end.
