unit UntPdv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinLiquidSky,
  Vcl.ExtCtrls, Vcl.Buttons, cxTextEdit, cxMemo, Vcl.StdCtrls, dxSkinBlack,
  dxSkinBlue, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, Data.DB,
  Datasnap.DBClient, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  Vcl.Imaging.pngimage,UITypes{, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light};

type
  TfrmPdv = class(TForm)
    cxMemo1: TcxMemo;
    SPBIniciarVenda: TSpeedButton;
    spbConfirmarItem: TSpeedButton;
    spbCancelarItem: TSpeedButton;
    spbCancelarVenda: TSpeedButton;
    spbConfirmarVenda: TSpeedButton;
    spbCapturarPedido: TSpeedButton;
    spbConsultarPreco: TSpeedButton;
    Panel2: TPanel;
    s: TImage;
    Label4: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    edtPesquisa: TEdit;
    edtDescricao: TEdit;
    edtQuantidade: TEdit;
    edtPreco: TEdit;
    edtPrecoTotal: TEdit;
    Image1: TImage;
    Label2: TLabel;
    edtSubTotal: TEdit;
    Label3: TLabel;
    procedure SPBIniciarVendaClick(Sender: TObject);
    procedure spbConfirmarItemClick(Sender: TObject);
    procedure spbCancelarItemClick(Sender: TObject);
    procedure spbCancelarVendaClick(Sender: TObject);
    procedure spbConfirmarVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbCapturarPedidoClick(Sender: TObject);
    procedure edtPesquisaExit(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadineKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPrecoTotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtPrecoTotalExit(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbConsultarPrecoClick(Sender: TObject);
    procedure sClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxMemo1PropertiesChange(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    vStatusVenda : boolean;
    vLinhaInicialMemo,vTipoVenda:string;
    cdsProdutos:TClientDataSet;
  public
    { Public declarations }
  end;

var
  frmPdv: TfrmPdv;

implementation

{$R *.dfm}

uses UDataModul, UntConectaServidor, ULogin, URelatorios;

procedure TfrmPdv.cxMemo1PropertiesChange(Sender: TObject);
begin
  if vStatusVenda  = False then
  begin
    cxMemo1.Lines.Clear;
  end;
end;

procedure TfrmPdv.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmPdv.edtPesquisaExit(Sender: TObject);
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
        showmessage('Produto não encontrado');
        edtPesquisa.Clear;
        abort;
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
//  else
//  begin
//    showmessage('Venda não foi iniciada');
//    edtPesquisa.Clear;
//    edtPesquisa.SetFocus;
//  end;
end;

procedure TfrmPdv.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F1 then
    SPBIniciarVendaClick(Self);

  if Key = VK_F3 then
      spbCapturarPedidoClick(Self);

  if Key = VK_F4 then
    spbConsultarPrecoClick(Self);

  if vStatusVenda then
  begin
    if Key = VK_F2 then
      spbCancelarItemClick(Self);

    if Key = VK_F9 then
      spbCancelarVendaClick(Self);

    if Key = VK_F10 then
      spbConfirmarVendaClick(Self);
  end;

  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmPdv.edtPrecoExit(Sender: TObject);
var
  vPrecoTotal : Real;
  vTeste : string;
begin
  if vStatusVenda then
  begin
    vTeste := Copy(edtPreco.Text,1,1);
    if not (vTeste[1] in ['0'..'9']) then
    begin
      showmessage('Valor digitado é inválido');
      edtPreco.SetFocus;
    end
    else
    begin
      try
        vPrecoTotal := StrToFloat(edtQuantidade.Text) * StrToFloat(edtPreco.Text);
        if StrToFloat(edtPrecoTotal.Text) <> vPrecoTotal then
          edtPrecoTotal.Text := FormatFloat('###,###,##0.00',vPrecoTotal);
      except
        edtPrecoTotal.Text := '';
      end;
      edtPrecoTotal.SetFocus;
    end;
  end;
end;

procedure TfrmPdv.edtPrecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmPdv.edtPrecoTotalExit(Sender: TObject);
begin
  if vStatusVenda then
    spbConfirmarItemClick(Self)
  else
  begin
    edtPesquisa.Clear;
    edtPesquisa.SetFocus;
  end;
end;

procedure TfrmPdv.edtPrecoTotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmPdv.edtQuantidadeExit(Sender: TObject);
var
  vTeste : string;
begin
  if vStatusVenda then
  begin
    vTeste := Copy(edtQuantidade.Text,1,1);
    if not (vTeste[1] in ['0'..'9']) then
    begin
      showmessage('Por favor informe a quantidade');
      edtQuantidade.SetFocus;
    end
    else
    begin
      try
        edtPrecoTotal.Text := FormatFloat('###,###,##0.00',StrToFloat(edtQuantidade.Text) * StrToFloat(edtPreco.Text));
      except
        edtPrecoTotal.Text := '';
      end;
      edtPreco.SetFocus;
    end;
  end;
end;

procedure TfrmPdv.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
//  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
//    key := #0;
end;

procedure TfrmPdv.edtQuantidadineKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Key = VK_RETURN) and (Trim(edtQuantidade.Text) <> '')  then
//    Perform(WM_NEXTDLGCTL,0,0)
//  else
//    edtQuantidade.SetFocus;
  if Key = VK_RETURN then
    edtPreco.SetFocus;
end;

procedure TfrmPdv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if vStatusVenda then
  begin
    spbCancelarVendaClick(Self);
    vStatusVenda := False;
  end;
  if Assigned(cdsProdutos) then
    FreeAndNil(cdsProdutos);

  cxMemo1.Lines.Clear;
end;

procedure TfrmPdv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    SPBIniciarVendaClick(Self);

  if Key = VK_F3 then
      spbCapturarPedidoClick(Self);

  if Key = VK_F4 then
    spbConsultarPrecoClick(Self);

  if vStatusVenda then
  begin
    if Key = VK_F2 then
      spbCancelarItemClick(Self);

    if Key = VK_F9 then
      spbCancelarVendaClick(Self);

    if Key = VK_F10 then
      spbConfirmarVendaClick(Self);
  end;
end;

procedure TfrmPdv.FormShow(Sender: TObject);
var
   Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'ALTERAR PRECO VENDA PDV') then
    edtPreco.ReadOnly := True;
  FreeAndNil(Conexao);
  vStatusVenda := False;
  DM.cdsPedidos.Close;
  DM.cdsPedidos.CommandText := 'SELECT * FROM PEDIDOS WHERE ID_PEDIDO = -1';
  DM.cdsPedidos.Open;
  DM.cdsPedidos_Itens.Close;
  DM.cdsPedidos_Itens.CommandText := 'SELECT * FROM PEDIDOS_ITENS WHERE ID_PEDIDO = :ID_PEDIDO';
  DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
  dm.cdsPedidos_Itens.Open;
  DM.cdsComandas.Active := True;
  vTipoVenda := '';
  cdsProdutos := TClientDataSet.Create(Self);
  cdsProdutos.ProviderName := DM.cdsProdutos.ProviderName;
  cdsProdutos.RemoteServer := dm.cdsProdutos.RemoteServer;
  edtPesquisa.SetFocus;
end;

procedure TfrmPdv.sClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPdv.spbCancelarItemClick(Sender: TObject);
var
  vQualCodigo,vString : string;
  vQuantidade,vSubTotal : real;
begin
  vQuantidade:= 0;
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
      vQuantidade := StrToFloat(InputBox('Cancelamento de item','Informe a quantidade'+#13+
                                       'a ser retirada',''));
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
    DM.cdsPedidos_Itens.Close;
    DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
    dm.cdsPedidos_Itens.Open;
    DM.cdsPedidos_Itens.First;
    vSubTotal := 0;
    while not dm.cdsPedidos_Itens.Eof do
    begin
//      DM.cdsProdutos.Close;
//      DM.cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_ID = '+ IntToStr(DM.cdsPedidos_ItensID_PRODUTO.AsInteger);
//      DM.cdsProdutos.Active := True;
      vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
                 'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat) +'  =  '+
                 'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat);
      cxMemo1.Lines.Add(vString);
      vSubTotal := vSubTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
//      DM.cdsProdutos.Filtered := False;
      dm.cdsPedidos_Itens.Next;
    end;
    edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal);
  end;
