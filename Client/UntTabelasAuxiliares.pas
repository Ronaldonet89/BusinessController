unit UntTabelasAuxiliares;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, cxLabel, cxDBNavigator, cxGroupBox, cxPC,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus, cxButtons;

type
  TfrmTabelasAuxiliares = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    cxPCPrincipal: TcxPageControl;
    cxtsTabelasauxiliaresNFe: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxDBNavigator1: TcxDBNavigator;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox6: TcxGroupBox;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    cxGroupBox4: TcxGroupBox;
    cxDBNavigator2: TcxDBNavigator;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1CODIGO_NCM: TcxGridDBColumn;
    cxGrid1DBTableView1UF_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1PERCENTUAL_IVA: TcxGridDBColumn;
    cxGrid1DBTableView1ALIQUOTA_ICMS: TcxGridDBColumn;
    cxGrid1DBTableView1PERCENTUAL_REDUCAO: TcxGridDBColumn;
    cxGroupBox7: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    cxGroupBox8: TcxGroupBox;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    cxGroupBox9: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    cxLabel20: TcxLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    cxLabel21: TcxLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DESCRICAO_TIPO_OPERACAO: TcxGridDBColumn;
    DBEdit18: TDBEdit;
    cxLabel5: TcxLabel;
    cxTSFormas_Condicoes: TcxTabSheet;
    cxPCTabelasAuxiliares: TcxPageControl;
    cxTSFormasDePagamento: TcxTabSheet;
    cxTSCondicoesPagamento: TcxTabSheet;
    cxTSFormasDeEntrega: TcxTabSheet;
    cxTSGrupoProduto: TcxTabSheet;
    cxGroupBox17: TcxGroupBox;
    cxDBNavigator5: TcxDBNavigator;
    cxGrid5: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBTableView2GRUPO_PRODUTO_DESCRICAO: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGroupBox19: TcxGroupBox;
    cxDBNavigator6: TcxDBNavigator;
    cxGrid6: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGroupBox10: TcxGroupBox;
    cxDBNavigator7: TcxDBNavigator;
    cxGrid7: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxGroupBox13: TcxGroupBox;
    cxDBNavigator4: TcxDBNavigator;
    cxButton1: TcxButton;
    cxGroupBox11: TcxGroupBox;
    cxGroupBox12: TcxGroupBox;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGroupBox14: TcxGroupBox;
    cxGrid4: TcxGrid;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4DBTableView1FORMA_DE_PAGAMENTO: TcxGridDBColumn;
    cxGrid4DBTableView1EFETUA_REALIZACAO_DO_TITULO: TcxGridDBColumn;
    cxGrid4DBTableView1EFETUA_MOVIMENTACAO_CAIXA: TcxGridDBColumn;
    cxGrid4DBTableView1ORDEM_IMPRESSORA_FISCAL: TcxGridDBColumn;
    cxGrid4Level1: TcxGridLevel;
    cxGroupBox15: TcxGroupBox;
    DBEdit19: TDBEdit;
    dbedtDESCRICAO_FORMA_DE_PAGAMENTO: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    cxlblFormaDePagamento: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    DBEdit23: TDBEdit;
    cxGrid3DBTableView1CONDICAO_DE_PAGAMENTO: TcxGridDBColumn;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure cxTSFormas_CondicoesShow(Sender: TObject);
    procedure cxTSFormasDePagamentoShow(Sender: TObject);
    procedure DBEdit19Change(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTabelasAuxiliares: TfrmTabelasAuxiliares;

implementation

{$R *.dfm}

uses UDataModul, ULogin, GroupedItems1, URelatorios, UProceduresClient;

procedure TfrmTabelasAuxiliares.cxButton1Click(Sender: TObject);
begin
//  if not Assigned(frmVinculoFormaVSCondicao) then
//    frmVinculoFormaVSCondicao := TfrmVinculoFormaVSCondicao.Create(Self);
//  frmVinculoFormaVSCondicao.VincularFormaComCondicao(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
  if not Assigned(frmRelatorios) then
    frmRelatorios := TfrmRelatorios.Create(Self);
  frmRelatorios.VincularFormaComCondicao(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
  LocalizarCondicoesVinculadasAFormaDePagamento(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
end;

procedure TfrmTabelasAuxiliares.cxTSFormasDePagamentoShow(Sender: TObject);
begin
  LocalizarCondicoesVinculadasAFormaDePagamento(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
end;

procedure TfrmTabelasAuxiliares.cxTSFormas_CondicoesShow(Sender: TObject);
begin
  if not dm.cdsFormasDePagamento.Active then
    dm.cdsFormasDePagamento.Active := true;

  if not dm.cdsCondicoesDePagamento.Active then
    dm.cdsCondicoesDePagamento.Active := True;

  if not dm.cdsFormasDeEntrega.Active then
    dm.cdsFormasDeEntrega.Active := true;

  cxPCTabelasAuxiliares.ActivePage := cxTSFormasDePagamento;
end;

procedure TfrmTabelasAuxiliares.DBEdit19Change(Sender: TObject);
begin
  LocalizarCondicoesVinculadasAFormaDePagamento(dm.cdsFormasDePagamentoID_FORMA_DE_PAGAMENTO.AsInteger);
end;

procedure TfrmTabelasAuxiliares.FormShow(Sender: TObject);
begin
  if not dm.cdsTiposDeOperacao.Active then
    dm.cdsTiposDeOperacao.Active := true;

  if not dm.cdsConveniosNCM.Active then
    dm.cdsConveniosNCM.Active := true;

  if not dm.cdsGruposProdutos.Active then
    dm.cdsGruposProdutos.Active := True;
end;

procedure TfrmTabelasAuxiliares.Image2Click(Sender: TObject);
begin
  Self.Close;
end;



end.
