//
// Created by the DataSnap proxy generator.
// 19/06/2014 17:17:48
//

unit UntConectaServidor;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TDSModuleDbClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
    FCDSFormasPagamentosAfterPostCommand: TDBXCommand;
    FCDSFormasPagamentosAfterDeleteCommand: TDBXCommand;
    FcdsUsuariosAfterDeleteCommand: TDBXCommand;
    FcdsUsuariosAfterInsertCommand: TDBXCommand;
    FcdsUsuariosAfterPostCommand: TDBXCommand;
    FcdsPermissoesUsuariosSistemaAfterDeleteCommand: TDBXCommand;
    FcdsPermissoesUsuariosSistemaAfterPostCommand: TDBXCommand;
    FcdsPermissoesUsuariosSistemaAfterInsertCommand: TDBXCommand;
    FcdsUsuariosBeforeDeleteCommand: TDBXCommand;
    FGeneratorIncrementadoCommand: TDBXCommand;
    FInserirEmMovimentacoesCommand: TDBXCommand;
    FVerificaSeUsuarioEstaCadastradoCommand: TDBXCommand;
    FVerificaSeSenhaEstaCorretaCommand: TDBXCommand;
    FCadastrarSenhaCommand: TDBXCommand;
    FVerificaPermissaoCommand: TDBXCommand;
    FEfetuarAberturaDoCaixaCommand: TDBXCommand;
    FEftuarFechamentoDoCaixaCommand: TDBXCommand;
    FMovimentarCaixaCommand: TDBXCommand;
    FCadastrarCaixaCommand: TDBXCommand;
    FRetornaIdentificadorUsuarioCommand: TDBXCommand;
    FVerificaCaixaEstaAbertoCommand: TDBXCommand;
    FRetornaIdentificadorDoCaixaCommand: TDBXCommand;
    FEfetuarMovimentacaoClienteCommand: TDBXCommand;
    FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand: TDBXCommand;
    FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand: TDBXCommand;
    FLeArqIniCommand: TDBXCommand;
    FGravaArqIniCommand: TDBXCommand;
    FAtualizaConfigAcBrCommand: TDBXCommand;
    FEnviarNFeCommand: TDBXCommand;
    FRetornaUfEmitenteCommand: TDBXCommand;
    FRetornaAliquotaPisCommand: TDBXCommand;
    FRetornaAliquotaCofinsCommand: TDBXCommand;
    FRetornaSituacaotributariaCommand: TDBXCommand;
    FRetornaLocalEmissaoNFeCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure CDSFormasPagamentosAfterPost(DataSet: TDataSet);
    procedure CDSFormasPagamentosAfterDelete(DataSet: TDataSet);
    procedure cdsUsuariosAfterDelete(DataSet: TDataSet);
    procedure cdsUsuariosAfterInsert(DataSet: TDataSet);
    procedure cdsUsuariosAfterPost(DataSet: TDataSet);
    procedure cdsPermissoesUsuariosSistemaAfterDelete(DataSet: TDataSet);
    procedure cdsPermissoesUsuariosSistemaAfterPost(DataSet: TDataSet);
    procedure cdsPermissoesUsuariosSistemaAfterInsert(DataSet: TDataSet);
    procedure cdsUsuariosBeforeDelete(DataSet: TDataSet);
    function GeneratorIncrementado(qGenerator: string): Integer;
    function InserirEmMovimentacoes(qIdProduto: Integer; qIdPedido: Integer; qQuantidade: Double; vTipoMovimentacao: string; EntradaOuSaida: string): Integer;
    function VerificaSeUsuarioEstaCadastrado(qUsuario: string): Boolean;
    function VerificaSeSenhaEstaCorreta(qSenha: string): Boolean;
    function CadastrarSenha(qUsuario: string; qSenha: string): Boolean;
    function VerificaPermissao(qUsuario: string; qPermissao: string): Boolean;
    function EfetuarAberturaDoCaixa(qCaixa: Integer; qUsuario: Integer; qSaldo: Double): Boolean;
    function EftuarFechamentoDoCaixa(qCaixa: Integer; qusuario: Integer; qsaldo: Double): Boolean;
    function MovimentarCaixa(qCaixa: Integer; qUsuario: Integer; qIdPedido: Integer; qTipoMovimentacao: string; qObservacao: string; qDescricao: string; qValorMovimentado: Double): Boolean;
    function CadastrarCaixa(qCaixa: Integer): Boolean;
    function RetornaIdentificadorUsuario(qUsuario: string): Integer;
    function VerificaCaixaEstaAberto(qCaixa: Integer): Boolean;
    function RetornaIdentificadorDoCaixa(qCaixa: Integer): Integer;
    function EfetuarMovimentacaoCliente(qCliente: Integer; qUsuario: Integer; qIdPedido: Integer; qDebitoCredito: string; qDescricao: string; qObservacao: string; qValorMovimentado: Double): Boolean;
    function InserirItenDoPedidoDeAcordoComNumeroDaComanda(qPedidoNovo: Integer; qPedido: Integer): Boolean;
    function DeletarPedidosEItensDeAcordoComONumeroDaComanda(qPedido: Integer): Boolean;
    procedure LeArqIni;
    procedure GravaArqIni;
    procedure AtualizaConfigAcBr;
    function EnviarNFe(qIdNotaFiscal: Integer): string;
    function RetornaUfEmitente: string;
    function RetornaAliquotaPis: string;
    function RetornaAliquotaCofins: string;
    function RetornaSituacaotributaria: string;
    function RetornaLocalEmissaoNFe: string;
  end;

