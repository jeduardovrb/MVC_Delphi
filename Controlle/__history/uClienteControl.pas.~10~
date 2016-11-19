unit uClienteControl;

interface

uses
  uClienteModel, System.SysUtils, FireDAC.Comp.Client;

type
  TClienteControl = class
  private
    FClienteModel: TClienteModel;

  public
    constructor Create;
    destructor Destroy; override;

    function Obter: TFDQuery;
  end;

implementation

{ TClienteControl }

constructor TClienteControl.Create;
begin
  FClienteModel := TClienteModel.Create;
end;

destructor TClienteControl.Destroy;
begin
  FreeAndNil(FClienteModel);

  inherited;
end;

function TClienteControl.Obter: TFDQuery;
begin
  Result := FClienteModel.Obter;
end;

end.
