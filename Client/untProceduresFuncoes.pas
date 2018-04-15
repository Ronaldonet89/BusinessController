unit untProceduresFuncoes;

interface

uses Dialogs, Classes, Variants, Forms, stdctrls, Windows, Math, DB, IBUpdateSQL, IBQuery, Messages,
     JPEG, Graphics, DateUtils, Shellapi, Controls, IBSQL, Masks, DBClient,
     ExtCtrls,ComCtrls,SysUtils,Data.SqlExpr;

     TYPE
       Procedures = class
       function Encrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
       function Decrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;

       function SemPontosNemTracinhos(qString:String):String;
       function SemPontosMasComTracinhos(qString:String):String;

       function ProximoDiaUtil(DataBasica:tDateTime):tDateTime;

       function TrocaVirgulaPorPonto(qFoiDigitado:String):String;

      function MesPorExtenso(qMes:Integer):String;
      procedure CriarCampoSePrecisar(qTabela, qCampo, qString : String);
      procedure ExcluirCampoSePrecisar(qTabela, qCampo, qString : String);
      procedure CriarGeneratorSePrecisar(qGenerator,qString,qString2: String);
      procedure CriarTabelaSePrecisar(qTabela, qString: String);
      procedure ExcluirTabelaSePrecisar(qTabela:String);
      procedure CriarVisaoSePrecisar(qVisao, qString: String);
      procedure MatarChaveSePrecisar(qChavePrimaria,qString:String);
      procedure MatarIndiceSePrecisar(qTabela,qIndice,qString:String);
      procedure CriarChavePrimariaSePrecisar(qTabela,qChavePrimaria,qString:String);
      procedure CriarIndiceSePrecisar(qTabela,qIndice,qString:String);
      procedure CriarChaveEstrangeiraSePrecisar(qTabela,qChaveEstrangeira,qString:String);
      procedure CriarTriggerSePrecisar(qTrigger,qString:String);
      procedure CriarUDFSePrecisar(qUDF,qString: String);
      procedure AlterarTamanhoSePrecisar(qTabela, qCampo : String; qNovoTamanho:Integer);

      procedure AjustarTipoDoCampoSePrecisar(qTabela, qCampo, qTipoDeCampo : String; qComprimentoDoCampo, qComprimentoDoCaracter : Integer );
      procedure MudarTipoDeDadoSePrecisar(qTabela, qCampo, qTipoOriginal, qNovoTipo: String);

      procedure AjustarTamanhoSePrecisar(qTabela, qCampo:String;qTamanho,qQuantosDecimais:Integer);
      procedure MatarTrigger(qTrigger:String);
      function QueFoiDigitadoEUmNumero(qFoiDigitado:String) : Boolean;
      function QueFoiDigitadoEUmNumeroSemMsg(qFoiDigitado:String) : Boolean;
      function QueFoiDigitadoEUmInteiro(qFoiDigitado:String) : Boolean;
      function SemAcentosNemCedilha(qString:String):String;
      function SemAcentosNemCedilhas(qString:String):String;
      function SemAcentosNemCedilhas_NFE(str: String): String;
      function SemAcentosMasComCedilhas(qString:String):String;
      function SemCaracteresInvalidos(qString:String):String;
      function SemCaracteresInvalidos_NFE(qString:String):String;
      function SemCaracteresInvalidos_NFE_Em_Wide(qString:WideString):WideString;
      procedure InserirFoto(qTabela :string;qIdentificador : Integer);
      procedure ApagarFoto(qTabela :string;qIdentificador : Integer);
      procedure EditarFoto(qTabela :string;qIdentificador : Integer);
      function SelecionarFoto(qTabela :string;qIdentificador : Integer):string;
      Function VerificaCnpjCpf(Numero : String) : Boolean;
     end;

implementation

uses UDataModul;

function Encrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var
  I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;

function Decrypt(const InString:string; StartKey,MultKey,AddKey:Integer): string;
var
  I : Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end;
end;


function SemPontosNemTracinhos(qString:String):String;
var
   vPonteiro:Integer;
   vPalavra : String;
