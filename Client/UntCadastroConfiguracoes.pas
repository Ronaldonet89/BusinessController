unit UntCadastroConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmCadastroTabelasAuxiliares = class(TForm)
    UpperPanel: TPanel;
    TitleLabel: TLabel;
    Image1: TImage;
    ScrollBox1: TScrollBox;
    GridPanel1: TGridPanel;
    GridPanel2: TGridPanel;
    ItemTitle1: TLabel;
    GridPanel3: TGridPanel;
    ItemTitle2: TLabel;
    ItemImage3: TImage;
    GridPanel4: TGridPanel;
    ItemTitle3: TLabel;
    ItemImage1: TImage;
    ItemImage2: TImage;
    pnlPrincipal: TPanel;
    procedure ItemImage1Click(Sender: TObject);
    procedure ItemImage2Click(Sender: TObject);
    procedure BackToMainForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroTabelasAuxiliares: TfrmCadastroTabelasAuxiliares;

implementation

{$R *.dfm}

uses UConfiguracoes, UntTabelasAuxiliares, GroupedItems1;

procedure TfrmCadastroTabelasAuxiliares.BackToMainForm(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadastroTabelasAuxiliares.ItemImage1Click(Sender: TObject);
begin
  if not Assigned(frmConfiguracoes) then
    frmConfiguracoes := TfrmConfiguracoes.Create(Self);
  frmConfiguracoes.parent := pnlPrincipal;
  frmConfiguracoes.Show;
end;

procedure TfrmCadastroTabelasAuxiliares.ItemImage2Click(Sender: TObject);
begin
  if not Assigned(frmTabelasAuxiliares) then
    frmTabelasAuxiliares := TfrmTabelasAuxiliares.Create(Self);
  frmTabelasAuxiliares.parent := pnlPrincipal;
  frmTabelasAuxiliares.Show;
end;

end.
