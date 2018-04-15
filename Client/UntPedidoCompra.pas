unit UntPedidoCompra;

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
  cxDBNavigator,{ dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light,} dxBarBuiltInMenu,UITypes;

type
  TfrmPedidoCompra = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    cxBtnPesquisa: TcxButton;
    cxButton3: TcxButton;
    cxButton5: TcxButton;
    cxbtnRealizarPedido: TcxButton;
    cxPCPrincipal: TcxPageControl;
    cxTSPesquisa: TcxTabSheet;
    cxTSInserirDados: TcxTabSheet;
    pnlPrincipal: TPanel;
    pnlDadosFornecedor: TPanel;
    cxGBDadosornecedor: TcxGroupBox;
    cxLblRazaosocial: TcxLabel;
    cxLblEndereco: TcxLabel;
    cxLblMunicipio: TcxLabel;
    cxLblCnpj: TcxLabel;
    cxLblBairro: TcxLabel;
    cxLblFone: TcxLabel;
    cxScrollBox1: TcxScrollBox;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
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
    cxDBTextEdit11: TcxDBTextEdit;
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
    cxDBNavigator1: TcxDBNavigator;
    cxGroupBox8: TcxGroupBox;
    cxDBNavigator2: TcxDBNavigator;
    cxGrid1DBTableView1PRO_DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1PRO_CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1PRO_SALDO: TcxGridDBColumn;
    cxGrid1DBTableView1PRECO_VENDA: TcxGridDBColumn;
    cxPCPesquisa: TcxPageControl;
    cxtsPedidosDeCompra: TcxTabSheet;
    cxGridPedidosDeCompra: TcxGrid;
    cxGridPedidosDeCompraDBTableView1: TcxGridDBTableView;
    cxGridPedidosDeCompraLevel1: TcxGridLevel;
    cxtsFornecedores: TcxTabSheet;
    cxGridFornecedores: TcxGrid;
    cxGridFornecedoresDBTableView1: TcxGridDBTableView;
    cxGridFornecedoresLevel1: TcxGridLevel;
    cxGridFornecedoresDBTableView1ID_FORNECEDOR: TcxGridDBColumn;
    cxGridFornecedoresDBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    cxGridFornecedoresDBTableView1CNPJ: TcxGridDBColumn;
    cxGridPedidosDeCompraDBTableView1ID_PEDIDO_DE_COMPRA: TcxGridDBColumn;
    cxGridPedidosDeCompraDBTableView1DATA_PEDIDO: TcxGridDBColumn;
    cxGridPedidosDeCompraDBTableView1FORMA_PAGAMENTO: TcxGridDBColumn;
    cxGridPedidosDeCompraDBTableView1CONDICAO_PAGAMENTO: TcxGridDBColumn;
    cxGridPedidosDeCompraDBTableView1STATUS: TcxGridDBColumn;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxButton2: TcxButton;
    cxButton6: TcxButton;
    cxDBTextEdit10: TcxDBTextEdit;
    cxButton7: TcxButton;
    DBCtrlGrid1: TDBCtrlGrid;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTQuantidade: TcxDBTextEdit;
    cxDBTValorUnitario: TcxDBTextEdit;
    cxDBTValorTotal: TcxDBTextEdit;
    cxGridPedidosDeCompraDBTableView1Column1: TcxGridDBColumn;
    procedure GridPanel1Click(Sender: TObject);

    procedure BackToMainForm(Sender: TObject);
    procedure cxBtnPesquisaClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGridPedidoDeCompraDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure cxGridPedidosDeCompraDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure cxGridFornecedoresDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure cxbtnRealizarPedidoClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxDBNavigator2ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoCompra: TfrmPedidoCompra;

implementation

{$R *.dfm}

uses GroupedItems1, SplitItemDetail1, UDataModul, ULogin, UntConectaServidor,
  UntFormasDeEntrega, UntFormasDePagamento, UntLookUpCondicaoDePagamento;

procedure TfrmPedidoCompra.cxBtnPesquisaClick(Sender: TObject);
begin
  cxPCPrincipal.Visible := true;
  cxPCPrincipal.ActivePage := cxTSPesquisa;
  cxPCPesquisa.ActivePage := cxtsPedidosDeCompra;
  cxtsPedidosDeCompra.TabVisible := true;
  cxtsfornecedores.TabVisible := False;
  cxTSInserirDados.TabVisible := False;
  cxGBEdicao.Visible := true;
  cxGridPedidosDeCompra.SetFocus;
  if not dm.cdsPedidosDeCompra.Active then
    dm.cdsPedidosDeCompra.Active := True
  else
  begin
    dm.cdsPedidosDeCompra.Close;
    dm.cdsPedidosDeCompra.Open;
  end;
