unit URepositorioDeReceitasEDescontos;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider;

type
  TRepositorioDeReceitasEDescontos = class
  private
    FConnection: TSQLConnection;
    FSQLDataSet: TSQLDataSet;
    FProvider: TDataSetProvider;
  public
    constructor Create(AConnection: TSQLConnection); overload;
    destructor Destroy; override;
    function ObterReceitas: TClientDataSet;
    function ObterDescontos: TClientDataSet;
    procedure InserirReceita(ACodigoVenda, ACodigoReceita: Integer; const ADescricao: string; AValor: Double);
    procedure InserirDesconto(ACodigoVenda, ACodigoDesconto: Integer; const ADescricao: string; APercentual: Double);
  end;

implementation



constructor TRepositorioDeReceitasEDescontos.Create(AConnection: TSQLConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FSQLDataSet := TSQLDataSet.Create(nil);
  FSQLDataSet.SQLConnection := FConnection;
  FProvider := TDataSetProvider.Create(nil);
  FProvider.DataSet := FSQLDataSet;
end;

destructor TRepositorioDeReceitasEDescontos.Destroy;
begin
  FProvider.Free;
  FSQLDataSet.Free;
  inherited;
end;

function TRepositorioDeReceitasEDescontos.ObterDescontos: TClientDataSet;
var cds: TClientDataSet;
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := 'SELECT 1 AS Codigo, ''Desconto de 10%'' AS Descricao, 10.0 AS Percentual FROM RDB$DATABASE ' +
    'UNION ALL SELECT 2, ''Desconto Funcionário'', 50.0 FROM RDB$DATABASE ' +
    'UNION ALL SELECT 3, ''Desconto Cortesia'', 90.0 FROM RDB$DATABASE';
  FSQLDataSet.Open;
  FProvider.DataSet := FSQLDataSet;
  cds := TClientDataSet.Create(nil);
  cds.SetProvider(FProvider);
  cds.Open;
  Result := cds;
end;

function TRepositorioDeReceitasEDescontos.ObterReceitas: TClientDataSet;
var cds: TClientDataSet;
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := 'SELECT 1 AS Codigo, ''Dinheiro'' AS Descricao FROM RDB$DATABASE ' +
    'UNION ALL SELECT 2, ''Cartão Crédito'' FROM RDB$DATABASE ' +
    'UNION ALL SELECT 3, ''Cartão Débito'' FROM RDB$DATABASE';
  FSQLDataSet.Open;
  FProvider.DataSet := FSQLDataSet;
  cds := TClientDataSet.Create(nil);
  cds.SetProvider(FProvider);
  cds.Open;
  Result := cds;
end;

procedure TRepositorioDeReceitasEDescontos.InserirDesconto(ACodigoVenda, ACodigoDesconto: Integer; const ADescricao: string; APercentual: Double);
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := 'INSERT INTO VendaDesconto (Codigo_Sequencial, Codigo_Venda, Codigo_Desconto, Descricao_Desconto, Valor_Percentual) ' +
    'VALUES (NEXT VALUE FOR GEN_VENDADESCONTO, :CodigoVenda, :CodigoDesconto, :Descricao, :Percentual)';
  FSQLDataSet.Params.ParamByName('CodigoVenda').AsInteger := ACodigoVenda;
  FSQLDataSet.Params.ParamByName('CodigoDesconto').AsInteger := ACodigoDesconto;
  FSQLDataSet.Params.ParamByName('Descricao').AsString := ADescricao;
  FSQLDataSet.Params.ParamByName('Percentual').AsFloat := APercentual;
  FSQLDataSet.ExecSQL;
end;

procedure TRepositorioDeReceitasEDescontos.InserirReceita(ACodigoVenda, ACodigoReceita: Integer; const ADescricao: string; AValor: Double);
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := 'INSERT INTO VendaReceita (Codigo_Sequencial, Codigo_Venda, Codigo_Receita, Descricao_Receita, Valor) ' +
    'VALUES (NEXT VALUE FOR GEN_VENDARECEITA, :CodigoVenda, :CodigoReceita, :Descricao, :Valor)';
  FSQLDataSet.Params.ParamByName('CodigoVenda').AsInteger := ACodigoVenda;
  FSQLDataSet.Params.ParamByName('CodigoReceita').AsInteger := ACodigoReceita;
  FSQLDataSet.Params.ParamByName('Descricao').AsString := ADescricao;
  FSQLDataSet.Params.ParamByName('Valor').AsFloat := AValor;
  FSQLDataSet.ExecSQL;
end;

end.
