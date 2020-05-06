object frmSplash: TfrmSplash
  Left = 294
  Top = 163
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmSplash'
  ClientHeight = 339
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 611
    Height = 339
    Align = alClient
    Stretch = True
    ExplicitLeft = -120
    ExplicitTop = -8
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 568
    Top = 8
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 212
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 328
    Top = 280
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Server = DSServer1
    Filters = <>
    Left = 200
    Top = 280
  end
  object DSServer1: TDSServer
    Left = 24
    Top = 280
  end
  object DSServerClass2: TDSServerClass
    OnGetClass = DSServerClass2GetClass
    Server = DSServer1
    Left = 96
    Top = 272
  end
end
