object FrmConsulta: TFrmConsulta
  Left = 0
  Top = 0
  Caption = 'Consulta de Vendas'
  ClientHeight = 535
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 911
    Height = 56
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 900
    object LblTitulo: TLabel
      Left = 16
      Top = 12
      Width = 95
      Height = 13
      Caption = 'Consulta de Vendas'
    end
  end
  object GridVendas: TDBGrid
    Left = 0
    Top = 56
    Width = 911
    Height = 479
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BtnFechar: TButton
    Left = 144
    Top = 8
    Width = 136
    Height = 32
    Caption = 'Fechar'
    TabOrder = 2
  end
end
