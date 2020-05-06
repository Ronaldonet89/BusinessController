unit UntClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Touch.GestureMgr,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxPCdxBarPopupMenu, cxPC, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons, Vcl.Mask, Vcl.DBCtrls,
  cxContainer, cxLabel, cxTextEdit, cxDBEdit, cxDBNavigator, Vcl.Samples.Gauges,
  ACBrBase, ACBrSocket, ACBrCEP
  {, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxBarBuiltInMenu};

type
  TfrmClientes = class(TForm)
    AppBar: TPanel;
    CloseButton: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    GestureManager1: TGestureManager;
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel3: TPanel;
    cxpcClientes: TcxPageControl;
    cxtsPrincipal: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTCNPJ: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBCep: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTCPF: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxGrid1DBTableView1ID_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1FANTASIA: TcxGridDBColumn;
    cxGrid1DBTableView1CPF: TcxGridDBColumn;
    cxGrid1DBTableView1CNPJ: TcxGridDBColumn;
    cxGrid1DBTableView1INSCRICAO_ESTADUAL: TcxGridDBColumn;
    cxGrid1DBTableView1ENDERECO: TcxGridDBColumn;
    cxGrid1DBTableView1NUMERO: TcxGridDBColumn;
    cxGrid1DBTableView1BAIRRO: TcxGridDBColumn;
    cxGrid1DBTableView1CEP: TcxGridDBColumn;
    cxDBTextEdit15: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    cxDBTextEdit16: TcxDBTextEdit;
    cxLabel16: TcxLabel;
    cxBtnTransportadores: TcxButton;
    DBEdit1: TDBEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel17: TcxLabel;
    cxDBNavigator1: TcxDBNavigator;
    cxLabel18: TcxLabel;
    edtClientes: TEdit;
    BtImportar: TcxButton;
    Gauge1: TGauge;
    cxLabel19: TcxLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    ACBrCEP1: TACBrCEP;
    //ACBrCEP1: TACBrCEP;
    procedure BackToMainForm(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxBtnTransportadoresClick(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure cxDBTextEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure edtClientesChange(Sender: TObject);
    procedure BtImportarClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure ACBrCEP1BuscaEfetuada(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AppBarResize;
    procedure AppBarShow(mode: integer);
    procedure ImportarCSV(Arquivo:string);
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses GroupedItems1, SplitItemDetail1, UDataModul, UntLookUpTransportadores,
  UProceduresClient, UCnpjCpf;

const
  AppBarHeight = 75;

procedure TfrmClientes.AppBarResize;
begin
  AppBar.SetBounds(0, AppBar.Parent.Height - AppBarHeight,
    AppBar.Parent.Width, AppBarHeight);
end;

procedure TfrmClientes.AppBarShow(mode: integer);
begin
  if mode = -1 then // Toggle
    mode := integer(not AppBar.Visible );

  if mode = 0 then
    AppBar.Visible := False
  else
  begin
    AppBar.Visible := True;
    AppBar.BringToFront;
  end;
end;

procedure TfrmClientes.BackToMainForm(Sender: TObject);
begin
  Close;
//  Hide;
//  SplitForm.BringToFront;
end;

procedure TfrmClientes.BtImportarClick(Sender: TObject);
var
  cli, id, cont: integer;
  cad, filtro: string;
begin
  filtro:= 'I';
  if not inputquery('Importar novos clientes ou atualizar todos','digite I para importar novos ou digite A para atualizar todos',filtro) then
    abort;

  filtro:= Uppercase(filtro);

  if (filtro <> 'A') and (filtro <> 'I')  then
  begin
    MessageDlg('Não foi possível importar tabela de Clientes digite A ou I !', mtError,[mbYes],0);
    exit;
  end;

  Dm.cdsGenerico.Close;
  DM.cdsGenerico.CommandText :='SELECT MAX(Id_cliente)as cad FROM Clientes';
  DM.cdsGenerico.open;
  cad:= Dm.cdsGenerico.FieldByName('cad').AsString;
  if cad = '' then
   cad:= '0';

  with Dm.FDQConsulta,Sql do
  begin
    Close;
    Clear;
    Add('select Count(*) as cont ');
    Add('  from cadastros c ');
    Add(' right outer join pedidos p on (p.cod_cad = c.cod_cad) ');
    Add(' where c.cod_cad > '+ cad);
    Open;

    Gauge1.Visible := true;
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := Dm.FDQConsulta.FieldByName('cont').AsInteger;

    Close;
    Clear;
    Add(' select distinct c.cod_cad,c.nome,email,endereco,numero,complemento,ddd1,ddd2,');
	  Add('        fone1,fone2, bairro,v.cidade,uf,V.cep,cpf,pais,ibge ');
    Add('   from cadastros c ');
    Add('  right outer join pedidos p on (p.cod_cad = c.cod_cad)');
    Add('  left outer join view_sistema_pedidos_ibge v on v.cod_ped = p.cod_ped and v.cod_cesta = p.cod_cesta ');
    Add('  where c.cod_cad is not null and data_cad > ''2018-01-01'' ');

    if filtro = 'I' then
      Add('  and c.cod_cad > ' + cad);
    Open;
  end;
  try
    Dm.FDQConsulta.First;
    while not Dm.FDQConsulta.eof do
    begin
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'Select count(*) cont from Clientes where ID_CLIENTE = '+ Dm.FDQConsulta.FieldByName('cod_cad').AsString;
      DM.cdsGenerico.open;

      if Dm.cdsGenerico.FieldByName('cont').AsInteger > 0 then
      begin
        Dm.cdsGenerico.Close;
        DM.cdsGenerico.CommandText := 'UPDATE CLIENTES SET '+
                                      ' RAZAO_SOCIAL = :RAZAO_SOCIAL,'+
                                      ' FANTASIA =:FANTASIA, '+
                                      ' CPF =:CPF,'+
                                      ' EMAIL =:EMAIL,'+
                                      ' ENDERECO =:ENDERECO,'+
                                      ' NUMERO =:NUMERO,'+
                                      ' BAIRRO =:BAIRRO,'+
                                      ' CIDADE =:CIDADE,'+
                                      ' UF =:UF,'+
                                      ' CEP =:CEP,'+
                                      ' TELEFONE =:TELEFONE,'+
                                      ' CELULAR =:CELULAR,'+
                                      ' CODMUNICIPIO =:CODMUNICIPIO '+
                                      ' WHERE ID_CLIENTE = '+Dm.FDQConsulta.FieldByName('cod_cad').AsString;
        DM.cdsGenerico.Params.ParambyName('RAZAO_SOCIAL').AsString:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('FANTASIA').AsString:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('CPF').AsString:= Copy(Dm.FDQConsulta.FieldByName('cpf').AsString,1,20);
        DM.cdsGenerico.Params.ParambyName('EMAIL').AsString:= Copy(Dm.FDQConsulta.FieldByName('email').AsString,1,100);
        DM.cdsGenerico.Params.ParambyName('ENDERECO').AsString:= Copy(Dm.FDQConsulta.FieldByName('endereco').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('NUMERO').AsString:= Copy(Dm.FDQConsulta.FieldByName('numero').AsString,1,20);
        DM.cdsGenerico.Params.ParambyName('BAIRRO').AsString:= Copy(Dm.FDQConsulta.FieldByName('bairro').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('CIDADE').AsString:= Copy(Dm.FDQConsulta.FieldByName('cidade').AsString,1,100);
        DM.cdsGenerico.Params.ParambyName('UF').AsString:= Copy(Dm.FDQConsulta.FieldByName('uf').AsString,1,2);
        DM.cdsGenerico.Params.ParambyName('CEP').AsString:= Copy(Dm.FDQConsulta.FieldByName('Cep').AsString,1,10);
        DM.cdsGenerico.Params.ParambyName('TELEFONE').AsString:= Copy(Dm.FDQConsulta.FieldByName('ddd1').AsString +Dm.FDQConsulta.FieldByName('fone1').AsString,1,100);
        DM.cdsGenerico.Params.ParambyName('CELULAR').AsString:= Copy(Dm.FDQConsulta.FieldByName('ddd2').AsString +Dm.FDQConsulta.FieldByName('fone2').AsString,1,50);
        DM.cdsGenerico.Params.ParambyName('CODMUNICIPIO').AsINTEGER:= Dm.FDQConsulta.FieldByName('ibge').AsINTEGER;
        DM.cdsGenerico.Execute;

//        Dm.FDQCliente.Close;
//        Dm.FDQCliente.SQL.clear;
//        Dm.FDQCliente.SQL.text:= '  UPDATE PESSOA SET PESSOA = :PESSOA, RAZAO = :RAZAO,FANTASIA = :FANTASIA,'+
//                                 ' CNPJCPF = :CNPJCPF, CEP = :CEP, ENDERECO = :ENDERECO, BAIRRO = :BAIRRO, EMAIL = :EMAIL,'+
//                                 '    FONE = :FONE, CELULAR =:CELULAR'+
//                             ' WHERE ID = '+Dm.FDQConsulta.FieldByName('cod_cad').AsString;
//
//        Dm.FDQCliente.ParambyName('PESSOA').ASSTRING:=  'F';
//        Dm.FDQCliente.ParambyName('RAZAO').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);
//        Dm.FDQCliente.ParambyName('FANTASIA').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);;
//        Dm.FDQCliente.ParambyName('CNPJCPF').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('cpf').AsString,1,20);
//        Dm.FDQCliente.ParambyName('CEP').ASSTRING:=  Copy(Dm.FDQConsulta.FieldByName('Cep').AsString,1,10);
//        Dm.FDQCliente.ParambyName('ENDERECO').ASSTRING:=  Copy(Dm.FDQConsulta.FieldByName('endereco').AsString,1,200);
//        Dm.FDQCliente.ParambyName('BAIRRO').ASSTRING:=  Copy(Dm.FDQConsulta.FieldByName('bairro').AsString,1,200);
//        Dm.FDQCliente.ParambyName('EMAIL').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('email').AsString,1,100);;
//        Dm.FDQCliente.ParambyName('FONE').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('ddd1').AsString +Dm.FDQConsulta.FieldByName('fone1').AsString,1,20);
//        Dm.FDQCliente.ParambyName('CELULAR').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('ddd2').AsString +Dm.FDQConsulta.FieldByName('fone2').AsString,1,20);
//        Dm.FDQCliente.ExecSQL;
      end
      else
      begin
        Dm.cdsGenerico.Close;
        DM.cdsGenerico.CommandText := ' INSERT INTO CLIENTES '+
        '            (ID_CLIENTE,RAZAO_SOCIAL,FANTASIA,CPF,EMAIL,ENDERECO,NUMERO,'+
        '             BAIRRO, CIDADE, UF, CEP, TELEFONE, CELULAR, CODMUNICIPIO )'+
        '  VALUES (:ID_CLIENTE,:RAZAO_SOCIAL,:FANTASIA,:CPF,:EMAIL,:ENDERECO,:NUMERO,'+
        '          :BAIRRO,:CIDADE,:UF,:CEP,:TELEFONE,:CELULAR, :CODMUNICIPIO )';
        DM.cdsGenerico.Params.ParambyName('ID_CLIENTE').AsInteger:= Dm.FDQConsulta.FieldByName('cod_cad').Asinteger;
        DM.cdsGenerico.Params.ParambyName('RAZAO_SOCIAL').AsString:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('FANTASIA').AsString:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('CPF').AsString:= Copy(Dm.FDQConsulta.FieldByName('cpf').AsString,1,20);
        DM.cdsGenerico.Params.ParambyName('EMAIL').AsString:= Copy(Dm.FDQConsulta.FieldByName('email').AsString,1,100);
        DM.cdsGenerico.Params.ParambyName('ENDERECO').AsString:= Copy(Dm.FDQConsulta.FieldByName('endereco').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('NUMERO').AsString:= Copy(Dm.FDQConsulta.FieldByName('numero').AsString,1,20);
        DM.cdsGenerico.Params.ParambyName('BAIRRO').AsString:= Copy(Dm.FDQConsulta.FieldByName('bairro').AsString,1,255);
        DM.cdsGenerico.Params.ParambyName('CIDADE').AsString:= Copy(Dm.FDQConsulta.FieldByName('cidade').AsString,1,100);
        DM.cdsGenerico.Params.ParambyName('UF').AsString:= Copy(Dm.FDQConsulta.FieldByName('uf').AsString,1,2);
        DM.cdsGenerico.Params.ParambyName('CEP').AsString:= Copy(Dm.FDQConsulta.FieldByName('Cep').AsString,1,10);
        DM.cdsGenerico.Params.ParambyName('TELEFONE').AsString:= Copy(Dm.FDQConsulta.FieldByName('ddd1').AsString +Dm.FDQConsulta.FieldByName('fone1').AsString,1,100);
        DM.cdsGenerico.Params.ParambyName('CELULAR').AsString:= Copy(Dm.FDQConsulta.FieldByName('ddd2').AsString +Dm.FDQConsulta.FieldByName('fone2').AsString,1,50);
        DM.cdsGenerico.Params.ParambyName('CODMUNICIPIO').AsINTEGER:= Dm.FDQConsulta.FieldByName('ibge').AsINTEGER;
        DM.cdsGenerico.Execute;

//        Dm.FDQCliente.Close;
//        Dm.FDQCliente.SQL.clear;
//        Dm.FDQCliente.SQL.text:= 'SELECT coalesce(MAX(ID),0)+ 1 AS ID FROM PESSOA';
//        Dm.FDQCliente.Open;
//
//        id:= Dm.FDQCliente.FieldByName('ID').ASINTEGER;
//
//        Dm.FDQCliente.Close;
//        Dm.FDQCliente.SQL.clear;
//        Dm.FDQCliente.SQL.text:= 'SELECT count(ID) cont FROM PESSOA WHERE ID = '+Dm.FDQConsulta.FieldByName('cod_cad').AsString;
//        Dm.FDQCliente.Open;
//
//        cont:= Dm.FDQCliente.FieldByName('cont').ASINTEGER;

//        if cont <= 0 then
//        begin
//          Dm.FDQCliente.Close;
//          Dm.FDQCliente.SQL.clear;
//          Dm.FDQCliente.SQL.text:= ' INSERT INTO PESSOA(ID,PESSOA,RAZAO,FANTASIA,CNPJCPF,IE,CEP,ENDERECO,BAIRRO,EMAIL,FONE,CELULAR) '+
//                                   ' VALUES (:ID,:PESSOA,:RAZAO,:FANTASIA,:CNPJCPF,:IE,:CEP,:ENDERECO,:BAIRRO,:EMAIL,:FONE,:CELULAR)';
//          Dm.FDQCliente.ParambyName('ID').ASINTEGER:= Dm.FDQConsulta.FieldByName('cod_cad').ASINTEGER;
//          Dm.FDQCliente.ParambyName('PESSOA').ASSTRING:=  'F';
//          Dm.FDQCliente.ParambyName('RAZAO').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);
//          Dm.FDQCliente.ParambyName('FANTASIA').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('nome').AsString,1,255);;
//          Dm.FDQCliente.ParambyName('CNPJCPF').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('cpf').AsString,1,20);
//          Dm.FDQCliente.ParambyName('IE').ASSTRING:= '';
//          Dm.FDQCliente.ParambyName('CEP').ASSTRING:=  Copy(Dm.FDQConsulta.FieldByName('Cep').AsString,1,10);
//          Dm.FDQCliente.ParambyName('ENDERECO').ASSTRING:=  Copy(Dm.FDQConsulta.FieldByName('endereco').AsString,1,200);
//          Dm.FDQCliente.ParambyName('BAIRRO').ASSTRING:=  Copy(Dm.FDQConsulta.FieldByName('bairro').AsString,1,200);
//          Dm.FDQCliente.ParambyName('EMAIL').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('email').AsString,1,100);;
//          Dm.FDQCliente.ParambyName('FONE').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('ddd1').AsString +Dm.FDQConsulta.FieldByName('fone1').AsString,1,20);
//          Dm.FDQCliente.ParambyName('CELULAR').ASSTRING:= Copy(Dm.FDQConsulta.FieldByName('ddd2').AsString +Dm.FDQConsulta.FieldByName('fone2').AsString,1,20);
//          Dm.FDQCliente.ExecSQL;
//        end;

      end;
      inc(cli);
      Gauge1.Progress := cli;
      Dm.FDQConsulta.Next;
    end;
  except
    MessageDlg('Não foi possível importar tabela de Clientes!', mtError,[mbYes],0);
    exit;
  end;
  DM.cdsClientes.close;
  DM.cdsClientes.open;
  Gauge1.visible:= false;
  MessageDlg('Foram importados ' +inttostr(cli)+ ' Clientes!', mtInformation,[mbYes],0);
end;

procedure TfrmClientes.ACBrCEP1BuscaEfetuada(Sender: TObject);
var I : integer;
begin
  For I := 0 to ACBrCEP1.Enderecos.Count-1 do
  begin
    with ACBrCEP1.Enderecos[I] do
    begin
      cxDBCep.Text:= CEP;
      cxDBTextEdit8.Text:= Tipo_Logradouro+ ' ' +Logradouro;
      //:= Complemento ;
      cxDBTextEdit5.Text:= Bairro;
      cxDBTextEdit2.Text:= Municipio;
      cxDBTextEdit6.Text:= IBGE_Municipio;
      cxDBTextEdit15.Text:= UF;
      DM.cdsClientesENDERECO.AsString:= Tipo_Logradouro+ ' ' +Logradouro;
      DM.cdsClientesBairro.AsString:= Bairro;
      DM.cdsClientesCidade.AsString:= Municipio;
      DM.cdsClientesCODMUNICIPIO.AsString  := IBGE_Municipio;
      DM.cdsClientesUF.AsString:= UF;
      DM.cdsClientesCEP.Asstring := CEP;
    end;
  end;
end;

procedure TfrmClientes.Action1Execute(Sender: TObject);
begin
  AppBarShow(-1);
end;

procedure TfrmClientes.CloseButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmClientes.cxBtnTransportadoresClick(Sender: TObject);
begin
  if DM.cdsClientes.State in [dsEdit,dsInsert] then
  begin
    if not Assigned(frmLookUpTransportadores ) then
      frmLookUpTransportadores := TfrmLookUpTransportadores.Create(Self);
    frmLookUpTransportadores.Left := Trunc(Screen.Width / 2) - 200;
    frmLookUpTransportadores.Top := Trunc(Screen.Height / 2) - 200;
    if not dm.cdsTransportadores.Active then
      dm.cdsTransportadores.Active := True;
    frmLookUpTransportadores.ShowModal;
    dm.cdsClientesID_TRANSPORTADOR.AsInteger := dm.cdsTransportadoresID_TRANSPORTADOR.AsInteger;
    LocalizarTransportador(dm.cdsClientesID_TRANSPORTADOR.AsInteger);
  end;
end;

procedure TfrmClientes.cxButton1Click(Sender: TObject);
begin
  if not Assigned(FrmCNPJCPF) then
    FrmCNPJCPF := TFrmCNPJCPF.Create(Self);
    FrmCNPJCPF.ShowModal;
    cxDBTextEdit13.text:= FrmCNPJCPF.RazaoSocial;
    cxDBTextEdit14.text:= FrmCNPJCPF.Fantasia;
    cxDBTextEdit8.text:= FrmCNPJCPF.Endereco;
    cxDBTextEdit1.text:= FrmCNPJCPF.Numero;

    cxDBTextEdit5.text:= FrmCNPJCPF.Bairro;
    cxDBTextEdit2.text:= FrmCNPJCPF.Cidade;
    cxDBTextEdit15.text:= FrmCNPJCPF.UF;
    cxDBCep.text:= FrmCNPJCPF.CEP;
    cxDBTextEdit9.text:= FrmCNPJCPF.Email;
    cxDBTextEdit11.text:= FrmCNPJCPF.Telefone;

  FreeAndNil(FrmCNPJCPF);
end;

procedure TfrmClientes.cxButton3Click(Sender: TObject);
var
  cep: string;
begin
  if DM.cdsClientes.State in [dsEdit,dsInsert] then
  begin
    ACBrCEP1.WebService := TACBrCEPWebService( 10 ) ;
    ACBrCEP1.ChaveAcesso := '1STa9eKhhfKvc7Ljh6W6CO5Kr/bFOl.';

    cep:= Trim(RetirarPontosETracos(cxDBCep.Text));

    if cep = '' then
      cep:= Trim(RetirarPontosETracos(InputBox('Busca Cep','Informe a cep','')));

    if cep <> '' then
    begin
      try
        ACBrCEP1.BuscarPorCEP(cep);
      except
        On E : Exception do
        begin
          showmessage('Valor digitado é inválido'+#13+E.Message);
          abort;
        end;
      end;
    end;
  end;

end;

procedure TfrmClientes.cxDBNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex in [6,9] then
  begin
    cxButton1.Enabled:= true;
    cxButton3.Enabled:= true;
  end
  else
  begin
    cxButton1.Enabled:= false;
    cxButton3.Enabled:= false;
  end;
  if AButtonIndex = 10 then
  begin
    Self.SetFocus;
    if (Trim(cxDBTCNPJ.Text) = '') and (trim(cxDBTCPF.Text) = '') then
    begin
      MessageDlg('Não foi informado cpf/cnpj para este cliente',mtWarning,[mbOK],0);
      abort;
    end
    else
    if Trim(cxDBTCNPJ.Text) <> ''  then
    begin
      if not VerificaCNPJ(RetirarPontosETracos(cxDBTCNPJ.Text)) then
      begin
        MessageDlg('CNPJ informado para este cliente não é válido',mtWarning,[mbOK],0);
        abort;
      end;
    end
    else
    if Trim(cxDBTCPF.Text) <> ''  then
    begin
      if not VerificaCPF(RetirarPontosETracos(cxDBTCPF.Text)) then
      begin
        MessageDlg('CPF informado para este cliente não é válido',mtWarning,[mbOK],0);
        abort;
      end;
    end;

    if dm.cdsClientesENDERECO.AsString = '' then
    begin
      MessageDlg('O campo endereço do cliente não foi informado',mtWarning,[mbOK],0);
      abort;
    end;
    if dm.cdsClientesNUMERO.AsString = '' then
    begin
      MessageDlg('O campo numero do endereço do cliente não foi informado',mtWarning,[mbOK],0);
      abort;
    end;

    if dm.cdsClientesCEP.AsString = '' then
    begin
      MessageDlg('O campo cep do cliente não foi informado',mtWarning,[mbOK],0);
      abort;
    end;

    if dm.cdsClientesBAIRRO.AsString = '' then
    begin
      MessageDlg('O campo bairro do cliente não foi informado',mtWarning,[mbOK],0);
      abort;
    end;

    if dm.cdsClientesCIDADE.AsString = '' then
    begin
      MessageDlg('O campo cidade do cliente não foi informado',mtWarning,[mbOK],0);
      abort;
    end;

    if dm.cdsClientesUF.AsString = '' then
    begin
      MessageDlg('O campo UF do cliente não foi informado',mtWarning,[mbOK],0);
      abort;
    end;
  end;
end;

procedure TfrmClientes.cxDBTextEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    cxBtnTransportadoresClick(Self);
end;

procedure TfrmClientes.DBEdit1Change(Sender: TObject);
begin
  LocalizarTransportador(dm.cdsClientesID_TRANSPORTADOR.AsInteger);
end;

procedure TfrmClientes.edtClientesChange(Sender: TObject);
begin
  dm.cdsClientes.Close;
  dm.cdsClientes.CommandText := 'SELECT * FROM CLIENTES WHERE UPPER(RAZAO_SOCIAL) LIKE '+QuotedStr(AnsiUpperCase(edtClientes.Text)+'%');
  dm.cdsClientes.Active := True;
end;

procedure TfrmClientes.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  AppBarShow(0);
end;

procedure TfrmClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = VK_ESCAPE then
//    AppBarShow(-1)
//  else
//    AppBarShow(0);
end;

procedure TfrmClientes.FormResize(Sender: TObject);
begin
  AppBarResize;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  if not DM.cdsClientes.Active then
    DM.cdsClientes.Active := true;

  dm.cdsClientes.Close;
  dm.cdsClientes.CommandText := 'SELECT * FROM CLIENTES';
  DM.cdsClientes.Open;

end;

procedure TfrmClientes.ImportarCSV(Arquivo: string);
var
  ArquivoCSV: TextFile;
  Contador, I: Integer;
  Linha: String;
  Lista: TStringList;
  // Lê Linha e Monta os valores
  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then
        break;
      ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := ValorMontado;
  end;
begin
  // Carregando o arquivo ...
  AssignFile(ArquivoCSV, Arquivo);
  try
    Reset(ArquivoCSV);
    Readln(ArquivoCSV, Linha);
    Lista:= TStringList.Create;
    Lista.LoadFromFile(Arquivo);

    Contador := 1;

    Gauge1.Visible := true;
    Gauge1.MinValue := 0;
    Gauge1.MaxValue := Lista.Count ;

    while not Eoln(ArquivoCSV) do
    begin
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := 'INSERT INTO ESTOQUES (COD_CAD, NOME, EMAIL, SENHA, CPF, ENDERECO, NUMERO, COMPLEMENTO,' +
      'DDD1,FONE1,DDD2,FONE2, BAIRRO, CIDADE, UF, CEP, DATACAD, PAIS, DATAANI )'+
      ' VALUES ('+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+
                  QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+
                  QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+
                  QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+
                  QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+
                  QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+QuotedStr(MontaValor)+','+
                  QuotedStr(MontaValor)+')';
      DM.cdsGenerico.Execute;
      Readln(ArquivoCSV, Linha);
      Contador := Contador + 1;
      Gauge1.Progress := Contador;
    end;

    try
      Dm.cdsGenerico.Close;
      DM.cdsGenerico.CommandText := ' INSERT INTO CLIENTES '+
      '(ID_CLIENTE, RAZAO_SOCIAL,FANTASIA, CPF, EMAIL, ENDERECO,NUMERO,'+
      ' BAIRRO, CIDADE, UF, CEP, TELEFONE,CELULAR)'+
      ' SELECT CAST( REPLACE(COD_CAD,''.'','''') AS INTEGER),'+
      ' NOME AS RAZAO, NOME AS FANTASIA,'+
      ' SUBSTRING(CPF FROM 1 FOR 20), '+
      ' SUBSTRING(EMAIL FROM 1 FOR 20), ENDERECO, NUMERO,'+
      ' BAIRRO, CIDADE, SUBSTRING(UF FROM 1 FOR 2), SUBSTRING(CEP FROM 1 FOR 10),'+
      ' SUBSTRING(''('' || DDD1 || '') ''|| FONE1 FROM 1 FOR 100),'+
      ' SUBSTRING(''('' || DDD2 || '') '' || FONE2 FROM 1 FOR 100)'+
      ' FROM CADASTRO '+
      'WHERE NOT EXISTS(SELECT 1 FROM CLIENTES WHERE ID_CLIENTE = COD_CAD)';
      DM.cdsGenerico.Execute;
      MessageDlg('Arquivo foi importado com sucesso!', mtInformation,[mbYes],0);
    except
      MessageDlg('Não foi possível importar tabela de produtos!', mtError,[mbYes],0);
    end;
  finally
    Gauge1.Visible := false;
    CloseFile(ArquivoCSV);
  end;
end;

end.
