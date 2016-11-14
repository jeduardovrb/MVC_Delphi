unit uClienteDao;

interface

uses
  FireDAC.Comp.Client, uConexao;

type
  TClienteDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;

    function Obter: TFDQuery;
  end;

implementation

{ TClienteDao }

uses uSistemaControl;

constructor TClienteDao.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TClienteDao.Obter: TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry :=  FConexao.CriarQuery();

  VQry.Open('select codigo, nome from cliente');

  Result := VQry;
end;

end.
