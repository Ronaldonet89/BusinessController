unit UntReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, cxPC, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Menus,
  cxButtons, Vcl.ExtCtrls, Vcl.Buttons, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxNavigator, Vcl.Imaging.pngimage, cxContainer, cxLabel,System.UITypes;

type
  TfrmReceber = class(TForm)
    cxPcPrincipal: TcxPageControl;
    cxGridReceberDBTableView1: TcxGridDBTableView;
    cxGridReceberLevel1: TcxGridLevel;
    cxGridReceber: TcxGrid;
    cxTSPrincipal: TcxTabSheet;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel1: TPanel;
    DBEdit7: TDBEdit;
    cxGridReceberDBTableView1ID_RECEBER: TcxGridDBColumn;
    cxGridReceberDBTableView1DESCRICAO_TITULO: TcxGridDBColumn;
    cxGridReceberDBTableView1VALOR_TITULO: TcxGridDBColumn;
    cxGridReceberDBTableView1STATUS: TcxGridDBColumn;
    DBEdit10: TDBEdit;
    spbConfirmarPagamento: TSpeedButton;
    Panel2: TPanel;
    Label6: TLabel;
    Image2: TImage;
    cxNavigatorReceber: TcxNavigator;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxButton1: TcxButton;
    DBEdit9: TDBEdit;
    cxLabel10: TcxLabel;
    spbVoltarStatusPendente: TSpeedButton;
    spbCancelarTitulo: TSpeedButton;
    cxButton2: TcxButton;
    cxGridReceberDBTableView1NOME_CLIENTE: TcxGridDBColumn;
    DBComboBox1: TDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure spbConfirmarPagamentoClick(Sender: TObject);
    procedure cxGridReceberDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure BackToMainForm(Sender: TObject);
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
  frmReceber: TfrmReceber;

implementation

{$R *.dfm}

uses GroupedItems1, UDataModul, UntFormasDePagamento, UntLookUpClientes;

procedure TfrmReceber.BackToMainForm(Sender: TObject);
begin
  Close;
//  Hide;
//  SplitForm.BringToFront;
end;

procedure TfrmReceber.cxButton1Click(Sender: TObject);
begin
  if DM.cdsReceber.State in [dsEdit,dsInsert] then
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
    dm.cdsReceberFORMA_PAGAMENTO.AsString := DM.cdsFormasDePagamentoDESCRICAO_FORMA_DE_PAGAMENTO.AsString;
  end;
end;

procedure TfrmReceber.cxButton2Click(Sender: TObject);
begin

  if DM.cdsReceber.State in [dsEdit,dsInsert] then
  begin
    if not assigned(frmLookUpClientes) then
    frmLookUpClientes := TfrmLookUpClientes.Create(Self);

    frmLookUpClientes.Left := Trunc(Screen.Width / 2) - 200;
    frmLookUpClientes.Top := Trunc(Screen.Height / 2) - 200;

    if not dm.cdsClientes.Active then
      dm.cdsClientes.Active := True;
    frmLookUpClientes.ShowModal;
    dm.cdsReceberID_CLIENTE.AsInteger := dm.cdsClientesID_CLIENTE.AsInteger;
    dm.cdsReceberNOME_CLIENTE.AsString := DM.cdsClientesRAZAO_SOCIAL.AsString;
    FreeAndNil(frmLookUpClientes);
  end;
end;

procedure TfrmReceber.cxGridReceberDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Status: string;
begin

  if dm.cdsReceber.RecordCount > 0 then
  begin
    if dm.cdsReceberSTATUS.AsString <> '' then
    begin

      try
        if VarAsType(cxGridReceberDBTableView1.ViewData.Records[AViewInfo.GridRecord.Index].Values[cxGridReceberDBTableView1STATUS.Index], varString ) <> null then
          Status := VarAsType(cxGridReceberDBTableView1.ViewData.Records[AViewInfo.GridRecord.Index].Values[cxGridReceberDBTableView1STATUS.Index], varString );
      except
        Status := '';
      end;

      if Status <> '' then
      begin
        if Status  = 'Aguardando recebimento' then
          ACanvas.Font.Color := clBlue;

        if Status  = 'Titulo vencido' then
          ACanvas.Font.Color := clRed;

        if Status  = 'Titulo recebido' then
          ACanvas.Font.Color := clGreen;

        if Status  = 'Titulo cancelado' then
          ACanvas.Font.Color := clSilver;
      end;
    end;
  end;

end;

