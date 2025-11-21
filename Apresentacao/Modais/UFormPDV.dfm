object FrmPDV: TFrmPDV
  Left = 0
  Top = 0
  Caption = 'Caixa - Vendas'
  ClientHeight = 604
  ClientWidth = 1120
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 1120
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1002
    object LblVenda: TLabel
      Left = 0
      Top = 0
      Width = 225
      Height = 55
      Align = alLeft
      AutoSize = False
      Caption = 'Venda: #0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 56
    end
    object LblData: TLabel
      Left = 225
      Top = 0
      Width = 559
      Height = 55
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 280
      ExplicitHeight = 46
    end
    object LblStatus: TLabel
      Left = 784
      Top = 0
      Width = 336
      Height = 55
      Align = alRight
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Status: -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 664
      ExplicitHeight = 46
    end
  end
  object GridItens: TDBGrid
    Left = 0
    Top = 55
    Width = 758
    Height = 549
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Color = clGradientInactiveCaption
    DragMode = dmAutomatic
    DrawingStyle = gdsGradient
    FixedColor = clCaptionText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'Codigo_Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 169
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Valor Unit'#225'rio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Qtde.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 103
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'Valor_Subtotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Valor total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 105
        Visible = True
      end>
  end
  object PanelRight: TPanel
    Left = 758
    Top = 55
    Width = 362
    Height = 549
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 680
    ExplicitTop = 86
    ExplicitWidth = 355
    ExplicitHeight = 514
    DesignSize = (
      362
      549)
    object Label3: TLabel
      Left = 13
      Top = 312
      Width = 188
      Height = 23
      Caption = 'Forma de pagamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 13
      Top = 381
      Width = 120
      Height = 23
      Caption = 'Valor a pagar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object CmbFormaPagamento: TComboBox
      Left = 14
      Top = 341
      Width = 334
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'Dinheiro'
        'Cart'#227'o Cr'#233'dito'
        'Cart'#227'o D'#233'bito'
        'Pix')
      ExplicitWidth = 331
    end
    object EdtValorPago: TEdit
      Left = 13
      Top = 410
      Width = 165
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0,00'
      ExplicitWidth = 162
    end
    object BtnAplicarPagamento: TButton
      Left = 190
      Top = 402
      Width = 161
      Height = 46
      Anchors = [akTop, akRight]
      Caption = 'Aplicar Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnAplicarPagamentoClick
      ExplicitLeft = 187
    end
    object Panel1: TPanel
      Left = 0
      Top = 483
      Width = 362
      Height = 66
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 448
      ExplicitWidth = 355
      DesignSize = (
        362
        66)
      object BtnCancelar: TButton
        Left = 13
        Top = 10
        Width = 164
        Height = 46
        Anchors = [akLeft, akBottom]
        Caption = 'Cancelar Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtnCancelarClick
      end
      object BtnFinalizar: TButton
        Left = 187
        Top = 10
        Width = 164
        Height = 46
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Finalizar Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BtnFinalizarClick
        ExplicitWidth = 161
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 362
      Height = 201
      Align = alTop
      TabOrder = 4
      ExplicitLeft = 6
      ExplicitTop = 6
      ExplicitWidth = 355
      DesignSize = (
        362
        201)
      object Label1: TLabel
        Left = 13
        Top = 12
        Width = 72
        Height = 23
        Caption = 'Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 160
        Top = 77
        Width = 108
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Quantidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 104
      end
      object Label5: TLabel
        Left = 127
        Top = 114
        Width = 53
        Height = 23
        Caption = 'Pre'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EdtCodigoProduto: TEdit
        Left = 13
        Top = 36
        Width = 69
        Height = 30
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EdtCodigoProdutoKeyPress
      end
      object EdtQuantidade: TEdit
        Left = 283
        Top = 72
        Width = 68
        Height = 31
        Alignment = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = EdtQuantidadeKeyPress
        ExplicitWidth = 65
      end
      object BtnAdicionar: TButton
        Left = 184
        Top = 149
        Width = 167
        Height = 46
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Adicionar Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BtnAdicionarClick
        ExplicitWidth = 164
      end
      object BtnRemover: TButton
        Left = 13
        Top = 149
        Width = 164
        Height = 46
        Caption = 'Remover Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BtnRemoverClick
      end
      object EditDescricaoProduto: TEdit
        Left = 90
        Top = 36
        Width = 261
        Height = 30
        Anchors = [akLeft, akTop, akRight]
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnKeyPress = EditDescricaoProdutoKeyPress
        ExplicitWidth = 258
      end
      object EditPrecoProduto: TEdit
        Left = 191
        Top = 109
        Width = 159
        Height = 31
        Alignment = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnKeyPress = EditDescricaoProdutoKeyPress
        ExplicitWidth = 156
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 201
      Width = 362
      Height = 105
      Align = alTop
      TabOrder = 5
      ExplicitWidth = 355
      DesignSize = (
        362
        105)
      object LblValorBruto: TLabel
        Left = 177
        Top = 14
        Width = 170
        Height = 23
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Valor Bruto: R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 174
      end
      object LblDesconto: TLabel
        Left = 193
        Top = 42
        Width = 154
        Height = 23
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Desconto: R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 190
      end
      object LblValorLiquido: TLabel
        Left = 162
        Top = 70
        Width = 185
        Height = 23
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Valor L'#237'quido: R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 159
      end
    end
  end
end