end;

procedure TfrmPdv.spbCancelarVendaClick(Sender: TObject);
var
  vPossuiItens : boolean;
begin
  vPossuiItens := False;
  if MessageDlg('Deseja realmente cancelar o pedido '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger)+'?',mtInformation,[mbYes,mbNo],0) = mrYes then
  begin
    DM.cdsPedidos_Itens.Close;
    DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
    dm.cdsPedidos_Itens.Open;
    DM.cdsPedidos_Itens.First;
    while not DM.cdsPedidos_Itens.Eof do
    begin
      vPossuiItens := true;
      DM.cdsPedidos_Itens.Delete;
      DM.cdsPedidos_Itens.Next;
    end;
    DM.cdsPedidos.Delete;
    try
      if vPossuiItens then
        DM.cdsPedidos_Itens.ApplyUpdates(0);
      DM.cdsPedidos.ApplyUpdates(0);
      MessageDlg('Pedido Cancelado',mtWarning,[mbOk],0);
      vStatusVenda := False;
      vTipoVenda := '';
      edtSubTotal.Text := '0,00';
      cxMemo1.Lines.Clear;
    except
      MessageDlg('Pedido não pode ser Cancelado',mtWarning,[mbOk],0);
    end;
  end
  else
  begin
    try
      DM.cdsPedidos.Edit;
      DM.cdsPedidosPEDIDO_EM_VENDA.Value := 'N';
      DM.cdsPedidos.Post;
      DM.cdsPedidos.ApplyUpdates(0);
    except
      showmessage('Sistema não conseguiu desbloquear este pedido neste ponto de venda');
    end;
  end;
