unit UntCadastroCompraVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls,UITypes;

type
  TfrmcadastroCompraVenda = class(TForm)
    ScrollBox1: TScrollBox;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    LblCompras: TLabel;
    GridPanel3: TGridPanel;
    LblVendasPedidos: TLabel;
    ImgNFe: TImage;
    GridPanel4: TGridPanel;
    lblNfe: TLabel;
    ImgCompras: TImage;
    ImgVendasPedido: TImage;
    pnlPrincipal: TPanel;
    UpperPanel: TPanel;
    TitleLabel: TLabel;
    Image1: TImage;
    ImgCaixa: TImage;
    lblCaixa: TLabel;
    ImgPDV: TImage;
    lblPDV: TLabel;
    procedure BackToMainForm(Sender: TObject);
    procedure ImgNFeClick(Sender: TObject);
    procedure ImgComprasClick(Sender: TObject);
    procedure ImgVendasPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImgCaixaClick(Sender: TObject);
    procedure ImgPDVClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadastroCompraVenda: TfrmcadastroCompraVenda;

implementation

{$R *.dfm}

uses GroupedItems1, UntPedidoCompra, UntPedido, UntConectaServidor,
  ULogin, UDataModul, UntVendaBalcao, UntPdv,UntNfe;

{ TForm1 }

procedure TfrmcadastroCompraVenda.BackToMainForm(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmcadastroCompraVenda.FormShow(Sender: TObject);
var
   Conexao : TDSModuleDbClient;
begin
  Conexao := TDSModuleDbClient.Create(DM.SQLConexao.DBXConnection);
  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR PEDIDO DE COMPRAS') then
  begin
    LblCompras.Visible := False;
    ImgCompras.Visible := False;
  end
  else
  begin
    LblCompras.Visible := True;
    ImgCompras.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'compras.bmp') then
        ImgCompras.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'compras.bmp')
      else
      begin
        ImgCompras.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo compras.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo compras.bmp',mtWarning,[mbOK],0);
    end;
  end;

  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR VENDAS PEDIDO') then
  begin
    LblVendasPedidos.Visible := False;
    ImgVendasPedido.Visible := False;
  end
  else
  begin
    LblVendasPedidos.Visible := True;
    ImgVendasPedido.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'pedidos.bmp') then
        ImgVendasPedido.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'pedidos.bmp')
      else
      begin
        ImgCompras.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo pedidos.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo pedidos.bmp',mtWarning,[mbOK],0);
    end;
  end;

  if not Conexao.VerificaPermissao(frmLogin.pNomeUsuario,'VISUALIZAR NFE') then
  begin
    lblNfe.Visible := False;
    ImgNFe.Visible := False;
  end
  else
  begin
    lblNfe.Visible := True;
    ImgNFe.Visible := True;
    try
      if FileExists(ExtractFilePath(application.ExeName)+'nfe.bmp') then
        ImgNFe.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'nfe.bmp')
      else
      begin
        ImgNFe.Picture := nil;
        MessageDlg('O sistema não encontrou o arquivo nfe.bmp',mtWarning,[mbOK],0);
      end;
    except
      MessageDlg('O sistema não encontrou o arquivo nfe.bmp',mtWarning,[mbOK],0);
    end;
  end;

  try
    if FileExists(ExtractFilePath(application.ExeName)+'caixa.bmp') then
      ImgCaixa.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'caixa.bmp')
    else
    begin
      ImgCaixa.Picture := nil;
      MessageDlg('O sistema não encontrou o arquivo caixa.bmp',mtWarning,[mbOK],0);
    end;
  except
    MessageDlg('O sistema não encontrou o arquivo nfe.bmp',mtWarning,[mbOK],0);
  end;

  try
    if FileExists(ExtractFilePath(application.ExeName)+'pdv.bmp') then
      ImgPDV.Picture.LoadFromFile(ExtractFilePath(application.ExeName)+'pdv.bmp')
    else
    begin
      ImgPDV.Picture := nil;
      MessageDlg('O sistema não encontrou o arquivo pdv.bmp',mtWarning,[mbOK],0);
    end;
  except
    MessageDlg('O sistema não encontrou o arquivo pdv.bmp',mtWarning,[mbOK],0);
  end;
  FreeAndNil(Conexao);
end;

procedure TfrmcadastroCompraVenda.ImgCaixaClick(Sender: TObject);
begin
  if not Assigned(frmVendasBalcao) then
    frmVendasBalcao := TfrmVendasBalcao.Create(Self);
  frmVendasBalcao.parent := pnlPrincipal;
  frmVendasBalcao.Show;
end;

procedure TfrmcadastroCompraVenda.ImgComprasClick(Sender: TObject);
begin
  if not Assigned(frmPedidoCompra) then
    frmPedidoCompra := TfrmPedidoCompra.Create(Self);
  frmPedidoCompra.parent := pnlPrincipal;
  frmPedidoCompra.Show;
end;

procedure TfrmcadastroCompraVenda.ImgVendasPedidoClick(Sender: TObject);
begin
  if not Assigned(frmPedidos) then
    frmPedidos := TfrmPedidos.Create(Self);
  frmPedidos.parent := pnlPrincipal;
  frmPedidos.Show;
end;

procedure TfrmcadastroCompraVenda.ImgNFeClick(Sender: TObject);
begin
  if not Assigned(frmNfe) then
    frmNfe := TfrmNfe.Create(Self);
  frmNfe.parent := pnlPrincipal;
  frmNfe.Show;
end;

procedure TfrmcadastroCompraVenda.ImgPDVClick(Sender: TObject);
begin
  if not Assigned(frmPdv) then
    frmPdv := TfrmPdv.Create(Self);
  frmPdv.parent := pnlPrincipal;
  frmPdv.Show;
end;

end.
