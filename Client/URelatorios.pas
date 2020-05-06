unit URelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient,StrUtils, Vcl.StdCtrls, Vcl.Buttons, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Vcl.Menus, Vcl.DBCtrls, Vcl.Mask, Vcl.DBCGrids, cxButtons, cxGroupBox,
  UITypes;

type
  TfrmRelatorios = class(TForm)
    QRListagem: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
    QRLMédiaPonderada: TQRLabel;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRLTotalMediaPonderada: TQRLabel;
    QRComandas: TQuickRep;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRLNumeroComanda: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    QRLNumeroComanda2: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    cdsRelatorioGerencial: TClientDataSet;
    cdsRelatorioGerencialDESCRICAO_FORMA_DE_PAGAMENTO: TStringField;
    cdsRelatorioGerencialVALOR_TOTAL_PEDIDO: TFloatField;
    cdsRelatorioGerencialDATA: TDateField;
    cdsRelatorioGerencialID_PEDIDO: TIntegerField;
    QRRelatorioGerencial: TQuickRep;
    QRBand5: TQRBand;
    QRGroup1: TQRGroup;
    QRBand6: TQRBand;
    QRBand7: TQRBand;
    QRLabel12: TQRLabel;
    qrlPeriodo: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    qrlValorTotalPedido: TQRLabel;
    QRLabel17: TQRLabel;
    pnlConsultarProduto: TPanel;
    spbConfirmar: TSpeedButton;
    edtPesquisa: TEdit;
    Label1: TLabel;
    Image1: TImage;
    Label7: TLabel;
    edtPreco: TEdit;
    Label5: TLabel;
    edtDescricao: TEdit;
    Panel1: TPanel;
    pnlVinculo: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxBtnCancelar: TcxButton;
    cxBtnConfirmar: TcxButton;
    DBCtrlGrid1: TDBCtrlGrid;
    DBEdit1: TDBEdit;
    dbnConfirmar: TDBCheckBox;
    cdsVinculo: TClientDataSet;
    cdsVinculoCONDICAO_PAGAMENTO: TStringField;
    cdsVinculoCONFIRMA: TStringField;
    cdsVinculoID_FORMA_PAGAMENTO: TIntegerField;
    cdsVinculoID_CONDICAO_PAGAMENTO: TIntegerField;
    dsVinculo: TDataSource;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ImprimirRelatorioGerencial();
    procedure QRBand6BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure spbConfirmarClick(Sender: TObject);
    procedure edtPesquisaExit(Sender: TObject);
    procedure ConsultarPreco;
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxBtnConfirmarClick(Sender: TObject);
    procedure cxBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    vMediaPonderada,vTotalMediaPonderada:Real;
    vValorTotal : Real;
  public
    { Public declarations }
    procedure VincularFormaComCondicao(qForma:integer);
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}

uses UDataModul;

procedure TfrmRelatorios.ConsultarPreco;
begin
  with pnlConsultarProduto do
  begin
    Visible := True;
    BringToFront;
    Top := 1;
    Left := 1;
    Self.Width := Width +1;
    Self.Height := Height +20;
    Self.Caption := 'Business Controller';
    Caption := '';
  end;
  Self.Left := Trunc(Screen.Width / 2) - 200;
  Self.Top := Trunc(Screen.Height / 2) - 250;
  Self.ShowModal;
end;

procedure TfrmRelatorios.cxBtnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmRelatorios.cxBtnConfirmarClick(Sender: TObject);
var
  vcontador : smallint;
begin
  dm.cdsGenerico.Close;
  dm.cdsGenerico.CommandText := 'SELECT  DESCRICAO_FORMA_DE_PAGAMENTO FROM formas_de_pagamento WHERE id_forma_de_pagamento = '+
                                IntToStr(cdsVinculoID_FORMA_PAGAMENTO.AsInteger);
  dm.cdsGenerico.Active := True;
  cdsVinculo.First;
  vcontador := 0;
  while not cdsVinculo.Eof do
  begin
    if AnsiUpperCase(cdsVinculoCONFIRMA.AsString) = 'S' then
    begin
      inc(vcontador);
      dm.cdsFormasVSCondicoes.Insert;
      dm.cdsFormasVSCondicoesID_FORMA_DE_PAGAMENTO.AsInteger := cdsVinculoID_FORMA_PAGAMENTO.AsInteger;
      dm.cdsFormasVSCondicoesCONDICAO_DE_PAGAMENTO.AsString := cdsVinculoCONDICAO_PAGAMENTO.AsString;
      dm.cdsFormasVSCondicoesID_CONDICAO_DE_PAGAMENTO.AsInteger := cdsVinculoID_CONDICAO_PAGAMENTO.AsInteger;
      dm.cdsFormasVSCondicoesDESCRICAO_FORMA_DE_PAGAMENTO.AsString := dm.cdsGenerico.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;
      dm.cdsFormasVSCondicoes.Post;
    end;
    cdsVinculo.Next;
  end;
  if vcontador > 0 then
    MessageDlg('Foram vinculados '+intToStr(vcontador)+' condições de pagamento',mtConfirmation,[mbOK],0)
  else
    MessageDlg('Não foi vinculada nenhuma condições de pagamento',mtConfirmation,[mbOK],0);

  Self.Close;
