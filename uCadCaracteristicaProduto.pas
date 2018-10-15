unit uCadCaracteristicaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, WideStrings, SqlExpr, DBXFirebird,
  FMTBcd, Provider, SimpleDS, DBClient, uCaracteristicaProduto, uConnection,
  Mask;

type
  TfrmCadCaracteristicaProduto = class(TForm)
    grbCaracteristica: TGroupBox;
    dbgCaracteristica: TDBGrid;
    grbDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtID: TEdit;
    btnInserir: TButton;
    btnEditar: TButton;
    btnDeletar: TButton;
    btnGravar: TButton;
    btnDesfazer: TButton;
    dbnCaracteristica: TDBNavigator;
    edtPeso: TEdit;
    edtAltura: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbgCaracteristicaCellClick(Column: TColumn);
    procedure dbnCaracteristicaClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    qryPesquisa : TSQLQuery;
    acao        : string;
    dsPesquisa  : TDataSource;
    dspPesquisa : TDataSetProvider;
    cdsPesquisa : TClientDataSet;

    procedure CarregaGrid;
    procedure SetarCamposEdit;
    procedure LimparCampos;
    procedure SetarBotoes(tipo: string);


  public
    { Public declarations }
  end;

var
  frmCadCaracteristicaProduto: TfrmCadCaracteristicaProduto;
  caracteristica : TCaracteristicaProduto;


implementation

{$R *.dfm}
uses uUtils, uPrincipal;

procedure TfrmCadCaracteristicaProduto.dbgCaracteristicaCellClick(
  Column: TColumn);
begin
   SetarCamposEdit;
end;

procedure TfrmCadCaracteristicaProduto.dbnCaracteristicaClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   SetarCamposEdit;
end;

procedure TfrmCadCaracteristicaProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadCaracteristicaProduto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
     perform(wm_nextdlgctl,0,0);
end;

procedure TfrmCadCaracteristicaProduto.FormShow(Sender: TObject);
begin
   dsPesquisa                := TDataSource.Create(Self);
   cdsPesquisa               := TClientDataSet.Create(Self);
   dspPesquisa               := TDataSetProvider.Create(Self);
   dspPesquisa.Name          := 'dspPesquisaCaracteristica' ;
   CarregaGrid;
   //SetarCamposEdit;
end;

procedure TfrmCadCaracteristicaProduto.btnDeletarClick(Sender: TObject);
begin
   SetarBotoes('D');
   if Application.MessageBox('Confirma exclusão do registro selecionado?','Confirmação', MB_YESNO) = mrYes then
   begin
      if acao = 'D' then
      begin
         caracteristica := TCaracteristicaProduto.Create;

         with caracteristica do
         begin
            IDCARACTERISTICA   := StrToInt(edtID.Text);

            if InserirAlterarDeletar(acao) then
            begin
               Application.MessageBox('Registro excluído com sucesso!','Informação', MB_OK);
            end
            else
            begin
               Application.MessageBox('Erro ao excluir o registro!','Erro', MB_OK);
            end;
         end;
         CarregaGrid;
         SetarBotoes('T');
         SetarCamposEdit;
         caracteristica.Free;
      end;
   end;
end;

procedure TfrmCadCaracteristicaProduto.btnDesfazerClick(Sender: TObject);
begin
   SetarBotoes('X');
end;

procedure TfrmCadCaracteristicaProduto.btnEditarClick(Sender: TObject);
begin
   SetarBotoes('A');

   if ( Trim(edtPeso.Text) = '' ) then
   begin
      Application.MessageBox('Selecione um registro a ser alterado!','Informação',MB_OK);
      SetarBotoes('X');
   end
   else edtPeso.SetFocus;
end;

procedure TfrmCadCaracteristicaProduto.btnGravarClick(Sender: TObject);
begin
   caracteristica := TCaracteristicaProduto.Create;
   if acao = 'I' then
   begin
      with caracteristica do
      begin
         PESO              := StrToFloat(edtPeso.Text);
         ALTURA            := StrToFloat(edtAltura.Text);

         if InserirAlterarDeletar(acao) then
         begin
            Application.MessageBox('Registro incluído com sucesso!','Informação', MB_OK);
         end
         else
         begin
            Application.MessageBox('Erro ao inserir o registro!','Erro', MB_OK);
         end;
      end;

   end
   else if acao = 'A' then
   begin
      with caracteristica do
      begin
         PESO              := StrToFloat(edtPeso.Text);
         ALTURA            := StrToFloat(edtAltura.Text);
         IDCARACTERISTICA  := StrToInt(edtID.Text);

         if InserirAlterarDeletar(acao) then
         begin
            Application.MessageBox('Registro alterado com sucesso!','Informação', MB_OK);
         end
         else
         begin
            Application.MessageBox('Erro ao alterar o registro!','Erro', MB_OK);
         end;
      end;
   end;

   CarregaGrid;
   SetarBotoes('T');
   SetarCamposEdit;
   caracteristica.Free;
end;

procedure TfrmCadCaracteristicaProduto.btnInserirClick(Sender: TObject);
begin
   SetarBotoes('I');
   LimparCampos;
   edtPeso.SetFocus;
end;

procedure TfrmCadCaracteristicaProduto.CarregaGrid;
begin
   qryPesquisa               := TSQLQuery.Create(Self);
   qryPesquisa.SQLConnection := frmPrincipal.SQLConnection;
   with qryPesquisa, SQL do
   begin
      Close;
      Clear;
      Add('select idcaracteristica as "Id", peso as "Peso", altura as "Altura" from CARACTERISTICAPRODUTO order by idcaracteristica');
   end;

   dspPesquisa.DataSet       := qryPesquisa;
   cdsPesquisa.ProviderName  := dspPesquisa.Name;
   dsPesquisa.DataSet        := cdsPesquisa;
   cdsPesquisa.Active        := False;
   cdsPesquisa.Active        := True;
   dbgCaracteristica.DataSource   := dsPesquisa;
   dbnCaracteristica.DataSource   := dsPesquisa;
end;

procedure TfrmCadCaracteristicaProduto.SetarCamposEdit;
begin
   edtID.Text     := dbgCaracteristica.DataSource.DataSet.FieldByName('Id').AsString;
   edtPeso.Text   := dbgCaracteristica.DataSource.DataSet.FieldByName('Peso').AsString;
   edtAltura.Text := dbgCaracteristica.DataSource.DataSet.FieldByName('Altura').AsString;
end;

procedure TfrmCadCaracteristicaProduto.LimparCampos;
begin
   edtID.Clear;
   edtPeso.Clear;
   edtAltura.Clear;
end;

procedure TfrmCadCaracteristicaProduto.SetarBotoes(tipo: string);
begin
   acao                  := tipo;
   if (tipo = 'I') or (tipo = 'A') then
   begin
      btnEditar.Enabled  := False;
      btnDeletar.Enabled := False;
      btnInserir.Enabled := False;
      btnGravar.Enabled  := true;
   end
   else if (tipo = 'D') then
   begin
      btnEditar.Enabled  := False;
      btnDeletar.Enabled := False;
      btnInserir.Enabled := False;
      btnGravar.Enabled  := False;
   end
   else
   begin
      btnEditar.Enabled  := true;
      btnDeletar.Enabled := true;
      btnInserir.Enabled := true;
      btnGravar.Enabled  := False;
   end;
end;

end.