implementation

procedure TDSModuleDbClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TDSModuleDb.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.CDSFormasPagamentosAfterPost(DataSet: TDataSet);
begin
  if FCDSFormasPagamentosAfterPostCommand = nil then
  begin
    FCDSFormasPagamentosAfterPostCommand := FDBXConnection.CreateCommand;
    FCDSFormasPagamentosAfterPostCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCDSFormasPagamentosAfterPostCommand.Text := 'TDSModuleDb.CDSFormasPagamentosAfterPost';
    FCDSFormasPagamentosAfterPostCommand.Prepare;
  end;
  FCDSFormasPagamentosAfterPostCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FCDSFormasPagamentosAfterPostCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.CDSFormasPagamentosAfterDelete(DataSet: TDataSet);
begin
  if FCDSFormasPagamentosAfterDeleteCommand = nil then
  begin
    FCDSFormasPagamentosAfterDeleteCommand := FDBXConnection.CreateCommand;
    FCDSFormasPagamentosAfterDeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCDSFormasPagamentosAfterDeleteCommand.Text := 'TDSModuleDb.CDSFormasPagamentosAfterDelete';
    FCDSFormasPagamentosAfterDeleteCommand.Prepare;
  end;
  FCDSFormasPagamentosAfterDeleteCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FCDSFormasPagamentosAfterDeleteCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.cdsUsuariosAfterDelete(DataSet: TDataSet);
begin
  if FcdsUsuariosAfterDeleteCommand = nil then
  begin
    FcdsUsuariosAfterDeleteCommand := FDBXConnection.CreateCommand;
    FcdsUsuariosAfterDeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FcdsUsuariosAfterDeleteCommand.Text := 'TDSModuleDb.cdsUsuariosAfterDelete';
    FcdsUsuariosAfterDeleteCommand.Prepare;
  end;
  FcdsUsuariosAfterDeleteCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FcdsUsuariosAfterDeleteCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.cdsUsuariosAfterInsert(DataSet: TDataSet);
begin
  if FcdsUsuariosAfterInsertCommand = nil then
  begin
    FcdsUsuariosAfterInsertCommand := FDBXConnection.CreateCommand;
    FcdsUsuariosAfterInsertCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FcdsUsuariosAfterInsertCommand.Text := 'TDSModuleDb.cdsUsuariosAfterInsert';
    FcdsUsuariosAfterInsertCommand.Prepare;
  end;
  FcdsUsuariosAfterInsertCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FcdsUsuariosAfterInsertCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.cdsUsuariosAfterPost(DataSet: TDataSet);
begin
  if FcdsUsuariosAfterPostCommand = nil then
  begin
    FcdsUsuariosAfterPostCommand := FDBXConnection.CreateCommand;
    FcdsUsuariosAfterPostCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FcdsUsuariosAfterPostCommand.Text := 'TDSModuleDb.cdsUsuariosAfterPost';
    FcdsUsuariosAfterPostCommand.Prepare;
  end;
  FcdsUsuariosAfterPostCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FcdsUsuariosAfterPostCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.cdsPermissoesUsuariosSistemaAfterDelete(DataSet: TDataSet);