begin
   vPonteiro := 0;
   vPalavra := '';
   while vPonteiro < length(qString) do
   begin
      vPonteiro := vPonteiro + 1;
      if (copy(qString,vPonteiro,1) <> '.') and
         (copy(qString,vPonteiro,1) <> '-') and
         (copy(qString,vPonteiro,1) <> '\') and
         (copy(qString,vPonteiro,1) <> '/') then
         vPalavra := vPalavra + copy(qString,vPonteiro,1);
   end;

   Result := vPalavra;
end;

function SemPontosMasComTracinhos(qString:String):String;
var
   vPonteiro:Integer;
   vPalavra : String;
begin
   vPonteiro := 0;
   vPalavra := '';
   while vPonteiro < length(qString) do
   begin
      vPonteiro := vPonteiro + 1;
      if (copy(qString,vPonteiro,1) <> '.') and
         (copy(qString,vPonteiro,1) <> '\') and
         (copy(qString,vPonteiro,1) <> '/') then
         vPalavra := vPalavra + copy(qString,vPonteiro,1);
   end;

   Result := vPalavra;
end;

function SomenteAlgarismos(qString:String):String;
var
   vPonteiro:Integer;
   vPalavra : String;
begin
   vPonteiro := 0;
   vPalavra := '';
   while vPonteiro < length(qString) do
   begin
      vPonteiro := vPonteiro + 1;
      if (copy(qString,vPonteiro,1) = '0') or
         (copy(qString,vPonteiro,1) = '1') or
         (copy(qString,vPonteiro,1) = '2') or
         (copy(qString,vPonteiro,1) = '3') or
         (copy(qString,vPonteiro,1) = '4') or
         (copy(qString,vPonteiro,1) = '5') or
         (copy(qString,vPonteiro,1) = '6') or
         (copy(qString,vPonteiro,1) = '7') or
         (copy(qString,vPonteiro,1) = '8') or
         (copy(qString,vPonteiro,1) = '9') then
         vPalavra := vPalavra + copy(qString,vPonteiro,1);
   end;

   Result := vPalavra;
end;


function SemPontosNemTracinhosNemParenteses(qString:String):String;
var
   vPonteiro:Integer;
   vPalavra : String;
begin
   vPonteiro := 0;
   vPalavra := '';
   while vPonteiro < length(qString) do
   begin
      vPonteiro := vPonteiro + 1;
      if (copy(qString,vPonteiro,1) <> '.') and
         (copy(qString,vPonteiro,1) <> '-') and
         (copy(qString,vPonteiro,1) <> '\') and
         (copy(qString,vPonteiro,1) <> '/') and
         (copy(qString,vPonteiro,1) <> '(') and
         (copy(qString,vPonteiro,1) <> ')') then
         vPalavra := vPalavra + copy(qString,vPonteiro,1);
   end;

   Result := vPalavra;
end;

function SemEspacosIntermediarios(qString:String):String;
var
   vPonteiro:Integer;
   vPalavra : String;
begin
   vPonteiro := 0;
   vPalavra := '';
   while vPonteiro < length(qString) do
   begin
      vPonteiro := vPonteiro + 1;
      if (copy(qString,vPonteiro,1) <> ' ') then
         vPalavra := vPalavra + copy(qString,vPonteiro,1);
   end;
   Result := vPalavra;
end;



function CNPJFormatado(qCNPJ:String):String;
begin
   Result := copy(qCNPJ,1,2) + '.' + copy(qCNPJ,3,3) + '.' + copy(qCNPJ,6,3) + '/' + copy(qCNPJ,9,4) + '-' + copy(qCNPJ,13,2);
end;

function CPFFormatado(qCPF:String):String;
begin
   Result := copy(qCPF,1,3) + '.' + copy(qCPF,4,3) + '.' + copy(qCPF,7,3) + '-' + copy(qCPF,10,2);
end;


function ProximoDiaUtil(DataBasica:tDateTime):tDateTime;

begin

end;


Function VerificaCnpjCpf(Numero : String) : Boolean;
var
i,j,k : Integer;
Soma : Integer;
Digito : Integer;
CNPJ : Boolean;
NumeroComDigitos : String;
Resultado : String;
begin
   NumeroComDigitos := Numero;
   case Length(Numero) of
      11 : CNPJ := False;
      14: CNPJ := True;
      //else raise Exception.Create('CPF/CNPJ inválido');
      //Tirei a linha acima e transformei para ShowMessage
      //Pois a mensagem estava aparecendo muito no canto da tela
   else
   begin
      ShowMessage('CPF/CNPJ inválido:' + #13 + NumeroComDigitos);
      Result := False;
   end;
   end;

   if (length(Numero) = 11) or (length(Numero) = 14) then
   begin
      Resultado := copy(Numero,1,length(Numero)-2);
      // calcula duas vezes
      for j := 1 to 2 do begin
         k := 2;
         soma := 0;
         for i := length(Resultado) downto 1 do begin
           // converte o dígito para numérico, multiplica e soma
           Soma := Soma + (Ord(Resultado[i]) - Ord('0')) * k;
           Inc(k);
           if (k > 9) and CNPJ then
              K := 2;
         end;
         Digito := 11 - Soma mod 11;
         if Digito >= 10 then
            Digito := 0;

         //Adiciona o dígito ao resultado
         Resultado := resultado + Chr(Digito + Ord('0'));
      end;

      if Resultado = NumeroComDigitos then
         Result := True
      else
      begin
         if (length(Numero) = 11) then
            ShowMessage('CPF não confere:' + #13 + NumeroComDigitos)
         else
            ShowMessage('CNPJ não confere:' + #13 + NumeroComDigitos);

         Result := False;
      end;
   end;
end;

{
function LerImpressora:String;
var
   MyPrinter, MyDriver, MyPort: array[0..100] of Char;
   DevMode: THandle;
begin
   Printer.GetPrinter(MyPrinter, MyDriver, MyPort, DevMode);
   Result := MyPrinter;
   Result := MyPrinter;
end;

procedure Imp_InicializaPagina;
begin
  if not StartPagePrinter(hPrinter) then
     raise exception.create('THE CLUB - Problemas na inicialização da página!');
end;

function GeraArqTemp: String;
var
  TempDir: array[0..MAX_PATH] of char;
  Buffer : array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @TempDir);
  GetTempFileName(@TempDir, 'CLUB', 0, Buffer);
  Result := Buffer;
end;

function Imp_Inicio(Const pNomeImp, pNomeTrabalho, pTipo: String; pPreview: Boolean): Boolean;
var
  DocInfo: TDocInfo1;
begin
  Result := False;
  //if not WinSpool.OpenPrinter(PChar( pNomeImp ), hPrinter, nil) then
  if not WinSpool.OpenPrinter(PChar( frmLogin.vImpressoraSelecionada ), hPrinter, nil) then
    raise exception.create('IMPACTO INFORMÁTICA - Impressora não encontrada!');

  DocInfo.pDocName := PChar( pNomeTrabalho );
  DocInfo.pOutputFile := nil;
  if pPreview then
  begin
    DocInfo.pOutputFile := PChar( GeraArqTemp );
    FrmPreview := TFrmPreview.Create( Nil );
    FrmPreview.ArqPreview := DocInfo.pOutputFile;
  end;
  DocInfo.pDatatype := PChar( pTipo );
  if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then
    Exit;
  if not StartPagePrinter(hPrinter) then
    Exit;
  Result := True;
end;

procedure Imp_Fim;
begin
  EndPagePrinter(hPrinter);
  EndDocPrinter(hPrinter);
  WinSpool.ClosePrinter(hPrinter);

//  if Assigned( FrMPreview ) then
  if (Assigned( FrMPreview)) and (frmLogin.vApresentarPreview = True) then
  begin
    try
      FrmPreview.Memo1.Lines.LoadFromFile( FrmPreview.ArqPreview );
      FrMPreview.ShowModal;
      // Exclui o arquivo temporário
      try
        DeleteFile( FrmPreview.ArqPreview );
      except end;
    finally
      FreeAndNil( FrMPreview );
    end;
  end;
end;

}

{
procedure Imp_Linha(SaltaLin, EspacoCol: Integer; Texto: String; TamTotal: Integer; Alinha: Char);
var
  i: integer;
  Espaco: string;
begin
  // adiciona as linhas
  for i:=1 to SaltaLin do
    WritePrinter(hPrinter, PChar(#13+#10), Length(#13+#10), BytesWritten);
  // Calcula o espaço q determinado o tamanho total do campo
  Espaco := StringOfChar(' ', TamTotal-Length(Texto));
  if Alinha = 'E' then
    Texto := Texto+Espaco
  else if Alinha = 'D' then
    Texto := Espaco+Texto;
  // adiciona espaço entre as colunas
  Texto := StringOfChar(' ', EspacoCol)+Texto;
  // Imprime o texto
  WritePrinter(hPrinter, PChar(Texto), Length(Texto), BytesWritten);
end;
 }
{
procedure Imp_Ejeta;
var ch: Char;
begin
  ch:= #12;
  WritePrinter( hPrinter, @ch, 1, BytesWritten );
  EndPagePrinter(hPrinter);
end;
 }

function StringComComprimentoFixo(qString:String;qComprimento:Integer):String;
var
   vEspacos:String;
begin
   //Esta função preenche espaços à direita, para atingir o comprimento desejado
   vEspacos := '                                                                                     ';
   Result := qString + copy(vEspacos,1,qComprimento - length(qString))
end;

function ADireitaSemPontinhos(qInteger,qComprimento:Integer):String;
var
   vEspacos,qVeioEmString:String;

begin
   vEspacos := '                                      ';
   qVeioEmString := IntToStr(qInteger);
   Result := copy(vEspacos,1,qComprimento - length(qVeioEmString)) + qVeioEmString;
end;

Function RedigitouSenhaCorretamente():Boolean;
begin


end;

function ConfirmouSenhaCorretamente(Msg: String):Boolean;
begin

end;

Function RedigitouSenhaComPermissaoPara(qPermissao:String):Boolean;
begin

end;


function TrocaVirgulaPorPonto(qFoiDigitado:String):String;
var
   vResultado : String;
   vPonteiro : Integer;
begin
   vPonteiro := 0;
   vResultado := '';
   qFoiDigitado := trim(qFoiDigitado);
   while vPonteiro < length(qFoiDigitado) do
   begin
      vPonteiro := vPonteiro + 1;
      if copy(qFoiDigitado,vPonteiro,1) = ',' then
         vResultado := vResultado + '.'
      else
         vResultado := vResultado + copy(qFoiDigitado,vPonteiro,1);

   end;
   Result := vResultado;
end;

function TiraSinalDePorcentagem(qFoiDigitado:String):String;
var
   vResultado : String;
   vPonteiro : Integer;
begin
   vPonteiro := 0;
   vResultado := '';
   qFoiDigitado := trim(qFoiDigitado);
   while vPonteiro < length(qFoiDigitado) do
   begin
      vPonteiro := vPonteiro + 1;
      if copy(qFoiDigitado,vPonteiro,1) <> '%' then
         vResultado := vResultado + copy(qFoiDigitado,vPonteiro,1);

   end;
   Result := vResultado;
end;

function QuantasCasasDepoisDaVirgula(vValor:Real):Integer;
var
   vContador, vPosicao : Integer;
   vValorEmString : String;
   vTemUmaVirgula : Boolean;
begin
   vTemUmaVirgula := False;
   vValorEmString := FloatToStr(vValor);
   vPosicao := length(vValorEmString) - 1;
   vContador := 1;
   while vPosicao > 0 do
   begin
      if copy(vValorEmString,vPosicao,1) = ',' then
      begin
         vTemUmaVirgula := True;
         break;
      end;
      vContador := vContador + 1;
      vPosicao := vPosicao - 1;
   end;
   if vTemUmaVirgula = False then
      Result := 0
   else
      Result := vContador;
      
end;

function MesPorExtenso(qMes:Integer):String;
begin
   if qMes = 1 then
      Result := 'Janeiro'
   else if qMes = 2 then
      Result := 'Fevereiro'
   else if qMes = 3 then
      Result := 'Março'
   else if qMes = 4 then
      Result := 'Abril'
   else if qMes = 5 then
      Result := 'Maio'
   else if qMes = 6 then
      Result := 'Junho'
   else if qMes = 7 then
      Result := 'Julho'
   else if qMes = 8 then
      Result := 'Agosto'
   else if qMes = 9 then
      Result := 'Setembro'
   else if qMes = 10 then
      Result := 'Outubro'
   else if qMes = 11 then
      Result := 'Novembro'
   else if qMes = 12 then
      Result := 'Dezembro'
   else
   begin
      ShowMessage('Inconsistência 5ERX' + #13 + 'Mes inválido');
      Result := '---';
   end;
end;


function DigitoVerificadorModulo10(qStringDeNumeros:String):String;
var
   vSoma, vMult, vPosicao, vParcela, vParcelaAjustada, vResto, vDigito : Integer;
begin
   vSoma := 0;
   vMult := 2;
   vPosicao := Length(qStringdeNumeros);

   while vPosicao > 0 do
   begin
      vParcela := vMult * StrToInt(copy(qStringDeNumeros,vPosicao,1));
      if vMult = 2 then
         vMult := 1
      else
         vMult := 2;

      //Ajustando a parcela, para somar os algarismos da parcela (Maiores que 10)
      if vParcela < 10 then
         vParcelaAjustada := vParcela
      else if vParcela = 10 then
         vParcelaAjustada := 1
      else if vParcela = 11 then
         vParcelaAjustada := 2
      else if vParcela = 12 then
         vParcelaAjustada := 3
      else if vParcela = 13 then
         vParcelaAjustada := 4
      else if vParcela = 14 then
         vParcelaAjustada := 5
      else if vParcela = 15 then
         vParcelaAjustada := 6
      else if vParcela = 16 then
         vParcelaAjustada := 7
      else if vParcela = 17 then
         vParcelaAjustada := 8
      else if vParcela = 18 then
         vParcelaAjustada := 9
      else
      begin
         ShowMessage('Inconsistência 6YRR67');
         Application.Terminate;
      end;

      vSoma := vSoma + vParcelaAjustada;
      vPosicao := vPosicao - 1;
   end;

   vResto := vSoma - trunc(vSoma / 10) * 10;
   vDigito := 10 - vResto;

   if vDigito = 10 then
      vDigito := 0;

   Result := IntToStr(vDigito);

end;

//*************************************************
//* CalcDigito - Faz o calculo do Dígito Verificador
//* do código de barras e preenche o campo correspon-
//* dente
//* PARAMETROS:
//* 	numero: TextBox contendo o número do código
//*		de barras
//*	ditigo: TextBox contendo o dígito verifica-
//*		dor calculado
//*AUTOR: Gabriel Fróes - www.codigofonte.com.br
//**************************************************/
//function CalcDigito(numero,digito){
//	factor = 3;
//	sum = 0;
//
//	for(index = numero.value.length; index > 0; --index){
//		sum = sum + numero.value.substring (index-1, index) * factor;
//    		factor = 4 - factor;
//  	}
//
//	cc = ((1000 - sum) % 10);
//
//	digito.value = cc;
//	numlen = numero.value.length;
//
//	if (numlen > 17){
//		digito.value = "";
//		alert("O número deve possuir no máximo 17 dígitos");
//	}
//
//	if (((((numlen != 7) && (numlen != 11)) && (numlen != 12)) && (numlen != 13)) && (numlen != 17)){
//		digito.value = "";
//		alert("O número deve possuir 7 (EAN/UCC-8), 11 (UCC-12), 12 (EAN/UCC-13), 13 (EAN/UCC-14) ou 17 (SSCC) dígitos");
//	}
//}
function Dig_EAN_8_12_13_14(const data:string):string;
var
   i, factor, sum, cc: integer;
   v_data : string;
begin
   factor := 3;
   sum := 0;
   v_data := trim(data);

   for i := Length(v_data) downto 1 do
   begin
      sum := sum + StrToInt(v_data[i]) * factor;
      factor := 4 - factor;
   end;

   cc := ((1000 - sum) mod 10);

   Result := v_data + IntToStr(cc);
end;


procedure CriarCampoSePrecisar(qTabela, qCampo, qString : String);
var
   vTabelaExiste, vPrecisaInserir : Boolean;
   vMinhaQuery : TSQLQuery;
begin
   //Primeira coisa a ser feita, é verificar se existe a tabela:
   vMinhaQuery := TSQLQuery.Create(nil);
   vMinhaQuery.SQLConnection := DM.SQLConexao;
   with vMinhaQuery, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 0 then
      begin
         ShowMessage('Está faltando a tabela' + #13 + qTabela);
         vTabelaExiste := False;
         vPrecisaInserir := False;
      end
      else
         vTabelaExiste := True;

      Close;
   end;

   //Agora verificando se existe o campo:
   if vTabelaExiste = True then
   begin
      with vMinhaQuery, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ');
         Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
         Add(' and RDB$FIELD_NAME =:PCAMPO ');
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         Open;
         if RecordCount = 0 then
            vPrecisaInserir := True
         else
            vPrecisaInserir := False;

         Close;
      end;
   end;

   //Agora a inserção propriamente dita:
   if vPrecisaInserir = True then
   begin

      with vMinhaQuery do
      begin
         SQL.Clear;
         SQL.CommaText := 'BEGIN TRANSACTION';
         SQL.Add(qString);
         try
            ExecSQL(True);
         except
            ShowMessage('Não foi possível criar o campo: ' + #13 +
                         qCampo + #13 + #13 + 'Na tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
   FreeAndNil(vMinhaQuery);
end;

{
procedure tfrmPrincipal.MatarChaveEstrangeiraSeExistir();
begin
   //Primeira coisa a ser feita, é verificar se existe a tabela:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 0 then
      begin
         ShowMessage('Está faltando a tabela' + #13 + qTabela);
         vTabelaExiste := False;
         vPrecisaInserir := False;
      end
      else
         vTabelaExiste := True;

      Close;
   end;

end;
}

procedure ExcluirCampoSePrecisar(qTabela, qCampo, qString : String);
var
   vPrecisaExcluir : Boolean;
   vMinhaQuery : TSQLQuery;
begin
   // verificando se existe o campo:
   vMinhaQuery := TSQLQuery.Create(nil);
   with vMinhaQuery, SQL do
   begin
      Close;
      Clear;
      Add(' SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ');
      Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
      Add(' and RDB$FIELD_NAME =:PCAMPO ');
      ParamByName('PTABELA').Value := qTabela;
      ParamByName('PCAMPO').Value := qCampo;
      Open;
      if RecordCount = 0 then
         vPrecisaExcluir := False
      else
         vPrecisaExcluir := True;

       vMinhaQuery.Close;

   end;

   if vPrecisaExcluir = true then
   begin
      with vMinhaQuery do
      begin
         SQL.Clear;
         SQL.CommaText := 'BEGIN TRANSACTION';
         SQL.Add(qString);
         try
            ExecSQL(True);
         except
            ShowMessage('Não foi possível excluir o campo: ' + #13 +
                         qCampo + #13 + #13 + 'Na tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
   FreeAndNil(vMinhaQuery);
end;


procedure CriarTabelaSePrecisar(qTabela,qString:String);
var
   vPrecisaInserir : Boolean;
   vMinhaQuery : TSQLQuery;
begin
   //Primeiro, verificar se existe a tabela
   vMinhaQuery := TSQLQuery.Create(nil);
   with vMinhaQuery, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 1 then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;

      Close;
   end;

   if vPrecisaInserir = True then
   begin
      with vMinhaQuery do
      begin
         SQL.Clear;
         SQL.CommaText := 'BEGIN TRANSACTION';
         SQL.Add(qString);
         try
            ExecSQL(True);
         except
            ShowMessage('Não foi possível criar a tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
   FreeAndNil(vMinhaQuery);
end;

procedure CriarChavePrimariaSePrecisar(qTabela,qChavePrimaria,qString:String);
var
   vPrecisaInserir : Boolean;
   vMinhaQuery : TSQLQuery;
begin
   //Verificando se existe:
   vMinhaQuery := TSQLQuery.Create(nil);
   with vMinhaQuery, SQL do
   begin
      Close;
      Clear;
      Add(' SELECT * FROM RDB$RELATION_CONSTRAINTS ');
      Add(' WHERE RDB$CONSTRAINT_TYPE=:P1 AND RDB$RELATION_NAME=:P2');
      ParamByName('P1').Value := 'PRIMARY KEY';
      ParamByName('P2').Value := qTabela;
      Open;
      if RecordCount = 1 then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;

      Close;
   end;

//   vPrecisaInserir := True;
   if vPrecisaInserir = True then
   begin
      with vMinhaQuery do
      begin
         SQL.Clear;
         SQL.CommaText := 'BEGIN TRANSACTION';
         SQL.Add(qString);
         try
            ExecSQL(True)
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível criar o a chave primária: ' + #13 +
                         qTabela);

         end;
      end;
   end;

end;

procedure CriarIndiceSePrecisar(qTabela,qIndice,qString:String);
var
   vPrecisaInserir : Boolean;
begin
   //Verificando se existe:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add(' SELECT * FROM RDB$INDICES ');
      Add(' WHERE RDB$INDEX_NAME=:P1 AND RDB$RELATION_NAME=:P2');
      ParamByName('P1').Value := qIndice;
      ParamByName('P2').Value := qTabela;
      Open;
      if RecordCount = 1 then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;

      Close;
   end;

//   vPrecisaInserir := True;
   if vPrecisaInserir = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add(qString);
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível criar o índice: ' + #13 +
                        'Tabela: ' +  qTabela + #13 +
                        'Índice: ' + qIndice + #13 + #13 +
                        'Provável causa: Duplicidade de registro' + #13 +
                        'Mensagem TR872');

         end;
      end;
   end;
end;

procedure MatarIndiceSePrecisar(qTabela,qIndice,qString:String);
var
   vPrecisarMatar : Boolean;
begin
   //Verificando se existe:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add(' SELECT * FROM RDB$INDICES ');
      Add(' WHERE RDB$INDEX_NAME=:P1 AND RDB$RELATION_NAME=:P2');
      ParamByName('P1').Value := qIndice;
      ParamByName('P2').Value := qTabela;
      Open;
      if RecordCount = 1 then
         vPrecisarMatar := True
      else
         vPrecisarMatar := False;

      Close;
   end;

//   vPrecisaInserir := True;
   if vPrecisarMatar = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add(qString);
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível criar o índice: ' + #13 +
                         qTabela);

         end;
      end;
   end;
end;

procedure CriarGeneratorSePrecisar(qGenerator,qString,qString2: String);
var
   vPrecisaInserir : Boolean;
begin
   //Primeira coisa a saber, é se ele existe:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM RDB$GENERATORS');
      Add('WHERE (RDB$SYSTEM_FLAG IS NULL OR RDB$SYSTEM_FLAG = 0)');
      Add('AND RDB$GENERATOR_NAME=:PNOME');
      ParamByName('PNOME').Value := qGenerator ;
      Open;
      if RecordCount = 1 then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;

      Close;
   end;

   if vPrecisaInserir = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add(qString);
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível criar o generator: ' + #13 +
                         qGenerator);

         end;
      end;
   end;

end;

procedure CriarUDFSePrecisar(qUDF,qString: String);
var
   vPrecisaInserir : Boolean;
begin
   //Primeira coisa a saber, é se ele existe:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM RDB$FUNCTIONS');
      Add('WHERE (RDB$SYSTEM_FLAG IS NULL OR RDB$SYSTEM_FLAG = 0)');
      Add('AND RDB$FUNCTION_NAME=:PNOME');
      ParamByName('PNOME').Value := qUDF ;
      Open;
      if RecordCount = 1 then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;

      Close;
   end;

   if vPrecisaInserir = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add(qString);
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível criar a UDF: ' + #13 +
                         qUDF);

         end;
      end;
   end;

end;


procedure CriarTriggerSePrecisar(qTrigger,qString:String);
var
   vPrecisaInserir : Boolean;
begin
   //Primeira coisa a saber, é se ele existe:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM RDB$TRIGGERS ');
      Add('WHERE RDB$TRIGGER_NAME=:PNOME');
      ParamByName('PNOME').Value := qTrigger ;
      Open;
      if RecordCount = 1 then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;

      Close;
   end;

   if vPrecisaInserir = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add(qString);
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível criar a trigger: ' + #13 +
                         qTrigger);
         end;
      end;
   end;

end;

procedure MatarTrigger(qTrigger:String);
var
   vString:String;
   vPrecisaMatar : Boolean;
begin
   //Primeira coisa a fazer, é verificar se ela existe:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM RDB$TRIGGERS');
      Add('WHERE RDB$TRIGGER_NAME=:PNOME');
      ParamByName('PNOME').Value := qTrigger ;
      Open;
      if RecordCount = 1 then
         vPrecisaMatar := True
      else
         vPrecisaMatar := False;

      Close;
   end;

   if vPrecisaMatar = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      vString := 'DROP TRIGGER ' + qTrigger;
      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add(vString);
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível matar a trigger:' + qTrigger);
         end;
      end;
   end;
end;

procedure AjustarTamanhoSePrecisar(qTabela,qCampo:String;qTamanho,qQuantosDecimais:Integer);
var
   vPrecisa:Boolean;
begin
   //Em primeiro lugar, preciso verificar se o tamanho já está certo:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$FIELD_LENGTH, RDB$FIELD_TYPE FROM RDB$FIELDS ');
      Add('WHERE RDB$FIELD_NAME= ');
      Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
      Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');
      ParamByName('PTABELA').Value := qTabela;
      ParamByName('PCAMPO').Value := qCampo;

      Open;
      if (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> 14) and
         (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> 37) then
      begin
         ShowMessage('Sistema não está preparado ' + #13 + 'para esse tipo de campo' + 'Bloqueio 6TIPOTIPO');
         Abort;
      end;
      if DTM1.IBQGenerica.Fields[0].AsInteger <> qTamanho then
         vPrecisa := True
      else
         vPrecisa := False;

      DTM1.IBQGenerica.Close;
   end;

   if vPrecisa = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add('UPDATE RDB$FIELDS ' );
         SQL.Add('SET RDB$FIELD_LENGTH=:PTAMANHO, RDB$CHARACTER_LENGTH=:PTAMANHO, ');
         SQL.Add('RDB$COLLATION_ID = 15 ');
         SQL.Add('WHERE RDB$FIELD_NAME = ');
         SQL.Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
         SQL.Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');
         ParamByName('PTAMANHO').Value := qTamanho;
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível concluír');
            Abort;
         end;
      end;
   end;
end;

procedure AjustarEscalaSePrecisar(qTabela,qCampo:String;qTamanho,qQuantosDecimais:Integer);
var
   vPrecisa:Boolean;
begin
   //Em primeiro lugar, preciso verificar se o tamanho e a escala já está certo:
   //Lembrando que tamanho fica armazenado em RDB$FIELD_PRECISION
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$FIELD_TYPE, RDB$FIELD_PRECISION, RDB$FIELD_SCALE FROM RDB$FIELDS ');
      Add('WHERE RDB$FIELD_NAME= ');
      Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
      Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');
      ParamByName('PTABELA').Value := qTabela;
      ParamByName('PCAMPO').Value := qCampo;
      Open;

      if recordcount <> 0 then
      begin
         if (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> 8) and
            (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> 16) then
         begin
            ShowMessage('Sistema não está preparado ' + #13 +
                        'para ajustar escala nesse tipo de campo' + #13 +
                        'Bloqueio 7TIXOTXPO');
            Abort;
         end;

         if (DTM1.IBQGenerica.FieldByName('RDB$FIELD_PRECISION').AsInteger <> qTamanho) or
            (DTM1.IBQGenerica.FieldByName('RDB$FIELD_SCALE').Value <> qQuantosDecimais * (-1)) then
            vPrecisa := True
         else
            vPrecisa := False;
      end;

      DTM1.IBQGenerica.Close;
   end;

   if vPrecisa = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add('UPDATE RDB$FIELDS ' );
         SQL.Add('SET RDB$FIELD_PRECISION=:PTAMANHO, RDB$FIELD_SCALE=:PDECIMAIS ');
         SQL.Add('WHERE RDB$FIELD_NAME = ');
         SQL.Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
         SQL.Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');
         ParamByName('PTAMANHO').Value := qTamanho;
         ParamByName('PDECIMAIS').Value := qQuantosDecimais * (-1);
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível concluír');
            Abort;
         end;
      end;
   end;
end;

procedure MudarNomeDoCampoSePrecisar(qTabela, qAntigoNomeDoCampo, qNovoNomeDoCampo : String);
var
   vLinha : String;
   vTabelaExiste, vPrecisaAlterar : Boolean;
begin
   //Primeira coisa a ser feita, é verificar se existe a tabela:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 0 then
      begin
         ShowMessage('Está faltando a tabela' + #13 + qTabela);
         vTabelaExiste := False;
         vPrecisaAlterar := False;
      end
      else
         vTabelaExiste := True;

      Close;
   end;

   //Agora verificando se existe o nome antigo do campo
   if vTabelaExiste = True then
   begin
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT RDB$FIELD_NAME, RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS ');
         Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
         Add(' and RDB$FIELD_NAME =:PCAMPO ');
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qAntigoNomeDoCampo;
         Open;
         if RecordCount = 0 then
         begin
            vPrecisaAlterar := False;
         end
         else
            vPrecisaAlterar := True;

         DTM1.IBQGenerica.Close;
      end;
   end;

   //Agora verificando se o novo campo já existe:
   if vPrecisaAlterar = True then
   begin
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT RDB$FIELD_NAME, RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS ');
         Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
         Add(' and RDB$FIELD_NAME =:PCAMPO ');
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qNovoNomeDoCampo;
         Open;
         if RecordCount <> 0 then
         begin
            ShowMessage('Inconsistência 6PSSP: ' + #13 +
                        'Na tabela ' + qTabela + #13 +
                        'Não foi possível alterar o nome do campo:' + #13 +
                        'De : ' + qAntigoNomeDoCampo + ' para ' + qNovoNomeDoCampo);
            vPrecisaAlterar := False;
         end;

         DTM1.IBQGenerica.Close;
      end;
   end;

   //Agora a alteração de nome propriamente dita:
   if vPrecisaAlterar = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         vLinha := 'ALTER TABLE ' + qTabela +
                   ' ALTER ' + qAntigoNomeDoCampo + ' TO ' + qNovoNomeDoCampo;

         SQL.Add(vLinha);

         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Inconsistência 7PSSP: ' + #13 +
                        'Na tabela ' + qTabela + #13 +
                        'Não foi possível alterar o nome do campo:' + #13 +
                        'De : ' + qAntigoNomeDoCampo + ' para ' + qNovoNomeDoCampo);

         end;
      end;
   end;

end;

procedure AlterarCampoCalculadoSePrecisar(qTabela, qCampo, qTipoTamanhoEscala, qFormula : String);
var
   vNomeDoCampoSegundoFireBird, vStringDestaProcedure : String;
   vTabelaExiste, vPrecisaAlterar : Boolean;
begin
   //Primeira coisa a ser feita, é verificar se existe a tabela:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 0 then
      begin
         ShowMessage('Está faltando a tabela' + #13 + qTabela);
         vTabelaExiste := False;
         vPrecisaAlterar := False;
      end
      else
         vTabelaExiste := True;

      Close;
   end;

   //Agora verificando se existe o campo:
   if vTabelaExiste = True then
   begin
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT RDB$FIELD_NAME, RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS ');
         Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
         Add(' and RDB$FIELD_NAME =:PCAMPO ');
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         Open;
         if RecordCount = 0 then
         begin
            ShowMessage('Está faltando o campo: ' + qCampo + #13 + 'Da tabela: ' + qTabela);
            vPrecisaAlterar := False;
         end
         else
         begin
            vPrecisaAlterar := True;
            vNomeDoCampoSegundoFireBird := DTM1.IBQGenerica.FieldByName('RDB$FIELD_SOURCE').AsString;
         end;
//         Close;
      end;
   end;

   //Agora verificando se o cálculo já está correto
   if vPrecisaAlterar = True then
      begin
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add('SELECT RDB$COMPUTED_SOURCE FROM RDB$FIELDS WHERE RDB$FIELD_NAME=:P1');
         ParamByName('P1').Value := vNomeDoCampoSegundoFireBird;
         Open;
         if Trim(DTM1.IBQGenerica.FieldByName('RDB$COMPUTED_SOURCE').AsString) = Trim(qFormula) then
            vPrecisaAlterar := False;
      end;
      DTM1.IBQGenerica.Close;
   end;

   if vPrecisaAlterar = true then
   begin
      vStringDestaProcedure := 'alter table ' + qTabela + ' drop ' + qCampo;
      ExcluirCampoSePrecisar(qTabela,qCampo,vStringDestaProcedure);

      //Agora que o campo foi excluido, vamos criá-lo novamente;
      vStringDestaProcedure := ' ALTER TABLE ' + qTabela + ' ADD ' + qCampo + ' ' + qTipoTamanhoEscala + ' COMPUTED BY ';
      vStringDestaProcedure := vStringDestaProcedure + qFormula;
      CriarCampoSePrecisar(qTabela,qCampo,vStringDestaProcedure);
   end;
end;

procedure CriarChaveEstrangeiraSePrecisar(qTabela,qChaveEstrangeira,qString:String);
var
   vPrecisaInserir : Boolean;
begin
   //Verificando se existe:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add(' SELECT * FROM RDB$RELATION_CONSTRAINTS ');
      Add(' WHERE RDB$CONSTRAINT_TYPE=:P1 AND RDB$RELATION_NAME=:P2');
      Add(' AND RDB$CONSTRAINT_NAME =:P3');
      ParamByName('P1').Value := 'FOREIGN KEY';
      ParamByName('P2').Value := qTabela;
      ParamByName('P3').Value := qChaveEstrangeira;
      Open;
      if RecordCount = 1 then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;

      Close;
   end;

//   vPrecisaInserir := True;
   if vPrecisaInserir = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add(qString);
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível criar a chave estrangeira: ' + #13 +
                         qTabela + #13 + qChaveEstrangeira + #13 + qString );

         end;
      end;
   end;

end;

procedure AjustarTipoDoCampoSePrecisar(qTabela,qCampo, qTipoDeCampo : String; qComprimentoDoCampo, qComprimentoDoCaracter : Integer );
var
   vPrecisa:Boolean;
   vCodigoDoTipo, qCaracter_Set_Id, qCollation_ID : Integer;
begin

//Lembrando que o SQL que o IBExpert gera é assim:
{
update RDB$FIELDS set
RDB$FIELD_TYPE = 37,
RDB$FIELD_LENGTH = 3,
RDB$CHARACTER_LENGTH = 3,
RDB$CHARACTER_SET_ID = 21,
RDB$COLLATION_ID = 15
where RDB$FIELD_NAME = 'RDB$852'
 `}
   if qTipoDeCampo = 'VARCHAR' then
   begin
      vCodigoDoTipo := 37;
      qCaracter_Set_Id := 21;
      qCollation_ID := 15;
   end
   else
   begin
      ShowMessage('Rotina imprevista 5YYP34: ' + #13 + 'Sistema não está preparado para esse tipo de campo');
      Abort;
   end;

   //Em primeiro lugar, preciso verificar se o tipo já está certo:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$FIELD_TYPE, RDB$FIELD_TYPE FROM RDB$FIELDS ');
      Add('WHERE RDB$FIELD_NAME= ');
      Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
      Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');
      ParamByName('PTABELA').Value := qTabela;
      ParamByName('PCAMPO').Value := qCampo;
      Open;
      if recordcount = 0 then
      begin
         ShowMessage('Rotina imprevista TEX3342' + #13 + 'campo inexistente');
         Abort;
      end;

      if (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> vCodigoDoTipo) then
         vPrecisa := True
      else
         vPrecisa := False;

      DTM1.IBQGenerica.Close;
   end;

   if vPrecisa = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add('UPDATE RDB$FIELDS ' );
         SQL.Add('SET RDB$FIELD_TYPE=:PTIPO, ');
         SQL.Add(' RDB$FIELD_LENGTH=:PTAMANHODOCAMPO, RDB$CHARACTER_LENGTH=:PTAMANHODOCARACTER, ');
         SQL.Add('RDB$CHARACTER_SET_ID=:P_SET_DO_CARACTER, ');
         SQL.Add('RDB$COLLATION_ID =:P_SET_DO_COLLATION ');
         SQL.Add('WHERE RDB$FIELD_NAME = ');
         SQL.Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
         SQL.Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');
         ParamByName('PTIPO').Value := vCodigoDoTipo;
         ParamByName('PTAMANHODOCAMPO').Value := qComprimentoDoCampo;
         ParamByName('PTAMANHODOCARACTER').Value := qComprimentoDoCaracter;
         ParamByName('P_SET_DO_CARACTER').Value := qCaracter_Set_Id;
         ParamByName('P_SET_DO_COLLATION').Value := qCollation_ID;
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;

         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível concluír');
            Abort;
         end;
      end;
   end;
end;

procedure MudarTipoDeDadoSePrecisar(qTabela, qCampo, qTipoOriginal, qNovoTipo: String);
var
   vPrecisa:Boolean;
   vField_Length, vField_Scale, vField_Type, vField_Sub_Type, vCharacter_Length,
   vCollation_ID, vCharacter_Set_ID, vField_Precision, vSystem_Flag,
   vSegment_Length: Integer;
   vString: String;
begin

//Lembrando que o SQL que o IBExpert gera é assim:
{
update RDB$FIELDS set
RDB$FIELD_TYPE = 37,
RDB$FIELD_LENGTH = 3,
RDB$CHARACTER_LENGTH = 3,
RDB$CHARACTER_SET_ID = 21,
RDB$COLLATION_ID = 15
where RDB$FIELD_NAME = 'RDB$852'

// Elcio - 28/08/2007 - Quando for campo BLOB, informar em qNovoTipo:
//                      BLOB BINARY - Para campos BLOB que armazenam FOTOS e
//                      BLOB TEXT - para campos que armazenam texto.
 `}
   //Em primeiro lugar, preciso verificar se o tipo já está certo:
   if qNovoTipo = 'BLOB' then
      vField_Type := 261
   else
   if qNovoTipo = 'DATE' then
      vField_Type := 12
   else
   if qNovoTipo = 'TIME' then
      vField_Type := 13
   else
   if qNovoTipo = 'CHAR' then
      vField_Type := 14
   else
   if qNovoTipo = 'INTEGER' then
      vField_Type := 8
   else
   if copy(qNovoTipo,1,7) = 'VARCHAR' then
      vField_Type := 37
   else
   if qNovoTipo = 'SMALLINT' then
      vField_Type := 7
   else
   if Copy(qNovoTipo, 1, 7) = 'NUMERIC' then
      vField_Type := 16;

   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$FIELD_TYPE FROM RDB$FIELDS ');
      Add('WHERE RDB$FIELD_NAME= ');
      Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
      Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');
      ParamByName('PTABELA').Value := qTabela;
      ParamByName('PCAMPO').Value := qCampo;
      Open;
      if recordcount = 0 then
      begin
         ShowMessage('Rotina imprevista TEX342' + #13 + 'campo inexistente:' + #13 + 'Tabela: ' + qTabela + #13 + 'Campo: ' + qCampo);
         Abort;
      end;

      if (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> vField_Type) then
         vPrecisa := True
      else
         vPrecisa := False;

      DTM1.IBQGenerica.Close;
   end;

   if vPrecisa = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      // Cria campo temporário
      vString := 'ALTER TABLE ' + qTabela + ' ';
      vString := vString + 'ADD TEMP1_NAO_USAR_ESTE_NOME ' + qTipoOriginal;
      CriarCampoSePrecisar(qTabela, 'TEMP1_NAO_USAR_ESTE_NOME', vString);

      with DTM1.IBSQLGenerico2, SQL do
      begin
        Close;
        Clear;
        Add('UPDATE ' + qTabela + ' SET TEMP1_NAO_USAR_ESTE_NOME = ' + qCampo);

        try
          ExecQuery;
          DTM1.IBTransaction1.CommitRetaining;
        except
          DTM1.IBTransaction1.RollbackRetaining;
          MessageBox(Application.Handle, 'Não foi possível gravar campo temporário', 'Erro', mb_ok + mb_iconerror);
          Abort;
        end;
      end;

      vString := 'alter table ' + qTabela + ' drop ' + qCampo;
      ExcluirCampoSePrecisar(qTabela, qCampo, vString);

      vString := 'ALTER TABLE ' + qTabela + ' ';
      vString := vString + 'ADD ' + qCampo + ' ' + qNovoTipo;
      if (vField_Type = 14) or (vField_Type = 37) then
         vString := vString + ' CHARACTER SET ISO8859_1 COLLATE PT_PT';
      CriarCampoSePrecisar(qTabela, qCampo, vString);

      with DTM1.IBSQLGenerico2, SQL do
      begin
        Close;
        Clear;
        Add('UPDATE ' + qTabela + ' SET ' + qCampo + ' = TEMP1_NAO_USAR_ESTE_NOME');

        try
          ExecQuery;
          DTM1.IBTransaction1.CommitRetaining;
        except
          DTM1.IBTransaction1.RollbackRetaining;
          MessageBox(Application.Handle, 'Não foi possível gravar o novo campo', 'Erro', mb_ok + mb_iconerror);
          Abort;
        end;
      end;

      vString := 'alter table ' + qTabela + ' drop TEMP1_NAO_USAR_ESTE_NOME';
      ExcluirCampoSePrecisar(qTabela, qCampo, vString);
   end;
end;

procedure MatarChaveSePrecisar(qChavePrimaria,qString:String);
var
   vPrecisaMatar : boolean;
begin

   //Verificando se existe:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add(' SELECT * FROM RDB$RELATION_CONSTRAINTS ');
      Add(' WHERE RDB$CONSTRAINT_NAME=:P1');
      ParamByName('P1').Value := qChavePrimaria;
      Open;
      if RecordCount = 1 then
         vPrecisaMatar := True
      else
         vPrecisaMatar := False;

      Close;
   end;

   if vPrecisaMatar = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add(qString);
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível excluir a chave primaria: ' + #13 +
                         qChavePrimaria);

         end;

{         if qString = 'ALTER TABLE OBS_CORPO_DESTA_NOTA drop constraint PK_OBS_CORPO_DESTA_NOTA' then
         begin
            SQL.Clear;
            SQL.Add('UPDATE OBS_CORPO_DESTA_NOTA SET ID_PEDIDO=N_NOTA_FISCAL');
            try
               Prepare;
               ExecQuery;
               DTM1.IBTransaction1.CommitRetaining;
            except
               DTM1.IBTransaction1.RollbackRetaining;
               ShowMessage('Não foi possível carregar ID_PEDIDO com N_NOTA_FISCAL ' + #13 +
                            'na tabela OBS_CORPO_DESTA_NOTA');

            end;
         end;}
      end;
   end;
end;

procedure TiraNotNullSePrecisar(qTabela, qCampo : String);
var
   vTabelaExiste, vPrecisaAlterar : Boolean;
begin
   //Primeira coisa a ser feita, é verificar se existe a tabela:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 0 then
      begin
         ShowMessage('Está faltando a tabela' + #13 + qTabela);
         vTabelaExiste := False;
         vPrecisaAlterar := False;
      end
      else
         vTabelaExiste := True;

      Close;
   end;

   //Agora verificando se existe o campo:
   if vTabelaExiste = True then
   begin
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT RDB$FIELD_NAME, RDB$FIELD_SOURCE, RDB$NULL_FLAG FROM RDB$RELATION_FIELDS ');
         Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
         Add(' and RDB$FIELD_NAME =:PCAMPO ');

         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         Open;
         if RecordCount = 0 then
         begin
            ShowMessage('Está faltando o campo: ' + qCampo + #13 + 'Da tabela: ' + qTabela);
            vPrecisaAlterar := False;
         end
         else
         begin
            //Por uma razão que não conheço, o campo RDB$NULL_FLAG não funciona corretamente
            if DTM1.IBQGenerica.FieldByName('RDB$NULL_FLAG').Value <> null then
               vPrecisaAlterar := True
            else
               vPrecisaAlterar := False;



         end;
//         Close;
      end;
   end;

   //Agora a exclusão do nulo propriamente dita:
   if vPrecisaAlterar = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;

         SQL.Add('update RDB$RELATION_FIELDS set ');
         SQL.Add('RDB$NULL_FLAG = NULL ');
         SQL.Add('where (RDB$FIELD_NAME =:PCAMPO) and ');
         SQL.Add('(RDB$RELATION_NAME =:PTABELA) ');
         ParamByName('PCAMPO').Value := qCampo;
         ParamByName('PTABELA').Value := qTabela;

         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível tirar o not null do campo: ' + #13 +
                         qCampo + #13 + #13 + 'Na tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
   DTM1.IBQGenerica.Close;
end;

procedure PassarCampoParaNotNullSePrecisar(qTabela, qCampo : String);
var
   vTabelaExiste, vPrecisaPassarParaNotNull : Boolean;
   vNomeDoCampo, vStringTemporaria : String;
begin
   //Primeira coisa a ser feita, é verificar se existe a tabela:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 0 then
      begin
         ShowMessage('Está faltando a tabela' + #13 + qTabela);
         vTabelaExiste := False;
         vPrecisaPassarParaNotNull := False;
      end
      else
         vTabelaExiste := True;

      Close;
   end;

   //Agora verificando se existe o campo:
   if vTabelaExiste = True then
   begin
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ');
         Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
         Add(' and RDB$FIELD_NAME =:PCAMPO ');
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         Open;
         if RecordCount <> 0 then
         begin
            vPrecisaPassarParaNotNull := True;
            vNomeDoCampo := DTM1.IBQGenerica.FieldByName('RDB$FIELD_NAME').Value;

            //Verificando se será possível passar para Not Null.
            //Inicialmente preciso criar a string temporária:
            vStringTemporaria := 'SELECT COUNT(*) FROM ' ;
            vStringTemporaria := vStringTemporaria + trim(qTabela) + ' WHERE ' + trim(qCampo) + ' IS NULL';
            with DTM1.IBQGenerica2, SQL do
            begin
               Close;
               Clear;
               Add(vStringTemporaria);
               Open;
               if Fields[0].AsInteger > 0 then
               begin
                  ShowMessage('O campo: ' + qCampo + #13 + ' da tabela: ' + qTabela + #13 +
                              'possui um ou mais registros nulos' + #13 + #13 +
                              'Não será possível passá-lo para Not Null' + #13 +
                              'Preencha todos pelo comando UpDate' + #13 +
                              'ou elimine esses registros' + #13 + #13 +
                              'A seguir execute esta rotina novamente');

                  vPrecisaPassarParaNotNull := False;
               end;
            end;
         end
         else
            vPrecisaPassarParaNotNull := False;

         Close;
      end;
   end;

   //Agora a inserção propriamente dita:
   if vPrecisaPassarParaNotNull = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         vStringTemporaria := 'update RDB$RELATION_FIELDS set ';
         vStringTemporaria := vStringTemporaria + ' RDB$NULL_FLAG = 1 ';
         //vStringTemporaria := vStringTemporaria + 'where (RDB$FIELD_NAME = ' + '"' + qCampo + '"' + ')' ;
//         vStringTemporaria := vStringTemporaria + 'where (RDB$FIELD_NAME = ' + '"' + trim(vNomeDoCampo) + '"' + ')' ;
//         vStringTemporaria := vStringTemporaria + ' and (RDB$RELATION_NAME = ' + '"' + qTabela + '"' + ')' ;
         vStringTemporaria := vStringTemporaria + 'where (RDB$FIELD_NAME =:P1)' ;
         vStringTemporaria := vStringTemporaria + ' and (RDB$RELATION_NAME =:P2)' ;
         SQL.Add(vStringTemporaria);
         ParamByName('P1').Value := qCampo;
         ParamByName('P2').Value := qTabela ;
//update RDB$RELATION_FIELDS set
//RDB$NULL_FLAG = 1
//where (RDB$FIELD_NAME = 'ID_PEDIDO') and
//(RDB$RELATION_NAME = 'OBS_CORPO_DESTA_NOTA')



         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível passar para Not Null o campo: ' + #13 +
                         qCampo + #13 + #13 + 'Na tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
end;

procedure PassarCampoParaNullSePrecisar(qTabela, qCampo : String);
var
   vTabelaExiste, vPrecisaPassarParaNull : Boolean;
   vNomeDoCampo, vStringTemporaria : String;
begin

//update RDB$RELATION_FIELDS set
//RDB$NULL_FLAG = NULL
//where (RDB$FIELD_NAME = 'ID_NOTA_FISCAL') and
//(RDB$RELATION_NAME = 'OBS_CORPO_DESTA_NOTA')

   //Observar que esta rotina tem a finalidade oposta ao Not Null
   //Esta rotina elimina o not null de determinado campos
   //Primeira coisa a ser feita, é verificar se existe a tabela:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 0 then
      begin
         ShowMessage('Está faltando a tabela' + #13 + qTabela);
         vTabelaExiste := False;
         vPrecisaPassarParaNull := False;
      end
      else
         vTabelaExiste := True;

      Close;
   end;

   //Agora verificando se existe o campo:
   if vTabelaExiste = True then
   begin
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ');
         Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
         Add(' and RDB$FIELD_NAME =:PCAMPO ');
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         Open;
         if RecordCount <> 0 then
         begin
            vPrecisaPassarParaNull := True;
            vNomeDoCampo := DTM1.IBQGenerica.FieldByName('RDB$FIELD_NAME').Value;

            {
            //Verificando se será possível passar para Null.
            //Inicialmente preciso criar a string temporária:
            vStringTemporaria := 'SELECT COUNT(*) FROM ' ;
            vStringTemporaria := vStringTemporaria + trim(qTabela) + ' WHERE ' + trim(qCampo) + ' IS NULL';
            with DTM1.IBQGenerica2, SQL do
            begin
               Close;
               Clear;
               Add(vStringTemporaria);
               Open;
               if Fields[0].AsInteger > 0 then
               begin
                  ShowMessage('O campo: ' + qCampo + #13 + ' da tabela: ' + qTabela + #13 +
                              'possui um ou mais registros nulos' + #13 + #13 +
                              'Não será possível passá-lo para Not Null' + #13 +
                              'Preencha todos pelo comando UpDate' + #13 +
                              'ou elimine esses registros' + #13 + #13 +
                              'A seguir execute esta rotina novamente');

                  vPrecisaPassarParaNull := False;
               end;
            end;
            }
         end
         else
            vPrecisaPassarParaNull := False;

         Close;
      end;
   end;

   //Agora a inserção propriamente dita:
   if vPrecisaPassarParaNull = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add('update RDB$RELATION_FIELDS set ');
         SQL.Add(' RDB$NULL_FLAG = NULL ');
         //vStringTemporaria := vStringTemporaria + 'where (RDB$FIELD_NAME = ' + '"' + qCampo + '"' + ')' ;
//         vStringTemporaria := vStringTemporaria + 'where (RDB$FIELD_NAME = ' + '"' + trim(vNomeDoCampo) + '"' + ')' ;
//         vStringTemporaria := vStringTemporaria + ' and (RDB$RELATION_NAME = ' + '"' + qTabela + '"' + ')' ;
         SQL.Add('where (RDB$FIELD_NAME=:P1)') ;
         SQL.Add(' and (RDB$RELATION_NAME=:P2)') ;
         ParamByName('P1').Value := qCampo;
         ParamByName('P2').Value := qTabela ;

         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível passar para Null o campo: ' + #13 +
                         qCampo + #13 + #13 + 'Na tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
end;

procedure AlterarTamanhoSePrecisar(qTabela, qCampo : String; qNovoTamanho:Integer);
var
   vTabelaExiste, vPrecisaAlterar : Boolean;
begin
   //Primeira coisa a ser feita, é verificar se existe a tabela:
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 0 then
      begin
         ShowMessage('Está faltando a tabela' + #13 + qTabela);
         vTabelaExiste := False;
         vPrecisaAlterar := False;
      end
      else
         vTabelaExiste := True;

      Close;
   end;

   //Agora verificando se existe o campo:
   if vTabelaExiste = True then
   begin
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add(' SELECT RDB$FIELD_NAME, RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS ');
         Add(' WHERE RDB$RELATION_NAME=:PTABELA ');
         Add(' and RDB$FIELD_NAME =:PCAMPO ');
         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         Open;
         if RecordCount = 0 then
         begin
            ShowMessage('Está faltando o campo: ' + qCampo + #13 + 'Da tabela: ' + qTabela);
            vPrecisaAlterar := False;
         end
         else
            vPrecisaAlterar := True;

//         Close;
      end;
   end;

   //Conferindo se o tamanho já está correto:
   if vPrecisaAlterar = True then
   begin
      with DTM1.IBQGenerica2, SQL do
      begin
         Close;
         Clear;
         Add('SELECT * FROM RDB$FIELDS ');
         Add('WHERE RDB$FIELD_NAME=:PSOURCE ');
         ParamByName('PSOURCE').Value := DTM1.IBQGenerica.FieldByName('RDB$FIELD_SOURCE').Value;
         Open;
         if recordcount = 0 then
            ShowMessage('Inconsistência 6RTRTT');

         if (DTM1.IBQGenerica2.FieldByName('RDB$FIELD_LENGTH').AsInteger = qNovoTamanho) and (DTM1.IBQGenerica2.FieldByName('RDB$CHARACTER_LENGTH').AsInteger = qNovoTamanho) then
            vPrecisaAlterar := False ;

         DTM1.IBQGenerica2.Close;
      end;
   end;

   //Agora a inserção propriamente dita:
   if vPrecisaAlterar = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      //Observando que por enquanto esta função serve apenas para campos alfanuméricos temos:
      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add('UPDATE RDB$FIELDS SET RDB$FIELD_LENGTH =:PTAMANHO, ');
         SQL.Add('RDB$CHARACTER_LENGTH=:PTAMANHO, RDB$COLLATION_ID=15 ');
         SQL.Add('WHERE RDB$FIELD_NAME=:PSOURCE ');
         ParamByName('PTAMANHO').Value := qNovoTamanho;
         ParamByName('PSOURCE').Value := DTM1.IBQGenerica.FieldByName('RDB$FIELD_SOURCE').Value;
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível alterar tamanho do campo: ' + #13 +
                         qCampo + #13 + #13 + 'Na tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
   DTM1.IBQGenerica.Close;
end;

procedure PassarCampoParaNumericSePrecisar(qTabela, qCampo:String; qFIELD_TYPE, qFIELD_SUBTYPE, qfIELD_LENGTH, qCHARACTER_LENGTH, qFIELD_SCALE, qFIELD_PRECISION : Integer);
var
   vPrecisa:Boolean;
begin
   //Em primeiro lugar, preciso verificar se o tamanho e a escala já está certo:
   //Lembrando que tamanho fica armazenado em RDB$FIELD_PRECISION
   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$FIELD_TYPE, RDB$FIELD_PRECISION, RDB$FIELD_SCALE, ');
      Add('RDB$FIELD_LENGTH, RDB$CHARACTER_LENGTH FROM RDB$FIELDS ');
      Add('WHERE RDB$FIELD_NAME= ');
      Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
      Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');
      ParamByName('PTABELA').Value := qTabela;
      ParamByName('PCAMPO').Value := qCampo;
      Open;

      if (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> 7) and
         (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> 8) and
         (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> 16) then
      begin
         //Obs importante: Para esta função eu testei apenas com o tipo 7 que é o integer, passando para numérico
         ShowMessage('Sistema não está preparado ' + #13 +
                     'para ajustar escala nesse tipo de campo' + #13 +
                     'Bloqueio 6TIXO5XPO');
         Abort;
      end;

//      Add('SELECT RDB$FIELD_TYPE, RDB$FIELD_PRECISION, RDB$FIELD_SCALE, ');
//      Add('RDB$FIELD_LENGTH, RDB$CHARACTER_LENGTH FROM RDB$FIELDS ');
//      qFIELD_TYPE, qfIELD_LENGTH, qCHARACTER_LENGTH, qFIELD_SCALE, qFIELD_PRECISION : Integer);

      if (DTM1.IBQGenerica.FieldByName('RDB$FIELD_TYPE').AsInteger <> qFIELD_TYPE) or
         (DTM1.IBQGenerica.FieldByName('RDB$FIELD_LENGTH').AsInteger <> qfIELD_LENGTH) or
         (DTM1.IBQGenerica.FieldByName('RDB$CHARACTER_LENGTH').AsInteger <> qCHARACTER_LENGTH) or
         (DTM1.IBQGenerica.FieldByName('RDB$FIELD_PRECISION').AsInteger <> qFIELD_PRECISION) or
         (DTM1.IBQGenerica.FieldByName('RDB$FIELD_SCALE').AsInteger <> qFIELD_SCALE ) then

         vPrecisa := True
      else
         vPrecisa := False;


      DTM1.IBQGenerica.Close;
   end;

   if vPrecisa = True then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;


      with DTM1.IBSQLGenerico do
      begin
         SQL.Clear;
         SQL.Add('UPDATE RDB$FIELDS ' );
         SQL.Add('SET RDB$FIELD_TYPE=:qFIELD_TYPE, ');
         SQL.Add(' RDB$FIELD_SUB_TYPE=:qFIELD_SUBTYPE, ');
         SQL.Add(' RDB$FIELD_LENGTH=:qfIELD_LENGTH, ');
         SQL.Add(' RDB$CHARACTER_LENGTH=:qCHARACTER_LENGTH, ');
         SQL.Add(' RDB$FIELD_PRECISION=:qFIELD_PRECISION, ' );
         SQL.Add(' RDB$FIELD_SCALE=:qFIELD_SCALE ');


         SQL.Add('WHERE RDB$FIELD_NAME = ');
         SQL.Add(' (SELECT RDB$FIELD_SOURCE FROM RDB$RELATION_FIELDS');
         SQL.Add('      WHERE RDB$RELATION_NAME=:PTABELA AND RDB$FIELD_NAME=:PCAMPO ) ');

         ParamByName('qFIELD_TYPE').Value := qFIELD_TYPE;
         ParamByName('qFIELD_SUBTYPE').Value := qFIELD_SUBTYPE;   //Lembrando que SubType 0 = NotNull e SubType 1 não é not null
         ParamByName('qfIELD_LENGTH').Value := qfIELD_LENGTH;

         if qCHARACTER_LENGTH <> 0 then
            ParamByName('qCHARACTER_LENGTH').Value := qCHARACTER_LENGTH
         else
            ParamByName('qCHARACTER_LENGTH').Value := null;

         ParamByName('qFIELD_PRECISION').Value := qFIELD_PRECISION;
         ParamByName('qFIELD_SCALE').Value := qFIELD_SCALE ;

         ParamByName('PTABELA').Value := qTabela;
         ParamByName('PCAMPO').Value := qCampo;
         try
            Prepare;
            ExecQuery;
            DTM1.IBTransaction1.CommitRetaining;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Não foi possível concluír');
            Abort;
         end;
      end;

   end;
end;

function NivelDestaConta(qCodigoEstruturado:String):String;
var
   x,vQuantosPontos : Integer;
begin
   x:=1;
   vQuantosPontos := 0;
   while x<=length(qCodigoEstruturado) do
   begin
      if copy(qCodigoEstruturado,x,1) = '.' then
         vQuantosPontos := vQuantosPontos + 1;

      x:=x+1;
   end;

  Result := IntToStr(vQuantosPontos + 1);
end;

function QueFoiDigitadoEUmNumero(qFoiDigitado:String) : Boolean;
var
   vNumero : Real;
begin
   try
      vNumero := StrToFloat(qFoiDigitado);
      Result := True;
   except
      ShowMessage('Valor inválido');
      Result := False;
   end;
end;

function QueFoiDigitadoEUmNumeroSemMsg(qFoiDigitado:String) : Boolean;
var
   vNumero : Real;
begin
   if trim(qFoiDigitado) = '' then
      Result := False
   else
   begin
      try
         vNumero := StrToFloat(qFoiDigitado);
         Result := True;
      except
         Result := False;
      end;
   end;
end;

function QueFoiDigitadoEUmInteiro(qFoiDigitado:String) : Boolean;
var
   vSemEspacos : String;
   vNumero, vContador : Integer;
begin
   Result := True;
   vSemEspacos := trim(qFoiDigitado);
   if length(vSemEspacos) = 0 then
      Result := False;

   if Result = true then
   begin
      vContador := 1;
      while vContador <= length(vSemEspacos) do
      begin
         if (copy(vSemEspacos,vContador,1) <> '0') and
            (copy(vSemEspacos,vContador,1) <> '1') and
            (copy(vSemEspacos,vContador,1) <> '2') and
            (copy(vSemEspacos,vContador,1) <> '3') and
            (copy(vSemEspacos,vContador,1) <> '4') and
            (copy(vSemEspacos,vContador,1) <> '5') and
            (copy(vSemEspacos,vContador,1) <> '6') and
            (copy(vSemEspacos,vContador,1) <> '7') and
            (copy(vSemEspacos,vContador,1) <> '8') and
            (copy(vSemEspacos,vContador,1) <> '9') then
         begin
            Result := False;
            Break;
         end;
         vContador := vcontador + 1;
      end;
   end;

   if Result = true then
   begin
      try
         vNumero := StrToInt(qFoiDigitado);
      except
         Result := False;
      end;
   end;
end;

function SemAcentosNemCedilhas(qString:String):String;
var
   x:Integer;
   qChegou : String;
begin
   qChegou := qString;
   x:=1;
   while x <= length(qString) do
   begin
//      if qString = 'V lvula de Reten‡Æo Duo"Check F§F§    2«"' then
//         ShowMessage('Paradinha');

//Inicio dos novos que inseri
{
      if copy(qString,x,1) = '' then
         qString := copy(qString,1,x-1) + 'Ø' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '«' then
         qString := copy(qString,1,x-1) + ' 1/2 ' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ó' then
         qString := copy(qString,1,x-1) + ' 3/4 ' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '¬' then
         qString := copy(qString,1,x-1) + '1" e 1/4' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '¡' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '“' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);
}


{
      if copy(qString,x,1) = '§' then
         qString := copy(qString,1,x-1) + 'º' + copy(qString,x+1,length(qString)-x);

     if copy(qString,x,1) = '€' then
         qString := copy(qString,1,x-1) + 'ç' + copy(qString,x+1,length(qString)-x);

     if copy(qString,x,1) = 'Ç' then
         qString := copy(qString,1,x-1) + 'Ã' + copy(qString,x+1,length(qString)-x);

     if copy(qString,x,1) = 'ç' then
         qString := copy(qString,1,x-1) + 'Ç' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '‡' then
         qString := copy(qString,1,x-1) + 'ç' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '¢' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Æ' then
         qString := copy(qString,1,x-1) + 'ã' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '^' then
         qString := copy(qString,1,x-1) + 'ê' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'à' then
         qString := copy(qString,1,x-1) + 'Ó' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'å' then
         qString := copy(qString,1,x-1) + 'Õ' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ˆ' then
         qString := copy(qString,1,x-1) + 'ê' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '‚' then
         qString := copy(qString,1,x-1) + 'é' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '…' then
         qString := copy(qString,1,x-1) + 'à' + copy(qString,x+1,length(qString)-x);

      //Esse de baixo tenho grandes suspeitas
      if copy(qString,x,1) = ' ' then
         qString := copy(qString,1,x-1) + 'á' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '' then
         qString := copy(qString,1,x-1) + 'É' + copy(qString,x+1,length(qString)-x);
}

      if copy(qString,x,1) = 'ç' then
         qString := copy(qString,1,x-1) + 'c' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ç' then
         qString := copy(qString,1,x-1) + 'C' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'á' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Á' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'à' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'À' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ã' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ã' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'â' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Â' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = 'é' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'É' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'è' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'È' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ê' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ê' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = 'í' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Í' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ì' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ì' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'î' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Î' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = 'ó' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ó' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ò' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ò' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'õ' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Õ' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ô' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ô' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = 'ú' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ú' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ù' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ù' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'û' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Û' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);


//Tremas

      if copy(qString,x,1) = 'ä' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ä' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ë' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ë' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ï' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ï' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ö' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ö' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ü' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ü' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '&' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      x:= x + 1;
   end;

   Result := qString;
end;

function BuscaTroca(Text,Busca,Troca : string) : string;
{ Substitui um caractere dentro da string}
var
  n: integer;
begin
  for n := 1 to length(Text) do
  begin
    if Copy(Text,n,1) = Busca then
    begin
       Delete(Text,n,1);
       Insert(Troca,Text,n);
    end;
  end;
  Result := Text;
end;

function SemAcentosNemCedilha(qString:String):String;
var
   x:Integer;
   qChegou : String;
begin
   qChegou := qString;
   x:=1;
   while x <= length(qString) do
   begin

//Inicio dos novos que inseri

      if copy(qString,x,1) = 'µ' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'à' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Æ' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '' then
         qString := copy(qString,1,x-1) + 'Ø' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '«' then
         qString := copy(qString,1,x-1) + ' 1/2 ' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ó' then
         qString := copy(qString,1,x-1) + ' 3/4 ' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '¬' then
         qString := copy(qString,1,x-1) + '1" e 1/4' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '¡' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '“' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);


//Final dos novos que inseri

      if copy(qString,x,1) = '§' then
         qString := copy(qString,1,x-1) + 'º' + copy(qString,x+1,length(qString)-x);

     if copy(qString,x,1) = '€' then
         qString := copy(qString,1,x-1) + 'ç' + copy(qString,x+1,length(qString)-x);

     if copy(qString,x,1) = 'Ç' then
         qString := copy(qString,1,x-1) + 'Ã' + copy(qString,x+1,length(qString)-x);

     if copy(qString,x,1) = 'ç' then
         qString := copy(qString,1,x-1) + 'Ç' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '‡' then
         qString := copy(qString,1,x-1) + 'ç' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '¢' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Æ' then
//         qString := copy(qString,1,x-1) + 'ã' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '^' then
         qString := copy(qString,1,x-1) + 'ê' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'à' then
         qString := copy(qString,1,x-1) + 'Ó' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'å' then
         qString := copy(qString,1,x-1) + 'Õ' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ˆ' then
         qString := copy(qString,1,x-1) + 'ê' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '‚' then
         qString := copy(qString,1,x-1) + 'é' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '…' then
         qString := copy(qString,1,x-1) + 'à' + copy(qString,x+1,length(qString)-x);

      //Esse de baixo tenho grandes suspeitas
      if copy(qString,x,1) = ' ' then
         qString := copy(qString,1,x-1) + 'á' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '' then
         qString := copy(qString,1,x-1) + 'É' + copy(qString,x+1,length(qString)-x);


//      if copy(qString,x,1) = 'ç' then
//         qString := copy(qString,1,x-1) + 'c' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ç' then
//         qString := copy(qString,1,x-1) + 'C' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'á' then
//         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Á' then
//         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'à' then
//         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'À' then
//         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'ã' then
//         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ã' then
//         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'â' then
//         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Â' then
//         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);


//      if copy(qString,x,1) = 'é' then
//         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'É' then
//         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'è' then
//         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'È' then
//         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'ê' then
//         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ê' then
//         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);


//      if copy(qString,x,1) = 'í' then
//         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Í' then
//         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'ì' then
//         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ì' then
//         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'î' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Î' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);


//      if copy(qString,x,1) = 'ó' then
 //        qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ó' then
//         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'ò' then
//         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ò' then
//         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'õ' then
//         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Õ' then
//         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'ô' then
//         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ô' then
//         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);


//      if copy(qString,x,1) = 'ú' then
//         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ú' then
//         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'ù' then
//         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ù' then
//         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'û' then
//         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Û' then
//         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);


//Tremas

      if copy(qString,x,1) = 'ä' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ä' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ë' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ë' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ï' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ï' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ö' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ö' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'ü' then
//         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = 'Ü' then
//         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

//      if copy(qString,x,1) = '&' then
//         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      x:= x + 1;
   end;

   Result := qString;
end;

function StringSemPontoEVirgula(qString:String):String;
var
   vPonteiro:Integer;
   vPalavra : String;
begin
   //Esta função existe para permitir gerar arquivos TXT separados por ;
   vPonteiro := 0;
   vPalavra := '';
   while vPonteiro < length(qString) do
   begin
      vPonteiro := vPonteiro + 1;
      if (copy(qString,vPonteiro,1) <> ';') then
         vPalavra := vPalavra + copy(qString,vPonteiro,1);
   end;

   Result := vPalavra;
end;

procedure ImprimirCupomFiscal(qPedido:Integer);
var
   vQualPedidoEmString,qRazaoSocial,qPessoaContato,q_CNPJ_Insc_CPF_RG, vCNPJ_CPF, vEndereco,
   vCEPCliente : String;
   vQualPedido : Integer;
//   vPodeImprimir : Boolean;
   vQtdeReal : Extended;
   vQtdeInt : Integer;

   //Variáveis para a função de impressão de ítens
   cCodigo, cDescricao, cAliquota, cTipoQtde, cQtde, cValor, cTipoDesconto, cValorDesc, cUnidade : String;
   vFormaPagamento, vMensagemPromocional, sAcreDesc : String;
   iCasasDecimais : Integer;
   iControle, xxx : Integer;
   iACK, iST1, iST2: Integer; // Variáveis com o retorno do Status da Impressora

   sCodigo, sDescricao, sAliquota, sTipoQtde, sQtde, sValor, sTipo, sDesconto : string;
   sForma, sMensagem, sConfirma, vDescricaoFormaPagamento, vAliquotasDaImpressoraFiscal: string;
   bRetornoEstendido: boolean;
   vValorTeraQueSerPago, vDesconto : Real;
   v_TempCNPJ_CPF, vDescrFormaPgto : string;
begin
//   showmessage('entrou na rotina de imprimir cupom');
   vQualPedidoEmString := IntToStr(qPedido);

   if frmLogin.vApenasFrenteDeLoja = false then
   begin
      if InputQuery('Seleção do boleto','Número do boleto',vQualPedidoEmString) = False then
         Abort;
   end;

   try
      vQualPedido := StrToInt(vQualPedidoEmString);
   except
      ShowMessage('Número de boleto inválido');
      Abort;
   end;

   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM PEDIDOS WHERE ID_PEDIDO=:PPEDIDO');
      ParamByName('PPEDIDO').Value := vQualPedido;
      Open;
      if RecordCount = 0 then
      begin
         ShowMessage('Boleto não localizado');
         Abort;
      end;

      //if DTM1.IBQGenerica.FieldByName('IMPRIMIU_CF').AsString = 'S' then
      //begin
      //   ShowMessage('Este cupom fiscal já foi impresso' + #13 +
      //               'Operação não será realizada');
      //   Abort;
      //end;

      vDescricaoFormaPagamento := DTM1.IBQGenerica.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;
      if FormaDePagamento_Esta_Em_Parametros(vDescricaoFormaPagamento) = false then
      begin
         //Alexandre pediu para retirar o aviso em 19/09/2009 (Para a Syto e para todos os outros clientes)
         //ShowMessage('Mensagem TRR78: ' + #13 + 'Forma de pagamento não está cadastrada na impressora fiscal e/ou no parâmetro 86');
         vDescricaoFormaPagamento := 'Dinheiro';
         //if FormaDePagamento_Esta_Em_Parametros(vDescricaoFormaPagamento) = true then
         //   ShowMessage('Será adotado pagamento em dinheiro')
         //else
         //   Abort;

      end;

      vDesconto := DTM1.IBQGenerica.FieldByName('DESCONTO').AsFloat;
   end;

   if TodosOsItensIraoPermitirImpressaoDeCupomFiscal(vQualPedido,'Pedidos') = false then
      Abort;

   //Descobrindo dados do cliente:
   with DTM1.IBQGenerica2, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RAZAO_SOCIAL, PESSOA_P_CONTATO, CNPJ, CPF, INSC_ESTADUAL, ');
      Add('END_LOGRADOURO, END_NUMERO, END_ANDAR, END_COMPLEMENTO, ');
      Add('END_BAIRRO, END_CIDADE, END_CEP, END_UF ');
      Add('FROM CLIENTES WHERE ID_CLIENTE=:P1');
      ParamByName('P1').Value := DTM1.IBQGenerica.FieldByName('ID_CLIENTE').AsInteger;
      Open;
      qPessoaContato := '';
      q_CNPJ_Insc_CPF_RG := '';
      vEndereco := '';
      vCNPJ_CPF := '';
      qRazaoSocial := '';
      if recordcount <> 0 then
      begin
         qRazaoSocial := trim(SemAcentosNemCedilhas(FieldByName('RAZAO_SOCIAL').AsString));
         qPessoaContato := FieldByName('PESSOA_P_CONTATO').AsString;
         q_CNPJ_Insc_CPF_RG := FieldByName('INSC_ESTADUAL').AsString;
         //Por enquanto não estou imprimindo o CNPJ na Impressora Fiscal
         if trim(DTM1.IBQGenerica2.FieldByName('CPF').AsString) <> '' then
            vCNPJ_CPF := ' ' + DTM1.IBQGenerica2.FieldByName('CPF').AsString
         else
            vCNPJ_CPF := ' ' + DTM1.IBQGenerica2.FieldByName('CNPJ').AsString;


         vEndereco := frmLogin.EnderecoMontadoComSetentaENoveCaracteres(
                          DTM1.IBQGenerica2.FieldByName('END_LOGRADOURO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_NUMERO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_ANDAR').AsInteger,
                          DTM1.IBQGenerica2.FieldByName('END_COMPLEMENTO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_BAIRRO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_CIDADE').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_CEP').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_UF').AsString
                                                              );

         vEndereco := trim(SemAcentosNemCedilhas(vEndereco));
         vCEPCliente := DTM1.IBQGenerica2.FieldByName('END_CEP').AsString;
      end;
      DTM1.IBQGenerica2.Close;
   end;
   vCNPJ_CPF := trim(copy(vCNPJ_CPF,1,29));
   qRazaoSocial := copy(qRazaoSocial,1,30);
   qRazaoSocial := trim(qRazaoSocial);
   vEndereco := copy(vEndereco,1,79);

   vCNPJ_CPF := SemPontosNemTracinhos(vCNPJ_CPF);
   vCNPJ_CPF := trim(vCNPJ_CPF);
   if (vCNPJ_CPF <> '') and (VerificaCnpjCpf(vCNPJ_CPF) = false) then
   begin
      ShowMessage('CNPJ / CPF cadastrado para esse cliente é inválido : ' + vCNPJ_CPF + #13 +
                  'CNPJ / CPF Não será impresso');
      vCNPJ_CPF := '';
   end;

   // Luciano 10/02/2011
   // Melhoria para todos!
   while 1=1 do
   begin
     v_TempCNPJ_CPF := vCNPJ_CPF;
     v_TempCNPJ_CPF := InputBox('NF Paulistana','CNPJ ou CPF',v_TempCNPJ_CPF);
     v_TempCNPJ_CPF := trim(v_TempCNPJ_CPF);
     v_TempCNPJ_CPF := SemPontosNemTracinhos(v_TempCNPJ_CPF);

     if v_TempCNPJ_CPF = '' then
       break;

     if VerificaCnpjCpf(v_TempCNPJ_CPF) = true then
     begin
       if qRazaoSocial = '' then
          qRazaoSocial := InputBox('NF Paulistana',
                                   'Razão social',
                                   trim(SemAcentosNemCedilhas(qRazaoSocial))
                                   );
          Break;
     end
     else
        ShowMessage('CNPJ ou CPF inválido' + #13 + 'Obs: Permitido deixar em branco');
   end;

   vCNPJ_CPF := v_TempCNPJ_CPF;

   //if (frmLogin.vApenasFrenteDeLoja = true) and (trim(vCNPJ_CPF) = '') then
   //begin
   //   while 1=1 do
   //   begin
   //      vCNPJ_CPF := InputBox('NF Paulistana','CNPJ ou CPF','');
   //      vCNPJ_CPF := trim(vCNPJ_CPF);
   //
   //      if vCNPJ_CPF = '' then
   //         break;
   //
   //      vCNPJ_CPF := copy(vCNPJ_CPF,1,29);
   //      vCNPJ_CPF := SemPontosNemTracinhos(vCNPJ_CPF);
   //      if VerificaCnpjCpf(vCNPJ_CPF) = true then
   //      begin
   //         if qRazaoSocial = '' then
   //            qRazaoSocial := InputBox('NF Paulistana','Razão social','');
   //
   //         Break;
   //      end
   //      else
   //         ShowMessage('CNPJ ou CPF inválido' + #13 + 'Obs: Permitido deixar em branco');
   //   end;
   //end;

   {
   if (frmLogin.pUtilizaEmissoraCupomFiscal = 'S') or
      (frmLogin.pUtilizaEmissoraCupomFiscal = 'S|BEMATECH') then
      iRetorno := Bematech_FI_AbreCupom( Pchar( vCNPJ_CPF ) )
   else if frmLogin.pUtilizaEmissoraCupomFiscal = 'S|BEMATECH TERMICA' then
      iRetorno := Bematech_FI_AbreCupomMFD( Pchar( vCNPJ_CPF ), Pchar( qRazaoSocial ), Pchar( vEndereco ))
   else
   begin
      ShowMessage('Mensagem ZZS49' + #13 + 'Parâmetro 86 preenchido incorretamente');
      iRetorno := Bematech_FI_AbreCupom( Pchar( vCNPJ_CPF ) );
   end;
   }

//   showmessage('vai abrir cupom');
   if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,9) = 'BEMATECH|' then
      iRetorno := Bematech_FI_AbreCupom( Pchar( vCNPJ_CPF ) )
   else if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,17) = 'BEMATECH TERMICA|' then
      iRetorno := Bematech_FI_AbreCupomMFD( Pchar( vCNPJ_CPF ), Pchar( qRazaoSocial ), Pchar( vEndereco ))
   else if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,6) = 'ELGIN|' then
   begin
      // Elcio - 11/08/2009 - comentei aqui
      if TrataErro(AbreCupomMFD(vCNPJ_CPF, qRazaoSocial, vEndereco)) = False then
      begin
         ShowMessage('Não foi possível abrir o cupom fiscal');
         Abort;
      end;
   end
   else
   if copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
      iRetorno := Daruma_FI_AbreCupom(PChar(vCNPJ_CPF))
   else
   begin
      ShowMessage('Mensagem ZZS49' + #13 + 'Parâmetro 86 preenchido incorretamente' + #13 + 'Vai ser assumida BEMATECH');
      iRetorno := Bematech_FI_AbreCupom( Pchar( vCNPJ_CPF ) );
   end;

   //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
   if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,8) = 'BEMATECH' then
   begin
      if iRetorno <> 1 then
         ShowMessage('iRetorno: ' + IntToStr(iRetorno));
      Analisa_iRetorno(iRetorno);
      Retorno_Impressora();

      if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
      begin
         ShowMessage('Mensagem XXS49' + #13 + 'Não foi possível completar a operação: ' + InttoStr(iretorno));
         Abort;
      end;
   end;

//   showmessage('abriu o cupom');
   vValorTeraQueSerPago := 0;
   with DTM1.IBQGenerica5, SQL do
   begin
      Close;
      Clear;
      Add('SELECT PI.ID_PEDIDO, PI.ID_PEDIDO_ITEM, PI.ID_PRODUTO, PI.DESCRICAO_PRODUTO, ');
      Add('PI.ID_PRODUTO_GRADE, PI.DESCRICAO_GRADE, ');
      Add('PI.QUANTIDADE, PI.VALOR_UNITARIO, PI.VALOR_UNITARIO_PREVISTO,  PI.VALOR_TOTAL, PI.VALOR_TOTAL_PREVISTO, ');
      Add('PI.VALOR_TOTAL_PREVISTO - PI.VALOR_TOTAL AS DESCONTO, ');
      Add('PI.PERCENTUAL_DE_COMISSAO, PI.VALOR_CUSTO_TOTAL, P.DESCRICAO, P.UNIDADE, P.CODIGO, P.ALIQUOTA_ICMS ');

      Add(' FROM PEDIDOS_ITENS PI ');

      Add('LEFT OUTER JOIN PRODUTOS P ON P.ID_PRODUTO = PI.ID_PRODUTO ');

      Add('WHERE ');
      Add('ID_PEDIDO=:P_ID_PEDIDO ');
      ParamByName('P_ID_PEDIDO').Value := vQualPedido;
      Open;
   end;

//   showmessage('vai imprimir os itens');
//   DTM1.IBQGenerica5.First;
   while not DTM1.IBQGenerica5.Eof do
   begin
      // Exemplo em Delphi   (Do Help Bematech)
      //cCodigo        := '123';
      //cDescricao     := 'Caneta';
      //cAliquota      := '1200';
      //cTipoQtde      := 'I';
      //cQtde          := '10';
      //iCasasDecimais := 2;
      //cValor         := '0,25';
      //cTipoDesconto  := '%';
      //cValorDesc     := '0000';
//      vPodeImprimir := True;
      //with DTM1.IBQGenerica, SQL do
      //begin
      //   Close;
      //   Clear;
      //   Add('SELECT CODIGO, ALIQUOTA_ICMS ');
      //   Add('FROM PRODUTOS WHERE ID_PRODUTO=:P1');
      //   ParamByName('P1').Value := DTM1.IBQGenerica5.FieldByName('ID_PRODUTO').AsInteger;
      //   Open;
      //   if RecordCount = 0 then
      //   begin
      //      ShowMessage('Inconsistência TXA64: ' + #13 + 'Produto não localizado');
      //      vPodeImprimir := False;
      //   end;
      //end;
      //cCodigo := copy(trim(DTM1.IBQGenerica5.FieldByName('CODIGO').AsString),1,49);
      if frmLogin.pImprimirUnidadeNoCupomFiscal = 'N' then
         cCodigo := trim(copy(DTM1.IBQGenerica5.FieldByName('CODIGO').AsString,1,13))
      else
         cCodigo := trim(copy(DTM1.IBQGenerica5.FieldByName('CODIGO').AsString,1,49));

      if cCodigo = '' then
         cCodigo := '-';

      if frmLogin.pImprimirUnidadeNoCupomFiscal = 'N' then
         cDescricao := copy(trim(DTM1.IBQGenerica5.FieldByName('DESCRICAO').AsString),1,29)
      else
         cDescricao := copy(trim(DTM1.IBQGenerica5.FieldByName('DESCRICAO').AsString),1,201);

      if cDescricao = '' then cDescricao := '-';

      cAliquota := trim(FloatToStr(DTM1.IBQGenerica5.FieldByName('ALIQUOTA_ICMS').AsFloat * 100));

      if length(cAliquota) > 4 then
      begin
         ShowMessage('Inconsistência TRX45A3: ' + #13 + 'alíquota do ICMS não pode ser maior que 99');
//         vPodeImprimir := False;
      end
      else if length(cAliquota) = 4 then
         cAliquota := cAliquota
      else if length(cAliquota) = 3 then
         cAliquota := '0' + cAliquota
      else if length(cAliquota) = 2 then
         cAliquota := '00' + cAliquota
      else if length(cAliquota) = 1 then
         cAliquota := '000' + cAliquota
      else
         cAliquota := 'II';

      if cAliquota = '0000' then
         cAliquota := 'II';  // Para forçar a alíquota isenta

      if (cAliquota = '9999') or (cAliquota = '9900') then
         cAliquota := 'FF';  //FF é um código interpretado pela Bematech como Substituição tributária

      if (cAliquota = '8888') or (cAliquota = '8800') then
         cAliquota := 'NN';  //FF é um código interpretado pela Bematech como não incidência

      if (cAliquota <> 'II') and (cAliquota <> 'FF') and (cAliquota <> 'NN') then
      begin
         cAliquota := copy(cAliquota,1,2) + ',' + copy(cAliquota,3,2);
         if Aliquota_Esta_Em_Parametros(cAliquota) = false then
         begin
            xxx := 1;
            vAliquotasDaImpressoraFiscal := '';
            while xxx < 21 do
            begin
               if frmLogin.m_AliquotasICMS_Imp_Fiscal[xxx] <> '' then
                  vAliquotasDaImpressoraFiscal := vAliquotasDaImpressoraFiscal +
                                                  copy(frmLogin.m_AliquotasICMS_Imp_Fiscal[xxx],1,2) + ',' +
                                                  copy(frmLogin.m_AliquotasICMS_Imp_Fiscal[xxx],3,2) + '   ';

               xxx := xxx + 1;
            end;
            ShowMessage('Alíquota do ICMS não registrada no parâmetro 86' + #13 +
             'Produto: ' + IntToStr(DTM1.IBQGenerica5.FieldByName('ID_PRODUTO').AsInteger) + #13 +
             'Será adotada alíquota isenta' + #13 +
             'Se nescessário, cancele o cupom, corrija a alíquota imprima o cupom fiscal novamente '+ #13 + #13 +
             'Alíquota deste ítem: ' + cAliquota + #13 + #13 +
             'Alíquotas registradas no parâmetro 86: ' + vAliquotasDaImpressoraFiscal) ;

            cAliquota := 'II';
         end;
      end;

      if DTM1.IBQGenerica5.FieldByName('QUANTIDADE').AsFloat = 0 then
      begin
         ShowMessage('Inconsistência TEX242: ' + #13 + 'Quantidade inválida');
//         vPodeImprimir := False;
      end ;

      //Decidi que por enquanto, a quantidade será sempre fracionária
      cTipoQtde := 'F';

      vQtdeReal := DTM1.IBQGenerica5.FieldByName('QUANTIDADE').AsFloat * 1000;
      vQtdeInt := Trunc(vQtdeReal);
      cQtde := trim(IntToStr(vQtdeInt));

      if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,5) = 'ELGIN' then
         cQtde := copy(cQtde,1,length(cQtde)-3) + ',' + copy(cQtde,length(cQtde)-2,3);

//      ShowMessage(cQtde);

      if length(cQtde) > 7 then
      begin
         ShowMessage('Quantidade inválida' + #13 + 'Máximo permitido: 9999,999' + 'Sistema irá adotar Qtde=1');
         cQtde := '1000';
      end;

      iCasasDecimais := 2;  //Me parece que casas decimais se refere sempre a valores, e não a quantidade

      cUnidade := copy(DTM1.IBQGenerica5.FieldByName('UNIDADE').AsString,1,2);
      if cUnidade = '' then
         cUnidade := '-';

      if DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat = 0 then
      begin
         ShowMessage('Inconsistência TXD64A: ' + #13 + 'Valor unitário inválido');
      end

      else if DTM1.IBQGenerica5.FieldByName('QUANTIDADE').AsFloat < 0 then
      begin
//         showmessage('vai cancelar o item anterior');
         //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
         if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,8) = 'BEMATECH' then
            iRetorno := Bematech_FI_CancelaItemAnterior()
         else
         if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,6) = 'DARUMA' then
            iRetorno := Daruma_FI_CancelaItemAnterior()
         else
         begin
            // Elcio - 11/08/2009 - comentei aqui
            if TrataErro(CancelaItemAnterior() ) = false then
               Abort;
         end;
      end
                          //else if DTM1.IBQGenerica5.FieldByName('DESCONTO').AsFloat <= 0 then
      else if 1=1 then
      begin

         //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
         if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,8) = 'BEMATECH' then
         begin
            if frmLogin.pImprimirUnidadeNoCupomFiscal = 'N' then
            begin
               cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat)* 100)));
               cValor := copy(cValor,1,length(cValor)-2) + ',' + copy(cValor,length(cValor)-1,2);
            end
            else
               cValor := trim(FloatToStr(SimpleRoundTo(DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat,-3)* 1000));

         end
         else
         begin
            // Como sempre estaremos trabalhando com duas casas decimais, me parece que a Elgin trabalha desta forma:
            cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat)* 100)));
            cValor := copy(cValor,1,length(cValor)-2) + ',' + copy(cValor,length(cValor)-1,2);
         end;

         vValorTeraQueSerPago := vValorTeraQueSerPago + StrToFloat(cValor) * StrToFloat(cQtde);

         if frmLogin.pImprimirUnidadeNoCupomFiscal = 'N' then
         begin
//cCodigo        := '123';

//cDescricao     := 'Caneta';

//cAliquota      := '1200';

//cTipoQtde      := 'F';

//cQtde          := '10';

//iCasasDecimais := 2;

//cValor         := '0,25';

cTipoDesconto  := '$';

cValorDesc     := '0000';


//            showmessage('vai imprimir o item');
            //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
            if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,8) = 'BEMATECH' then
               iRetorno := Bematech_FI_VendeItem( pchar( cCodigo ),
                                                  pchar( cDescricao ),
                                                  pchar( cAliquota ),
                                                  pchar( cTipoQtde ),
                                                  pchar( cQtde ),
                                                  iCasasDecimais,
                                                  pchar( cValor ),
                                                  pchar( cTipoDesconto ),
                                                  pchar( cValorDesc ) )

            else
            if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,6) = 'DARUMA' then
               iRetorno := Daruma_FI_VendeItem( pchar( cCodigo ),
                                                pchar( cDescricao ),
                                                pchar( cAliquota ),
                                                pchar( cTipoQtde ),
                                                pchar( cQtde ),
                                                iCasasDecimais,
                                                pchar( cValor ),
                                                pchar( cTipoDesconto ),
                                                pchar( cValorDesc ) )
            else
            begin
               // Elcio - 11/08/2009 - comentei aqui
               if (TrataErro(VendeItem( cCodigo,
                                        cDescricao,
                                        cAliquota,
                                        cUnidade,
                                        cQtde,
                                        iCasasDecimais,
                                        cValor,
                                        cTipoDesconto,
                                        cValorDesc)) ) = false then
                  Abort;
            end;


         end
         else
            //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
            if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,8) = 'BEMATECH' then
               iRetorno := Bematech_FI_VendeItemDepartamento(  pchar(cCodigo) ,
                                                               pchar(cDescricao) ,
                                                               pchar(cAliquota) ,
                                                               pchar(cValor) ,
                                                               pchar(cQtde) ,
                                                               pchar('000') ,
                                                               pchar('000') ,
                                                               pchar('00') ,
                                                               pchar(cUnidade)  )

            else
            if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,6) = 'DARUMA' then
               iRetorno := Daruma_FI_VendeItemDepartamento(  pchar(cCodigo) ,
                                                             pchar(cDescricao) ,
                                                             pchar(cAliquota) ,
                                                             pchar(cValor) ,
                                                             pchar(cQtde) ,
                                                             pchar('000') ,
                                                             pchar('000') ,
                                                             pchar('00') ,
                                                             pchar(cUnidade)  )

            else
            begin
