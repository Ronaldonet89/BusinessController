unit UntCadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmCadastros = class(TForm)
    UpperPanel: TPanel;
    TitleLabel: TLabel;
    Image1: TImage;
    ScrollBox1: TScrollBox;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    LblClientes: TLabel;
    GridPanel3: TGridPanel;
    lblFornecedores: TLabel;
    ImgProdutos: TImage;
    GridPanel4: TGridPanel;
    LblProdutos: TLabel;
    ImgClientes: TImage;
    ImgFornecedores: TImage;
    pnlPrincipal: TPanel;
    ImgTransportadores: TImage;
    GridPanel5: TGridPanel;
    lblTransportadores: TLabel;
    IMGVendedores: TImage;
    lblVendedores: TLabel;
    procedure BackToMainForm(Sender: TObject);
    procedure ImgClientesClick(Sender: TObject);
    procedure ImgFornecedoresClick(Sender: TObject);
    procedure ImgProdutosClick(Sender: TObject);
    procedure ImgTransportadoresClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IMGVendedoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastros: TfrmCadastros;

implementation

{$R *.dfm}

uses SplitItemDetail1, GroupedItems1, UntClientes, UntFornecedores, UntProdutos,
  UConfiguracoes, Unttransportadores, UDataModul, UntConectaServidor, ULogin,
  UntVendedores;

{ TForm1 }

procedure TfrmCadastros.BackToMainForm(Sender: TObject);
begin
  if Assigned(frmProdutos) then
  begin
    frmProdutos.Close;
    FreeAndNil(frmProdutos);
  end;
  if Assigned(frmClientes) then
  begin
    frmClientes.Close;
    FreeAndNil(frmClientes);
  end;
  if Assigned(frmTransportadores) then
  begin
    frmTransportadores.Close;
    FreeAndNil(frmTransportadores);
  end;
  if Assigned(frmVendedores) then
  begin
    frmVendedores.Close;
    FreeAndNil(frmVendedores);
  end;
  Self.Close;
end;

procedure TfrmCadastros.FormShow(Sender: TObject);
var
   Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR PRODUTOS') then
  begin
    LblProdutos.Visible := False;
    ImgProdutos.Visible := False;
  end
  else
  begin
    LblProdutos.Visible := True;
    ImgProdutos.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'produtos.bmp') then
        ImgProdutos.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'produtos.bmp')
      else
      begin
        ImgProdutos.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo produtos.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo produtos.bmp',mtWarning,[mbOK],0);
    end;
  end;

  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR CLIENTES') then
  begin
    LblProdutos.Visible := False;
    ImgProdutos.Visible := False;
  end
  else
  begin
    LblClientes.Visible := True;
    ImgClientes.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'clientes.bmp') then
        ImgClientes.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'clientes.bmp')
      else
      begin
        ImgClientes.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo clientes.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo clientes.bmp',mtWarning,[mbOK],0);
    end;
  end;

  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR FORNECEDORES') then
  begin
    lblFornecedores.Visible := False;
    ImgFornecedores.Visible := False;
  end
  else
  begin
    LblProdutos.Visible := True;
    ImgProdutos.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'fornecedores.bmp') then
        ImgFornecedores.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'fornecedores.bmp')
      else
      begin
        ImgFornecedores.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo fornecedores.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo fornecedores.bmp',mtWarning,[mbOK],0);
    end;
  end;

  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR TRANSPORTADORES') then
  begin
    lblTransportadores.Visible := False;
    ImgTransportadores.Visible := False;
  end
  else
  begin
    lblTransportadores.Visible := True;
    ImgTransportadores.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'transportadores.bmp') then
        ImgTransportadores.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'transportadores.bmp')
      else
      begin
        ImgTransportadores.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo transportadores.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo transportadores.bmp',mtWarning,[mbOK],0);
    end;
  end;

  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR VENDEDORES') then
  begin
    lblVendedores.Visible := False;
    IMGVendedores.Visible := False;
  end
  else
  begin
    lblVendedores.Visible := True;
    IMGVendedores.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'vendedores.bmp') then
        IMGVendedores.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'vendedores.bmp')
      else
      begin
        IMGVendedores.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo vendedores.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo vendedores.bmp',mtWarning,[mbOK],0);
    end;
  end;
end;

procedure TfrmCadastros.ImgTransportadoresClick(Sender: TObject);
begin
  if not Assigned(frmTransportadores) then
    frmTransportadores := TfrmTransportadores.Create(Self);
  frmTransportadores.parent := pnlPrincipal;
  frmTransportadores.Show;
end;

procedure TfrmCadastros.IMGVendedoresClick(Sender: TObject);
begin
  if not Assigned(frmVendedores) then
    frmVendedores := TfrmVendedores.Create(Self);
  frmVendedores.parent := pnlPrincipal;
  frmVendedores.Show;
end;

procedure TfrmCadastros.ImgClientesClick(Sender: TObject);
begin
  if not Assigned(frmClientes) then
    frmClientes := TfrmClientes.Create(Self);
  frmClientes.parent := pnlPrincipal;
  frmClientes.Show;
//  frmClientes.BringToFront;
end;

procedure TfrmCadastros.ImgFornecedoresClick(Sender: TObject);
begin
  if not Assigned(frmfornecedores) then
    frmfornecedores := Tfrmfornecedores.Create(Self);
  frmfornecedores.parent := pnlPrincipal;
  frmfornecedores.Show;
end;

procedure TfrmCadastros.ImgProdutosClick(Sender: TObject);
begin
  if not Assigned(frmProdutos) then
    frmProdutos := TfrmProdutos.Create(Self);
  frmProdutos.parent := pnlPrincipal;
  frmProdutos.Show;
end;

end.

