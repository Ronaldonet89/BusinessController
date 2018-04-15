unit UntLookUpProdutos;

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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxContainer, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxGroupBox;

type
  TFrmLookUpProdutos = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1PRO_DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1PRO_CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1PRO_SALDO: TcxGridDBColumn;
    cxGrid1DBTableView1PRECO_VENDA: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    edtProdutos: TEdit;
    Label1: TLabel;
    cxGrid1DBTableView1COR: TcxGridDBColumn;
    cxGrid1DBTableView1TAMANHO: TcxGridDBColumn;
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtProdutosChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vContinua : boolean;
  end;

var
  FrmLookUpProdutos: TFrmLookUpProdutos;

implementation

{$R *.dfm}

uses UDataModul;

procedure TFrmLookUpProdutos.cxButton1Click(Sender: TObject);
begin
  vContinua := False;
  Self.Close;
end;

procedure TFrmLookUpProdutos.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    Self.Close;
end;

procedure TFrmLookUpProdutos.edtProdutosChange(Sender: TObject);
begin
  dm.cdsProdutos.Close;
  dm.cdsProdutos.CommandText := 'SELECT * FROM PRODUTOS WHERE UPPER(PRO_DESCRICAO) LIKE '+QuotedStr(AnsiUpperCase(edtProdutos.Text)+'%');
  dm.cdsProdutos.Active := True;
end;

procedure TFrmLookUpProdutos.FormShow(Sender: TObject);
begin
  edtProdutos.SetFocus;
end;

end.
