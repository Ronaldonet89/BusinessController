unit UntConsultas;

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
  cxClasses, cxCustomData, cxStyles, cxEdit, cxGridLevel, cxGridCustomView,
  cxGridChartView, cxGrid, cxPivotGridChartConnection, cxCustomPivotGrid,
  cxDBPivotGrid, cxPC, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmConsultas = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    cxPCPrincipal: TcxPageControl;
    cxtsCaixa: TcxTabSheet;
    cxDBPivotGrid1: TcxDBPivotGrid;
    cxGRDGrafico: TcxGrid;
    cxGRDGraficoLevel1: TcxGridLevel;
    cxPivotGridChartConnection1: TcxPivotGridChartConnection;
    cxGRDGraficoChartView1: TcxGridChartView;
    cxDBPivotGrid1ID_PEDIDO: TcxDBPivotGridField;
    cxDBPivotGrid1DATA_PEDIDO: TcxDBPivotGridField;
    cxDBPivotGrid1DESCRICAO_FORMA_DE_PAGAMENTO: TcxDBPivotGridField;
    cxDBPivotGrid1CONDICAO_DE_PAGAMENTO: TcxDBPivotGridField;
    cxDBPivotGrid1VALOR: TcxDBPivotGridField;
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

{$R *.dfm}

uses UDataModul, ULogin, GroupedItems1, SplitItemDetail1;

procedure TfrmConsultas.FormShow(Sender: TObject);
begin
  if not dm.cdsGraficoCaixa.Active then
    dm.cdsGraficoCaixa.Active := true;
end;

procedure TfrmConsultas.Image2Click(Sender: TObject);
begin
  Self.Close;
end;

end.
