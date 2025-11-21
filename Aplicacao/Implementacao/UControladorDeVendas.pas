unit UControladorDeVendas;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.DB, UUnidadeDeTrabalho,
  URepositorioDeVendas, URepositorioDeItens, URepositorioDeReceitasEDescontos,
  Vcl.Forms;

type
  TControladorDeVendas = class
  private
    FRepositorioVendas: TRepositorioDeVendas;
    FRepositorioItens: TRepositorioDeItens;
    FRepositorioReceitasDescontos: TRepositorioDeReceitasEDescontos;
    FUnidadeTrabalho: IUnidadeDeTrabalho;
  public
    constructor Create(ARepoVendas: TRepositorioDeVendas; ARepoItens: TRepositorioDeItens;
      ARepoReceitas: TRepositorioDeReceitasEDescontos; AUnidade: IUnidadeDeTrabalho);
    destructor Destroy; override;
    function IniciarVenda: Integer;
    procedure AdicionarItem(ACodigoVenda, ACodigoProduto, AQtde: Integer; AValor: Double);
    function ObterVendas(const AFiltro: string): TClientDataSet;
    function ObterItens(ACodigoVenda: Integer): TClientDataSet;
    procedure MarcarCancelada(ACodigoVenda: Integer);
  end;

implementation

uses UAdaptadorDeConexaoFirebird;

constructor TControladorDeVendas.Create(ARepoVendas: TRepositorioDeVendas; ARepoItens: TRepositorioDeItens;
  ARepoReceitas: TRepositorioDeReceitasEDescontos; AUnidade: IUnidadeDeTrabalho);
begin
  inherited Create;
  FRepositorioVendas := ARepoVendas;
  FRepositorioItens := ARepoItens;
  FRepositorioReceitasDescontos := ARepoReceitas;
  FUnidadeTrabalho := AUnidade;

  FRepositorioVendas := TRepositorioDeVendas.Create(dmConexaoFirebird.SQLConnection);
  FRepositorioItens  := TRepositorioDeItens.Create(dmConexaoFirebird.SQLConnection);

end;

destructor TControladorDeVendas.Destroy;
begin
  inherited;
end;

function TControladorDeVendas.IniciarVenda: Integer;
begin
  Result := FRepositorioVendas.InserirVenda(Date, 0.0, 0.0, 0.0);
end;

procedure TControladorDeVendas.AdicionarItem(ACodigoVenda, ACodigoProduto, AQtde: Integer; AValor: Double);
var
  total: Double;
begin
  FUnidadeTrabalho.Iniciar;
  try
    FRepositorioItens.InserirItem(ACodigoVenda, ACodigoProduto, AQtde, AValor);
    total := FRepositorioItens.CalcularTotais(ACodigoVenda);
    FRepositorioVendas.AtualizarTotais(ACodigoVenda, total, 0.0, total);
    FUnidadeTrabalho.Commit;
  except
    on E: Exception do
    begin
      FUnidadeTrabalho.Rollback;
      raise;
    end;
  end;
end;

function TControladorDeVendas.ObterVendas(const AFiltro: string): TClientDataSet;
begin
  Result := FRepositorioVendas.ObterDataSetDeVendas(AFiltro);
end;

function TControladorDeVendas.ObterItens(ACodigoVenda: Integer): TClientDataSet;
begin
  Result := FRepositorioItens.ObterItensPorVenda(ACodigoVenda);
end;

procedure TControladorDeVendas.MarcarCancelada(ACodigoVenda: Integer);
begin
  FUnidadeTrabalho.Iniciar;
  try
    FRepositorioVendas.MarcarCancelada(ACodigoVenda);
    FUnidadeTrabalho.Commit;
  except
    FUnidadeTrabalho.Rollback;
    raise;
  end;
end;


end.
