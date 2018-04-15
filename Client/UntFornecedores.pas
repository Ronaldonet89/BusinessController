unit UntFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Touch.GestureMgr,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.Menus, cxButtons, cxContainer,
  Vcl.DBCtrls, Vcl.Mask, cxLabel;

type
  Tfrmfornecedores = class(TForm)
    AppBar: TPanel;
    CloseButton: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    GestureManager1: TGestureManager;
    cxpcClientes: TcxPageControl;
    cxtsPrincipal: TcxTabSheet;
    Panel3: TPanel;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
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
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBECPF: TDBEdit;
    DBECNPJ: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBMemo1: TDBMemo;
    DBComboBox1: TDBComboBox;
    cxGrid1DBTableView1ID_FORNECEDOR: TcxGridDBColumn;
    cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1CPF: TcxGridDBColumn;
    cxGrid1DBTableView1CNPJ: TcxGridDBColumn;
    cxGrid1DBTableView1RG: TcxGridDBColumn;
    cxGrid1DBTableView1INSCRICAO_ESTADUAL: TcxGridDBColumn;
    cxGrid1DBTableView1CONTATO: TcxGridDBColumn;
    cxGrid1DBTableView1EMAIL: TcxGridDBColumn;
    cxGrid1DBTableView1TELEFONE: TcxGridDBColumn;
    cxGrid1DBTableView1CELULAR: TcxGridDBColumn;
    cxGrid1DBTableView1TIPO_FORNECEDOR: TcxGridDBColumn;
    cxNavigator1: TcxNavigator;
    procedure CloseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);

    procedure BackToMainForm(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
  private
    { Private declarations }
    procedure AppBarResize;
    procedure AppBarShow(mode: integer);
  public
    { Public declarations }
  end;

var
  frmfornecedores: Tfrmfornecedores;

implementation

{$R *.dfm}

uses GroupedItems1, SplitItemDetail1, UDataModul, UProceduresClient;

const
  AppBarHeight = 75;

procedure Tfrmfornecedores.AppBarResize;
begin
  AppBar.SetBounds(0, AppBar.Parent.Height - AppBarHeight,
    AppBar.Parent.Width, AppBarHeight);
end;

procedure Tfrmfornecedores.AppBarShow(mode: integer);
begin
  if mode = -1 then // Toggle
    mode := integer(not AppBar.Visible );

  if mode = 0 then
    AppBar.Visible := False
  else
  begin
    AppBar.Visible := True;
    AppBar.BringToFront;
  end;
end;

procedure Tfrmfornecedores.Action1Execute(Sender: TObject);
begin
  AppBarShow(-1);
end;

procedure Tfrmfornecedores.CloseButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrmfornecedores.cxNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex = 10 then
  begin
    if (Trim(DBECNPJ.Text) = '') and (trim(DBECPF.Text) = '') then
    begin
      MessageDlg('Não foi informado cpf/cnpj para este fornecedor',mtWarning,[mbOK],0);
      abort;
    end
    else
    if Trim(DBECNPJ.Text) <> ''  then
    begin
      if not VerificaCNPJ(RetirarPontosETracos(DBECNPJ.Text)) then
      begin
        MessageDlg('CNPJ informado para este fornecedor não é válido',mtWarning,[mbOK],0);
        abort;
      end;
    end
    else
    if Trim(DBECPF.Text) <> ''  then
    begin
      if not VerificaCPF(RetirarPontosETracos(DBECPF.Text)) then
      begin
        MessageDlg('CPF informado para este fornecedor não é válido',mtWarning,[mbOK],0);
        abort;
      end;
    end;
  end;
end;

procedure Tfrmfornecedores.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  AppBarShow(0);
end;

procedure Tfrmfornecedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = VK_ESCAPE then
//    AppBarShow(-1)
//  else
//    AppBarShow(0);
end;

procedure Tfrmfornecedores.FormResize(Sender: TObject);
begin
  AppBarResize;
end;

procedure Tfrmfornecedores.FormShow(Sender: TObject);
begin
  if not dm.cdsFornecedores.Active then
    dm.cdsFornecedores.Active := True
  else
  begin
    dm.cdsFornecedores.Close;
    dm.cdsFornecedores.Open;
  end;
end;

procedure Tfrmfornecedores.BackToMainForm(Sender: TObject);
begin
  Close;
//  Hide;
//  SplitForm.BringToFront;
end;

end.
