unit UFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient, Data.DB,
  Dialogs, UControladorDeVendas;

type
  TFrmPrincipal = class(TForm)
    PanelSidebar: TPanel;
    PanelContent: TPanel;
    BtnVendas: TButton;
    BtnConsulta: TButton;
    BtnProdutos: TButton;
    BtnSair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnVendasClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnProdutosClick(Sender: TObject);
  private
    { Private declarations }
    FControlador: TControladorDeVendas;
    procedure ConfigurarControlador;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
  UFormPDV, UFormConsultaVendas, URepositorioDeVendas, URepositorioDeItens,
  URepositorioDeReceitasEDescontos, UUnidadeDeTrabalho, UUnidadeDeTrabalhoSimple,
  UAdaptadorDeConexaoFirebird;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Sistema - Menu Principal';
  ConfigurarControlador;
end;

procedure TFrmPrincipal.BtnVendasClick(Sender: TObject);
begin
  Application.CreateForm(TFrmPDV, FrmPDV);
  FrmPDV.Controlador:= FControlador;
  try
    FrmPDV.ShowModal;
  finally
    FreeAndNil(FrmPDV);
  end;
end;

procedure TFrmPrincipal.BtnConsultaClick(Sender: TObject);
begin
  ConfigurarControlador;
  if not Assigned(FrmConsultaVendas) then
    Application.CreateForm(TFrmConsultaVendas, FrmConsultaVendas);
  FrmConsultaVendas.Controlador := FControlador;
  try
    FrmConsultaVendas.ShowModal;
  finally
    FreeAndNil(FrmConsultaVendas);
  end;
end;

procedure TFrmPrincipal.BtnProdutosClick(Sender: TObject);
begin
  ShowMessage('Em construção...');
end;

procedure TFrmPrincipal.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.ConfigurarControlador;
var
  repoVendas: TRepositorioDeVendas;
  repoItens: TRepositorioDeItens;
  repoReceitas: TRepositorioDeReceitasEDescontos;
  unidade: TUnidadeDeTrabalhoSimple;
begin
  repoVendas := TRepositorioDeVendas.Create(dmConexaoFirebird.GetConnection);
  repoItens := TRepositorioDeItens.Create(dmConexaoFirebird.GetConnection);
  repoReceitas := TRepositorioDeReceitasEDescontos.Create(dmConexaoFirebird.GetConnection);
  unidade := TUnidadeDeTrabalhoSimple.Create(dmConexaoFirebird.GetConnection);
  FControlador := TControladorDeVendas.Create(repoVendas, repoItens, repoReceitas, unidade);
end;

end.