end;

procedure TfrmPdv.spbCapturarPedidoClick(Sender: TObject);
var
  vString,vComanda : string;
  vSubTotal : real;
begin
  if vTipoVenda = 'VENDA INICIADA' then
  begin
    showmessage('Não é possível capturar venda com comanda aberta');
    abort;
  end;

  if vTipoVenda = 'VENDA CAPTURADA' then
  begin
    showmessage('Já existe uma venda capturada');
    abort;
  end;

  vComanda := InputBox('Captura de pedido','Informe o numero da comanda','');
  if Trim(vComanda) = '' then
    abort;

  DM.cdsComandas.Close;
  DM.cdsComandas.CommandText := 'SELECT * FROM COMANDAS WHERE NUMERO_COMANDA = '+ Quotedstr(vComanda);
  DM.cdsComandas.Open;
  if DM.cdsComandasNUMERO_COMANDA.AsString = '' then
  begin
    showmessage('O numero de comanda informado não está cadastrado no sistema ');
    edtDescricao.Clear;
    edtQuantidade.Clear;
    edtPreco.Clear;
    edtPrecoTotal.Clear;
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
    MessageDlg('Não existe nenhum pedido para esta comanda',mtWarning,[mbOK],0);
    edtDescricao.Clear;
    edtQuantidade.Clear;
    edtPreco.Clear;
    edtPrecoTotal.Clear;
    edtPesquisa.Clear;
    Image1.Visible := False;
    edtPesquisa.SetFocus;
    Exit;
  end;

  if DM.cdsPedidosPEDIDO_EM_VENDA.AsString = 'S' then
  begin
    showmessage('Este numero de comanda já está aberta em outro ponto de venda.');
    edtDescricao.Clear;
    edtQuantidade.Clear;
    edtPreco.Clear;
    edtPrecoTotal.Clear;
    edtPesquisa.Clear;
    Image1.Visible := False;
    edtPesquisa.SetFocus;
    Exit;
  end;

  try
    DM.cdsPedidos.Edit;
    DM.cdsPedidosPEDIDO_EM_VENDA.Value := 'S';
    DM.cdsPedidos.Post;
    DM.cdsPedidos.ApplyUpdates(0);
  except
    showmessage('Sistema não conseguiu bloquear este pedido em outros pontos de venda');
  end;
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
  DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
  dm.cdsPedidos_Itens.Open;
  DM.cdsPedidos_Itens.First;
  vSubTotal := 0;
  while not dm.cdsPedidos_Itens.Eof do
  begin
    vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
               'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
               'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat) +'  =  '+
               'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat);
    cxMemo1.Lines.Add(vString);
    vSubTotal := vSubTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
    dm.cdsPedidos_Itens.Next;
  end;
  edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal);
//  edtDescricao.Clear;
//  edtQuantidade.Clear;
//  edtPreco.Clear;
//  edtPrecoTotal.Clear;
//  edtPesquisa.Clear;
//  Image1.Visible := False;
//  edtPesquisa.SetFocus;
  vTipoVenda := 'VENDA CAPTURADA';
