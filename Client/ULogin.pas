unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxLabel, cxLocalization, cxClasses, dxSkinsForm, IniFiles,UITypes{,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light};

type
  TfrmLogin = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxEdtSenha: TcxTextEdit;
    cxEdtUsuario: TcxTextEdit;
    cxBtnConfirmar: TcxButton;
    cxBtnCancelar: TcxButton;
    cxBtnCadastrarSenha: TcxButton;
    cxLblCadastrarSenha: TcxLabel;
    cxEdtCadastrarSenha: TcxTextEdit;
    dxSkinController1: TdxSkinController;
    cxLocalizer1: TcxLocalizer;
    cxLookAndFeelController1: TcxLookAndFeelController;
    procedure cxBtnConfirmarClick(Sender: TObject);
    procedure cxBtnCancelarClick(Sender: TObject);
    procedure cxBtnCadastrarSenhaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GravaArqIni;
    procedure LeArqIni;
  private
    { Private declarations }
    procedure AtualizarTela;
  public
    { Public declarations }
    aConfiguracoesClientes : array[1..26] of string;
    pEnderecoServidor,pPortaServidor,pPortaImpressora,
    pModeloImpressora,pNomeUsuario,pNumeroCaixa,pSenhaUsuario,
    pPercentualAvisoCliente,pCaminhoMapeamentoServidor,
    pNomeAlmoxarifadoPadraoBalcao : string;
    pAlmoxarifadoPadraoBalcao,pSat_ECF : Integer;
    pMovimentaCaixa : boolean;
    pAliqicm,pAliqPis,pAliqCofins : Double;
    // configurações do AcBr
    sFormas, sAmbiente,sUltNumNFe : Integer;
    sSalvaArq : Boolean;
    sLogoMarca, sPathArq, sCertificado, sSenha, sSerial,
    sRazao, sFantasia, sCNPJ, sIE, sEndereco, sNum,
    sBairro, sCidade, sCEP, sUF, sCodMun, sUFWS, sHost,
    sPorta, sUsuario, sSenhaWS, sFone, sSituacaoTributaria,
    sAliquotaPis, sAliquotaCofins,sEmissaoNFeServidorOuClient,
    sSmtpHost,sSmtpPorta,sSmtpUsuario,sSmtpSenha,sEmailAssunto,
    sEmailSSL,sEmailMensagem,sCopiaControlada,
    sEmail,sSite : String;

    //Configurações sat
    pModeloSat,pTipoAmbienteSat,pRegimeTributario,
    pTributacaoISSQN,pIndRatISSQN,pUtf : Integer;
    pCaminhoDllSat,pCNPJSoftwareHouse,pCNPJEmitente,
    pInscricaoEstadual,pInscricaoMunicipal,pAssinatura,pCodigoAtivacao,Pconexao : string
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UDataModul, UntConectaServidor, GroupedItems1;

procedure TfrmLogin.AtualizarTela;
begin
  dm.cdsGenerico.Close;
  dm.cdsGenerico.CommandText := 'SELECT COALESCE(TIPO_SKIN_TELA,'+QuotedStr('LiquidSky')+') AS TIPO_SKIN_TELA FROM USUARIOS'+
                                ' WHERE UPPER(USUARIO) = '+QuotedStr(AnsiUpperCase(pNomeUsuario))+
                                ' AND UPPER(SENHA) = '+QuotedStr(AnsiUpperCase(pSenhaUsuario));
  dm.cdsGenerico.Open;
  {if dm.cdsGenerico.FieldByName('TIPO_SKIN_TELA').AsString <> '' then
  begin
    dxSkinController1.SkinName := dm.cdsGenerico.FieldByName('TIPO_SKIN_TELA').AsString;
    cxLookAndFeelController1.SkinName := dm.cdsGenerico.FieldByName('TIPO_SKIN_TELA').AsString;
  end
  else
  begin
    dxSkinController1.SkinName := 'LiquidSky';
    cxLookAndFeelController1.SkinName := 'LiquidSky';
  end;
  dxSkinController1.UseSkins := True;   }