end;

procedure TfrmPedidoCompra.cxButton2Click(Sender: TObject);
begin
  if DM.cdsPedidosDeCompra.State in [dsEdit,dsInsert] then
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
    dm.cdsPedidosDeCompraFORMA_PAGAMENTO.AsString := DM.cdsFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO.AsString;
  end;
end;

procedure TfrmPedidoCompra.cxButton3Click(Sender: TObject);
begin
  try
    cxPCPrincipal.Visible := true;
    cxPCPrincipal.ActivePage := cxTSPesquisa;
    cxPCPesquisa.ActivePage := cxtsFornecedores;
    cxtsPedidosDeCompra.TabVisible := False;
    cxtsFornecedores.TabVisible := True;
    cxTSInserirDados.TabVisible := False;
    cxGBEdicao.Visible := False;
    cxGridFornecedores.SetFocus;
    if not dm.cdsPedidosDeCompra.Active then
      dm.cdsPedidosDeCompra.Active := True
    else
    begin
      dm.cdsPedidosDeCompra.Close;
      dm.cdsPedidosDeCompra.Open;
    end;

    if not dm.cdsFornecedores.Active then
      dm.cdsFornecedores.Active := True
    else
    begin
      dm.cdsFornecedores.Close;
      dm.cdsFornecedores.Open;
    end;
  except on e:exception do
    begin
      MessageDlg('Não foi possível concluir operação'+#13+
                 e.Message,mtError,[mbOK],0);
    end;
  end;
end;

procedure TfrmPedidoCompra.cxButton4Click(Sender: TObject);
begin
  cxTSInserirDados.TabVisible := True;
  cxPCPrincipal.ActivePage := cxTSInserirDados;
  cxTSPesquisa.TabVisible := False;
end;

procedure TfrmPedidoCompra.cxButton6Click(Sender: TObject);
begin
  if DM.cdsPedidosDeCompra.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(frmLookUpCondicaoDePagamento) then
      frmLookUpCondicaoDePagamento := TfrmLookUpCondicaoDePagamento.Create(Self);
    frmLookUpCondicaoDePagamento.Left := Trunc(Screen.Width / 2) - 200;
    frmLookUpCondicaoDePagamento.Top := Trunc(Screen.Height / 2) - 200;
//    frmlookUpTiposDeoperacao.cxGrid1DBTableView1.DataController.DataSource := dm.dsClientes;
    if not dm.cdsCondicoesDePagamento.Active then
      dm.cdsCondicoesDePagamento.Active := True;
    frmLookUpCondicaoDePagamento.ShowModal;
//    dm.cdsNotasFiscaisID_NATUREZA_OPERACAO.AsInteger := dm.cdsTiposDeOperacaoID_TIPO_OPERACAO.AsInteger;
    dm.cdsPedidosDeCompraCONDICAO_PAGAMENTO.AsString := DM.cdsCondicoesDePagamentoCONDICAO_DE_PAGAMENTO.AsString;
  end;
end;

procedure TfrmPedidoCompra.cxButton7Click(Sender: TObject);
begin
  if DM.cdsPedidosDeCompra.State in [dsEdit,dsInsert] then
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
    dm.cdsPedidosDeCompraFORMA_ENTREGA.AsString := DM.cdsFormasDeEntregaFORMA_DE_ENTREGA.AsString;
  end;
end;

procedure TfrmPedidoCompra.cxDBNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex = 10 then
  begin
    if dm.cdsPedidosDeCompraItens.State in [dsEdit,dsInsert] then
    begin
      cxDBTValorTotal.SetFocus;
      dm.cdsPedidosDeCompraItensVALOR_TOTAL.AsFloat := dm.cdsPedidosDeCompraItensQUANTIDADE.AsFloat *
                                                dm.cdsPedidosDeCompraItensVALOR_UNITARIO.AsFloat;

    end;
  end;
      //insert              //delete
  if (AButtonIndex = 6) or (AButtonIndex = 8) then
  begin
    if Ansiuppercase(dm.cdsPedidosDeCompraSTATUS.AsString) = 'REALIZADO' then
    begin
      MessageDlg('Este pedido de compra está realizado'+#13+
                 'não podendo ser alterado',mtError,[mbOK],0);
      dm.cdsPedidosDeCompraItens.CancelUpdates;
      abort;
    end;
  end;
end;

