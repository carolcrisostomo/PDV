object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Sistema - Menu Principal'
  ClientHeight = 300
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 160
    Height = 300
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object BtnVendas: TButton
      Left = 8
      Top = 16
      Width = 144
      Height = 36
      Caption = 'Vendas'
      TabOrder = 0
    end
    object BtnConsulta: TButton
      Left = 8
      Top = 64
      Width = 144
      Height = 36
      Caption = 'Consultar Vendas'
      TabOrder = 1
    end
    object BtnProdutos: TButton
      Left = 8
      Top = 112
      Width = 144
      Height = 36
      Caption = 'Produtos'
      TabOrder = 2
    end
    object BtnSair: TButton
      Left = 8
      Top = 200
      Width = 144
      Height = 36
      Caption = 'Sair'
      TabOrder = 3
    end
  end
  object PanelContent: TPanel
    Left = 160
    Top = 0
    Width = 440
    Height = 300
    Align = alClient
    TabOrder = 1
  end
end
