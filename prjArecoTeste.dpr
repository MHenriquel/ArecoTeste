program prjArecoTeste;

uses
  Forms,
  uUtils in 'uUtils.pas',
  uConnection in 'uConnection.pas',
  uCategoria in 'uCategoria.pas',
  uServicos in 'uServicos.pas',
  uCaracteristicaProduto in 'uCaracteristicaProduto.pas',
  uItem in 'uItem.pas',
  uCadServicos in 'uCadServicos.pas' {frmCadServicos},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  ufrmCadCategoria in 'ufrmCadCategoria.pas' {frmCadCategoria},
  uCadCaracteristicaProduto in 'uCadCaracteristicaProduto.pas' {frmCadCaracteristicaProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