begin
  if FcdsPermissoesUsuariosSistemaAfterDeleteCommand = nil then
  begin
    FcdsPermissoesUsuariosSistemaAfterDeleteCommand := FDBXConnection.CreateCommand;
    FcdsPermissoesUsuariosSistemaAfterDeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FcdsPermissoesUsuariosSistemaAfterDeleteCommand.Text := 'TDSModuleDb.cdsPermissoesUsuariosSistemaAfterDelete';
    FcdsPermissoesUsuariosSistemaAfterDeleteCommand.Prepare;
  end;
  FcdsPermissoesUsuariosSistemaAfterDeleteCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FcdsPermissoesUsuariosSistemaAfterDeleteCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.cdsPermissoesUsuariosSistemaAfterPost(DataSet: TDataSet);
begin
  if FcdsPermissoesUsuariosSistemaAfterPostCommand = nil then
  begin
    FcdsPermissoesUsuariosSistemaAfterPostCommand := FDBXConnection.CreateCommand;
    FcdsPermissoesUsuariosSistemaAfterPostCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FcdsPermissoesUsuariosSistemaAfterPostCommand.Text := 'TDSModuleDb.cdsPermissoesUsuariosSistemaAfterPost';
    FcdsPermissoesUsuariosSistemaAfterPostCommand.Prepare;
  end;
  FcdsPermissoesUsuariosSistemaAfterPostCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FcdsPermissoesUsuariosSistemaAfterPostCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.cdsPermissoesUsuariosSistemaAfterInsert(DataSet: TDataSet);
begin
  if FcdsPermissoesUsuariosSistemaAfterInsertCommand = nil then
  begin
    FcdsPermissoesUsuariosSistemaAfterInsertCommand := FDBXConnection.CreateCommand;
    FcdsPermissoesUsuariosSistemaAfterInsertCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FcdsPermissoesUsuariosSistemaAfterInsertCommand.Text := 'TDSModuleDb.cdsPermissoesUsuariosSistemaAfterInsert';
    FcdsPermissoesUsuariosSistemaAfterInsertCommand.Prepare;
  end;
  FcdsPermissoesUsuariosSistemaAfterInsertCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FcdsPermissoesUsuariosSistemaAfterInsertCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.cdsUsuariosBeforeDelete(DataSet: TDataSet);
begin
  if FcdsUsuariosBeforeDeleteCommand = nil then
  begin
    FcdsUsuariosBeforeDeleteCommand := FDBXConnection.CreateCommand;
    FcdsUsuariosBeforeDeleteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FcdsUsuariosBeforeDeleteCommand.Text := 'TDSModuleDb.cdsUsuariosBeforeDelete';
    FcdsUsuariosBeforeDeleteCommand.Prepare;
  end;
  FcdsUsuariosBeforeDeleteCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FcdsUsuariosBeforeDeleteCommand.ExecuteUpdate;
end;

function TDSModuleDbClient.GeneratorIncrementado(qGenerator: string): Integer;
begin
  if FGeneratorIncrementadoCommand = nil then
  begin
    FGeneratorIncrementadoCommand := FDBXConnection.CreateCommand;
    FGeneratorIncrementadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGeneratorIncrementadoCommand.Text := 'TDSModuleDb.GeneratorIncrementado';
    FGeneratorIncrementadoCommand.Prepare;
  end;
  FGeneratorIncrementadoCommand.Parameters[0].Value.SetWideString(qGenerator);
  FGeneratorIncrementadoCommand.ExecuteUpdate;
  Result := FGeneratorIncrementadoCommand.Parameters[1].Value.GetInt32;
end;

