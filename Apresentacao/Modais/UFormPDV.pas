unit UFormPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Datasnap.DBClient, URepositorioDeItens, URepositorioDeVendas, URepositorioDeReceitasEDescontos,
  Dialogs, UControladorDeVendas, URepositorioDeProdutos;

type
  TFrmPDV = class(TForm)
    TopPanel: TPanel;
    LblVenda: TLabel;
    LblData: TLabel;
    LblStatus: TLabel;
    GridItens: TDBGrid;
    PanelRight: TPanel;
    CmbFormaPagamento: TComboBox;
    EdtValorPago: TEdit;
    BtnAplicarPagamento: TButton;
    Panel1: TPanel;
    BtnCancelar: TButton;
    BtnFinalizar: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    EdtCodigoProduto: TEdit;
    EdtQuantidade: TEdit;
    BtnAdicionar: TButton;
    BtnRemover: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    LblValorBruto: TLabel;
    LblDesconto: TLabel;
    LblValorLiquido: TLabel;
    Label4: TLabel;
    EditDescricaoProduto: TEdit;
    Label5: TLabel;
    EditPrecoProduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnFinalizarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnAplicarPagamentoClick(Sender: TObject);
    procedure EdtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditPrecoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescricaoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRemoverClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FRepoItens: TRepositorioDeItens;
    FRepoVendas: TRepositorioDeVendas;
    FRepoReceitas: TRepositorioDeReceitasEDescontos;
    FRepoProdutos: TRepositorioDeProdutos;
    FCDSItens: TClientDataSet;
    FDataSourceItens: TDataSource;
    FCurrentVenda: Integer;
    FControlador: TControladorDeVendas;
    FValorPRoduto: Double;
    procedure CriarNovaVenda;
    procedure AtualizarItensETotais;
    procedure TratarErro(const AContext: string; E: Exception);

  public
    property Controlador: TControladorDeVendas read FControlador write FControlador;
    { Public declarations }
  end;

var
  FrmPDV: TFrmPDV;

implementation

{$R *.dfm}

uses
  UAdaptadorDeConexaoFirebird, ThemeManager;

procedure TFrmPDV.CriarNovaVenda;
begin
  FCurrentVenda := FRepoVendas.InserirVenda(Date, 0.00, 0.00, 0.00);
  LblVenda.Caption := 'Venda: #' + IntToStr(FCurrentVenda);
  LblData.Caption := 'Data: ' + DateToStr(Date);
  LblStatus.Caption := 'Status: ABERTA';
end;

procedure TFrmPDV.EditDescricaoProdutoKeyPress(Sender: TObject; var Key: Char);
begin
   Key := #0;
end;

