unit UUnidadeDeTrabalhoSimple;

interface

uses
  System.SysUtils, Data.SqlExpr, Data.DBXCommon, UUnidadeDeTrabalho;

type
  TUnidadeDeTrabalhoSimple = class(TInterfacedObject, IUnidadeDeTrabalho)
  private
    FConnection: TSQLConnection;
    FTransaction: TDBXTransaction;
    FTransactionStarted: Boolean;
  public
    constructor Create(AConnection: TSQLConnection);
    procedure Iniciar;
    procedure Commit;
    procedure Rollback;
  end;

implementation

constructor TUnidadeDeTrabalhoSimple.Create(AConnection: TSQLConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FTransactionStarted := False;
end;

procedure TUnidadeDeTrabalhoSimple.Iniciar;
begin
  if Assigned(FConnection) and FConnection.Connected then
  begin
    try
      FTransaction := FConnection.BeginTransaction;
      FTransactionStarted := True;
    except
      FTransactionStarted := False;
      raise;
    end;
  end;
end;

procedure TUnidadeDeTrabalhoSimple.Commit;
begin
  if FTransactionStarted and Assigned(FConnection) and FConnection.Connected then
  begin
    FConnection.CommitFreeAndNil(FTransaction);
    FTransactionStarted := False;
  end;
end;

procedure TUnidadeDeTrabalhoSimple.Rollback;
begin
  if FTransactionStarted and Assigned(FConnection) and FConnection.Connected then
  begin
    FConnection.RollbackFreeAndNil(FTransaction);
    FTransactionStarted := False;
  end;
end;

end.
