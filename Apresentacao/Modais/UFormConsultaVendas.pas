unit UFormConsultaVendas;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.DBGrids, Datasnap.DBClient, Data.DB,
  UControladorDeVendas, Vcl.ComCtrls, Vcl.Grids;

type
  TFrmConsultaVendas = class(TForm)
    DBGrid1: TDBGrid;
    dsVendas: TDataSource;
    dtInicial: TDateTimePicker;
    dtFinal: TDateTimePicker;
    BtnFiltrar: TButton;
    BtnFechar: TButton;
    Label1: TLabel;
    Label2: TLabel;

    procedure FormShow(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
  private
    FControlador: TControladorDeVendas;
    procedure CarregarVendas(const Filtro: string);
  public
    constructor Create(AOwner: TComponent; AControlador: TControladorDeVendas); reintroduce;
    property Controlador: TControladorDeVendas write FControlador;
  end;

var
  FrmConsultaVendas: TFrmConsultaVendas;

implementation


{$R *.dfm}

constructor TFrmConsultaVendas.Create(AOwner: TComponent; AControlador: TControladorDeVendas);
begin
  inherited Create(AOwner);
  FControlador := AControlador;
end;

procedure TFrmConsultaVendas.FormShow(Sender: TObject);
begin
  CarregarVendas(' WHERE Cancelada = ''N'' ');
end;

procedure TFrmConsultaVendas.BtnFiltrarClick(Sender: TObject);
var
  filtro: string;
begin
  filtro := Format(' WHERE Data BETWEEN ''%s'' AND ''%s'' ',
    [FormatDateTime('yyyy-mm-dd', dtInicial.Date),
     FormatDateTime('yyyy-mm-dd', dtFinal.Date)]);

  CarregarVendas(filtro);
end;

procedure TFrmConsultaVendas.CarregarVendas(const Filtro: string);
var
  cds: TClientDataSet;
begin
  cds := FControlador.ObterVendas(Filtro);
  dsVendas.DataSet := cds;
end;

procedure TFrmConsultaVendas.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
