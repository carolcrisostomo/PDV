unit uFrmPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,
  URepositorioDeItens, URepositorioDeVendas, URepositorioDeReceitasEDescontos;

type
  TFrmPDV = class(TForm)
    TopPanel: TPanel;
    LblVendaNum: TLabel;
    LblDataVenda: TLabel;
    LblStatusVenda: TLabel;
    ItemsGrid: TDBGrid;
    PanelRight: TPanel;
    LblValorBruto: TLabel;
    LblDesconto: TLabel;
    LblValorLiquido: TLabel;
    CmbFormaPagamento: TComboBox;
    EdtValorPago: TEdit;
    BtnAplicarPagamento: TButton;
    EdtDescontoPercent: TEdit;
    BtnAplicarDesconto: TButton;
    BtnAdicionarItemInline: TButton;
    BtnFinalizar: TButton;
    BtnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionarItemInlineClick(Sender: TObject);
    procedure BtnFinalizarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FRepoItens: TRepositorioDeItens;
    FRepoVendas: TRepositorioDeVendas;
    FRepoReceitas: TRepositorioDeReceitasEDescontos;
    FCDSItens: TClientDataSet;
    FDataSource: TDataSource;
    FCurrentVendaId: Integer;
    procedure AtualizarGridETotais;
  public
    { Public declarations }
  end;

var
  FrmPDV: TFrmPDV;

implementation

{$R *.dfm}

uses
  UAdaptadorDeConexaoFirebird;

procedure TFrmPDV.FormCreate(Sender: TObject);
begin
  // criar repositórios usando a conexão compartilhada
  FRepoItens := TRepositorioDeItens.Create(dmConexaoFirebird.GetConnection);
  FRepoVendas := TRepositorioDeVendas.Create(dmConexaoFirebird.GetConnection);
  FRepoReceitas := TRepositorioDeReceitasEDescontos.Create(dmConexaoFirebird.GetConnection);

  // criar nova venda (totais zero) e manter o id
  FCurrentVendaId := FRepoVendas.InserirVenda(Date, 0.00, 0.00, 0.00);
  LblVendaNum.Caption := 'Venda: #' + IntToStr(FCurrentVendaId);
  LblDataVenda.Caption := 'Data: ' + DateToStr(Date);
  LblStatusVenda.Caption := 'Status: ABERTA';

  // criar DataSource e carregar itens atuais
  FDataSource := TDataSource.Create(Self);
  AtualizarGridETotais;
end;

procedure TFrmPDV.AtualizarGridETotais;
var
  total: Real;
begin
  if Assigned(FCDSItens) then
  begin
    try
      FCDSItens.Close;
      FreeAndNil(FCDSItens);
    except end;
  end;
  FCDSItens := FRepoItens.ObterItensPorVenda(FCurrentVendaId);
  FDataSource.DataSet := FCDSItens;
  ItemsGrid.DataSource := FDataSource;

  // atualizar totais
  total := FRepoItens.CalcularTotais(FCurrentVendaId);
  LblValorBruto.Caption := 'Valor Bruto: R$ ' + FormatFloat('0.00', total);
  // obter desconto aplicado via repo de receitas/descontos se houver (simplificação: 0)
  LblDesconto.Caption := 'Desconto: R$ 0,00';
  LblValorLiquido.Caption := 'Valor Líquido: R$ ' + FormatFloat('0.00', total);
  EdtValorPago.Text := '0,00';
end;

procedure TFrmPDV.BtnAdicionarItemInlineClick(Sender: TObject);
var
  sCodigo, sQtde, sValor: string;
  CodigoProduto, Qtde: Integer;
  Valor, total: Double;
begin
  sCodigo := InputBox('Produto', 'Informe o código do produto:', '');
  if sCodigo = '' then Exit;
  CodigoProduto := StrToIntDef(sCodigo, 0);
  if CodigoProduto = 0 then
  begin
    ShowMessage('Código inválido.');
    Exit;
  end;

  sQtde := InputBox('Quantidade', 'Informe a quantidade:', '1');
  Qtde := StrToIntDef(sQtde, 1);
  sValor := InputBox('Valor unitário', 'Informe o valor unitário (use . como separador):', '0.00');
  Valor := StrToFloatDef(StringReplace(sValor, ',', '.', [rfReplaceAll]), 0);

  // inserir item via repositório
  FRepoItens.InserirItem(FCurrentVendaId, CodigoProduto, Qtde, Valor);

  // recalcular totais e atualizar
  total := FRepoItens.CalcularTotais(FCurrentVendaId);
  // atualizar venda com novos totais (desconto=0 neste fluxo)
  FRepoVendas.AtualizarTotais(FCurrentVendaId, total, 0.00, total);

  AtualizarGridETotais;
end;

procedure TFrmPDV.BtnFinalizarClick(Sender: TObject);
begin
  // aqui você deve implementar regras para finalizar (ex.: verificar forma de pagamento, saldo)
  LblStatusVenda.Caption := 'Status: FINALIZADA';
  ShowMessage('Venda finalizada. (Integre impressão/fechamento conforme necessário)');
end;

procedure TFrmPDV.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FCDSItens);
  FreeAndNil(FDataSource);
  FreeAndNil(FRepoItens);
  FreeAndNil(FRepoVendas);
  FreeAndNil(FRepoReceitas);
end;

end.
