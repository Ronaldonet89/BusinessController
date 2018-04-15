unit UntCadastroFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, UITypes;

type
  TfrmCadastroFinanceiro = class(TForm)
    ScrollBox1: TScrollBox;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    LblPagar: TLabel;
    GridPanel3: TGridPanel;
    LblReceber: TLabel;
    ItemImage3: TImage;
    GridPanel4: TGridPanel;
    ImgPagar: TImage;
    ImgReceber: TImage;
    pnlPrincipal: TPanel;
    UpperPanel: TPanel;
    TitleLabel: TLabel;
    Image1: TImage;
    procedure BackToMainForm(Sender: TObject);
    procedure ImgReceberClick(Sender: TObject);
    procedure ImgPagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFinanceiro: TfrmCadastroFinanceiro;

implementation

{$R *.dfm}

uses GroupedItems1, UntReceber, UntPagar, UntConectaServidor, ULogin,
  UDataModul;

{ TForm1 }

procedure TfrmCadastroFinanceiro.BackToMainForm(Sender: TObject);
begin
 Self.Close;
end;

procedure TfrmCadastroFinanceiro.FormShow(Sender: TObject);
var
   Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR PAGAR') then
  begin
    LblPagar.Visible := False;
    ImgPagar.Visible := False;
  end
  else
  begin
    LblPagar.Visible := True;
    ImgPagar.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'pagar.bmp') then
        ImgPagar.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'pagar.bmp')
      else
      begin
        ImgPagar.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo pagar.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo pagar.bmp',mtWarning,[mbOK],0);
    end;
  end;

  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR RECEBER') then
  begin
    LblReceber.Visible := False;
    ImgReceber.Visible := False;
  end
  else
  begin
    LblReceber.Visible := True;
    ImgReceber.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'receber.bmp') then
        ImgReceber.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'receber.bmp')
      else
      begin
        ImgReceber.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo receber.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo receber.bmp',mtWarning,[mbOK],0);
    end;
  end;
end;

procedure TfrmCadastroFinanceiro.ImgPagarClick(Sender: TObject);
begin
  if not Assigned(frmPagar) then
    frmPagar := TfrmPagar.Create(Self);
  frmPagar.parent := pnlPrincipal;
  frmPagar.Show;
end;

procedure TfrmCadastroFinanceiro.ImgReceberClick(Sender: TObject);
begin
  if not Assigned(frmReceber) then
    frmReceber := TfrmReceber.Create(Self);
  frmReceber.parent := pnlPrincipal;
  frmReceber.Show;
end;

end.
