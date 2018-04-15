unit UntPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, Menus, cxPCdxBarPopupMenu, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  cxPC, cxButtons, Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.Buttons, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxNavigator, Vcl.Imaging.pngimage,
  cxContainer, cxLabel;

type
  TfrmPagar = class(TForm)
    cxGrid1: TcxGrid;
    cxGridPagar: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxPcPrincipal: TcxPageControl;
    cxTSPrincipal: TcxTabSheet;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit6: TDBEdit;
    cxGridPagarID_PAGAR: TcxGridDBColumn;
    cxGridPagarDESCRICAO_TITULO: TcxGridDBColumn;
    cxGridPagarVENCIMENTO: TcxGridDBColumn;
    cxGridPagarVALOR_TITULO: TcxGridDBColumn;
    cxGridPagarSTATUS: TcxGridDBColumn;
    spbConfirmarPagamento: TSpeedButton;
    Panel2: TPanel;
    Label9: TLabel;
    Image2: TImage;
    cxNavigator1: TcxNavigator;
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
    DBEdit9: TDBEdit;
    cxButton1: TcxButton;
    cxGridPagarColumn1: TcxGridDBColumn;
    spbVoltarStatusPendente: TSpeedButton;
    spbCancelarTitulo: TSpeedButton;
    cxButton2: TcxButton;
    cxGridPagarNOME_FORNECEDOR: TcxGridDBColumn;
    procedure cxBtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbConfirmarPagamentoClick(Sender: TObject);
    procedure cxGridPagarCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Image2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure spbVoltarStatusPendenteClick(Sender: TObject);
    procedure spbCancelarTituloClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPagar: TfrmPagar;

implementation

{$R *.dfm}

uses UDataModul, UntFormasDePagamento, UntLookUpFornecedores;



procedure TfrmPagar.cxBtnApagarClick(Sender: TObject);
begin
//  if MessageDlg('Deseja realmente apagar este item ?',mtInformation,[mbYes,mbNo],0) = mrYes then
//  begin
//    DM.cdsPagar.Delete;
//    DM.cdsPagar.ApplyUpdates(0);
//  end
//  else
//    DM.cdsPagar.CancelUpdates;
end;

procedure TfrmPagar.cxButton1Click(Sender: TObject);
begin
  if DM.cdsPagar.State in [dsEdit,dsInsert] then
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
    dm.cdsPagarFORMA_PAGAMENTO.AsString := DM.cdsFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO.AsString;
  end;
end;

procedure TfrmPagar.cxButton2Click(Sender: TObject);
begin
  if DM.cdsPagar.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(frmlookUpFornecedores) then
      frmlookUpFornecedores := TfrmlookUpFornecedores.Create(Self);
    frmlookUpFornecedores.Left := Trunc(Screen.Width / 2) - 200;
    frmlookUpFornecedores.Top := Trunc(Screen.Height / 2) - 200;

    if not dm.cdsFornecedores.Active then
      dm.cdsFornecedores.Active := True;
    frmlookUpFornecedores.ShowModal;
    dm.cdsPagarID_FORNECEDOR.AsInteger := DM.cdsFornecedoresID_FORNECEDOR.AsInteger;
    dm.cdsPagarNOME_FORNECEDOR.AsString := dm.cdsFornecedoresRAZAO_SOCIAL.AsString;
  end;
end;

procedure TfrmPagar.cxGridPagarCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Status: string;
begin
  try
    Status := VarAsType(cxGridPagar.ViewData.Records[AViewInfo.GridRecord.Index].Values[ cxGridPagarSTATUS.Index], varString );
  except
    Status := '';
  end;

  if Status <> '' then
  begin
    if Status  = 'Aguardando pagamento' then
      ACanvas.Font.Color := clBlue;

    if Status  = 'Titulo vencido' then
      ACanvas.Font.Color := clRed;

    if Status  = 'Titulo pago' then
      ACanvas.Font.Color := clGreen;

    if Status  = 'Titulo cancelado' then
      ACanvas.Font.Color := clSilver;
  end;
  {
  if not AViewInfo.Selected then
  begin
    if trim(DM.cdsPagarSTATUS.AsString) <> '' then
    begin
      Status := VarAsType(cxGridPagar.ViewData.Records[AViewInfo.GridRecord.Index].Values[ cxGridPagarSTATUS.Index], varString );

      if Status  = 'Aguardando pagamento' then
        ACanvas.Font.Color := clYellow;

      if Status  = 'Titulo vencido' then
      begin
//        ACanvas.Brush.Color := clRed;
        ACanvas.Font.Color := clRed;
      end;

      if Status  = 'Titulo pago' then
        ACanvas.Font.Color := clGreen;
    end;
  end;}
end;

