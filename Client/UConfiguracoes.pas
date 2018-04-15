unit UConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Touch.GestureMgr,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, Vcl.Menus, cxContainer, cxEdit,
  cxGroupBox, cxRadioGroup, cxButtons, cxPC, Vcl.Buttons, cxLabel, cxCheckBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxDBNavigator, Vcl.ComCtrls{,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxBarBuiltInMenu};

type
  TfrmConfiguracoes = class(TForm)
    AppBar: TPanel;
    CloseButton: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    GestureManager1: TGestureManager;
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    cxPCConfiguracoes: TcxPageControl;
    cxTSConfiguracoesConexao: TcxTabSheet;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    lblNovaPorta: TLabel;
    edtPortaAtual: TEdit;
    edtNovaPorta: TEdit;
    cxBtnAlterarPorta: TcxButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    lblNovoEndereco: TLabel;
    edtEnderecoBancoAtual: TEdit;
    edtNovoEnereco: TEdit;
    cxBtnSalvarEndereco: TcxButton;
    cxBtnEfetuarAlteracao: TcxButton;
    GroupBox4: TGroupBox;
    edtNumeroCaixa: TEdit;
    cxBtnAlterarCaixa: TcxButton;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    edtLimiteCliente: TEdit;
    cxBtnAlterarLimite: TcxButton;
    cbbSkin: TComboBox;
    cxBtnUtilizarSkin: TcxButton;
    cxBtnimprimirComandas: TcxButton;
    cxGroupBox1: TcxGroupBox;
    edtMapeamentoServidor: TEdit;
    cxBTNAlterarMapeamento: TcxButton;
    cxBTNConfirmarapeamento: TcxButton;
    cxTSConfiguracoesNFe: TcxTabSheet;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    EdtCodMun: TEdit;
    EdtTelefone: TEdit;
    EdtCidade: TEdit;
    EdtCEP: TEdit;
    EdtBairro: TEdit;
    EdtEndereco: TEdit;
    EdtCNPJ: TEdit;
    EdtFantasia: TEdit;
    EdtRazao: TEdit;
    edtAliquotaCofins: TEdit;
    edtAliquotaPis: TEdit;
    CBBSituacaoTributaria: TComboBox;
    EdtIE: TEdit;
    EdtNum: TEdit;
    EdtUF: TEdit;
    EdtUFWS: TEdit;
    cxGroupBox2: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    RadioFormas: TcxRadioGroup;
    chArquivos: TcxCheckBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    GBUltimoNumeroNFe: TcxGroupBox;
    edtNumeroUltimaNFe: TEdit;
    EdtArquivos: TEdit;
    EdtLogoMarca: TEdit;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxGroupBox8: TcxGroupBox;
    EdtCertificado: TEdit;
    EdtSenhaCertificado: TEdit;
    EdtSerial: TEdit;
    cxButton5: TcxButton;
    RGLocalEmissaoNFe: TcxRadioGroup;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxGroupBox9: TcxGroupBox;
    RadioAmbiente: TcxRadioGroup;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    EdtSenhaWS: TEdit;
    Edit2: TEdit;
    EdtPorta: TEdit;
    EdtHost: TEdit;
    OpenDialog1: TOpenDialog;
    cxTSEmail: TcxTabSheet;
    cbEmailSSL: TcxCheckBox;
    edtSmtpHost: TEdit;
    edtSmtpPort: TEdit;
    edtSmtpUser: TEdit;
    edtSmtpPass: TEdit;
    edtEmailAssunto: TEdit;
    mmEmailMsg: TMemo;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    edtCopiaControlada: TMemo;
    GroupBox6: TGroupBox;
    cxButton6: TcxButton;
    edtAlmoxarifadoPadraBalcao: TEdit;
    cxBtnCancelarMovimentacaoPedido: TcxButton;
    cxRGSatEcf: TcxRadioGroup;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox10: TcxGroupBox;
    grpgbx1: TGroupBox;
    lbl1: TLabel;
    lblNovaPortaCom: TLabel;
    edtPortaComunicacaoImpressoraAtual: TEdit;
    edtPortaComunicacaoImpressoraNova: TEdit;
    cxLeituraX: TcxButton;
    cxReducaoZ: TcxButton;
    cxAlterarImpressora: TcxButton;
    cxBtnAlterarPortaCom: TcxButton;
    cxRGModeloImpressora: TcxRadioGroup;
    cxButton7: TcxButton;
    pgcpag1: TPageControl;
    tsDadosEmit: TTabSheet;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIE: TEdit;
    edtEmitIM: TEdit;
    cbbRegTribISSQN: TComboBox;
    cbbIndRatISSQN: TComboBox;
    cbbRegTributario: TComboBox;
    lbl7: TLabel;
    cbbAmbiente: TComboBox;
    ts1: TTabSheet;
    cxEditStyleController1: TcxEditStyleController;
    edtAtivacao: TEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    edtSwHAssinatura: TEdit;
    cxButton8: TcxButton;
    EdtAliqIcms: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    edtAliqPis: TEdit;
    Label7: TLabel;
    EdtAliqCofins: TEdit;
    procedure BackToMainForm(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure cxBtnAlterarPortaClick(Sender: TObject);
    procedure cxBtnAlterarCaixaClick(Sender: TObject);
    procedure cxBtnAlterarLimiteClick(Sender: TObject);
    procedure cxBtnEfetuarAlteracaoClick(Sender: TObject);
    procedure cxBtnSalvarEnderecoClick(Sender: TObject);
    procedure cxBtnAlterarPortaComClick(Sender: TObject);
    procedure cxAlterarImpressoraClick(Sender: TObject);
    procedure cxBtnUtilizarSkinClick(Sender: TObject);
    procedure AtualizarTela;
    procedure FormShow(Sender: TObject);
    procedure cxBTNConfirmarapeamentoClick(Sender: TObject);
    procedure cxBTNAlterarMapeamentoClick(Sender: TObject);
    procedure LerVariaveisAcbr;
    procedure DeixarCamposDesabilitados;
    procedure DeixarCamposHabilitados;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxReducaoZClick(Sender: TObject);
    procedure cxLeituraXClick(Sender: TObject);
    procedure cxBtnCancelarMovimentacaoPedidoClick(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxRGSatEcfClick(Sender: TObject);
    procedure edtEmitCNPJExit(Sender: TObject);
    procedure edtEmitIEExit(Sender: TObject);
    procedure edtEmitIMExit(Sender: TObject);
    procedure cbbRegTributarioExit(Sender: TObject);
    procedure cbbRegTribISSQNExit(Sender: TObject);
    procedure cbbIndRatISSQNExit(Sender: TObject);
    procedure cbbAmbienteExit(Sender: TObject);
    procedure edtAtivacaoExit(Sender: TObject);
    procedure edtSwHAssinaturaExit(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
  private
    { Private declarations }
    procedure AppBarResize;
    procedure AppBarShow(mode: integer);
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

uses GroupedItems1, SplitItemDetail1, ULogin, UDataModul, UProceduresClient,
  UntConectaServidor, UntVendaBalcao,ACBrSATClass,pcnConversao,
  typinfo;

const
  AppBarHeight = 75;

procedure TfrmConfiguracoes.AppBarResize;
begin
  AppBar.SetBounds(0, AppBar.Parent.Height - AppBarHeight,
    AppBar.Parent.Width, AppBarHeight);
end;

procedure TfrmConfiguracoes.AppBarShow(mode: integer);
begin
  if mode = -1 then // Toggle
    mode := integer(not AppBar.Visible );

  if mode = 0 then
    AppBar.Visible := False
  else
  begin
    AppBar.Visible := True;
    AppBar.BringToFront;
  end;
end;

procedure TfrmConfiguracoes.AtualizarTela;
begin

  if cbbSkin.ItemIndex = 0 then
    frmLogin.dxSkinController1.UseSkins := False
  else
  if cbbSkin.ItemIndex = 1 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Black';
    frmLogin.cxLookAndFeelController1.SkinName := 'Black';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 2 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Blue';
    frmLogin.cxLookAndFeelController1.SkinName := 'Blue';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 3 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Caramel';
    frmLogin.cxLookAndFeelController1.SkinName := 'Caramel';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 4 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Coffee';
    frmLogin.cxLookAndFeelController1.SkinName := 'Coffee';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 5 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Darkroom';
    frmLogin.cxLookAndFeelController1.SkinName := 'Darkroom';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 6 then
  begin
    frmLogin.dxSkinController1.SkinName := 'DarkSide';
    frmLogin.cxLookAndFeelController1.SkinName := 'DarkSide';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 7 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Foggy';
    frmLogin.cxLookAndFeelController1.SkinName := 'Foggy';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 8 then
  begin
    frmLogin.dxSkinController1.SkinName := 'GlassOceans';
    frmLogin.cxLookAndFeelController1.SkinName := 'GlassOceans';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 9 then
  begin
    frmLogin.dxSkinController1.SkinName := 'iMaginary';
    frmLogin.cxLookAndFeelController1.SkinName := 'iMaginary';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 10 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Lilian';
    frmLogin.cxLookAndFeelController1.SkinName := 'Lilian';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 11 then
  begin
    frmLogin.dxSkinController1.SkinName := 'LiquidSky';
    frmLogin.cxLookAndFeelController1.SkinName := 'LiquidSky';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 12 then
  begin
    frmLogin.dxSkinController1.SkinName := 'LondonLiquidSky';
    frmLogin.cxLookAndFeelController1.SkinName := 'LondonLiquidSky';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 13 then
  begin
    frmLogin.dxSkinController1.SkinName := 'McSkin';
    frmLogin.cxLookAndFeelController1.SkinName := 'McSkin';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 14 then
  begin
    frmLogin.dxSkinController1.SkinName := 'MoneyTwins';
    frmLogin.cxLookAndFeelController1.SkinName := 'MoneyTwins';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 15 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Office2007Black';
    frmLogin.cxLookAndFeelController1.SkinName := 'Office2007Black';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 16 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Office2007Blue';
    frmLogin.cxLookAndFeelController1.SkinName := 'Office2007Blue';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 17 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Office2007Green';
    frmLogin.cxLookAndFeelController1.SkinName := 'Office2007Green';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 18 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Office2007Pink';
    frmLogin.cxLookAndFeelController1.SkinName := 'Office2007Pink';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 19 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Office2007Silver';
    frmLogin.cxLookAndFeelController1.SkinName := 'Office2007Silver';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 20 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Pumpkin';
    frmLogin.cxLookAndFeelController1.SkinName := 'Pumpkin';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 21 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Seven';
    frmLogin.cxLookAndFeelController1.SkinName := 'Seven';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 22 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Sharp';
    frmLogin.cxLookAndFeelController1.SkinName := 'Sharp';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 23 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Silver';
    frmLogin.cxLookAndFeelController1.SkinName := 'Silver';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 24 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Springtime';
    frmLogin.cxLookAndFeelController1.SkinName := 'Springtime';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 25 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Stardust';
    frmLogin.cxLookAndFeelController1.SkinName := 'Stardust';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 26 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Summer2008';
    frmLogin.cxLookAndFeelController1.SkinName := 'Summer2008';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 27 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Valentine';
    frmLogin.cxLookAndFeelController1.SkinName := 'Valentine';
    frmLogin.dxSkinController1.UseSkins := True;
  end
  else
  if cbbSkin.ItemIndex = 28 then
  begin
    frmLogin.dxSkinController1.SkinName := 'Xmas2008Blue';
    frmLogin.cxLookAndFeelController1.SkinName := 'Xmas2008Blue';
    frmLogin.dxSkinController1.UseSkins := True;
  end;

  dm.cdsGenerico.Close;
  dm.cdsGenerico.CommandText := 'UPDATE USUARIOS SET TIPO_SKIN_TELA = '+QuotedStr(frmLogin.cxLookAndFeelController1.SkinName)+
                                ' WHERE UPPER(USUARIO) = '+QuotedStr(AnsiUpperCase(frmLogin.pNomeUsuario))+
                                ' AND UPPER(SENHA) = '+QuotedStr(AnsiUpperCase(frmLogin.pSenhaUsuario));
  dm.cdsGenerico.Execute;

end;

procedure TfrmConfiguracoes.BackToMainForm(Sender: TObject);
begin
  Self.Close;
//  Hide;
//  SplitForm.BringToFront;
end;

procedure TfrmConfiguracoes.cbbAmbienteExit(Sender: TObject);
begin
  if cbbAmbiente.ItemIndex <> frmLogin.pTipoAmbienteSat then
  begin
    frmLogin.pTipoAmbienteSat := cbbAmbiente.ItemIndex;
    frmlogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.cbbIndRatISSQNExit(Sender: TObject);
begin
  if cbbIndRatISSQN.ItemIndex <> frmLogin.pIndRatISSQN then
  begin
    frmLogin.pIndRatISSQN := cbbIndRatISSQN.ItemIndex;
    frmlogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.cbbRegTribISSQNExit(Sender: TObject);
begin
   if cbbRegTribISSQN.ItemIndex <> frmLogin.pTributacaoISSQN then
  begin
    frmLogin.pTributacaoISSQN := cbbRegTribISSQN.ItemIndex;
    frmlogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.cbbRegTributarioExit(Sender: TObject);
begin
  if cbbRegTributario.ItemIndex <> frmLogin.pRegimeTributario then
  begin
    frmLogin.pRegimeTributario := cbbRegTributario.ItemIndex;
    frmlogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.Action1Execute(Sender: TObject);
begin
  AppBarShow(-1);
end;

procedure TfrmConfiguracoes.CloseButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmConfiguracoes.cxAlterarImpressoraClick(Sender: TObject);
//var
//  I,X : integer;
//  F:TextFile;
begin
  frmLogin.pModeloImpressora := IntToStr(cxRGModeloImpressora.ItemIndex);
  frmLogin.GravaArqIni;
  {
  AssignFile(F,ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini');
  Reset(F);
  Rewrite(F);
  X := cxRGModeloImpressora.ItemIndex;
  frmLogin.aConfiguracoesClientes[4] := IntToStr(cxRGModeloImpressora.ItemIndex);
  for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
    writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);

  try
    frmLogin.pModeloImpressora := IntToStr(cxRGModeloImpressora.ItemIndex);
    showmessage('Substituição efetuada com exito');
  except
    frmLogin.aConfiguracoesClientes[4] := IntToStr(X);
    for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
      writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
    showmessage('Não foi possível efetuar alteração');
  end;
  CloseFile(F);
  }
end;

procedure TfrmConfiguracoes.cxBtnAlterarCaixaClick(Sender: TObject);
var
//  I : integer;
//  F:TextFile;
//  vLinhao:string;
  Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  if not Conexao.CadastrarCaixa(StrToInt(edtNumeroCaixa.Text)) then
  begin
    Messagedlg('Não foi possível efetuar cadastro do caixa',mtError,[mbOK],0);
    edtNumeroCaixa.Text := frmLogin.pNumeroCaixa;
  end
  else
  begin
    frmLogin.pNumeroCaixa := edtNumeroCaixa.Text;
    frmLogin.GravaArqIni;
    Messagedlg('Caixa cadastrado com sucesso',mtConfirmation,[mbOK],0);
  end;
  FreeAndNil(Conexao);


{
  AssignFile(F,ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini');
  Reset(F);
  Rewrite(F);
  vLinhao := Trim(frmLogin.pNumeroCaixa);
  frmLogin.aConfiguracoesClientes[5] := Trim(edtNumeroCaixa.Text);
  for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
    writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);

  try
    frmLogin.pNumeroCaixa := edtNumeroCaixa.Text;
    try
      Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
      if not Conexao.CadastrarCaixa(StrToInt(edtNumeroCaixa.Text)) then
      begin
        showmessage('Não foi possível efetuar cadastro do caixa');
        frmLogin.aConfiguracoesClientes[5] := vLinhao;
        for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
          writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
        edtNumeroCaixa.Text := vLinhao;
      end;
    except
      showmessage('Não foi possível efetuar conexao com o servidor');
      frmLogin.aConfiguracoesClientes[5] := vLinhao;
      for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
        writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
      edtNumeroCaixa.Text := vLinhao;
    end;
      showmessage('Substituição efetuada com exito');
  except
    frmLogin.aConfiguracoesClientes[5] := vLinhao;
    for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
      writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
    edtNumeroCaixa.Text := vLinhao;
    showmessage('Não foi possível efetuar alteração');
  end;
  CloseFile(F);
  }
end;

procedure TfrmConfiguracoes.cxBtnAlterarLimiteClick(Sender: TObject);
//var
//  I : integer;
//  F:TextFile;
//  vLinhao:string;
//  Conexao : TDSModuleDbClient;
begin
{
  AssignFile(F,ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini');
  Reset(F);
  Rewrite(F);
  vLinhao := Trim(frmLogin.pPercentualAvisoCliente);
  frmLogin.aConfiguracoesClientes[6] := Trim(edtLimiteCliente.Text);
  for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
    writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);

  try
    frmLogin.pPercentualAvisoCliente := edtLimiteCliente.Text;
    showmessage('Substituição efetuada com exito');
  except
    frmLogin.aConfiguracoesClientes[6] := vLinhao;
    for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
      writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
    showmessage('Não foi possível efetuar alteração');
  end;
  }
end;

procedure TfrmConfiguracoes.cxBTNAlterarMapeamentoClick(Sender: TObject);
begin
  edtMapeamentoServidor.ReadOnly := False;
end;

procedure TfrmConfiguracoes.cxBtnAlterarPortaClick(Sender: TObject);
//var
//  I : integer;
//  F:TextFile;
begin
  frmLogin.pPortaServidor := edtNovaPorta.Text;
  frmLogin.GravaArqIni;
{
  AssignFile(F,ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini');
  Reset(F);
  Rewrite(F);
  frmLogin.aConfiguracoesClientes[2] := Trim(edtNovaPorta.Text);
  for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
    writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);

  try
    DM.SQLConexao.Connected := False;
    DM.SQLConexao.Params.Values['Port'] := edtNovaPorta.Text;
    try
      DM.SQLConexao.Connected := True;
      frmLogin.pPortaServidor := edtNovaPorta.Text;
      showmessage('Substituição efetuada com exito');
      edtPortaAtual.Text := edtNovaPorta.Text;
      edtNovaPorta.Text := '';
    except
      showmessage('Não foi possível efetuar alteração');
      frmLogin.aConfiguracoesClientes[1] := Trim(edtPortaAtual.Text);
      for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
        writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
    end;
  except
    frmLogin.aConfiguracoesClientes[2] := Trim(edtEnderecoBancoAtual.Text);
    for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
      writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
    showmessage('Não foi possível efetuar alteração');
  end;
  CloseFile(F);
  }
end;

procedure TfrmConfiguracoes.cxBtnAlterarPortaComClick(Sender: TObject);
//var
//  I : integer;
//  F:TextFile;
begin
  frmLogin.pPortaImpressora := edtPortaComunicacaoImpressoraNova.Text;
  frmLogin.GravaArqIni;
{
  AssignFile(F,ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini');
  Reset(F);
  Rewrite(F);
  frmLogin.aConfiguracoesClientes[3] := Trim(edtPortaComunicacaoImpressoraNova.Text);
  for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
    writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);

  try
    frmLogin.pPortaImpressora := edtPortaComunicacaoImpressoraNova.Text;
    showmessage('Substituição efetuada com exito');
    edtPortaComunicacaoImpressoraAtual.Text := edtPortaComunicacaoImpressoraNova.Text;
    edtPortaComunicacaoImpressoraNova.Text := '';
  except
    frmLogin.aConfiguracoesClientes[3] := Trim(edtPortaComunicacaoImpressoraAtual.Text);
    for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
      writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
    showmessage('Não foi possível efetuar alteração');
  end;
  CloseFile(F);
  }
end;

procedure TfrmConfiguracoes.cxBtnCancelarMovimentacaoPedidoClick(
  Sender: TObject);
var
  qNumeroPedido : Integer;
begin
  {
  try
    qNumeroPedido := StrToInt(InputBox('Cancelamento movimentação de pedido','Informe o numero do pedido',''));
    ExtornarItem(qNumeroPedido);
    MessageDlg('Cancelamento da movimentação dos itens do pedido n° '+IntToStr(qNumeroPedido)+' efetuada com êxito.',mtError,[MBOK],0);
  except
    MessageDlg('Numero de pedido inválido',mtError,[MBOK],0);
  end;
  }
end;

procedure TfrmConfiguracoes.cxBTNConfirmarapeamentoClick(Sender: TObject);
begin
  frmlogin.pCaminhoMapeamentoServidor := edtMapeamentoServidor.Text;
  frmLogin.GravaArqIni;
  edtMapeamentoServidor.ReadOnly := true;
end;

procedure TfrmConfiguracoes.cxBtnEfetuarAlteracaoClick(Sender: TObject);
begin
  lblNovoEndereco.Visible := True;
  edtNovoEnereco.Visible := True;
  cxBtnEfetuarAlteracao.Enabled := False;
  cxBtnSalvarEndereco.Enabled := True;
end;

procedure TfrmConfiguracoes.cxBtnSalvarEnderecoClick(Sender: TObject);
//var
//  I : integer;
//  F:TextFile;
begin
  frmLogin.pEnderecoServidor := edtNovoEnereco.Text;
  frmLogin.GravaArqIni;
{
  AssignFile(F,ExtractFilePath(Application.ExeName)+'ConfiguracoesCliente.ini');
  Reset(F);
  Rewrite(F);
  frmLogin.aConfiguracoesClientes[1] := Trim(edtNovoEnereco.Text);
  for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
    writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);

  DM.SQLConexao.Connected := False;
  DM.SQLConexao.Params.Values['HostName'] := edtNovoEnereco.Text;
  try
    DM.SQLConexao.Connected := True;
    frmLogin.pEnderecoServidor := edtNovoEnereco.Text;
    showmessage('Substituição efetuada com exito');
    cxBtnEfetuarAlteracao.Enabled := True;
    cxBtnSalvarEndereco.Enabled := True;
    edtEnderecoBancoAtual.Text := edtNovoEnereco.Text;
    edtNovoEnereco.Text := '';
    edtNovoEnereco.Visible := False;
    lblNovoEndereco.Visible := False;
  except
    frmLogin.aConfiguracoesClientes[1] := Trim(edtEnderecoBancoAtual.Text);
    for I := 0 to Length(frmLogin.aConfiguracoesClientes) -1 do
      writeln(F,frmLogin.aConfiguracoesClientes[I + 1]);
    showmessage('Não foi possível efetuar alteração');
  end;
  CloseFile(F);
  }
end;

procedure TfrmConfiguracoes.cxBtnUtilizarSkinClick(Sender: TObject);
begin
  AtualizarTela;
end;

procedure TfrmConfiguracoes.cxButton1Click(Sender: TObject);
begin
  DeixarCamposHabilitados;
end;

procedure TfrmConfiguracoes.cxButton2Click(Sender: TObject);
begin
  try
    // GERAL
    frmLogin.sFormas      := RadioFormas.ItemIndex;
    frmLogin.sLogoMarca   := EdtLogoMarca.Text;
    frmLogin.sSalvaArq    := ChArquivos.Checked;
    frmLogin.sPathArq     := EdtArquivos.Text;
    try
      frmLogin.sUltNumNFe   := StrToInt(edtNumeroUltimaNFe.Text);
    except
      showmessage('Valor digitado no campo Ultimo numero NF-e é inválido');
      frmLogin.sUltNumNFe := 0;
    end;

    if RGLocalEmissaoNFe.ItemIndex = 0 then
      frmLogin.sEmissaoNFeServidorOuClient := 'SERVIDOR'
    else
      frmLogin.sEmissaoNFeServidorOuClient := 'CLIENT';

    // CERTIFICADO
    frmLogin.sCertificado := EdtCertificado.Text;
    frmLogin.sSenha       := EdtSenhaCertificado.Text;
    frmLogin.sSerial      := EdtSerial.Text;
    // emitente
    frmLogin.sRazao       := EdtRazao.Text;
    frmLogin.sFantasia    := EdtFantasia.Text;
    frmLogin.sCNPJ        := EdtCNPJ.Text;
    frmLogin.sIE          := EdtIE.Text;
    frmLogin.sEndereco    := EdtEndereco.Text;
    frmLogin.sNum         := EdtNum.Text;
    frmLogin.sBairro      := EdtBairro.Text;
    frmLogin.sCidade      := EdtCidade.Text;
    frmLogin.sCEP         := EdtCEP.Text;
    frmLogin.sUF          := EdtUF.Text;
    frmLogin.sCodMun      := EdtCodMun.Text;
    frmLogin.sFone        := EdtTelefone.Text;
    frmLogin.sSituacaoTributaria := CBBSituacaoTributaria.Text;
    frmLogin.sAliquotaPis := edtAliquotaPis.Text;
    frmLogin.sAliquotaCofins := edtAliquotaCofins.Text;
    // WebService
    frmLogin.sUFWS        := EdtUFWS.Text;
    frmLogin.sAmbiente    := RadioAmbiente.ItemIndex;
    frmLogin.sHost        := EdtHost.Text;
    frmLogin.sPorta       := EdtPorta.Text;
//    frmLogin.sUsuario     := EdtUsuario.Text;
    frmLogin.sSenhaWS     := EdtSenhaWS.Text;

    //Email
    frmLogin.sSmtpHost        := edtSmtpHost.Text;
    frmLogin.sSmtpPorta       := edtSmtpPort.Text;
    frmLogin.sSmtpUsuario     := edtSmtpUser.Text;
    frmLogin.sSmtpSenha       := edtSmtpPass.Text;
    frmLogin.sEmailAssunto    := edtEmailAssunto.Text;
    if cbEmailSSL.Checked then
      frmLogin.sEmailSSL        := 'S'
    else
      frmLogin.sEmailSSL        := 'N';
    frmLogin.sEmailMensagem   := mmEmailMsg.Lines.Text;
    frmLogin.sCopiaControlada := edtCopiaControlada.Lines.Text;

    if EdtAliqIcms.text <> '' then
      frmLogin.pAliqIcm:= StrtoFloat(EdtAliqIcms.text);

    if EdtAliqPis.text <> '' then
      frmLogin.pAliqPis:= StrtoFloat(EdtAliqPis.text);

    if EdtAliqCofins.text <> '' then
      frmLogin.pAliqCofins:= StrtoFloat(EdtAliqCofins.text);

    DeixarCamposDesabilitados;
    // grava dados no arquivo
    GravaArqIni;
    MessageDlg('Arquivo Gravado com sucesso!', mtInformation, [mbOK], 0);
  except
    MessageDlg('Erro ao gravar arquivo de configuração!', mtError, [mbOK], 0);
  end;
end;

procedure TfrmConfiguracoes.cxButton3Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  EdtLogoMarca.Text := OpenDialog1.FileName;
end;

procedure TfrmConfiguracoes.cxButton4Click(Sender: TObject);
var
  vCaminho : string;
begin
  vCaminho := Trim(AnsiUpperCase(InputBox('Caminho arquivo xml','Informe o local onde o sistema deverá colocar os arquivos xml','')));
  if vCaminho = '' then abort;
  EdtArquivos.Text := vCaminho;
end;

procedure TfrmConfiguracoes.cxButton5Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  EdtLogoMarca.Text := OpenDialog1.FileName;
end;

procedure TfrmConfiguracoes.cxButton6Click(Sender: TObject);
begin
  {
  if not Assigned(frmLookUpAlmoxarifado) then
    frmLookUpAlmoxarifado := TfrmLookUpAlmoxarifado.Create(Self);
  frmLookUpAlmoxarifado.Left := Trunc(Screen.Width/2)-200;
  frmLookUpAlmoxarifado.Top := trunc(Screen.Height/2)-200;
  frmLookUpAlmoxarifado.ShowModal;
  if frmLookUpAlmoxarifado.vContinua then
  begin
    frmLogin.pAlmoxarifadoPadraoBalcao := dm.cdsAlmoxarifadosID_ALMOXARIFADO.AsInteger;
    frmLogin.pNomeAlmoxarifadoPadraoBalcao := dm.cdsAlmoxarifadosDESCRICAO.AsString;
    edtAlmoxarifadoPadraBalcao.Text := dm.cdsAlmoxarifadosDESCRICAO.AsString;
    frmlogin.GravaArqIni;
  end;
  FreeAndNil(frmLookUpAlmoxarifado);
  }
end;

procedure TfrmConfiguracoes.cxButton7Click(Sender: TObject);
var
  dataInicial,DataFinal : TDate;
begin
  try
    dataInicial := StrToDate(InputBox('Leitura memória fiscal','Data inicial',''));
  except
    MessageDlg('o valor informado não é uma data válida',mtError,[mbOK],0);
    Abort;
  end;

  try
    datafinal := StrToDate(InputBox('Leitura memória fiscal','Data final',''));
  except
    MessageDlg('o valor informado não é uma data válida',mtError,[mbOK],0);
    Abort;
  end;
  if not Assigned(frmVendasBalcao) then
    frmVendasBalcao := TfrmVendasBalcao.Create(Self);
  try
    frmVendasBalcao.ACBrECF1.Modelo := VerificaImpressora;
    frmVendasBalcao.ACBrECF1.Porta := frmLogin.pPortaImpressora;
    frmVendasBalcao.ACBrECF1.Ativar;
    frmVendasBalcao.ACBrECF1.LeituraMemoriaFiscal(dataInicial,DataFinal);
  except on e:exception do
    begin
      MessageDlg('Erro ao gerar leitura da memória fiscal da impressora'+#13+
                 e.Message,mtError,[mbOK],0);
    end;
  end;
  FreeAndNil(frmVendasBalcao);
end;

procedure TfrmConfiguracoes.cxButton8Click(Sender: TObject);
begin
  ShowMessage(frmLogin.pCodigoAtivacao);
end;

procedure TfrmConfiguracoes.cxLeituraXClick(Sender: TObject);
begin
  if not Assigned(frmVendasBalcao) then
    frmVendasBalcao := TfrmVendasBalcao.Create(Self);
  try
    frmVendasBalcao.ACBrECF1.Modelo := VerificaImpressora;
    frmVendasBalcao.ACBrECF1.Porta := frmLogin.pPortaImpressora;
    frmVendasBalcao.ACBrECF1.Ativar;
    frmVendasBalcao.ACBrECF1.LeituraX();
  except on e:exception do
    begin
      MessageDlg('Erro ao gerar leitura X'+#13+
                 e.Message,mtError,[mbOK],0);
    end;
  end;
  FreeAndNil(frmVendasBalcao);
end;

procedure TfrmConfiguracoes.cxReducaoZClick(Sender: TObject);
begin
  if not Assigned(frmVendasBalcao) then
    frmVendasBalcao := TfrmVendasBalcao.Create(Self);
  try
    frmVendasBalcao.ACBrECF1.Modelo := VerificaImpressora;
    frmVendasBalcao.ACBrECF1.Porta := frmLogin.pPortaImpressora;
    frmVendasBalcao.ACBrECF1.Ativar;
    frmVendasBalcao.ACBrECF1.ReducaoZ();
  except on e:exception do
    begin
      MessageDlg('Erro ao gerar redução z'+#13+
                 e.Message,mtError,[mbOK],0);
    end;
  end;
  FreeAndNil(frmVendasBalcao);
end;

procedure TfrmConfiguracoes.cxRGSatEcfClick(Sender: TObject);
begin
  frmLogin.pSat_ECF := cxRGSatEcf.ItemIndex;
  frmLogin.GravaArqIni;
end;

procedure TfrmConfiguracoes.DeixarCamposDesabilitados;
begin
  RadioFormas.Enabled := False;
  EdtLogoMarca.Enabled := False;
  ChArquivos.Enabled := False;
  EdtArquivos.Enabled := False;
  GBUltimoNumeroNFe.Enabled := False;
  RGLocalEmissaoNFe.Enabled := False;
  // CERTIFICADO
  EdtCertificado.Enabled := False;
//  EdtSenha.Enabled := False;
  EdtSerial.Enabled := False;
  // emitente
  EdtRazao.Enabled := False;
  EdtFantasia.Enabled := False;
  EdtCNPJ.Enabled := False;
  EdtIE.Enabled := False;
  EdtEndereco.Enabled := False;
  EdtNum.Enabled := False;
  EdtBairro.Enabled := False;
  EdtCidade.Enabled := False;
  EdtCEP.Enabled := False;
  EdtUF.Enabled := False;
  EdtCodMun.Enabled := False;
  EdtTelefone.Enabled := False;
  CBBSituacaoTributaria.Enabled := False;
  edtAliquotaPis.Enabled := False;
  edtAliquotaCofins.Enabled := False;
  // WebService
  EdtUFWS.Enabled := False;
  RadioAmbiente.Enabled := False;
  EdtHost.Enabled := False;
  EdtPorta.Enabled := False;
//  EdtUsuario.Enabled := False;
  EdtSenhaWS.Enabled := False;

  //Email
  edtSmtpHost.Enabled := False;
  edtSmtpPort.Enabled := False;
  edtSmtpUser.Enabled := False;
  edtSmtpPass.Enabled := False;
  edtEmailAssunto.Enabled := False;
  cbEmailSSL.Enabled := False;
  mmEmailMsg.Enabled := False;
  edtCopiaControlada.Enabled := False;
end;

procedure TfrmConfiguracoes.DeixarCamposHabilitados;
begin
  RadioFormas.Enabled := True;
  EdtLogoMarca.Enabled := True;
  ChArquivos.Enabled := True;
  EdtArquivos.Enabled := True;
  GBUltimoNumeroNFe.Enabled := True;
  RGLocalEmissaoNFe.Enabled := True;
  // CERTIFICADO
  EdtCertificado.Enabled := True;
//  EdtSenha.Enabled := True;
  EdtSerial.Enabled := True;
  // emitente
  EdtRazao.Enabled := True;
  EdtFantasia.Enabled := True;
  EdtCNPJ.Enabled := True;
  EdtIE.Enabled := True;
  EdtEndereco.Enabled := True;
  EdtNum.Enabled := True;
  EdtBairro.Enabled := True;
  EdtCidade.Enabled := True;
  EdtCEP.Enabled := True;
  EdtUF.Enabled := True;
  EdtCodMun.Enabled := True;
  EdtTelefone.Enabled := True;
  CBBSituacaoTributaria.Enabled := True;
  edtAliquotaPis.Enabled := True;
  edtAliquotaCofins.Enabled := True;
  // WebService
  EdtUFWS.Enabled := True;
  RadioAmbiente.Enabled := True;
  EdtHost.Enabled := True;
  EdtPorta.Enabled := True;
//  EdtUsuario.Enabled := True;
  EdtSenhaWS.Enabled := True;

  //Email
  edtSmtpHost.Enabled := True;
  edtSmtpPort.Enabled := True;
  edtSmtpUser.Enabled := True;
  edtSmtpPass.Enabled := True;
  edtEmailAssunto.Enabled := True;
  cbEmailSSL.Enabled := True;
  mmEmailMsg.Enabled := True;
  edtCopiaControlada.Enabled := True;
end;

procedure TfrmConfiguracoes.edtAtivacaoExit(Sender: TObject);
begin
  if edtAtivacao.Text <> frmLogin.pCodigoAtivacao then
  begin
    frmLogin.pCodigoAtivacao := trim(edtAtivacao.Text);
    frmLogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.edtEmitCNPJExit(Sender: TObject);
begin
  if edtEmitCNPJ.Text <> frmLogin.pCNPJEmitente then
  begin
    frmLogin.pCNPJEmitente := edtEmitCNPJ.Text;
    frmLogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.edtEmitIEExit(Sender: TObject);
begin
  if edtEmitIE.Text <> frmLogin.pInscricaoEstadual then
  begin
    frmLogin.pInscricaoEstadual := edtEmitIE.Text;
    frmLogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.edtEmitIMExit(Sender: TObject);
begin
  if edtEmitIM.Text <> frmLogin.pInscricaoMunicipal then
  begin
    frmLogin.pCNPJEmitente := edtEmitIM.Text;
    frmLogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.edtSwHAssinaturaExit(Sender: TObject);
begin
  if edtSwHAssinatura.Text <> frmLogin.pAssinatura then
  begin
    frmLogin.pAssinatura := edtSwHAssinatura.Text;
    frmLogin.GravaArqIni;
  end;
end;

procedure TfrmConfiguracoes.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  AppBarShow(0);
end;

procedure TfrmConfiguracoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    AppBarShow(-1)
  else
    AppBarShow(0);
end;

procedure TfrmConfiguracoes.FormResize(Sender: TObject);
begin
  AppBarResize;
end;

procedure TfrmConfiguracoes.FormShow(Sender: TObject);
var
  I : TACBrSATModelo ;
  J : TpcnTipoAmbiente ;
  K : TpcnRegTribISSQN ;
  L : TpcnindRatISSQN ;
  M : TpcnRegTrib ;
begin
//  cbxModelo.Items.Clear ;
//  For I := Low(TACBrSATModelo) to High(TACBrSATModelo) do
//     cbxModelo.Items.Add( GetEnumName(TypeInfo(TACBrSATModelo), integer(I) ) ) ;

  cbbAmbiente.Items.Clear ;
  For J := Low(TpcnTipoAmbiente) to High(TpcnTipoAmbiente) do
     cbbAmbiente.Items.Add( GetEnumName(TypeInfo(TpcnTipoAmbiente), integer(J) ) ) ;

  cbbRegTribISSQN.Items.Clear ;
  For K := Low(TpcnRegTribISSQN) to High(TpcnRegTribISSQN) do
     cbbRegTribISSQN.Items.Add( GetEnumName(TypeInfo(TpcnRegTribISSQN), integer(K) ) ) ;

  cbbIndRatISSQN.Items.Clear ;
  For L := Low(TpcnindRatISSQN) to High(TpcnindRatISSQN) do
     cbbIndRatISSQN.Items.Add( GetEnumName(TypeInfo(TpcnindRatISSQN), integer(L) ) ) ;

  cbbRegTributario.Items.Clear ;
  For M := Low(TpcnRegTrib) to High(TpcnRegTrib) do
     cbbRegTributario.Items.Add( GetEnumName(TypeInfo(TpcnRegTrib), integer(M) ) ) ;

  edtEnderecoBancoAtual.Text :=  frmLogin.pEnderecoServidor;
  edtPortaAtual.Text := frmLogin.pPortaServidor;
  edtPortaComunicacaoImpressoraAtual.Text := frmLogin.pPortaImpressora;
  case StrToInt(Trim(frmLogin.pModeloImpressora)) of
    0:cxRGModeloImpressora.ItemIndex := 0;
    1:cxRGModeloImpressora.ItemIndex := 1;
    2:cxRGModeloImpressora.ItemIndex := 2;
    3:cxRGModeloImpressora.ItemIndex := 3;
    4:cxRGModeloImpressora.ItemIndex := 4;
//    5:RGModeloImpressora.ItemIndex := 0;
    6:cxRGModeloImpressora.ItemIndex := 6;
    7:cxRGModeloImpressora.ItemIndex := 7;
    8:cxRGModeloImpressora.ItemIndex := 8;
    9:cxRGModeloImpressora.ItemIndex := 9;
    10:cxRGModeloImpressora.ItemIndex := 10;
    11:cxRGModeloImpressora.ItemIndex := 11;
    12:cxRGModeloImpressora.ItemIndex := 12;
    13:cxRGModeloImpressora.ItemIndex := 13;
    14:cxRGModeloImpressora.ItemIndex := 14;
    15:cxRGModeloImpressora.ItemIndex := 15;
  end;
  edtNumeroCaixa.Text := frmLogin.pNumeroCaixa;
  edtLimiteCliente.Text := frmLogin.pPercentualAvisoCliente;
  edtMapeamentoServidor.Text := frmLogin.pCaminhoMapeamentoServidor;
  edtAlmoxarifadoPadraBalcao.Text := frmlogin.pNomeAlmoxarifadoPadraoBalcao;
  cxRGSatEcf.ItemIndex := frmLogin.pSat_ECF;
  edtEmitCNPJ.Text := frmLogin.pCNPJEmitente;
  edtEmitIE.Text := frmLogin.pInscricaoEstadual;
  edtEmitIM.Text := frmLogin.pInscricaoMunicipal;
  CBBSituacaoTributaria.ItemIndex := frmLogin.pRegimeTributario;
  cbbRegTribISSQN.ItemIndex := frmLogin.pTributacaoISSQN;
  cbbIndRatISSQN.ItemIndex := frmLogin.pIndRatISSQN;
  cbbAmbiente.ItemIndex := frmLogin.pTipoAmbienteSat;
  edtAtivacao.Text := frmLogin.pCodigoAtivacao;
  edtSwHAssinatura.Text := frmLogin.pAssinatura;
  cbbRegTributario.ItemIndex :=  frmLogin.pRegimeTributario;
  LeArqIni;
  LerVariaveisAcbr;
  cxPCConfiguracoes.ActivePage := cxTSConfiguracoesConexao;

  if AnsiUpperCase(frmLogin.pNomeUsuario) <> 'BUSINESS' then
  begin
    cxBtnCancelarMovimentacaoPedido.Visible := False;
  end
  else
  begin
    cxBtnCancelarMovimentacaoPedido.Visible := True;
  end;
  EdtAliqIcms.text:= Floattostr(frmLogin.pAliqIcm);
  EdtAliqPis.text:= Floattostr(frmLogin.pAliqPis);
  EdtAliqCofins.text:= Floattostr(frmLogin.pAliqCofins);
end;

procedure TfrmConfiguracoes.LerVariaveisAcbr;
begin
  // GERAL
  RadioFormas.ItemIndex := frmLogin.sFormas;
  EdtLogoMarca.Text := frmLogin.sLogoMarca;
  ChArquivos.Checked := frmLogin.sSalvaArq;
  EdtArquivos.Text := frmLogin.sPathArq;
  edtNumeroUltimaNFe.Text := IntToStr(frmLogin.sUltNumNFe);
  if AnsiUpperCase(frmLogin.sEmissaoNFeServidorOuClient) = 'SERVIDOR' then
    RGLocalEmissaoNFe.ItemIndex := 0
  else
    RGLocalEmissaoNFe.ItemIndex := 1;
  // CERTIFICADO
  EdtCertificado.Text  := frmLogin.sCertificado;
  EdtSenhaCertificado.Text := frmLogin.sSenha;
  EdtSerial.Text := frmLogin.sSerial;
  // emitente
  EdtRazao.Text := frmLogin.sRazao;
  EdtFantasia.Text := frmLogin.sFantasia;
  EdtCNPJ.Text := frmLogin.sCNPJ;
  EdtIE.Text := frmLogin.sIE;
  EdtEndereco.Text := frmLogin.sEndereco;
  EdtNum.Text := frmLogin.sNum;
  EdtBairro.Text := frmLogin.sBairro;
  EdtCidade.Text := frmLogin.sCidade;
  EdtCEP.Text := frmLogin.sCEP;
  EdtUF.Text := frmLogin.sUF;
  EdtCodMun.Text := frmLogin.sCodMun;
  EdtTelefone.Text := frmLogin.sFone;

  if frmLogin.sSituacaoTributaria = 'SIMPLES NACIONAL' then
    CBBSituacaoTributaria.ItemIndex := 0
  else
  if frmLogin.sSituacaoTributaria = 'LUCRO PRESUMIDO' then
    CBBSituacaoTributaria.ItemIndex := 1
  else
  if frmLogin.sSituacaoTributaria = 'LUCRO REAL' then
    CBBSituacaoTributaria.ItemIndex := 2
  else
    CBBSituacaoTributaria.ItemIndex := -1;

  edtAliquotaPis.Text := frmLogin.sAliquotaPis;
  edtAliquotaCofins.Text := frmLogin.sAliquotaCofins;
  // WebService
  EdtUFWS.Text := frmLogin.sUFWS;
  RadioAmbiente.ItemIndex := frmLogin.sAmbiente;
  EdtHost.Text := frmLogin.sHost;
  EdtPorta.Text := frmLogin.sPorta;
//  EdtUsuario.Text := frmLogin.sUsuario;
  EdtSenhaWS.Text := frmLogin.sSenhaWS;

  //Email
  edtSmtpHost.Text := frmLogin.sSmtpHost;
  edtSmtpPort.Text := frmLogin.sSmtpPorta;
  edtSmtpUser.Text := frmLogin.sSmtpUsuario;
  edtSmtpPass.Text := frmLogin.sSmtpSenha;
  edtEmailAssunto.Text := frmLogin.sEmailAssunto;
  if frmLogin.sEmailSSL = 'S' then
    cbEmailSSL.Checked := True
  else
    cbEmailSSL.Checked := False;

  mmEmailMsg.Lines.Add(frmLogin.sEmailMensagem);
  edtCopiaControlada.Lines.Add(frmLogin.sCopiaControlada);
  EdtAliqIcms.text:= Floattostr(frmLogin.pAliqIcm);
  EdtAliqPis.text:= Floattostr(frmLogin.pAliqPis);
  EdtAliqCofins.text:= Floattostr(frmLogin.pAliqCofins);
end;

end.
