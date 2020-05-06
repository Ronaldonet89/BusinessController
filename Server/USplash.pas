unit USplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IndyPeerImpl, Datasnap.DSCommonServer,
  Datasnap.DSTCPServerTransport, Datasnap.DSServer, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, System.Win.ScktComp,IPPeerServer;

type
  TfrmSplash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    ServerSocket1: TServerSocket;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServer1: TDSServer;
    DSServerClass2: TDSServerClass;
    procedure FormShow(Sender: TObject);
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure Timer1Timer(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure DSServerClass2GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
  public
    { Public declarations }
    pPorta,pEnderecoBanco : string;
    vArquivoIni:TextFile;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses UDSModuleDb, UPrincipal, ULogin;

procedure TfrmSplash.DSServerClass1GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDSModuleDb;
end;

procedure TfrmSplash.DSServerClass2GetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDSModuleDb;
end;

procedure TfrmSplash.FormShow(Sender: TObject);
var
  F:TextFile;
  vLinhao,vCaminhoArquivo : string;
  ModuleDb : TDSModuleDb;
begin
  Self.Left := Trunc(Screen.Width / 2)- 300;
  Self.Top := Trunc(Screen.Height / 2)- 200;
//  AssignFile(F,'C:\Windows\System32\ConfiguracoesServidor.ini');
//  if FileExists('C:\Windows\System32\ConfiguracoesServidor.ini') then
  try
    vCaminhoArquivo := ExtractFilePath(Application.ExeName);
    if FileExists(vCaminhoArquivo+'ImagemPrincipal.JPG') then
      Image1.Picture.LoadFromFile(vCaminhoArquivo+'ImagemPrincipal.JPG')
    else
      Image1.Visible := False;
  except
    Image1.Visible := False;
  end;
  AssignFile(F,vCaminhoArquivo+'ConfiguracoesServidor.ini');
  AssignFile(vArquivoIni,vCaminhoArquivo+'ConfiguracoesServidor.ini');

  if FileExists(vCaminhoArquivo+'ConfiguracoesServidor.ini') then
  begin
    Reset(F);
    Readln(F, vLinhao);
    if vLinhao <> '' then
      pPorta := vLinhao
    else
      pPorta := '211';
    ReadLn(F,pEnderecoBanco);
    CloseFile(F);
  end
  else
  begin
    Rewrite(F);
    pPorta := '211';
    Writeln(F,pPorta);
    pEnderecoBanco := '';
    Writeln(F,pEnderecoBanco);
    CloseFile(F);
  end;
  DSServer1.Stop;
  DSTCPServerTransport1.Port := StrToInt(pPorta);
  DSServer1.Start;

  ServerSocket1.Active := True;
  Application.CreateForm(TDSModuleDb,DSModuleDb);
  DSModuleDb.SQLConexao.Connected := False;
  Timer1.Enabled := True;
end;

procedure TfrmSplash.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  frmPrincipal.lblUsuariosConectadosChat.Caption := 'Total de usuarios conectados : '+
               IntToStr(ServerSocket1.Socket.ActiveConnections);
  frmPrincipal.MMChat.Lines.Add(Socket.LocalHost +'  conectou- se ao servdor');
end;

procedure TfrmSplash.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  frmPrincipal.lblUsuariosConectadosChat.Caption := 'Total de usuarios conectados : '+
               IntToStr(ServerSocket1.Socket.ActiveConnections);
  frmPrincipal.MMChat.Lines.Add(Socket.LocalHost +'  desconectou- se do servdor');
end;

procedure TfrmSplash.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  I : Integer;
  vTexto : string;
begin
  vTexto := Socket.ReceiveText;
  for I := 0 to ServerSocket1.Socket.ActiveConnections -1 do
    ServerSocket1.Socket.Connections[I].SendText(vTexto);
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Application.CreateForm(TfrmLogin,frmLogin);
  Self.Hide;
  frmLogin.ShowModal;
  frmLogin.Free;
  Application.Terminate;
end;

end.