//function Elgin_VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String;
// Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer; StdCall; External 'Elgin.DLL';
// Observei que a Elgin também tem a função VendItemDepartamento, mas eu não consegui acertar os parâmetros.
// Como eu uso essa função exclusivamente para inserir a Unidade, e na Elgin a unidade também é um parâmetro da função VendeItem, acredito que não precisaremos utilizar a função VendeItemDepartamento da Elgin
               // Elcio - 11/08/2009 - comentei aqui
              if (TrataErro(VendeItem( cCodigo,
                                        cDescricao,
                                        cAliquota,
                                        cUnidade,
                                        cQtde,
                                        iCasasDecimais,
                                        cValor,
                                        cTipoDesconto,
                                        cValorDesc)) ) = false then

                  Abort;
            end;
      end
      else
      begin
         ShowMessage('Rotina desativada' + #13 + 'Mensagem 64688D');
         Abort;
            //cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat)* 100)));
         if frmLogin.pImprimirUnidadeNoCupomFiscal = 'N' then
            cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat)* 100)))
         else
            cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat + DTM1.IBQGenerica5.FieldByName('DESCONTO').AsFloat)* 1000)));
            //cValor := trim(FloatToStr(DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat));

         cTipoDesconto := '$';
         cValorDesc := trim(IntToStr(trunc(DTM1.IBQGenerica5.FieldByName('DESCONTO').AsFloat * 100)));

         if frmLogin.pImprimirUnidadeNoCupomFiscal = 'N' then
         begin
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
               iRetorno := Bematech_FI_VendeItem(cCodigo, cDescricao,
                           cAliquota, cTipoQtde, cQtde, iCasasDecimais, cValor, cTipoDesconto, cValorDesc)
            else
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
               iRetorno := Daruma_FI_VendeItem(cCodigo, cDescricao,
                           cAliquota, cTipoQtde, cQtde, iCasasDecimais, cValor, cTipoDesconto, cValorDesc);
         end
         else
         begin
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
               iRetorno := Bematech_FI_VendeItemDepartamento(  cCodigo ,
                                                               cDescricao ,
                                                               cAliquota ,
                                                               cValor ,
                                                               cQtde ,
                                                               '000' ,
                                                               cValorDesc ,
                                                               '00' ,
                                                               cUnidade  )
            else
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
               iRetorno := Daruma_FI_VendeItemDepartamento(    cCodigo,
                                                               cDescricao,
                                                               cAliquota,
                                                               cValor,
                                                               cQtde,
                                                               '000',
                                                               cValorDesc,
                                                               '00',
                                                               cUnidade  );
         end;


      end;

      //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
      if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,8) = 'BEMATECH' then
      begin
         if iRetorno <> 1 then
            ShowMessage('iRetorno: ' + IntToStr(iRetorno));
         Analisa_iRetorno(iRetorno);
         Retorno_Impressora();
         if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
            Abort;
      end;

      DTM1.IBQGenerica5.Next;
   end;

   //Agora que imprimi todos os ítens, posso imprimir o rodapé.
   vFormaPagamento := vDescricaoFormaPagamento; //IBQPedidos.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;
