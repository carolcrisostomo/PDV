unit FrmConsultaVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

type
  TFrmConsulta = class(TForm)
    TopPanel: TPanel;
    LblTitulo: TLabel;
    GridVendas: TDBGrid;
    BtnFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
    FRepoVendas: TRepositorioDeVendas;
    FCDSVendas: TClientDataSet;
    FDataSource: TDataSource;
  public
    { Public declarations }
  end;

var
  FrmConsulta: TFrmConsulta;

implementation

{$R *.dfm}

uses
  UAdaptadorDeConexaoFirebird,
  Infraestrutura.Persistencia.URepositorioDeVendas in 'Infraestrutura\Persistencia\URepositorioDeVendas.pas';

procedure TFrmConsulta.FormCreate(Sender: TObject);
begin
  FRepoVendas := TRepositorioDeVendas.Create(dmConexaoFirebird.GetConnection);
  FDataSource := TDataSource.Create(Self);
  // carregar vendas
  FCDSVendas := FRepoVendas.ObterDataSetDeVendas(''); // sem filtro
  FDataSource.DataSet := FCDSVendas;
  GridVendas.DataSource := FDataSource;
end;

procedure TFrmConsulta.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
