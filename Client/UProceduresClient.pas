unit UProceduresClient;

interface
  uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, cxCustomPivotGrid, cxDBPivotGrid,
  cxPivotGridChartConnection, cxGridChartView, cxGridDBChartView, Vcl.StdCtrls,
  cxExportPivotGridLink,cxGridExportLink, Vcl.Buttons,Data.FMTBcd, Data.SqlExpr,IniFiles,
  ACBrECF;

  procedure ExportaPivotGrid(qGrid:TcxDBPivotGrid;Expande,UsaFormatoNativo : boolean;ExtensaoArquivo:string);
  procedure ExportaGrid(qGrid:TcxGrid;Expande,IraSalvar,UsaFormatoNativo : boolean;ExtensaoArquivo:string);
  function VerificaImpressora : TACBrECFModelo;
  function VerificaCPF(qCPF : string):boolean;
  function VerificaCNPJ(qCnpj : string):boolean;
  function RetirarPontosETracos(qString : string):string;
  procedure CarregarCDSPedidosPedidosItens;
  function RetornaPercentualGastoCliente(qCliente:integer;qLimite,qSaldo:Double):Double;
  procedure LeArqIni;
  procedure GravaArqIni;
  procedure LocalizarTransportador(qIdTransportador : integer);
  procedure LocalizarCondicoesVinculadasAFormaDePagamento(qForma:integer);
implementation

uses ULogin, UDataModul;
procedure ExportaPivotGrid(qGrid :TcxDBPivotGrid;Expande,UsaFormatoNativo : boolean;ExtensaoArquivo:string);
var
  vCaminho : string;
  vSalvar : TSaveDialog;
begin
  vSalvar := TSaveDialog.Create(nil);
  vSalvar.Filter := '*.xls';
  if not vSalvar.Execute() then
    abort;
  vCaminho := vSalvar.FileName;
  FreeAndNil(vSalvar);
  cxExportPivotGridToExcel(vCaminho,qGrid,Expande,UsaFormatoNativo,ExtensaoArquivo);
  MessageDlg('O arquivo foi gerado em : '+vCaminho,mtWarning,[mbOK],0);
end;

procedure ExportaGrid(qGrid:TcxGrid;Expande,IraSalvar,UsaFormatoNativo : boolean;ExtensaoArquivo:string);
var
  vCaminho : string;
  vSalvar : TSaveDialog;
begin
  vSalvar := TSaveDialog.Create(nil);
  vSalvar.Filter := '*.xls';
  if not vSalvar.Execute() then
    abort;
  vCaminho := vSalvar.FileName;
  FreeAndNil(vSalvar);
  ExportGridToExcel(vCaminho,qGrid,Expande,IraSalvar,UsaFormatoNativo,ExtensaoArquivo);
  MessageDlg('O arquivo foi gerado em : '+vCaminho,mtWarning,[mbOK],0);
end;

//function VerificaImpressora : TACBrECFModelo;
//var
//  Modelo : TACBrECFModelo;
//begin
//  case StrToInt(Trim(frmLogin.pModeloImpressora)) of
//    0:Modelo := ecfBematech;
//    1:Modelo := ecfDaruma;
//    2:Modelo := ecfDataRegis;
//    3:Modelo := ecfEpson;
//    4:Modelo := ecfFiscNET;
//    5:Modelo := ecf;
//    6:Modelo := ecfMecaf;
//    7:Modelo := ecfNaoFiscal;
//    8:Modelo := ecfNCR;
//    9:Modelo := ecfNenhum;
//    10:Modelo := ecfQuattro;
//    11:Modelo := ecfSchalter;
//    12:Modelo := ecfSweda;
//    13:Modelo := ecfSwedaSTX;
//    14:Modelo := ecfUrano;
//    15:Modelo := ecfYanco;
//  end;
//  Result := Modelo;
//end;

function VerificaCPF(qCPF : string):boolean;
var n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
       d1,d2: integer;
       digitado, calculado: string;
