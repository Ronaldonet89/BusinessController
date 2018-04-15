unit UntPackage;

interface
  uses System.SysUtils, System.Classes, Data.DB, IBCustomDataSet, IBDatabase, IBQuery,IBSQL,
  Datasnap.DBClient,vcl.dialogs,Variants,Forms,
  Data.DBXFirebird, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr;

  function TrocaVirgulaPorPonto(qValor:string):string;
  procedure CriarTabelaSePrecisar(qTabela,qString:String);
  procedure CriarGeneratorSePrecisar(qGenerator,qString,qString2: String);
  procedure CriarChavePrimariaSePrecisar(qTabela,qChavePrimaria,qString:String);
  procedure CriarCampoSePrecisar(qTabela, qCampo, qString : String);
  function SemPontosNemTracinhos(qString:String):String;
  function SemAcentosNemCedilha(qString:String):String;
  function CepFormatado(qString:string):string;
implementation

uses UDSModuleDb;
function TrocaVirgulaPorPonto(qValor:string):string;
var
  valorInicial,vValorFinal : string;
  vTamanho,vContador : Integer;
begin
  vValorFinal := '';
  vTamanho := Length(qValor);
  vContador := 1;
  while vContador <= vTamanho do
  begin
    valorInicial := Copy(qValor,vContador,1);
    if valorInicial[1] in ['0'..'9'] then
    begin
      vValorFinal := vValorFinal + Copy(qValor,vContador,1);
    end
    else
    if valorInicial = ',' then
      vValorFinal := vValorFinal + '.';
    valorInicial := '';
    Inc(vContador);
  end;
  vTamanho := 0;
  vTamanho := Length(vValorFinal);
  if vTamanho = 3 then
    vValorFinal := vValorFinal +'0';
  Result := vValorFinal;
end;

procedure CriarTabelaSePrecisar(qTabela,qString:String);
var
   Transacao : TTransactionDesc;
   vPrecisaInserir : Boolean;
   vMinhaSQLDataSet : TSQLDataSet;
   vMinhaQuery : TSQLQuery;
begin
   vMinhaSQLDataSet := TSQLDataSet.Create(nil);
   vMinhaSQLDataSet.SQLConnection := DSModuleDb.SQLConexao;

   vMinhaQuery := TSQLQuery.Create(nil);
   vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
   //Primeiro, verificar se existe a tabela
   with vMinhaQuery,SQL do
   begin
      Close;
      Clear;
      Add('SELECT RDB$RELATION_NAME AS TABELA ');
      Add('FROM RDB$RELATIONS ');
      Add('WHERE ((RDB$SYSTEM_FLAG = 0) ');
      Add('OR (RDB$SYSTEM_FLAG IS NULL)) ');
      Add('AND (RDB$VIEW_SOURCE IS NULL) ');
      Add('AND UPPER(RDB$RELATION_NAME) =:PTABELA ');
      ParamByName('PTABELA').Value := AnsiUpperCase(qTabela);
      Open;
   end;
   if vMinhaQuery.FieldByName('TABELA').AsString <> '' then
     vPrecisaInserir := False
   else
     vPrecisaInserir := True;

   if vPrecisaInserir = True then
   begin

      with vMinhaSQLDataSet do
      begin
         Close;
         CommandText := qString;
         Transacao.TransactionID := 1;
         Transacao.IsolationLevel := xilREADCOMMITTED;
         DSModuleDb.SQLConexao.StartTransaction(Transacao);
         try
            ExecSQL();
            DSModuleDb.SQLConexao.Commit(Transacao);
         except
            DSModuleDb.SQLConexao.Rollback(Transacao);
            ShowMessage('N�o foi poss�vel criar a tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
   FreeAndNil(vMinhaSQLDataSet);
   FreeAndNil(vMinhaQuery);
end;

procedure CriarGeneratorSePrecisar(qGenerator,qString,qString2: String);
var
   vPrecisaInserir : Boolean;
   vMinhaQuery : TSQLDataSet;
   Transacao : TTransactionDesc;
begin
   vMinhaQuery := TSQLDataSet.Create(nil);
   vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;

   //Primeira coisa a saber, � se ele existe:
   with vMinhaQuery do
   begin
      Close;
      CommandText := 'SELECT * FROM RDB$GENERATORS '+
                     'WHERE (RDB$SYSTEM_FLAG IS NULL OR RDB$SYSTEM_FLAG = 0) '+
                     'AND RDB$GENERATOR_NAME=:PNOME';
      ParamByName('PNOME').Value := qGenerator ;
      Open;
   end;
      if vMinhaQuery.FieldByName('RDB$GENERATOR_NAME').AsString <> '' then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;

   if vPrecisaInserir = True then
   begin
      with vMinhaQuery do
      begin
         Close;
         CommandText := qString;
         Transacao.TransactionID := 1;
         Transacao.IsolationLevel := xilREADCOMMITTED;
         DSModuleDb.SQLConexao.StartTransaction(Transacao);
         try
            ExecSQL();
            DSModuleDb.SQLConexao.Commit(Transacao);
         except
            DSModuleDb.SQLConexao.Rollback(Transacao);
            ShowMessage('N�o foi poss�vel criar o generator: ' + #13 +
                         qGenerator);
         end;
      end;
   end;
   FreeAndNil(vMinhaQuery);
end;

procedure CriarChavePrimariaSePrecisar(qTabela,qChavePrimaria,qString:String);
var
   vPrecisaInserir : Boolean;
   vMinhaQuery : TSQLDataSet;
   Transacao : TTransactionDesc;
begin
   vMinhaQuery := TSQLDataSet.Create(nil);
   vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;

   //Verificando se existe:
   with vMinhaQuery do
   begin
      Close;
      commandtext := ' SELECT * FROM RDB$RELATION_CONSTRAINTS '+
                     ' WHERE RDB$CONSTRAINT_TYPE=:P1 AND RDB$RELATION_NAME=:P2';
      ParamByName('P1').Value := 'PRIMARY KEY';
      ParamByName('P2').Value := qTabela;
      Open;
   end;
      if vMinhaQuery.FieldByName('RDB$CONSTRAINT_NAME').AsString <> '' then
         vPrecisaInserir := False
      else
         vPrecisaInserir := True;
//   vPrecisaInserir := True;
   if vPrecisaInserir = True then
   begin
      with vMinhaQuery do
      begin
         Close;
         CommandText := qString;
         Transacao.TransactionID := 1;
         Transacao.IsolationLevel := xilREADCOMMITTED;
         DSModuleDb.SQLConexao.StartTransaction(Transacao);
         try
            ExecSQL();
            DSModuleDb.SQLConexao.Commit(Transacao);
         except
            DSModuleDb.SQLConexao.Rollback(Transacao);
            ShowMessage('N�o foi poss�vel criar o a chave prim�ria: ' + #13 +
                         qTabela);

         end;
      end;
   end;
   FreeAndNil(vMinhaQuery);
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
function SemAcentosNemCedilha(qString:String):String;
var
   x:Integer;
   qChegou : String;
begin
   qChegou := qString;
   x:=1;
   while x <= length(qString) do
   begin
      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'c' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'C' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);


      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);
