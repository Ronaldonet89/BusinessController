unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,mask,Vcl.Buttons,Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    spbConfirmar: TSpeedButton;
    spbCancelar: TSpeedButton;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure spbConfirmarClick(Sender: TObject);
    procedure spbCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses UPrincipal, UDSModuleDb;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  Self.Left := Trunc(Screen.Width / 2) - 200;
  Self.Top := Trunc(Screen.Height / 2) - 200;
  EdtUsuario.SetFocus;
end;

procedure TfrmLogin.spbCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.spbConfirmarClick(Sender: TObject);
var
  F:TextFile;
  vLinhao,vSenha,vConfirmaSenha : string;
  Conexao : TDSModuleDb;
begin
  if (edtUsuario.Text <> 'BUSINESS') then
  begin
    if EdtUsuario.Text = '' then
    begin
      showmessage('Informe o nome de usuário');
      EdtUsuario.SetFocus;
      abort;
    end;
    Conexao := TDSModuleDb.Create(Self);
    //Verificando se usuario existe
    if Conexao.VerificaSeUsuarioEstaCadastrado(Trim(EdtUsuario.Text)) = false then
    begin
      showmessage('Usuário não cadastrado');
      EdtUsuario.SetFocus;
      FreeAndNil(Conexao);
      abort;
    end;

    if EdtSenha.Text <> '' then
    begin
      if Conexao.VerificaSeSenhaEstaCorreta(Trim(EdtSenha.Text)) = false then
      begin
        showmessage('Senha digitada é inválida');
        EdtSenha.SetFocus;
        FreeAndNil(Conexao);
        Abort;
      end;
    end
    else
    begin
      showmessage('Informe a senha.');
      FreeAndNil(Conexao);
      abort;
    end;
  end;
  Self.Hide;
  Application.CreateForm(TfrmPrincipal,frmPrincipal);
  frmPrincipal.ShowModal;
  FreeAndNil(frmPrincipal);
  Self.Close;
end;
end.
