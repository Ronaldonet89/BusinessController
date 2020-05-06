unit UCnpjCpf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrSocket,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, ACBrConsultaCPF,
  ACBrConsultaCNPJ;

type
  TFrmCnpjCpf = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label14: TLabel;
    ButBuscar: TBitBtn;
    EditCaptcha: TEdit;
    EditCNPJ: TMaskEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    EditDtNasc: TEdit;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    ACBrConsultaCPF1: TACBrConsultaCPF;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditCNPJExit(Sender: TObject);
    procedure ButBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    tipo: string;
    RazaoSocial,Fantasia,Cnpj,Endereco,Numero,Complemento,Bairro,Cidade,UF,CEP,Email,Telefone: string;
    { Public declarations }
     procedure BuscaCNPJ;
     procedure BuscaCPF;
  end;

var
  FrmCnpjCpf: TFrmCnpjCpf;

implementation

{$R *.dfm}

uses UProceduresClient;

procedure TFrmCnpjCpf.BuscaCNPJ;
var
  Stream: TMemoryStream;

{$IFDEF DELPHI2009_UP}
  png: TPngImage;
{$ELSE}
  ImgArq: String;
{$ENDIF}
begin
  Stream:= TMemoryStream.Create;
  try
    try
      ACBrConsultaCNPJ1.Captcha(Stream);
    Except

    end;

   {$IFDEF DELPHI2009_UP}
    //Use esse código quando a imagem do site for do tipo PNG
    png:= TPngImage.Create;
    try
      png.LoadFromStream(Stream);
      Image1.Picture.Assign(png);
    finally
      png.Free;
    end;
    { //Use esse código quando a imagem do site for do tipo JPG
      Jpg:= TJPEGImage.Create;
      try
        Jpg.LoadFromStream(Stream);
        Image1.Picture.Assign(Jpg);
      finally
        Jpg.Free;
      end;
    }
   {$ELSE}
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );
   {$ENDIF}

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TFrmCnpjCpf.BuscaCPF;
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  Stream := TMemoryStream.Create;
  try
    try
      ACBrConsultaCPF1.Captcha(Stream);
    Except

    end;
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TFrmCnpjCpf.ButBuscarClick(Sender: TObject);
begin
  if (EditCNPJ.Text = '') then
  begin
    ShowMessage('É necessário digitar o CNPJ/CPF.');
    exit;
  end;

  if (EditCaptcha.Text <> '') then
  begin
    if tipo = 'J' then
    begin
       if ACBrConsultaCNPJ1.Consulta(EditCNPJ.Text,EditCaptcha.Text, true) then
       begin
          RazaoSocial := ACBrConsultaCNPJ1.RazaoSocial;
          Fantasia    := ACBrConsultaCNPJ1.Fantasia;
          Endereco    := ACBrConsultaCNPJ1.Endereco;
          Numero      := ACBrConsultaCNPJ1.Numero;
          Complemento := ACBrConsultaCNPJ1.Complemento;
          Bairro      := ACBrConsultaCNPJ1.Bairro;
          Cidade      := ACBrConsultaCNPJ1.Cidade;
          UF          := ACBrConsultaCNPJ1.UF;
          CEP         := ACBrConsultaCNPJ1.CEP;
          Email       := ACBrConsultaCNPJ1.EndEletronico;
          Telefone    := ACBrConsultaCNPJ1.Telefone;
          Cnpj        := EditCNPJ.Text;
          self.close;
       end;
    end;
    if tipo = 'F' then
    begin
      if (EditDtNasc.Text = '') then
      begin
        ShowMessage('É necessário digitar o Data de Nascimento.');
        exit;
      end;
      if ACBrConsultaCPF1.Consulta(EditCNPJ.Text, EditDtNasc.Text, EditCaptcha.Text) then
      begin
        RazaoSocial     := ACBrConsultaCPF1.Nome;
        self.close;
      end;
    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;
end;

procedure TFrmCnpjCpf.EditCNPJExit(Sender: TObject);
begin
  if Trim(EditCNPJ.text) <> '' then
  begin
    if Length(RetirarPontosETracos(Trim(EditCNPJ.Text))) = 14 then
    begin
      if not VerificaCNPJ(RetirarPontosETracos(trim(EditCNPJ.Text))) then
      begin
        MessageDlg('CNPJ informado para este cliente não é válido',mtWarning,[mbOK],0);
        abort;
      end;
      tipo:= 'J';
      Timer1.Enabled:= True
    end
    else
    if Length(RetirarPontosETracos(Trim(EditCNPJ.Text))) = 11 then
    begin
      if not VerificaCPF(RetirarPontosETracos(EditCNPJ.Text)) then
      begin
        MessageDlg('CPF informado para este cliente não é válido',mtWarning,[mbOK],0);
        abort;
      end;
      tipo:= 'F';
      Timer1.Enabled:= True
    end;
  end;
end;

procedure TFrmCnpjCpf.LabAtualizarCaptchaClick(Sender: TObject);
begin
  if Trim(EditCNPJ.text) <> '' then
  begin
    if tipo = 'J' then
      BuscaCNPJ
    else
    if tipo = 'F' then
      BuscaCPF;
  end
  else
    ShowMessage('Informe o CNPJ/CPF');
end;

procedure TFrmCnpjCpf.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  //EditCNPJ.SetFocus;
end;

end.
