unit UntMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,QRCtrls, QuickRpt, Data.DB,
  Datasnap.DBClient, Vcl.ExtCtrls;

type
  TfrmMovimentacao = class(TForm)
    QRRelatorioGerencial: TQuickRep;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    qrlPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand6: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand7: TQRBand;
    qrlValorTotalPedido: TQRLabel;
    QRLabel17: TQRLabel;
    cdsRelatorioGerencial: TClientDataSet;
    cdsRelatorioGerencialDATA: TDateField;
    cdsRelatorioGerencialID_PEDIDO: TIntegerField;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentacao: TfrmMovimentacao;

implementation

{$R *.dfm}

uses UDataModul;

end.
