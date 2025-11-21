object FrmConsultaVendas: TFrmConsultaVendas
  Left = 0
  Top = 0
  Caption = 'Consulta de Vendas'
  ClientHeight = 490
  ClientWidth = 1102
  Color = 2105376
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    1102
    490)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 19
    Top = 12
    Width = 100
    Height = 19
    Caption = 'Data Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 224
    Top = 12
    Width = 89
    Height = 19
    Caption = 'Data Final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtInicial: TDateTimePicker
    Left = 19
    Top = 37
    Width = 186
    Height = 27
    Date = 45980.634009108800000000
    Time = 45980.634009108800000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object dtFinal: TDateTimePicker
    Left = 224
    Top = 37
    Width = 186
    Height = 27
    Date = 45980.634009120370000000
    Time = 45980.634009120370000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object BtnFiltrar: TButton
    Left = 923
    Top = 18
    Width = 164
    Height = 46
    Anchors = [akTop, akRight]
    Caption = 'Filtrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnFiltrarClick
    ExplicitLeft = 453
  end
  object DBGrid1: TDBGrid
    Left = 19
    Top = 76
    Width = 1070
    Height = 341
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Color = clGradientInactiveCaption
    DataSource = dsVendas
    DragMode = dmAutomatic
    DrawingStyle = gdsGradient
    FixedColor = clCaptionText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'N'#250'mero da Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Data da Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_BRUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Total Bruto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_DESCONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Desconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_LIQUIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Total L'#237'quido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cancelada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Venda Cancelada'
        Visible = True
      end>
  end
  object BtnFechar: TButton
    Left = 923
    Top = 429
    Width = 164
    Height = 46
    Anchors = [akRight, akBottom]
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BtnFecharClick
    ExplicitLeft = 453
    ExplicitTop = 422
  end
  object dsVendas: TDataSource
    Left = 25
    Top = 442
  end
end