end;

procedure TfrmPdv.spbConfirmarItemClick(Sender: TObject);
var
  vString : string;
  Conexao : TDSModuleDbClient;
  vQuantidade,vValorTotal,vSubTotal :Real;
  label
    vProximoPasso;
begin
  if DM.cdsPedidos_Itens.Locate('ID_PRODUTO;ID_PEDIDO',VarArrayOf([cdsProdutos.FieldByName('PRO_ID').AsInteger,
                                                                  DM.cdsPedidosID_PEDIDO.AsInteger]),[]) = False then
  begin
    if cdsProdutos.FieldByName('PRO_SALDO').AsFloat > 0 then
    begin
      if StrToFloat(edtQuantidade.Text) <= cdsProdutos.FieldByName('PRO_SALDO').AsFloat then
      begin
        Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
        DM.cdsPedidos_Itens.Insert;
        DM.cdsPedidos_ItensID_PEDIDO_ITEM.Value := Conexao.GeneratorIncrementado('NOVO_PEDIDO_ITEM');
        DM.cdsPedidos_ItensQUANTIDADE.Value := StrToFloat(edtQuantidade.Text);
        DM.cdsPedidos_ItensVALOR_TOTAL.Value := StrToFloat(edtPrecoTotal.Text);
        FreeAndNil(Conexao);
      end
      else
      begin
        MessageDlg('O produto '+cdsProdutos.FieldByName('PRO_DESCRICAO').AsString+' não possui saldo suficiente'+#13+
                 'para realizar esta venda',mtError,[mbok],0);
        goto vProximoPasso;
      end;
    end
    else
    begin
      MessageDlg('O produto '+cdsProdutos.FieldByName('PRO_DESCRICAO').AsString+' não possui saldo suficiente'+#13+
                 'para realizar esta venda',mtError,[mbok],0);
      goto vProximoPasso;
    end;
  end
  else
  begin
    if (DM.cdsPedidos_ItensQUANTIDADE.AsFloat + StrToFloat(edtQuantidade.Text)) <= cdsProdutos.FieldByName('PRO_SALDO').AsFloat then
    begin
      DM.cdsPedidos_Itens.Edit;
      DM.cdsPedidos_ItensQUANTIDADE.Value := DM.cdsPedidos_ItensQUANTIDADE.AsFloat + StrToFloat(edtQuantidade.Text);
      DM.cdsPedidos_ItensVALOR_TOTAL.Value := DM.cdsPedidos_ItensVALOR_TOTAL.AsFloat + StrToFloat(edtPrecoTotal.Text);
    end
    else
    begin
      MessageDlg('O produto '+cdsProdutos.FieldByName('PRO_DESCRICAO').AsString+' não possui saldo suficiente'+#13+
                 'para realizar esta venda',mtError,[mbok],0);
      goto vProximoPasso;
    end;
  end;
  DM.cdsPedidos_ItensID_PEDIDO.AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
  DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString := edtDescricao.Text;
  DM.cdsPedidos_ItensID_PRODUTO.Value := cdsProdutos.FieldByName('PRO_ID').AsInteger;
  DM.cdsPedidos_ItensVALOR_UNITARIO.Value := StrToFloat(edtPreco.Text);
  DM.cdsPedidos_ItensALIQUOTA_ICMS.value := cdsProdutos.FieldByName('ALIQUOTA_ICMS').AsInteger;
  DM.cdsPedidos_Itens.Post;
  vString := '';
  cxMemo1.Lines.Clear;
  vString := vLinhaInicialMemo;
  cxMemo1.Lines.Add(vString);
  vString := '   Pedido Nº : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
  cxMemo1.Lines.Add(vString);
//  DM.cdsPedidos_Itens.Filtered := False;
//  DM.cdsPedidos_Itens.Filter := 'ID_PEDIDO = '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
//  dm.cdsPedidos_Itens.Filtered := True;
  DM.cdsPedidos_Itens.Close;
  DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
  dm.cdsPedidos_Itens.Open;
  DM.cdsPedidos_Itens.First;
  vSubTotal := 0;
  while not dm.cdsPedidos_Itens.Eof do
  begin
