unit UntLookUpTransportadores;

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
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxButtons, cxGroupBox;

type
  TfrmLookUpTransportadores = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxGridTransportadores: TcxGrid;
    cxGridTransportadoresDBTableView1: TcxGridDBTableView;
    cxGridTransportadoresLevel1: TcxGridLevel;
    cxGridTransportadoresDBTableView1ID_TRANSPORTADOR: TcxGridDBColumn;
    cxGridTransportadoresDBTableView1CNPJ: TcxGridDBColumn;
    cxGridTransportadoresDBTableView1INSCRICAO_ESTADUAL: TcxGridDBColumn;
    cxGridTransportadoresDBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure cxGridTransportadoresDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLookUpTransportadores: TfrmLookUpTransportadores;

implementation

{$R *.dfm}

uses UDataModul;

procedure TfrmLookUpTransportadores.cxButton1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmLookUpTransportadores.cxGridTransportadoresDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    self.Close;
end;

procedure TfrmLookUpTransportadores.FormShow(Sender: TObject);
begin
  if not dm.cdsTransportadores.Active then
    dm.cdsTransportadores.Active := True
  else
  begin
    dm.cdsTransportadores.Close;
    dm.cdsTransportadores.Open;
  end;
  dm.cdsTransportadores.Filtered := False;
  dm.cdsTransportadores.Filter := '';
  cxGridTransportadores.SetFocus;
end;

end.
