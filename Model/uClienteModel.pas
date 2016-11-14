unit uClienteModel;

interface

uses
  uEnumerado;

type
  TCliente = class
  private
    FAcao: TAcao;
    FCodigo: Integer;
    FNome: string;

    procedure SetAcao(const Value: TAcao);
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Acao: TAcao read FAcao write SetAcao;
  end;

implementation

{ TCliente }

procedure TCliente.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

procedure TCliente.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
