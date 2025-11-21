unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    PanelLeft: TPanel;
    PanelContent: TPanel;
    BtnVendas: TButton;
    BtnConsulta: TButton;
    BtnProdutos: TButton;
    BtnSair: TButton;
    procedure BtnVendasClick(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses uFrmPDV, FrmConsultaVendas;

procedure TFrmMain.BtnVendasClick(Sender: TObject);
begin
  Application.CreateForm(TFrmPDV, FrmPDV);
  FrmPDV.ShowModal;
  FrmPDV.Free;
end;

procedure TFrmMain.BtnConsultaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConsulta, FrmConsulta);
  FrmConsulta.ShowModal;
  FrmConsulta.Free;
end;

procedure TFrmMain.BtnSairClick(Sender: TObject);
begin
  Close;
end;

end.