//Tremas

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'a' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'A' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'E' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'i' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'I' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'o' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'O' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'u' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '�' then
         qString := copy(qString,1,x-1) + 'U' + copy(qString,x+1,length(qString)-x);

      if copy(qString,x,1) = '&' then
         qString := copy(qString,1,x-1) + 'e' + copy(qString,x+1,length(qString)-x);

      x:= x + 1;
   end;

   Result := qString;
end;

function CepFormatado(qString:string):string;
begin
  Result := Copy(qString,1,5)+'-'+Copy(qString,6,3);
end;

procedure CriarCampoSePrecisar(qTabela, qCampo, qString : String);
var
   Transacao : TTransactionDesc;
   vPrecisaInserir : Boolean;
   vMinhaSQLDataSet : TSQLDataSet;
   vMinhaQuery : TSQLQuery;
begin
   vMinhaQuery := TSQLQuery.Create(nil);
   vMinhaQuery.SQLConnection := DSModuleDb.SQLConexao;
   //Verificando se existe:
   with vMinhaQuery do
   begin
      Close;
      commandtext := 'SELECT RDB$RELATION_NAME '+
                     'FROM RDB$RELATIONS '+
                     'WHERE ((RDB$SYSTEM_FLAG = 0) '+
                     'OR (RDB$SYSTEM_FLAG IS NULL)) '+
                     'AND (RDB$VIEW_SOURCE IS NULL) '+
                     'AND RDB$RELATION_NAME =:PTABELA ';
      ParamByName('PTABELA').Value := qTabela;
      Open;
   end;
   if vMinhaQuery.FieldByName('RDB$RELATION_NAME').AsString <> '' then
   begin
     //Agora verificando se existe o campo:
     with vMinhaQuery do
     begin
        Close;
        commandtext := ' SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS '+
                       ' WHERE RDB$RELATION_NAME=:PTABELA '+
                       ' and RDB$FIELD_NAME =:PCAMPO ';
        ParamByName('PTABELA').Value := qTabela;
        ParamByName('PCAMPO').Value := qCampo;
        Open;
        if vMinhaQuery.FieldByName('RDB$FIELD_NAME').AsString = '' then
           vPrecisaInserir := True
        else
           vPrecisaInserir := False;
        Close;
     end;
   end;

   //Agora a inser��o propriamente dita:
   if vPrecisaInserir = True then
   begin
      with vMinhaQuery do
      begin
         Close;
         CommandText := qString;
         Transacao.TransactionID := 1;
         Transacao.IsolationLevel := xilREADCOMMITTED;
         DSModuleDb.SQLConexao.StartTransaction(Transacao);
         try
            ExecSQL();
            DSModuleDb.SQLConexao.Commit(Transacao);
         except
            DSModuleDb.SQLConexao.Rollback(Transacao);
            ShowMessage('N�o foi poss�vel criar o campo: ' + #13 +
                         qCampo + #13 + #13 + 'Na tabela: ' + #13 +
                         qTabela);

         end;
      end;
   end;
   FreeAndNil(vMinhaQuery);
end;
end.