//    DM.cdsProdutos.Close;
//    DM.cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS WHERE PRO_ID = '+ IntToStr(DM.cdsPedidos_ItensID_PRODUTO.AsInteger);
//    DM.cdsProdutos.Active := True;
    vString := '   '+DM.cdsPedidos_ItensDESCRICAO_PRODUTO.AsString +'   '+
               'Qtde.: '+FloatToStr(dm.cdsPedidos_ItensQUANTIDADE.AsFloat) +'  X  '+
               'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_UNITARIO.AsFloat) +'  =  '+
               'R$: '+FormatFloat('###,###,##0.00',dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat);
    cxMemo1.Lines.Add(vString);
    vSubTotal := vSubTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
//    DM.cdsProdutos.Filtered := False;
    dm.cdsPedidos_Itens.Next;
  end;
  edtSubTotal.Text := FormatFloat('###,###,##0.00',vSubTotal);
  vProximoPasso:
  edtDescricao.Clear;
  edtQuantidade.Clear;
  edtPreco.Clear;
  edtPrecoTotal.Clear;
  edtPesquisa.Clear;
  Image1.Visible := False;
  edtPesquisa.SetFocus;
end;

procedure TfrmPdv.SPBIniciarVendaClick(Sender: TObject);
var
  vString,vComanda : string;
  Conexao : TDSModuleDbClient;
  vPedido : integer;
begin
  if vTipoVenda = 'VENDA CAPTURADA' then
  begin
    showmessage('Não é possível iniciar nova venda com comanda capturada');
    abort;
  end;

  if vTipoVenda = 'VENDA INICIADA' then
  begin
    showmessage('Não é possível capturar venda com comanda aberta');
    abort;
  end;

  try
    vComanda := InputBox('Iniciar venda','Informe o numero da comanda','');
  except
    showmessage('Valor inválido');
    abort;
  end;
  if Trim(vComanda) = '' then
    abort;
  //showmessage(vcomanda);
  DM.cdsComandas.Close;
  DM.cdsComandas.CommandText := 'SELECT * FROM COMANDAS WHERE NUMERO_COMANDA = '+ QuotedStr(vComanda);
  DM.cdsComandas.Open;
  if DM.cdsComandasNUMERO_COMANDA.AsString = '' then
  begin
    showmessage('O numero de comanda informado não está cadastrado no sistema ');
    edtDescricao.Clear;
    edtQuantidade.Clear;
    edtPreco.Clear;
    edtPrecoTotal.Clear;
    edtPesquisa.Clear;
    Image1.Visible := False;
    edtPesquisa.SetFocus;
    Exit;
  end;

  DM.cdsGenerico.Close;
  DM.cdsGenerico.CommandText := 'SELECT * FROM PEDIDOS WHERE NUMERO_COMANDA = '+QuotedStr(vComanda);
  DM.cdsGenerico.Open;
  if DM.cdsGenerico.FieldByName('NUMERO_COMANDA').AsString = '' then
  begin
    vStatusVenda := True;
    vString := '   Bem vindo(a) a '+frmLogin.sFantasia+'. Data : '+DateToStr(Date)+'  Hora : '+
                   FormatDateTime('hh:mm:ss',Time);
    vLinhaInicialMemo := vString;
    cxMemo1.Lines.Add(vString);
    vStatusVenda := True;
    vTipoVenda := 'VENDA INICIADA';
    Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
    DM.cdsPedidos.Insert;
    DM.cdsPedidosTIPO_OPERACAO.AsString := 'VD';
//    DM.cdsPedidosDATA_PEDIDO.Value := Date;
//    DM.cdsPedidosHORA_PEDIDO.Value := Time;
    DM.cdsPedidosSTATUS.Value := 'P';
    DM.cdsPedidosPEDIDO_EM_VENDA.AsString := 'S';
    DM.cdsPedidosNUMERO_COMANDA.AsString := vComanda;
    DM.cdsPedidosID_CLIENTE.AsInteger := 0;
//    DM.cdsPedidosID_USUARIO.AsInteger := Conexao.RetornaIdentificadorUsuario(frmLogin.pNomeUsuario);
    vPedido := DM.cdsPedidosID_PEDIDO.AsInteger;
    DM.cdsPedidos.Post;
    DM.cdsPedidos.Close;
    DM.cdsPedidos.CommandText := 'SELECT * FROM PEDIDOS WHERE ID_PEDIDO = '+IntToStr(vPedido);
    DM.cdsPedidos.Open;
    DM.cdsPedidos.Locate('ID_PEDIDO',vPedido,[]);
    vString := '   Pedido Nº : '+IntToStr(DM.cdsPedidosID_PEDIDO.AsInteger);
    cxMemo1.Lines.Add(vString);
    FreeAndNil(Conexao);
    Application.ProcessMessages;
    edtPesquisa.SetFocus;
  end
  else
  begin
    MessageDlg('Esta comanda já está aberta',mtError,[mbok],0);
  end;
