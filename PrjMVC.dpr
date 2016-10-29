program PrjMVC;

uses
  Vcl.Forms,
  FPrincipalView in 'View\FPrincipalView.pas' {frmPrincipal},
  uConexao in 'Dao\uConexao.pas',
  uSistemaControl in 'Controlle\uSistemaControl.pas',
  uEmpresaModel in 'Model\uEmpresaModel.pas',
  uEmpresaDao in 'Dao\uEmpresaDao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