procedure TfrmPagar.cxNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if (AButtonIndex = 8) or (AButtonIndex = 9) then
  begin
    if Ansiuppercase(dm.cdsPagarSTATUS.AsString) = 'TITULO PAGO' then
    begin
      MessageDlg('Este título está realizado'+#13+
                 'não podendo ser alterado',mtError,[mbOK],0);
      dm.cdsPagar.CancelUpdates;
      abort;
    end;

    if Ansiuppercase(dm.cdsPagarSTATUS.AsString) = 'TITULO CANCELADO' then
    begin
      MessageDlg('Este título está cancelado'+#13+
                 'não podendo ser alterado',mtError,[mbOK],0);
      dm.cdsPagar.CancelUpdates;
      abort;
    end;
  end;

  if AButtonIndex = 10 then
  begin
    if dm.cdsPagarVENCIMENTO.IsNull then
    begin
      messagedlg('Não foi preenchido o campo data de vencimento',mtError,[mbOK],0);
      abort;
    end;
    if dm.cdsPagarVENCIMENTO.AsDateTime < date then
      dm.cdsPagarSTATUS.AsString := 'Titulo vencido'
    else
      dm.cdsPagarSTATUS.AsString := 'Aguardando pagamento';
  end;
end;

procedure TfrmPagar.FormShow(Sender: TObject);
begin
  if not dm.cdsPagar.Active then
    dm.cdsPagar.Active := true
  else
  begin
    dm.cdsPagar.Close;
    dm.cdsPagar.Open;
  end;
end;

procedure TfrmPagar.Image2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPagar.spbCancelarTituloClick(Sender: TObject);
begin
  if DM.cdsPagar.RecordCount = 0 then
  begin
    showmessage('No momento não está sendo visualizado nenhum título');
    abort;
  end;
  if DM.cdsPagar.State in [dsEdit,dsInsert] then abort;

  if DM.cdsPagarSTATUS.AsString <> 'Titulo pago' then
  begin
    showmessage('Este título não está pago');
    abort;
  end;
//
  DM.cdsPagar.Edit;
  DM.cdsPagarSTATUS.AsString := 'Título cancelado';
  try
    DM.cdsPagar.Post;
    DM.cdsPagar.Refresh;
    showmessage('Cancelamento do título realizado com sucesso');
  except on e:exception do
    begin
      DM.cdsPagar.CancelUpdates;
      showmessage('Não foi possível efetuar o cancelamento deste título'+#13+
                  'Erro do sistema : '+e.Message);
    end;
  end;
end;

procedure TfrmPagar.spbConfirmarPagamentoClick(Sender: TObject);
begin
  if DM.cdsPagar.RecordCount = 0 then
  begin
    showmessage('No momento não está sendo visualizado nenhum título');
    abort;
  end;
  if DM.cdsPagar.State in [dsEdit,dsInsert] then abort;

  if DM.cdsPagarSTATUS.AsString = 'Titulo pago' then
  begin
    showmessage('Este título já está pago');
    abort;
  end;
//
  DM.cdsPagar.Edit;
  DM.cdsPagarSTATUS.AsString := 'Titulo pago';
  dm.cdsPagarDATA_PAGAMENTO.Value := date;
  dm.cdsPagarVALOR_PAGO.AsFloat := dm.cdsPagarVALOR_TITULO.AsFloat;
  try
    DM.cdsPagar.Post;
    DM.cdsPagar.Refresh;
    showmessage('Título realizado com sucesso');
  except on e:exception do
    begin
      DM.cdsPagar.CancelUpdates;
      showmessage('Não foi possível efetuar realização deste título'+#13+
                  'Erro do sistema : '+e.Message);
    end;
  end;
end;

procedure TfrmPagar.spbVoltarStatusPendenteClick(Sender: TObject);
begin
  if DM.cdsPagar.RecordCount = 0 then
  begin
    showmessage('No momento não está sendo visualizado nenhum título');
    abort;
  end;
  if DM.cdsPagar.State in [dsEdit,dsInsert] then abort;

  if DM.cdsPagarSTATUS.AsString <> 'Titulo pago' then
  begin
    showmessage('Este título não está pago');
    abort;
  end;
//
  DM.cdsPagar.Edit;
  DM.cdsPagarSTATUS.AsString := 'Aguardando pagamento';
  dm.cdsPagarDATA_PAGAMENTO.Value := null;
  dm.cdsPagarVALOR_PAGO.AsFloat := 0;
  try
    DM.cdsPagar.Post;
    DM.cdsPagar.Refresh;
    showmessage('Cancelamento do pagamento do título realizado com sucesso');
  except on e:exception do
    begin
      DM.cdsPagar.CancelUpdates;
      showmessage('Não foi possível efetuar o cancelamento do pagamento deste título'+#13+
                  'Erro do sistema : '+e.Message);
    end;
  end;
end;

end.
