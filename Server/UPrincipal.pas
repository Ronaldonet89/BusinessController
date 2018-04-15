unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,Data.DBXFirebird,
  Data.FMTBcd, Datasnap.Provider, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    PCConfiguracoes: TPageControl;
    tsConfiguracoes: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtEnderecoBancoAtual: TEdit;
    Label1: TLabel;
    edtNovoEnereco: TEdit;
    lblNovoEndereco: TLabel;
    spbSalvarEndereco: TSpeedButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtPortaAtual: TEdit;
    Label4: TLabel;
    edtNovaPorta: TEdit;
    spbAlterarPorta: TSpeedButton;
    spbEfetuarAlteracao: TSpeedButton;
    GroupBox3: TGroupBox;
    spbAjustarBancoDeDados: TSpeedButton;
    TSChat: TTabSheet;
    MMChat: TMemo;
    lblUsuariosConectadosChat: TLabel;
    GroupBox4: TGroupBox;
    Panel2: TPanel;
    DBGComandas: TDBGrid;
    spbCadastrarComanda: TSpeedButton;
    spbCancelarComanda: TSpeedButton;
    spbInformacoesExecutavel: TSpeedButton;
    TSVendas: TTabSheet;
    GroupBox5: TGroupBox;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    TSUsuarios: TTabSheet;
    GBUsuarios: TGroupBox;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    DBNavigator2: TDBNavigator;
    GroupBox6: TGroupBox;
    Panel5: TPanel;
    DBNavigator3: TDBNavigator;
    DBGrid3: TDBGrid;
    GroupBox7: TGroupBox;
    Panel6: TPanel;
    DBGrid4: TDBGrid;
    DBText1: TDBText;
    Label2: TLabel;
    spbCarregarPermissao: TSpeedButton;
    spbVincularPermissao: TSpeedButton;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure spbSalvarEnderecoClick(Sender: TObject);
    procedure spbEfetuarAlteracaoClick(Sender: TObject);
    procedure spbAjustarBancoDeDadosClick(Sender: TObject);
    procedure spbAlterarPortaClick(Sender: TObject);
    procedure spbCadastrarComandaClick(Sender: TObject);
    procedure spbCancelarComandaClick(Sender: TObject);
    procedure spbInformacoesExecutavelClick(Sender: TObject);
    procedure spbCarregarPermissaoClick(Sender: TObject);
    procedure spbVincularPermissaoClick(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4CellClick(Column: TColumn);
  private
    { Private declarations }
    vArquivoIniF,vArquivoIniG : TextFile;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses USplash, UDSModuleDb, UntPackage;

procedure TfrmPrincipal.DBGrid4CellClick(Column: TColumn);
begin
  if Column.FieldName = 'PERMITE_OU_NAO' then
  begin
    DSModuleDb.CDSPermissoesVsUsuarios.Edit;
    if DSModuleDb.CDSPermissoesVsUsuariosPERMITE_OU_NAO.AsString = 'S' then
      DSModuleDb.CDSPermissoesVsUsuariosPERMITE_OU_NAO.AsString := 'N'
    else
      DSModuleDb.CDSPermissoesVsUsuariosPERMITE_OU_NAO.AsString := 'S';
    try
      DSModuleDb.CDSPermissoesVsUsuarios.Post;
      DSModuleDb.CDSPermissoesVsUsuarios.ApplyUpdates(0);
    except
      DSModuleDb.CDSPermissoesVsUsuarios.CancelUpdates;
      showmessage('Não foi possível efetuar alteração');
    end;
  end;
end;

procedure TfrmPrincipal.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.FieldName = 'PERMITE_OU_NAO' then
  begin
    DBGrid4.Canvas.FillRect(Rect);
    if DSModuleDb.CDSPermissoesVsUsuariosPERMITE_OU_NAO.AsString = 'S' then
      ImageList1.Draw(DBGrid4.Canvas,Rect.Left+10,Rect.Top+1,0)
    else
      ImageList1.Draw(DBGrid4.Canvas,Rect.Left+10,Rect.Top+1,1);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Self.Left := Trunc(Screen.Width / 2)- 600;
  Self.Top := Trunc(Screen.Height / 2)- 300;
  edtEnderecoBancoAtual.Text :=  frmSplash.pEnderecoBanco;
  edtPortaAtual.Text := frmSplash.pPorta;
  PCConfiguracoes.ActivePage := tsConfiguracoes;
  if frmSplash.ServerSocket1.Active then
    MMChat.Lines.Add('*** Servidor Chat conectado ***')
  else
    MMChat.Lines.Add('*** Servido Chat desconectado ***');

  lblUsuariosConectadosChat.Caption := 'Total de usuários conectados : '+IntToStr(frmSplash.ServerSocket1.Socket.ActiveConnections);
  try
    DSModuleDb.cdsComandas.Active := True;
  except
    MessageDlg('O sistema não encontrou a tabela referente ao cadastro de comandas.'+#13+
               'Por favor, execute a rotina "Ajustar Banco de Dados" para corrigir'+#13+
               'esta mensagem.',mtWarning,[mbOK],0);
  end;

//  try
//    DSModuleDb.CDSFormasPagamentos.Active := True;
//  except
//    MessageDlg('O sistema não encontrou a tabela referente ao cadastro de formas de pagamentos.'+#13+
//               'Por favor, execute a rotina "Ajustar Banco de Dados" para corrigir'+#13+
//               'esta mensagem.',mtWarning,[mbOK],0);
//  end;

  try
    DSModuleDb.cdsUsuarios.Active := True;
  except
    MessageDlg('O sistema não encontrou a tabela referente ao cadastro de usuarios.'+#13+
               'Por favor, execute a rotina "Ajustar Banco de Dados" para corrigir'+#13+
               'esta mensagem.',mtWarning,[mbOK],0);
  end;

  try
    DSModuleDb.cdsPermissoesUsuariosSistema.Active := True;
  except
    MessageDlg('O sistema não encontrou a tabela referente ao cadastro de permissões de usuarios.'+#13+
               'Por favor, execute a rotina "Ajustar Banco de Dados" para corrigir'+#13+
               'esta mensagem.',mtWarning,[mbOK],0);
  end;

  try
    DSModuleDb.CDSPermissoesVsUsuarios.Active := True;
  except
    MessageDlg('O sistema não encontrou a tabela referente ao cadastro de permissões ligadas aos usuarios.'+#13+
               'Por favor, execute a rotina "Ajustar Banco de Dados" para corrigir'+#13+
               'esta mensagem.',mtWarning,[mbOK],0);
  end;
end;

procedure TfrmPrincipal.spbSalvarEnderecoClick(Sender: TObject);
var
  I,X : integer;
  vLinhao,vCaminhoArquivo:string;
  vMatriz : Array [1..10] of string;
  vSistemaEmUso : Boolean;
begin
  vSistemaEmUso := False;
  //Verifica se existe alguém usando o sistema
  if DSModuleDb.SQLConexao.ActiveStatements > 0 then
  begin
    showmessage('O sistema não poderá efetuar a troca do '+#13+
                'endereço do banco de dados agora,pois no momento'+#13+
                'existem comandos sendo executados no banco.'+#13+
                'O sistema adotará este endereço na próxima'+#13+
                'inicialização do sistema.');
    vSistemaEmUso := true;
  end;
  vCaminhoArquivo := ExtractFilePath(Application.ExeName);
  AssignFile(vArquivoIniF,vCaminhoArquivo+'ConfiguracoesServidor.ini');
  Reset(vArquivoIniF);
  AssignFile(vArquivoIniG,vCaminhoArquivo+'ConfiguracoesServidor.ini');
  Reset(vArquivoIniG);
  I := 0;
  X := 0;
  while not Eof(vArquivoIniF) do
  begin
    Inc(I);
    Inc(X);
    Readln(vArquivoIniF,vLinhao);
    vMatriz[I] := vLinhao;
  end;
  CloseFile(vArquivoIniF);
  Rewrite(vArquivoIniG);
  I := 1;
  while I <= X do
  begin
    vLinhao := '';
    if I = 2 then
    begin
      if vSistemaEmUso = False then
      begin
        DSModuleDb.SQLConexao.Connected := False;
        DSModuleDb.SQLConexao.Params.Values['Database'] := edtNovoEnereco.Text;
        try
          DSModuleDb.SQLConexao.Connected := True;
          frmSplash.pEnderecoBanco := edtNovoEnereco.Text;
          writeln(vArquivoIniG,edtNovoEnereco.Text);
          showmessage('Substituição efetuada com exito');
          spbEfetuarAlteracao.Enabled := True;
          spbSalvarEndereco.Enabled := True;
          edtEnderecoBancoAtual.Text := edtNovoEnereco.Text;
          edtNovoEnereco.Text := '';
          edtNovoEnereco.Visible := False;
          lblNovoEndereco.Visible := False;
        except
          showmessage('Não foi possífel efetuar alteração');
          exit;
        end;
      end
      else
      begin
        frmSplash.pEnderecoBanco := edtNovoEnereco.Text;
        writeln(vArquivoIniG,edtNovoEnereco.Text);
        showmessage('Substituição efetuada com exito');
        spbEfetuarAlteracao.Enabled := True;
        spbSalvarEndereco.Enabled := True;
        edtEnderecoBancoAtual.Text := edtNovoEnereco.Text;
        edtNovoEnereco.Text := '';
        edtNovoEnereco.Visible := False;
        lblNovoEndereco.Visible := False;
      end;
    end
    else
    begin
      Writeln(vArquivoIniG,vMatriz[I]);
    end;
    Inc(I);
  end;
  CloseFile(vArquivoIniG);
end;

procedure TfrmPrincipal.spbVincularPermissaoClick(Sender: TObject);
var
  vMinhaQueryPermissoes,vMinhaquery : TSQLQuery;
  Transacao : TTransactionDesc;
  qString : string;
  vIdentificador,I : integer;
begin
  vMinhaQueryPermissoes := TSQLQuery.Create(nil);
  vMinhaQueryPermissoes.SQLConnection := DSModuleDb.SQLConexao;

  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;

  with vMinhaQueryPermissoes do
  begin
    Close;
    CommandText := 'SELECT PERMISSAO FROM PERMISSOES_VS_USUARIOS '+
                   ' WHERE ID_USUARIO =:ID_USUARIO '+
                   ' AND ID_PERMISSAO_USUARIO_SISTEMA =:ID_PERMISSAO_USUARIO_SISTEMA';
    Parambyname('ID_USUARIO').Value := DSModuleDb.cdsUsuariosID_USUARIO.AsInteger;
    Parambyname('ID_PERMISSAO_USUARIO_SISTEMA').Value := DSModuleDb.cdsPermissoesUsuariosSistemaID_PERMISSAO_USUARIO_SISTEMA.AsInteger;
    Open;
  end;
  if (vMinhaQueryPermissoes.FieldByName('PERMISSAO').IsNull) or (vMinhaQueryPermissoes.FieldByName('PERMISSAO').AsString = '') then
  begin
    qString := '';
    qString := 'INSERT INTO PERMISSOES_VS_USUARIOS (ID_PERMISSAO_VS_USUARIO, ID_PERMISSAO_USUARIO_SISTEMA, ID_USUARIO, PERMISSAO, PERMITE_OU_NAO)'+
               'VALUES                            (:ID_PERMISSAO_VS_USUARIO,:ID_PERMISSAO_USUARIO_SISTEMA,:ID_USUARIO,:PERMISSAO,:PERMITE_OU_NAO)';
    with vMinhaQuery do
    begin
      Close;
      CommandText := qString;
      ParamByName('ID_PERMISSAO_VS_USUARIO').Value := DSModuleDb.GeneratorIncrementado('NOVA_PERMISSAO_VS_USUARIO');
      ParamByName('ID_PERMISSAO_USUARIO_SISTEMA').Value := DSModuleDb.cdsPermissoesUsuariosSistemaID_PERMISSAO_USUARIO_SISTEMA.AsInteger;
      ParamByName('ID_USUARIO').Value := DSModuleDb.cdsUsuariosID_USUARIO.AsInteger;
      ParamByName('PERMISSAO').Value := DSModuleDb.cdsPermissoesUsuariosSistemaPERMISSAO.AsString;
      ParamByName('PERMITE_OU_NAO').Value := 'S';
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
  end
  else
    showmessage('Este usuário já possui a permissão '+#13+
                DSModuleDb.cdsPermissoesUsuariosSistemaPERMISSAO.AsString+#13+
                'vinculada a ele');
  DSModuleDb.CDSPermissoesVsUsuarios.Close;
  DSModuleDb.CDSPermissoesVsUsuarios.Open;
  FreeAndNil(vMinhaQueryPermissoes);
  FreeAndNil(vMinhaQuery);
end;

procedure TfrmPrincipal.spbAjustarBancoDeDadosClick(Sender: TObject);
var
  vString,vString2:string;
begin
   //**********************************************************
   vString := 'CREATE TABLE USUARIOS ( ';
   vString := vString + ' ID_USUARIO  INTEGER NOT NULL, ';
   vString := vString + ' USUARIO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' SENHA VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' TIPO_SKIN_TELA VARCHAR(50) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('USUARIOS',vString);

   vString := 'ALTER TABLE USUARIOS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_USUARIO PRIMARY KEY (ID_USUARIO) ';
   vString := vString + ' USING INDEX PK_ID_USUARIO  ';
   CriarChavePrimariaSePrecisar('USUARIOS','(ID_USUARIO)',vString);

   vString  := ' CREATE GENERATOR NOVA_USUARIO ';
   vString2 := 'NOVA_USUARIO TO 0';
   CriarGeneratorSePrecisar('NOVA_USUARIO',vString,vString2);

   vString  := ' ALTER TABLE USUARIOS ';
   vString := vString + 'ADD ID_GRUPO INTEGER';
   CriarCampoSePrecisar('USUARIOS','ID_GRUPO',vString);
   //**********************************************************
   vString := 'CREATE TABLE PERMISSOES_USUARIOS_SISTEMA ( ';
   vString := vString + ' ID_PERMISSAO_USUARIO_SISTEMA  INTEGER NOT NULL, ';
   vString := vString + ' PERMISSAO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PERMISSOES_USUARIOS_SISTEMA',vString);

   vString := 'ALTER TABLE PERMISSOES_USUARIOS_SISTEMA ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PERMISSAO_USUARIO_SISTEMA PRIMARY KEY (ID_PERMISSAO_USUARIO_SISTEMA) ';
   vString := vString + ' USING INDEX PK_ID_PERMISSAO_USUARIO_SISTEMA  ';
   CriarChavePrimariaSePrecisar('PERMISSOES_USUARIOS_SISTEMA','(ID_PERMISSAO_USUARIO_SISTEMA)',vString);

   vString  := ' CREATE GENERATOR NOVA_PERMISSAO_USUARIO_SISTEMA ';
   vString2 := 'NOVA_PERMISSAO_USUARIO_SISTEMA TO 0';
   CriarGeneratorSePrecisar('NOVA_PERMISSAO_USUARIO_SISTEMA',vString,vString2);
   //************************************************************
   vString := 'CREATE TABLE PERMISSOES_VS_USUARIOS ( ';
   vString := vString + ' ID_PERMISSAO_VS_USUARIO       INTEGER NOT NULL, ';
   vString := vString + ' ID_PERMISSAO_USUARIO_SISTEMA  INTEGER NOT NULL, ';
   vString := vString + ' ID_USUARIO  INTEGER NOT NULL, ';
   vString := vString + ' PERMISSAO                     VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' PERMITE_OU_NAO                VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PERMISSOES_VS_USUARIOS',vString);

   vString := 'ALTER TABLE PERMISSOES_VS_USUARIOS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PERMISSAO_VS_USUARIO PRIMARY KEY (ID_PERMISSAO_VS_USUARIO) ';
   vString := vString + ' USING INDEX PK_ID_PERMISSAO_VS_USUARIO  ';
   CriarChavePrimariaSePrecisar('PERMISSOES_VS_USUARIOS','(ID_PERMISSAO_VS_USUARIO)',vString);

   vString  := ' CREATE GENERATOR NOVA_PERMISSAO_VS_USUARIO ';
   vString2 := 'NOVA_PERMISSAO_VS_USUARIO TO 0';
   CriarGeneratorSePrecisar('NOVA_PERMISSAO_VS_USUARIO',vString,vString2);
   //****************************************
   //Tabela de Fornecedores
   vString := 'CREATE TABLE FORNECEDORES ( ';
   vString := vString + ' ID_FORNECEDOR       INTEGER NOT NULL, ';
   vString := vString + ' RAZAO_SOCIAL        VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' FANTASIA            VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CPF                 VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CNPJ                VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' RG                  VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' INSCRICAO_ESTADUAL  VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CONTATO             VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' EMAIL               VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' TELEFONE            VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CELULAR             VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ENDERECO            VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' NUMERO              VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' COMPLEMENTO         VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' BAIRRO              VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CEP                 VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' UF                  VARCHAR(2) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CIDADE              VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ESTADO              VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' OBSERVACAO          BLOB SUB_TYPE 1 SEGMENT SIZE 50 CHARACTER SET ISO8859_1,';
   vString := vString + ' TIPO_FORNECEDOR     VARCHAR(30) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('FORNECEDORES',vString);

   vString := 'ALTER TABLE FORNECEDORES ';
   vString := vString + ' ADD CONSTRAINT PK_ID_FORNECEDOR PRIMARY KEY (ID_FORNECEDOR) ';
   vString := vString + ' USING INDEX PK_ID_FORNECEDOR  ';
   CriarChavePrimariaSePrecisar('FORNECEDORES','(ID_FORNECEDOR)',vString);

   vString  := ' CREATE GENERATOR NOVO_FORNECEDOR ';
   vString2 := 'NOVO_FORNECEDOR TO 0';
   CriarGeneratorSePrecisar('NOVO_FORNECEDOR',vString,vString2);
   //***********************************************************************

   //Tabela de Receber
   vString := 'CREATE TABLE RECEBER ( ';
   vString := vString + ' ID_RECEBER          INTEGER NOT NULL, ';
   vString := vString + ' DESCRICAO_TITULO    VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ID_PEDIDO           INTEGER, ';
   vString := vString + ' ID_CLIENTE          INTEGER , ';
   vString := vString + ' NOME_CLIENTE        VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' VENCIMENTO          DATE, ';
   vString := vString + ' DATA_PAGAMENTO      DATE, ';
   vString := vString + ' VALOR_TITULO        NUMERIC(15,2), ';
   vString := vString + ' VALOR_PAGO          NUMERIC(15,2), ';
   vString := vString + ' NUMERO_CHEQUE       VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' FORMA_PAGAMENTO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' STATUS              VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('RECEBER',vString);

   vString := 'ALTER TABLE RECEBER ';
   vString := vString + ' ADD CONSTRAINT PK_ID_RECEBER PRIMARY KEY (ID_RECEBER) ';
   vString := vString + ' USING INDEX PK_ID_RECEBER  ';
   CriarChavePrimariaSePrecisar('RECEBER','(ID_RECEBER)',vString);

   vString  := ' CREATE GENERATOR NOVO_RECEBER ';
   vString2 := 'NOVO_RECEBER TO 0';
   CriarGeneratorSePrecisar('NOVO_RECEBER',vString,vString2);

   //Tabela de Cheques
   vString := 'CREATE TABLE CHEQUES ( ';
   vString := vString + ' ID_CHEQUE         INTEGER NOT NULL, ';
   vString := vString + ' ID_CLIENTE          INTEGER, ';
   vString := vString + ' NOME_CLIENTE        VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ORIGEM_CHEQUE     VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' VALOR             NUMERIC(15,2), ';
   vString := vString + ' STATUS            VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' DATA_EMISSAO      DATE, ';
   vString := vString + ' BANCO             VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' AGENCIA           VARCHAR(50) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' DIGTO_AGENCIA     VARCHAR(50) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CONTA             VARCHAR(50) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' DIGITO_CONTA      VARCHAR(50) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' EMITIDO_RECEBIDO  VARCHAR(50) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' NUMERO_CHEQUE     VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   vString := vString + ') ';
   CriarTabelaSePrecisar('CHEQUES',vString);

   vString := 'ALTER TABLE CHEQUES ';
   vString := vString + ' ADD CONSTRAINT PK_ID_CHEQUE PRIMARY KEY (ID_CHEQUE) ';
   vString := vString + ' USING INDEX PK_ID_CHEQUE  ';
   CriarChavePrimariaSePrecisar('CHEQUES','(ID_CHEQUE)',vString);

   vString  := ' CREATE GENERATOR NOVO_CHEQUE ';
   vString2 := 'NOVO_CHEQUE TO 0';
   CriarGeneratorSePrecisar('NOVO_CHEQUE',vString,vString2);

   //
   //Tabela de Pagar
   vString := 'CREATE TABLE PAGAR ( ';
   vString := vString + ' ID_PAGAR          INTEGER NOT NULL, ';
   vString := vString + ' DESCRICAO_TITULO  VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ID_PEDIDO         INTEGER,';
   vString := vString + ' ID_FORNECEDOR     INTEGER , ';
   vString := vString + ' NOME_FORNECEDOR   VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' VENCIMENTO        DATE, ';
   vString := vString + ' DATA_PAGAMENTO    DATE, ';
   vString := vString + ' VALOR_TITULO      NUMERIC(15,2), ';
   vString := vString + ' VALOR_PAGO        NUMERIC(15,2), ';
   vString := vString + ' NUMERO_CHEQUE     VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' FORMA_PAGAMENTO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' STATUS            VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PAGAR',vString);

   vString := 'ALTER TABLE PAGAR ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PAGAR PRIMARY KEY (ID_PAGAR) ';
   vString := vString + ' USING INDEX PK_ID_PAGAR  ';
   CriarChavePrimariaSePrecisar('PAGAR','(ID_PAGAR)',vString);

   vString  := ' CREATE GENERATOR NOVO_PAGAR ';
   vString2 := 'NOVO_PAGAR TO 0';
   CriarGeneratorSePrecisar('NOVO_PAGAR',vString,vString2);
   //

   //** Validação do sistema
   vString := 'CREATE TABLE VALIDACAO_SISTEMA ( ';
   vString := vString + ' ID_VALIDACAO_SISTEMA  INTEGER NOT NULL, ';
   vString := vString + ' DATA_EXPIRACAO DATE NOT NULL, ';
   vString := vString + ' DATA_ATUAL DATE NOT NULL ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('VALIDACAO_SISTEMA',vString);

   vString := 'ALTER TABLE VALIDACAO_SISTEMA ';
   vString := vString + ' ADD CONSTRAINT PK_ID_VALIDACAO_SISTEMA PRIMARY KEY (ID_VALIDACAO_SISTEMA) ';
   vString := vString + ' USING INDEX PK_ID_VALIDACAO_SISTEMA  ';
   CriarChavePrimariaSePrecisar('VALIDACAO_SISTEMA','(ID_VALIDACAO_SISTEMA)',vString);

   vString  := ' CREATE GENERATOR NOVA_VALIDACAO_SISTEMA ';
   vString2 := 'NOVA_VALIDACAO_SISTEMA TO 0';
   CriarGeneratorSePrecisar('NOVA_VALIDACAO_SISTEMA',vString,vString2);
   //***

   //**
   //Tabela de PRODUTOS
   vString := 'CREATE TABLE PRODUTOS ( ';
   vString := vString + ' PRO_ID  INTEGER NOT NULL, ';
   vString := vString + ' PRO_DESCRICAO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' PRO_EAN13 VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' PRO_CODIGO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT , ';
   vString := vString + ' PRO_CAMINHO_IMAGEM VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT , ';
   vString := vString + ' PRO_SALDO NUMERIC(15,2), ';
   vString := vString + ' PRECO_VENDA NUMERIC(15,2), ';
   vString := vString + ' ALIQUOTA_ICMS INTEGER ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PRODUTOS',vString);

   vString := 'ALTER TABLE PRODUTOS ';
   vString := vString + ' ADD CONSTRAINT PK_PRO_ID PRIMARY KEY (PRO_ID) ';
   vString := vString + ' USING INDEX PK_PRO_ID  ';
   CriarChavePrimariaSePrecisar('PRODUTOS','(PRO_ID)',vString);

   vString  := ' CREATE GENERATOR NOVO_PRODUTO ';
   vString2 := 'NOVO_PRODUTO TO 0';
   CriarGeneratorSePrecisar('NOVO_PRODUTO',vString,vString2);
   //**
   //Tabela de GRUPO DE PRODUTOS
   vString := 'CREATE TABLE GRUPOS_PRODUTOS ( ';
   vString := vString + ' ID_GRUPO_PRODUTO  INTEGER NOT NULL, ';
   vString := vString + ' GRUPO_PRODUTO_DESCRICAO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   vString := vString + ') ';
   CriarTabelaSePrecisar('GRUPOS_PRODUTOS',vString);

   vString := 'ALTER TABLE GRUPOS_PRODUTOS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_GRUPO_PRODUTO PRIMARY KEY (ID_GRUPO_PRODUTO) ';
   vString := vString + ' USING INDEX PK_ID_GRUPO_PRODUTO  ';
   CriarChavePrimariaSePrecisar('GRUPOS_PRODUTOS','(ID_GRUPO_PRODUTO)',vString);

   vString  := ' CREATE GENERATOR NOVO_GRUPO_PRODUTO ';
   vString2 := 'NOVO_GRUPO_PRODUTO TO 0';
   CriarGeneratorSePrecisar('NOVO_GRUPO_PRODUTO',vString,vString2);
   //**
   vString  := ' ALTER TABLE PRODUTOS ';
   vString := vString + 'ADD ID_GRUPO_PRODUTO INTEGER';
   CriarCampoSePrecisar('PRODUTOS','ID_GRUPO_PRODUTO',vString);

   vString := 'CREATE TABLE PEDIDOS ( ';
   vString := vString + ' ID_PEDIDO                    INTEGER NOT NULL, ';
   vString := vString + '  ID_CLIENTE                  INTEGER, ';
   vString := vString + '  ID_USUARIO                  INTEGER NOT NULL, ';
   vString := vString + '  NOME_CLIENTE                VARCHAR(255) COLLATE PT_PT, ';
   vString := vString + '  DATA_PEDIDO                 DATE, ';
   vString := vString + '  HORA_PEDIDO                 DATE, ';
   vString := vString + '  DATA_VENCIMENTO             DATE, ';
   vString := vString + '  DATA_PAGAMENTO              DATE, ';
   vString := vString + '  FORMA_PAGAMENTO             VARCHAR(100) COLLATE PT_PT, ';
   vString := vString + '  CONDICAO_PAGAMENTO          VARCHAR(100) COLLATE PT_PT, ';
   vString := vString + '  DATA_ENTREGA                DATE, ';
   vString := vString + '  FORMA_ENTREGA               VARCHAR(100) COLLATE PT_PT, ';
   vString := vString + '  VALOR_FRETE                 NUMERIC(15,2), ';
   vString := vString + '  VALOR_ICMS                  NUMERIC(15,2), ';
   vString := vString + '  VALOR_IPI                   NUMERIC(15,2), ';
   vString := vString + '  DATA_NF                     DATE, ';
   vString := vString + '  NUMERO_NF                   INTEGER, ';
   vString := vString + '  NUMERO_PARCELAS             INTEGER, ';
   vString := vString + '  OBSERVACAO                  BLOB SUB_TYPE 1 SEGMENT SIZE 50, ';
   vString := vString + '  PERCENTUAL_ICMS             NUMERIC(15,2), ';
   vString := vString + '  PERCENTUAL_IPI              NUMERIC(15,2), ';
   vString := vString + '  VALOR_TOTAL                 NUMERIC(15,2), ';
   vString := vString + '  STATUS                      VARCHAR(100) COLLATE PT_PT, ';
   vString := vString + '  TIPO_OPERACAO               VARCHAR(2) COLLATE PT_PT, ';
   vString := vString + '  ID_FORMA_DE_ENTREGA         INTEGER, ';
   vString := vString + '  ID_FORMA_DE_PAGAMENTO       INTEGER, ';
   vString := vString + '  ID_CONDICAO_DE_PAGAMENTO    INTEGER, ';
   vString := vString + '  ID_VENDEDOR                 INTEGER, ';
   vString := vString + '  ID_ORCAMENTO                INTEGER, ';
   vString := vString + '  NOME_VENDEDOR               VARCHAR(255) COLLATE PT_PT, ';
   vString := vString + '  DATA_DO_PARTO               DATE, ';
   vString := vString + '  NUMEROCUPOMFISCAL           VARCHAR(255) COLLATE PT_PT, ';
   vString := vString + '  PEDIDO_JA_CAPTURADO_BALCAO  VARCHAR(1) COLLATE PT_PT, ';
   vString := vString + '  NOME_DO_BEBE                VARCHAR(100) COLLATE PT_PT,  ';
   vString := vString + '  VALOR_TOTAL_PRODUTOS        NUMERIC(15,2), ';
   vString := vString + '  PERCENTUAL_DESCONTO         NUMERIC(15,2), ';
   vString := vString + '  VALOR_DESCONTO              NUMERIC(15,2), ';
   vString := vString + '  ID_USUARIO_EXCLUSAO         INTEGER, ';
   vString := vString + '  DATA_EXCLUSAO               TIMESTAMP,  ';
   vString := vString + '  SITUACAO                    INTEGER, ';
   vString := vString + '  ID_PEDIDO_PAI               INTEGER, ';
   vString := vString + '  NUMERO_COMANDA              VARCHAR(100) COLLATE PT_PT, ';
   vString := vString + '  PEDIDO_EM_VENDA               VARCHAR(1) COLLATE PT_PT, ';
   vString := vString + '  DESCRICAO_FORMA_DE_PAGAMENTO  VARCHAR(255) COLLATE PT_PT, ';
   vString := vString + '  NUMERO_CUPOM                  VARCHAR(100) COLLATE PT_PT ';
   vString := vString + ') ';

   CriarTabelaSePrecisar('PEDIDOS',vString);

   vString := 'ALTER TABLE PEDIDOS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PEDIDO PRIMARY KEY (ID_PEDIDO) ';
   vString := vString + ' USING INDEX PK_ID_PEDIDO  ';
   CriarChavePrimariaSePrecisar('PEDIDOS','(ID_PEDIDO)',vString);

   vString  := ' CREATE GENERATOR NOVO_PEDIDO ';
   vString2 := 'NOVO_PEDIDO TO 0';
   CriarGeneratorSePrecisar('NOVO_PEDIDO',vString,vString2);

   vString := 'CREATE TABLE PEDIDOS_ITENS ( ';
   vString := vString + ' ID_PEDIDO_ITEM  INTEGER NOT NULL, ';
   vString := vString + ' ID_PEDIDO  INTEGER NOT NULL, ';
   vString := vString + ' ID_PRODUTO  INTEGER NOT NULL, ';
   vString := vString + ' DESCRICAO_PRODUTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' QUANTIDADE NUMERIC(15,2),';
   vString := vString + ' VALOR_UNITARIO NUMERIC(15,2),';
   vString := vString + ' VALOR_TOTAL NUMERIC(15,2),';
   vString := vString + ' ALIQUOTA_ICMS INTEGER,';
   vString := vString + ' DESCONTO NUMERIC(15,2)';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PEDIDOS_ITENS',vString);

   vString := 'ALTER TABLE PEDIDOS_ITENS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PEDIDO_ITEM PRIMARY KEY (ID_PEDIDO_ITEM) ';
   vString := vString + ' USING INDEX PK_ID_PEDIDO_ITEM  ';
   CriarChavePrimariaSePrecisar('PEDIDOS_ITENS','(ID_PEDIDO_ITEM)',vString);

   vString  := ' CREATE GENERATOR NOVO_PEDIDO_ITEM ';
   vString2 := 'NOVO_PEDIDO_ITEM TO 0';
   CriarGeneratorSePrecisar('NOVO_PEDIDO_ITEM',vString,vString2);

   //+++++++++++++++++++++++++++++++++++
   vString := 'CREATE TABLE MOVIMENTACOES ( ';
   vString := vString + ' ID_MOVIMENTACAO  INTEGER NOT NULL, ';
   vString := vString + ' ID_PEDIDO  INTEGER NOT NULL, ';
   vString := vString + ' ID_PRODUTO  INTEGER NOT NULL, ';
   vString := vString + ' DATA  DATE NOT NULL, ';
   vString := vString + ' HORA  TIME NOT NULL, ';
   vString := vString + ' QTDE_ANTERIOR NUMERIC(15,2),';
   vString := vString + ' QTDE_MOVIMENTADA NUMERIC(15,2),';
   vString := vString + ' QTDE_APOS_MOVIMENTACAO NUMERIC(15,2),';
   vString := vString + ' TIPO_MOVIMENTACAO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('MOVIMENTACOES',vString);

   vString := 'ALTER TABLE MOVIMENTACOES ';
   vString := vString + ' ADD CONSTRAINT PK_ID_MOVIMENTACAO PRIMARY KEY (ID_MOVIMENTACAO) ';
   vString := vString + ' USING INDEX PK_ID_MOVIMENTACAO  ';
   CriarChavePrimariaSePrecisar('MOVIMENTACOES','(ID_MOVIMENTACAO)',vString);

   vString  := ' CREATE GENERATOR NOVA_MOVIMENTACAO ';
   vString2 := 'NOVA_MOVIMENTACAO TO 0';
   CriarGeneratorSePrecisar('NOVA_MOVIMENTACAO',vString,vString2);

   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   vString := 'CREATE TABLE CLIENTES ( ';
   vString := vString + ' ID_CLIENTE  INTEGER NOT NULL, ';
   vString := vString + ' RAZAO_SOCIAL VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' FANTASIA VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CPF VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CNPJ VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' INSCRICAO_ESTADUAL VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ENDERECO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' NUMERO VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CEP VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' BAIRRO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' TELEFONE VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CELULAR VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' EMAIL VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' EMAIL_DANFE VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   vString := vString + ') ';
   CriarTabelaSePrecisar('CLIENTES',vString);

   vString := 'ALTER TABLE CLIENTES ';
   vString := vString + ' ADD CONSTRAINT PK_ID_CLIENTE PRIMARY KEY (ID_CLIENTE) ';
   vString := vString + ' USING INDEX PK_ID_CLIENTE  ';
   CriarChavePrimariaSePrecisar('CLIENTES','(ID_CLIENTE)',vString);

   vString  := ' CREATE GENERATOR NOVO_CLIENTE ';
   vString2 := 'NOVO_CLIENTE TO 0';
   CriarGeneratorSePrecisar('NOVO_CLIENTE',vString,vString2);
   //**
   vString := 'CREATE TABLE PRODUTOS_MATERIAS_PRIMAS ( ';
   vString := vString + ' ID_PRODUTO_MATERIA_PRIMA  INTEGER NOT NULL, ';
   vString := vString + ' ID_MATERIA_PRIMA  INTEGER NOT NULL, ';
   vString := vString + ' ID_PRODUTO  INTEGER NOT NULL, ';
   vString := vString + ' DESCRICAO_MATERIA_PRIMA VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' QUANTIDADE NUMERIC(15,2)';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PRODUTOS_MATERIAS_PRIMAS',vString);

   vString := 'ALTER TABLE PRODUTOS_MATERIAS_PRIMAS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PRODUTO_MATERIA_PRIMA PRIMARY KEY (ID_PRODUTO_MATERIA_PRIMA) ';
   vString := vString + ' USING INDEX PK_ID_PRODUTO_MATERIA_PRIMA  ';
   CriarChavePrimariaSePrecisar('PRODUTOS_MATERIAS_PRIMAS','(ID_PRODUTO_MATERIA_PRIMA)',vString);

   vString  := ' CREATE GENERATOR NOVO_PRODUTO_MATERIA_PRIMA ';
   vString2 := 'NOVO_PRODUTO_MATERIA_PRIMA TO 0';
   CriarGeneratorSePrecisar('NOVO_PRODUTO_MATERIA_PRIMA',vString,vString2);
   //**
   vString := 'CREATE TABLE NOTAS_FISCAIS ( ';
   vString := vString + ' ID_NOTA_FISCAL INTEGER NOT NULL,';
   vString := vString + ' ID_TRANSPORTADOR INTEGER,';
   vString := vString + ' ID_PEDIDO INTEGER,';
   vString := vString + ' ID_CLIENTE INTEGER  NOT NULL,';
   vString := vString + ' ID_NATUREZA_OPERACAO INTEGER NOT NULL,';
   vString := vString + ' NFE_CALCULADA VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' NOME_CLIENTE VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' FORMA_PAGAMENTO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' CONDICAO_PAGAMENTO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' NATUREZA_DE_OPERACAO VARCHAR(60) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' NUMERO_PARCELAS INTEGER,';
   vString := vString + ' NUMERO_NOTA_FISCAL INTEGER,';
   vString := vString + ' DATA_EMISSAO DATE ,';
   vString := vString + ' DATA_SAIDA_ENTRADA DATE ,';
   vString := vString + ' HORA_SAIDA_ENTRADA TIME ,';
   vString := vString + ' ENTRADA_SAIDA VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' TIPO_EMISSAO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' INFORMACAO_NFE VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' BASE_CALCULO_ICMS NUMERIC(15,2) ,';
   vString := vString + ' VALOR_ICMS NUMERIC(15,2) ,';
   vString := vString + ' BASE_ST NUMERIC(15,2) ,';
   vString := vString + ' VALOR_ST NUMERIC(15,2) ,';
   vString := vString + ' VALOR_PRODUTOS NUMERIC(15,2) ,';
   vString := vString + ' VALOR_FRETE NUMERIC(15,2) ,';
   vString := vString + ' VALOR_SEGURO NUMERIC(15,2) ,';
   vString := vString + ' VALOR_DESCONTO NUMERIC(15,2) ,';
   vString := vString + ' VALOR_IMPOSTO_IMPORTACAO NUMERIC(15,2) ,';
   vString := vString + ' VALOR_IPI NUMERIC(15,2) ,';
   vString := vString + ' VALOR_PIS NUMERIC(15,2) ,';
   vString := vString + ' VALOR_COFINS NUMERIC(15,2) ,';
   vString := vString + ' VALOR_OUTROS NUMERIC(15,2) ,';
   vString := vString + ' VALOR_TOTAL_NOTA NUMERIC(15,2) ,';
   vString := vString + ' CHAVE VARCHAR(44) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ESPECIE VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' MARCA VARCHAR(100)  CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' NUMERO_VOLUME VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' PESO_LIQUIDO NUMERIC(15,2),';
   vString := vString + ' PESO_BRUTO NUMERIC(15,2),';
   vString := vString + ' NUMERO_PROTOCOLO_RECEBIMENTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' DATA_HORA_RECEBIMENTO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' MOTIVO_RECEBIMENTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' RESPONSAVEL_FRETE VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   vString := vString + ') ';
   CriarTabelaSePrecisar('NOTAS_FISCAIS',vString);

   vString := 'ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_NOTA_FISCAL PRIMARY KEY (ID_NOTA_FISCAL) ';
   vString := vString + ' USING INDEX PK_ID_NOTA_FISCAL  ';
   CriarChavePrimariaSePrecisar('NOTAS_FISCAIS','(ID_NOTA_FISCAL)',vString);

   vString  := ' CREATE GENERATOR NOVA_NOTA_FISCAL ';
   vString2 := 'NOVA_NOTA_FISCAL TO 0';
   CriarGeneratorSePrecisar('NOVA_NOTA_FISCAL',vString,vString2);
   //**
   vString := 'CREATE TABLE NOTAS_FISCAIS_ITENS ( ';
   vString := vString + ' ID_NOTA_FISCAL_ITEM INTEGER NOT NULL,';
   vString := vString + ' ID_PRODUTO INTEGER NOT NULL,';
   vString := vString + ' ID_NOTA_FISCAL INTEGER NOT NULL,';
   vString := vString + ' QUANTIDADE NUMERIC(15,2) ,';
   vString := vString + ' EAN13 VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' CFOP VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' CST_ICMS VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' PERCENTUAL_ICMS NUMERIC(15,2) ,';
   vString := vString + ' VALOR_ICMS NUMERIC(15,2) ,';
   vString := vString + ' BASE_CALCULO_ICMS NUMERIC(15,2) ,';
   vString := vString + ' CST_ICMS_ST VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' PERCENTUAL_ICMS_ST NUMERIC(15,2) ,';
   vString := vString + ' VALOR_ICMS_ST NUMERIC(15,2) ,';
   vString := vString + ' BASE_CALCULO_ICMS_ST NUMERIC(15,2) ,';
   vString := vString + ' CST_IPI VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' PERCENTUAL_IPI NUMERIC(15,2) ,';
   vString := vString + ' VALOR_IPI NUMERIC(15,2) ,';
   vString := vString + ' BASE_CALCULO_IPI NUMERIC(15,2) ,';
   vString := vString + ' CST_PIS VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' PERCENTUAL_PIS NUMERIC(15,2) ,';
   vString := vString + ' VALOR_PIS NUMERIC(15,2) ,';
   vString := vString + ' CST_COFINS VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' PERCENTUAL_COFINS NUMERIC(15,2) ,';
   vString := vString + ' VALOR_COFINS NUMERIC(15,2) ,';
   vString := vString + ' BASE_CALCULO_COFINS NUMERIC(15,2) ,';
   vString := vString + ' DESCRICAO_PRODUTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' CODIGO_PRODUTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' NCM_PRODUTO VARCHAR(15) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' UNIDADE VARCHAR(2) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' VALOR_UNITARIO NUMERIC(15,2) ,';
   vString := vString + ' VALOR_TOTAL NUMERIC(15,2) ,';
   vString := vString + ' VALOR_FRETE NUMERIC(15,2) ,';
   vString := vString + ' VALOR_SEGURO NUMERIC(15,2) ,';
   vString := vString + ' VALOR_DESCONTO NUMERIC(15,2) ,';
   vString := vString + ' INFORMACOES_ADICIONAIS VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   vString := vString + ') ';
   CriarTabelaSePrecisar('NOTAS_FISCAIS_ITENS',vString);

   vString := 'ALTER TABLE NOTAS_FISCAIS_ITENS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_NOTA_FISCAL_ITEM PRIMARY KEY (ID_NOTA_FISCAL_ITEM) ';
   vString := vString + ' USING INDEX PK_ID_NOTA_FISCAL_ITEM  ';
   CriarChavePrimariaSePrecisar('NOTAS_FISCAIS_ITENS','(ID_NOTA_FISCAL_ITEM)',vString);

   vString  := ' CREATE GENERATOR NOVA_NOTA_FISCAL_ITEM ';
   vString2 := 'NOVA_NOTA_FISCAL_ITEM TO 0';
   CriarGeneratorSePrecisar('NOVA_NOTA_FISCAL_ITEM',vString,vString2);

   //**
   vString := 'CREATE TABLE PEDIDOS_DE_COMPRA ( ';
   vString := vString + ' ID_PEDIDO_DE_COMPRA INTEGER NOT NULL,';
   vString := vString + ' ID_FORNECEDOR INTEGER,';
   vString := vString + ' ID_USUARIO INTEGER,';
   vString := vString + ' NOME_FORNECEDOR VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' DATA_PEDIDO DATE,';
   vString := vString + ' HORA_PEDIDO DATE,';
   vString := vString + ' DATA_VENCIMENTO DATE,';
   vString := vString + ' DATA_PAGAMENTO DATE,';
   vString := vString + ' FORMA_PAGAMENTO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' CONDICAO_PAGAMENTO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' DATA_ENTREGA DATE,';
   vString := vString + ' FORMA_ENTREGA VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' VALOR_FRETE NUMERIC(15,2),';
   vString := vString + ' VALOR_ICMS NUMERIC(15,2),';
   vString := vString + ' VALOR_IPI NUMERIC(15,2),';
   vString := vString + ' DATA_NF DATE,';
   vString := vString + ' NUMERO_NF INTEGER,';
   vString := vString + ' NUMERO_PARCELAS INTEGER,';
   vString := vString + ' OBSERVACAO BLOB SUB_TYPE 1 SEGMENT SIZE 50 CHARACTER SET ISO8859_1,';
   vString := vString + ' PERCENTUAL_ICMS NUMERIC(15,2),';
   vString := vString + ' PERCENTUAL_IPI NUMERIC(15,2),';
   vString := vString + ' VALOR_TOTAL NUMERIC(15,2),';
   vString := vString + ' STATUS VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PEDIDOS_DE_COMPRA',vString);

   vString := 'ALTER TABLE PEDIDOS_DE_COMPRA ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PEDIDO_DE_COMPRA PRIMARY KEY (ID_PEDIDO_DE_COMPRA) ';
   vString := vString + ' USING INDEX PK_ID_PEDIDO_DE_COMPRA  ';
   CriarChavePrimariaSePrecisar('PEDIDOS_DE_COMPRA','(ID_PEDIDO_DE_COMPRA)',vString);

   vString  := ' CREATE GENERATOR NOVO_PEDIDO_DE_COMPRA ';
   vString2 := 'NOVO_PEDIDO_DE_COMPRA TO 0';
   CriarGeneratorSePrecisar('NOVO_PEDIDO_DE_COMPRA',vString,vString2);
   //**
   vString := 'CREATE TABLE PEDIDOS_DE_COMPRA_ITENS ( ';
   vString := vString + ' ID_PEDIDO_DE_COMPRA_ITEM  INTEGER NOT NULL, ';
   vString := vString + ' ID_PEDIDO_DE_COMPRA  INTEGER NOT NULL, ';
   vString := vString + ' ID_PRODUTO  INTEGER NOT NULL, ';
   vString := vString + ' DESCRICAO_PRODUTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' QUANTIDADE NUMERIC(15,2),';
   vString := vString + ' VALOR_UNITARIO NUMERIC(15,2),';
   vString := vString + ' VALOR_TOTAL NUMERIC(15,2),';
   vString := vString + ' ALIQUOTA_ICMS INTEGER';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PEDIDOS_DE_COMPRA_ITENS',vString);

   vString := 'ALTER TABLE PEDIDOS_DE_COMPRA_ITENS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PEDIDO_DE_COMPRA_ITEM PRIMARY KEY (ID_PEDIDO_DE_COMPRA_ITEM) ';
   vString := vString + ' USING INDEX PK_ID_PEDIDO_DE_COMPRA_ITEM  ';
   CriarChavePrimariaSePrecisar('PEDIDOS_DE_COMPRA_ITENS','(ID_PEDIDO_DE_COMPRA_ITEM)',vString);

   vString  := ' CREATE GENERATOR NOVO_PEDIDO_DE_COMPRA_ITEM ';
   vString2 := 'NOVO_PEDIDO_DE_COMPRA_ITEM TO 0';
   CriarGeneratorSePrecisar('NOVO_PEDIDO_DE_COMPRA_ITEM',vString,vString2);
   //**
   vString := 'CREATE TABLE TRANSPORTADORES ( ';
   vString := vString + ' ID_TRANSPORTADOR  INTEGER NOT NULL, ';
   vString := vString + ' CNPJ VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' INSCRICAO_ESTADUAL VARCHAR(20) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' RAZAO_SOCIAL VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' FANTASIA VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ENDERECO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' NUMERO VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' BAIRRO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CIDADE VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' TELEFONE VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' UF VARCHAR(2) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CEP VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' EMAIL VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('TRANSPORTADORES',vString);

   vString := 'ALTER TABLE TRANSPORTADORES ';
   vString := vString + ' ADD CONSTRAINT PK_ID_TRANSPORTADOR PRIMARY KEY (ID_TRANSPORTADOR) ';
   vString := vString + ' USING INDEX PK_ID_TRANSPORTADOR  ';
   CriarChavePrimariaSePrecisar('TRANSPORTADORES','(ID_TRANSPORTADOR)',vString);

   vString  := ' CREATE GENERATOR NOVO_TRANSPORTADOR ';
   vString2 := 'NOVO_TRANSPORTADOR TO 0';
   CriarGeneratorSePrecisar('NOVO_TRANSPORTADOR',vString,vString2);
   //**
   vString := 'CREATE TABLE DUPLICATAS_NOTAS_FISCAIS ( ';
   vString := vString + ' ID_DUPLICATA_NOTA_FISCAL  INTEGER NOT NULL, ';
   vString := vString + ' ID_NOTA_FISCAL  INTEGER NOT NULL, ';
   vString := vString + ' NUMERO_FATURA INTEGER, ';
   vString := vString + ' VENCIMENTO DATE, ';
   vString := vString + ' VALOR NUMERIC(15,2) ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('DUPLICATAS_NOTAS_FISCAIS',vString);

   vString := 'ALTER TABLE DUPLICATAS_NOTAS_FISCAIS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_DUPLICATA_NOTA_FISCAL PRIMARY KEY (ID_DUPLICATA_NOTA_FISCAL) ';
   vString := vString + ' USING INDEX PK_ID_DUPLICATA_NOTA_FISCAL  ';
   CriarChavePrimariaSePrecisar('DUPLICATAS_NOTAS_FISCAIS','(ID_DUPLICATA_NOTA_FISCAL)',vString);

   vString  := ' CREATE GENERATOR NOVA_DUPLICATA_NOTA_FISCAL ';
   vString2 := 'NOVA_DUPLICATA_NOTA_FISCAL TO 0';
   CriarGeneratorSePrecisar('NOVA_DUPLICATA_NOTA_FISCAL',vString,vString2);
   //**
   vString := 'CREATE TABLE TIPOS_DE_OPERACAO ( ';
   vString := vString + ' ID_TIPO_OPERACAO INTEGER NOT NULL , ';
   vString := vString + ' CFOP_DENTRO_ESTADO VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CFOP_FORA_ESTADO VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CFOP_DENTRO_ESTADO_COM_ST VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CFOP_FORA_ESTADO_COM_ST VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CST_ICMS_NORMAL VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CST_ICMS_COM_ST VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CST_ICMS_COM_REDUCAO VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CST_ICMS_COM_ST_E_REDUCAO VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CST_IPI VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CST_PIS VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CST_COFINS VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' DESCRICAO_TIPO_OPERACAO VARCHAR(60) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('TIPOS_DE_OPERACAO',vString);

   vString := 'ALTER TABLE TIPOS_DE_OPERACAO ';
   vString := vString + ' ADD CONSTRAINT PK_ID_TIPO_OPERACAO PRIMARY KEY (ID_TIPO_OPERACAO) ';
   vString := vString + ' USING INDEX PK_ID_TIPO_OPERACAO  ';
   CriarChavePrimariaSePrecisar('TIPOS_DE_OPERACAO','(ID_TIPO_OPERACAO)',vString);

   vString  := ' CREATE GENERATOR NOVO_TIPO_DE_OPERACAO ';
   vString2 := 'NOVO_TIPO_DE_OPERACAO TO 0';
   CriarGeneratorSePrecisar('NOVO_TIPO_DE_OPERACAO',vString,vString2);
   //**
   vString := 'CREATE TABLE CONVENIOS_NCM (';
   vString := vString + ' ID_CONVENIO_NCM INTEGER NOT NULL ,';
   vString := vString + ' CODIGO_NCM VARCHAR(15)  CHARACTER SET ISO8859_1 COLLATE PT_PT ,';
   vString := vString + ' UF_DESTINO VARCHAR(2)  CHARACTER SET ISO8859_1 COLLATE PT_PT ,';
   vString := vString + ' PERCENTUAL_IVA NUMERIC(15,2) ,';
   vString := vString + ' ALIQUOTA_ICMS NUMERIC(15,2) ,';
   vString := vString + ' ALIQUOTA_IPI NUMERIC(15,2) ,';
   vString := vString + ' PERCENTUAL_REDUCAO NUMERIC(15,2) ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('CONVENIOS_NCM',vString);

   vString := 'ALTER TABLE CONVENIOS_NCM ';
   vString := vString + ' ADD CONSTRAINT PK_ID_CONVENIO_NCM PRIMARY KEY (ID_CONVENIO_NCM) ';
   vString := vString + ' USING INDEX PK_ID_CONVENIO_NCM  ';
   CriarChavePrimariaSePrecisar('CONVENIOS_NCM','(ID_CONVENIO_NCM)',vString);

   vString  := ' CREATE GENERATOR NOVO_CONVENIO_NCM ';
   vString2 := 'NOVO_CONVENIO_NCM TO 0';
   CriarGeneratorSePrecisar('NOVO_CONVENIO_NCM',vString,vString2);
   //**
   vString  := ' ALTER TABLE CLIENTES ';
   vString := vString + 'ADD SITUACAO_APURACAO  VARCHAR(20)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('CLIENTES','SITUACAO_APURACAO',vString);

   vString  := ' ALTER TABLE CLIENTES ';
   vString := vString + 'ADD CONSUMIDOR_FINAL  VARCHAR(1)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('CLIENTES','CONSUMIDOR_FINAL',vString);

   vString  := ' ALTER TABLE CLIENTES ';
   vString := vString + 'ADD POSSUI_SUFRAMA  VARCHAR(1)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('CLIENTES','POSSUI_SUFRAMA',vString);

   vString  := ' ALTER TABLE CLIENTES ';
   vString := vString + 'ADD CODIGO_SUFRAMA  VARCHAR(50)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('CLIENTES','CODIGO_SUFRAMA',vString);

   vString  := ' ALTER TABLE PRODUTOS ';
   vString := vString + 'ADD CODIGO_NCM  VARCHAR(12)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('PRODUTOS','CODIGO_NCM',vString);

   vString  := ' ALTER TABLE PRODUTOS ';
   vString := vString + 'ADD ORIGEM_MERCADORIA  VARCHAR(1)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('PRODUTOS','ORIGEM_MERCADORIA',vString);

   vString  := ' ALTER TABLE CLIENTES ';
   vString := vString + 'ADD UF  VARCHAR(2)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('CLIENTES','UF',vString);

   vString  := ' ALTER TABLE CLIENTES ';
   vString := vString + 'ADD CIDADE  VARCHAR(100)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('CLIENTES','CIDADE',vString);

   vString  := ' ALTER TABLE CLIENTES ';
   vString := vString + 'ADD ID_TRANSPORTADOR INTEGER';
   CriarCampoSePrecisar('CLIENTES','ID_TRANSPORTADOR',vString);

   vString  := ' ALTER TABLE PRODUTOS ';
   vString := vString + 'ADD UNIDADE  VARCHAR(3)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('PRODUTOS','UNIDADE',vString);

   vString  := ' ALTER TABLE PRODUTOS ';
   vString := vString + 'ADD ID_FORNECEDOR INTEGER';
   CriarCampoSePrecisar('PRODUTOS','ID_FORNECEDOR',vString);

   //**
   vString := 'CREATE TABLE FORMAS_DE_ENTREGA (';
   vString := vString + ' ID_FORMA_DE_ENTREGA INTEGER NOT NULL ,';
   vString := vString + ' FORMA_DE_ENTREGA VARCHAR(100)  CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('FORMAS_DE_ENTREGA',vString);

   vString := 'ALTER TABLE FORMAS_DE_ENTREGA ';
   vString := vString + ' ADD CONSTRAINT PK_ID_FORMA_DE_ENTREGA PRIMARY KEY (ID_FORMA_DE_ENTREGA) ';
   vString := vString + ' USING INDEX PK_ID_FORMA_DE_ENTREGA  ';
   CriarChavePrimariaSePrecisar('FORMAS_DE_ENTREGA','(ID_FORMA_DE_ENTREGA)',vString);

   vString  := ' CREATE GENERATOR NOVA_FORMA_ENTREGA ';
   vString2 := 'NOVA_FORMA_ENTREGA TO 0';
   CriarGeneratorSePrecisar('NOVA_FORMA_ENTREGA',vString,vString2);
   //**
   vString := 'CREATE TABLE FORMAS_DE_PAGAMENTO (';
   vString := vString + ' ID_FORMA_DE_PAGAMENTO INTEGER NOT NULL ,';
   vString := vString + ' FORMA_DE_PAGAMENTO VARCHAR(100)  CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('FORMAS_DE_PAGAMENTO',vString);

   vString := 'ALTER TABLE FORMAS_DE_PAGAMENTO ';
   vString := vString + ' ADD CONSTRAINT PK_ID_FORMA_DE_PAGAMENTO PRIMARY KEY (ID_FORMA_DE_PAGAMENTO) ';
   vString := vString + ' USING INDEX PK_ID_FORMA_DE_PAGAMENTO  ';
   CriarChavePrimariaSePrecisar('FORMAS_DE_PAGAMENTO','(ID_FORMA_DE_PAGAMENTO)',vString);

   vString  := ' CREATE GENERATOR NOVA_FORMA_PAGAMENTO ';
   vString2 := 'NOVA_FORMA_PAGAMENTO TO 0';
   CriarGeneratorSePrecisar('NOVA_FORMA_PAGAMENTO',vString,vString2);
   //**
   vString := 'CREATE TABLE CONDICOES_DE_PAGAMENTO (';
   vString := vString + ' ID_CONDICAO_DE_PAGAMENTO INTEGER NOT NULL ,';
   vString := vString + ' CONDICAO_DE_PAGAMENTO VARCHAR(100)  CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('CONDICOES_DE_PAGAMENTO',vString);

   vString := 'ALTER TABLE CONDICOES_DE_PAGAMENTO ';
   vString := vString + ' ADD CONSTRAINT PK_ID_CONDICAO_DE_PAGAMENTO PRIMARY KEY (ID_CONDICAO_DE_PAGAMENTO) ';
   vString := vString + ' USING INDEX PK_ID_CONDICAO_DE_PAGAMENTO  ';
   CriarChavePrimariaSePrecisar('CONDICOES_DE_PAGAMENTO','(ID_CONDICAO_DE_PAGAMENTO)',vString);

   vString  := ' CREATE GENERATOR NOVA_CONDICAO_PAGAMENTO ';
   vString2 := 'NOVA_CONDICAO_PAGAMENTO TO 0';
   CriarGeneratorSePrecisar('NOVA_CONDICAO_PAGAMENTO',vString,vString2);
   //**

   vString  := ' ALTER TABLE PEDIDOS ';
   vString := vString + 'ADD ID_FORMA_DE_ENTREGA INTEGER';
   CriarCampoSePrecisar('PEDIDOS','ID_FORMA_DE_ENTREGA',vString);

   vString  := ' ALTER TABLE PEDIDOS ';
   vString := vString + 'ADD ID_FORMA_DE_PAGAMENTO INTEGER';
   CriarCampoSePrecisar('PEDIDOS','ID_FORMA_DE_PAGAMENTO',vString);

   vString  := ' ALTER TABLE PEDIDOS ';
   vString := vString + 'ADD ID_CONDICAO_DE_PAGAMENTO INTEGER';
   CriarCampoSePrecisar('PEDIDOS','ID_CONDICAO_DE_PAGAMENTO',vString);

   //**
   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD ID_FORMA_DE_ENTREGA INTEGER';
   CriarCampoSePrecisar('NOTAS_FISCAIS','ID_FORMA_DE_ENTREGA',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD ID_FORMA_DE_PAGAMENTO INTEGER';
   CriarCampoSePrecisar('NOTAS_FISCAIS','ID_FORMA_DE_PAGAMENTO',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD ID_CONDICAO_DE_PAGAMENTO INTEGER';
   CriarCampoSePrecisar('NOTAS_FISCAIS','ID_CONDICAO_DE_PAGAMENTO',vString);

   //Tabela de Movimentações do caixa
   vString := 'CREATE TABLE MOVIMENTACOES_CAIXAS ( ';
   vString := vString + ' ID_MOVIMENTACAO_CAIXA         INTEGER NOT NULL, ';
   vString := vString + ' ID_USUARIO                    INTEGER NOT NULL, ';
   vString := vString + ' ID_CAIXA_ABERTURA_FECHAMENTO  INTEGER NOT NULL, ';
   vString := vString + ' DEBITO_CREDITO                VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' VALOR_MOVIMENTADO             NUMERIC(15,2), ';
   vString := vString + ' DESCRICAO_MOVIMENTACAO        VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' OBSERVACAO                    VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ID_PEDIDO                     INTEGER ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('MOVIMENTACOES_CAIXAS',vString);

   vString := 'ALTER TABLE MOVIMENTACOES_CAIXAS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_MOVIMENTACAO_CAIXA PRIMARY KEY (ID_MOVIMENTACAO_CAIXA) ';
   vString := vString + ' USING INDEX PK_ID_MOVIMENTACAO_CAIXA  ';
   CriarChavePrimariaSePrecisar('MOVIMENTACOES_CAIXAS','(ID_MOVIMENTACAO_CAIXA)',vString);

   vString  := ' CREATE GENERATOR NOVA_MOVIMENTACAO_CAIXA ';
   vString2 := 'NOVA_MOVIMENTACAO_CAIXA TO 0';
   CriarGeneratorSePrecisar('NOVA_MOVIMENTACAO_CAIXA',vString,vString2);

   //Tabela de abertura e fechamento de caixa
   vString := 'CREATE TABLE CAIXAS_ABERTURAS_FECHAMENTOS ( ';
   vString := vString + ' ID_CAIXA_ABERTURA_FECHAMENTO  INTEGER NOT NULL, ';
   vString := vString + ' ID_CAIXA                      INTEGER NOT NULL, ';
   vString := vString + ' ID_USUARIO                    INTEGER NOT NULL, ';
   vString := vString + ' DATA_ABERTURA                 DATE, ';
   vString := vString + ' HORA_ABERTURA                 VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' DATA_FECHAMENTO               DATE, ';
   vString := vString + ' HORA_FECHAMENTO               VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' SALDO_ABERTURA                NUMERIC(15,2), ';
   vString := vString + ' SALDO_FECHAMENTO              NUMERIC(15,2) ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('CAIXAS_ABERTURAS_FECHAMENTOS',vString);

   vString := 'ALTER TABLE CAIXAS_ABERTURAS_FECHAMENTOS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_CAIXA_ABERTURA_FECHAMENTO PRIMARY KEY (ID_CAIXA_ABERTURA_FECHAMENTO) ';
   vString := vString + ' USING INDEX PK_ID_CAIXA_ABERTURA_FECHAMENTO  ';
   CriarChavePrimariaSePrecisar('CAIXAS_ABERTURAS_FECHAMENTOS','(ID_CAIXA_ABERTURA_FECHAMENTO)',vString);

   vString  := ' CREATE GENERATOR NOVA_ABERTURA_FECHAMENTO ';
   vString2 := 'NOVA_ABERTURA_FECHAMENTO TO 0';
   CriarGeneratorSePrecisar('NOVA_ABERTURA_FECHAMENTO',vString,vString2);

   //Tabela do Caixa
   vString := 'CREATE TABLE CAIXAS ( ';
   vString := vString + ' ID_CAIXA       INTEGER NOT NULL, ';
   vString := vString + ' VINCULADO      VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' NUMERO_CAIXA   INTEGER NOT NULL ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('CAIXAS',vString);

   vString := 'ALTER TABLE CAIXAS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_ID_CAIXA PRIMARY KEY (ID_CAIXA) ';
   vString := vString + ' USING INDEX PK_ID_ID_CAIXA  ';
   CriarChavePrimariaSePrecisar('CAIXAS','(ID_CAIXA)',vString);

   vString  := ' CREATE GENERATOR NOVO_CAIXA ';
   vString2 := 'NOVO_CAIXA TO 0';
   CriarGeneratorSePrecisar('NOVO_CAIXA',vString,vString2);

   //**
   vString := 'CREATE TABLE FORMAS_DE_PAGAMENTO ( ';
   vString := vString + ' ID_FORMA_DE_PAGAMENTO  INTEGER NOT NULL, ';
   vString := vString + ' DESCRICAO_FORMA_DE_PAGAMENTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' PERMITE_TROCO VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('FORMAS_DE_PAGAMENTO',vString);

   vString := 'ALTER TABLE FORMAS_DE_PAGAMENTO ';
   vString := vString + ' ADD CONSTRAINT PK_ID_FORMA_DE_PAGAMENTO PRIMARY KEY (ID_FORMA_DE_PAGAMENTO) ';
   vString := vString + ' USING INDEX PK_ID_FORMA_DE_PAGAMENTO  ';
   CriarChavePrimariaSePrecisar('FORMAS_DE_PAGAMENTO','(ID_FORMA_DE_PAGAMENTO)',vString);

   vString  := ' CREATE GENERATOR NOVA_FORMA_PAGAMENTO ';
   vString2 := 'NOVA_FORMA_PAGAMENTO TO 0';
   CriarGeneratorSePrecisar('NOVA_FORMA_PAGAMENTO',vString,vString2);

   vString  := ' ALTER TABLE FORMAS_DE_PAGAMENTO ';
   vString := vString + 'ADD ORDEM_IMPRESSORA_FISCAL  INTEGER';
   CriarCampoSePrecisar('FORMAS_DE_PAGAMENTO','ORDEM_IMPRESSORA_FISCAL',vString);

   vString  := ' ALTER TABLE FORMAS_DE_PAGAMENTO ';
   vString := vString + 'ADD EFETUA_REALIZACAO_DO_TITULO  VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('FORMAS_DE_PAGAMENTO','EFETUA_REALIZACAO_DO_TITULO',vString);

   vString  := ' ALTER TABLE FORMAS_DE_PAGAMENTO ';
   vString := vString + 'ADD EFETUA_MOVIMENTACAO_CAIXA  VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('FORMAS_DE_PAGAMENTO','EFETUA_MOVIMENTACAO_CAIXA',vString);

   vString  := ' ALTER TABLE CONDICOES_DE_PAGAMENTO ';
   vString := vString + 'ADD NUMERO_DE_PARCELAS  INTEGER';
   CriarCampoSePrecisar('CONDICOES_DE_PAGAMENTO','NUMERO_DE_PARCELAS',vString);

   //**
   vString := 'CREATE TABLE PEDIDOS_FORMAS_CONDICOES ( ';
   vString := vString + ' ID_PEDIDO_FORMA_CONDICAO   INTEGER NOT NULL, ';
   vString := vString + ' ID_CONDICAO_DE_PAGAMENTO   INTEGER NOT NULL ,';
   vString := vString + ' ID_FORMA_DE_PAGAMENTO      INTEGER NOT NULL ,';
   vString := vString + ' VALOR                      NUMERIC(15,2) ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PEDIDOS_FORMAS_CONDICOES',vString);

   vString := 'ALTER TABLE PEDIDOS_FORMAS_CONDICOES ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PEDIDO_FORMA_CONDICAO PRIMARY KEY (ID_PEDIDO_FORMA_CONDICAO) ';
   vString := vString + ' USING INDEX PK_ID_PEDIDO_FORMA_CONDICAO  ';
   CriarChavePrimariaSePrecisar('PEDIDOS_FORMAS_CONDICOES','(ID_PEDIDO_FORMA_CONDICAO)',vString);

   vString  := ' CREATE GENERATOR NOVO_PEDIDO_FORMA_CONDICAO ';
   vString2 := 'NOVO_PEDIDO_FORMA_CONDICAO TO 0';
   CriarGeneratorSePrecisar('NOVO_PEDIDO_FORMA_CONDICAO',vString,vString2);

   vString  := ' ALTER TABLE CONDICOES_DE_PAGAMENTO ';
   vString := vString + 'ADD NUMERO_DE_PARCELAS  INTEGER';
   CriarCampoSePrecisar('CONDICOES_DE_PAGAMENTO','NUMERO_DE_PARCELAS',vString);

   vString  := ' ALTER TABLE PEDIDOS_FORMAS_CONDICOES ';
   vString := vString + ' ADD DESCRICAO_FORMA_DE_PAGAMENTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   CriarCampoSePrecisar('PEDIDOS_FORMAS_CONDICOES','DESCRICAO_FORMA_DE_PAGAMENTO',vString);

   vString  := ' ALTER TABLE PEDIDOS_FORMAS_CONDICOES ';
   vString := vString + ' ADD CONDICAO_DE_PAGAMENTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   CriarCampoSePrecisar('PEDIDOS_FORMAS_CONDICOES','CONDICAO_DE_PAGAMENTO',vString);

   vString  := ' ALTER TABLE PEDIDOS ';
   vString := vString + ' ADD ID_VENDEDOR  INTEGER ';
   CriarCampoSePrecisar('PEDIDOS','ID_VENDEDOR',vString);

   //**
   vString := 'CREATE TABLE VENDEDORES ( ';
   vString := vString + ' ID_VENDEDOR           INTEGER NOT NULL, ';
   vString := vString + ' NOME_VENDEDOR         VARCHAR(200) CHARACTER SET ISO8859_1 COLLATE PT_PT ,';
   vString := vString + ' PERCENTUAL_COMISSAO   NUMERIC(15,2) ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('VENDEDORES',vString);

   vString := 'ALTER TABLE VENDEDORES ';
   vString := vString + ' ADD CONSTRAINT PK_ID_VENDEDOR PRIMARY KEY (ID_VENDEDOR) ';
   vString := vString + ' USING INDEX PK_ID_VENDEDOR  ';
   CriarChavePrimariaSePrecisar('VENDEDORES','(ID_VENDEDOR)',vString);

   vString  := ' CREATE GENERATOR NOVO_VENDEDOR ';
   vString2 := 'NOVO_VENDEDOR TO 0';
   CriarGeneratorSePrecisar('NOVO_VENDEDOR',vString,vString2);

   //**
   vString := 'CREATE TABLE FORMAS_VS_CONDICOES ( ';
   vString := vString + ' ID_FORMA_VS_CONDICAO           INTEGER NOT NULL, ';
   vString := vString + ' ID_CONDICAO_DE_PAGAMENTO       INTEGER NOT NULL ,';
   vString := vString + ' CONDICAO_DE_PAGAMENTO          VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' ID_FORMA_DE_PAGAMENTO          INTEGER NOT NULL ,';
   vString := vString + ' DESCRICAO_FORMA_DE_PAGAMENTO   VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('FORMAS_VS_CONDICOES',vString);

   vString := 'ALTER TABLE FORMAS_VS_CONDICOES ';
   vString := vString + ' ADD CONSTRAINT PK_ID_FORMA_VS_CONDICAO PRIMARY KEY (ID_FORMA_VS_CONDICAO) ';
   vString := vString + ' USING INDEX PK_ID_FORMA_VS_CONDICAO  ';
   CriarChavePrimariaSePrecisar('FORMAS_VS_CONDICOES','(ID_FORMA_VS_CONDICAO)',vString);

   vString  := ' CREATE GENERATOR NOVA_FORMA_VS_CONDICAO ';
   vString2 := 'NOVA_FORMA_VS_CONDICAO TO 0';
   CriarGeneratorSePrecisar('NOVA_FORMA_VS_CONDICAO',vString,vString2);

   vString  := ' ALTER TABLE PEDIDOS_FORMAS_CONDICOES ';
   vString := vString + ' ADD ID_PEDIDO  INTEGER ';
   CriarCampoSePrecisar('PEDIDOS_FORMAS_CONDICOES','ID_PEDIDO',vString);

   //**
   vString  := ' ALTER TABLE TIPOS_DE_OPERACAO ';
   vString := vString + 'ADD MODALIDADE_BASE_CALCULO_ICMS  VARCHAR(50)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('TIPOS_DE_OPERACAO','MODALIDADE_BASE_CALCULO_ICMS',vString);

   vString  := ' ALTER TABLE TIPOS_DE_OPERACAO ';
   vString := vString + 'ADD MODALIDADE_BASE_CALCULO_ICMS_ST  VARCHAR(50)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('TIPOS_DE_OPERACAO','MODALIDADE_BASE_CALCULO_ICMS_ST',vString);

   vString  := ' ALTER TABLE TIPOS_DE_OPERACAO ';
   vString := vString + 'ADD NUMERO_BASE_CALCULO_ICMS  INTEGER';
   CriarCampoSePrecisar('TIPOS_DE_OPERACAO','NUMERO_BASE_CALCULO_ICMS',vString);

   vString  := ' ALTER TABLE TIPOS_DE_OPERACAO ';
   vString := vString + 'ADD NUMERO_BASE_CALCULO_ICMS_ST  INTEGER';
   CriarCampoSePrecisar('TIPOS_DE_OPERACAO','NUMERO_BASE_CALCULO_ICMS_ST',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS_ITENS ';
   vString := vString + 'ADD ORIGEM_MERCADORIA  VARCHAR(1)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('NOTAS_FISCAIS_ITENS','ORIGEM_MERCADORIA',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD BASE_CALCULO_PIS  NUMERIC(15,2)';
   CriarCampoSePrecisar('NOTAS_FISCAIS','BASE_CALCULO_PIS',vString);

   vString  := ' ALTER TABLE PRODUTOS ';
   vString := vString + 'ADD UNIDADE  VARCHAR(5)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('PRODUTOS','UNIDADE',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD NUMERO_BASE_CALCULO_ICMS  INTEGER';
   CriarCampoSePrecisar('NOTAS_FISCAIS','NUMERO_BASE_CALCULO_ICMS',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD NUMERO_BASE_CALCULO_ICMS_ST  INTEGER';
   CriarCampoSePrecisar('NOTAS_FISCAIS','NUMERO_BASE_CALCULO_ICMS_ST',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD NUMERO_PROTOCOLO_CANCELAMENTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('NOTAS_FISCAIS','NUMERO_PROTOCOLO_CANCELAMENTO',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD DATA_HORA_CANCELAMENTO VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('NOTAS_FISCAIS','DATA_HORA_CANCELAMENTO',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD MOTIVO_CANCELAMENTO VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('NOTAS_FISCAIS','MOTIVO_CANCELAMENTO',vString);

   //Cartas de corrção
   vString := 'CREATE TABLE CARTAS_DE_CORRECAO (';
   vString := vString + ' ID_CARTA_DE_CORRECAO   INTEGER NOT NULL ,';
   vString := vString + ' TEXTO_CARTA_CORRECAO   VARCHAR(1000)  CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' DATA_HORA              VARCHAR(255)  CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' NUMERO_PROTOCOLO       VARCHAR(255)  CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' MOTIVO                 VARCHAR(255)  CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' CHAVE                  VARCHAR(44)  CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('CARTAS_DE_CORRECAO',vString);

   vString := 'ALTER TABLE CARTAS_DE_CORRECAO ';
   vString := vString + ' ADD CONSTRAINT PK_ID_CARTA_DE_CORRECAO PRIMARY KEY (ID_CARTA_DE_CORRECAO) ';
   vString := vString + ' USING INDEX PK_ID_CARTA_DE_CORRECAO  ';
   CriarChavePrimariaSePrecisar('CARTAS_DE_CORRECAO','(ID_CARTA_DE_CORRECAO)',vString);

   vString  := ' CREATE GENERATOR NOVA_CARTA_DE_CORRECAO ';
   vString2 := 'NOVA_CARTA_DE_CORRECAO TO 0';
   CriarGeneratorSePrecisar('NOVA_CARTA_DE_CORRECAO',vString,vString2);
   //
   //Criando tabela de almoxarifado
   vString := 'CREATE TABLE ALMOXARIFADOS (';
   vString := vString + ' ID_ALMOXARIFADO   INTEGER NOT NULL ,';
   vString := vString + ' DESCRICAO   VARCHAR(255)  CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' PERMITE_TRANSFERENCIA              VARCHAR(1)  CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('ALMOXARIFADOS',vString);

   vString := 'ALTER TABLE ALMOXARIFADOS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_ALMOXARIFADO PRIMARY KEY (ID_ALMOXARIFADO) ';
   vString := vString + ' USING INDEX PK_ID_ALMOXARIFADO  ';
   CriarChavePrimariaSePrecisar('ALMOXARIFADOS','(ID_ALMOXARIFADO)',vString);

   vString  := ' CREATE GENERATOR NOVO_ALMOXARIFADO ';
   vString2 := 'NOVO_ALMOXARIFADO TO 0';
   CriarGeneratorSePrecisar('NOVO_ALMOXARIFADO',vString,vString2);

   //pRODUTOS ALMOXARIFADOS
   vString := 'CREATE TABLE PRODUTOS_X_ALMOXARIFADOS (';
   vString := vString + ' ID_PRODUTO_X_ALMOXARIFADO   INTEGER NOT NULL ,';
   vString := vString + ' ID_ALMOXARIFADO   INTEGER NOT NULL ,';
   vString := vString + ' ID_PRODUTO   INTEGER NOT NULL ,';
   vString := vString + ' DESCRICAO   VARCHAR(255)  CHARACTER SET ISO8859_1 COLLATE PT_PT, ';
   vString := vString + ' SALDO NUMERIC(15,2) ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('PRODUTOS_X_ALMOXARIFADOS',vString);

   vString := 'ALTER TABLE PRODUTOS_X_ALMOXARIFADOS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_PRODUTO_X_ALMOXARIFADO PRIMARY KEY (ID_PRODUTO_X_ALMOXARIFADO) ';
   vString := vString + ' USING INDEX PK_ID_PRODUTO_X_ALMOXARIFADO  ';
   CriarChavePrimariaSePrecisar('PRODUTOS_X_ALMOXARIFADOS','(ID_PRODUTO_X_ALMOXARIFADO)',vString);

   vString  := ' CREATE GENERATOR NOVO_PRODUTO_X_ALMOXARIFADO ';
   vString2 := 'NOVO_PRODUTO_X_ALMOXARIFADO TO 0';
   CriarGeneratorSePrecisar('NOVO_PRODUTO_X_ALMOXARIFADO',vString,vString2);
   //MOVIMENTACAO_ALMOXARIFADO
   vString := 'CREATE TABLE MOVIMENTACOES_ALMOXARIFADOS ( ';
   vString := vString + ' ID_MOVIMENTACAO_ALMOXARIFADO   INTEGER NOT NULL, ';
   vString := vString + ' ID_PRODUTO                     INTEGER  ,';
   vString := vString + ' ID_ALMOXARIFADO                INTEGER  ,';
   vString := vString + ' DATA                           DATE,';
   vString := vString + ' HORA                           TIME,';
   vString := vString + ' QTDE_ANTERIOR                  NUMERIC(15,2),';
   vString := vString + ' QTDE_MOVIMENTADA               NUMERIC(15,2),';
   vString := vString + ' QTDE_APOS_MOVIMENTACAO         NUMERIC(15,2),';
   vString := vString + ' TIPO_MOVIMENTACAO              VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + ' ID_NOTA_FISCAL                 INTEGER ,';
   vString := vString + ' ID_PEDIDO                      INTEGER ,';
   vString := vString + ' ID_PEDIDO_DE_COMPRA            INTEGER ,';
   vString := vString + ' ID_NOTA_FISCAL_ENTRADA         INTEGER ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('MOVIMENTACOES_ALMOXARIFADOS',vString);

   vString := 'ALTER TABLE MOVIMENTACOES_ALMOXARIFADOS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_MOVIMENTACAO_ALMOX PRIMARY KEY (ID_MOVIMENTACAO_ALMOXARIFADO) ';
   vString := vString + ' USING INDEX PK_ID_MOVIMENTACAO_ALMOX  ';
   CriarChavePrimariaSePrecisar('MOVIMENTACOES_ALMOXARIFADOS','(ID_MOVIMENTACAO_ALMOXARIFADO)',vString);

   vString  := ' CREATE GENERATOR NOVA_MOVIMENTACAO_ALMOXARIFADO ';
   vString2 := 'NOVA_MOVIMENTACAO_ALMOXARIFADO TO 0';
   CriarGeneratorSePrecisar('NOVA_MOVIMENTACAO_ALMOXARIFADO',vString,vString2);
   //FIM DAS TABELAS DOS ALMOXARIFADO
   //**
   vString  := ' ALTER TABLE NOTAS_FISCAIS_ITENS ';
   vString := vString + 'ADD DESCRICAO_PRODUTO_XML  VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('NOTAS_FISCAIS_ITENS','DESCRICAO_PRODUTO_XML',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD NOME_FORNECEDOR  VARCHAR(255) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('NOTAS_FISCAIS','NOME_FORNECEDOR',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD ID_FORNECEDOR INTEGER';
   CriarCampoSePrecisar('NOTAS_FISCAIS','ID_FORNECEDOR',vString);

   vString  := ' ALTER TABLE NOTAS_FISCAIS ';
   vString := vString + 'ADD STATUS  VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('NOTAS_FISCAIS','STATUS',vString);

   //++++++++++++++++++++++++++++++++++
   vString := 'CREATE TABLE COMANDAS ( ';
   vString := vString + ' ID_COMANDA  INTEGER NOT NULL, ';
   vString := vString + ' NUMERO_COMANDA VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT ';
   vString := vString + ') ';
   CriarTabelaSePrecisar('COMANDAS',vString);

   vString := 'ALTER TABLE COMANDAS ';
   vString := vString + ' ADD CONSTRAINT PK_ID_COMANDA PRIMARY KEY (ID_COMANDA) ';
   vString := vString + ' USING INDEX PK_ID_COMANDA  ';
   CriarChavePrimariaSePrecisar('COMANDAS','(ID_COMANDA)',vString);

   vString  := ' CREATE GENERATOR NOVA_COMANDA ';
   vString2 := 'NOVA_COMANDA TO 0';
   CriarGeneratorSePrecisar('NOVA_COMANDA',vString,vString2);
   //++++++++++++++++++++++++++++++++++
   vString  := ' ALTER TABLE PEDIDOS ';
   vString := vString + 'ADD NUMERO_COMANDA VARCHAR(100) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('PEDIDOS','NUMERO_COMANDA',vString);

   vString  := ' ALTER TABLE PEDIDOS ';
   vString := vString + 'ADD PEDIDO_EM_VENDA VARCHAR(1) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('PEDIDOS','PEDIDO_EM_VENDA',vString);

   vString  := ' ALTER TABLE PRODUTOS ';
   vString := vString + 'ADD CFOP VARCHAR(4) CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('PRODUTOS','CFOP',vString);

   //CRIANDO TABELA DE ALIQUOTAS
   vString := 'CREATE TABLE ALIQUOTAS ( ';
   vString := vString + '  ID_ALIQUOTA    INTEGER NOT NULL,';
   vString := vString + '  ALIQUOTA       VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + '  ICMS           SMALLINT , ';
   vString := vString + '  ISS            SMALLINT,';
   vString := vString + '  ISENTO         SMALLINT,';
   vString := vString + '  ICMS_ST        SMALLINT,';
   vString := vString + '  NAO_TRIBUTADO  SMALLINT,';
   vString := vString + '  TIPO_ALIQUOTA  VARCHAR(10) CHARACTER SET ISO8859_1 COLLATE PT_PT,';
   vString := vString + '  ATUALIZADO     SMALLINT';
   vString := vString + ') ';
   CriarTabelaSePrecisar('ALIQUOTAS',vString);

   vString := 'ALTER TABLE ALIQUOTAS ';
   vString := vString + ' ADD CONSTRAINT PK_ALIQUOTA PRIMARY KEY (ID_ALIQUOTA) ';
   vString := vString + ' USING INDEX PK_ALIQUOTA  ';
   CriarChavePrimariaSePrecisar('ALIQUOTAS','(ID_ALIQUOTA)',vString);

   vString  := ' CREATE GENERATOR NOVA_ALIQUOTA ';
   vString2 := 'NOVA_ALIQUOTA TO 0';
   CriarGeneratorSePrecisar('NOVA_ALIQUOTA',vString,vString2);
   //FIM TABELA ALIQUOTAS

   vString  := ' ALTER TABLE PEDIDOS ';
   vString := vString + 'ADD NUMEROCUPOMFISCAL  VARCHAR(255)  CHARACTER SET ISO8859_1 COLLATE PT_PT';
   CriarCampoSePrecisar('PEDIDOS','NUMEROCUPOMFISCAL',vString);




   MessageDlg('Atualização do Banco'+#13+
              'realizada com sucesso',mtInformation,[mbOK],0);
end;

procedure TfrmPrincipal.spbAlterarPortaClick(Sender: TObject);
var
  I,X : integer;
  F,G:TextFile;
  vLinhao:string;
  vMatriz : Array [1..10] of string;
  vAtualizar : boolean;
begin
  if edtNovaPorta.Text = '' then
  begin
    MessageDlg('Por favor, informe o numero da nova porta.',mtError,[mbok],0);
    abort;
  end;
  vAtualizar := True;
  //Verifica se existe alguém usando o sistema
  if DSModuleDb.SQLConexao.ActiveStatements > 0 then
  begin
    showmessage('O sistema não poderá efetuar a troca da '+#13+
                'porta agora,pois no momento'+#13+
                'existem comandos sendo executados no banco.'+#13+
                'O sistema adotará este endereço na próxima'+#13+
                'inicialização do sistema.');
    vAtualizar := False;
  end;

  I := 0;
  X := 0;
  if FileExists('.\ConfiguracoesServidor.ini') then
  begin
    AssignFile(F,'.\ConfiguracoesServidor.ini');
    AssignFile(G,'.\ConfiguracoesServidor.ini');
    Reset(F);
    Reset(G);
    while not Eof(F) do
    begin
      Inc(I);
      Inc(X);
      Readln(F,vLinhao);
      vMatriz[I] := vLinhao;
    end;
    CloseFile(F);
    Rewrite(G);
    I := 1;
    while I <= X do
    begin
      vLinhao := '';
      if I = 1 then
      begin
        if vAtualizar then
        begin
          frmSplash.DSServer1.Stop;
          frmSplash.DSTCPServerTransport1.Port := StrToInt(edtNovaPorta.Text);
        end;
        try
          if vAtualizar then
            frmSplash.DSServer1.Start;
          frmSplash.pPorta := edtNovaPorta.Text;
          writeln(G,edtNovaPorta.Text);
          showmessage('Substituição efetuada com exito');
          edtPortaAtual.Text := edtNovaPorta.Text;
          edtNovaPorta.Text := '';
        except
          showmessage('Não foi possível efetuar alteração');
          exit;
        end;
      end
      else
      begin
        Writeln(G,vMatriz[I]);
      end;
      Inc(I);
    end;
    CloseFile(G);
  end;
end;

procedure TfrmPrincipal.spbCadastrarComandaClick(Sender: TObject);
var
  vNumeroComanda : string;
  vIdComanda : Integer;
begin
  vNumeroComanda := InputBox('Cadastro de comandas','Informe o numero da comanda','');
  DSModuleDb.cdsComandas.Filtered := False;
  DSModuleDb.cdsComandas.Filter := ' NUMERO_COMANDA = '+ vNumeroComanda;
  DSModuleDb.cdsComandas.Filtered := True;
  if DSModuleDb.cdsComandasNUMERO_COMANDA.AsString = '' then
  begin
  DSModuleDb.cdsComandas.Append;
  vIdComanda := DSModuleDb.GeneratorIncrementado('NOVA_COMANDA');
  DSModuleDb.cdsComandasID_COMANDA.Value := vIdComanda;
  DSModuleDb.cdsComandasNUMERO_COMANDA.Value := vNumeroComanda;
  DSModuleDb.cdsComandas.Post;
  DSModuleDb.cdsComandas.ApplyUpdates(0);
  DSModuleDb.cdsComandas.Close;
  DSModuleDb.cdsComandas.Open;
  DSModuleDb.cdsComandas.Locate('ID_COMANDA',vIdComanda,[]);
  end
  else
  begin
    MessageDlg('Esta comanda já esta cadastrada',mtError,[mbOK],0);
    DSModuleDb.cdsComandas.Filtered := False;
    DSModuleDb.cdsComandas.Close;
    DSModuleDb.cdsComandas.Open;
  end;
end;

procedure TfrmPrincipal.spbCancelarComandaClick(Sender: TObject);
var
  vNumeroComanda : string;
  vIdComanda : Integer;
begin
  vNumeroComanda := InputBox('Cancelamento de comandas','Informe o numero da comanda','');
  DSModuleDb.cdsComandas.Filtered := False;
  DSModuleDb.cdsComandas.Filter := ' NUMERO_COMANDA = '+ vNumeroComanda;
  DSModuleDb.cdsComandas.Filtered := True;
  if DSModuleDb.cdsComandasNUMERO_COMANDA.AsString <> '' then
  begin
  DSModuleDb.cdsComandas.Delete;
  DSModuleDb.cdsComandas.ApplyUpdates(0);
  DSModuleDb.cdsComandas.Close;
  DSModuleDb.cdsComandas.Open;
  end
  else
  begin
    MessageDlg('Esta comanda não esta cadastrada',mtError,[mbOK],0);
    DSModuleDb.cdsComandas.Filtered := False;
    DSModuleDb.cdsComandas.Close;
    DSModuleDb.cdsComandas.Open;
  end;
end;

procedure TfrmPrincipal.spbCarregarPermissaoClick(Sender: TObject);
const
  aPermissoes : array [1..13] of string = ('ALTERAR PRECO VENDA PDV','ALTERAR PRECO VENDA CAIXA','INSERIR PRODUTO','EXCLUIR PRODUTO',
                                          'MOVIMENTAR PRODUTO','VISUALIZAR PDV','VISUALIZAR CAIXA','VISUALIZAR PRODUTO',
                                          'VISUALIZAR CONSULTA DE VENDA','VISUALIZAR CONFIGURACOES',
                                          'UTILIZAR CAIXA','VISUALIZAR AGENDA','INSERIR AGENDAMENTO');
var
  vMinhaQueryPermissoes,vMinhaquery : TSQLQuery;
  Transacao : TTransactionDesc;
  qString : string;
  vIdentificador,I : integer;
begin
  vMinhaQueryPermissoes := TSQLQuery.Create(nil);
  vMinhaQueryPermissoes.SQLConnection := DSModuleDb.SQLConexao;

  vMinhaQuery := TSQLQuery.Create(nil);
  vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
  for I := 1 to Length(aPermissoes) do
  begin
    with vMinhaQueryPermissoes do
    begin
      Close;
      CommandText := 'SELECT ID_PERMISSAO_USUARIO_SISTEMA FROM PERMISSOES_USUARIOS_SISTEMA '+
                     'WHERE PERMISSAO =:PERMISSAO';
      Parambyname('PERMISSAO').Value := aPermissoes[I];
      Open;
    end;
    if vMinhaQueryPermissoes.FieldByName('ID_PERMISSAO_USUARIO_SISTEMA').AsInteger = 0 then
    begin
      qString := '';
      qString := 'INSERT INTO PERMISSOES_USUARIOS_SISTEMA(ID_PERMISSAO_USUARIO_SISTEMA, PERMISSAO)'+
                 'VALUES                                (:ID_PERMISSAO_USUARIO_SISTEMA,:PERMISSAO)';
      with vMinhaQuery do
      begin
        Close;
        CommandText := qString;
        ParamByName('ID_PERMISSAO_USUARIO_SISTEMA').Value := DSModuleDb.GeneratorIncrementado('NOVA_PERMISSAO_USUARIO_SISTEMA');
        ParamByName('PERMISSAO').Value := aPermissoes[I];
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
  end;
  DSModuleDb.cdsPermissoesUsuariosSistema.Close;
  DSModuleDb.cdsPermissoesUsuariosSistema.Open;
  FreeAndNil(vMinhaQueryPermissoes);
  FreeAndNil(vMinhaQuery);
end;

procedure TfrmPrincipal.spbEfetuarAlteracaoClick(Sender: TObject);
var
  Dialog : TOpenDialog;
begin
  lblNovoEndereco.Visible := True;
  edtNovoEnereco.Visible := True;
  spbEfetuarAlteracao.Enabled := False;
  Dialog := TOpenDialog.Create(Self);
  if not Dialog.Execute then
    abort;
  edtNovoEnereco.Text := Dialog.FileName;
  spbSalvarEndereco.Enabled := True;
  FreeAndNil(Dialog);

end;

procedure TfrmPrincipal.spbInformacoesExecutavelClick(Sender: TObject);
begin
  showmessage('Executável localizado em : '+ExtractFilePath(Application.ExeName));
end;

end.