begin
  qCPF := RetirarPontosETracos(qCPF);
  try
    n1:=StrToInt(qCPF[1]);
  except
    Result := false;
    Exit;
  end;

  try
    n2:=StrToInt(qCPF[2]);
  except
    Result := false;
    Exit;
  end;
  try
    n3:=StrToInt(qCPF[3]);
  except
    Result := false;
    Exit;
  end;
  try
    n4:=StrToInt(qCPF[4]);
  except
    Result := false;
    Exit;
  end;
  try
    n5:=StrToInt(qCPF[5]);
  except
    Result := false;
    Exit;
  end;
  try
    n6:=StrToInt(qCPF[6]);
  except
    Result := false;
    Exit;
  end;
  try
    n7:=StrToInt(qCPF[7]);
  except
    Result := false;
    Exit;
  end;
  try
    n8:=StrToInt(qCPF[8]);
  except
    Result := false;
    Exit;
  end;
  try
    n9:=StrToInt(qCPF[9]);
  except
    Result := false;
    Exit;
  end;
  d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:=11-(d1 mod 11);
  if d1>=10 then d1:=0;
    d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
  d2:=11-(d2 mod 11);
  if d2>=10 then
    d2:=0;
  calculado:= inttostr(d1)+ inttostr(d2);
  digitado:= qCPF[10] + qCPF[11];
  if calculado = digitado then
    Result := true
  else
    Result := false;
end;

function VerificaCNPJ(qCnpj : string):boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((qCnpj = '00000000000000') or (qCnpj = '11111111111111') or
      (qCnpj = '22222222222222') or (qCnpj = '33333333333333') or
      (qCnpj = '44444444444444') or (qCnpj = '55555555555555') or
      (qCnpj = '66666666666666') or (qCnpj = '77777777777777') or
      (qCnpj = '88888888888888') or (qCnpj = '99999999999999') or
      (length(qCnpj) <> 14)) then
  begin
    Result := false;
    exit;
  end;
// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
// StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(qCnpj[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11-r):1, dig13); // converte um número no respectivo caractere numérico
{ *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(qCnpj[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11-r):1, dig14);
{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = qCnpj[13]) and (dig14 = qCnpj[14])) then
      Result := true
    else
      Result := false;
  except
    Result := false
  end;
end;

function RetirarPontosETracos(qString : string):string;
var
  I:integer;
  vParteString,vRetornoString : string;
begin
  vRetornoString := '';
  vParteString := '';
  for I := 0 to Length(qString)-1 do
  begin
    vParteString := Copy(qString,I+1,1);
    if (vParteString = '0') or (vParteString = '1') or
       (vParteString = '2') or (vParteString = '3') or
       (vParteString = '4') or (vParteString = '5') or
       (vParteString = '6') or (vParteString = '7') or
       (vParteString = '8') or (vParteString = '9') then
      vRetornoString := vRetornoString + vParteString;
  end;
  Result := vRetornoString;
end;

procedure CarregarCDSPedidosPedidosItens;
begin

end;

function RetornaPercentualGastoCliente(qCliente:integer;qLimite,qSaldo:Double):Double;
var
  vPercentualAviso : Double;
begin
  try
    vPercentualAviso := StrToFloat(frmLogin.pPercentualAvisoCliente);
  except
    vPercentualAviso := 0;
  end;

  if ((((qSaldo/qLimite)*100)-100)*(-1)) > vPercentualAviso  then
    Result := ((((qSaldo/qLimite)*100)-100)*(-1))
  else
    Result := 0;
end;

procedure LeArqIni;
var ArqINI : TIniFile;
    aux : String;
