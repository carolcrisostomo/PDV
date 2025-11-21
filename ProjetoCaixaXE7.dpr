program ProjetoCaixaXE7;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uFrmPDV in 'uFrmPDV.pas' {FrmPDV},
  FrmConsultaVendas in 'FrmConsultaVendas.pas' {FrmConsulta},
  UControladorDeVendas in 'Aplicacao\Implementacao\UControladorDeVendas.pas',
  UUnidadeDeTrabalhoSimple in 'Infraestrutura\Adaptadores\UUnidadeDeTrabalhoSimple.pas',
  URepositorioDeItens in 'Infraestrutura\Persistencia\URepositorioDeItens.pas',
  URepositorioDeVendas in 'Infraestrutura\Persistencia\URepositorioDeVendas.pas',
  URepositorioDeReceitasEDescontos in 'Infraestrutura\Persistencia\URepositorioDeReceitasEDescontos.pas',
  UUnidadeDeTrabalho in 'Aplicacao\Interfaces\UUnidadeDeTrabalho.pas',
  UAdaptadorDeConexaoFirebird in 'Infraestrutura\Adaptadores\UAdaptadorDeConexaoFirebird.pas' {dmConexaoFirebird: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexaoFirebird, dmConexaoFirebird);
  DmConexaoFirebird.ConfigurarConexao('C:\Carol\PDV\ProjetoCaixa_XE7\Database\Caixa.FDB', 'SYSDBA', 'masterkey');
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