end;

procedure TfrmRelatorios.edtPesquisaExit(Sender: TObject);
var
  cdsProdutos : TClientDataSet;
begin
  if not Assigned(cdsProdutos) then
  begin
    cdsProdutos := TClientDataSet.Create(Self);
    cdsProdutos.ProviderName := DM.cdsProdutos.ProviderName;
    cdsProdutos.RemoteServer := dm.cdsProdutos.RemoteServer;
  end;
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
    end;
    edtPesquisa.SetFocus;
  end;
  if Assigned(cdsProdutos) then
    FreeAndNil(cdsProdutos);
end;

procedure TfrmRelatorios.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    spbConfirmarClick(Self);

  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmRelatorios.ImprimirRelatorioGerencial;
//var
//  vDataInicial,vDataFinal,vString : string;
//  vData : TDateTime;
begin  {
  try
    vDataInicial := Trim(InputBox('Data inicial','Informe a data inicial'+#13+
                             'ex: xx/xx/xxxx',''));
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
    vData := StrToDate(vDataFinal);
  except on e:Exception do
    begin
      showmessage('Valor digitado é inválido'+#13+e.Message);
      abort;
    end;
  end;

  vValorTotal := 0;
  vDataInicial := ReplaceStr(vDataInicial,'/','.');
  vDataFinal := ReplaceStr(vDataFinal,'/','.');
  vString := '';
  vString := 'SELECT COALESCE(PFP.VALOR,0) AS VALOR,PED.DATA, FP.DESCRICAO_FORMA_DE_PAGAMENTO FROM PEDIDOS_X_FORMAS_PAGAMENTOS PFP'+
             ' LEFT OUTER JOIN PEDIDOS PED ON PED.ID_PEDIDO = PFP.ID_PEDIDO'+
             ' LEFT OUTER JOIN FORMAS_DE_PAGAMENTO FP ON FP.ID_FORMA_DE_PAGAMENTO = PFP.ID_FORMA_PAGAMENTO'+
             ' WHERE PED.DATA BETWEEN CAST('+QuotedStr(vDataInicial)+
             ' AS DATE) AND CAST('+QuotedStr(vDataFinal)+' AS DATE) ORDER BY DATA DESC';

//  vString := 'SELECT * FROM PEDIDOS WHERE DATA BETWEEN CAST('+QuotedStr(vDataInicial)+
//             ' AS DATE) AND CAST('+QuotedStr(vDataFinal)+' AS DATE) ORDER BY DATA DESC';

  dm.cdsGenerico.Close;
  dm.cdsGenerico.CommandText := vString;

  dm.cdsGenerico.Open;
  DM.cdsGenerico.First;
  cdsRelatorioGerencial.Close;
  cdsRelatorioGerencial.CreateDataSet;
  cdsRelatorioGerencial.EmptyDataSet;
  while not DM.cdsGenerico.Eof do
  begin
    if not cdsRelatorioGerencial.Locate('DESCRICAO_FORMA_DE_PAGAMENTO;DATA',VarArrayOf([dm.cdsGenerico.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString,
                                        DM.cdsGenerico.FieldByName('DATA').AsDateTime]),[]) then
    begin
      cdsRelatorioGerencial.Append;
      cdsRelatorioGerencialDESCRICAO_FORMA_DE_PAGAMENTO.Value := DM.cdsGenerico.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;
      cdsRelatorioGerencialVALOR_TOTAL_PEDIDO.Value := DM.cdsGenerico.FieldByName('VALOR').AsFloat;
      cdsRelatorioGerencialDATA.Value := DM.cdsGenerico.FieldByName('DATA').AsDateTime;
//      vValorTotal := vValorTotal + DM.cdsGenerico.FieldByName('VALOR').AsFloat;
    end
    else
    begin
      cdsRelatorioGerencial.Edit;
      cdsRelatorioGerencialVALOR_TOTAL_PEDIDO.Value := cdsRelatorioGerencialVALOR_TOTAL_PEDIDO.AsFloat +
                                                       DM.cdsGenerico.FieldByName('VALOR').AsFloat;
//      vValorTotal := vValorTotal + DM.cdsGenerico.FieldByName('VALOR').AsFloat;
    end;
    cdsRelatorioGerencial.Post;
    DM.cdsGenerico.Next;
  end;
  vDataInicial := ReplaceStr(vDataInicial,'.','/');
  vDataFinal := ReplaceStr(vDataFinal,'.','/');
  qrlPeriodo.Caption := 'Periodo de '+vDataInicial+' até '+vDataFinal;
  cdsRelatorioGerencial.AddIndex('DATA','DATA;VALOR_TOTAL_PEDIDO',[]);
  cdsRelatorioGerencial.IndexName := 'DATA';
  QRRelatorioGerencial.Preview;
  cdsRelatorioGerencial.DeleteIndex('DATA');}
end;

procedure TfrmRelatorios.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vTotalMediaPonderada := 0;
  vMediaPonderada := 0;
end;

procedure TfrmRelatorios.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  try
    vMediaPonderada := DM.cdsProdutosPRO_SALDO.AsFloat * DM.cdsProdutosPRECO_VENDA.AsFloat;
  except
    vMediaPonderada := 0;
  end;
  QRLMédiaPonderada.Caption := FormatFloat('###,###,##0.00',vMediaPonderada);
  vTotalMediaPonderada := vTotalMediaPonderada + vMediaPonderada;
end;

procedure TfrmRelatorios.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLTotalMediaPonderada.Caption := FormatFloat('###,###,##0.00',vTotalMediaPonderada);
  vTotalMediaPonderada := 0;
end;

procedure TfrmRelatorios.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vValorTotal := vValorTotal + cdsRelatorioGerencialVALOR_TOTAL_PEDIDO.AsFloat;
end;

procedure TfrmRelatorios.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlValorTotalPedido.Caption := FormatFloat('###,###,##0.00',vValorTotal);
  vValorTotal := 0;
end;

procedure TfrmRelatorios.spbConfirmarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmRelatorios.VincularFormaComCondicao(qForma: integer);
begin
  if not dm.cdsGenerico.Active then
    dm.cdsGenerico.Active := True;
  dm.cdsGenerico.Close;
  dm.cdsGenerico.CommandText := 'SELECT CP.condicao_de_pagamento,CP.id_condicao_de_pagamento FROM condicoes_de_pagamento CP'+
                                ' WHERE CP.id_condicao_de_pagamento NOT IN ( '+
                                ' SELECT FC.id_condicao_de_pagamento FROM formas_vs_condicoes FC'+
                                ' WHERE FC.id_forma_de_pagamento = '+IntToStr(qForma)+')';
  dm.cdsGenerico.Active := True;
  if dm.cdsGenerico.RecordCount = 0 then
    MessageDlg('No momento não existe nenhuma condição de pagamento cadastrada'+#13+
               'ou todas já foram vinculadas a esta forma de pagamento',mtWarning,[mbOK],0)
  else
  begin
    dm.cdsGenerico.First;
    cdsVinculo.Close;
    cdsVinculo.CreateDataSet;
    cdsVinculo.EmptyDataSet;
    while not dm.cdsGenerico.Eof do
    begin
      cdsVinculo.Append;
      cdsVinculoCONDICAO_PAGAMENTO.AsString := dm.cdsGenerico.FieldByName('condicao_de_pagamento').AsString;
      cdsVinculoID_CONDICAO_PAGAMENTO.AsInteger := dm.cdsGenerico.FieldByName('id_condicao_de_pagamento').AsInteger;
      cdsVinculoCONFIRMA.Value := 'N';
      cdsVinculoID_FORMA_PAGAMENTO.Value := qForma;
      cdsVinculo.Post;
      dm.cdsGenerico.Next;
    end;
    pnlVinculo.Visible := true;
    pnlVinculo.Left := 0;
    pnlVinculo.Top := 0;
    Self.BorderIcons := [];
    Self.BorderStyle := bsNone;
    Self.Width := pnlVinculo.Width + 1;
    Self.Height := pnlVinculo.Height + 1;
    Self.Top := trunc(Screen.Height / 2)-200;
    Self.Left := trunc(Screen.Width / 2)-200;
    Self.ShowModal;
  end;
end;

end.
