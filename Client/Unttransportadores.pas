unit Unttransportadores;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxContainer, cxLabel, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGroupBox,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, cxDBNavigator;

type
  TfrmTransportadores = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    Panel3: TPanel;
    Panel1: TPanel;
    cxGridTransportadores: TcxGrid;
    cxGridTransportadoresDBTableView1: TcxGridDBTableView;
    cxGridTransportadoresLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxGridTransportadoresDBTableView1ID_TRANSPORTADOR: TcxGridDBColumn;
    cxGridTransportadoresDBTableView1CNPJ: TcxGridDBColumn;
    cxGridTransportadoresDBTableView1INSCRICAO_ESTADUAL: TcxGridDBColumn;
    cxGridTransportadoresDBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBECNPJ: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
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
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxDBNavigator1: TcxDBNavigator;
    procedure BackToMainForm(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmTransportadores: TfrmTransportadores;

implementation

{$R *.dfm}

uses UDataModul, GroupedItems1, UProceduresClient;

{ TfrmTransportadores }

procedure TfrmTransportadores.BackToMainForm(Sender: TObject);
begin
  Close;
//  Hide;
//  SplitForm.BringToFront;
end;

procedure TfrmTransportadores.cxDBNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex = 10 then
  begin
    if Trim(DBECNPJ.Text) = '' then
    begin
      MessageDlg('Não foi informado cnpj para este transportador',mtWarning,[mbOK],0);
      abort;
    end
    else
    if Trim(DBECNPJ.Text) <> ''  then
    begin
      if not VerificaCNPJ(RetirarPontosETracos(DBECNPJ.Text)) then
      begin
        MessageDlg('CNPJ informado para este transportador não é válido',mtWarning,[mbOK],0);
        abort;
      end;
    end;
  end;
end;

procedure TfrmTransportadores.FormShow(Sender: TObject);
begin
  if not dm.cdsTransportadores.Active then
    dm.cdsTransportadores.Active := true;
  dm.cdsTransportadores.Filter := '';
  dm.cdsTransportadores.Filtered := False;
end;

end.