procedure TfrmPedidoCompra.cxDBNavigator2ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex = 9 then
  begin
    if Ansiuppercase(dm.cdsPedidosDeCompraSTATUS.AsString) = 'REALIZADO' then
    begin
      MessageDlg('Este pedido de compra está realizado'+#13+
                 'não podendo ser alterado',mtError,[mbOK],0);
      dm.cdsPedidosDeCompra.CancelUpdates;
      abort;
    end;
  end;
end;

procedure TfrmPedidoCompra.cxbtnRealizarPedidoClick(Sender: TObject);
var
  Conexao : TDSModuleDbClient;
  vString,vStringAuxiliar : string;
  vContador : integer;
begin
  if Ansiuppercase(dm.cdsPedidosDeCompraSTATUS.AsString) <> 'PENDENTE' then
    MessageDlg('Este pedido de compra não está pendente',mtWarning,[mbOK],0)
  else
  begin
    if dm.cdsPedidosDeCompraNUMERO_PARCELAS.IsNull then
      MessageDlg('Não foi informado o numero de parcelas a serem geradas no financeiro '+#13+
                 'Este pedido não será realizado até que esta informação seja preenchida',mtWarning,[mbOK],0)
    else
    begin
      dm.cdsPedidosDeCompraItens.First;
      if dm.cdsPedidosDeCompraItens.RecordCount = 0 then
        MessageDlg('Este pedido de compra não possui nenhum item',mtWarning,[mbOK],0)
      else
      begin
        Conexao := TDSModuleDbClient.Create(dm.SQLConexao.DBXConnection);
        dm.cdsPedidosDeCompraItens.First;
        while not dm.cdsPedidosDeCompraItens.Eof do
        begin
          Conexao.InserirEmMovimentacoes(dm.cdsPedidosDeCompraItensID_PRODUTO.AsInteger,dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger,
                                         dm.cdsPedidosDeCompraItensQUANTIDADE.AsFloat,'COMPRA','E');
          dm.cdsPedidosDeCompraItens.Next;
        end;
        dm.cdsPedidosDeCompra.Edit;
        dm.cdsPedidosDeCompraSTATUS.AsString := 'Realizado';
        dm.cdsPedidosDeCompra.Post;
        //
        if dm.cdsPedidosDeCompraNUMERO_PARCELAS.AsInteger > 0 then
        begin
          if not dm.cdsPagar.Active then
            dm.cdsPagar.Active := true;

          if Trim(dm.cdsPedidosDeCompraCONDICAO_PAGAMENTO.AsString) <> '' then
          begin
            try
              vString := dm.cdsPedidosDeCompraCONDICAO_PAGAMENTO.AsString;
              if AnsiUpperCase(vString) = '0' then
              begin
                dm.cdsPagar.Insert;
                dm.cdsPagarDESCRICAO_TITULO.AsString := 'Pedido de compra Nº '+IntToStr(dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger);
                dm.cdsPagarID_PEDIDO.AsInteger := dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger;
                dm.cdsPagarID_FORNECEDOR.AsInteger := dm.cdsPedidosDeCompraID_FORNECEDOR.AsInteger;
                dm.cdsPagarNOME_FORNECEDOR.AsString := dm.cdsPedidosDeCompraNOME_FORNECEDOR.AsString;
                dm.cdsPagarVENCIMENTO.AsDateTime := Date;
                dm.cdsPagarVALOR_TITULO.AsFloat := dm.cdsPedidosVALOR_TOTAL.AsFloat;
                dm.cdsPagarFORMA_PAGAMENTO.AsString := dm.cdsPedidosDeCompraFORMA_PAGAMENTO.AsString;
                dm.cdsPagarSTATUS.AsString :=  'Aguardando pagamento';
                dm.cdsPagar.Post;
              end
              else
              begin
                vContador := 0;
                repeat
                  vStringAuxiliar := Copy(vString,1,2);
                  dm.cdsPagar.Insert;
                  Inc(vContador);
                  dm.cdsPagarDESCRICAO_TITULO.AsString := 'Pedido de compra Nº '+IntToStr(dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger);
                  dm.cdsPagarID_PEDIDO.AsInteger := dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger;
                  dm.cdsPagarID_FORNECEDOR.AsInteger := dm.cdsPedidosDeCompraID_FORNECEDOR.AsInteger;
                  dm.cdsPagarNOME_FORNECEDOR.AsString := dm.cdsPedidosDeCompraNOME_FORNECEDOR.AsString;
                  dm.cdsPagarVENCIMENTO.AsDateTime := Date + StrToInt(vStringAuxiliar);
                  dm.cdsPagarVALOR_TITULO.AsFloat := dm.cdsPedidosDeCompraVALOR_TOTAL.AsFloat /
                                                               dm.cdsPedidosDeCompraNUMERO_PARCELAS.AsInteger;
                  dm.cdsPagarSTATUS.AsString :=  'Aguardando pagamento';
                  dm.cdsPagarFORMA_PAGAMENTO.AsString := dm.cdsPedidosDeCompraFORMA_PAGAMENTO.AsString;
                  dm.cdsPagar.Post;
                  vString := Copy(vString,Pos('/',vString)+1,Length(vString));
                until vContador =  dm.cdsPedidosDeCompraNUMERO_PARCELAS.AsInteger ;
              end;
            except on e:exception do
              begin
                MessageDlg('Não foi possível efetuar a geração das duplicatas.'+#13+
                           'Erro gerado pelo sistema : '+e.Message,mtError,[mbOK],0);
              end;
            end;
          end
          else
            MessageDlg('Não será possível gerar parcelas no financeiro pagar pois ainda não fora'+#13+
                       'informada a condição de pagamento para este pedido',mtError,[mbOK],0);
        end;
        //
        MessageDlg('Pedido realizado com sucesso',mtConfirmation,[mbOK],0);
      end;
    end;
  end;
