unit UntVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxPCdxBarPopupMenu, cxContainer, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, cxTextEdit, cxDBEdit, cxLabel, cxPC, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxDBNavigator;

type
  TfrmVendedores = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    cxpcClientes: TcxPageControl;
    cxtsPrincipal: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    DBEdit1: TDBEdit;
    cxGrid1DBTableView1NOME_VENDEDOR: TcxGridDBColumn;
    Image2: TImage;
    cxDBNavigator1: TcxDBNavigator;
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendedores: TfrmVendedores;

implementation

{$R *.dfm}

uses UDataModul;

procedure TfrmVendedores.FormShow(Sender: TObject);
begin
  if not dm.cdsVendedores.Active then
    dm.cdsVendedores.Active := True
  else
  begin
    dm.cdsVendedores.Close;
    dm.cdsVendedores.Open;
  end;
end;

procedure TfrmVendedores.Image2Click(Sender: TObject);
begin
  Self.Close;
end;

end.
