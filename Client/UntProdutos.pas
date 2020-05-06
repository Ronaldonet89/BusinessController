unit UntProdutos;

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
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, cxButtons,
  Vcl.Mask, Vcl.DBCtrls, dxSkinsForm, cxContainer, cxLabel, cxDBNavigator,
  Vcl.Samples.Gauges, UITypes;

type
  TfrmProdutos = class(TForm)
    AppBar: TPanel;
    CloseButton: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    GestureManager1: TGestureManager;
    cxpcProdutos: TcxPageControl;
    cxtsPrincipal: TcxTabSheet;
    Panel3: TPanel;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    DBEdit1: TDBEdit;
    dbeDescricaoProduto: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEEan13: TDBEdit;
    DBEDescricaoGrupo: TDBEdit;
    cxBtnCapturarGrupo: TcxButton;
    DBGridGrupoProdutos: TDBGrid;
    Image1: TImage;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxtsMovimentacoes: TcxTabSheet;
    cxGridMovimentacoes: TcxGrid;
    cxGridMovimentacoesDBTableView1: TcxGridDBTableView;
    cxGridMovimentacoesDBTableView1ID_MOVIMENTACAO: TcxGridDBColumn;
    cxGridMovimentacoesDBTableView1ID_PEDIDO: TcxGridDBColumn;
    cxGridMovimentacoesDBTableView1ID_PRODUTO: TcxGridDBColumn;
    cxGridMovimentacoesDBTableView1DATA: TcxGridDBColumn;
    cxGridMovimentacoesDBTableView1HORA: TcxGridDBColumn;
    cxGridMovimentacoesDBTableView1QTDE_ANTERIOR: TcxGridDBColumn;
    cxGridMovimentacoesDBTableView1QTDE_MOVIMENTADA: TcxGridDBColumn;
    cxGridMovimentacoesDBTableView1QTDE_APOS_MOVIMENTACAO: TcxGridDBColumn;
    cxGridMovimentacoesDBTableView1TIPO_MOVIMENTACAO: TcxGridDBColumn;
    cxGridMovimentacoesLevel1: TcxGridLevel;
    cxGrid1DBTableView1PRO_ID: TcxGridDBColumn;
    cxGrid1DBTableView1PRO_DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1PRO_CODIGO: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxNavigator1: TcxNavigator;
    DBEdit8: TDBEdit;
    cxLabel11: TcxLabel;
    cxBtnEntrada: TcxButton;
    cxBtnSaida: TcxButton;
    cxBtnEntradaSobFiltro: TcxButton;
    Gauge1: TGauge;
    lblOrigemMercadoria: TcxLabel;
    cxLabel9: TcxLabel;
    dbedtCODIGO_NCM: TDBEdit;
    cxLabel10: TcxLabel;
    dbedtPRO_EAN13: TDBEdit;
    BtImportar: TcxButton;
    cxLabel12: TcxLabel;
    DBEdit4: TDBEdit;
    DBEdit9: TDBEdit;
    cxLabel14: TcxLabel;
    cxLabel13: TcxLabel;
    DBEdit7: TDBEdit;
    cxLabel15: TcxLabel;
    DBEdit10: TDBEdit;
    cxLabel16: TcxLabel;
    DBEdit11: TDBEdit;
    procedure CloseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);

    procedure BackToMainForm(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure DBGridGrupoProdutosDblClick(Sender: TObject);
    procedure cxBtnCapturarGrupoClick(Sender: TObject);
    procedure cxNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure DBEdit1Change(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure cxBtnEntradaClick(Sender: TObject);
    procedure cxBtnSaidaClick(Sender: TObject);
    procedure cxBtnEntradaSobFiltroClick(Sender: TObject);
    procedure BtImportarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AppBarResize;
    procedure AppBarShow(mode: integer);
    procedure LocalizarMovimentacao(qIdProduto:integer);
    procedure localizarMateriaPrima(qIdProduto:integer);
    procedure ImportarCSV(Arquivo:string);
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses SplitItemDetail1, GroupedItems1, UDataModul, UntConectaServidor, UntLookUp,
  UntLookUpProdutos, ULogin;


const
  AppBarHeight = 75;

procedure TfrmProdutos.AppBarResize;
begin
  AppBar.SetBounds(0, AppBar.Parent.Height - AppBarHeight,
    AppBar.Parent.Width, AppBarHeight);
end;

procedure TfrmProdutos.AppBarShow(mode: integer);
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

procedure TfrmProdutos.Action1Execute(Sender: TObject);
begin
  AppBarShow(-1);
end;

procedure TfrmProdutos.CloseButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmProdutos.cxBtnCapturarGrupoClick(Sender: TObject);
begin
  if not (DM.cdsProdutos.State in [dsEdit,dsInsert]) then
    abort;
  DM.cdsGruposProdutos.Close;
  DM.cdsGruposProdutos.Open;
  DM.cdsGruposProdutos.Filtered := False;
  DBGridGrupoProdutos.Visible := True;
end;

procedure TfrmProdutos.cxButton1Click(Sender: TObject);
begin
  if dm.cdsProdutosMateriasPrimas.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(FrmLookUpProdutos) then
      FrmLookUpProdutos := TFrmLookUpProdutos.Create(Self);
    FrmLookUpProdutos.Left := Trunc(Screen.Width / 2) - 200;
    FrmLookUpProdutos.Top := Trunc(Screen.Height / 2) - 200;
    FrmLookUpProdutos.cxGrid1DBTableView1.DataController.DataSource := dm.dsProdutos;
    FrmLookUpProdutos.vContinua := true;
    if not dm.cdsProdutos.Active then
      dm.cdsProdutos.Active := True;
    FrmLookUpProdutos.ShowModal;

    dm.cdsProdutosMateriasPrimasID_MATERIA_PRIMA.AsInteger := dm.cdsProdutosPRO_ID.AsInteger;
    dm.cdsProdutosMateriasPrimasDESCRICAO_MATERIA_PRIMA.AsString := dm.cdsProdutosPRO_DESCRICAO.AsString;
  end;
end;

procedure TfrmProdutos.cxBtnEntradaClick(Sender: TObject);
var
  vConectaServidor : TDSModuleDbClient;
  Valor : Real;
  vIdentificador : integer;
begin
  try
    Valor := StrToFloat(Inputbox('Entrada por produto','Digite o valor',''));
  except
    MessageDlg('O valor digitado é inválido',mtError,[mbOK],0);
    abort;
  end;
  if Valor > 0 then
  begin
    vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    if vConectaServidor.InserirEmMovimentacoes(DM.cdsProdutosPRO_ID.AsInteger,0,Valor,'Entrada','E') = 0 then
    begin
      MessageDlg('Não foi possível efetuar entrada deste produto.',mtError,[mbOK],0);
      FreeAndNil(vConectaServidor);
      abort;
    end
    else
    begin
      vIdentificador := DM.cdsProdutosPRO_ID.AsInteger;
      DM.cdsProdutos.DisableControls;
      DM.cdsProdutos.Close;
      DM.cdsProdutos.Open;
      DM.cdsProdutos.Locate('PRO_ID',vIdentificador,[]);
      DM.cdsProdutos.EnableControls;
      DM.cdsMovimentacoes.Close;
      DM.cdsMovimentacoes.Open;
      DM.cdsMovimentacoes.Filtered := False;
      DM.cdsMovimentacoes.Filter := 'ID_PRODUTO = '+ IntToStr(vIdentificador);
      DM.cdsMovimentacoes.Filtered := True;
      DM.cdsMovimentacoes.Active := True;
      FreeAndNil(vConectaServidor);
      MessageDlg('Entrada realizada com êxito.',mtConfirmation,[mbOK],0);
    end;
  end
  else
  begin
    MessageDlg('O valor digitado não pode ser menor ou igual a zero.',mtError,[mbOK],0);
  end;
end;

procedure TfrmProdutos.cxBtnEntradaSobFiltroClick(Sender: TObject);
var
  vConectaServidor : TDSModuleDbClient;
  Valor : Real;
  vIdentificador : integer;
begin
  try
    Valor := StrToFloat(Inputbox('Entrada por produto sob filtro atual','Digite a quantidade',''));
  except
    MessageDlg('O quantidade digitada é inválida',mtError,[mbOK],0);
    abort;
  end;
  if Valor > 0 then
  begin
    vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    DM.cdsProdutos.DisableControls;
    dm.cdsProdutos.First;
    Gauge1.Visible := true;
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := dm.cdsProdutos.RecordCount;
    vIdentificador := 0;
    Screen.Cursor := crHourGlass;
    while not dm.cdsProdutos.Eof do
    begin
      if vConectaServidor.InserirEmMovimentacoes(DM.cdsProdutosPRO_ID.AsInteger,0,Valor,'Entrada','E') = 0 then
      begin
        MessageDlg('Não foi possível efetuar entrada deste produto.',mtError,[mbOK],0);
        FreeAndNil(vConectaServidor);
        Gauge1.Visible := False;
        DM.cdsProdutos.EnableControls;
        Screen.Cursor := crDefault;
        abort;
      end;
      Inc(vIdentificador);
      Gauge1.Progress := vIdentificador;
      Application.ProcessMessages;
      dm.cdsProdutos.Next;
    end;
    Screen.Cursor := crDefault;
    DM.cdsProdutos.Close;
    DM.cdsProdutos.Open;
    DM.cdsProdutos.First;
    DM.cdsProdutos.EnableControls;
    DM.cdsMovimentacoes.Close;
    DM.cdsMovimentacoes.Open;
    DM.cdsMovimentacoes.Filtered := False;
    DM.cdsMovimentacoes.Filter := 'ID_PRODUTO = '+ IntToStr(dm.cdsProdutosPRO_ID.AsInteger);
    DM.cdsMovimentacoes.Filtered := True;
    DM.cdsMovimentacoes.Active := True;
    FreeAndNil(vConectaServidor);
    Gauge1.Visible := False;
    MessageDlg('Entrada realizada com êxito.',mtConfirmation,[mbOK],0);
  end
  else
  begin
    MessageDlg('O valor digitado não pode ser menor ou igual a zero.',mtError,[mbOK],0);
  end;
end;



procedure TfrmProdutos.ImportarCSV(Arquivo:string);
var
  ArquivoCSV: TextFile;
  Contador, I: Integer;
  Linha: String;
  Lista: TStringList;
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
    result := dm.semchar( ValorMontado);
  end;
begin
  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, Arquivo);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    Lista:= TStringList.Create;
    Lista.LoadFromFile(Arquivo);

    Contador := 1;

    Gauge1.Visible := true;
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := Lista.Count ;

    try
      while not Eoln(ArquivoCSV) do
      begin
        Dm.cdsGenerico.Close;
        DM.cdsGenerico.CommandText := 'INSERT INTO ESTOQUES (CODIGO, PRODUTO, COR, TAMANHO, QTDE, PROMO, VALOR)' +
        ' VALUES ('+QuotedStr(Copy(MontaValor,1,50))+','+QuotedStr(copy(MontaValor,1,200))+','+QuotedStr(copy(MontaValor,1,50))+','+
        QuotedStr(copy(MontaValor,1,80))+','+ QuotedStr(copy(MontaValor,1,20))+','+ QuotedStr(copy(MontaValor,1,30))+','+ QuotedStr(copy(MontaValor,1,30))+')';
        DM.cdsGenerico.Execute;
        Readln(ArquivoCSV, Linha);
        Contador := Contador + 1;
        Gauge1.Progress := Contador;
      end;
    except
      MessageDlg('Não foi possivel importar, excessão na linha !'+Inttostr(Contador), mtError,[mbYes],0);
      exit;
    end;

    try
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'INSERT INTO PRODUTOS P '+
        '(PRO_ID, PRO_CODIGO, PRO_DESCRICAO, PRO_SALDO, PRECO_VENDA, UNIDADE, COR, TAMANHO, PROMO,ORIGEM_MERCADORIA) '+
        ' SELECT GEN_ID(NOVO_PRODUTO, 1), CODIGO, PRODUTO, CAST(QTDE AS NUMERIC) QTDE, '+
        '        CAST(REPLACE(REPLACE(VALOR,''.'',''''),'','',''.'') AS NUMERIC(15,2)) VALOR, ''PC'', COR, TAMANHO, PROMO,''0'' '+
        '   FROM ESTOQUES E'+
        '  WHERE NOT EXISTS(SELECT 1 FROM PRODUTOS WHERE PRO_CODIGO = CODIGO AND E.COR = P.COR AND E.TAMANHO = P.TAMANHO)';

      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'UPDATE PRODUTOS P '+
       'SET P.PRO_SALDO = (SELECT CAST(QTDE AS NUMERIC) '+
                           ' FROM ESTOQUES E '+
                          ' WHERE E.CODIGO = P.PRO_CODIGO '+
                           '  AND E.COR = P.COR '+
                           '  AND E.TAMANHO = P.TAMANHO)';
      DM.cdsGenerico.Execute;
      MessageDlg('Arquivo foi importado com sucesso!', mtInformation,[mbYes],0);
    except
      MessageDlg('Não foi possível importar tabela de produtos!', mtError,[mbYes],0);
      exit;
    end;
  finally
    Gauge1.Visible := false;
    CloseFile(ArquivoCSV);
  end;
end;

procedure TfrmProdutos.cxBtnSaidaClick(Sender: TObject);
var
  vConectaServidor : TDSModuleDbClient;
  Valor : Real;
  vIdentificador : integer;
begin
  try
    Valor := StrToFloat(Inputbox('Saída por produto','Digite o valor',''));
  except
    MessageDlg('O valor digitado é inválido',mtError,[mbOK],0);
    abort;
  end;
  if Valor > 0 then
  begin
    vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    if vConectaServidor.InserirEmMovimentacoes(DM.cdsProdutosPRO_ID.AsInteger,0,Valor,'Saída','S') = 0 then
    begin
      MessageDlg('Não foi possível efetuar saída deste produto.',mtError,[mbOK],0);
      FreeAndNil(vConectaServidor);
      abort;
    end
    else
    begin
      vIdentificador := DM.cdsProdutosPRO_ID.AsInteger;
      DM.cdsProdutos.DisableControls;
      DM.cdsProdutos.Close;
      DM.cdsProdutos.Open;
      DM.cdsProdutos.Locate('PRO_ID',vIdentificador,[]);
      DM.cdsProdutos.EnableControls;
      DM.cdsMovimentacoes.Filtered := False;
      DM.cdsMovimentacoes.Filter := 'ID_PRODUTO = '+ IntToStr(vIdentificador);
      DM.cdsMovimentacoes.Filtered := True;
      DM.cdsMovimentacoes.Active := True;
      FreeAndNil(vConectaServidor);
      MessageDlg('Saída realizada com êxito.',mtError,[mbOK],0);
    end;
  end
  else
  begin
    MessageDlg('O valor digitado não pode ser menor ou igual a zero.',mtError,[mbOK],0);
  end;
end;

procedure TfrmProdutos.cxButton3Click(Sender: TObject);
var
  Dialog : TOpenDialog;
begin
  if DM.cdsProdutos.RecordCount = 0 then
    abort;
  Dialog := TOpenDialog.Create(Self);
  if not Dialog.Execute then
    abort;

  DM.cdsProdutos.Edit;
  DM.cdsProdutosPRO_CAMINHO_IMAGEM.AsString := Dialog.FileName;
  DM.cdsProdutos.Post;
  try
    DM.cdsProdutos.ApplyUpdates(0);
    Image1.Picture.LoadFromFile(Dialog.FileName);
    FreeAndNil(Dialog);
    Image1.Visible := True;
  except
    MessageDlg('Não foi possível efetuar o armazenamento desta imagem',
              mtError,[mbYes],0);
  end;
end;

procedure TfrmProdutos.cxButton4Click(Sender: TObject);
begin
  if DM.cdsProdutos.RecordCount = 0 then
    abort;

  if MessageDlg('Deseja realmente apagar esta imagem ?',mtInformation,
                [mbyes,mbNo],0)= mrYes then
  begin
    DM.cdsProdutos.Edit;
    DM.cdsProdutosPRO_CAMINHO_IMAGEM.AsString := '';
    DM.cdsProdutos.Post;
    try
      DM.cdsProdutos.ApplyUpdates(0);
      Image1.Visible := False;
  except
      MessageDlg('Não foi possível imagem',
                mtError,[mbYes],0);
    end;
  end;
end;

procedure TfrmProdutos.cxDBNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex = 6 then
  begin
  end;
end;

procedure TfrmProdutos.cxNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  {
  if (AButtonIndex =0 ) or (AButtonIndex =1 ) or (AButtonIndex =2 ) or
     (AButtonIndex =3 ) or (AButtonIndex =4 ) or (AButtonIndex =5 )  then
  begin
    if DM.cdsProdutosPRO_CAMINHO_IMAGEM.AsString = '' then
      Image1.Visible := False
    else
    begin
      Image1.Visible := True;
      try
        Image1.Picture.LoadFromFile(DM.cdsProdutosPRO_CAMINHO_IMAGEM.AsString);
      except

      end;
    end;
    DM.cdsGruposProdutos.Filtered := False;
    DM.cdsGruposProdutos.Filter := 'ID_GRUPO_PRODUTO = '+ IntToStr(DM.cdsProdutosID_GRUPO_PRODUTO.AsInteger);
    DM.cdsGruposProdutos.Filtered := True;
    DM.cdsGruposProdutos.Active := True;
    LocalizarMovimentacao(dm.cdsProdutosPRO_ID.AsInteger);
  end;}
      //Edit                //Insert
  if (AButtonIndex = 6) or (AButtonIndex = 9) then
    cxBtnCapturarGrupo.Enabled := True
  else //Post                      //Cancel
  if (AButtonIndex = 10) or (AButtonIndex = 11) then
  begin
    cxBtnCapturarGrupo.Enabled := False;
    if DBGridGrupoProdutos.Visible then
      DBGridGrupoProdutos.Visible := False;

  end;
end;

procedure TfrmProdutos.DBEdit1Change(Sender: TObject);
begin
  if DM.cdsProdutosPRO_CAMINHO_IMAGEM.AsString = '' then
      Image1.Visible := False
  else
  begin
    Image1.Visible := True;
    try
      Image1.Picture.LoadFromFile(DM.cdsProdutosPRO_CAMINHO_IMAGEM.AsString);
    except
    end;
  end;
  DM.cdsGruposProdutos.Filtered := False;
  DM.cdsGruposProdutos.Filter := 'ID_GRUPO_PRODUTO = '+ IntToStr(DM.cdsProdutosID_GRUPO_PRODUTO.AsInteger);
  DM.cdsGruposProdutos.Filtered := True;
  DM.cdsGruposProdutos.Active := True;
  LocalizarMovimentacao(dm.cdsProdutosPRO_ID.AsInteger);
  localizarMateriaPrima(dm.cdsProdutosPRO_ID.AsInteger);
  if dm.cdsProdutosORIGEM_MERCADORIA.AsString <> '' then
  begin
    case StrToInt(dm.cdsProdutosORIGEM_MERCADORIA.AsString) of
      0: lblOrigemMercadoria.Caption := 'Nacional, exceto as indicadas nos códigos 3 a 5';
      1: lblOrigemMercadoria.Caption := 'Estrangeira - Importação direta, exceto a indicada no código 6';
      2: lblOrigemMercadoria.Caption := 'Estrangeira - Adquirida no mercado interno, exceto a indicada no código 7';
      3: lblOrigemMercadoria.Caption := 'Nacional, mercadoria ou bem com Conteúdo de Importação superior a 40% (quarenta por cento)';
      4: lblOrigemMercadoria.Caption := 'Nacional, cuja produção tenha sido feita em conformidade com os processos produtivos básicos de que tratam '+
         'o Decreto-Lei nº 288/67, e as Leis nºs 8.248/91, 8.387/91, 10.176/01 e 11 . 4 8 4 / 0 7';
      5: lblOrigemMercadoria.Caption := 'Nacional, mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40% (quarenta por cento)';
      6: lblOrigemMercadoria.Caption := 'Estrangeira - Importação direta, sem similar nacional, constante em lista de Resolução CAMEX';
      7: lblOrigemMercadoria.Caption := 'Estrangeira - Adquirida no mercado interno, sem similar nacional, constante em lista de Resolução CAMEX”';
    end;
  end
  else
    lblOrigemMercadoria.Caption := '';
end;

procedure TfrmProdutos.DBEdit8Change(Sender: TObject);
begin
  if dm.cdsProdutosORIGEM_MERCADORIA.AsString <> '' then
  begin
    case StrToInt(dm.cdsProdutosORIGEM_MERCADORIA.AsString) of
      0: lblOrigemMercadoria.Caption := 'Nacional, exceto as indicadas nos códigos 3 a 5';
      1: lblOrigemMercadoria.Caption := 'Estrangeira - Importação direta, exceto a indicada no código 6';
      2: lblOrigemMercadoria.Caption := 'Estrangeira - Adquirida no mercado interno, exceto a indicada no código 7';
      3: lblOrigemMercadoria.Caption := 'Nacional, mercadoria ou bem com Conteúdo de Importação superior a 40% (quarenta por cento)';
      4: lblOrigemMercadoria.Caption := 'Nacional, cuja produção tenha sido feita em conformidade com os processos produtivos básicos de que tratam '+
         'o Decreto-Lei nº 288/67, e as Leis nºs 8.248/91, 8.387/91, 10.176/01 e 11 . 4 8 4 / 0 7';
      5: lblOrigemMercadoria.Caption := 'Nacional, mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40% (quarenta por cento)';
      6: lblOrigemMercadoria.Caption := 'Estrangeira - Importação direta, sem similar nacional, constante em lista de Resolução CAMEX';
      7: lblOrigemMercadoria.Caption := 'Estrangeira - Adquirida no mercado interno, sem similar nacional, constante em lista de Resolução CAMEX”';
    end;
  end
  else
    lblOrigemMercadoria.Caption := '';
end;

procedure TfrmProdutos.DBGridGrupoProdutosDblClick(Sender: TObject);
begin
  DM.cdsProdutosID_GRUPO_PRODUTO.Value := DM.cdsGruposProdutosID_GRUPO_PRODUTO.AsInteger;
  DBEDescricaoGrupo.Text := DM.cdsGruposProdutosGRUPO_PRODUTO_DESCRICAO.AsString;
  DBGridGrupoProdutos.Visible := False;
  DM.cdsGruposProdutos.Filtered := False;
  DM.cdsGruposProdutos.Filter := 'ID_GRUPO_PRODUTO = '+ IntToStr(DM.cdsProdutosID_GRUPO_PRODUTO.AsInteger);
  DM.cdsGruposProdutos.Filtered := True;
  DM.cdsGruposProdutos.Active := True;
end;

procedure TfrmProdutos.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  AppBarShow(0);
end;

procedure TfrmProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = VK_ESCAPE then
//    AppBarShow(-1)
//  else
//    AppBarShow(0);
end;

procedure TfrmProdutos.FormResize(Sender: TObject);
begin
  AppBarResize;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  if AnsiUpperCase(frmLogin.pNomeUsuario) <> 'BUSINESS' then
    cxBtnEntradaSobFiltro.Visible := False;

  DM.cdsProdutos.Filter := '';
  DM.cdsProdutos.Filtered := False;
  dm.cdsProdutos.Close;
  dm.cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS ORDER BY PRO_ID';
  DM.cdsProdutos.Active := true;

  if DM.cdsProdutosPRO_CAMINHO_IMAGEM.AsString = '' then
    Image1.Visible := False
  else
  begin
    Image1.Visible := True;
    try
      Image1.Picture.LoadFromFile(DM.cdsProdutosPRO_CAMINHO_IMAGEM.AsString);
    except

    end;
  end;

  if not DM.cdsProdutosMateriasPrimas.Active then
    DM.cdsProdutosMateriasPrimas.Active := true;

  LocalizarMovimentacao(dm.cdsProdutosPRO_ID.AsInteger);
  localizarMateriaPrima(dm.cdsProdutosPRO_ID.AsInteger);
  cxpcProdutos.ActivePage := cxtsPrincipal;
  if dm.cdsProdutosORIGEM_MERCADORIA.AsString <> '' then
  begin
    case StrToInt(dm.cdsProdutosORIGEM_MERCADORIA.AsString) of
      0: lblOrigemMercadoria.Caption := 'Nacional, exceto as indicadas nos códigos 3 a 5';
      1: lblOrigemMercadoria.Caption := 'Estrangeira - Importação direta, exceto a indicada no código 6';
      2: lblOrigemMercadoria.Caption := 'Estrangeira - Adquirida no mercado interno, exceto a indicada no código 7';
      3: lblOrigemMercadoria.Caption := 'Nacional, mercadoria ou bem com Conteúdo de Importação superior a 40% (quarenta por cento)';
      4: lblOrigemMercadoria.Caption := 'Nacional, cuja produção tenha sido feita em conformidade com os processos produtivos básicos de que tratam '+
         'o Decreto-Lei nº 288/67, e as Leis nºs 8.248/91, 8.387/91, 10.176/01 e 11 . 4 8 4 / 0 7';
      5: lblOrigemMercadoria.Caption := 'Nacional, mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40% (quarenta por cento)';
      6: lblOrigemMercadoria.Caption := 'Estrangeira - Importação direta, sem similar nacional, constante em lista de Resolução CAMEX';
      7: lblOrigemMercadoria.Caption := 'Estrangeira - Adquirida no mercado interno, sem similar nacional, constante em lista de Resolução CAMEX”';
    end;
  end
  else
    lblOrigemMercadoria.Caption := '';
end;

procedure TfrmProdutos.localizarMateriaPrima(qIdProduto: integer);
begin
  DM.cdsProdutosMateriasPrimas.Close;
  DM.cdsProdutosMateriasPrimas.CommandText := 'SELECT * FROM PRODUTOS_MATERIAS_PRIMAS WHERE ID_PRODUTO = '+IntToStr(qIdProduto)+' ORDER BY ID_PRODUTO_MATERIA_PRIMA';
  DM.cdsProdutosMateriasPrimas.Active := True;
end;

procedure TfrmProdutos.LocalizarMovimentacao(qIdProduto: integer);
begin
  DM.cdsMovimentacoes.Close;
  DM.cdsMovimentacoes.CommandText := 'SELECT * FROM MOVIMENTACOES WHERE ID_PRODUTO = '+IntToStr(qIdProduto)+' ORDER BY ID_MOVIMENTACAO';
  DM.cdsMovimentacoes.Active := True;
end;

procedure TfrmProdutos.BackToMainForm(Sender: TObject);
begin
  dm.cdsProdutos.Close;
  Close;
//  Hide;
//  SplitForm.BringToFront;
end;

procedure TfrmProdutos.BtImportarClick(Sender: TObject);
var
  prod: integer;
  cod: string;
  id, Cont: integer;
begin
  Dm.cdsGenerico.Close;
  DM.cdsGenerico.CommandText := 'select max(COD_PROD) as cod from produtos';
  DM.cdsGenerico.open;
  cod:= Dm.cdsGenerico.FieldByName('cod').AsString;
  if cod = '' then
    cod:= '0';

  with Dm.FDQConsulta,Sql do
  begin
    Close;
    Clear;
    Add('select Count(*) as cont ');
    Add('  from produtos p ');
    Add('  left outer join cor_tam c on (c.cod_prod = p.cod_prod) ');
    Add('  where p.cod_prod > '+ cod);
    Open;

    Gauge1.Visible := true;
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := Dm.FDQConsulta.FieldByName('cont').AsInteger;

    Close;
    Clear;
    Add('select p.Cod_prod, produto, descricao, codigo, tamanho, cor, isnull(preco,0) preco, isnull(qtd,0) qtd, peso ');
    Add('  from produtos p ');
    Add('  left outer join cor_tam c on (c.cod_prod = p.cod_prod) where p.Cod_prod is not null');
    Add('  and p.cod_prod > '+ cod);
    Open;
  end;

  try
    Dm.FDQConsulta.First;
    while not Dm.FDQConsulta.eof do
    begin
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'Select count(*) cont from PRODUTOS where PRO_CODIGO = '+quotedstr(Dm.FDQConsulta.FieldByName('Codigo').AsString) + ' and COD_PROD = '+ Dm.FDQConsulta.FieldByName('Cod_prod').AsString
      +' AND  COR = '+ quotedstr(Copy(Dm.FDQConsulta.FieldByName('Cor').AsString,1,50)) +' AND TAMANHO = '+quotedstr(Copy(Dm.FDQConsulta.FieldByName('tamanho').AsString,1,80));
      DM.cdsGenerico.open;

      if Dm.cdsGenerico.FieldByName('cont').AsInteger > 0 then
      begin
        Dm.cdsGenerico.Close;
        DM.cdsGenerico.CommandText := 'UPDATE PRODUTOS SET '+
                                      '  PRO_DESCRICAO = :PRO_DESCRICAO,'+
                                      '  PRO_SALDO = :PRO_SALDO,'+
                                      '  PRECO_VENDA = :PRECO_VENDA,'+
                                      '  UNIDADE = :UNIDADE,'+
                                      '  COR = :COR,'+
                                      '  TAMANHO = :TAMANHO,'+
                                      '  CFOP = ''5102'', '+
                                      '  CODIGO_NCM = ''7113.20.00'', '+
                                      '  ORIGEM_MERCADORIA = :ORIGEM_MERCADORIA'+
                                      ' WHERE PRO_CODIGO = '+quotedstr(Dm.FDQConsulta.FieldByName('Codigo').AsString)+
                                      '   AND COD_PROD = '+Dm.FDQConsulta.FieldByName('Cod_prod').AsString;
        DM.cdsGenerico.Params.ParambyName('PRO_DESCRICAO').AsString:= Copy(Dm.FDQConsulta.FieldByName('produto').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('PRO_SALDO').AsFloat:= Dm.FDQConsulta.FieldByName('qtd').AsFloat;
        DM.cdsGenerico.Params.ParambyName('PRECO_VENDA').AsFloat:= Dm.FDQConsulta.FieldByName('preco').AsFloat;
        DM.cdsGenerico.Params.ParambyName('UNIDADE').AsString:= 'PC';
        DM.cdsGenerico.Params.ParambyName('COR').AsString:= Copy(Dm.FDQConsulta.FieldByName('Cor').AsString,1,50);
        DM.cdsGenerico.Params.ParambyName('TAMANHO').AsString:= Copy(Dm.FDQConsulta.FieldByName('tamanho').AsString,1,80);
        DM.cdsGenerico.Params.ParambyName('ORIGEM_MERCADORIA').AsString:= '0';
        DM.cdsGenerico.Execute;

//        Dm.FDQNFE.Close;
//        Dm.FDQNFE.SQL.clear;
//        Dm.FDQNFE.SQL.text:= '  UPDATE PRODUTO SET DESCRICAO = :DESCRICAO, ESTOQUE = :ESTOQUE,PRECO = :PRECO'+
//                             ' WHERE CODIGO = '+quotedstr(Dm.FDQConsulta.FieldByName('Codigo').AsString);
//
//        Dm.FDQNFE.ParambyName('DESCRICAO').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('produto').AsString,1,255);
//        Dm.FDQNFE.ParambyName('ESTOQUE').ASFLOAT:=  Dm.FDQConsulta.FieldByName('qtd').AsFloat;
//        Dm.FDQNFE.ParambyName('PRECO').ASFLOAT:=  Dm.FDQConsulta.FieldByName('preco').AsFloat;
//        Dm.FDQNFE.ExecSQL;
      end
      else
      begin
        Dm.cdsGenerico.Close;
        DM.cdsGenerico.CommandText := 'INSERT INTO PRODUTOS '+
        '(PRO_ID, COD_PROD, PRO_CODIGO, PRO_DESCRICAO, PRO_SALDO, PRECO_VENDA, UNIDADE, PRO_EAN13, COR, TAMANHO,ORIGEM_MERCADORIA,CODIGO_NCM,CFOP) '+
        ' VALUES (GEN_ID(NOVO_PRODUTO, 1), :COD_PROD, :PRO_CODIGO,:PRO_DESCRICAO,:PRO_SALDO,:PRECO_VENDA,:UNIDADE,:PRO_EAN13,:COR,:TAMANHO,:ORIGEM_MERCADORIA,''7113.20.00'',''5102'')';

        DM.cdsGenerico.Params.ParambyName('COD_PROD').AsInteger:= Dm.FDQConsulta.FieldByName('Cod_prod').AsInteger;
        DM.cdsGenerico.Params.ParambyName('PRO_CODIGO').AsString:= Dm.FDQConsulta.FieldByName('Codigo').AsString;
        DM.cdsGenerico.Params.ParambyName('PRO_DESCRICAO').AsString:= Copy(Dm.FDQConsulta.FieldByName('produto').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('PRO_SALDO').AsFloat:= Dm.FDQConsulta.FieldByName('qtd').AsFloat;
        DM.cdsGenerico.Params.ParambyName('PRECO_VENDA').AsFloat:= Dm.FDQConsulta.FieldByName('preco').AsFloat;
        DM.cdsGenerico.Params.ParambyName('UNIDADE').AsString:= 'PC';
        DM.cdsGenerico.Params.ParambyName('PRO_EAN13').AsString:= 'SEM GTIN';
        DM.cdsGenerico.Params.ParambyName('COR').AsString:= Copy(Dm.FDQConsulta.FieldByName('Cor').AsString,1,50);
        DM.cdsGenerico.Params.ParambyName('TAMANHO').AsString:= Copy(Dm.FDQConsulta.FieldByName('tamanho').AsString,1,80);
        DM.cdsGenerico.Params.ParambyName('ORIGEM_MERCADORIA').AsString:= '0';
        DM.cdsGenerico.Execute;

//        Dm.FDQNFE.Close;
//        Dm.FDQNFE.SQL.clear;
//        Dm.FDQNFE.SQL.text:= 'SELECT coalesce(MAX(ID),0)+ 1 AS ID FROM PRODUTO';
//        Dm.FDQNFE.Open;
//
//        id:= Dm.FDQNFE.FieldByName('ID').ASINTEGER;
//
//        Dm.FDQNFE.Close;
//        Dm.FDQNFE.SQL.clear;
//        Dm.FDQNFE.SQL.text:= 'SELECT count(ID) cont FROM PRODUTO WHERE CODIGO = '+quotedstr(Dm.FDQConsulta.FieldByName('Codigo').AsString);
//        Dm.FDQNFE.Open;
//
//        cont:= Dm.FDQNFE.FieldByName('cont').ASINTEGER;
//
//        if cont <= 0 then
//        begin
//          Dm.FDQNFE.Close;
//          Dm.FDQNFE.SQL.clear;
//          Dm.FDQNFE.SQL.text:= '  INSERT INTO PRODUTO (ID,ID_GRUPO,ID_SUBGRUPO,ID_TRIBUTACAO,CODIGO,DESCRICAO,ESTOQUE,PRECO,UNIDADE,ORIGEM,UTRIB,NCM,TIPO,SITUACAO) '+
//                               '  VALUES (:ID,:ID_GRUPO,:ID_SUBGRUPO,:ID_TRIBUTACAO,:CODIGO,:DESCRICAO,:ESTOQUE,:PRECO,:UNIDADE,:ORIGEM,:UTRIB,:NCM,:TIPO,:SITUACAO)';
//
//          Dm.FDQNFE.ParambyName('ID').ASINTEGER:= id;
//          Dm.FDQNFE.ParambyName('ID_GRUPO').ASINTEGER:=  1;
//          Dm.FDQNFE.ParambyName('ID_SUBGRUPO').ASINTEGER:= 1;
//          Dm.FDQNFE.ParambyName('ID_TRIBUTACAO').ASINTEGER:= 1;
//          Dm.FDQNFE.ParambyName('CODIGO').ASSTRING:= Dm.FDQConsulta.FieldByName('Codigo').AsString;
//          Dm.FDQNFE.ParambyName('DESCRICAO').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('produto').AsString,1,255);
//          Dm.FDQNFE.ParambyName('ESTOQUE').ASFLOAT:=  Dm.FDQConsulta.FieldByName('qtd').AsFloat;
//          Dm.FDQNFE.ParambyName('PRECO').ASFLOAT:=  Dm.FDQConsulta.FieldByName('preco').AsFloat;
//          Dm.FDQNFE.ParambyName('UNIDADE').ASSTRING:= 'PC';
//          Dm.FDQNFE.ParambyName('ORIGEM').ASINTEGER:= 0;
//          Dm.FDQNFE.ParambyName('UTRIB').ASSTRING:=  'PC';
//          Dm.FDQNFE.ParambyName('NCM').ASSTRING:= '71132000';
//          Dm.FDQNFE.ParambyName('TIPO').ASINTEGER:= 0;
//          Dm.FDQNFE.ParambyName('SITUACAO').ASINTEGER:= 0;
//          Dm.FDQNFE.ExecSQL;
//        end;
      end;
      inc(prod);
      Gauge1.Progress := prod;
      Dm.FDQConsulta.Next;
    end;
  except
    MessageDlg('Não foi possível importar tabela de produtos!', mtError,[mbYes],0);
    exit;
  end;
  DM.cdsProdutos.Close;
  DM.cdsProdutos.Open;
  Gauge1.visible:= false;
  MessageDlg('Foram importados ' +inttostr(prod)+ ' produtos!', mtInformation,[mbYes],0);
end;

end.