end;

procedure TfrmPedidoCompra.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if not dm.cdsPedidosDeCompraItens.Active then
      dm.cdsPedidosDeCompraItens.Active := true;

    if dm.cdsPedidosDeCompraItens.State = dsInsert then
    begin
      dm.cdsPedidosDeCompraItensID_PEDIDO_DE_COMPRA.AsInteger := dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger;
      dm.cdsPedidosDeCompraItensID_PRODUTO.AsInteger := dm.cdsProdutosPRO_ID.AsInteger;
      dm.cdsPedidosDeCompraItensDESCRICAO_PRODUTO.AsString := dm.cdsProdutosPRO_DESCRICAO.AsString;
      dm.cdsPedidosDeCompraItensVALOR_UNITARIO.AsFloat := dm.cdsProdutosPRECO_VENDA.AsFloat;
      cxDBTQuantidade.SetFocus;
    end;
  end;
end;

procedure TfrmPedidoCompra.cxGridFornecedoresDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Conexao : TDSModuleDbClient;
 // vIdPedido : integer;
begin
  if Key = VK_RETURN then
  begin
    cxPCPrincipal.ActivePage := cxTSInserirDados;
    cxTSPesquisa.TabVisible := False;
    if not dm.cdsPedidosDeCompra.Active then
      dm.cdsPedidosDeCompra.Active := True
    else
    begin
      dm.cdsPedidosDeCompra.Close;
      dm.cdsPedidosDeCompra.Open;
    end;

    dm.cdsPedidosDeCompra.Insert;
    dm.cdsPedidosDeCompraID_FORNECEDOR.AsInteger := dm.cdsFornecedoresID_FORNECEDOR.AsInteger;
    DM.cdsPedidosDeCompraNOME_FORNECEDOR.AsString := dm.cdsFornecedoresRAZAO_SOCIAL.AsString;
    dm.cdsPedidosdEcOMPRADATA_PEDIDO.Value := Date;
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    dm.cdsPedidosdEcOMPRAID_USUARIO.AsInteger := Conexao.RetornaIdentificadorUsuario(frmlogin.pNomeUsuario);
    FreeAndNil(Conexao);
    cxLblRazaosocial.Caption := dm.cdsFornecedoresRAZAO_SOCIAL.AsString;
    cxLblEndereco.Caption := dm.cdsFornecedoresENDERECO.AsString+','+
                             dm.cdsFornecedoresNUMERO.AsString;
//    cxLblMunicipio.Caption := dm.cdsClientes.AsString;
    cxLblCnpj.Caption := dm.cdsFornecedoresCNPJ.AsString;
    cxLblBairro.Caption := dm.cdsFornecedoresBAIRRO.AsString;
    cxLblFone.Caption := dm.cdsFornecedoresTELEFONE.AsString;
    cxLblMunicipio.Caption := dm.cdsFornecedoresCIDADE.AsString;
    dm.cdsPedidosDeCompra.Post;

    if not dm.cdsPedidosDeCompraItens.Active then
    begin
      dm.cdsPedidosDeCompraItens.Active;
      dm.cdsPedidosDeCompraItens.Filtered := False;
      dm.cdsPedidosDeCompraItens.Filter := '';
      dm.cdsPedidosDeCompraItens.Filter := ' ID_PEDIDO_DE_COMPRA = '+IntToStr(dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger);
      dm.cdsPedidosDeCompraItens.Filtered := true;
      dm.cdsPedidosDeCompraItens.Close;
      dm.cdsPedidosDeCompraItens.Open;
    end
    else
    begin
      dm.cdsPedidosDeCompraItens.DisableControls;
      dm.cdsPedidosDeCompraItens.Filtered := False;
      dm.cdsPedidosDeCompraItens.Filter := '';
      dm.cdsPedidosDeCompraItens.Filter := ' ID_PEDIDO_DE_COMPRA = '+IntToStr(dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger);
      dm.cdsPedidosDeCompraItens.Filtered := true;
