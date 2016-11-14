unit uEmpresaDao;

interface

uses
  uEmpresaModel, FireDAC.Comp.Client, uSistemaControl, System.SysUtils;

type
  TEmpresaDao = class
    procedure carregar(AEmpresaModel: TEmpresaModel; ACodigo: Integer);
  end;

implementation

{ TEmpresaDao }

procedure TEmpresaDao.carregar(AEmpresaModel: TEmpresaModel; ACodigo: Integer);
var
  VQuery: TFDQuery;
begin
  VQuery := TSistemaControl.GetInstance().Conexao.CriarQuery;
  try
    VQuery.Open('select codigo, rsocial from empresa where codigo = :codigo ', [ACodigo]);
    try
      AEmpresaModel.Codigo := VQuery.Fields[0].AsInteger;
      AEmpresaModel.RSocial := VQuery.Fields[1].AsString;
    finally
      VQuery.Close;
    end;
  finally
    FreeAndNil(VQuery);
  end;
end;

end.
