program ProjetoCaixaXE7;

uses
  Vcl.Forms,
  UFormConsultaVendas in 'Apresentacao\Modais\UFormConsultaVendas.pas' {FrmConsultaVendas},
  UControladorDeVendas in 'Aplicacao\Implementacao\UControladorDeVendas.pas',
  UUnidadeDeTrabalhoSimple in 'Infraestrutura\Adaptadores\UUnidadeDeTrabalhoSimple.pas',
  URepositorioDeItens in 'Infraestrutura\Persistencia\URepositorioDeItens.pas',
  URepositorioDeVendas in 'Infraestrutura\Persistencia\URepositorioDeVendas.pas',
  URepositorioDeReceitasEDescontos in 'Infraestrutura\Persistencia\URepositorioDeReceitasEDescontos.pas',
  UUnidadeDeTrabalho in 'Aplicacao\Interfaces\UUnidadeDeTrabalho.pas',
  UFormPrincipal in 'Apresentacao\Principal\UFormPrincipal.pas' {FrmPrincipal},
  UFormPDV in 'Apresentacao\Modais\UFormPDV.pas' {FrmPDV},
  UAdaptadorDeConexaoFirebird in 'Infraestrutura\Adaptadores\UAdaptadorDeConexaoFirebird.pas' {dmConexaoFirebird: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  System.SysUtils,
  ThemeManager in 'ThemeManager.pas',
  ThemeAuto in 'Aplicacao\ThemeAuto.pas',
  URepositorioDeProdutos in 'Infraestrutura\Persistencia\URepositorioDeProdutos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TAutoTheme.Activate;
  Application.CreateForm(TdmConexaoFirebird, dmConexaoFirebird);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  DmConexaoFirebird.ConfigurarConexao(ExtractFilePath(ParamStr(0))+ '\Database\Caixa.FDB', 'SYSDBA', 'masterkey');
  Application.CreateForm(TdmConexaoFirebird, dmConexaoFirebird);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;

end.