function TDSModuleDbClient.InserirEmMovimentacoes(qIdProduto: Integer; qIdPedido: Integer; qQuantidade: Double; vTipoMovimentacao: string; EntradaOuSaida: string): Integer;
begin
  if FInserirEmMovimentacoesCommand = nil then
  begin
    FInserirEmMovimentacoesCommand := FDBXConnection.CreateCommand;
    FInserirEmMovimentacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInserirEmMovimentacoesCommand.Text := 'TDSModuleDb.InserirEmMovimentacoes';
    FInserirEmMovimentacoesCommand.Prepare;
  end;
  FInserirEmMovimentacoesCommand.Parameters[0].Value.SetInt32(qIdProduto);
  FInserirEmMovimentacoesCommand.Parameters[1].Value.SetInt32(qIdPedido);
  FInserirEmMovimentacoesCommand.Parameters[2].Value.SetDouble(qQuantidade);
  FInserirEmMovimentacoesCommand.Parameters[3].Value.SetWideString(vTipoMovimentacao);
  FInserirEmMovimentacoesCommand.Parameters[4].Value.SetWideString(EntradaOuSaida);
  FInserirEmMovimentacoesCommand.ExecuteUpdate;
  Result := FInserirEmMovimentacoesCommand.Parameters[5].Value.GetInt32;
end;

function TDSModuleDbClient.VerificaSeUsuarioEstaCadastrado(qUsuario: string): Boolean;
begin
  if FVerificaSeUsuarioEstaCadastradoCommand = nil then
  begin
    FVerificaSeUsuarioEstaCadastradoCommand := FDBXConnection.CreateCommand;
    FVerificaSeUsuarioEstaCadastradoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVerificaSeUsuarioEstaCadastradoCommand.Text := 'TDSModuleDb.VerificaSeUsuarioEstaCadastrado';
    FVerificaSeUsuarioEstaCadastradoCommand.Prepare;
  end;
  FVerificaSeUsuarioEstaCadastradoCommand.Parameters[0].Value.SetWideString(qUsuario);
  FVerificaSeUsuarioEstaCadastradoCommand.ExecuteUpdate;
  Result := FVerificaSeUsuarioEstaCadastradoCommand.Parameters[1].Value.GetBoolean;
end;

function TDSModuleDbClient.VerificaSeSenhaEstaCorreta(qSenha: string): Boolean;
begin
  if FVerificaSeSenhaEstaCorretaCommand = nil then
  begin
    FVerificaSeSenhaEstaCorretaCommand := FDBXConnection.CreateCommand;
    FVerificaSeSenhaEstaCorretaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVerificaSeSenhaEstaCorretaCommand.Text := 'TDSModuleDb.VerificaSeSenhaEstaCorreta';
    FVerificaSeSenhaEstaCorretaCommand.Prepare;
  end;
  FVerificaSeSenhaEstaCorretaCommand.Parameters[0].Value.SetWideString(qSenha);
  FVerificaSeSenhaEstaCorretaCommand.ExecuteUpdate;
  Result := FVerificaSeSenhaEstaCorretaCommand.Parameters[1].Value.GetBoolean;
end;

function TDSModuleDbClient.CadastrarSenha(qUsuario: string; qSenha: string): Boolean;
begin
  if FCadastrarSenhaCommand = nil then
  begin
    FCadastrarSenhaCommand := FDBXConnection.CreateCommand;
    FCadastrarSenhaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCadastrarSenhaCommand.Text := 'TDSModuleDb.CadastrarSenha';
    FCadastrarSenhaCommand.Prepare;
  end;
  FCadastrarSenhaCommand.Parameters[0].Value.SetWideString(qUsuario);
  FCadastrarSenhaCommand.Parameters[1].Value.SetWideString(qSenha);
  FCadastrarSenhaCommand.ExecuteUpdate;
  Result := FCadastrarSenhaCommand.Parameters[2].Value.GetBoolean;
end;

function TDSModuleDbClient.VerificaPermissao(qUsuario: string; qPermissao: string): Boolean;
begin
  if FVerificaPermissaoCommand = nil then
  begin
    FVerificaPermissaoCommand := FDBXConnection.CreateCommand;
    FVerificaPermissaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVerificaPermissaoCommand.Text := 'TDSModuleDb.VerificaPermissao';
    FVerificaPermissaoCommand.Prepare;
  end;
  FVerificaPermissaoCommand.Parameters[0].Value.SetWideString(qUsuario);
  FVerificaPermissaoCommand.Parameters[1].Value.SetWideString(qPermissao);
  FVerificaPermissaoCommand.ExecuteUpdate;
  Result := FVerificaPermissaoCommand.Parameters[2].Value.GetBoolean;
end;

