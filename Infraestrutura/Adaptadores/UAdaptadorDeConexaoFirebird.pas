unit UAdaptadorDeConexaoFirebird;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXFirebird;

type
  TdmConexaoFirebird = class(TDataModule)
    SQLConnection: TSQLConnection;
  private
  public
    procedure ConfigurarConexao(const ACaminhoBanco, AUsuario, ASenha: string);
    function GetConnection: TSQLConnection;
  end;

var
  dmConexaoFirebird: TdmConexaoFirebird;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexaoFirebird.ConfigurarConexao(const ACaminhoBanco, AUsuario, ASenha: string);
begin
  SQLConnection.Connected:= False;
  SQLConnection.DriverName := 'Firebird';
  SQLConnection.LoginPrompt := False;
  SQLConnection.Params.Clear;
  SQLConnection.Params.Add('Database=' + ACaminhoBanco);
  SQLConnection.Params.Add('User_Name=' + AUsuario);
  SQLConnection.Params.Add('Password=' + ASenha);
  if not SQLConnection.Connected then
    SQLConnection.Open;
end;

function TdmConexaoFirebird.GetConnection: TSQLConnection;
begin
  Result := SQLConnection;
end;

end.