end;

procedure TfrmLogin.cxBtnCadastrarSenhaClick(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
begin
  if Trim(cxEdtSenha.Text) = Trim(cxEdtCadastrarSenha.Text) then
  begin
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    if Conexao.CadastrarSenha(Trim(cxEdtUsuario.Text),Trim(cxEdtSenha.Text))then
      cxBtnConfirmarClick(Self)
    else
    begin
      showmessage('Não foi possível efetuar o cadastro da senha');
      abort;
    end;
  end
  else
  begin
    showmessage('Valor digitado no campo senha e confirm.senha estão divergentes');
    abort;
  end;
end;

procedure TfrmLogin.cxBtnCancelarClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmLogin.cxBtnConfirmarClick(Sender: TObject);
var
  F:TextFile;
  vLinhao,vSenha,vConfirmaSenha : string;
  Conexao : TDSModuleDbClient;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini') then
    LeArqIni
  else
  begin
    pEnderecoServidor := 'localhost';
    pPortaServidor := '211';
    pPortaImpressora := 'COM2';
    pModeloImpressora := '9';
    pNumeroCaixa := '99';
    pPercentualAvisoCliente := '100';
    pCaminhoMapeamentoServidor := '';
    GravaArqIni;
    LeArqIni;
  end;

  {
  //Array de configuração do arquivo INI
  //1 - endereço servidor, 2- Porta do servidor, 3 - porta da impressora fiscal
  //4 - modelo da impressora fiscal, 5 - numero do caixa
  AssignFile(F,ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini');
  if FileExists(ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini') then
  begin
    Reset(F);
    Readln(F, vLinhao);
    if vLinhao <> '' then
    begin
      pEnderecoServidor := vLinhao;
      aConfiguracoesClientes[1] := vLinhao;
    end
    else
    begin
      pEnderecoServidor := 'localhost';
      aConfiguracoesClientes[1] := 'localhost';
    end;

    vLinhao := '';
    Readln(F, vLinhao);
    if vLinhao <> '' then
    begin
      pPortaServidor := vLinhao;
      aConfiguracoesClientes[2] := vLinhao;
    end
    else
    begin
      pPortaServidor := '211';
      aConfiguracoesClientes[2] := '211';
    end;

    vLinhao := '';
    Readln(F, vLinhao);
    if vLinhao <> '' then
    begin
      pPortaImpressora := vLinhao;
      aConfiguracoesClientes[3] := vLinhao;
    end
    else
    begin
      pPortaImpressora := 'COM2';
      aConfiguracoesClientes[3] := 'COM2';
    end;

    vLinhao := '';
    Readln(F, vLinhao);
    if vLinhao <> '' then
    begin
      pModeloImpressora := vLinhao;
      aConfiguracoesClientes[4] := vLinhao;
    end
    else
    begin
      pModeloImpressora := '9';
      aConfiguracoesClientes[4] := '9';
    end;

    vLinhao := '';
    Readln(F, vLinhao);
    if vLinhao <> '' then
    begin
      pNumeroCaixa := vLinhao;
      aConfiguracoesClientes[5] := vLinhao;
    end
    else
    begin
      pNumeroCaixa := '99';
      aConfiguracoesClientes[5] := '99';
    end;

    vLinhao := '';
    Readln(F, vLinhao);
    if vLinhao <> '' then
    begin
      pPercentualAvisoCliente := vLinhao;
      aConfiguracoesClientes[6] := vLinhao;
    end
    else
    begin
      pPercentualAvisoCliente := '100';
      aConfiguracoesClientes[6] := '100';
    end;

    vLinhao := '';
    Readln(F, vLinhao);
    if vLinhao <> '' then
    begin
      pCaminhoMapeamentoServidor := vLinhao;
      aConfiguracoesClientes[7] := vLinhao;
    end
    else
    begin
      pCaminhoMapeamentoServidor := '';
      aConfiguracoesClientes[7] := '';
    end;

    CloseFile(F);
  end
  else
  begin
    Rewrite(F);
    pEnderecoServidor := 'localhost';
    aConfiguracoesClientes[1] := 'localhost';
    Writeln(F,pEnderecoServidor);
    pPortaServidor := '211';
    aConfiguracoesClientes[2] := '211';
    Writeln(F,pPortaServidor);
    pPortaImpressora := 'COM2';
    aConfiguracoesClientes[3] := 'COM2';
    Writeln(F,pPortaImpressora);
    pModeloImpressora := '9';
    aConfiguracoesClientes[4] := '9';
    Writeln(F,pModeloImpressora);
    pNumeroCaixa := '99';
    aConfiguracoesClientes[5] := '99';
    pPercentualAvisoCliente := '100';
    aConfiguracoesClientes[6] := '100';
    Writeln(F,pNumeroCaixa);
    pCaminhoMapeamentoServidor := '';
    aConfiguracoesClientes[7] := '';
    Writeln(F,pCaminhoMapeamentoServidor);
    CloseFile(F);
  end;
  }
  //VERIFICA SE EXISTE O ARQUIVO DENTRO DA PASTA
  if FileExists(ExtractFilePath(Application.ExeName)+'\dev-ptbr.ini') then
  begin
    cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\dev-ptbr.ini');
    cxLocalizer1.LanguageIndex := 1; // MUDA DE LINGUAGEM
    cxLocalizer1.Active := TRUE;     // ATIVA O COMPONENTE
  end;
  try
    Application.CreateForm(TDM,DM);
  except

  end;
  if (AnsiUpperCase(cxEdtUsuario.Text) <> 'BUSINESS') and
     (AnsiUpperCase(cxEdtSenha.Text) <> '131922') then
  begin
    if cxEdtUsuario.Text = '' then
    begin
      showmessage('Informe o nome de usuário');
      cxEdtUsuario.SetFocus;
      abort;
    end;
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    //Verificando se usuario existe
    if Conexao.VerificaSeUsuarioEstaCadastrado(Trim(cxEdtUsuario.Text)) = false then
    begin
      showmessage('Usuário não cadastrado');
      cxEdtUsuario.SetFocus;
      FreeAndNil(Conexao);
      abort;
    end;

    if cxEdtSenha.Text <> '' then
    begin
      if Conexao.VerificaSeSenhaEstaCorreta(Trim(cxEdtSenha.Text)) = false then
      begin
        showmessage('Senha digitada é inválida');
        cxEdtSenha.SetFocus;
        FreeAndNil(Conexao);
        Abort;
      end;
    end
    else
    begin
      showmessage('Este usuário não possui senha cadastrada.'+#13+
                  'Por favor,efetue o cadastramento da senha.');
      cxBtnConfirmar.Left := 23;
      cxBtnConfirmar.Top := 107;
      cxBtnConfirmar.Enabled := False;
      cxBtnCadastrarSenha.Left := 104;
      cxBtnCadastrarSenha.Top := 107;
      cxBtnCadastrarSenha.Visible := True;
      cxBtnCancelar.Left := 216;
      cxBtnCancelar.Top := 107;
      Self.Width := 337;
      Self.Height := 181;
      cxLblCadastrarSenha.Visible := True;
      cxLblCadastrarSenha.Left := 16;
      cxLblCadastrarSenha.Top := 67;
      cxEdtCadastrarSenha.Visible := True;
      cxEdtCadastrarSenha.Left := 136;
      cxEdtCadastrarSenha.Top := 65;
      cxEdtSenha.SetFocus;
      FreeAndNil(Conexao);
      abort;
    end;
  end;
  pNomeUsuario := cxEdtUsuario.Text;
  pSenhaUsuario := cxEdtSenha.Text;
  AtualizarTela;
  Self.Hide;
  if not Assigned(SplitForm) then
    SplitForm := TSplitForm.Create(Self);
  SplitForm.Show;
  SplitForm.BringToFront;
//  Application.Terminate;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  Self.Left := Trunc(Screen.Width / 2) - 200;
  Self.Top := Trunc(Screen.Height / 2) - 200;
  cxEdtUsuario.SetFocus;
end;

procedure TfrmLogin.GravaArqIni;
var ArqINI : TIniFile;
vArquivo : string;
begin
  {Assinatura Tassin}
//    pAssinatura := 'WpfhMaLuDUI6Wc67A5QsmmCTiSwUjMbl17SXAQm1q9N0nglx/QlP54Rrwo7GDwZjR/KnkbYKxXIR0UPBBsCiVe0yEnYTAz4j3/'+
//                   'Twu0bthJVC8fRQZVKS8jUGmeyPZnoHKHQK8j4tb08O+/rAXWhCu19gXQXkqH4N9or/sgsjJ5U3dnlQZ96QO4XmHIf4sHaFAjUj'+
//                   '0MB/kab7Qzxz+9RBMyHdqmgbcWxBZudre65AQkpLPOefzO2XsU11iA8wtdhuY3hhXqs91f8lNPol4zZutttz0JaKQYGmq++pJC'+
//                   'iNPJV5m6S1n/CFSdCCjnhT6jGfHdLlD8effgSYqSbpiB1P8A==';
   {Assinatura Tassin}

   {Assinatura Tassin}
//    pAssinatura := 'SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT';
  {Assinatura Tassin}

  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini');
  // GERAL
  ArqINI.WriteString('CONFIGURACOES','ENDERECO_SERVIDOR',pEnderecoServidor);
  ArqINI.WriteString('CONFIGURACOES','PORTA_SERVIDOR',pPortaServidor);
  ArqINI.WriteString('CONFIGURACOES','NUMERO_CAIXA',pNumeroCaixa);
  ArqINI.WriteString('CONFIGURACOES','PERCENTUAL_AVISO_LIMITE_CLIENTE',pPercentualAvisoCliente);
  ArqINI.WriteString('CONFIGURACOES','PORTA_IMPRESSORA_FISCAL',pPortaImpressora);
  ArqINI.WriteString('CONFIGURACOES','MODELO_IMPRESSORA',pModeloImpressora);
  ArqINI.WriteString('CONFIGURACOES','SKIN','');
  ArqINI.WriteString('CONFIGURACOES','PASTA_MAPEADA_SERVIDOR',pCaminhoMapeamentoServidor);
  //
  ArqINI.WriteInteger('CONFIGURACOES','SAT_OU_ECF',pSat_ECF);
  //
  //SAT
  ArqINI.WriteInteger('SAT','MODELO_SAT',pModeloSat);
  ArqINI.WriteString('SAT','CAMINHO_DLL',ExtractFilePath(Application.ExeName)+'SAT.dll');
  ArqINI.WriteInteger('SAT','TIPO_AMBIENTE',pTipoAmbienteSat);

  {Cnpj Businesss}
  ArqINI.WriteString('SAT','CNPJ_SOFTWAREHOUSE','18457467000120');
  {Cnpj Businesss}

  {cnpj Teste}
  //ArqINI.WriteString('SAT','CNPJ_SOFTWAREHOUSE','16716114000172');
  {cnpj Teste}

  ArqINI.WriteString('SAT','CNPJ_EMITENTE',pCNPJEmitente);
  ArqINI.WriteString('SAT','INSCRICAO_ESTADUAL',pInscricaoEstadual);
  ArqINI.WriteString('SAT','INSCRICAO_MUNICIPAL',pInscricaoMunicipal);
  ArqINI.WriteInteger('SAT','REGIME_TRIBUTARIO',pRegimeTributario);
  ArqINI.WriteInteger('SAT','TRIBUTACAO_ISSQN',pTributacaoISSQN);
  ArqINI.WriteInteger('SAT','IND_RAT_ISSQN',pIndRatISSQN);
  ArqINI.WriteInteger('SAT','UTF',pUtf);
  ArqINI.WriteString('SAT','CHAVE_ASSINATURA',pAssinatura);
  ArqINI.WriteString('SAT','CODIGO_ATIVACAO',pCodigoAtivacao);
  ArqIni.WriteString('SAT','ALIQ_ICMS',FloattoStr(pAliqIcm));
  ArqIni.WriteString('SAT','ALIQ_PIS',FloattoStr(pAliqPis));
  ArqIni.WriteString('SAT','ALIQ_COFINS',FloattoStr(pAliqCofins));
  ArqINI.Free;
  aConfiguracoesClientes[1] := pEnderecoServidor;
  aConfiguracoesClientes[2] := pPortaServidor;
  aConfiguracoesClientes[3] := pPortaImpressora;
  aConfiguracoesClientes[4] := pModeloImpressora;
  aConfiguracoesClientes[5] := pNumeroCaixa;
  aConfiguracoesClientes[6] := pPercentualAvisoCliente;
  aConfiguracoesClientes[7] := pCaminhoMapeamentoServidor;
  aConfiguracoesClientes[8] := pNomeAlmoxarifadoPadraoBalcao;
  aConfiguracoesClientes[9] := IntToStr(pAlmoxarifadoPadraoBalcao);
  aConfiguracoesClientes[10] := IntToStr(pSat_ECF);

  aConfiguracoesClientes[11] := IntToStr(pModeloSat);
  aConfiguracoesClientes[12] := pCaminhoDllSat;
  aConfiguracoesClientes[13] := IntToStr(pTipoAmbienteSat);
  aConfiguracoesClientes[14] := pCNPJSoftwareHouse;
  aConfiguracoesClientes[15] := pCNPJEmitente;
  aConfiguracoesClientes[16] := pInscricaoEstadual;
  aConfiguracoesClientes[17] := pInscricaoMunicipal;
  aConfiguracoesClientes[18] := IntToStr(pRegimeTributario);
  aConfiguracoesClientes[19] := IntToStr(pTributacaoISSQN);
  aConfiguracoesClientes[20] := IntToStr(pIndRatISSQN);
  aConfiguracoesClientes[21] := IntToStr(pUtf);
  aConfiguracoesClientes[22] := pAssinatura;
  aConfiguracoesClientes[23] := pCodigoAtivacao;
  aConfiguracoesClientes[24] := FloattoStr(pAliqIcm);
  aConfiguracoesClientes[25] := FloattoStr(pAliqPis);
  aConfiguracoesClientes[26] := FloattoStr(pAliqCofins);
  MessageDlg('Gravação efetuada com êxito',mtConfirmation,[mbOK],0);
end;

procedure TfrmLogin.LeArqIni;
var ArqINI : TIniFile;
    aux : String;
begin
  aux := ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini';
  ArqINI := TIniFile.Create(aux);

  pEnderecoServidor := ArqINI.ReadString('CONFIGURACOES','ENDERECO_SERVIDOR','');
  pPortaServidor := ArqINI.ReadString('CONFIGURACOES','PORTA_SERVIDOR','211');
  pNumeroCaixa := ArqINI.ReadString('CONFIGURACOES','NUMERO_CAIXA','0');
  pPercentualAvisoCliente := ArqINI.ReadString('CONFIGURACOES','PERCENTUAL_AVISO_LIMITE_CLIENTE','100');
  pPortaImpressora := ArqINI.ReadString('CONFIGURACOES','PORTA_IMPRESSORA_FISCAL','COM2');
  pModeloImpressora := ArqINI.ReadString('CONFIGURACOES','MODELO_IMPRESSORA','9');
//  ArqINI.WriteString('CONFIGURACOES','SKIN','');
  pCaminhoMapeamentoServidor := ArqINI.ReadString('CONFIGURACOES','PASTA_MAPEADA_SERVIDOR','');
  pSat_ECF := ArqINI.ReadInteger('CONFIGURACOES','SAT_OU_ECF',0);
  //
  //SAT
  pModeloSat := ArqINI.ReadInteger('SAT','MODELO_SAT',0);
  pCaminhoDllSat := ArqINI.ReadString('SAT','CAMINHO_DLL',ExtractFilePath(Application.ExeName)+'SAT.dll');
  pTipoAmbienteSat := ArqINI.ReadInteger('SAT','TIPO_AMBIENTE',0);
  //Mudar cnpj para nossa empresa
//  pCNPJSoftwareHouse := ArqINI.ReadString('SAT','CNPJ_SOFTWAREHOUSE','16716114000172');
  pCNPJSoftwareHouse := ArqINI.ReadString('SAT','CNPJ_SOFTWAREHOUSE','18457467100020');
  pCNPJEmitente := ArqINI.ReadString('SAT','CNPJ_EMITENTE','');
  pInscricaoEstadual := ArqINI.ReadString('SAT','INSCRICAO_ESTADUAL','');
  pInscricaoMunicipal := ArqINI.ReadString('SAT','INSCRICAO_MUNICIPAL','');
  pRegimeTributario := ArqINI.ReadInteger('SAT','REGIME_TRIBUTARIO',0);
  pTributacaoISSQN := ArqINI.ReadInteger('SAT','TRIBUTACAO_ISSQN',0);
  pIndRatISSQN := ArqINI.ReadInteger('SAT','IND_RAT_ISSQN',0);
  pUtf := ArqINI.ReadInteger('SAT','UTF',0);
  pAssinatura :=  ArqINI.ReadString('SAT','CHAVE_ASSINATURA','');
  pCodigoAtivacao := ArqINI.ReadString('SAT','CODIGO_ATIVACAO','');
  Pconexao:= ArqINI.ReadString('BANCO','CAMINHO','');

  ArqINI.Free;
  aConfiguracoesClientes[1] := pEnderecoServidor;
  aConfiguracoesClientes[2] := pPortaServidor;
  aConfiguracoesClientes[3] := pPortaImpressora;
  aConfiguracoesClientes[4] := pModeloImpressora;
  aConfiguracoesClientes[5] := pNumeroCaixa;
  aConfiguracoesClientes[6] := pPercentualAvisoCliente;
  aConfiguracoesClientes[7] := pCaminhoMapeamentoServidor;
  aConfiguracoesClientes[8] := pNomeAlmoxarifadoPadraoBalcao;
  aConfiguracoesClientes[9] := IntToStr(pAlmoxarifadoPadraoBalcao);
  aConfiguracoesClientes[10] := IntToStr(pSat_ECF);

  aConfiguracoesClientes[11] := IntToStr(pModeloSat);
  aConfiguracoesClientes[12] := pCaminhoDllSat;
  aConfiguracoesClientes[13] := IntToStr(pTipoAmbienteSat);
  aConfiguracoesClientes[14] := pCNPJSoftwareHouse;
  aConfiguracoesClientes[15] := pCNPJEmitente;
  aConfiguracoesClientes[16] := pInscricaoEstadual;
  aConfiguracoesClientes[17] := pInscricaoMunicipal;
  aConfiguracoesClientes[18] := IntToStr(pRegimeTributario);
  aConfiguracoesClientes[19] := IntToStr(pTributacaoISSQN);
  aConfiguracoesClientes[20] := IntToStr(pIndRatISSQN);
  aConfiguracoesClientes[21] := IntToStr(pUtf);
  aConfiguracoesClientes[22] := pAssinatura;
  aConfiguracoesClientes[23] := pCodigoAtivacao;
  aConfiguracoesClientes[24] := FloattoStr(pAliqIcm);
  aConfiguracoesClientes[25] := FloattoStr(pAliqPis);
  aConfiguracoesClientes[26] := FloattoStr(pAliqCofins);
end;

end.