//   showmessage('vou imprimir o rodapé');

   {
   if ((frmLogin.pUtilizaEmissoraCupomFiscal = 'S') or
      (frmLogin.pUtilizaEmissoraCupomFiscal = 'S|BEMATECH')) and
      (qRazaoSocial <> '') then
      vMensagemPromocional := StringComComprimentoFixo(qRazaoSocial,frmLogin.pComprimentoDaLinhaDaImpressoraFiscal)
   else
      vMensagemPromocional := '';
   }
   if (copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,9) = 'BEMATECH|')
           and
      (qRazaoSocial <> '') then
      vMensagemPromocional := StringComComprimentoFixo(qRazaoSocial,frmLogin.pComprimentoDaLinhaDaImpressoraFiscal)
   else
      vMensagemPromocional := '';


   if frmLogin.mLinhasCupom[8] <> '' then
      vMensagemPromocional := vMensagemPromocional + frmLogin.mLinhasCupom[8]
   else if vMensagemPromocional = '' then
      vMensagemPromocional := '-';

   if frmLogin.mLinhasCupom[9] <> '' then
      vMensagemPromocional := vMensagemPromocional + ' ' + frmLogin.mLinhasCupom[9];

   if frmLogin.pOptantePeloSimplesNacional = True then
      vMensagemPromocional := vMensagemPromocional + ' ' + 'ICMS a ser recolhido conforme LC 123/2006 - Simples Nacional.';

   vMensagemPromocional := vMensagemPromocional + 'CEP Cliente: ' + vCEPCliente + '      ';
   vMensagemPromocional := vMensagemPromocional + 'Núm. Pedido: ' + DTM1.IBQGenerica5.FieldByName('ID_PEDIDO').AsString;

   if frmLogin.pNomeDaEmpresa = 'SYTO' then
   begin
      vMensagemPromocional := vMensagemPromocional + 'ID Vend.: ' + DTM1.IBQGenerica.FieldByName('ID_VENDEDOR').AsString;
      vMensagemPromocional := vMensagemPromocional + '  Usuario: ' + DTM1.IBQGenerica.FieldByName('USUARIO_NOME').AsString;
   end;


   if frmLogin.pUsaVariasFormasNoCF = 'N' then
   begin
      if vDesconto = 0 then   //  IBQPedidos.FieldByName('DESCONTO').AsFloat = 0 then
      begin
         if vFormaPagamento = '' then
         begin
            //ShowMessage('Forma de pagamento desconhecida.' + #13 + 'Será adotado pagamento em dinheiro');
            vFormaPagamento := 'Dinheiro';
         end;

         //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
         if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,8) = 'BEMATECH' then
         begin
//            showmessage('vai fechar o cupom');
            iRetorno := Bematech_FI_FechaCupomResumido( pchar( vFormaPagamento ), pchar( vMensagemPromocional ) );
            if iRetorno <> 1 then
               ShowMessage('iRetorno: ' + IntToStr(iRetorno));
            Analisa_iRetorno(iRetorno);
            Retorno_Impressora();
//            showmessage('executou o FI_FechaCupomResumido');
            if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
            begin
               //ShowMessage('Rotina imprevista TUOU353B: ' + #13 +
               //            'Possivelmente está sendo utilizada uma forma de pagamento' + #13 +
               //            'que não está registrada na impressora fiscal' + #13 + #13 +
               //            'Sistema irá tentar concluir o cupom com pagamento em dinheiro');
               iRetorno := Bematech_FI_FechaCupomResumido( pchar('Dinheiro'), pchar(vMensagemPromocional) );
               if iRetorno <> 1 then
                  ShowMessage('iRetorno: ' + IntToStr(iRetorno));
               Analisa_iRetorno(iRetorno);
               Retorno_Impressora();

               if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
                  ShowMessage('Mensagem 75KKN' + #13 + 'Sistema não conseguiu concluir a venda com pagamento em dinheiro' + #13 +
                              'cupom ficou aberto.' + #13 + #13 +
                              'Necessário executar a rotina cancelar último cupom')
               else
                  RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');
            end
            else
            begin
//               showmessage('vai registrar este pedido');
               RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');
//               showmessage('registrou este pedido');
            end;
         end
         else
         if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
         begin
            iRetorno := Daruma_FI_FechaCupomResumido( pchar( vFormaPagamento ), pchar( vMensagemPromocional ) );
            Analisa_iRetorno(iRetorno);
            Retorno_Impressora();

            if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
            begin
               //ShowMessage('Rotina imprevista TUOU353B: ' + #13 +
               //            'Possivelmente está sendo utilizada uma forma de pagamento' + #13 +
               //            'que não está registrada na impressora fiscal' + #13 + #13 +
               //            'Sistema irá tentar concluir o cupom com pagamento em dinheiro');

               iRetorno := Daruma_FI_FechaCupomResumido( pchar('Dinheiro'), pchar(vMensagemPromocional) );
               Analisa_iRetorno(iRetorno);
               Retorno_Impressora();

               if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
                  ShowMessage('Mensagem 75KKN' + #13 + 'Sistema não conseguiu concluir a venda com pagamento em dinheiro' + #13 +
                              'cupom ficou aberto.' + #13 + #13 +
                              'Necessário executar a rotina cancelar último cupom')
               else
                  RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');

            end
            else
            begin
               RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');
            end;
         end
         else
         begin
            //Início da Elgin
            //Elcio - 11/08/2009 - comentei aqui
            if TrataErro(FechaCupomResumido( vFormaPagamento, vMensagemPromocional)) = false then
            begin
               //ShowMessage('Rotina imprevista ZUOU57B: ' + #13 +
               //            'Possivelmente está sendo utilizada uma forma de pagamento' + #13 +
               //            'que não está registrada na impressora fiscal' + #13 + #13 +
               //            'Sistema irá tentar concluir o cupom com pagamento em dinheiro');

               if TrataErro(FechaCupomResumido( 'Dinheiro', vMensagemPromocional)) = false then
                  ShowMessage('Mensagem 6TRR14' + #13 + 'Sistema não conseguiu concluir a venda com pagamento em dinheiro' + #13 +
                              'cupom ficou aberto.' + #13 + #13 +
                              'Necessário executar a rotina cancelar último cupom')
               else
                  RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');

            end
            else
            begin
               RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');
            end;
            //Final da Elgin
         end;
      end
      else
      begin
         if vDesconto > 0 then // IBQPedidos.FieldByName('DESCONTO').AsFloat > 0 then
            sAcreDesc := 'D'
         else
            sAcreDesc := 'A';

         //cValorDesc := trim(FloatToStr(SimpleRoundTo(IBQPedidos.FieldByName('DESCONTO').AsFloat,-2)* 100));
         //cValorDesc := trim(FloatToStr(SimpleRoundTo(vDesconto,-2)));
         cValorDesc := trim(FloatToStr(SimpleRoundTo(vDesconto * 100,-2)));
         //cValorDesc := trim(IntToStr(trunc(IBQPedidos.FieldByName('DESCONTO').AsFloat * 100)));

         //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
         if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,5) = 'ELGIN' then
            cValorDesc := copy(cValorDesc,1,length(cValorDesc)-2) + ',' + copy(cValorDesc,length(cValorDesc)-1,2);

         cTipoDesconto := '$' ;

         if sAcreDesc = 'D' then
            vValorTeraQueSerPago := vValorTeraQueSerPago - StrToFloat(cValorDesc)
         else
            vValorTeraQueSerPago := vValorTeraQueSerPago + StrToFloat(cValorDesc);

         //Observando que independente de ser bematech ou bematech termica, as oito primeiras letras são iguais, temos:
         if copy(frmLogin.pUtilizaEmissoraCupomFiscal,3,8) = 'BEMATECH' then
         begin
            //Início Bematech
