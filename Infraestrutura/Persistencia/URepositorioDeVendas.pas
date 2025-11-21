unit URepositorioDeVendas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Provider, Dialogs;

type
  TRepositorioDeVendas = class
  private
    FConnection: TSQLConnection;
    FSQLDataSet: TSQLDataSet;
    FProvider: TDataSetProvider;
  public
    constructor Create(AConnection: TSQLConnection); overload;
    destructor Destroy; override;
    function ObterDataSetDeVendas(const AFiltro: string): TClientDataSet;
    function InserirVenda(const AData: TDate; const AValorBruto, AValorDesconto, AValorLiquido: Double): Integer;
    procedure AtualizarTotais(ACodigoVenda: Integer; AValorBruto, AValorDesconto, AValorLiquido: Double);
    procedure MarcarCancelada(ACodigoVenda: Integer);
  end;

implementation


constructor TRepositorioDeVendas.Create(AConnection: TSQLConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FSQLDataSet := TSQLDataSet.Create(nil);
  FSQLDataSet.SQLConnection := FConnection;
  FProvider := TDataSetProvider.Create(nil);
  FProvider.DataSet := FSQLDataSet;
  FSQLDataSet := TSQLDataSet.Create(nil);
  FProvider   := TDataSetProvider.Create(nil);
end;

destructor TRepositorioDeVendas.Destroy;
begin
  FProvider.Free;
  FSQLDataSet.Free;
  inherited;
end;

function TRepositorioDeVendas.InserirVenda(const AData: TDate; const AValorBruto, AValorDesconto, AValorLiquido: Double): Integer;
var
  i: Integer;
begin
  FSQLDataSet.Close;
  FSQLDataSet.ParamCheck := True;
  FSQLDataSet.SQLConnection:= FConnection;
  FSQLDataSet.CommandText := 'INSERT INTO Venda ( Data, Valor_Bruto, Valor_Desconto, Valor_Liquido, Cancelada) ' +
    'VALUES (:DataVenda, :Valor_Bruto, :Valor_Desconto, :Valor_Liquido, ''N'')';

  FSQLDataSet.Params.Clear;
  FSQLDataSet.Params.CreateParam(ftDate,  'DataVenda',     ptInput);
  FSQLDataSet.Params.CreateParam(ftFloat, 'Valor_Bruto',   ptInput);
  FSQLDataSet.Params.CreateParam(ftFloat, 'Valor_Desconto',ptInput);
  FSQLDataSet.Params.CreateParam(ftFloat, 'Valor_Liquido', ptInput);
  FSQLDataSet.Params.ParamByName('Valor_Bruto').AsFloat := AValorBruto;
  FSQLDataSet.Params.ParamByName('Valor_Desconto').AsFloat := AValorDesconto;
  FSQLDataSet.Params.ParamByName('Valor_Liquido').AsFloat := AValorLiquido;
  FSQLDataSet.Params.ParamByName('DataVenda').AsDate := AData;
  FSQLDataSet.ExecSQL;
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := 'SELECT Max(Codigo) AS Ultimo FROM Venda';
  FSQLDataSet.Open;
  Result := FSQLDataSet.FieldByName('Ultimo').AsInteger;
  FSQLDataSet.Close;
end;

procedure TRepositorioDeVendas.AtualizarTotais(ACodigoVenda: Integer; AValorBruto, AValorDesconto, AValorLiquido: Double);
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := 'UPDATE Venda SET Valor_Bruto = :Valor_Bruto, Valor_Desconto = :Valor_Desconto, Valor_Liquido = :Valor_Liquido '
    +'WHERE Codigo = :Codigo';
  FSQLDataSet.Params.ParamByName('Valor_Bruto').AsFloat := AValorBruto;
  FSQLDataSet.Params.ParamByName('Valor_Desconto').AsFloat := AValorDesconto;
  FSQLDataSet.Params.ParamByName('Valor_Liquido').AsFloat := AValorLiquido;
  FSQLDataSet.Params.ParamByName('Codigo').AsInteger := ACodigoVenda;
  FSQLDataSet.ExecSQL;
end;

function TRepositorioDeVendas.ObterDataSetDeVendas(const AFiltro: string): TClientDataSet;
var cds: TClientDataSet;
begin
  FSQLDataSet.Close;
  FSQLDataSet.SQLConnection:=FConnection;
  FSQLDataSet.CommandText :=
    'SELECT v.Codigo, v.DATA, v.VALOR_BRUTO, v.VALOR_DESCONTO, v.VALOR_LIQUIDO, v.Cancelada ' +
    'FROM Venda v ' +
    AFiltro +
    ' ORDER BY v.DATA DESC';
  FProvider.DataSet := FSQLDataSet;
  Result := TClientDataSet.Create(nil);

  FProvider.Name := '';
  Result.SetProvider(FProvider);
  Result.Open;
end;

procedure TRepositorioDeVendas.MarcarCancelada(ACodigoVenda: Integer);
begin
  FSQLDataSet.Close;
  FSQLDataSet.CommandText := 'UPDATE Venda SET Cancelada = ''S'' WHERE Codigo = :Codigo';
  FSQLDataSet.Params.ParamByName('Codigo').AsInteger := ACodigoVenda;
  FSQLDataSet.ExecSQL;
end;

end.