begin
  aux := ExtractFilePath(Application.ExeName)+'configNF_e_Client.ini';
  ArqINI := TIniFile.Create(aux);
  // GERAL
  frmLogin.sFormas      := ArqINI.ReadInteger('GERAL','FORMA_EMISSAO',0);
  frmLogin.sLogoMarca   := ArqINI.ReadString('GERAL','LOGOMARCA','C:\logo.jpg');
  frmLogin.sSalvaArq    := ArqINI.ReadBool('GERAL','SALVA_ARQUIVO',true);
  frmLogin.sPathArq     := ArqINI.ReadString('GERAL','PATH_ARQUIVO','C:\');
  frmLogin.sUltNumNFe   := ArqINI.ReadInteger('GERAL','ULTIMO_NUMERO_NFE',0);
//  frmLogin.sEmissaoNFeServidorOuClient := ArqINI.ReadString('GERAL','LOCAL_EMISSAO_NFE','SERVIDOR');
  // CERTIFICADO
  frmLogin.sCertificado := ArqINI.ReadString('CERTIFICADO','PATH_CERTIFICADO','');
  frmLogin.sSenha       := ArqINI.ReadString('CERTIFICADO','SENHA_CERT','');
  frmLogin.sSerial      := ArqINI.ReadString('CERTIFICADO','NUM_SERIE','');
  // emitente
  frmLogin.sRazao       := ArqINI.ReadString('EMITENTE','RAZAO','');
  frmLogin.sFantasia    := ArqINI.ReadString('EMITENTE','FANTASIA','');
  frmLogin.sCNPJ        := ArqINI.ReadString('EMITENTE','CNPJ','');
  frmLogin.sIE          := ArqINI.ReadString('EMITENTE','I_ESTADUAL','');
  frmLogin.sEndereco    := ArqINI.ReadString('EMITENTE','ENDERECO','');
  frmLogin.sNum         := ArqINI.ReadString('EMITENTE','NUMERO','');
  frmLogin.sBairro      := ArqINI.ReadString('EMITENTE','BAIRRO','');
  frmLogin.sCidade      := ArqINI.ReadString('EMITENTE','CIDADE','');
  frmLogin.sCEP         := ArqINI.ReadString('EMITENTE','CEP','');
  frmLogin.sUF          := ArqINI.ReadString('EMITENTE','UF','');
  frmLogin.sCodMun      := ArqINI.ReadString('EMITENTE','MUNICIPIO','');
  frmLogin.sFone        := ArqINI.ReadString('EMITENTE','TELEFONE','');
  frmLogin.sSituacaoTributaria := ArqINI.ReadString('EMITENTE','SITUACAO_TRIBUTARIA','');
  frmLogin.sAliquotaPis := ArqINI.ReadString('EMITENTE','ALIQUOTA_PIS','');
  frmLogin.sAliquotaCofins := ArqINI.ReadString('EMITENTE','ALIQUOTA_COFINS','');
  // WebService
  frmLogin.sUFWS        := ArqINI.ReadString('WS','UFWS','');
  frmLogin.sAmbiente    := ArqINI.ReadInteger('WS','AMBIENTE',0);
  frmLogin.sHost        := ArqINI.ReadString('WS','HOST','');
  frmLogin.sPorta       := ArqINI.ReadString('WS','PORTA','');
  frmLogin.sUsuario     := ArqINI.ReadString('WS','USUARIO','');
  frmLogin.sSenhaWS     := ArqINI.ReadString('WS','SENHA','');
  //
  ArqINI.Free;
end;

procedure GravaArqIni;
var ArqINI : TIniFile;
vArquivo : string;
begin
  ArqINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'configNF_e_Client.ini');
  // GERAL
  ArqINI.WriteInteger('GERAL','FORMA_EMISSAO',frmLogin.sFormas);
  ArqINI.WriteString('GERAL','LOGOMARCA',frmLogin.sLogoMarca);
  ArqINI.WriteBool('GERAL','SALVA_ARQUIVO',frmLogin.sSalvaArq);
  ArqINI.WriteString('GERAL','PATH_ARQUIVO',frmLogin.sPathArq);
  ArqINI.WriteInteger('GERAL','ULTIMO_NUMERO_NFE',frmLogin.sUltNumNFe);