procedure TFrmPDV.EditPrecoProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key  =#13) then
    SelectNext(ActiveControl, True, True);

  if not (Key in ['0'..'9', #8]) then
    Key := #0;

end;

procedure TFrmPDV.EdtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    EditDescricaoProduto.Text:= FRepoProdutos.BuscarDescricao(StrToInt(EdtCodigoProduto.Text));
    if EditDescricaoProduto.Text = '' then
    begin
      ShowMessage('Produto não encontrado');
      EdtCodigoProduto.SetFocus;
    end;
    FValorPRoduto:= FRepoProdutos.BuscarPreco(StrToInt(EdtCodigoProduto.Text));
    EditPrecoProduto.Text:= FloatToStrF(FRepoProdutos.BuscarPreco(StrToInt(EdtCodigoProduto.Text)), ffNumber, 15, 2);
    EdtQuantidade.SetFocus;
  end;

  if not (Key in ['0'..'9', #8]) then
    Key := #0;

end;

procedure TFrmPDV.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TFrmPDV.TratarErro(const AContext: string; E: Exception);
begin
  ShowMessage(Format('%s: %s', [AContext, E.Message]));
end;

procedure TFrmPDV.FormCreate(Sender: TObject);
begin
  TThemeManager.ApplyDarkTheme(Self);

  FRepoItens := TRepositorioDeItens.Create(dmConexaoFirebird.GetConnection);
  FRepoVendas := TRepositorioDeVendas.Create(dmConexaoFirebird.GetConnection);
  FRepoReceitas := TRepositorioDeReceitasEDescontos.Create(dmConexaoFirebird.GetConnection);
  FRepoProdutos := TRepositorioDeProdutos.Create(dmConexaoFirebird.GetConnection);

  FDataSourceItens := TDataSource.Create(Self);
  try
    CriarNovaVenda;
  except
    on E: Exception do
      TratarErro('Erro ao criar venda', E);
  end;

  AtualizarItensETotais;
end;

procedure TFrmPDV.AtualizarItensETotais;
var
  total: Double;
begin
  if Assigned(FCDSItens) then
  begin
    try
      FCDSItens.Close;
      FreeAndNil(FCDSItens);
    except end;
  end;

  try
    FCDSItens := FRepoItens.ObterItensPorVenda(FCurrentVenda);
    FDataSourceItens.DataSet := FCDSItens;
    GridItens.DataSource := FDataSourceItens;

    total := FRepoItens.CalcularTotais(FCurrentVenda);
    LblValorBruto.Caption := 'Valor Bruto: R$ ' + FormatFloat('0.00', total);
    LblDesconto.Caption := 'Desconto: R$ 0,00';
    LblValorLiquido.Caption := 'Valor Líquido: R$ ' + FormatFloat('0.00', total);
  except
    on E: Exception do
      TratarErro('Erro ao atualizar itens', E);
  end;
end;

procedure TFrmPDV.BtnAdicionarClick(Sender: TObject);
var
  codigoStr, qtdeStr, valorStr: string;
  codigo, qtde: Integer;
  valor: Double;
  total: Double;
begin
  codigoStr := Trim(EdtCodigoProduto.Text);
  if codigoStr = '' then
  begin
    ShowMessage('Informe o código do produto.');
    Exit;
  end;

  codigo := StrToIntDef(codigoStr, 0);
  if codigo = 0 then
  begin
    ShowMessage('Código inválido.');
    Exit;
  end;

  qtdeStr := Trim(EdtQuantidade.Text);
  qtde := StrToIntDef(qtdeStr, 1);
  if qtde <= 0 then
  begin
    ShowMessage('Quantidade inválida.');
    Exit;
  end;

  //valorStr := InputBox('Valor unitário', 'Informe o valor unitário (use . ou ,):', '0.00');
  valor := FValorProduto;
  if valor <= 0 then
  begin
    ShowMessage('Valor inválido.');
    Exit;
  end;

  try
    FRepoItens.InserirItem(FCurrentVenda, codigo, qtde, valor);
    total := FRepoItens.CalcularTotais(FCurrentVenda);
    FRepoVendas.AtualizarTotais(FCurrentVenda, total, 0.00, total);
    AtualizarItensETotais;
    EdtCodigoProduto.Text := '';
    EdtQuantidade.Text := '1';
  except
    on E: Exception do
      TratarErro('Erro ao inserir item', E);
  end;
end;

procedure TFrmPDV.BtnAplicarPagamentoClick(Sender: TObject);
var
  CodReceita: Integer;
  Valor: Double;
begin
  Valor := StrToFloatDef(EdtValorPago.Text, 0);
  if Valor <= 0 then
  begin
    ShowMessage('Informe um valor válido.');
    Exit;
  end;

  ShowMessage('Pagamento aplicado com sucesso.');
end;

procedure TFrmPDV.BtnCancelarClick(Sender: TObject);
begin
  ShowMessage('Em construção...');
end;

procedure TFrmPDV.BtnFinalizarClick(Sender: TObject);
begin
  try
    LblStatus.Caption := 'Status: FINALIZADA';
    ShowMessage('Venda finalizada com sucesso.');
    Close;
  except
    on E: Exception do
      TratarErro('Erro ao finalizar venda', E);
  end;
end;

procedure TFrmPDV.BtnRemoverClick(Sender: TObject);
begin
  ShowMessage('Em construção...');
end;

procedure TFrmPDV.FormDestroy(Sender: TObject);
begin
  if Assigned(FCDSItens) then
  begin
    try
      FCDSItens.Close;
    except end;
    FreeAndNil(FCDSItens);
  end;
  FreeAndNil(FDataSourceItens);
  FreeAndNil(FRepoItens);
  FreeAndNil(FRepoVendas);
  FreeAndNil(FRepoReceitas);
end;

end.