//      dm.cdsPedidos_Itens.Close;
//      dm.cdsPedidos_Itens.Open;
      dm.cdsPedidosDeCompraItens.EnableControls;
    end;
  end;
end;

procedure TfrmPedidoCompra.cxGridPedidoDeCompraDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    cxPCPrincipal.ActivePage := cxTSInserirDados;
    cxTSPesquisa.TabVisible := False;
  end;
end;

procedure TfrmPedidoCompra.cxGridPedidosDeCompraDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    cxPCPrincipal.ActivePage := cxTSInserirDados;
    cxTSPesquisa.TabVisible := False;
    if not dm.cdsPedidosDeCompraItens.Active then
    begin
      dm.cdsPedidosDeCompraItens.Active;
      dm.cdsPedidosDeCompraItens.Filtered := False;
      dm.cdsPedidosDeCompraItens.Filter := '';
      dm.cdsPedidosDeCompraItens.Filter := ' ID_PEDIDO_DE_COMPRA = '+ IntToStr(dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger);
      dm.cdsPedidosDeCompraItens.Filtered := true;
      dm.cdsPedidosDeCompraItens.Close;
      dm.cdsPedidosDeCompraItens.Open;
    end
    else
    begin
      dm.cdsPedidosDeCompraItens.DisableControls;
      dm.cdsPedidosDeCompraItens.Filtered := False;
      dm.cdsPedidosDeCompraItens.Filter := '';
      dm.cdsFornecedores.Filter := ' ID_PEDIDO_DE_COMPRA = '+ IntToStr(dm.cdsPedidosDeCompraID_PEDIDO_DE_COMPRA.AsInteger);
      dm.cdsPedidosDeCompraItens.Filtered := true;
      dm.cdsPedidosDeCompraItens.Close;
      dm.cdsPedidosDeCompraItens.Open;
      dm.cdsPedidosDeCompraItens.EnableControls;
    end;
    if not dm.cdsFornecedores.Active then
      dm.cdsFornecedores.Active := True;

    dm.cdsFornecedores.Filtered := False;
    dm.cdsFornecedores.Filter := ' ID_FORNECEDOR = '+ IntToStr(dm.cdsPedidosDeCompraID_FORNECEDOR.AsInteger);
    dm.cdsFornecedores.Filtered := true;
    cxLblRazaosocial.Caption := dm.cdsFornecedoresRAZAO_SOCIAL.AsString;
    cxLblEndereco.Caption := dm.cdsFornecedoresENDERECO.AsString+','+
                             dm.cdsFornecedoresNUMERO.AsString;
//    cxLblMunicipio.Caption := dm.cdsClientes.AsString;
    cxLblCnpj.Caption := dm.cdsFornecedoresCNPJ.AsString;
    cxLblBairro.Caption := dm.cdsFornecedoresBAIRRO.AsString;
    cxLblFone.Caption := dm.cdsFornecedoresTELEFONE.AsString;
    cxLblMunicipio.Caption := dm.cdsFornecedoresCIDADE.AsString;
    dm.cdsFornecedores.Filtered := False;
    dm.cdsFornecedores.Filter := '';
  end;
end;

procedure TfrmPedidoCompra.FormShow(Sender: TObject);
var
   Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'ALTERAR PRECO VENDA COMPRA') then
    cxDBTValorUnitario.Properties.ReadOnly := True
  else
    cxDBTValorUnitario.Properties.ReadOnly := False;

  cxPCPrincipal.Visible := False;
  cxTSPesquisa.Caption := '';
  cxTSInserirDados.Caption := '';
  cxTSPesquisa.TabVisible := False;
  cxTSInserirDados.TabVisible := False;
  FreeAndNil(Conexao);
  cxLblRazaosocial.Caption := '';
  cxLblEndereco.Caption := '';
  cxLblMunicipio.Caption := '';
  cxLblCnpj.Caption := '';
  cxLblBairro.Caption := '';
  cxLblFone.Caption := '';
  cxBtnPesquisaClick(self);
end;

procedure TfrmPedidoCompra.GridPanel1Click(Sender: TObject);
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


procedure TfrmPedidoCompra.BackToMainForm(Sender: TObject);
begin
  Close;
//  Hide;
//  SplitForm.BringToFront;
end;

end.