end;

procedure TfrmPdv.spbConfirmarVendaClick(Sender: TObject);
var
  //vContador:integer;
  vSomaValorTotal : Real;
  //vConectaServidor : TDSModuleDbClient;
begin
  if vStatusVenda then
  begin
//    try
//      vConectaServidor := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
//    except
//      MessageDlg('Sistema não está conectado ao servidor',mtError,[mbOK],0);
//      abort;
//    end;

    //vContador := 0;
    vSomaValorTotal := 0;
    DM.cdsPedidos_Itens.Close;
    DM.cdsPedidos_Itens.Params.ParambyName('ID_PEDIDO').AsInteger := DM.cdsPedidosID_PEDIDO.AsInteger;
    dm.cdsPedidos_Itens.Open;

    DM.cdsPedidos_Itens.First;
    while not dm.cdsPedidos_Itens.Eof do
    begin
      //Inc(vContador);
      vSomaValorTotal := vSomaValorTotal + dm.cdsPedidos_ItensVALOR_TOTAL.AsFloat;
      dm.cdsPedidos_Itens.Next;
    end;
    DM.cdsPedidos.Edit;
    dm.cdsPedidosVALOR_TOTAL.Value := vSomaValorTotal;
    //dm.cdsPedidosNUMERO_COMANDA.Value := 'COMANDA FECHADA';
    dm.cdsPedidosSTATUS.Value := 'P';
    DM.cdsPedidosPEDIDO_EM_VENDA.Value := 'N';
    DM.cdsPedidos.Post;
    try
      //Primeiro irei movimentar os produtos, caso não consiga
      //não gravo o pedido
      DM.cdsPedidos_Itens.First;
//      while not dm.cdsPedidos_Itens.Eof do
//      begin
//          if vConectaServidor.InserirEmMovimentacoes(DM.cdsPedidos_ItensID_PRODUTO.AsInteger,DM.cdsPedidos_ItensID_PEDIDO.AsInteger,
//                                                     DM.cdsPedidos_ItensQUANTIDADE.AsFloat,'Venda','S') = 0 then
//            break;
//        dm.cdsPedidos_Itens.Next;
//      end;
      DM.cdsPedidos.ApplyUpdates(0);
      dm.cdsPedidos_Itens.ApplyUpdates(0);
      {
      vString := '';
      vString := '________________________________________________________________';
      cxMemo1.Lines.Add(vString);
      vString := 'Quantidade de Itens : '+IntToStr(vContador);
      cxMemo1.Lines.Add(vString);
      vString := 'Valor Total dos Itens : '+FormatFloat('###,###,##0.00',vSomaValorTotal);
      cxMemo1.Lines.Add(vString);
      vString := 'Obrigado e Volte Sempre';
      cxMemo1.Lines.Add(vString); }
      MessageDlg('Venda finalizada com sucesso',mtConfirmation,[mbOk],0);

      edtPesquisa.Clear;
      edtDescricao.Clear;
      edtQuantidade.Clear;
      edtPreco.Clear;
      edtPrecoTotal.Clear;
      edtPesquisa.SetFocus;
      vStatusVenda := False;
      edtSubTotal.Text := '0,00';
//      Sleep(3000);
      cxMemo1.Lines.Clear;
      vTipoVenda := '';
    except
      DM.cdsPedidos_Itens.CancelUpdates;
      DM.cdsPedidos.CancelUpdates;
      MessageDlg('Não foi possível efetuar esta venda.',mtError,[mbOk],0);
    end;
  end
  else
  begin
    MessageDlg('Venda não foi iniciada.',mtError,[mbOk],0);
  end;
end;

procedure TfrmPdv.spbConsultarPrecoClick(Sender: TObject);
var
  Rel : TfrmRelatorios;
begin
  Rel := TfrmRelatorios.Create(Self);
  Rel.ConsultarPreco;
  FreeAndNil(Rel);
end;

end.