//  ArqINI.WriteString('GERAL','LOCAL_EMISSAO_NFE',frmLogin.sEmissaoNFeServidorOuClient);
  // CERTIFICADO
  ArqINI.WriteString('CERTIFICADO','PATH_CERTIFICADO',frmLogin.sCertificado);
  ArqINI.WriteString('CERTIFICADO','SENHA_CERT',frmLogin.sSenha);
  ArqINI.WriteString('CERTIFICADO','NUM_SERIE',frmLogin.sSerial);
  // emitente
  ArqINI.WriteString('EMITENTE','RAZAO',frmLogin.sRazao);
  ArqINI.WriteString('EMITENTE','FANTASIA',frmLogin.sFantasia);
  ArqINI.WriteString('EMITENTE','CNPJ',frmLogin.sCNPJ);
  ArqINI.WriteString('EMITENTE','I_ESTADUAL',frmLogin.sIE);
  ArqINI.WriteString('EMITENTE','ENDERECO',frmLogin.sEndereco);
  ArqINI.WriteString('EMITENTE','NUMERO',frmLogin.sNum);
  ArqINI.WriteString('EMITENTE','BAIRRO',frmLogin.sBairro);
  ArqINI.WriteString('EMITENTE','CIDADE',frmLogin.sCidade);
  ArqINI.WriteString('EMITENTE','CEP',frmLogin.sCEP);
  ArqINI.WriteString('EMITENTE','UF',frmLogin.sUF);
  ArqINI.WriteString('EMITENTE','MUNICIPIO',frmLogin.sCodMun);
  ArqINI.WriteString('EMITENTE','TELEFONE',frmLogin.sFone);

  ArqINI.WriteString('EMITENTE','SITUACAO_TRIBUTARIA',frmLogin.sSituacaoTributaria);
  ArqINI.WriteString('EMITENTE','ALIQUOTA_PIS',frmLogin.sAliquotaPis);
  ArqINI.WriteString('EMITENTE','ALIQUOTA_COFINS',frmLogin.sAliquotaCofins);
  // WebService
  ArqINI.WriteString('WS','UFWS',frmLogin.sUFWS);
  ArqINI.WriteInteger('WS','AMBIENTE',frmLogin.sAmbiente);
  ArqINI.WriteString('WS','HOST',frmLogin.sHost);
  ArqINI.WriteString('WS','PORTA',frmLogin.sPorta);
  ArqINI.WriteString('WS','USUARIO',frmLogin.sUsuario);
  ArqINI.WriteString('WS','SENHA',frmLogin.sSenhaWS);
  //
  ArqINI.Free;
end;

procedure LocalizarTransportador(qIdTransportador: integer);
begin
  if not dm.cdsTransportadores.Active then
    dm.cdsTransportadores.Active := true;
  dm.cdsTransportadores.Filtered := False;
  dm.cdsTransportadores.Filter := '';
  dm.cdsTransportadores.Filter := ' ID_TRANSPORTADOR = '+IntToStr(qIdTransportador);
  dm.cdsTransportadores.Filtered := True;
end;

procedure LocalizarCondicoesVinculadasAFormaDePagamento(qForma:integer);
begin
  dm.cdsFormasVSCondicoes.Close;
  dm.cdsFormasVSCondicoes.CommandText := 'SELECT * FROM FORMAS_VS_CONDICOES WHERE ID_FORMA_DE_PAGAMENTO = '+IntToStr(qForma);
  dm.cdsFormasVSCondicoes.Open;
end;

function VerificaImpressora : TACBrECFModelo;
var
  Modelo : TACBrECFModelo;
begin
  case StrToInt(Trim(frmLogin.pModeloImpressora)) of
    0:Modelo := ecfBematech;
    1:Modelo := ecfDaruma;
    2:Modelo := ecfDataRegis;
    3:Modelo := ecfEpson;
    4:Modelo := ecfFiscNET;
//    5:Modelo := ecf;
    6:Modelo := ecfMecaf;
    7:Modelo := ecfNaoFiscal;
    8:Modelo := ecfNCR;
    9:Modelo := ecfNenhum;
    10:Modelo := ecfQuattro;
    11:Modelo := ecfSchalter;
    12:Modelo := ecfSweda;
    13:Modelo := ecfSwedaSTX;
    14:Modelo := ecfUrano;
    15:Modelo := ecfYanco;
  end;
  Result := Modelo;
end;
end.