procedure TfrmReceber.cxNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
       //Excluir              //Editar
  if (AButtonIndex = 8) or (AButtonIndex = 9) then
  begin
    if Ansiuppercase(dm.cdsReceberSTATUS.AsString) = 'TITULO RECEBIDO' then
    begin
      MessageDlg('Este título está realizado'+#13+
                 'não podendo ser alterado',mtError,[mbOK],0);
      dm.cdsReceber.CancelUpdates;
      abort;
    end;

    if Ansiuppercase(dm.cdsReceberSTATUS.AsString) = 'TITULO CANCELADO' then
    begin
      MessageDlg('Este título está cancelado'+#13+
                 'não podendo ser alterado',mtError,[mbOK],0);
      dm.cdsReceber.CancelUpdates;
      abort;
    end;
  end;
  if AButtonIndex = 10 then
  begin

    if dm.cdsReceberVENCIMENTO.AsDateTime = null then
    begin
      messagedlg('Não foi preenchido o campo data de vencimento',mtError,[mbOK],0);
      abort;
    end;

    if dm.cdsReceberSTATUS.AsString = '' then
    begin
      messagedlg('Não foi preenchido o campo status',mtError,[mbOK],0);
      abort;
    end;

    if dm.cdsReceberVALOR_TITULO.AsFloat = 0 then
    begin
      messagedlg('Não foi preenchido o campo Vslor',mtError,[mbOK],0);
      abort;
    end;

    if dm.cdsReceberVENCIMENTO.AsDateTime < date then
      dm.cdsReceberSTATUS.AsString := 'Titulo vencido'
    else
      dm.cdsReceberSTATUS.AsString := 'Aguardando recebimento';
  end;
end;

procedure TfrmReceber.FormShow(Sender: TObject);
begin

    DM.cdsReceber.Close;
    DM.cdsReceber.Open;

end;

procedure TfrmReceber.spbCancelarTituloClick(Sender: TObject);
begin
  if DM.cdsReceber.RecordCount = 0 then
  begin
    showmessage('No momento não está sendo visualizado nenhum título');
    abort;
  end;
  if DM.cdsReceber.State in [dsEdit,dsInsert] then abort;

  if DM.cdsReceberSTATUS.AsString <> 'Titulo recebido' then
  begin
    showmessage('Este título não está recebido');
    abort;
  end;
//
  DM.cdsReceber.Edit;
  DM.cdsReceberSTATUS.AsString := 'Título cancelado';
  try
    DM.cdsReceber.Post;
    DM.cdsReceber.Refresh;
    showmessage('Cancelamento do título realizado com sucesso');
  except on e:exception do
    begin
      DM.cdsReceber.CancelUpdates;
      showmessage('Não foi possível efetuar o cancelamento deste título'+#13+
                  'Erro do sistema : '+e.Message);
    end;
  end;
end;

procedure TfrmReceber.spbConfirmarPagamentoClick(Sender: TObject);
//var
  //vIdReceber : integer;
begin
  if DM.cdsReceber.RecordCount = 0 then
  begin
    showmessage('No momento não está sendo visualizado nenhum título');
    abort;
  end;
  if DM.cdsReceber.State in [dsEdit,dsInsert] then abort;
//
  if DM.cdsReceberSTATUS.AsString = 'Realizado' then
  begin
    showmessage('Este título já está realizado');
    abort;
  end;
  dm.cdsReceber.Edit;
  dm.cdsReceberSTATUS.AsString := 'Titulo recebido';
  dm.cdsReceberVALOR_PAGO.AsFloat := dm.cdsReceberVALOR_TITULO.AsFloat;
  try
    dm.cdsReceber.Post;
    showmessage('Título realizado com sucesso');
  except on e:exception do
    begin
      cxNavigatorReceber.ClickButton(11);
      showmessage('Não foi possível efetuar realização deste título'+#13+
                  'Erro do sistema : '+e.Message);
    end;
  end;
end;

procedure TfrmReceber.spbVoltarStatusPendenteClick(Sender: TObject);
begin
  if DM.cdsReceber.RecordCount = 0 then
  begin
    showmessage('No momento não está sendo visualizado nenhum título');
    abort;
  end;
  if DM.cdsReceber.State in [dsEdit,dsInsert] then abort;

  if DM.cdsReceberSTATUS.AsString <> 'Titulo recebido' then
  begin
    showmessage('Este título não está recebido');
    abort;
  end;
//
  DM.cdsReceber.Edit;
  DM.cdsReceberSTATUS.AsString := 'Aguardando recebimento';
  dm.cdsReceberVALOR_PAGO.AsFloat := 0;
  try
    DM.cdsReceber.Post;
    showmessage('Cancelamento do pagamento do título realizado com sucesso');
  except on e:exception do
    begin
      DM.cdsPagar.CancelUpdates;
      showmessage('Não foi possível efetuar o cancelamento do recebimento deste título'+#13+
                  'Erro do sistema : '+e.Message);
    end;
  end;
end;

end.