function TDSModuleDbClient.EfetuarAberturaDoCaixa(qCaixa: Integer; qUsuario: Integer; qSaldo: Double): Boolean;
begin
  if FEfetuarAberturaDoCaixaCommand = nil then
  begin
    FEfetuarAberturaDoCaixaCommand := FDBXConnection.CreateCommand;
    FEfetuarAberturaDoCaixaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEfetuarAberturaDoCaixaCommand.Text := 'TDSModuleDb.EfetuarAberturaDoCaixa';
    FEfetuarAberturaDoCaixaCommand.Prepare;
  end;
  FEfetuarAberturaDoCaixaCommand.Parameters[0].Value.SetInt32(qCaixa);
  FEfetuarAberturaDoCaixaCommand.Parameters[1].Value.SetInt32(qUsuario);
  FEfetuarAberturaDoCaixaCommand.Parameters[2].Value.SetDouble(qSaldo);
  FEfetuarAberturaDoCaixaCommand.ExecuteUpdate;
  Result := FEfetuarAberturaDoCaixaCommand.Parameters[3].Value.GetBoolean;
end;

function TDSModuleDbClient.EftuarFechamentoDoCaixa(qCaixa: Integer; qusuario: Integer; qsaldo: Double): Boolean;
begin
  if FEftuarFechamentoDoCaixaCommand = nil then
  begin
    FEftuarFechamentoDoCaixaCommand := FDBXConnection.CreateCommand;
    FEftuarFechamentoDoCaixaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEftuarFechamentoDoCaixaCommand.Text := 'TDSModuleDb.EftuarFechamentoDoCaixa';
    FEftuarFechamentoDoCaixaCommand.Prepare;
  end;
  FEftuarFechamentoDoCaixaCommand.Parameters[0].Value.SetInt32(qCaixa);
  FEftuarFechamentoDoCaixaCommand.Parameters[1].Value.SetInt32(qusuario);
  FEftuarFechamentoDoCaixaCommand.Parameters[2].Value.SetDouble(qsaldo);
  FEftuarFechamentoDoCaixaCommand.ExecuteUpdate;
  Result := FEftuarFechamentoDoCaixaCommand.Parameters[3].Value.GetBoolean;
end;

function TDSModuleDbClient.MovimentarCaixa(qCaixa: Integer; qUsuario: Integer; qIdPedido: Integer; qTipoMovimentacao: string; qObservacao: string; qDescricao: string; qValorMovimentado: Double): Boolean;
begin
  if FMovimentarCaixaCommand = nil then
  begin
    FMovimentarCaixaCommand := FDBXConnection.CreateCommand;
    FMovimentarCaixaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FMovimentarCaixaCommand.Text := 'TDSModuleDb.MovimentarCaixa';
    FMovimentarCaixaCommand.Prepare;
  end;
  FMovimentarCaixaCommand.Parameters[0].Value.SetInt32(qCaixa);
  FMovimentarCaixaCommand.Parameters[1].Value.SetInt32(qUsuario);
  FMovimentarCaixaCommand.Parameters[2].Value.SetInt32(qIdPedido);
  FMovimentarCaixaCommand.Parameters[3].Value.SetWideString(qTipoMovimentacao);
  FMovimentarCaixaCommand.Parameters[4].Value.SetWideString(qObservacao);
  FMovimentarCaixaCommand.Parameters[5].Value.SetWideString(qDescricao);
  FMovimentarCaixaCommand.Parameters[6].Value.SetDouble(qValorMovimentado);
  FMovimentarCaixaCommand.ExecuteUpdate;
  Result := FMovimentarCaixaCommand.Parameters[7].Value.GetBoolean;
end;

function TDSModuleDbClient.CadastrarCaixa(qCaixa: Integer): Boolean;
begin
  if FCadastrarCaixaCommand = nil then
  begin
    FCadastrarCaixaCommand := FDBXConnection.CreateCommand;
    FCadastrarCaixaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCadastrarCaixaCommand.Text := 'TDSModuleDb.CadastrarCaixa';
    FCadastrarCaixaCommand.Prepare;
  end;
  FCadastrarCaixaCommand.Parameters[0].Value.SetInt32(qCaixa);
  FCadastrarCaixaCommand.ExecuteUpdate;
  Result := FCadastrarCaixaCommand.Parameters[1].Value.GetBoolean;
end;

