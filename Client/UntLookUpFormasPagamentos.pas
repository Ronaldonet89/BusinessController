unit UntLookUpFormasPagamentos;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxButtons, cxGroupBox,
  Vcl.Mask, Vcl.DBCtrls, cxLabel,UITypes{, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light};

type
  TfrmlookUpFormaPagamento = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGridFormaPagamento: TcxGrid;
    cxGridFormaPagamentoDBTableView1: TcxGridDBTableView;
    cxGridFormaPagamentoLevel1: TcxGridLevel;
    cxGridFormaPagamentoDBTableView1FORMA_DE_PAGAMENTO: TcxGridDBColumn;
    cxGridCondicaoDBTableView1: TcxGridDBTableView;
    cxGridCondicaoLevel1: TcxGridLevel;
    cxGridCondicao: TcxGrid;
    cxGridCondicaoDBTableView1CONDICAO_DE_PAGAMENTO: TcxGridDBColumn;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1VALOR: TcxGridDBColumn;
    cxGrid3DBTableView1DESCRICAO_FORMA_DE_PAGAMENTO: TcxGridDBColumn;
    cxGrid3DBTableView1CONDICAO_DE_PAGAMENTO: TcxGridDBColumn;
    DBEdit1: TDBEdit;
    cxlblValorPedido: TcxLabel;
    cxlblValorParcelado: TcxLabel;
    cxLblSaldo: TcxLabel;
    cxButton2: TcxButton;
    procedure cxGridFormaPagamentoDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridFormaPagamentoDBTableView1MouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure cxGridFormaPagamentoDBTableView1MouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure cxGridFormaPagamentoDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxGridCondicaoDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Change(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGrid3Enter(Sender: TObject);
    procedure cxGrid3Exit(Sender: TObject);
  private
    { Private declarations }
    vValorParcelado, vlPedido : Real;
  public
    { Public declarations }
    vContinua : Boolean;
    vtroco: real;
  end;

var
  frmlookUpFormaPagamento: TfrmlookUpFormaPagamento;

implementation

{$R *.dfm}

uses UDataModul, UProceduresClient, UntComposicaoVenda;

procedure TfrmlookUpFormaPagamento.cxGridFormaPagamentoDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  LocalizarCondicoesVinculadasAFormaDePagamento(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
end;

procedure TfrmlookUpFormaPagamento.cxGridFormaPagamentoDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    cxGridCondicao.Enabled := True;
    cxGridCondicao.SetFocus;
  end;
end;

procedure TfrmlookUpFormaPagamento.cxGridFormaPagamentoDBTableView1MouseWheelDown(
  Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  LocalizarCondicoesVinculadasAFormaDePagamento(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
end;

procedure TfrmlookUpFormaPagamento.cxGridFormaPagamentoDBTableView1MouseWheelUp(
  Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  LocalizarCondicoesVinculadasAFormaDePagamento(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
end;

procedure TfrmlookUpFormaPagamento.DBEdit1Change(Sender: TObject);
begin
  LocalizarCondicoesVinculadasAFormaDePagamento(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
end;

procedure TfrmlookUpFormaPagamento.cxButton1Click(Sender: TObject);
begin
  vContinua := False;
  Self.Close;
end;

procedure TfrmlookUpFormaPagamento.cxButton2Click(Sender: TObject);
begin
  if dm.cdsPedidos_Formas_Condicoes.RecordCount > 0 then
    if MessageDlg('Deseja Excluir as condições deste Pedido?',mtWarning,[mbno,mbYes],0)= mrYes then
      dm.cdsPedidos_Formas_Condicoes.Delete;
end;

procedure TfrmlookUpFormaPagamento.cxGrid3Enter(Sender: TObject);
begin
  cxButton2.Enabled:= true;
end;

procedure TfrmlookUpFormaPagamento.cxGrid3Exit(Sender: TObject);
begin
  cxButton2.Enabled:= False;
end;

procedure TfrmlookUpFormaPagamento.cxGridCondicaoDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vValor,vValorTotalParcelado, vDesconto : Real;

begin
  if Key = VK_RETURN then
  begin
    //vValor := 0;
    //vValorTotalParcelado := 0;
    if not dm.cdsPedidos_Formas_Condicoes.Active then
      dm.cdsPedidos_Formas_Condicoes.Active := true;

    try
      FrmComposicaoVenda := TFrmComposicaoVenda.Create(Self);
      if DM.cdsPedidosVALOR_DESCONTO.AsFloat <= 0 then
      begin
        FrmComposicaoVenda.Label2.visible:= true;
        FrmComposicaoVenda.edtDesconto.visible:= true;
      end
      else
      begin
        FrmComposicaoVenda.Label2.visible:= false;
        FrmComposicaoVenda.edtDesconto.visible:= false;
      end;

      FrmComposicaoVenda.vlPagar:= vlPedido;
      FrmComposicaoVenda.ShowModal;
      vValor := (FrmComposicaoVenda.EdtValor.Value - FrmComposicaoVenda.cxTroco.Value);
      vDesconto := FrmComposicaoVenda.EdtDesconto.Value;
      vtroco   := FrmComposicaoVenda.vlTroco;
      FreeAndNil(FrmComposicaoVenda);

      if vDesconto > 0 then
      begin
        DM.cdsPedidos.Edit;
        DM.cdsPedidosVALOR_DESCONTO.AsFloat:= vDesconto;
        DM.cdsPedidos.Post;
      end;

      if vValor > DM.cdsPedidosVALOR_TOTAL.AsFloat then
      begin
        MessageDlg('O valor informado ultrapassa o valor do pedido',mtError,[mbOK],0);
        exit;
      end;
      vValorTotalParcelado := 0;
      dm.cdsPedidos_Formas_Condicoes.DisableControls;
      dm.cdsPedidos_Formas_Condicoes.First;
//      vValor := 0;
      while not dm.cdsPedidos_Formas_Condicoes.Eof do
      begin
        vValorTotalParcelado := vValorTotalParcelado + dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat;
        dm.cdsPedidos_Formas_Condicoes.Next;
      end;
      dm.cdsPedidos_Formas_Condicoes.EnableControls;

      if (vValorTotalParcelado + vValor) > dm.cdsPedidosVALOR_TOTAL.AsFloat then
      begin
        MessageDlg('O valor informado mais o total já parcelado ultrapassa o valor do pedido',mtError,[mbOK],0);
        exit;
      end;
      dm.cdsPedidos_Formas_Condicoes.Insert;
      dm.cdsPedidos_Formas_CondicoesID_PEDIDO.AsInteger := dm.cdsPedidosID_PEDIDO.AsInteger;
      dm.cdsPedidos_Formas_CondicoesID_CONDICAO_DE_PAGAMENTO.AsInteger := DM.cdsFormasVSCondicoesID_CONDICAO_DE_PAGAMENTO.AsInteger;
      dm.cdsPedidos_Formas_CondicoesCONDICAO_DE_PAGAMENTO.AsString := DM.cdsFormasVSCondicoesCONDICAO_DE_PAGAMENTO.AsString;
      dm.cdsPedidos_Formas_CondicoesID_FORMA_DE_PAGAMENTO.AsInteger := dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger;
      dm.cdsPedidos_Formas_CondicoesDESCRICAO_FORMA_DE_PAGAMENTO.AsString := dm.cdsFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO.AsString;
      dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat := vValor;
      cxGridCondicao.Enabled := False;
      dm.cdsPedidos_Formas_Condicoes.Post;
      dm.cdsPedidos_Formas_Condicoes.DisableControls;
      dm.cdsPedidos_Formas_Condicoes.First;
      vValor := 0;
      while not dm.cdsPedidos_Formas_Condicoes.Eof do
      begin
        vValor := vValor + dm.cdsPedidos_Formas_CondicoesVALOR.AsFloat;
        dm.cdsPedidos_Formas_Condicoes.Next;
      end;
      vValorParcelado := vValor;
      cxlblValorParcelado.Caption := 'Valor parcelado R$ '+FormatFloat('###,###,##0.00',vValorParcelado);
      dm.cdsPedidos_Formas_Condicoes.EnableControls;
      cxLblSaldo.Caption := 'Saldo R$ '+FormatFloat('###,###,##0.00',dm.cdsPedidosVALOR_TOTAL.AsFloat - vValorParcelado-DM.cdsPedidosVALOR_DESCONTO.AsFloat);
      if vValor < (dm.cdsPedidosVALOR_TOTAL.AsFloat-DM.cdsPedidosVALOR_DESCONTO.AsFloat) then
        cxGridFormaPagamento.SetFocus
      else
      begin
        vContinua := True;
        Self.Close;
      end;
    except on e:exception do
      begin
        MessageDlg('O valor informado não é válido'+#13+
                   e.Message,mtError,[mbOK],0);
      end;
    end;
  end;
end;

procedure TfrmlookUpFormaPagamento.FormShow(Sender: TObject);
begin
  cxGridCondicao.Enabled := False;
  dm.cdsPedidos_Formas_Condicoes.Close;
  dm.cdsPedidos_Formas_Condicoes.CommandText := 'SELECT * FROM PEDIDOS_FORMAS_CONDICOES WHERE ID_PEDIDO = '+IntToStr(dm.cdsPedidosID_PEDIDO.AsInteger);
  dm.cdsPedidos_Formas_Condicoes.Active := True;

  if not dm.cdsFormasDePagamento.Active then
    dm.cdsFormasDePagamento.Active := true;

  LocalizarCondicoesVinculadasAFormaDePagamento(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
  cxGridFormaPagamento.SetFocus;
  cxlblValorPedido.Caption := 'Valor do pedido R$ '+FormatFloat('###,###,##0.00',dm.cdsPedidosVALOR_TOTAL.AsFloat);
  vValorParcelado := 0;
  cxlblValorParcelado.Caption := 'Valor parcelado R$ '+FormatFloat('###,###,##0.00',vValorParcelado);
  cxLblSaldo.Caption := 'Saldo R$ '+FormatFloat('###,###,##0.00',vValorParcelado);
  vContinua := False;
  vlPedido:= dm.cdsPedidosVALOR_TOTAL.AsFloat;
end;

end.
