unit UntComposicaoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxCurrencyEdit, ACBrBase, ACBrTroco;

type
  TFrmComposicaoVenda = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    edtValor: TcxCurrencyEdit;
    edtDesconto: TcxCurrencyEdit;
    cxTroco: TcxCurrencyEdit;
    Label3: TLabel;
    Memo2: TMemo;
    Button2: TButton;
    ACBrTroco1: TACBrTroco;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtValorPropertiesChange(Sender: TObject);
    procedure edtDescontoPropertiesChange(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

    vlPagar: Real;
    vlTroco: Real;
  end;

var
  FrmComposicaoVenda: TFrmComposicaoVenda;


implementation
Uses ACBrUtil ;

{$R *.dfm}

procedure TFrmComposicaoVenda.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmComposicaoVenda.edtDescontoPropertiesChange(Sender: TObject);
var
   A:integer;
begin
  if (edtValor.Value > 0) and (edtValor.Value >= vlPagar) then
    cxTroco.Value:=  ((vlPagar - edtDesconto.Value) - edtValor.Value)
  else
  begin
    cxTroco.Value:= 0;
    Memo2.Lines.Clear;
  end;

  if cxTroco.Value < 0 then
     cxTroco.Value:= (cxTroco.Value*(-1));
  if cxTroco.Value > 0 then
  begin

    try
        ACBrTroco1.Troco := cxTroco.Value;
        vlTroco:= ACBrTroco1.Troco;
     except
        ShowMessage('Valor invalido');
     end;


     Memo2.Lines.Clear;
     for A := 0 to ACBrTroco1.TrocoList.Count -1 do
        Memo2.Lines.Add(ACBrTroco1.TrocoList[A].DescricaoCompleta);
  end;

end;

procedure TFrmComposicaoVenda.edtValorPropertiesChange(Sender: TObject);
var
   A:integer;
begin
  if (edtValor.Value > 0) and (edtValor.Value >= vlPagar) then
    cxTroco.Value:=  ((vlPagar - edtDesconto.Value) - edtValor.Value)
  else
  begin
    cxTroco.Value:= 0;
    Memo2.Lines.Clear;
  end;

  if cxTroco.Value < 0 then
     cxTroco.Value:= (cxTroco.Value*(-1));
  if cxTroco.Value > 0 then
  begin

    try
        ACBrTroco1.Troco := cxTroco.Value;
        vlTroco:= ACBrTroco1.Troco;
     except
        ShowMessage('Valor invalido');
     end;


     Memo2.Lines.Clear;
     for A := 0 to ACBrTroco1.TrocoList.Count -1 do
        Memo2.Lines.Add(ACBrTroco1.TrocoList[A].DescricaoCompleta);
  end;

end;


procedure TFrmComposicaoVenda.FormActivate(Sender: TObject);
begin
  if edtValor.canfocus then
    edtValor.Setfocus;
end;

end.