function TDSModuleDbClient.RetornaIdentificadorUsuario(qUsuario: string): Integer;
begin
  if FRetornaIdentificadorUsuarioCommand = nil then
  begin
    FRetornaIdentificadorUsuarioCommand := FDBXConnection.CreateCommand;
    FRetornaIdentificadorUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaIdentificadorUsuarioCommand.Text := 'TDSModuleDb.RetornaIdentificadorUsuario';
    FRetornaIdentificadorUsuarioCommand.Prepare;
  end;
  FRetornaIdentificadorUsuarioCommand.Parameters[0].Value.SetWideString(qUsuario);
  FRetornaIdentificadorUsuarioCommand.ExecuteUpdate;
  Result := FRetornaIdentificadorUsuarioCommand.Parameters[1].Value.GetInt32;
end;

function TDSModuleDbClient.VerificaCaixaEstaAberto(qCaixa: Integer): Boolean;
begin
  if FVerificaCaixaEstaAbertoCommand = nil then
  begin
    FVerificaCaixaEstaAbertoCommand := FDBXConnection.CreateCommand;
    FVerificaCaixaEstaAbertoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVerificaCaixaEstaAbertoCommand.Text := 'TDSModuleDb.VerificaCaixaEstaAberto';
    FVerificaCaixaEstaAbertoCommand.Prepare;
  end;
  FVerificaCaixaEstaAbertoCommand.Parameters[0].Value.SetInt32(qCaixa);
  FVerificaCaixaEstaAbertoCommand.ExecuteUpdate;
  Result := FVerificaCaixaEstaAbertoCommand.Parameters[1].Value.GetBoolean;
end;

function TDSModuleDbClient.RetornaIdentificadorDoCaixa(qCaixa: Integer): Integer;
begin
  if FRetornaIdentificadorDoCaixaCommand = nil then
  begin
    FRetornaIdentificadorDoCaixaCommand := FDBXConnection.CreateCommand;
    FRetornaIdentificadorDoCaixaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaIdentificadorDoCaixaCommand.Text := 'TDSModuleDb.RetornaIdentificadorDoCaixa';
    FRetornaIdentificadorDoCaixaCommand.Prepare;
  end;
  FRetornaIdentificadorDoCaixaCommand.Parameters[0].Value.SetInt32(qCaixa);
  FRetornaIdentificadorDoCaixaCommand.ExecuteUpdate;
  Result := FRetornaIdentificadorDoCaixaCommand.Parameters[1].Value.GetInt32;
end;

function TDSModuleDbClient.EfetuarMovimentacaoCliente(qCliente: Integer; qUsuario: Integer; qIdPedido: Integer; qDebitoCredito: string; qDescricao: string; qObservacao: string; qValorMovimentado: Double): Boolean;
begin
  if FEfetuarMovimentacaoClienteCommand = nil then
  begin
    FEfetuarMovimentacaoClienteCommand := FDBXConnection.CreateCommand;
    FEfetuarMovimentacaoClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEfetuarMovimentacaoClienteCommand.Text := 'TDSModuleDb.EfetuarMovimentacaoCliente';
    FEfetuarMovimentacaoClienteCommand.Prepare;
  end;
  FEfetuarMovimentacaoClienteCommand.Parameters[0].Value.SetInt32(qCliente);
  FEfetuarMovimentacaoClienteCommand.Parameters[1].Value.SetInt32(qUsuario);
  FEfetuarMovimentacaoClienteCommand.Parameters[2].Value.SetInt32(qIdPedido);
  FEfetuarMovimentacaoClienteCommand.Parameters[3].Value.SetWideString(qDebitoCredito);
  FEfetuarMovimentacaoClienteCommand.Parameters[4].Value.SetWideString(qDescricao);
  FEfetuarMovimentacaoClienteCommand.Parameters[5].Value.SetWideString(qObservacao);
  FEfetuarMovimentacaoClienteCommand.Parameters[6].Value.SetDouble(qValorMovimentado);
  FEfetuarMovimentacaoClienteCommand.ExecuteUpdate;
  Result := FEfetuarMovimentacaoClienteCommand.Parameters[7].Value.GetBoolean;
end;

