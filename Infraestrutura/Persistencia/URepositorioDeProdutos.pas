unit URepositorioDeProdutos;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Provider;

type
  TRepositorioDeProdutos = class
  private
    FConnection: TSQLConnection;
    FSQLDataSet: TSQLDataSet;
    FProvider: TDataSetProvider;
  public
    constructor Create(AConnection: TSQLConnection); overload;
    destructor Destroy; override;
    function BuscarPreco(ACodigoProduto: Integer): Double;
    function BuscarDescricao(ACodigoProduto: Integer): String;
  end;

implementation


constructor TRepositorioDeProdutos.Create(AConnection: TSQLConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FSQLDataSet := TSQLDataSet.Create(nil);
  FSQLDataSet.SQLConnection := FConnection;
  FProvider := TDataSetProvider.Create(nil);
  FProvider.DataSet := FSQLDataSet;
end;

destructor TRepositorioDeProdutos.Destroy;
begin
  FProvider.Free;
  FSQLDataSet.Free;
  inherited;
end;

function TRepositorioDeProdutos.BuscarPreco(ACodigoProduto: Integer): Double;
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := Format('SELECT r.VALOR FROM CADPRODUTO r WHERE r.CODIGO = %d', [ACodigoProduto]);
  FSQLDataSet.Open;
  try
    Result := FSQLDataSet.FieldByName('VALOR').AsFloat;
  finally
    FSQLDataSet.Close;
  end;
end;

function TRepositorioDeProdutos.BuscarDescricao(ACodigoProduto: Integer): String;
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := Format('SELECT r.DESCRICAO FROM CADPRODUTO r WHERE r.CODIGO = %d', [ACodigoProduto]);
  FSQLDataSet.Open;
  try
    Result := FSQLDataSet.FieldByName('DESCRICAO').AsString;
  finally
    FSQLDataSet.Close;
  end;
end;

end.