//            showmessage('vai fechar o cupom');
            iRetorno := Bematech_FI_IniciaFechamentoCupom( pchar(sAcreDesc),pchar(cTipoDesconto), pchar(cValorDesc));
            if iRetorno <> 1 then
               ShowMessage('iRetorno: ' + IntToStr(iRetorno));
            Analisa_iRetorno(iRetorno);
            Retorno_Impressora();

            if (iRetorno = 1) and (frmLogin.vImpressoraFiscalExecutouOComando <> false) then
            begin
               iRetorno := Bematech_FI_TerminaFechamentoCupom(pchar(vMensagemPromocional));
               if iRetorno <> 1 then
                  ShowMessage('iRetorno: ' + IntToStr(iRetorno));
               Analisa_iRetorno(iRetorno);
               Retorno_Impressora();

               if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
                  ShowMessage('Rotina imprevista PTUO353B: ' + #13 + 'Cupom fiscal ficou aberto')
               else
               begin
                  RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');
               end;
            end
            else
               ShowMessage('Rotina imprevista TUX394: ' + #13 + 'Cupom fiscal ficou aberto');
            //Final Bematech
         end
         else
         if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
         begin
            //Início Daruma
            iRetorno := Daruma_FI_IniciaFechamentoCupom( pchar(sAcreDesc),pchar(cTipoDesconto), pchar(cValorDesc));
            Analisa_iRetorno(iRetorno);
            Retorno_Impressora();

            if (iRetorno = 1) and (frmLogin.vImpressoraFiscalExecutouOComando <> false) then
            begin
               iRetorno := Daruma_FI_TerminaFechamentoCupom(pchar(vMensagemPromocional));
               Analisa_iRetorno(iRetorno);
               Retorno_Impressora();

               if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
                  ShowMessage('Rotina imprevista PTUO353B: ' + #13 + 'Cupom fiscal ficou aberto')
               else
               begin
                  RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');
               end;
            end
            else
               ShowMessage('Rotina imprevista TUX394: ' + #13 + 'Cupom fiscal ficou aberto');
            //Final Bematech
         end
         else
         begin
            //Início Elgin
            //function IniciaFechamentoCupom(strAcrescDesc: string; strTipoAcrescDesc: string; strVlAcrescDesc: string): integer;
            //Elcio - 11/08/2009 - comentei aqui
            if TrataErro(IniciaFechamentoCupom( sAcreDesc, cTipoDesconto, cValorDesc)) = true then
            begin
               //function EfetuaFormaPagamento( strFormaPgto: string; strValor: string):
               if TrataErro(EfetuaFormaPagamento(vFormaPagamento,FloatToStr(vValorTeraQueSerPago * 100))) = true then
               begin
                  if TrataErro(TerminaFechamentoCupom( vMensagemPromocional)) = true then
                     RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar')
                  else
                     ShowMessage('Rotina imprevista PTK35B: ' + #13 + 'Cupom fiscal ficou aberto');
               end
               else
                  ShowMessage('Rotina imprevista PTK42T: ' + #13 + 'Cupom fiscal ficou aberto');
            end
            else
               ShowMessage('Rotina imprevista TNX364: ' + #13 + 'Cupom fiscal ficou aberto');

            //Final Elgin
         end;
      end;
   end
   else
   begin
      if vDesconto > 0 then // IBQPedidos.FieldByName('DESCONTO').AsFloat > 0 then
         sAcreDesc := 'D'
      else
         sAcreDesc := 'A';

      cValorDesc := trim(FloatToStr(SimpleRoundTo(vDesconto * 100,-2)));

      cTipoDesconto := '$' ;

      if sAcreDesc = 'D' then
         vValorTeraQueSerPago := vValorTeraQueSerPago - StrToFloat(cValorDesc)
      else
         vValorTeraQueSerPago := vValorTeraQueSerPago + StrToFloat(cValorDesc);

//      showmessage('vai fechar o cupom');
      iRetorno := Bematech_FI_IniciaFechamentoCupom( pchar(sAcreDesc),pchar(cTipoDesconto), pchar(cValorDesc));
      if iRetorno <> 1 then
         ShowMessage('iRetorno: ' + IntToStr(iRetorno));
      Analisa_iRetorno(iRetorno);
      Retorno_Impressora();
//      showmessage('executou o FI_IniciaFechamentoCupom');

      // Elcio - Vou gravar as formas de pagamento no temporário
//      showmessage('vou gravar as formas de pagamento no temporário');
      DTM1.cdsGenerico.Close;
      DTM1.cdsGenerico.FieldDefs.Clear;
      DTM1.cdsGenerico.IndexDefs.Clear;
      DTM1.cdsGenerico.IndexName := '';
      with DTM1.cdsGenerico do
      begin
        FieldDefs.Add('FORMA_DE_PAGAMENTO', ftString, 50);
        FieldDefs.Add('VALOR', ftFloat);
      end;
//      showmessage('adicionei os campos que fazem parte do índice');

      try
        DTM1.cdsGenerico.CreateDataSet;
      except
//        on E: Exception do
//        showmessage('deu erro na criação do clientdataset ' + e.message);
      end;
//      showmessage('criou o clientdataset');

      try
        DTM1.cdsGenerico.AddIndex('IDX_FORMA', 'FORMA_DE_PAGAMENTO', [ixPrimary]);
        DTM1.cdsGenerico.IndexName := 'IDX_FORMA';
      except
      end;
//      showmessage('adicionou o índice');

      with DTM1.IBQGenerica, SQL do
      begin
        Close;
        Clear;
        Add('SELECT PPP.*, FP.DESCRICAO_FORMA_DE_PAGAMENTO FROM PEDIDOS_PARCELAS_PAGAMENTOS PPP ');
        Add('LEFT OUTER JOIN FORMAS_DE_PAGAMENTOS FP ON FP.ID_FORMA_DE_PAGAMENTO = PPP.ID_FORMA_DE_PAGAMENTO ');
        Add('WHERE PPP.ID_PEDIDO = :ID_PEDIDO');
        ParamByName('ID_PEDIDO').AsInteger := qPedido;
        Open;
      end;
//      showmessage('fez o select');

      while not DTM1.IBQGenerica.Eof do
      begin
        vDescrFormaPgto := DTM1.IBQGenerica.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;
//        if (UpperCase(vDescrFormaPgto) <> 'DINHEIRO') and (UpperCase(vDescrFormaPgto) <> 'CHEQUE') then
//           vDescrFormaPgto := 'CHEQUE';

        if DTM1.cdsGenerico.FindKey([vDescrFormaPgto]) then
        begin
           DTM1.cdsGenerico.Edit;
           DTM1.cdsGenerico.FieldByName('VALOR').AsFloat := DTM1.cdsGenerico.FieldByName('VALOR').AsFloat +
                                                            DTM1.IBQGenerica.FieldByName('VALOR').AsFloat;
        end
        else
        begin
           DTM1.cdsGenerico.Insert;
           DTM1.cdsGenerico.FieldByName('FORMA_DE_PAGAMENTO').AsString := vDescrFormaPgto;
           DTM1.cdsGenerico.FieldByName('VALOR').AsFloat := DTM1.IBQGenerica.FieldByName('VALOR').AsFloat;
        end;
        try
          DTM1.cdsGenerico.Post;
        except
//        on E: Exception do
//           showmessage('deu erro na criação do clientdataset ' + e.message);
        end;
        DTM1.IBQGenerica.Next;
//        showmessage('gravou o clientdataset');
      end;

//      showmessage('gravei as formas de pagamento no temporário');
      DTM1.cdsGenerico.First;
      while not DTM1.cdsGenerico.Eof do
      begin
//        showmessage('vai efetuar as formas de pagamento');
        iRetorno := Bematech_FI_EfetuaFormaPagamento(DTM1.cdsGenerico.FieldByName('FORMA_DE_PAGAMENTO').AsString,
                                                     FormatFloat('###,##0.00', DTM1.cdsGenerico.FieldByName('VALOR').AsFloat));
        if iRetorno <> 1 then
           ShowMessage('iRetorno: ' + IntToStr(iRetorno));
        Analisa_iRetorno(iRetorno);
        Retorno_Impressora();
        DTM1.cdsGenerico.Next;
      end;

      if (iRetorno = 1) and (frmLogin.vImpressoraFiscalExecutouOComando <> false) then
      begin
//         showmessage('vai terminar o fechamento do cupom');
         iRetorno := Bematech_FI_TerminaFechamentoCupom(pchar(vMensagemPromocional));
         if iRetorno <> 1 then
            ShowMessage('iRetorno: ' + IntToStr(iRetorno));
         Analisa_iRetorno(iRetorno);
         Retorno_Impressora();

         if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
            ShowMessage('Rotina imprevista PTUO353B: ' + #13 + 'Cupom fiscal ficou aberto')
         else
         begin
            RegistrarNaoRegistrarEstePedido(vQualPedido, 'Registrar');
         end;
      end
      else
         ShowMessage('Rotina imprevista TUX394: ' + #13 + 'Cupom fiscal ficou aberto');
   end;

   //Gravando em pedidos que o cupom fiscal foi impresso
   GravarQueCupomFiscalFoiImpresso(vQualPedido, 'PEDIDOS','ID_PEDIDO');
//   showmessage('terminou de imprimir o cupom');

end;

Procedure Analisa_iRetorno(qRetorno:Integer);
Begin
  if qRetorno = 0 then
    Application.MessageBox( 'Imp.Fiscal: Erro de Comunicação !', 'Erro',MB_IconError + MB_OK);

  If qRetorno = -1 Then
    Application.MessageBox( 'Imp.Fiscal: Erro de Execução na Função. Verifique!', 'Erro', MB_IconError + MB_OK);

  if qRetorno = -2  then
    Application.MessageBox( 'Imp.Fiscal: Parâmetro Inválido !', 'Erro',MB_IconError + MB_OK);

  if qRetorno = -3  then
    Application.MessageBox( 'Imp.Fiscal: Alíquota não programada !', 'Atenção',MB_IconInformation + MB_OK);

  If qRetorno = -4 Then
    Application.MessageBox( 'Imp.Fiscal: Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                                MB_IconInformation + MB_OK);

  If qRetorno = -5 Then
    Application.MessageBox( 'Imp.Fiscal: Erro ao Abrir a Porta de Comunicação', 'Erro',
                                MB_IconError + MB_OK);

  If qRetorno = -6 Then
    Application.MessageBox( 'Impressora Fiscal Desligada ou Desconectada', 'Atenção',
                                MB_IconInformation + MB_OK);

  If qRetorno = -7 Then
    Application.MessageBox( 'Imp.Fiscal: Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                                MB_IconInformation + MB_OK);

  If qRetorno = -8 Then
    Application.MessageBox( 'Imp.Fiscal: Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                                MB_IconError + MB_OK);

  if qRetorno = -18 then
    Application.MessageBox( 'Imp.Fiscal: Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -19 then
    Application.MessageBox( 'Imp.Fiscal: Parâmetro diferentes !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -20 then
    Application.MessageBox( 'Imp.Fiscal: Transação cancelada pelo Operador !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -21 then
    Application.MessageBox( 'Imp.Fiscal: A Transação não foi aprovada !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -22 then
    Application.MessageBox( 'Imp.Fiscal: Não foi possível terminal a Impressão !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -23 then
    Application.MessageBox( 'Imp.Fiscal: Não foi possível terminal a Operação !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -24 then
    Application.MessageBox( 'Imp.Fiscal: Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -25 then
    Application.MessageBox( 'Imp.Fiscal: Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -26 then
    Application.MessageBox( 'Imp.Fiscal: Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -28 then
    Application.MessageBox( 'Imp.Fiscal: Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno = -29 then
    Application.MessageBox( 'Retorno da impressora fiscal = (-29)' + #13 + 'Código desconhecido pelo Sirius !', 'Atenção',
                                MB_IconInformation + MB_OK);
  if qRetorno = -30 then
    Application.MessageBox( 'Função não compatível com a Impressora Fiscal YANCO', 'Atenção',
                                MB_IconInformation + MB_OK);

  if qRetorno < -30 then
    Application.MessageBox( 'Retorno da impressora fiscal inferior a (-30)' + #13 + 'Código desconhecido pelo Sirius !', 'Atenção',
                                MB_IconInformation + MB_OK);


End;

procedure RegistrarNaoRegistrarEstePedido(qPedido:Integer; qOperacao:String);
begin
   if DTM1.IBTransaction1.InTransaction then
      DTM1.IBTransaction1.CommitRetaining
   else
      DTM1.IBTransaction1.StartTransaction;

   with DTM1.IBSQLGenerico do
   begin
      SQL.Clear;
      SQL.Add('UPDATE PEDIDOS SET GERAR_NOTA_FISCAL=:P1 ');
      SQL.Add('WHERE ID_PEDIDO=:PPEDIDO');

      if qOperacao = 'Registrar' then
         ParamByName('P1').Value := 'S'
      else
         ParamByName('P1').Value := '';

      ParamByName('PPEDIDO').Value := qPedido;
      try
         Prepare;
         ExecQuery;
         DTM1.IBTransaction1.CommitRetaining;
      except
         DTM1.IBTransaction1.RollbackRetaining;
         ShowMessage('Cupom fiscal não foi registrado em pedidos');
      end;
   end;
end;

function ExcluirRegistrosDaTabela(qTabela,qCampoChave:String;qValorChave:Integer):Boolean;
begin
   if DTM1.IBTransaction2.InTransaction then
      DTM1.IBTransaction2.CommitRetaining
   else
      DTM1.IBTransaction2.StartTransaction;

   with DTM1.IBSQL1DaTransacao2 do
   begin
      SQL.Clear;
      SQL.Add('DELETE FROM  ');
      SQL.Add(qTabela);
      SQL.Add(' WHERE ');
      SQL.Add(qCampoChave);
      SQL.Add(' =:P1');
      ParamByName('P1').Value := qValorChave;
      try
         Prepare;
         ExecQuery;
         DTM1.IBTransaction2.CommitRetaining;
         Result := True;
      except
         DTM1.IBTransaction2.RollbackRetaining;
         ShowMessage('Não foi possível excluir registros da tabela ' + qTabela);
         Result := False;
      end;
   end;
end;

procedure ExportarParaFrenteDeLoja();
var
   vQualPedido, vDiasValidadeDAV, vIDDAV : Integer;
   vQualPedidoEmString, vDescricaoFormaPagamento, vSequencialParaCupomFiscal : String;
   qPessoaContato, q_CNPJ_Insc_CPF_RG, vEndereco, vCNPJ_CPF, qRazaoSocial : String;
   vDesconto : Real;
   
begin
   if InputQuery('Seleção do pedido','Número do pedido',vQualPedidoEmString) = False then
      Abort;

   try
      vQualPedido := StrToInt(vQualPedidoEmString);
   except
      ShowMessage('Número do pedido inválido');
      Abort;
   end;

   DTM1.IBDatabaseSCI.Close;
   DTM1.IBDatabaseSCI.DatabaseName := frmLogin.pCaminhoParaExportarParaFrenteDeLoja;
   DTM1.IBDatabaseSCI.Connected := True;

   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM PEDIDOS WHERE ID_PEDIDO=:PPEDIDO');
      ParamByName('PPEDIDO').Value := vQualPedido;
      Open;
      if RecordCount = 0 then
      begin
         ShowMessage('Pedido não localizado');
         Abort;
      end;
   end;

   if DTM1.IBTransaction3.InTransaction then
      DTM1.IBTransaction3.CommitRetaining
   else
      DTM1.IBTransaction3.StartTransaction;

   // Vou gravar a header do DAV
   with DTM1.IBSQLGenericoSCI, SQL do
   begin
     Close;
     Clear;
     Add('INSERT INTO DAVS (ID_DAV, DATA_EMISSAO, ID_CLIENTE, NOME_CLIENTE, ID_VENDEDOR, VALOR_DESCONTO, ');
     Add('                  VALOR_DAV, VALOR_TOTAL_CUSTO, NUMERO_DAV, DATA_VALIDADE, SITUACAO, HORA)');
     Add('VALUES (:ID_DAV, :DATA_EMISSAO, :ID_CLIENTE, :NOME_CLIENTE, :ID_VENDEDOR, :VALOR_DESCONTO, ');
     Add('        :VALOR_DAV, :VALOR_TOTAL_CUSTO, :NUMERO_DAV, :DATA_VALIDADE, :SITUACAO, :HORA)');
   end;

   DTM1.IBSQLGenericoSCI.ParamByName('ID_DAV').Value := GeneratorIncrementadoSCI('NOVO_ID_DAV');
   vIDDAV := DTM1.IBSQLGenericoSCI.ParamByName('ID_DAV').Value;
   DTM1.IBSQLGenericoSCI.ParamByName('DATA_EMISSAO').Value := Date;
   DTM1.IBSQLGenericoSCI.ParamByName('ID_CLIENTE').Value := DTM1.IBQGenerica.FieldByName('ID_CLIENTE').Value;
   DTM1.IBSQLGenericoSCI.ParamByName('NOME_CLIENTE').Value := DTM1.IBQGenerica.FieldByName('NOME_CLIENTE').Value;
   DTM1.IBSQLGenericoSCI.ParamByName('ID_VENDEDOR').Value := DTM1.IBQGenerica.FieldByName('ID_VENDEDOR').Value;
   DTM1.IBSQLGenericoSCI.ParamByName('VALOR_DESCONTO').Value := DTM1.IBQGenerica.FieldByName('DESCONTO').Value;
   DTM1.IBSQLGenericoSCI.ParamByName('VALOR_DAV').Value := DTM1.IBQGenerica.FieldByName('VALOR_TOTAL_LIQUIDO').Value;

   with DTM1.IBQGenerica2, SQL do
   begin
     Close;
     Clear;
     Add('SELECT SUM(VALOR_CUSTO_TOTAL) AS VR_CUSTO FROM PEDIDOS_ITENS ');
     Add('WHERE ID_PEDIDO = :ID_PEDIDO');
     ParamByName('ID_PEDIDO').Value := DTM1.IBQGenerica.FieldByName('ID_PEDIDO').Value;
     Open;
   end;

   DTM1.IBSQLGenericoSCI.ParamByName('VALOR_TOTAL_CUSTO').Value := DTM1.IBQGenerica2.FieldByName('VR_CUSTO').Value;
   DTM1.IBSQLGenericoSCI.ParamByName('NUMERO_DAV').Value := GeneratorIncrementadoSCI('NOVO_NUMERO_DAV');
   DTM1.IBSQLGenericoSCI.ParamByName('SITUACAO').Value := 'A';
   DTM1.IBSQLGenericoSCI.ParamByName('HORA').Value := Time;

   try
     DTM1.IBSQLGenericoSCI.Prepare;
     DTM1.IBSQLGenericoSCI.ExecQuery;
     DTM1.IBTransaction3.CommitRetaining;
   except
     DTM1.IBTransaction3.RollbackRetaining;
     ShowMessage('Não foi possível gravar o DAV');
     Abort;
   end;

   //Quanto aos ítens:
   With DTM1.IBQGenerica3, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM PEDIDOS_ITENS ');
      Add('WHERE ID_PEDIDO=:P_ID_PEDIDO');
      ParamByName('P_ID_PEDIDO').Value := vQualPedido;
      Open;
      if recordcount = 0 then
      begin
         ShowMessage('Este pedido não possui nenhum ítem');
         Abort;
      end;
   end;

   if DTM1.IBTransaction3.InTransaction then
      DTM1.IBTransaction3.CommitRetaining
   else
      DTM1.IBTransaction3.StartTransaction;

   // Vou gravar a header do DAV
   with DTM1.IBSQLGenericoSCI, SQL do
   begin
     Close;
     Clear;
     Add('INSERT INTO DAVS_ITENS (ID_DAV_ITEM, ID_DAV, ID_PRODUTO, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL, ');
     Add('                  VALOR_CUSTO, DESCRICAO)');
     Add('VALUES (:ID_DAV_ITEM, :ID_DAV, :ID_PRODUTO, :QUANTIDADE, :VALOR_UNITARIO, :VALOR_TOTAL, ');
     Add('        :VALOR_CUSTO, :DESCRICAO)');
   end;

   DTM1.IBQGenerica3.First;
   while not DTM1.IBQGenerica3.Eof do
   begin
     DTM1.IBSQLGenericoSCI.ParamByName('ID_DAV_ITEM').Value := GeneratorIncrementadoSCI('NOVO_DAV_ITEM');
     DTM1.IBSQLGenericoSCI.ParamByName('DATA_EMISSAO').Value := Date;
     DTM1.IBSQLGenericoSCI.ParamByName('ID_CLIENTE').Value := DTM1.IBQGenerica.FieldByName('ID_CLIENTE').Value;
     DTM1.IBSQLGenericoSCI.ParamByName('NOME_CLIENTE').Value := DTM1.IBQGenerica.FieldByName('NOME_CLIENTE').Value;
     DTM1.IBSQLGenericoSCI.ParamByName('ID_VENDEDOR').Value := DTM1.IBQGenerica.FieldByName('ID_VENDEDOR').Value;
     DTM1.IBSQLGenericoSCI.ParamByName('VALOR_DESCONTO').Value := DTM1.IBQGenerica.FieldByName('DESCONTO').Value;
     DTM1.IBSQLGenericoSCI.ParamByName('VALOR_DAV').Value := DTM1.IBQGenerica.FieldByName('VALOR_TOTAL_LIQUIDO').Value;

     with DTM1.IBQGenerica2, SQL do
     begin
       Close;
       Clear;
       Add('SELECT SUM(VALOR_CUSTO_TOTAL) AS VR_CUSTO FROM PEDIDOS_ITENS ');
       Add('WHERE ID_PEDIDO = :ID_PEDIDO');
       ParamByName('ID_PEDIDO').Value := DTM1.IBQGenerica.FieldByName('ID_PEDIDO').Value;
       Open;
     end;

     DTM1.IBSQLGenericoSCI.ParamByName('VALOR_TOTAL_CUSTO').Value := DTM1.IBQGenerica2.FieldByName('VR_CUSTO').Value;
     DTM1.IBSQLGenericoSCI.ParamByName('NUMERO_DAV').Value := GeneratorIncrementado('NOVO_NUMERO_DAV');
     DTM1.IBSQLGenericoSCI.ParamByName('SITUACAO').Value := 'A';
     DTM1.IBSQLGenericoSCI.ParamByName('HORA').Value := Time;

     try
       DTM1.IBSQLGenericoSCI.Prepare;
       DTM1.IBSQLGenericoSCI.ExecQuery;
       DTM1.IBTransaction3.CommitRetaining;
     except
       DTM1.IBTransaction3.RollbackRetaining;
       ShowMessage('Não foi possível gravar o DAV');
       Abort;
     end;
     DTM1.IBQGenerica3.Next;
   end;

end;

function SemAcentosMasComCedilhas(qString:String):String;
var
   x:Integer;
   qChegou : String;
begin
   qChegou := qString;
   x:=1;
   while x <= length(qString) do
   begin

      if copy(qString,x,1) = 'µ' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'à' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Æ' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'á' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Á' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'à' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'À' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ã' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ã' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'â' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Â' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = 'é' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'É' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'è' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'È' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ê' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ê' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = 'í' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Í' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ì' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ì' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'î' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Î' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = 'ó' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ó' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ò' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ò' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'õ' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Õ' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ô' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ô' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = 'ú' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ú' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ù' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ù' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'û' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Û' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);


//Tremas

      if copy(qString,x,1) = 'ä' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ä' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ë' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ë' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ï' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ï' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ö' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ö' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'ü' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = 'Ü' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '&' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      x:= x + 1;
   end;

   Result := qString;
end;

procedure MarcarDesmarcarPorMim(qIDChaveTabela:Integer;qTabela:String);
var
   v_ID_Marcado_Por_Mim : Integer;
begin
   if qIDChaveTabela <> 0 then
   begin
      if DTM1.IBTransaction1.InTransaction then
         DTM1.IBTransaction1.CommitRetaining
      else
         DTM1.IBTransaction1.StartTransaction;

      //Em primeiro lugar preciso saber se o treco já está marcado:
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add('SELECT ID_MARCADO_POR_MIM FROM MARCADOS_POR_MIM ');
         Add(' WHERE ID_CHAVE_TABELA =:P_ID_CHAVE ');
         Add(' AND NOME_DA_TABELA = ' + QuotedStr(qTabela) + ' ' );
         Add(' AND ID_USUARIO=:P_ID_USUARIO ');
         ParamByName('P_ID_CHAVE').Value := qIDChaveTabela;
         ParamByName('P_ID_USUARIO').Value := frmLogin.p_Id_Usuario;
         Open;
         v_ID_Marcado_Por_Mim := Fields[0].AsInteger;

         DTM1.IBQGenerica.Close;
      end;

      if v_ID_Marcado_Por_Mim <> 0 then
      begin
         with DTM1.IBSQLGenerico, SQL do
         begin
           Close;
           Clear;
           Add('DELETE FROM MARCADOS_POR_MIM WHERE ID_MARCADO_POR_MIM=:P_IDENTIFICADOR ');
           ParamByName('P_IDENTIFICADOR').Value := v_ID_Marcado_Por_Mim;
         end;
      end
      else
      begin
         with DTM1.IBSQLGenerico, SQL do
         begin
           Close;
           Clear;
           Add('INSERT INTO MARCADOS_POR_MIM (ID_MARCADO_POR_MIM, NOME_DA_TABELA, ID_USUARIO, ID_CHAVE_TABELA) ');
           Add('VALUES (:ID_MARCADO_POR_MIM, :NOME_DA_TABELA, :ID_USUARIO, :ID_CHAVE_TABELA) ');
         end;

         with DTM1.IBQGenerica, SQL do
         begin
           Close;
           Clear;
           Add('SELECT GEN_ID(NOVO_MARCADO_POR_MIM,1) FROM RDB$DATABASE');
           Open;
           DTM1.IBSQLGenerico.ParamByName('ID_MARCADO_POR_MIM').AsInteger := Fields[0].AsInteger + 1;
           Close;
         end;
         DTM1.IBSQLGenerico.ParamByName('NOME_DA_TABELA').AsString := qTabela;
         DTM1.IBSQLGenerico.ParamByName('ID_USUARIO').AsInteger := frmLogin.p_ID_Usuario;
   //      DTM1.IBSQLGenerico.ParamByName('ID_CHAVE_TABELA').AsInteger := IBQ_A_Receber.FieldByName('ID_A_RECEBER').AsInteger;
         DTM1.IBSQLGenerico.ParamByName('ID_CHAVE_TABELA').AsInteger := qIDChaveTabela;
      end;

      try
        DTM1.IBSQLGenerico.Prepare;
        DTM1.IBSQLGenerico.ExecQuery;
        DTM1.IBTransaction1.CommitRetaining;
      except
        DTM1.IBTransaction1.RollbackRetaining;
        MessageBox(Application.Handle, PChar('Erro na inclusão do marcado por mim'), 'Erro', mb_ok + mb_iconerror);
        Abort;
      end;
   end;
end;

function EsteRegistroEstaMarcadoPorMim(qIDChaveTabela:Integer;qTabela:String):Boolean;
begin
   if qIDChaveTabela = 0 then
      Result := False
   else
   begin
      with DTM1.ibqgenerica4, SQL do
      begin
         Close;
         Clear;
         Add('SELECT ID_MARCADO_POR_MIM FROM MARCADOS_POR_MIM ');
         Add(' WHERE ID_CHAVE_TABELA =:P_ID_CHAVE ');
         Add(' AND NOME_DA_TABELA = ' + QuotedStr(qTabela) + ' ' );
         Add(' AND ID_USUARIO=:P_ID_USUARIO ');
         ParamByName('P_ID_CHAVE').Value := qIDChaveTabela;
         ParamByName('P_ID_USUARIO').Value := frmLogin.p_Id_Usuario;
         Open;
         if recordcount <> 0 then
            Result := True
         else
            Result := False;

         DTM1.IBQGenerica4.Close;
      end;
   end;
end;

procedure DesmarcarTodosQueEstaoMarcadosPorMim(qTabela:String);
begin
     // Adonis - 11/07/2008: Copiei do Elcio
   if DTM1.IBTransaction1.InTransaction then
      DTM1.IBTransaction1.CommitRetaining
   else
      DTM1.IBTransaction1.StartTransaction;
   with DTM1.IBSQLGenerico, SQL do
   begin
     Close;
     Clear;
     Add('DELETE FROM MARCADOS_POR_MIM ');
     Add('WHERE NOME_DA_TABELA = ' + QuotedStr(qTabela) + ' ');
     Add('  AND ID_USUARIO = :ID_USUARIO');
   end;

   DTM1.IBSQLGenerico.ParamByName('ID_USUARIO').AsInteger := frmLogin.p_ID_Usuario;

   try
     DTM1.IBSQLGenerico.Prepare;
     DTM1.IBSQLGenerico.ExecQuery;
     DTM1.IBTransaction1.CommitRetaining;
     ShowMessage('Registros foram desmarcados');
   except
     DTM1.IBTransaction1.RollbackRetaining;
     MessageBox(Application.Handle, PChar('Erro na exclusão do marcado por mim'), 'Erro', mb_ok + mb_iconerror);
     Abort;
   end;
end;

procedure BematechTestaPorta1();
var
   vLinhao : String;
   vHoje, vDataQueTa, v_Liberar_Ate : tDateTime;
//   tHora : TTime;
   vPrecisa, vTudoOk : Boolean;

   vContador, a, n : Integer;
   rev,vSuperSenha, vLic, v_Data_Encryptada : String;
   SenhaDecrypt : String;
   NomeVol, SisArq : String;
   NumSerial, Flags, TamMax : DWord;
   //NumSerialConvertido : String;
   vLinhaDaMaquina : String;
   SystemInfo : TSystemInfo;
   v_Liberar_Ate_Juliana :Double;

begin
   vHoje := date();
{
if DTM1.IBTransaction1.InTransaction then
   DTM1.IBTransaction1.CommitRetaining
else
   DTM1.IBTransaction1.StartTransaction;

with DTM1.IBSQLGenerico do
begin
   SQL.Clear;
   SQL.Add('UPDATE PARAMETROS SET DESCRICAO=:P1 ');
   SQL.Add(' WHERE ID_PARAMETRO=10120 ');
   ParamByName('P1').Value := 'XXXX';
   try
      DTM1.IBSQLGenerico.Prepare;
      DTM1.IBSQLGenerico.ExecQuery;
      DTM1.IBTransaction1.CommitRetaining;
   except
      DTM1.IBTransaction1.RollbackRetaining;
   end;
end;
}
   vPrecisa := True;
   with DTM1.IBQGenerica5, SQL do
   begin
      Close;
      Clear;
      Add('SELECT PARAMETRO FROM PARAMETROS WHERE ID_PARAMETRO=10660 ');
      Open;
      if (recordcount <> 0) and
         (trim(DTM1.IBQGenerica5.FieldByName('PARAMETRO').AsString) <> '-') and
         (trim(DTM1.IBQGenerica5.FieldByName('PARAMETRO').AsString) <> '') then
      begin
//         if DTM1.IBQGenerica5.FieldByName('PARAMETRO').AsString <> '' then
//         begin
            try
               vDataQueTa := StrToDate(DTM1.IBQGenerica5.FieldByName('PARAMETRO').AsString);
               if vDataqueTa <> vHoje then
                  vPrecisa := True
               else
                  vPrecisa := False;
            except
               vPrecisa := True;
            end;
//         end;
      end;
      DTM1.IBQGenerica5.Close;
   end;
{
if DTM1.IBTransaction1.InTransaction then
   DTM1.IBTransaction1.CommitRetaining
else
   DTM1.IBTransaction1.StartTransaction;

with DTM1.IBSQLGenerico do
begin
   SQL.Clear;
   SQL.Add('UPDATE PARAMETROS SET DESCRICAO=:P1 ');
   SQL.Add(' WHERE ID_PARAMETRO=10120 ');
   ParamByName('P1').Value := 'XXXX';
   try
      DTM1.IBSQLGenerico.Prepare;
      DTM1.IBSQLGenerico.ExecQuery;
      DTM1.IBTransaction1.CommitRetaining;
   except
      DTM1.IBTransaction1.RollbackRetaining;
   end;
end;

}

   if vPrecisa = True then
   begin
      DTM1.IBDSegundoBanco.Connected := False;
      vLinhao := MontarVLinhao1(1);
      vLinhao := vLinhao + '9.19';
      vLinhao := vLinhao + MontarVLinhao1(2);
      vLinhao := vLinhao + 'e:\cle';
      vLinhao := vLinhao + MontarVLinhao1(3);
                                                                                                                                                                     vLinhao := vLinhao + 'ius\sir';
      vLinhao := vLinhao + MontarVLinhao1(4);
      vLinhao := vLinhao + MontarVLinhao1(5);
      SetLength(NomeVol,255);
      SetLength(SisArq,255);
      GetVolumeInformation('c:\', PChar(NomeVol), 255, @NumSerial, TamMax, Flags, PChar(SisArq), 255);

      GetSystemInfo(SystemInfo);

      a:= SystemInfo.wProcessorArchitecture;
      n:= SystemInfo.wProcessorLevel;
      rev:= IntToHex(SystemInfo.wProcessorRevision,4);

      vLinhaDaMaquina := IntToHex(NumSerial,8) + '   ' + IntToStr(a) + '   ' + IntToStr(n) + '   ' + rev ;
                                                                                                                                                                      DTM1.IBDSegundoBanco.DataBaseName := vLinhao;
      try
         DTM1.IBDSegundoBanco.Connected := True;

         if DTM1.IBTransactionSegundoBanco.InTransaction then
            DTM1.IBTransactionSegundoBanco.CommitRetaining
         else
            DTM1.IBTransactionSegundoBanco.StartTransaction;

         with DTM1.IBSQLSegundoBanco do
         begin
            SQL.Clear;
            SQL.Add('INSERT INTO AUX_CORES ');
            SQL.Add(' ( ID_COR, DESCRICAO_DA_COR, DATA, HORA, CORZERO, ');
            SQL.Add('   COR1, COR2, COR3, COR4, COR5, COR6, COR7, ');
            SQL.Add('   COR8, COR9, COR10, COR11 )');
            SQL.Add(' VALUES ');
            SQL.Add(' (:ID_COR,:DESCRICAO_DA_COR,:DATA,:HORA,:CORZERO, ');
            SQL.Add('  :COR1,:COR2,:COR3,:COR4,:COR5,:COR6,:COR7, ');
            SQL.Add('  :COR8,:COR9,:COR10,:COR11 )');

            ParamByName('ID_COR').Value := 999999 ;
            ParamByName('DESCRICAO_DA_COR').Value := frmLogin.pNomeDaEmpresa;

            //tTime := time();
            ParamByName('DATA').Value := vHoje;
            ParamByName('HORA').Value := Time();

            ParamByName('CORZERO').Value := copy(frmLogin.mLinhasCupom[1],1,60);
            ParamByName('COR1').Value := copy(frmLogin.mLinhasCupom[2],1,60);
            ParamByName('COR2').Value := copy(frmLogin.mLinhasCupom[3],1,60);
            ParamByName('COR3').Value := copy(frmLogin.mLinhasCupom[4],1,60);
            ParamByName('COR4').Value := copy(frmLogin.mLinhasCupom[5],1,60);
            ParamByName('COR5').Value := copy(frmLogin.mLinhasCupom[6],1,60);
            ParamByName('COR6').Value := copy(frmLogin.mLinhasCupom[7],1,60);
            ParamByName('COR7').Value := copy(frmLogin.mLinhasCupom[8],1,60);
            ParamByName('COR8').Value := copy(frmLogin.mLinhasCupom[9],1,60);
            ParamByName('COR9').Value := copy(vLinhaDaMaquina,1,60);
            ParamByName('COR10').Value := copy(frmLogin.pCNPJEmpresa,1,60);
            ParamByName('COR11').Value := copy(frmLogin.PUsuarioNome,1,60);

            try
//            DTM1.IBSQLSegundoBanco.Prepare;
//            DTM1.IBSQLSegundoBanco.ExecQuery;
//            DTM1.IBTransactionSegundoBanco.CommitRetaining;

{
if DTM1.IBTransaction1.InTransaction then
   DTM1.IBTransaction1.CommitRetaining
else
   DTM1.IBTransaction1.StartTransaction;

with DTM1.IBSQLGenerico do
begin
   SQL.Clear;
   SQL.Add('UPDATE PARAMETROS SET DESCRICAO=:P1 ');
   SQL.Add(' WHERE ID_PARAMETRO=10120 ');
   ParamByName('P1').Value := 'XXXX';
   try
      DTM1.IBSQLGenerico.Prepare;
      DTM1.IBSQLGenerico.ExecQuery;
      DTM1.IBTransaction1.CommitRetaining;
   except
      DTM1.IBTransaction1.RollbackRetaining;
   end;
end;
}
               Prepare;
               ExecQuery;
               DTM1.IBTransactionSegundoBanco.CommitRetaining;
            finally

            end;

         end;
//      with DTM1.IBSQLSegundoBanco do
//      begin
//            SQL.Clear;
//            SQL.Add('UPDATE PARAMETROS SET DESCRICAO=:P1 ');
//            SQL.Add(' WHERE ID_PARAMETRO=10120 ');
//            DTM1.IBSQLSegundoBanco.ParamByName('P1').Value := 'XYz';
//         try
//            DTM1.IBSQLSegundoBanco.Prepare;
//            DTM1.IBSQLSegundoBanco.ExecQuery;
//            DTM1.IBTransactionSegundoBanco.CommitRetaining;
            //Prepare;
            //ExecQuery;
            //DTM1.IBTransactionSegundoBanco.CommitRetaining;
//         finally

//         end;
//      end;
         vLinhao := 'SELECT * FROM CLIENTES'                                                                                                                                                                                 + '_LICENCAS ' +
                    ' WHERE CNPJ =:CNPJ ';
         with DTM1.IBQGenericaSegundoBanco, SQL do
         begin
            Close;
            Clear;
            Add(vLinhao);
            ParamByName('CNPJ').Value := copy(SemPontosNemTracinhos(frmLogin.pCNPJEmpresa),1,60);
            Open;
            if not DTM1.IBQGenericaSegundoBanco.Eof then
               vLic := FieldByName('LICENCA_ATIVADA_ATE').AsString
            else
               vLic := '';

            DTM1.IBQGenericaSegundoBanco.Close;
         end;

         //BematechTestaPorta2();
         DTM1.IBDSegundoBanco.Connected := False;
         //Ajustando parâmetro 10660

         DTM1.IBDSegundoBanco.DatabaseName := DTM1.IBDataBase.DatabaseName;

         DTM1.IBDSegundoBanco.Connected := True;

         if DTM1.IBTransactionSegundoBanco.InTransaction then
            DTM1.IBTransactionSegundoBanco.CommitRetaining
         else
            DTM1.IBTransactionSegundoBanco.StartTransaction;

//


//         if DTM1.IBTransaction2.InTransaction then
//            DTM1.IBTransaction2.StartTransaction
//         else
//            DTM1.IBTransaction2.CommitRetaining ;

         with DTM1.IBSQLSegundoBanco do
         begin
            SQL.Clear;
            SQL.Add('UPDATE PARAMETROS SET PARAMETRO=:PPARAMETRO ');
            SQL.Add(' WHERE ID_PARAMETRO = 10660 ');
            ParamByName('PPARAMETRO').Value := DateToStr(vHoje);
            try
               DTM1.IBSQLSegundoBanco.Prepare;
               DTM1.IBSQLSegundoBanco.ExecQuery;
               DTM1.IBTransactionSegundoBanco.CommitRetaining;
            finally

            end;
         end;

         vTudoOk := True;
         if vLic <> '' then
         try
            v_Liberar_Ate := StrToDate(vLic);
            v_Liberar_Ate_Juliana := DateTimeToJulianDate(v_Liberar_Ate);
         except
            vTudoOk := false;
         end;

         if (vLic <> '') and (vTudoOk = True) and (v_Liberar_Ate < vHoje) then
         begin
            with DTM1.IBSQLSegundoBanco do
            begin
               SQL.Clear;
               SQL.Add('UPDATE PARAMETROS SET PARAMETRO=:PPARAMETRO, NOME_DO_CAMPO=:PDATAATIVOU');
               SQL.Add('WHERE ID_PARAMETRO=9999 ');
               v_Data_Encryptada := FloatToStr(v_Liberar_Ate_Juliana);
               v_Data_Encryptada := Encrypt(v_Data_Encryptada,1,25,20);
               ParamByName('PPARAMETRO').Value := v_Data_Encryptada;
               ParamByName('PDATAATIVOU').Value := v_Data_Encryptada;

               try
                  DTM1.IBSQLSegundoBanco.Prepare;
                  DTM1.IBSQLSegundoBanco.ExecQuery;
                  DTM1.IBTransactionSegundoBanco.CommitRetaining;
               finally

               end;
            end;
         end;

      finally

      end;
   end;

end;
{
procedure BematechTestaPorta2();
var
   vCNPJ : String;
begin
   //ShowMessage('Rotina em desenvolvimento');
   vCNPJ := frmLogin.PegarCNPJ();
   with DTM1.IBQGenericaSegundoBanco, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM CLIENTES_LICENCAS ');
      Add(' WHERE CNPJ = ' + QuotedStr(vCNPJ) );
      Open;
   end;
end;
}
function MontarVLinhao1(qLinhao:Integer):String;
var
   vResultado : String;
begin
   if qLinhao = 1 then  vResultado := '18' else if qLinhao = 2 then                                                                                                                                     vResultado := '.52.30:'   else if qLinhao = 3 then      vResultado := 'ver\sir'
   else if qLinhao = 4 then
      vResultado := 'ius.f'
   else                                                                                                                                                                                                 vResultado := 'db';

   Result := vResultado;

end;

function LoginHabilitado():Boolean;
begin
   if (frmLogin.pMultiEmpresasVinculadoAoLogin = true) and (frmLogin.p_ID_Empresa = 0) then
   begin
      ShowMessage('Não efetue esta operação quando estiver visualizando todas as empresas');
      Result := False;
   end
   else
      Result := True;

end;

procedure CriarCampoDinamicamente(qIBQuery:TIBQuery;qUpDateSQL:TIBUpdateSQL;qCampo,qTipoDeCampo:String;Calculado:Boolean);
var
   vContador : Integer;
   vPedacoAnterior, vPedacoPosterior : String;
   vNovoCampoInteger : tIntegerField;
   vNovoCampoBCD: tBCDField;
   vNovoCampoString : tStringField;
begin
   qIBQuery.Close;

   if Pos(' * ', qIBQuery.SQL.Text) = 0 then
      qIBQuery.SQL.Text :=  'SELECT ' +qCampo + ', ' +
                            copy(qIBQuery.SQL.Text,7,length(qIBQuery.SQL.Text)-6);


   //Agora modificando o update:
   if Calculado = False then
   begin
      //Tirando o ponto separador de qCampo (exemplo: ped.n_almoxarifado);
      vContador := Pos('.',qCampo);
      //Agora que sei onde o ponto está, posso separar apenas a parte posterior:
      qCampo := copy(qCampo,vContador+1,length(qCampo)-vContador);

      //Achando o primeiro parênteses do InsertSQL:
      vContador := Pos('(',qUpdateSQL.InsertSQL.Text);
      //Agora que sei onde a descrição dos campos irá começar, posso inserir o campo:
      vPedacoAnterior := copy(qUpdateSQL.InsertSQL.Text,1,vContador);
      vPedacoPosterior := copy(qUpdateSQL.InsertSQL.Text,vContador + 1,length(qUpdateSQL.InsertSQL.Text)-vContador);
      qUpdateSQL.InsertSQL.Text := vPedacoAnterior + qCampo + ', ' + vPedacoPosterior;

      //Achando o primeiro dois pontos do InsertSQL:
      vContador := Pos(':',qUpdateSQL.InsertSQL.Text);
      //Agora que sei onde a descrição dos parâmetros irá começar, posso inserir o campo:
      vPedacoAnterior := copy(qUpdateSQL.InsertSQL.Text,1,vContador - 1);
      vPedacoPosterior := copy(qUpdateSQL.InsertSQL.Text,vContador,length(qUpdateSQL.InsertSQL.Text)-vContador+1);
      qUpdateSQL.InsertSQL.Text := vPedacoAnterior + ':' + qCampo + ', ' + vPedacoPosterior;

      //Para o ModifySQL preciso encontrar a primeira vírgula
      vContador := Pos(',',qUpdateSQL.ModifySQL.Text);
      //Agora que sei onde está a primeira vírgula, posso acrescentar o campo e seu respectivo parâmetro:
      vPedacoAnterior := copy(qUpdateSQL.ModifySQL.Text,1,vContador);
      vPedacoPosterior := copy(qUpdateSQL.ModifySQL.Text,vContador+1,length(qUpdateSQL.ModifySQL.Text)-vContador);
      qUpdateSQL.ModifySQL.Text := vPedacoAnterior + qCampo + ' =:' + qCampo + ', ' + vPedacoPosterior;

      //Para o Refresh vou pré-supor que sempre irá começar pela palavra SELECT seguida de um espaço:
      //Por razão que desconheço, esse Refresh não está funcionando corretamente - Problema do Refresh
      //Não funciona para os campos que são criados dinamicamente em pedidos (N_CONTRATO e N_ADITIVO)
      qUpdateSQL.RefreshSQL.Text := 'SELECT ' + qCampo + ', ' +
                                    copy(qUpdateSQL.RefreshSQL.Text,8,length(qUpdateSQL.RefreshSQL.Text)-7);


   end;

   //Agora a criação do campo
   if qTipoDeCampo = 'Integer' then
   begin
      vNovoCampoInteger := TIntegerField.Create(qIBQuery);
      vNovoCampoInteger.FieldName := qCampo;
      vNovoCampoInteger.Name := qIBQuery.Name + vNovoCampoInteger.FieldName;
      vNovoCampoInteger.Index := qIBQuery.FieldCount;
      vNovoCampoInteger.DataSet := qIBQuery;
      qIBQuery.FieldDefs.Update;
      qIBQuery.Open;
   end
   else if qTipoDeCampo = 'String' then
   begin
      vNovoCampoString := TStringField.Create(qIBQuery);
      vNovoCampoString.FieldName := qCampo;
      vNovoCampoString.Name := qIBQuery.Name + vNovoCampoString.FieldName;
      vNovoCampoString.Index := qIBQuery.FieldCount;
      vNovoCampoString.DataSet := qIBQuery;
      qIBQuery.FieldDefs.Update;
      qIBQuery.Open;
   end
   else if qTipoDeCampo = 'BCD' then
   begin
      vNovoCampoBCD := TBCDField.Create(qIBQuery);
      vNovoCampoBCD.FieldName := qCampo;
      vNovoCampoBCD.Name := qIBQuery.Name + vNovoCampoBCD.FieldName;
      vNovoCampoBCD.Index := qIBQuery.FieldCount;
      vNovoCampoBCD.DataSet := qIBQuery;
      vNovoCampoBCD.Size := 2;
      qIBQuery.FieldDefs.Update;
      qIBQuery.Open;
   end;
end;


procedure InserirEmLancamentosContabeis(qReduzido:String;
                                        qData:tDateTime;
                                        qValor:Real;
                                        vDebito_Ou_Credito:String;
                                        vID_A_Pagar, vID_A_Receber, vID_Empresa :Integer;
                                        vTabela_De_Origem:String;
                                        vID_Tabela_De_Origem:Integer;
                                        vSub_Tabela_De_Origem:String;
                                        vID_SubTabela_De_Origem:Integer);

begin

   if DTM1.IBTransaction1.InTransaction then
      DTM1.IBTransaction1.CommitRetaining
   else
      DTM1.IBTransaction1.StartTransaction;

   with DTM1.IBSQLGenerico do
   begin
      SQL.Clear;
      SQL.Add(' INSERT INTO LANCAMENTOS_CONTABEIS');
      SQL.Add('         (ID_LANCAMENTO_CONTABIL, DATA, REDUZIDO, VALOR, DEBITO_OU_CREDITO, ');
      SQL.Add(' ID_A_PAGAR, ID_A_RECEBER, ID_EMPRESA, ');
      SQL.Add(' TABELA_DE_ORIGEM, ID_TABELA_DE_ORIGEM, SUB_TABELA_DE_ORIGEM, ID_SUB_TABELA_DE_ORIGEM)');
      SQL.Add(' VALUES (:ID_LANCAMENTO_CONTABIL,:DATA,:REDUZIDO,:VALOR,:DEBITO_OU_CREDITO, ');
      SQL.Add(':ID_A_PAGAR,:ID_A_RECEBER,:ID_EMPRESA, ');
      SQL.Add(':TABELA_DE_ORIGEM,:ID_TABELA_DE_ORIGEM,:SUB_TABELA_DE_ORIGEM,:ID_SUB_TABELA_DE_ORIGEM)');

      with DTM1.IBQGenerica4, SQL do
      begin
         Close;
         Clear;
         Add('SELECT GEN_ID(NOVO_LANCAMENTO_CONTABIL,1) FROM RDB$DATABASE');
         Open;
         DTM1.IBSQLGenerico.ParamByName('ID_LANCAMENTO_CONTABIL').Value := Fields[0].AsInteger;
         DTM1.IBQGenerica4.Close;
      end;

      ParamByName('DATA').Value := qData;
      ParamByName('REDUZIDO').Value := qReduzido;
      ParamByName('VALOR').Value := qValor;
      ParamByName('DEBITO_OU_CREDITO').Value := vDebito_Ou_Credito;
      ParamByName('ID_A_PAGAR').Value := vID_A_Pagar;
      ParamByName('ID_A_RECEBER').Value := vID_A_Receber;
      ParamByName('ID_EMPRESA').Value := vID_Empresa;
      ParamByName('TABELA_DE_ORIGEM').Value := vTabela_De_Origem;
      ParamByName('ID_TABELA_DE_ORIGEM').Value := vID_Tabela_De_Origem;
      ParamByName('SUB_TABELA_DE_ORIGEM').Value := vSub_Tabela_De_Origem;
      ParamByName('ID_SUB_TABELA_DE_ORIGEM').Value := vID_SubTabela_De_Origem;

      try
         Prepare;
         ExecQuery;
         DTM1.IBTransaction1.CommitRetaining;
      except
         DTM1.IBTransaction1.RollbackRetaining;
         ShowMessage('Inconsistência 6RYRY7N: ' + #13 + 'Não foi efetuado o lançamento contábil');
      end;
   end;
end;

function PreenchimentoDaContaContabilEstaCorreto(qContaContabil,qNatureza,ContaDeEstoque:String):Boolean;
var
   vNivelConta : Integer;
begin
   with DTM1.IBQGenerica5, SQL do
   begin
      Close;
      Clear;
      Add('SELECT REDUZIDO FROM CONTAS WHERE REDUZIDO=:PREDUZIDO');
      ParamByName('PREDUZIDO').Value := qContaContabil;

      if trim(qNatureza) <> '' then
      begin
         Add(' AND NATUREZA_CREDORA_OU_DEVEDORA=:PNATUREZA');
         ParamByName('PNATUREZA').Value := AnsiUpperCase(qNatureza);
      end;

      if trim(AnsiUpperCase(ContaDeEstoque)) = 'S' then
         Add(' AND CONTA_DE_ESTOQUE = ' + QuotedStr('S') + ' ');

      if trim(AnsiUpperCase(ContaDeEstoque)) = 'N' then
      begin
         Add(' AND ((CONTA_DE_ESTOQUE IS NULL) OR (CONTA_DE_ESTOQUE <>:PSIM)) ');
         ParamByName('PSIM').Value := 'S';
      end;

      if frmLogin.pPermiteLancUltimoNivel = 'N' then
      begin
         vNivelConta := StrToInt(NivelDestaConta(frmLogin.pEstruturaPlanoContas));
         Add(' AND NIVEL_NA_ESTRUTURA_CODIFICACAO=:PNIVEL ');
         ParamByName('PNIVEL').Value := vNivelConta;
      end;

      Open;
      if DTM1.IBQGenerica5.Fields[0].AsString <> '' then
         Result := True
      else
         Result := False;

      DTM1.IBQGenerica5.Close;
   end;
end;

function LancarEmMovimentacoes(qProduto, qAlmoxarifado:Integer;
                               qQuantidade, qSaldo_Anterior, qSaldo_Anterior_Almox:Real;
                                qTipo_Movimentacao:String):Boolean;
var
   vData : tDateTime;
begin
   if DTM1.IBTransaction1.InTransaction then
      DTM1.IBTransaction1.CommitRetaining
   else
      DTM1.IBTransaction1.StartTransaction;

   with DTM1.IBSQLGenerico3 do
   begin
      SQL.Clear;
      SQL.Add('INSERT INTO MOVIMENTACOES (ID_MOVIMENTACAO, ID_PRODUTO, ID_ALMOXARIFADO, QUANTIDADE, SALDO_ANTERIOR, SALDO_ANTERIOR_ALMOX, TIPO_MOVIMENTACAO, DATA, HORA, USUARIO)');
      SQL.Add('             VALUES      (:ID_MOVIMENTACAO,:ID_PRODUTO,:ID_ALMOXARIFADO,:QUANTIDADE,:SALDO_ANTERIOR,:SALDO_ANTERIOR_ALMOX,:TIPO_MOVIMENTACAO,:DATA,:HORA,:USUARIO)');
      ParamByName('ID_MOVIMENTACAO').Value := 99999999 ;
      ParamByName('ID_PRODUTO').Value := qProduto;
      ParamByName('ID_ALMOXARIFADO').Value := qAlmoxarifado;

      ParamByName('QUANTIDADE').Value := qQuantidade;
      ParamByName('SALDO_ANTERIOR').Value := qSaldo_Anterior;
      ParamByName('SALDO_ANTERIOR_ALMOX').Value := qSaldo_Anterior_Almox;

      ParamByName('TIPO_MOVIMENTACAO').Value := qTipo_Movimentacao;

      vData := Date();
      ParamByName('DATA').Value := vData;
      ParamByName('HORA').Value := time();
      ParamByName('USUARIO').Value := frmLogin.PUsuarioNome;

      Prepare;
      try
         ExecQuery;
         DTM1.IBTransaction1.CommitRetaining;
         Result := True;
      except
         DTM1.IBTransaction1.RollbackRetaining;
         ShowMessage('Mensagem 5T97K' + #13 + 'Lançamento em movimentações não foi concluído');
         Result := False;
      end;
   end;

end;

procedure ImprimirCupomFiscalDeOrdemDeServico(qOrdemDeServico:Integer);
var
   vQualPedidoEmString,qRazaoSocial,qPessoaContato,q_CNPJ_Insc_CPF_RG, vCNPJ_CPF, vEndereco : String;
   vQualPedido : Integer;
   vPodeImprimir : Boolean;
   vValorReal : Extended;
   vValorInt : Integer;
   //Variáveis para a função de impressão de ítens
   cCodigo, cDescricao, cAliquota, cTipoQtde, cQtde, cValor, cTipoDesconto, cValorDesc, cUnidade : String;
   vFormaPagamento, vMensagemPromocional, sAcreDesc : String;
   iCasasDecimais : Integer;
   iControle: Integer;
   iACK, iST1, iST2: Integer; // Variáveis com o retorno do Status da Impressora

   sCodigo, sDescricao, sAliquota, sTipoQtde, sQtde, sValor, sTipo, sDesconto : string;
   sForma, sMensagem, sConfirma, vDescricaoFormaPagamento: string;
   bRetornoEstendido: boolean;
   vDesconto : Real;

begin
   //Vergonhosamente recortei e colei da função ImprimirCupomFiscal que é bem parecida com esta
   vQualPedidoEmString := IntToStr(qOrdemDeServico);

   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM SERVICOS WHERE ID_SERVICO=:PSERVICO');
      ParamByName('PSERVICO').Value := qOrdemDeServico;
      Open;
      if RecordCount = 0 then
      begin
         ShowMessage('Ordem de serviço não localizada');
         Abort;
      end;
      vDescricaoFormaPagamento := DTM1.IBQGenerica.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;
      vDesconto := DTM1.IBQGenerica.FieldByName('DESCONTO').AsFloat;
   end;

   if TodosOsItensIraoPermitirImpressaoDeCupomFiscal(qOrdemDeServico,'Servicos') = false then
      Abort;

   //Descobrindo dados do cliente:
   with DTM1.IBQGenerica2, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RAZAO_SOCIAL, PESSOA_P_CONTATO, CNPJ, CPF, INSC_ESTADUAL, ');
      Add('END_LOGRADOURO, END_NUMERO, END_ANDAR, END_COMPLEMENTO, ');
      Add('END_BAIRRO, END_CIDADE, END_CEP, END_UF ');
      Add('FROM CLIENTES WHERE ID_CLIENTE=:P1');
      ParamByName('P1').Value := DTM1.IBQGenerica.FieldByName('ID_CLIENTE').AsInteger;
      Open;
      qPessoaContato := '';
      q_CNPJ_Insc_CPF_RG := '';
      vEndereco := '';
      vCNPJ_CPF := '';
      qRazaoSocial := '';
      if recordcount <> 0 then
      begin
         qRazaoSocial := trim(SemAcentosNemCedilhas(FieldByName('RAZAO_SOCIAL').AsString));
         qPessoaContato := FieldByName('PESSOA_P_CONTATO').AsString;
         q_CNPJ_Insc_CPF_RG := FieldByName('INSC_ESTADUAL').AsString;
         //Por enquanto não estou imprimindo o CNPJ na Impressora Fiscal
         if trim(DTM1.IBQGenerica2.FieldByName('CNPJ').AsString) <> '' then
            vCNPJ_CPF := ' ' + DTM1.IBQGenerica2.FieldByName('CNPJ').AsString
         else
            vCNPJ_CPF := ' ' + DTM1.IBQGenerica2.FieldByName('CPF').AsString;

         vEndereco := frmLogin.EnderecoMontadoComSetentaENoveCaracteres(
                          DTM1.IBQGenerica2.FieldByName('END_LOGRADOURO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_NUMERO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_ANDAR').AsInteger,
                          DTM1.IBQGenerica2.FieldByName('END_COMPLEMENTO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_BAIRRO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_CIDADE').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_CEP').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_UF').AsString
                                                              );

         vEndereco := trim(SemAcentosNemCedilhas(vEndereco));

      end;
      DTM1.IBQGenerica2.Close;
   end;
   vCNPJ_CPF := copy(vCNPJ_CPF,1,29);
   qRazaoSocial := copy(qRazaoSocial,1,30);
   vEndereco := copy(vEndereco,1,79);



   if (frmLogin.pUtilizaEmissoraCupomFiscal = 'S') or
      (frmLogin.pUtilizaEmissoraCupomFiscal = 'S|BEMATECH') then
      iRetorno := Bematech_FI_AbreCupom( Pchar( vCNPJ_CPF ) )
   else if frmLogin.pUtilizaEmissoraCupomFiscal = 'S|BEMATECH TERMICA' then
      iRetorno := Bematech_FI_AbreCupomMFD( Pchar( vCNPJ_CPF ), Pchar( qRazaoSocial ), Pchar( vEndereco ))
   else
   if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
      iRetorno := Daruma_FI_AbreCupom(PChar(vCNPJ_CPF))
   else
   begin
      ShowMessage('Parâmetro 86 preenchido incorretamente');
      iRetorno := Bematech_FI_AbreCupom( Pchar( vCNPJ_CPF ) );
   end;

   Analisa_iRetorno(iRetorno);
   Retorno_Impressora();
   if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
   begin
      ShowMessage('Não foi possível completar a operação');
      Abort;
   end;

   with DTM1.IBQGenerica5, SQL do
   begin
      Close;
      Clear;
      Add('SELECT OSI.ID_SERVICO, OSI.ID_SERVICO_ITEM, OSI.ID_PRODUTO, OSI.DESCRICAO, ');
//      Add('OSI.ID_PRODUTO_GRADE, OSI.DESCRICAO_GRADE, ');
      Add('OSI.QUANTIDADE, OSI.VALOR_UNITARIO, OSI.VALOR_TOTAL ');
//      Add('OSI.VALOR_TOTAL_PREVISTO - OSI.VALOR_TOTAL AS DESCONTO, ');
//      Add('OSI.PERCENTUAL_DE_COMISSAO, OSI.VALOR_CUSTO_TOTAL, P.DESCRICAO ');

      Add(' FROM SERVICOS_ITENS OSI ');

//      Add('LEFT OUTER JOIN PRODUTOS P ON P.ID_PRODUTO = OSI.ID_PRODUTO ');

      Add('WHERE ');
      Add('OSI.ID_SERVICO=:P_ID_SERVICO ');
      Add(' AND OSI.ID_PRODUTO IS NOT NULL ');

      ParamByName('P_ID_SERVICO').Value := qOrdemDeServico;
      Open;

{
      Add('SELECT PI.ID_PEDIDO, PI.ID_PEDIDO_ITEM, PI.ID_PRODUTO, PI.DESCRICAO_PRODUTO, ');
      Add('PI.ID_PRODUTO_GRADE, PI.DESCRICAO_GRADE, ');
      Add('PI.QUANTIDADE, PI.VALOR_UNITARIO, PI.VALOR_UNITARIO_PREVISTO,  PI.VALOR_TOTAL, PI.VALOR_TOTAL_PREVISTO, ');
      Add('PI.VALOR_TOTAL_PREVISTO - PI.VALOR_TOTAL AS DESCONTO, ');
      Add('PI.PERCENTUAL_DE_COMISSAO, PI.VALOR_CUSTO_TOTAL, P.DESCRICAO ');

      Add(' FROM PEDIDOS_ITENS PI ');

      Add('LEFT OUTER JOIN PRODUTOS P ON P.ID_PRODUTO = PI.ID_PRODUTO ');

      Add('WHERE ');
      Add('ID_PEDIDO=:P_ID_PEDIDO ');
      ParamByName('P_ID_PEDIDO').Value := vQualPedido;
      Open;
}
   end;

   while not DTM1.IBQGenerica5.Eof do
   begin

      vPodeImprimir := True;
      with DTM1.IBQGenerica, SQL do
      begin
         Close;
         Clear;
         Add('SELECT CODIGO, UNIDADE, ALIQUOTA_ICMS ');
         Add('FROM PRODUTOS WHERE ID_PRODUTO=:P1');
         ParamByName('P1').Value := DTM1.IBQGenerica5.FieldByName('ID_PRODUTO').AsInteger;
         Open;
         if RecordCount = 0 then
         begin
            ShowMessage('Inconsistência TXA64: ' + #13 + 'Produto não localizado');
            vPodeImprimir := False;
         end;
      end;
      //cCodigo := copy(trim(DTM1.IBQGenerica.FieldByName('CODIGO').AsString),1,13);
      cCodigo := trim(copy(DTM1.IBQGenerica.FieldByName('CODIGO').AsString,1,49));
      if cCodigo = '' then  cCodigo := '-';

      cUnidade := copy(DTM1.IBQGenerica.FieldByName('UNIDADE').AsString,1,2);
      if cUnidade = '' then
         cUnidade := '-';

      cDescricao := copy(trim(DTM1.IBQGenerica5.FieldByName('DESCRICAO').AsString),1,29);
      if cDescricao = '' then cDescricao := '-';



      cAliquota := trim(FloatToStr(DTM1.IBQGenerica.FieldByName('ALIQUOTA_ICMS').AsFloat * 100));
      DTM1.IBQGenerica.Close;

      if length(cAliquota) > 4 then
      begin
         ShowMessage('Inconsistência XZX645A3: ' + #13 + 'alíquota do ICMS não pode ser maior que 99');
         vPodeImprimir := False;
      end
      else if length(cAliquota) = 4 then
         cAliquota := cAliquota
      else if length(cAliquota) = 3 then
         cAliquota := '0' + cAliquota
      else if length(cAliquota) = 2 then
         cAliquota := '00' + cAliquota
      else if length(cAliquota) = 1 then
         cAliquota := '000' + cAliquota
      else
         cAliquota := 'II';

      if cAliquota = '0000' then
         cAliquota := 'II';  // Para forçar a alíquota isenta

      if (cAliquota = '9999') or (cAliquota = '9900') then
         cAliquota := 'FF';  //FF é um código interpretado pela Bematech como Substituição tributária

      if (cAliquota = '8888') or (cAliquota = '8800') then
         cAliquota := 'NN';  //FF é um código interpretado pela Bematech como Substituição tributária

      if (cAliquota <> 'II') and (cAliquota <> 'FF') and (cAliquota <> 'NN') then
         cAliquota := copy(cAliquota,1,2) + ',' + copy(cAliquota,3,2);

      if DTM1.IBQGenerica5.FieldByName('QUANTIDADE').AsFloat = 0 then
      begin
         ShowMessage('Inconsistência TEX53242: ' + #13 + 'Quantidade inválida');
         vPodeImprimir := False;
      end ;

      //Decidi que por enquanto, a quantidade será sempre fracionária
      cTipoQtde := 'F';

      vValorReal := DTM1.IBQGenerica5.FieldByName('QUANTIDADE').AsFloat * 1000;
      vValorInt := Trunc(vValorReal);
      cQtde := trim(IntToStr(vValorInt));

      iCasasDecimais := 2;
      //Me parece que casas decimais se refere sempre a valores, e não a quantidade

      if DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat = 0 then
      begin
         ShowMessage('Inconsistência TXN4D4A: ' + #13 + 'Valor unitário inválido');
         vPodeImprimir := False;
      end

      else
      if DTM1.IBQGenerica5.FieldByName('QUANTIDADE').AsFloat < 0 then
      begin
         if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
            iRetorno := Bematech_FI_CancelaItemAnterior()
         else
         if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
            iRetorno := Daruma_FI_CancelaItemAnterior();
      end
      //else if DTM1.IBQGenerica5.FieldByName('DESCONTO').AsFloat <= 0 then
      else if 1=1 then
      begin
         //cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat)* 100)));
         cValor := trim(FloatToStr(SimpleRoundTo(DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat,-2)* 100));

         if frmLogin.pImprimirUnidadeNoCupomFiscal = 'N' then
         begin
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
               iRetorno := Bematech_FI_VendeItem(cCodigo, cDescricao,
                           cAliquota, cTipoQtde, cQtde, iCasasDecimais, cValor,'%','0')
            else
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
               iRetorno := Daruma_FI_VendeItem(cCodigo, cDescricao,
                           cAliquota, cTipoQtde, cQtde, iCasasDecimais, cValor,'%','0');
         end
         else
         begin
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
               iRetorno := Bematech_FI_VendeItemDepartamento(  cCodigo ,
                                                               cDescricao ,
                                                               cAliquota ,
                                                               cValor ,
                                                               cQtde ,
                                                               '0' ,
                                                               '0' ,
                                                               '0' ,
                                                               cUnidade  )
            else
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
               iRetorno := Daruma_FI_VendeItemDepartamento(    cCodigo,
                                                               cDescricao,
                                                               cAliquota,
                                                               cValor,
                                                               cQtde,
                                                               '0',
                                                               '0',
                                                               '0',
                                                               cUnidade  );
         end;



            //cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat + DTM1.IBQGenerica5.FieldByName('DESCONTO').AsFloat)* 100)));
            //cValor := trim(FloatToStr(DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat));

//            cTipoDesconto := '';
//            cValorDesc := '';

      end
      else
      begin
         ShowMessage('Rotina desativada' + #13 + 'Mensagem 65688D');
         Abort;
         //cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat + DTM1.IBQGenerica5.FieldByName('DESCONTO').AsFloat)* 100)));
         cValor := trim(IntToStr(trunc((DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat)* 100)));

         cTipoDesconto := '$';
         //cValorDesc := trim(IntToStr(trunc(DTM1.IBQGenerica5.FieldByName('DESCONTO').AsFloat * 100)));
         cValorDesc := '';

         if frmLogin.pImprimirUnidadeNoCupomFiscal = 'N' then
         begin
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
               iRetorno := Bematech_FI_VendeItem(cCodigo, cDescricao,
                           cAliquota, cTipoQtde, cQtde, iCasasDecimais, cValor, cTipoDesconto, cValorDesc)
            else
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
               iRetorno := Daruma_FI_VendeItem(cCodigo, cDescricao,
                           cAliquota, cTipoQtde, cQtde, iCasasDecimais, cValor, cTipoDesconto, cValorDesc);
         end
         else
         begin
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
               iRetorno := Bematech_FI_VendeItemDepartamento(  cCodigo ,
                                                               cDescricao ,
                                                               cAliquota ,
                                                               cValor ,
                                                               cQtde ,
                                                               '0' ,
                                                               '0' ,
                                                               '0' ,
                                                               cUnidade  )
            else
            if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
               iRetorno := Daruma_FI_VendeItemDepartamento(    cCodigo,
                                                               cDescricao,
                                                               cAliquota,
                                                               cValor,
                                                               cQtde,
                                                               '0',
                                                               '0',
                                                               '0',
                                                               cUnidade   );
         end;
      end;

      Analisa_iRetorno(iRetorno);
      Retorno_Impressora();

      if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
      begin
         ShowMessage('Não foi possível completar a operação');
         Break;
      end;

      DTM1.IBQGenerica5.Next;
   end;

   //Agora que imprimi todos os ítens, posso imprimir o rodapé.
   vFormaPagamento := vDescricaoFormaPagamento; //IBQPedidos.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;

   if ((frmLogin.pUtilizaEmissoraCupomFiscal = 'S') or
      (frmLogin.pUtilizaEmissoraCupomFiscal = 'S|BEMATECH')) and
      (qRazaoSocial <> '') then
      vMensagemPromocional := StringComComprimentoFixo(qRazaoSocial,frmLogin.pComprimentoDaLinhaDaImpressoraFiscal)
   else
      vMensagemPromocional := '';

   if frmLogin.mLinhasCupom[8] <> '' then
      vMensagemPromocional := vMensagemPromocional + frmLogin.mLinhasCupom[8]
   else if vMensagemPromocional = '' then
      vMensagemPromocional := '-';

   if frmLogin.mLinhasCupom[9] <> '' then
      vMensagemPromocional := vMensagemPromocional + ' ' + frmLogin.mLinhasCupom[9];

   if frmLogin.pRegimeDeContribuicao = 'SIMPLES NACIONAL' then
      vMensagemPromocional := vMensagemPromocional + ' ' + 'ICMS a ser recolhido conforme LC 123/2006 - Simples Nacional.';

   if vDesconto = 0 then
   begin
      if vFormaPagamento = '' then
      begin
         //ShowMessage('Forma de pagamento desconhecida.' + #13 + 'Será adotado pagamento em dinheiro');
         vFormaPagamento := 'Dinheiro';
      end;
      if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
         iRetorno := Bematech_FI_FechaCupomResumido( vFormaPagamento, vMensagemPromocional )
      else
      if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
         iRetorno := Daruma_FI_FechaCupomResumido(vFormaPagamento, vMensagemPromocional );

      Analisa_iRetorno(iRetorno);

      Analisa_iRetorno(iRetorno);
      Retorno_Impressora();

      if (iRetorno <> 1) or (frmLogin.vImpressoraFiscalExecutouOComando = false) then
         ShowMessage('Rotina imprevista TZU3Z3: ' + #13 + 'Cupom ficou aberto')

   end
   else
   begin
      if vDesconto > 0 then // IBQPedidos.FieldByName('DESCONTO').AsFloat > 0 then
         sAcreDesc := 'D'
      else
         sAcreDesc := 'A';

      //cValorDesc := trim(FloatToStr(SimpleRoundTo(IBQPedidos.FieldByName('DESCONTO').AsFloat,-2)* 100));
      cValorDesc := trim(FloatToStr(SimpleRoundTo(vDesconto,-2)* 100));
      //cValorDesc := trim(IntToStr(trunc(IBQPedidos.FieldByName('DESCONTO').AsFloat * 100)));
      if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
         iRetorno := Bematech_FI_IniciaFechamentoCupom( sAcreDesc,'$', cValorDesc)
      else
      if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
         iRetorno := Daruma_FI_IniciaFechamentoCupom( sAcreDesc, '$', cValorDesc);
      Analisa_iRetorno(iRetorno);
      if iRetorno = 1 then
      begin
         if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
            iRetorno := Bematech_FI_TerminaFechamentoCupom(vMensagemPromocional)
         else
         if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
            iRetorno := Daruma_FI_TerminaFechamentoCupom(vMensagemPromocional);
         Analisa_iRetorno(iRetorno);
         if iRetorno <> 1 then
            ShowMessage('Rotina imprevista PTER3: ' + #13 + 'Cupom fiscal ficou aberto')

      end
      else
         ShowMessage('Rotina imprevista TUX312: ' + #13 + 'Cupom fiscal ficou aberto');
   end;

   //Gravando em pedidos que o cupom fiscal foi impresso
   GravarQueCupomFiscalFoiImpresso(qOrdemDeServico, 'SERVICOS','ID_SERVICO');

end;


procedure ExportarParaFrenteDeLojaOrdemDeServico(qOrdemDeServico:Integer);
var
   vQualPedido : Integer;
   vQualPedidoEmString, vDescricaoFormaPagamento, vSequencialParaCupomFiscal : String;
   qPessoaContato, q_CNPJ_Insc_CPF_RG, vEndereco, vCNPJ_CPF, qRazaoSocial : String;
   vDesconto : Real;
   PEDIDO_CODIGO, ESTACAO_LOCAL_PDV, vCodBarras : String;
begin
   //Vergonhosamente eu utilizei o recurso RecortarColar da rotina ExportarParaFrenteDeLoja
   vQualPedidoEmString := IntToStr(qOrdemDeServico);

   with DTM1.IBQGenerica, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM SERVICOS WHERE ID_SERVICO=:PSERVICO');
      ParamByName('PSERVICO').Value := qOrdemDeServico;
      Open;
      if RecordCount = 0 then
      begin
         ShowMessage('Ordem de serviço não localizada');
         Abort;
      end;
      vDescricaoFormaPagamento := DTM1.IBQGenerica.FieldByName('DESCRICAO_FORMA_DE_PAGAMENTO').AsString;
      vDesconto := DTM1.IBQGenerica.FieldByName('DESCONTO').AsFloat;
   end;

   //Descobrindo dados do cliente:
   with DTM1.IBQGenerica2, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RAZAO_SOCIAL, PESSOA_P_CONTATO, CNPJ, CPF, INSC_ESTADUAL, ');
      Add('END_LOGRADOURO, END_NUMERO, END_ANDAR, END_COMPLEMENTO, ');
      Add('END_BAIRRO, END_CIDADE, END_CEP, END_UF ');
      Add('FROM CLIENTES WHERE ID_CLIENTE=:P1');
      ParamByName('P1').Value := DTM1.IBQGenerica.FieldByName('ID_CLIENTE').AsInteger;
      Open;
      qPessoaContato := '';
      q_CNPJ_Insc_CPF_RG := '';
      vEndereco := '';
      vCNPJ_CPF := '';
      qRazaoSocial := '';
      if recordcount <> 0 then
      begin
         qRazaoSocial := trim(SemAcentosNemCedilhas(FieldByName('RAZAO_SOCIAL').AsString));
         qPessoaContato := FieldByName('PESSOA_P_CONTATO').AsString;
         q_CNPJ_Insc_CPF_RG := FieldByName('INSC_ESTADUAL').AsString;
         //Por enquanto não estou imprimindo o CNPJ na Impressora Fiscal
         if trim(DTM1.IBQGenerica2.FieldByName('CNPJ').AsString) <> '' then
            vCNPJ_CPF := ' ' + DTM1.IBQGenerica2.FieldByName('CNPJ').AsString
         else
            vCNPJ_CPF := ' ' + DTM1.IBQGenerica2.FieldByName('CPF').AsString;

         vEndereco := frmLogin.EnderecoMontadoComSetentaENoveCaracteres(
                          DTM1.IBQGenerica2.FieldByName('END_LOGRADOURO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_NUMERO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_ANDAR').AsInteger,
                          DTM1.IBQGenerica2.FieldByName('END_COMPLEMENTO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_BAIRRO').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_CIDADE').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_CEP').AsString,
                          DTM1.IBQGenerica2.FieldByName('END_UF').AsString
                                                              );

         vEndereco := trim(SemAcentosNemCedilhas(vEndereco));

      end;
      DTM1.IBQGenerica2.Close;
   end;
   vCNPJ_CPF := copy(vCNPJ_CPF,1,29);
   qRazaoSocial := copy(qRazaoSocial,1,30);
   vEndereco := copy(vEndereco,1,79);

   //Quanto aos ítens:
   With DTM1.IBQGenerica3, SQL do
   begin
      Close;
      Clear;
      Add('SELECT * FROM SERVICOS_ITENS ');
      Add('WHERE ID_SERVICO=:P_ID_SERVICO');
      Add(' AND ID_PRODUTO IS NOT NULL');
      ParamByName('P_ID_SERVICO').Value := qOrdemDeServico;;
      Open;
      if recordcount = 0 then
      begin
         ShowMessage('Este pedido não possui nenhum ítem');
         Abort;
      end;
   end;

   PEDIDO_CODIGO := 'P00' + vQualPedidoEmString;
   DTM1.CDS_Generico.Close;
   with DTM1.CDS_Generico do
   Begin
      filename:=(frmLogin.pEstacaoTrabalhoPDV +'\' + PEDIDO_CODIGO + '.xml');
      if  FileExists(filename) then
      begin
         DeleteFile(filename);
      end;
   end;

   with DTM1.CDS_Generico do
   Begin
      filename:=(frmLogin.pEstacaoTrabalhoPDV +'\' + PEDIDO_CODIGO+'.xml');
      if not FileExists(filename) then
         createdataset;

      open;
   end;

   //Gerando o sequencial da pré venda para o cupom fiscal
   with DTM1.IBQGenerica4, SQL do
   begin
      Close;
      Clear;
      Add('SELECT GEN_ID(NOVO_ID_PREVENDA_P_CUPOM_F,1) FROM RDB$DATABASE');
      Open;
      vSequencialParaCupomFiscal := IntToStr(Fields[0].AsInteger + 1);
      Close;
   end;

   DTM1.IBQGenerica3.First;
   while not DTM1.IBQGenerica3.Eof do
   begin
      DTM1.CDS_Generico.Insert; //Obs:Pode ser usado DBEXPRESS ou comp que trabalhar para acesso a seu banco
      //DTM1.CDS_Generico.FieldByname('N_ORC').AsString:=vQualPedidoEmString;
      //DTM1.CDS_Generico.FieldByname('CODBARRAS').AsString:=vQualPedidoEmString;
      DTM1.CDS_Generico.FieldByname('N_ORC').AsString:=vSequencialParaCupomFiscal;
      vCodBarras := trim(IntToStr(DTM1.IBQGenerica3.FieldByname('ID_PRODUTO').AsInteger));
      DTM1.CDS_Generico.FieldByname('CODBARRAS').AsString:=vCodBarras;

      DTM1.CDS_Generico.FieldByname('QUANTIDADE').Value:=DTM1.IBQGenerica3.FieldByname('QUANTIDADE').Value;
      DTM1.CDS_Generico.FieldByname('USUARIO').AsString:='master';//CDS_Orcamento.FieldByname('NOME DO CAMPO EM SUA TABELA OU FIXO COMO ESTA').AsString;
      DTM1.CDS_Generico.FieldByname('DATA').Value:=Date; //ou data do orçamento gerado//Table_Orcamento.FieldByname('NOME DO CAMPO ').AsString;
      DTM1.CDS_Generico.FieldByname('CPF_CNPJ').AsString:=vCNPJ_CPF;
      DTM1.CDS_Generico.FieldByname('NOME_RAZAO').AsString:=qRazaoSocial;
      //------Desconto ou acréscimo no item do Pedido/Orçamento-------
      DTM1.CDS_Generico.FieldByname('ACR_DESC').AsString:='D';//CDS_Orcamento.FieldByname('ACR_DESC').Value;
      DTM1.CDS_Generico.FieldByname('TIPO_ACR_DESC').AsString:='$';//CDS_Orcamento.FieldByname('TIPO_ACR_DESC').Value;
      DTM1.CDS_Generico.FieldByname('VALOR_ACR_DESC').Value:='00,00';//CDS_Orcamento.FieldByname('VAL_DES').Value;
      //--------------------------------------------------------------
      DTM1.CDS_Generico.FieldByname('PRECO').Value:=DTM1.IBQGenerica3.FieldByname('VALOR_UNITARIO').Value; //preço atualizado para atualizar automaticamente base off line
      DTM1.CDS_Generico.FieldByname('ESTOQUE').Value:=1;//CDS_Orcamento.FieldByname('ESTOQUE').Value; // Mantem estoque Sold PDV atualizado
      DTM1.CDS_Generico.FieldByname('DESCRICAO').Value:=copy(DTM1.IBQGenerica3.FieldByname('DESCRICAO').AsString,1,100);
      //------Desconto ou acrescimo no subtotal do Pedido/Orçamento----
      DTM1.CDS_Generico.FieldByname('Sub_AcreDesc').AsString:='D'; //Desconto no subtotal D ou A para acrescimo
      DTM1.CDS_Generico.FieldByname('Sub_TipoAcreDesc').AsString:='$';//Desconto por valor $ ou % para percentual
      DTM1.CDS_Generico.FieldByname('Sub_ValorAcreDesc').Value:=0.00; // Valor do desconto ou 00,00 zero quando nao houver
      //---------------------------------------------------------------
      DTM1.CDS_Generico.Post;
      DTM1.IBQGenerica3.Next;
   end;
   DTM1.CDS_Generico.Close;
   //Final da rotina de exportação

   GravarQueCupomFiscalFoiImpresso(qOrdemDeServico, 'SERVICOS','ID_SERVICO');

end;

function ExisteRegistroNaTabela(qValor:Variant;qEmQualCampo,qEmQualTabela,qTipoDeValor:String):Boolean;
var
   v_qValorInteger : Integer;
   v_qValorString : String;
begin
   With DTM1.IBQGenerica5, SQL do
   begin
      Close;
      Clear;
      Add('SELECT ' + qEmQualCampo + ' FROM ' + qEmQualTabela  );
      Add(' WHERE ' + qEmQualCampo + ' = ');
      if AnsiUpperCase(qTipoDeValor) = 'INTEGER' then
      begin
         v_qValorInteger := qValor;
         Add(IntToStr(v_qValorInteger));
      end
      else if AnsiUpperCase(qTipoDeValor) = 'STRING' then
      begin
         v_qValorString := qValor;
         Add( ':PVALOR_EM_STRING ');
         ParamByName('PVALOR_EM_STRING').Value := v_qValorString;
      end
      else
         ShowMessage('Mensagem 46PAPEC' + #13 + 'Rotina imprevista para esse tipo de campo');

      //ShowMessage(DTM1.IBQGenerica5.SQL.Text);
      try
         Open;
         if RecordCount = 0 then
            Result := False
         else
            Result := True;
       except
          ShowMessage('Rotina imprevista 64EW2');
          Result := False;
      end;
      DTM1.IBQGenerica5.Close;
   end;
end;

function UltimoDiaDoMesAnterior(qData:tDateTime):tDateTime;
var
   vAno, vMes, vDia: Word;
   vUltimoDia : tDateTime;
begin
   try
      DecodeDate(qData, vAno, vMes, vDia);
      if vMes = 1 then
      begin
         vMes := 12;
         vAno := vAno - 1;
      end
      else
         vMes := vMes - 1;

      vUltimoDia := StrToDate('28/' + IntToStr(vMes) + '/' + IntToStr(vAno))
   except
      vUltimodia := StrToDate('01/01/1900');
   end;
   DecodeDate(vUltimoDia + 1, vAno, vMes, vDia);
   if vDia <> 1 then
   begin
      vUltimoDia := vUltimoDia + 1;
      DecodeDate(vUltimoDia + 1, vAno, vMes, vDia);
      if vDia <> 1 then
      begin
         vUltimoDia := vUltimoDia + 1;
         DecodeDate(vUltimoDia + 1, vAno, vMes, vDia);
         if vDia <> 1 then
            vUltimoDia := vUltimoDia + 1;
      end;
   end;

   Result := vUltimoDia;
end;

procedure GravarQueCupomFiscalFoiImpresso(q_ID:Integer; qArquivo,qCampoChave:String);
begin
   if not DTM1.IBTransaction1.InTransaction then
      DTM1.IBTransaction1.StartTransaction;

   with DTM1.IBSQLGenerico do
   begin
      SQL.Clear;
      SQL.Add('UPDATE ');
      SQL.Add(qArquivo);
      SQL.Add(' SET IMPRIMIU_CF =:P1 WHERE ');
      SQL.Add( qCampoChave );
      SQL.Add('=:P_ID');
      ParamByName('P1').Value := 'S';
      ParamByName('P_ID').Value := q_ID;
      try
         Prepare;
         ExecQuery;
         DTM1.IBTransaction1.CommitRetaining;
      except
         DTM1.IBTransaction1.RollbackRetaining;
         ShowMessage('Mensagem 5TERR31:' + #13 + 'Sistema não conseguiu registrar que cupom fiscal foi impresso');
      end;
   end;
end;

function TodosOsItensIraoPermitirImpressaoDeCupomFiscal(vQualPedidoOuServico:Integer;vPedidosOuServicos:String):Boolean;
var
   cAliquota, vConfirm : String;
begin
   Result := True;
   if vPedidosOuServicos = 'Pedidos' then
   begin
      with DTM1.IBQGenerica5, SQL do
      begin
         Close;
         Clear;
         Add('SELECT PI.ID_PEDIDO, PI.ID_PRODUTO,  ');
         Add('PI.QUANTIDADE, PI.VALOR_UNITARIO, ');
         Add('P.ALIQUOTA_ICMS ');

         Add(' FROM PEDIDOS_ITENS PI ');

         Add('LEFT OUTER JOIN PRODUTOS P ON P.ID_PRODUTO = PI.ID_PRODUTO ');

         Add('WHERE ');
         Add('PI.ID_PEDIDO=:P_ID_PEDIDO ');
         ParamByName('P_ID_PEDIDO').Value := vQualPedidoOuServico;
         Open;
      end;
   end
   else
   begin
      with DTM1.IBQGenerica5, SQL do
      begin
         Close;
         Clear;
         Add('SELECT OSI.ID_SERVICO, OSI.ID_PRODUTO,  ');
         Add('OSI.QUANTIDADE, OSI.VALOR_UNITARIO, ');
         Add('P.ALIQUOTA_ICMS ');

         Add(' FROM SERVICOS_ITENS OSI ');

         Add('LEFT OUTER JOIN PRODUTOS P ON P.ID_PRODUTO = OSI.ID_PRODUTO ');

         Add('WHERE ');
         Add('OSI.ID_SERVICO=:P_ID_SERVICO ');
         ParamByName('P_ID_SERVICO').Value := vQualPedidoOuServico;
         Open;
      end;
   end ;

   while not DTM1.IBQGenerica5.Eof do
   begin

      cAliquota := trim(FloatToStr(DTM1.IBQGenerica5.FieldByName('ALIQUOTA_ICMS').AsFloat * 100));

      if length(cAliquota) > 4 then
      begin
         ShowMessage('Inconsistência NRX4A3: ' + #13 + 'alíquota do ICMS não pode ser maior que 99');
         Result := False;
      end;
      {
      else if length(cAliquota) = 4 then
         cAliquota := cAliquota
      else if length(cAliquota) = 3 then
         cAliquota := '0' + cAliquota
      else if length(cAliquota) = 2 then
         cAliquota := '00' + cAliquota
      else if length(cAliquota) = 1 then
         cAliquota := '000' + cAliquota
      else
         cAliquota := 'II';

      if cAliquota = '0000' then
         cAliquota := 'II';  // Para forçar a alíquota isenta

      if (cAliquota = '9999') or (cAliquota = '9900') then
         cAliquota := 'FF';  //FF é um código interpretado pela Bematech como Substituição tributária

      if (cAliquota = '8888') or (cAliquota = '8800') then
         cAliquota := 'NN';  //FF é um código interpretado pela Bematech como Substituição tributária

      if (cAliquota <> 'II') and (cAliquota <> 'FF') and (cAliquota <> 'NN') then
      begin
         cAliquota := copy(cAliquota,1,2) + ',' + copy(cAliquota,3,2);
         if Aliquota_Esta_Em_Parametros(cAliquota) = false then
         begin
            ShowMessage('Alíquota do ICMS não registrada na Impressora Fiscal e/ou no parâmetro 86' + #13 +
             'Produto: ' + IntToStr(DTM1.IBQGenerica5.FieldByName('ID_PRODUTO').AsInteger));
            //Result := False;
         end;
      end;
      }
      if DTM1.IBQGenerica5.FieldByName('QUANTIDADE').AsFloat = 0 then
      begin
         ShowMessage('Inconsistência FEX282: ' + #13 + 'Quantidade inválida');
         Result := False;
      end ;

      if DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat = 0 then
      begin
         ShowMessage('Inconsistência TXP63A: ' + #13 + 'Valor unitário inválido');
         Result := False;
      end;

      if DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat > 1000 then
      begin
         ShowMessage('Há um ítem cujo valor unitário é maior que 1000');
         vConfirm := 'N' ;
         if InputQuery('Confirmação de alto valor','Confirma valor unitário > 1000,00 ?',vConfirm) = False then
            Result := False;

         if AnsiUpperCase(vConfirm) <> 'S' then
            Result := False;

      end;

      if DTM1.IBQGenerica5.FieldByName('VALOR_UNITARIO').AsFloat * DTM1.IBQGenerica5.FieldByName('QUANTIDADE').AsFloat > 1000 then
      begin
         ShowMessage('Há um ítem cujo valor unitário * qtde será maior que 1000');
         vConfirm := 'N';
         if InputQuery('Confirmação de alto valor','Confirma boleto > 1000,00 ?',vConfirm) = False then
            Result := False;

         if AnsiUpperCase(vConfirm) <> 'S' then
            Result := False;

      end;


      DTM1.IBQGenerica5.Next;
   end;
   DTM1.IBQGenerica5.Close;

end;

function StrToDataEmFormatoIngles(qStr:String):String;
var
   dia,mes,ano:Word;
   vDiaString, vAnoString : String;
begin
   try
      DecodeDate(StrToDate(qStr),ano,mes,dia);
   except
      ShowMessage('Data inválida');
      dia := 31;
      mes := 12;
      ano := 2999;
   end;
   vDiaString := IntToStr(dia);
   if dia < 10 then
      vDiaString := '0' + vDiaString;

   vAnoString :=IntToStr(Ano);

   if mes = 1 then
      Result := vDiaString + '-JAN-' + vAnoString;

   if mes = 2 then
      Result := vDiaString + '-FEB-' + vAnoString;

   if mes = 3 then
      Result := vDiaString + '-MAR-' + vAnoString;

   if mes = 4 then
      Result := vDiaString + '-APR-' + vAnoString;

   if mes = 5 then
      Result := vDiaString + '-MAY-' + vAnoString;

   if mes = 6 then
      Result := vDiaString + '-JUN-' + vAnoString;

   if mes = 7 then
      Result := vDiaString + '-JUL-' + vAnoString;

   if mes = 8 then
      Result := vDiaString + '-AUG-' + vAnoString;

   if mes = 9 then
      Result := vDiaString + '-SEP-' + vAnoString;

   if mes = 10 then
      Result := vDiaString + '-OCT-' + vAnoString;

   if mes = 11 then
      Result := vDiaString + '-NOV-' + vAnoString;

   if mes = 12 then
      Result := vDiaString + '-DEC-' + vAnoString;

end;

function Realizar_Esta_Conta_A_Receber(vID_A_Receber, vID_Conta_Corrente:Integer;
                                       vDataLiquidacao:tDateTime;
                                       vValor, vMulta, vJuros, vDescconto : Real;
                                       vDocumento, vDescricao:String;
                                       v_ID_MotivoDesconto:Integer;
                                       InserirEmContasCorrentes:Boolean):Boolean;
var
   vNConta : Integer;
   vOperacoesForamRealizadas : Boolean;
begin
   vOperacoesForamRealizadas := True;
   vNConta := vID_A_Receber;
   if vNConta = 0 then
   begin
      ShowMessage('Conta corrente não está preenchida ' + #13 +
                  'ou está igual a zero' + #13 + #13 +
                  'Operação não será realizada');
      vOperacoesForamRealizadas := False;
   end;

   if vOperacoesForamRealizadas = true then
   begin
      //Agora posso mudar o Status da conta a receber
      with DTM1.IBSQLGenerico2 do
      begin
         SQL.Clear;
         SQL.Add('UPDATE A_RECEBER SET DATA_REALIZADO=:P1, STATUS=:P2, VALOR_RECEBIDO=:P3, VALOR_MULTA=:PMULTA, VALOR_JUROS=:PJUROS, ID_MOTIVO_DE_DESCONTO=:P4 WHERE ID_A_RECEBER=:P5');
         ParamByName('P1').Value := vDataLiquidacao;
         ParamByName('P2').Value := 'Realizada';
//         ParamByName('P3').Value := vValor; Como estava.Daniel(28/12/2011)Solicita~ção GasNorte OS 3125
         ParamByName('P3').Value := ((vValor+vMulta+vJuros)-vDescconto);
         ParamByName('PMULTA').Value := vMulta;
         ParamByName('PJUROS').Value := vJuros;
         if v_ID_MotivoDesconto <> 0 then
            ParamByName('P4').Value := v_ID_MotivoDesconto
         else
            ParamByName('P4').Value := null;

         ParamByName('P5').Value := vID_A_Receber;
         try
            DTM1.IBSQLGenerico2.Prepare;
            DTM1.IBSQLGenerico2.ExecQuery;
         except
            DTM1.IBTransaction1.RollbackRetaining;
            ShowMessage('Operação não foi executada corretamente');
            vOperacoesForamRealizadas := False;
         end;
      end;
   end;

   if vOperacoesForamRealizadas = true then
   begin
      try
         DTM1.IBTransaction1.CommitRetaining;
      except
         DTM1.IBTransaction1.RollbackRetaining;
         ShowMessage('OPERAÇÃO NÃO FOI EXECUTADA');
         vOperacoesForamRealizadas := False;
      end;
   end;

   if (vOperacoesForamRealizadas = true) and (InserirEmContasCorrentes = true) then
   begin
      if InserirEmMovimentosContasCorrentes(vID_A_Receber, 0, vID_Conta_Corrente, vDataLiquidacao, vValor, vDocumento, vDescricao) = false then
      vOperacoesForamRealizadas := False;
   end;

   if vOperacoesForamRealizadas = true then
      Result := True
   else
      Result := False;

end;

function InserirEmMovimentosContasCorrentes(vID_A_Receber, vID_A_Receber_Itens, vID_Conta_Corrente:Integer; vDataLiquidacao:tDateTime; vValor:Real; vDocumento, vDescricao:String):Boolean;
begin

   Result := True;
   with DTM1.IBSQLGenerico do
   begin
      SQL.Clear;

      SQL.Add('insert into MOVIMENTOS_CONTAS_CORRENTES ');
      SQL.Add('(ID_MOVIMENTO_CONTA_CORRENTE, ID_CONTA_CORRENTE, DATA, ');
      SQL.Add('DOCUMENTO, DESCRICAO, VALOR, DEBITO_CREDITO, ');
      SQL.Add('STATUS, ID_PAGAR_RECEBER, ID_PAGAR_RECEBER_ITENS) ');
      SQL.Add('values ');
      SQL.Add('(:ID_MOVIMENTO_CONTA_CORRENTE, :ID_CONTA_CORRENTE, :DATA, ');
      SQL.Add(':DOCUMENTO, :DESCRICAO, :VALOR, :DEBITO_CREDITO, ');
      SQL.Add(':STATUS,:ID_PAGAR_RECEBER, :ID_PAGAR_RECEBER_ITENS) ');

      DTM1.IBSQLGenerico.ParamByName('ID_MOVIMENTO_CONTA_CORRENTE').AsInteger := 999999999 - frmLogin.P_ID_Usuario;
      ParamByName('ID_CONTA_CORRENTE').Value := vID_Conta_Corrente;
      ParamByName('DATA').Value := vDataLiquidacao;
      ParamByName('DOCUMENTO').Value := Copy(vDocumento,1,8);
      ParamByName('DESCRICAO').Value := Copy(vDescricao,1,35);
      ParamByName('VALOR').Value := vValor;
      ParamByName('DEBITO_CREDITO').Value := 'C';
      ParamByName('STATUS').Value := 'Realizada';
      ParamByName('ID_PAGAR_RECEBER').Value := vID_A_Receber;
      ParamByName('ID_PAGAR_RECEBER_ITENS').Value := vID_A_Receber_Itens;
      Prepare;
      ExecQuery;
      try
         DTM1.IBTransaction1.CommitRetaining;
      except
         DTM1.IBTransaction1.RollbackRetaining;
         ShowMessage('Não foi possível gravar em movimentações contas correntes');
         Result := False;
      end;
   end;

end;
//function InserirEmMovimentosContasCorrentes(vID_A_Receber, vID_Conta_Corrente:Integer; vDataLiquidacao:tDateTime; vValor:Real; vDocumento, vDescricao:String):Boolean;
//begin
//
//   Result := True;
//   with DTM1.IBSQLGenerico do
//   begin
//      SQL.Clear;
//
//      SQL.Add('insert into MOVIMENTOS_CONTAS_CORRENTES ');
//      SQL.Add('(ID_MOVIMENTO_CONTA_CORRENTE, ID_CONTA_CORRENTE, DATA, ');
//      SQL.Add('DOCUMENTO, DESCRICAO, VALOR, DEBITO_CREDITO, ');
//      SQL.Add('STATUS, ID_PAGAR_RECEBER) ');
//      SQL.Add('values ');
//      SQL.Add('(:ID_MOVIMENTO_CONTA_CORRENTE, :ID_CONTA_CORRENTE, :DATA, ');
//      SQL.Add(':DOCUMENTO, :DESCRICAO, :VALOR, :DEBITO_CREDITO, ');
//      SQL.Add(':STATUS,:ID_PAGAR_RECEBER) ');
//
//      DTM1.IBSQLGenerico.ParamByName('ID_MOVIMENTO_CONTA_CORRENTE').AsInteger := 999999999 - frmLogin.P_ID_Usuario;
//      ParamByName('ID_CONTA_CORRENTE').Value := vID_Conta_Corrente;
//      ParamByName('DATA').Value := vDataLiquidacao;
//      ParamByName('DOCUMENTO').Value := Copy(vDocumento,1,8);
//      ParamByName('DESCRICAO').Value := Copy(vDescricao,1,35);
//      ParamByName('VALOR').Value := vValor;
//      ParamByName('DEBITO_CREDITO').Value := 'C';
//      ParamByName('STATUS').Value := 'Realizada';
//      ParamByName('ID_PAGAR_RECEBER').Value := vID_A_Receber;
//      Prepare;
//      ExecQuery;
//      try
//         DTM1.IBTransaction1.CommitRetaining;
//      except
//         DTM1.IBTransaction1.RollbackRetaining;
//         ShowMessage('Não foi possível gravar em movimentações contas correntes');
//         Result := False;
//      end;
//   end;
//end;

function TbStrzero(const value, len: Integer): String;
var
   i: integer;
begin
   Result := Inttostr(value);
   I := Length(result);
   if I < len  then
      Result := TbReplChar('0', len-I)+ Result
   else if i > len then
      result := tbReplChar('*',len);
end;

function tbSpace(const len: integer):string;
begin
   result := tbReplChar(#32,len);
end;

function tbReplStr(const s: String; const len: Integer):String;
Begin
   Result := '';
   While length(result) < len do
      Result := Result + s;

   Result := copy(result,1,len);
end;

function tbReplChar(const ch: char; const len: integer):String;
var
   I: Integer;
Begin
   SetLength(result,len);
   for I:= 1 to len do
   Result [I] := ch;
End;


function Modulo11(vNumeroCalculoMod11:String):String;
var
   vPeso,vSoma,vPonteiro,vResto,vParteInteiraSoma:Integer;
   vdigitoNossoNumero:String;
begin
    vPeso:= 2;
    vSoma:= 0;
    vPonteiro:= length(vNumeroCalculoMod11);
    while vPonteiro >0 do
    begin
       vSoma:= vSoma + StrtoInt(copy(vNumeroCalculoMod11,vPonteiro,1)) * vPeso;
       vPonteiro:= vPonteiro - 1;
       vPeso:= vPeso + 1;
       if vPeso>7 then
          vPeso:= 2;
    end;
    vParteInteiraSoma:= Trunc(vSoma/11);
    vResto:= vSoma - (vParteInteiraSoma * 11);
    if vResto = 1 then
       vDigitoNossoNumero:= 'P'
    else if vResto = 0 then
       vDigitoNossoNumero:= '0'
    else
       vDigitoNossoNumero := InttoStr(11 - vResto);

    Result:= vDigitoNossoNumero;
end;

Procedure Retorno_Impressora;
  Var iACK, iST1, iST2, iST3: Integer;
  vLinhao : String;
  bRetornoEstendido : Boolean;
Begin
  //Copiei do ExemploDelphi mas efetuei diversas alterações
  iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;

  //Obs: Por enquanto sempre bRetornoEstendido é False pois ainda não sei utilizá-lo
  bRetornoEstendido := False;
  if bRetornoEstendido = true then
  begin
     if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
        iRetorno := Bematech_FI_RetornoImpressoraMFD( iACK, iST1, iST2, iST3 );
  end
  else
  begin
     if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 8) = 'BEMATECH' then
        iRetorno := Bematech_FI_RetornoImpressora( iACK, iST1, iST2 )
     else
     if Copy(frmLogin.pUtilizaEmissoraCupomFiscal, 3, 6) = 'DARUMA' then
        iRetorno := Daruma_FI_RetornoImpressora( iACK, iST1, iST2);
  end;

{
  RadioButton1.Checked := false; RadioButton2.Checked := false;
  label4.Enabled       := false; label5.Enabled       := false;
  label6.Enabled       := false; label7.Enabled       := false;
  label8.Enabled       := false; label9.Enabled       := false;
  label10.Enabled      := false; label11.Enabled      := false;
  label12.Enabled      := false; label13.Enabled      := false;
  label14.Enabled      := false; label15.Enabled      := false;
  label16.Enabled      := false; label17.Enabled      := false;
  label18.Enabled      := false; label19.Enabled      := false;
  frmPrincipal.Refresh;
}
  frmLogin.vImpressoraFiscalExecutouOComando := True;
  If iACK = 21 Then
  begin
     //RadioButton2.Checked := True;
     Application.MessageBox( 'A Impressora retornou NAK. O programa será abortado!', 'Erro', MB_IconError + MB_OK );
     frmLogin.vImpressoraFiscalExecutouOComando := False;
     //Application.Terminate;
     //Exit;
  end
  else if bRetornoEstendido = true then
     Application.MessageBox( pchar( 'ACK = 6, ST1 = ' + inttostr( iSt1 ) +
                                           ', ST2 = ' + inttostr( iSt2 ) +
                                           ', ST3 = ' + inttostr( iSt3 ) ), 'Retorno da Impressora', MB_IconInformation + MB_OK );

{
  If ( iACK = 6 ) then
  BEGIN
    RadioButton1.Checked := True;

    // Verifica ST1
    IF iST1 >= 128 Then BEGIN iST1 := iST1 - 128; label4.Enabled  := True; END;
    IF iST1 >= 64  Then BEGIN iST1 := iST1 - 64;  label5.Enabled  := True; END;
    IF iST1 >= 32  Then BEGIN iST1 := iST1 - 32;  label6.Enabled  := True; END;
    IF iST1 >= 16  Then BEGIN iST1 := iST1 - 16;  label7.Enabled  := True; END;
    IF iST1 >= 8   Then BEGIN iST1 := iST1 - 8;   label8.Enabled  := True; END;
    IF iST1 >= 4   Then BEGIN iST1 := iST1 - 4;   label9.Enabled  := True; END;
    IF iST1 >= 2   Then BEGIN iST1 := iST1 - 2;   label10.Enabled := True; END;
    IF iST1 >= 1   Then BEGIN iST1 := iST1 - 1;   label11.Enabled := True; END;

    // Verifica ST2
    IF iST2 >= 128 Then BEGIN iST2 := iST2 - 128; label12.Enabled := True; END;
    IF iST2 >= 64  Then BEGIN iST2 := iST2 - 64;  label13.Enabled := True; END;
    IF iST2 >= 32  Then BEGIN iST2 := iST2 - 32;  label14.Enabled := True; END;
    IF iST2 >= 16  Then BEGIN iST2 := iST2 - 16;  label15.Enabled := True; END;
    IF iST2 >= 8   Then BEGIN iST2 := iST2 - 8;   label16.Enabled := True; END;
    IF iST2 >= 4   Then BEGIN iST2 := iST2 - 4;   label17.Enabled := True; END;
    IF iST2 >= 2   Then BEGIN iST2 := iST2 - 2;   label18.Enabled := True; END;
    IF iST2 >= 1   Then BEGIN iST2 := iST2 - 1;   label19.Enabled := True; END;
  End;

  frmPrincipal.Refresh;
}

//Ajuste que Adonis fez em 24/04/2009
   If ( iACK = 6 ) then
   begin
      vLinhao := '';
      // Verifica ST1
      IF iST1 >= 128 Then BEGIN iST1 := iST1 - 128; vLinhao := vLinhao + 'Impressora fiscal: Fim do papel' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST1 >= 64  Then BEGIN iST1 := iST1 - 64;  vLinhao := vLinhao + 'Impressora fiscal: Pouco papel' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST1 >= 32  Then BEGIN iST1 := iST1 - 32;  vLinhao := vLinhao + 'Impressora fiscal: Erro no relógio' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST1 >= 16  Then BEGIN iST1 := iST1 - 16;  vLinhao := vLinhao + 'Impressora fiscal em erro' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST1 >= 8   Then BEGIN iST1 := iST1 - 8;   vLinhao := vLinhao + 'Impressora fiscal: CMD não iniciado com ESC' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST1 >= 4   Then BEGIN iST1 := iST1 - 4;   vLinhao := vLinhao + 'Impressora fiscal: Comando inexistente' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST1 >= 2   Then BEGIN iST1 := iST1 - 2;   vLinhao := vLinhao + 'Impressora fiscal: Cupom aberto. Para continuar, cancele o cupom anterior.' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST1 >= 1   Then BEGIN iST1 := iST1 - 1;   vLinhao := vLinhao + 'Impressora fiscal: Número de parâmetros inválidos' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;

      // Verifica ST2
      IF iST2 >= 128 Then BEGIN iST2 := iST2 - 128; vLinhao := vLinhao + 'Impressora fiscal: Tipo de parâmetro inválido' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST2 >= 64  Then BEGIN iST2 := iST2 - 64;  vLinhao := vLinhao + 'Impressora fiscal: Memória fiscal lotada' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST2 >= 32  Then BEGIN iST2 := iST2 - 32;  vLinhao := vLinhao + 'Impressora fiscal: CMOS não volátil' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST2 >= 16  Then BEGIN iST2 := iST2 - 16;  vLinhao := vLinhao + 'Impressora fiscal: Alíquota não programada' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST2 >= 8   Then BEGIN iST2 := iST2 - 8;   vLinhao := vLinhao + 'Impressora fiscal: Alíquotas lotadas' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST2 >= 4   Then BEGIN iST2 := iST2 - 4;   vLinhao := vLinhao + 'Impressora fiscal: Cancelamento não permitido' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST2 >= 2   Then BEGIN iST2 := iST2 - 2;   vLinhao := vLinhao + 'Impressora fiscal: CGC/IE não programados' + #13; frmLogin.vImpressoraFiscalExecutouOComando := False; END;
      IF iST2 >= 1   Then
      begin
         iST2 := iST2 - 1;
         vLinhao := vLinhao + 'Impressora fiscal: Comando não executado' + #13;
         frmLogin.vImpressoraFiscalExecutouOComando := False;
      end;
   end;
   if vLinhao <> '' then
   begin
      ShowMessage(vLinhao);
   end;
End;

//Esta função remove caracteres acentuados de uma string substituindo os mesmos pela sua versão não acentuada
function SemAcentosNemCedilhas_NFE(str: String): String;
var
i, j: Integer;
const
 com_acento: array[1..48] of char = ('á','é','í','ó','ú','à','è','ì','ò','ù','â','ê','î','ô','û','ä','ë','ï',
                'ö','ü','ã','õ','ñ','ç','Á','É','Í','Ó','Ú','À','È','Ì','Ò','Ù','Â','Ê',
                'Î','Ô','Û','Ä','Ë','Ï','Ö','Ü','Ã','Õ','Ñ','Ç');

 sem_acento: array[1..48] of char = ('a','e','i','o','u','a','e','i','o','u','a','e','i','o','u','a','e','i',
               'o','u','a','o','n','c','A','E','I','O','U','A','E','I','O','U','A','E',
               'I','O','U','A','E','I','O','U','A','O','N','C');
begin
 for i := 1 to Length (str) do
  for j := 0 to High(com_acento) do
   if com_acento[j] = str[i] then
    str[i] := sem_acento[j];

 result := str;
end;


function VerificaCfop(Cfop : string):boolean;
begin
   Result:= true;
   Cfop := Trim(Cfop);
   if (Cfop <> '1101') and (Cfop <> '1102') and (Cfop <> '1111') and (Cfop <> '1113') and
      (Cfop <> '1116') and (Cfop <> '1117') and (Cfop <> '1118') and (Cfop <> '1120') and
      (Cfop <> '1121') and (Cfop <> '1122') and (Cfop <> '1124') and (Cfop <> '1125') and
      (Cfop <> '1126') and (Cfop <> '2101') and (Cfop <> '2102') and (Cfop <> '2111') and
      (Cfop <> '2113') and (Cfop <> '2116') and (Cfop <> '2117') and (Cfop <> '2118') and
      (Cfop <> '2120') and (Cfop <> '2121') and (Cfop <> '2122') and (Cfop <> '2124') and
      (Cfop <> '2125') and (Cfop <> '2126') and (Cfop <> '3101') and (Cfop <> '3102') and
      (Cfop <> '3126') and (Cfop <> '3127') and (Cfop <> '1151') and (Cfop <> '1152') and
      (Cfop <> '1153') and (Cfop <> '1154') and (Cfop <> '2151') and (Cfop <> '2152') and
      (Cfop <> '2153') and (Cfop <> '2154') and (Cfop <> '1201') and (Cfop <> '1202') and
      (Cfop <> '1203') and (Cfop <> '1204') and (Cfop <> '1205') and (Cfop <> '1206') and
      (Cfop <> '1207') and (Cfop <> '1208') and (Cfop <> '1209') and (Cfop <> '2201') and
      (Cfop <> '2202') and (Cfop <> '2203') and (Cfop <> '2204') and (Cfop <> '2205') and
      (Cfop <> '2206') and (Cfop <> '2207') and (Cfop <> '2208') and (Cfop <> '2209') and
      (Cfop <> '3201') and (Cfop <> '3202') and (Cfop <> '3205') and (Cfop <> '3206') and
      (Cfop <> '3207') and (Cfop <> '3211') and (Cfop <> '1251') and (Cfop <> '1252') and
      (Cfop <> '1253') and (Cfop <> '1254') and (Cfop <> '1255') and (Cfop <> '1256') and
      (Cfop <> '1257') and (Cfop <> '2251') and (Cfop <> '2252') and (Cfop <> '2253') and
      (Cfop <> '2254') and (Cfop <> '2255') and (Cfop <> '2256') and (Cfop <> '2257') and
      (Cfop <> '3251') and (Cfop <> '1301') and (Cfop <> '1302') and (Cfop <> '1303') and
      (Cfop <> '2301') and (Cfop <> '2302') and (Cfop <> '2303') and (Cfop <> '3301') and
      (Cfop <> '1304') and (Cfop <> '1305') and (Cfop <> '1306') and (Cfop <> '2304') and
      (Cfop <> '2305') and (Cfop <> '2306') and (Cfop <> '1351') and (Cfop <> '1352') and
      (Cfop <> '1353') and (Cfop <> '1354') and (Cfop <> '1355') and (Cfop <> '1356') and
      (Cfop <> '1360') and (Cfop <> '2351') and (Cfop <> '2352') and (Cfop <> '2353') and
      (Cfop <> '2354') and (Cfop <> '2355') and (Cfop <> '2356') and (Cfop <> '3351') and
      (Cfop <> '3352') and (Cfop <> '3353') and (Cfop <> '3354') and (Cfop <> '3355') and
      (Cfop <> '3356') and (Cfop <> '1401') and (Cfop <> '1403') and (Cfop <> '1406') and
      (Cfop <> '1407') and (Cfop <> '1408') and (Cfop <> '1409') and (Cfop <> '1410') and
      (Cfop <> '1411') and (Cfop <> '1414') and (Cfop <> '1415') and (Cfop <> '2401') and
      (Cfop <> '2403') and (Cfop <> '2406') and (Cfop <> '2407') and (Cfop <> '2408') and
      (Cfop <> '2409') and (Cfop <> '2410') and (Cfop <> '2411') and (Cfop <> '2414') and
      (Cfop <> '2415') and (Cfop <> '1451') and (Cfop <> '1452') and (Cfop <> '1501') and
      (Cfop <> '1503') and (Cfop <> '1504') and (Cfop <> '1505') and (Cfop <> '2501') and
      (Cfop <> '1506') and (Cfop <> '2503') and (Cfop <> '2504') and (Cfop <> '2505') and
      (Cfop <> '2506') and (Cfop <> '3503') and (Cfop <> '1551') and (Cfop <> '1552') and
      (Cfop <> '1553') and (Cfop <> '1554') and (Cfop <> '1555') and (Cfop <> '1556') and
      (Cfop <> '1557') and (Cfop <> '2551') and (Cfop <> '2552') and (Cfop <> '2553') and
      (Cfop <> '2554') and (Cfop <> '2555') and (Cfop <> '2556') and (Cfop <> '2557') and
      (Cfop <> '3551') and (Cfop <> '3553') and (Cfop <> '3556') and (Cfop <> '1601') and
      (Cfop <> '1602') and (Cfop <> '1603') and (Cfop <> '1604') and (Cfop <> '1605') and
      (Cfop <> '1651') and (Cfop <> '1652') and (Cfop <> '1653') and (Cfop <> '1658') and
      (Cfop <> '1659') and (Cfop <> '1660') and (Cfop <> '1661') and (Cfop <> '1662') and
      (Cfop <> '1663') and (Cfop <> '1664') and (Cfop <> '2603') and (Cfop <> '2651') and
      (Cfop <> '2652') and (Cfop <> '2653') and (Cfop <> '2658') and (Cfop <> '2659') and
      (Cfop <> '2660') and (Cfop <> '2661') and (Cfop <> '2662') and (Cfop <> '2663') and
      (Cfop <> '2664') and (Cfop <> '3651') and (Cfop <> '3652') and (Cfop <> '3653') and
      (Cfop <> '3930') and (Cfop <> '1901') and (Cfop <> '1902') and (Cfop <> '1903') and
      (Cfop <> '1904') and (Cfop <> '1905') and (Cfop <> '1906') and (Cfop <> '1907') and
      (Cfop <> '1908') and (Cfop <> '1909') and (Cfop <> '1910') and (Cfop <> '1911') and
      (Cfop <> '1912') and (Cfop <> '1913') and (Cfop <> '1914') and (Cfop <> '1915') and
      (Cfop <> '1916') and (Cfop <> '1917') and (Cfop <> '1918') and (Cfop <> '1919') and
      (Cfop <> '1920') and (Cfop <> '1921') and (Cfop <> '1922') and (Cfop <> '1923') and
      (Cfop <> '1924') and (Cfop <> '1925') and (Cfop <> '1926') and (Cfop <> '2901') and
      (Cfop <> '2902') and (Cfop <> '2903') and (Cfop <> '2904') and (Cfop <> '2905') and
      (Cfop <> '2906') and (Cfop <> '2907') and (Cfop <> '2908') and (Cfop <> '2909') and
      (Cfop <> '2910') and (Cfop <> '2911') and (Cfop <> '2912') and (Cfop <> '2913') and
      (Cfop <> '2914') and (Cfop <> '2915') and (Cfop <> '2916') and (Cfop <> '2917') and
      (Cfop <> '2918') and (Cfop <> '2919') and (Cfop <> '2920') and (Cfop <> '2921') and
      (Cfop <> '2922') and (Cfop <> '2923') and (Cfop <> '2924') and (Cfop <> '2925') and
      (Cfop <> '1931') and (Cfop <> '1932') and (Cfop <> '1933') and (Cfop <> '1949') and
      (Cfop <> '2931') and (Cfop <> '2932') and (Cfop <> '2933') and (Cfop <> '2949') and
      (Cfop <> '3949') and (Cfop <> '5101') and (Cfop <> '5102') and (Cfop <> '5103') and
      (Cfop <> '5104') and (Cfop <> '5105') and (Cfop <> '5106') and (Cfop <> '5109') and
      (Cfop <> '5110') and (Cfop <> '5111') and (Cfop <> '5112') and (Cfop <> '5113') and
      (Cfop <> '5114') and (Cfop <> '5115') and (Cfop <> '5116') and (Cfop <> '5117') and
      (Cfop <> '5118') and (Cfop <> '5119') and (Cfop <> '5120') and (Cfop <> '5122') and
      (Cfop <> '5123') and (Cfop <> '5124') and (Cfop <> '5125') and (Cfop <> '6101') and
      (Cfop <> '6102') and (Cfop <> '6103') and (Cfop <> '6104') and (Cfop <> '6105') and
      (Cfop <> '6106') and (Cfop <> '6107') and (Cfop <> '6108') and (Cfop <> '6109') and
      (Cfop <> '6110') and (Cfop <> '6111') and (Cfop <> '6112') and (Cfop <> '6113') and
      (Cfop <> '6114') and (Cfop <> '6115') and (Cfop <> '6116') and (Cfop <> '6117') and
      (Cfop <> '6118') and (Cfop <> '6119') and (Cfop <> '6120') and (Cfop <> '6122') and
      (Cfop <> '6123') and (Cfop <> '6124') and (Cfop <> '6125') and (Cfop <> '5151') and
      (Cfop <> '5152') and (Cfop <> '5153') and (Cfop <> '5155') and (Cfop <> '5156') and
      (Cfop <> '6151') and (Cfop <> '6152') and (Cfop <> '6153') and (Cfop <> '6155') and
      (Cfop <> '6156') and (Cfop <> '5201') and (Cfop <> '5202') and (Cfop <> '5205') and
      (Cfop <> '6201') and (Cfop <> '6202') and (Cfop <> '6205') and (Cfop <> '5209') and
      (Cfop <> '5206') and (Cfop <> '5207') and (Cfop <> '5208') and (Cfop <> '5210') and
      (Cfop <> '6206') and (Cfop <> '6207') and (Cfop <> '6208') and (Cfop <> '6209') and
      (Cfop <> '6210') and (Cfop <> '5251') and (Cfop <> '5252') and (Cfop <> '5253') and
      (Cfop <> '5254') and (Cfop <> '5255') and (Cfop <> '5256') and (Cfop <> '5257') and
      (Cfop <> '5258') and (Cfop <> '6251') and (Cfop <> '6252') and (Cfop <> '6253') and
      (Cfop <> '6254') and (Cfop <> '6255') and (Cfop <> '6256') and (Cfop <> '6257') and
      (Cfop <> '6258') and (Cfop <> '5302') and (Cfop <> '5303') and (Cfop <> '5304') and
      (Cfop <> '5301') and (Cfop <> '5305') and (Cfop <> '5306') and (Cfop <> '5307') and
      (Cfop <> '6301') and (Cfop <> '6302') and (Cfop <> '6303') and (Cfop <> '6304') and
      (Cfop <> '6305') and (Cfop <> '6306') and (Cfop <> '6307') and (Cfop <> '5351') and
      (Cfop <> '5352') and (Cfop <> '5353') and (Cfop <> '5354') and (Cfop <> '5355') and
      (Cfop <> '5356') and (Cfop <> '5357') and (Cfop <> '5359') and (Cfop <> '5360') and
      (Cfop <> '6351') and (Cfop <> '6352') and (Cfop <> '6353') and (Cfop <> '6354') and
      (Cfop <> '6355') and (Cfop <> '6356') and (Cfop <> '6357') and (Cfop <> '6359') and
      (Cfop <> '6360') and (Cfop <> '5402') and (Cfop <> '5403') and (Cfop <> '5405') and
      (Cfop <> '5401') and (Cfop <> '5408') and (Cfop <> '5409') and (Cfop <> '6401') and
      (Cfop <> '6402') and (Cfop <> '6403') and (Cfop <> '6404') and (Cfop <> '6408') and
      (Cfop <> '6409') and (Cfop <> '5410') and (Cfop <> '5411') and (Cfop <> '5412') and
      (Cfop <> '5413') and (Cfop <> '5414') and (Cfop <> '5415') and (Cfop <> '6410') and
      (Cfop <> '6411') and (Cfop <> '6412') and (Cfop <> '6413') and (Cfop <> '6414') and
      (Cfop <> '6415') and (Cfop <> '5451') and (Cfop <> '5501') and (Cfop <> '5502') and
      (Cfop <> '5503') and (Cfop <> '5504') and (Cfop <> '5505') and (Cfop <> '6501') and
      (Cfop <> '6502') and (Cfop <> '6503') and (Cfop <> '6504') and (Cfop <> '6505') and
      (Cfop <> '5551') and (Cfop <> '5552') and (Cfop <> '5553') and (Cfop <> '5554') and
      (Cfop <> '5555') and (Cfop <> '5556') and (Cfop <> '5557') and (Cfop <> '5601') and
      (Cfop <> '5602') and (Cfop <> '5603') and (Cfop <> '5605') and (Cfop <> '5606') and
      (Cfop <> '5651') and (Cfop <> '5652') and (Cfop <> '5653') and (Cfop <> '5654') and
      (Cfop <> '5655') and (Cfop <> '5656') and (Cfop <> '5657') and (Cfop <> '5658') and
      (Cfop <> '5659') and (Cfop <> '5660') and (Cfop <> '5661') and (Cfop <> '5662') and
      (Cfop <> '5663') and (Cfop <> '5664') and (Cfop <> '5665') and (Cfop <> '6551') and
      (Cfop <> '6552') and (Cfop <> '6553') and (Cfop <> '6554') and (Cfop <> '6555') and
      (Cfop <> '6556') and (Cfop <> '6557') and (Cfop <> '6603') and (Cfop <> '6651') and
      (Cfop <> '6652') and (Cfop <> '6653') and (Cfop <> '6654') and (Cfop <> '6655') and
      (Cfop <> '6656') and (Cfop <> '6657') and (Cfop <> '6658') and (Cfop <> '6659') and
      (Cfop <> '6660') and (Cfop <> '6661') and (Cfop <> '6662') and (Cfop <> '6663') and
      (Cfop <> '6664') and (Cfop <> '6665') and (Cfop <> '5901') and (Cfop <> '5902') and
      (Cfop <> '5903') and (Cfop <> '5904') and (Cfop <> '5905') and (Cfop <> '5906') and
      (Cfop <> '5907') and (Cfop <> '5908') and (Cfop <> '5909') and (Cfop <> '5910') and
      (Cfop <> '5911') and (Cfop <> '5912') and (Cfop <> '5913') and (Cfop <> '5914') and
      (Cfop <> '5915') and (Cfop <> '5916') and (Cfop <> '5917') and (Cfop <> '5918') and
      (Cfop <> '5919') and (Cfop <> '5920') and (Cfop <> '5921') and (Cfop <> '5922') and
      (Cfop <> '5923') and (Cfop <> '5924') and (Cfop <> '5925') and (Cfop <> '5926') and
      (Cfop <> '5927') and (Cfop <> '5928') and (Cfop <> '5929') and (Cfop <> '5931') and
      (Cfop <> '5932') and (Cfop <> '5933') and (Cfop <> '5949') and (Cfop <> '6901') and
      (Cfop <> '6902') and (Cfop <> '6903') and (Cfop <> '6904') and (Cfop <> '6905') and
      (Cfop <> '6906') and (Cfop <> '6907') and (Cfop <> '6908') and (Cfop <> '6909') and
      (Cfop <> '6910') and (Cfop <> '6911') and (Cfop <> '6912') and (Cfop <> '6913') and
      (Cfop <> '6914') and (Cfop <> '6915') and (Cfop <> '6916') and (Cfop <> '6917') and
      (Cfop <> '6918') and (Cfop <> '6919') and (Cfop <> '6920') and (Cfop <> '6921') and
      (Cfop <> '6922') and (Cfop <> '6923') and (Cfop <> '6924') and (Cfop <> '6925') and
      (Cfop <> '6929') and (Cfop <> '6931') and (Cfop <> '6932') and (Cfop <> '6933') and
      (Cfop <> '6949') then
   else
   Result := false;
end;

procedure ExcluirTabelaSePrecisar(qTabela:String);
var
   vPrecisaExcluir : Boolean;
   vMinhaQuery : TSQLQuery;
begin
   //Primeiro, verificar se existe a tabela
   vMinhaQuery := TSQLQuery.Create(nil);
   with vMinhaQuery, SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND RDB$RELATION_NAME =:PTABELA ');
      ParamByName('PTABELA').Value := qTabela;
      Open;
      if recordCount = 1 then
         vPrecisaExcluir := True
      else
         vPrecisaExcluir := False;

      Close;
   end;

   if vPrecisaExcluir = True then
   begin
      with vMinhaQuery do
      begin
         SQL.Clear;
         SQL.CommaText := 'BEGIN TRANSACTION';
         SQL.Add('DROP TABLE ' + qTabela);
         try
           ExecSQL(True);
         except
            ShowMessage('Não foi possível excluir a tabela: ' + #13 +
                         qTabela);
          end;
      end;
   end;
   FreeAndNil(vMinhaQuery);
end;
end.