function TDSModuleDbClient.InserirItenDoPedidoDeAcordoComNumeroDaComanda(qPedidoNovo: Integer; qPedido: Integer): Boolean;
begin
  if FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand = nil then
  begin
    FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand := FDBXConnection.CreateCommand;
    FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand.Text := 'TDSModuleDb.InserirItenDoPedidoDeAcordoComNumeroDaComanda';
    FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand.Prepare;
  end;
  FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand.Parameters[0].Value.SetInt32(qPedidoNovo);
  FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand.Parameters[1].Value.SetInt32(qPedido);
  FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand.ExecuteUpdate;
  Result := FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand.Parameters[2].Value.GetBoolean;
end;

function TDSModuleDbClient.DeletarPedidosEItensDeAcordoComONumeroDaComanda(qPedido: Integer): Boolean;
begin
  if FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand = nil then
  begin
    FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand := FDBXConnection.CreateCommand;
    FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand.Text := 'TDSModuleDb.DeletarPedidosEItensDeAcordoComONumeroDaComanda';
    FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand.Prepare;
  end;
  FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand.Parameters[0].Value.SetInt32(qPedido);
  FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand.ExecuteUpdate;
  Result := FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand.Parameters[1].Value.GetBoolean;
end;

procedure TDSModuleDbClient.LeArqIni;
begin
  if FLeArqIniCommand = nil then
  begin
    FLeArqIniCommand := FDBXConnection.CreateCommand;
    FLeArqIniCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLeArqIniCommand.Text := 'TDSModuleDb.LeArqIni';
    FLeArqIniCommand.Prepare;
  end;
  FLeArqIniCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.GravaArqIni;
begin
  if FGravaArqIniCommand = nil then
  begin
    FGravaArqIniCommand := FDBXConnection.CreateCommand;
    FGravaArqIniCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGravaArqIniCommand.Text := 'TDSModuleDb.GravaArqIni';
    FGravaArqIniCommand.Prepare;
  end;
  FGravaArqIniCommand.ExecuteUpdate;
end;

procedure TDSModuleDbClient.AtualizaConfigAcBr;
begin
  if FAtualizaConfigAcBrCommand = nil then
  begin
    FAtualizaConfigAcBrCommand := FDBXConnection.CreateCommand;
    FAtualizaConfigAcBrCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtualizaConfigAcBrCommand.Text := 'TDSModuleDb.AtualizaConfigAcBr';
    FAtualizaConfigAcBrCommand.Prepare;
  end;
  FAtualizaConfigAcBrCommand.ExecuteUpdate;
end;

function TDSModuleDbClient.EnviarNFe(qIdNotaFiscal: Integer): string;
begin
  if FEnviarNFeCommand = nil then
  begin
    FEnviarNFeCommand := FDBXConnection.CreateCommand;
    FEnviarNFeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEnviarNFeCommand.Text := 'TDSModuleDb.EnviarNFe';
    FEnviarNFeCommand.Prepare;
  end;
  FEnviarNFeCommand.Parameters[0].Value.SetInt32(qIdNotaFiscal);
  FEnviarNFeCommand.ExecuteUpdate;
  Result := FEnviarNFeCommand.Parameters[1].Value.GetWideString;
end;

function TDSModuleDbClient.RetornaUfEmitente: string;
begin
  if FRetornaUfEmitenteCommand = nil then
  begin
    FRetornaUfEmitenteCommand := FDBXConnection.CreateCommand;
    FRetornaUfEmitenteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaUfEmitenteCommand.Text := 'TDSModuleDb.RetornaUfEmitente';
    FRetornaUfEmitenteCommand.Prepare;
  end;
  FRetornaUfEmitenteCommand.ExecuteUpdate;
  Result := FRetornaUfEmitenteCommand.Parameters[0].Value.GetWideString;
end;

function TDSModuleDbClient.RetornaAliquotaPis: string;
begin
  if FRetornaAliquotaPisCommand = nil then
  begin
    FRetornaAliquotaPisCommand := FDBXConnection.CreateCommand;
    FRetornaAliquotaPisCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaAliquotaPisCommand.Text := 'TDSModuleDb.RetornaAliquotaPis';
    FRetornaAliquotaPisCommand.Prepare;
  end;
  FRetornaAliquotaPisCommand.ExecuteUpdate;
  Result := FRetornaAliquotaPisCommand.Parameters[0].Value.GetWideString;
end;

