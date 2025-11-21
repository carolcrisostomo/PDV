unit URepositorioDeItens;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Provider;

type
  TRepositorioDeItens = class
  private
    FConnection: TSQLConnection;
    FSQLDataSet: TSQLDataSet;
    FProvider: TDataSetProvider;
  public
    constructor Create(AConnection: TSQLConnection); overload;
    destructor Destroy; override;
    function ObterItensPorVenda(ACodigoVenda: Integer): TClientDataSet;
    procedure InserirItem(ACodigoVenda, ACodigoProduto: Integer; AQtde: Integer; AValor: Double);
    function CalcularTotais(ACodigoVenda: Integer): Double;
  end;

implementation


constructor TRepositorioDeItens.Create(AConnection: TSQLConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FSQLDataSet := TSQLDataSet.Create(nil);
  FSQLDataSet.SQLConnection := FConnection;
  FProvider := TDataSetProvider.Create(nil);
  FProvider.DataSet := FSQLDataSet;
end;

destructor TRepositorioDeItens.Destroy;
begin
  FProvider.Free;
  FSQLDataSet.Free;
  inherited;
end;

procedure TRepositorioDeItens.InserirItem(ACodigoVenda, ACodigoProduto: Integer; AQtde: Integer; AValor: Double);
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := 'INSERT INTO VendaItem (Codigo_Venda, Codigo_Produto, Valor, Qtde, Valor_Subtotal) ' +
    'VALUES (:CodigoVenda, :CodigoProduto, :Valor, :Qtde, :Subtotal)';
  FSQLDataSet.Params.ParamByName('CodigoVenda').AsInteger := ACodigoVenda;
  FSQLDataSet.Params.ParamByName('CodigoProduto').AsInteger := ACodigoProduto;
  FSQLDataSet.Params.ParamByName('Valor').AsFloat := AValor;
  FSQLDataSet.Params.ParamByName('Qtde').AsInteger := AQtde;
  FSQLDataSet.Params.ParamByName('Subtotal').AsFloat := AValor * AQtde;
  FSQLDataSet.ExecSQL;
end;

function TRepositorioDeItens.CalcularTotais(ACodigoVenda: Integer): Double;
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := Format('SELECT SUM(Valor_Subtotal) AS Total FROM VendaItem WHERE Codigo_Venda = %d', [ACodigoVenda]);
  FSQLDataSet.Open;
  try
    Result := FSQLDataSet.FieldByName('Total').AsFloat;
  finally
    FSQLDataSet.Close;
  end;
end;

function TRepositorioDeItens.ObterItensPorVenda(ACodigoVenda: Integer): TClientDataSet;
var
  cds: TClientDataSet;
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := Format('SELECT vi.Codigo_Sequencial, vi.Codigo_Venda, vi.Codigo_Produto, p.Descricao as Produto, vi.Valor, vi.Qtde, vi.Valor_Subtotal ' +
    'FROM VendaItem vi LEFT JOIN CADProduto p ON p.Codigo = vi.Codigo_Produto WHERE vi.Codigo_Venda = %d', [ACodigoVenda]);
  FSQLDataSet.Open;
  FProvider.DataSet := FSQLDataSet;
  cds := TClientDataSet.Create(nil);
  cds.SetProvider(FProvider);
  cds.Open;
  Result := cds;
end;

end.
