object FrmPDV: TFrmPDV
  Left = 0
  Top = 0
  Caption = 'Caixa - Vendas (PDV)'
  ClientHeight = 520
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 56
    Align = alTop
    TabOrder = 0
    object LblVendaNum: TLabel
      Left = 8
      Top = 12
      Width = 69
      Height = 13
      Caption = 'Venda: #0001'
    end
    object LblDataVenda: TLabel
      Left = 200
      Top = 12
      Width = 86
      Height = 13
      Caption = 'Data: 19/09/2025'
    end
    object LblStatusVenda: TLabel
      Left = 420
      Top = 12
      Width = 77
      Height = 13
      Caption = 'Status: ABERTA'
    end
  end
  object ItemsGrid: TDBGrid
    Left = 0
    Top = 56
    Width = 580
    Height = 464
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object PanelRight: TPanel
    Left = 580
    Top = 56
    Width = 320
    Height = 464
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object LblValorBruto: TLabel
      Left = 8
      Top = 16
      Width = 98
      Height = 13
      Caption = 'Valor Bruto: R$ 0,00'
    end
    object LblDesconto: TLabel
      Left = 8
      Top = 44
      Width = 90
      Height = 13
      Caption = 'Desconto: R$ 0,00'
    end
    object LblValorLiquido: TLabel
      Left = 8
      Top = 72
      Width = 114
      Height = 13
      Caption = 'Valor L'#195#173'quido: R$ 0,00'
    end
    object CmbFormaPagamento: TComboBox
      Left = 8
      Top = 110
      Width = 200
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'Dinheiro'
        'Cart'#195#163'o Cr'#195#169'dito'
        'Cart'#195#163'o D'#195#169'bito'
        'Pix')
    end
    object EdtValorPago: TEdit
      Left = 8
      Top = 146
      Width = 120
      Height = 21
      TabOrder = 1
      Text = '0,00'
    end
    object BtnAplicarPagamento: TButton
      Left = 140
      Top = 144
      Width = 160
      Height = 25
      Caption = 'Aplicar Pagamento'
      TabOrder = 2
    end
    object EdtDescontoPercent: TEdit
      Left = 8
      Top = 186
      Width = 60
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object BtnAplicarDesconto: TButton
      Left = 80
      Top = 184
      Width = 120
      Height = 25
      Caption = 'Aplicar %'
      TabOrder = 4
    end
    object BtnAdicionarItemInline: TButton
      Left = 8
      Top = 230
      Width = 140
      Height = 25
      Caption = 'Adicionar Item'
      TabOrder = 5
    end
    object BtnFinalizar: TButton
      Left = 8
      Top = 270
      Width = 140
      Height = 25
      Caption = 'Finalizar Venda'
      TabOrder = 6
    end
    object BtnCancelar: TButton
      Left = 8
      Top = 310
      Width = 140
      Height = 25
      Caption = 'Cancelar Venda'
      TabOrder = 7
    end
  end
end