function TDSModuleDbClient.RetornaAliquotaCofins: string;
begin
  if FRetornaAliquotaCofinsCommand = nil then
  begin
    FRetornaAliquotaCofinsCommand := FDBXConnection.CreateCommand;
    FRetornaAliquotaCofinsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaAliquotaCofinsCommand.Text := 'TDSModuleDb.RetornaAliquotaCofins';
    FRetornaAliquotaCofinsCommand.Prepare;
  end;
  FRetornaAliquotaCofinsCommand.ExecuteUpdate;
  Result := FRetornaAliquotaCofinsCommand.Parameters[0].Value.GetWideString;
end;

function TDSModuleDbClient.RetornaSituacaotributaria: string;
begin
  if FRetornaSituacaotributariaCommand = nil then
  begin
    FRetornaSituacaotributariaCommand := FDBXConnection.CreateCommand;
    FRetornaSituacaotributariaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaSituacaotributariaCommand.Text := 'TDSModuleDb.RetornaSituacaotributaria';
    FRetornaSituacaotributariaCommand.Prepare;
  end;
  FRetornaSituacaotributariaCommand.ExecuteUpdate;
  Result := FRetornaSituacaotributariaCommand.Parameters[0].Value.GetWideString;
end;

function TDSModuleDbClient.RetornaLocalEmissaoNFe: string;
begin
  if FRetornaLocalEmissaoNFeCommand = nil then
  begin
    FRetornaLocalEmissaoNFeCommand := FDBXConnection.CreateCommand;
    FRetornaLocalEmissaoNFeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaLocalEmissaoNFeCommand.Text := 'TDSModuleDb.RetornaLocalEmissaoNFe';
    FRetornaLocalEmissaoNFeCommand.Prepare;
  end;
  FRetornaLocalEmissaoNFeCommand.ExecuteUpdate;
  Result := FRetornaLocalEmissaoNFeCommand.Parameters[0].Value.GetWideString;
end;


constructor TDSModuleDbClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TDSModuleDbClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TDSModuleDbClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FCDSFormasPagamentosAfterPostCommand.DisposeOf;
  FCDSFormasPagamentosAfterDeleteCommand.DisposeOf;
  FcdsUsuariosAfterDeleteCommand.DisposeOf;
  FcdsUsuariosAfterInsertCommand.DisposeOf;
  FcdsUsuariosAfterPostCommand.DisposeOf;
  FcdsPermissoesUsuariosSistemaAfterDeleteCommand.DisposeOf;
  FcdsPermissoesUsuariosSistemaAfterPostCommand.DisposeOf;
  FcdsPermissoesUsuariosSistemaAfterInsertCommand.DisposeOf;
  FcdsUsuariosBeforeDeleteCommand.DisposeOf;
  FGeneratorIncrementadoCommand.DisposeOf;
  FInserirEmMovimentacoesCommand.DisposeOf;
  FVerificaSeUsuarioEstaCadastradoCommand.DisposeOf;
  FVerificaSeSenhaEstaCorretaCommand.DisposeOf;
  FCadastrarSenhaCommand.DisposeOf;
  FVerificaPermissaoCommand.DisposeOf;
  FEfetuarAberturaDoCaixaCommand.DisposeOf;
  FEftuarFechamentoDoCaixaCommand.DisposeOf;
  FMovimentarCaixaCommand.DisposeOf;
  FCadastrarCaixaCommand.DisposeOf;
  FRetornaIdentificadorUsuarioCommand.DisposeOf;
  FVerificaCaixaEstaAbertoCommand.DisposeOf;
  FRetornaIdentificadorDoCaixaCommand.DisposeOf;
  FEfetuarMovimentacaoClienteCommand.DisposeOf;
  FInserirItenDoPedidoDeAcordoComNumeroDaComandaCommand.DisposeOf;
  FDeletarPedidosEItensDeAcordoComONumeroDaComandaCommand.DisposeOf;
  FLeArqIniCommand.DisposeOf;
  FGravaArqIniCommand.DisposeOf;
  FAtualizaConfigAcBrCommand.DisposeOf;
  FEnviarNFeCommand.DisposeOf;
  FRetornaUfEmitenteCommand.DisposeOf;
  FRetornaAliquotaPisCommand.DisposeOf;
  FRetornaAliquotaCofinsCommand.DisposeOf;
  FRetornaSituacaotributariaCommand.DisposeOf;
  FRetornaLocalEmissaoNFeCommand.DisposeOf;
  inherited;
end;

end.

