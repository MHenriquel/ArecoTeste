unit ufrmCadCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, WideStrings, SqlExpr, DBXFirebird,
  FMTBcd, Provider, SimpleDS, DBClient, uCategoria, uConnection;

type
  TfrmCadCategoria = class(TForm)
    grbCategoria: TGroupBox;
    dbgCategoria: TDBGrid;
    grbDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtID: TEdit;
    edtCodigo: TEdit;
    edtNome: TEdit;
    btnInserir: TButton;
    btnEditar: TButton;
    btnDeletar: TButton;
    btnGravar: TButton;
    btnDesfazer: TButton;
    dbnCategoria: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure dbgCategoriaCellClick(Column: TColumn);
    procedure dbnCategoriaClick(Sender: TObject; Button: TNavigateBtn);
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
  frmCadCategoria: TfrmCadCategoria;
  categoria : TCategoria;

implementation

{$R *.dfm}
uses uUtils, uPrincipal;

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadCategoria.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
     perform(wm_nextdlgctl,0,0);
end;

procedure TfrmCadCategoria.FormShow(Sender: TObject);
begin
   dsPesquisa                := TDataSource.Create(Self);
   cdsPesquisa               := TClientDataSet.Create(Self);
   dspPesquisa               := TDataSetProvider.Create(Self);
   dspPesquisa.Name          := 'dspPesquisaCategoria' ;
   CarregaGrid;
   SetarCamposEdit;
end;

procedure TfrmCadCategoria.btnDeletarClick(Sender: TObject);
begin
   SetarBotoes('D');
   if Application.MessageBox('Confirma exclusão do registro selecionado?','Confirmação', MB_YESNO) = mrYes then
   begin
      if acao = 'D' then
      begin
         categoria := TCategoria.Create;

         with categoria do
         begin
            IDCATEGORIA      := StrToInt(edtID.Text);

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
         categoria.Free;
      end;
   end;
end;

procedure TfrmCadCategoria.btnDesfazerClick(Sender: TObject);
begin
   SetarBotoes('X');
end;

procedure TfrmCadCategoria.btnEditarClick(Sender: TObject);
begin
   SetarBotoes('A');

   if ( Trim(edtCodigo.Text) = '' ) then
   begin
      Application.MessageBox('Selecione um registro a ser alterado!','Informação',MB_OK);
      SetarBotoes('X');
   end
   else edtCodigo.SetFocus;
end;

procedure TfrmCadCategoria.btnGravarClick(Sender: TObject);
begin
   categoria := TCategoria.Create;
   if acao = 'I' then
   begin
      with categoria do
      begin
         NOMECATEGORIA     := edtNome.Text;
         CODIGOCATEGORIA   := edtCodigo.Text;

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
      with categoria do
      begin
         NOMECATEGORIA     := edtNome.Text;
         CODIGOCATEGORIA   := edtCodigo.Text;
         IDCATEGORIA       := StrToInt(edtID.Text);

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
   categoria.Free;
end;

procedure TfrmCadCategoria.btnInserirClick(Sender: TObject);
begin
   SetarBotoes('I');
   LimparCampos;
   edtCodigo.SetFocus;
end;

procedure TfrmCadCategoria.CarregaGrid;
begin
   qryPesquisa               := TSQLQuery.Create(Self);
   qryPesquisa.SQLConnection := frmPrincipal.SQLConnection;
   with qryPesquisa, SQL do
   begin
      Close;
      Clear;
      Add('select idcategoria as Id, codigocategoria as "Código", nomecategoria as "Nome" from CATEGORIA order by idcategoria');
   end;

   dspPesquisa.DataSet       := qryPesquisa;
   cdsPesquisa.ProviderName  := dspPesquisa.Name;
   dsPesquisa.DataSet        := cdsPesquisa;
   cdsPesquisa.Active        := False;
   cdsPesquisa.Active        := True;
   dbgCategoria.DataSource   := dsPesquisa;
   dbnCategoria.DataSource   := dsPesquisa;
end;

procedure TfrmCadCategoria.dbgCategoriaCellClick(Column: TColumn);
begin
   SetarCamposEdit;
end;

procedure TfrmCadCategoria.dbnCategoriaClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   SetarCamposEdit;
end;

procedure TfrmCadCategoria.SetarCamposEdit;
begin
   edtID.Text     := dbgCategoria.DataSource.DataSet.FieldByName('Id').AsString;
   edtCodigo.Text := dbgCategoria.DataSource.DataSet.FieldByName('Código').AsString;
   edtNome.Text   := dbgCategoria.DataSource.DataSet.FieldByName('Nome').AsString;
end;

procedure TfrmCadCategoria.LimparCampos;
begin
   edtID.Clear;
   edtCodigo.Clear;
   edtNome.Clear;
end;

procedure TfrmCadCategoria.SetarBotoes(tipo: string);
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


