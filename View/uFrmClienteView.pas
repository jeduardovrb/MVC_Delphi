unit uFrmClienteView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uClienteControl, uEnumerado;

type
  TfrmCadastroCliente = class(TForm)
    edtNome: TEdit;
    Label2: TLabel;
    mmTableClientes: TFDMemTable;
    DBGrid1: TDBGrid;
    dsClientes: TDataSource;
    mmTableClientesCODIGO: TIntegerField;
    mmTableClientesNOME: TStringField;
    Button1: TButton;
    Label1: TLabel;
    edtCodigo: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
  private
    FControleCliente: TClienteControl;

    procedure CarregarClientes;
    procedure CarregarEdits;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

{ TfrmCadastroCliente }

procedure TfrmCadastroCliente.Button1Click(Sender: TObject);
begin
  FControleCliente.ClienteModel.Acao   := uEnumerado.tacIncluir;
  FControleCliente.ClienteModel.Nome   := edtNome.Text;

  if FControleCliente.Salvar() then
    ShowMessage('Incluido com sucesso.');

  Self.CarregarClientes();
end;

procedure TfrmCadastroCliente.Button2Click(Sender: TObject);
begin
  FControleCliente.ClienteModel.Acao   := uEnumerado.tacAlterar;
  FControleCliente.ClienteModel.Codigo := StrToInt(edtCodigo.Text);
  FControleCliente.ClienteModel.Nome   := edtNome.Text;

  if FControleCliente.Salvar() then
    ShowMessage('Alterado com sucesso.');

  Self.CarregarClientes();
end;

procedure TfrmCadastroCliente.Button3Click(Sender: TObject);
var
  VCodigo: String;
begin
  VCodigo := InputBox('Excluir', 'Digite o código do Cliente', EmptyStr);

  if VCodigo.Trim <> EmptyStr then
  begin
    if (Application.MessageBox(PChar('Deseja excluir o registro?'), 'Confirmação', MB_YESNO
      + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes) then
    begin
      FControleCliente.ClienteModel.Acao   := uEnumerado.tacExcluir;
      FControleCliente.ClienteModel.Codigo := StrToInt(edtCodigo.Text);

      if FControleCliente.Salvar() then
        ShowMessage('Excluido com sucesso.');

      Self.CarregarClientes();
    end;
  end;
end;

procedure TfrmCadastroCliente.Button4Click(Sender: TObject);
begin
  FControleCliente.ClienteModel.Codigo := FControleCliente.ClienteModel.GetId(1);
  edtCodigo.Text := FControleCliente.ClienteModel.Codigo.ToString();
  edtNome.Clear;
  edtNome.SetFocus();
end;

procedure TfrmCadastroCliente.CarregarClientes;
var
  VQry: TFDQuery;
begin
  mmTableClientes.Close;

  VQry := FControleCliente.Obter;
  try
    VQry.FetchAll;
    mmTableClientes.Data := VQry.Data;
  finally
    VQry.Close;
    VQry.Free;
  end;
end;

procedure TfrmCadastroCliente.CarregarEdits;
begin
  edtCodigo.Text := mmTableClientes.Fields[0].AsString;
  edtNome.Text   := mmTableClientes.Fields[1].AsString;
end;

procedure TfrmCadastroCliente.DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Self.CarregarEdits();
end;

procedure TfrmCadastroCliente.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Self.CarregarEdits();
end;

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  FControleCliente := TClienteControl.Create;
end;

procedure TfrmCadastroCliente.FormDestroy(Sender: TObject);
begin
  FControleCliente.Free;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  Self.CarregarClientes();

  if mmTableClientes.RecordCount > 0 then
  begin
    Self.CarregarEdits();
  end;
end;

end.
