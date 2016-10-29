program PrjMVC;

uses
  Vcl.Forms,
  FPrincipalView in 'View\FPrincipalView.pas' {frmPrincipal},
  uConexao in 'Dao\uConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
