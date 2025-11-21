unit UUnidadeDeTrabalho;

interface

type
  IUnidadeDeTrabalho = interface
    ['{6A9F4E7E-4F6B-4A7D-A9F2-1B2C3D4E5F60}']
    procedure Iniciar;
    procedure Commit;
    procedure Rollback;
  end;

implementation

end.
