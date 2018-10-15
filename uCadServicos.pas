unit uCadServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, WideStrings, SqlExpr, DBXFirebird,
  FMTBcd, Provider, SimpleDS, DBClient, uServicos, uConnection;

type
  TfrmCadServicos = class(TForm)
    grbServicos: TGroupBox;
    dbgServicos: TDBGrid;
    dbnServicos: TDBNavigator;
    btnInserir: TButton;
    btnEditar: TButton;
    btnDeletar: TButton;
    grbDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtID: TEdit;
    edtServico: TEdit;
    edtCodigo: TEdit;
    btnGravar: TButton;
    btnDesfazer: TButton;
    procedure FormShow(Sender: TObject);
    procedure dbgServicosCellClick(Column: TColumn);
    procedure btnInserirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbnServicosClick(Sender: TObject; Button: TNavigateBtn);
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
  frmCadServicos: TfrmCadServicos;
  servicos : TServicos;

implementation

{$R *.dfm}
uses uUtils, uPrincipal;


procedure TfrmCadServicos.dbgServicosCellClick(Column: TColumn);
begin
   SetarCamposEdit;
end;

procedure TfrmCadServicos.dbnServicosClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   SetarCamposEdit;
end;

procedure TfrmCadServicos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadServicos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
     perform(wm_nextdlgctl,0,0);
end;

procedure TfrmCadServicos.FormShow(Sender: TObject);
begin
   dsPesquisa                := TDataSource.Create(Self);
   cdsPesquisa               := TClientDataSet.Create(Self);
   dspPesquisa               := TDataSetProvider.Create(Self);
   dspPesquisa.Name          := 'dspPesquisaServico' ;
   CarregaGrid;
   SetarCamposEdit;
end;

procedure TfrmCadServicos.btnInserirClick(Sender: TObject);
begin
   SetarBotoes('I');
   LimparCampos;
   edtServico.SetFocus;
end;

procedure TfrmCadServicos.btnDeletarClick(Sender: TObject);
begin
   SetarBotoes('D');
   if Application.MessageBox('Confirma exclusão do registro selecionado?','Confirmação', MB_YESNO) = mrYes then
   begin
      if acao = 'D' then
      begin
         servicos := TServicos.Create;

         with servicos do
         begin
            IDSERVICO      := StrToInt(edtID.Text);

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
         servicos.Free;
      end;
   end;
end;

procedure TfrmCadServicos.btnDesfazerClick(Sender: TObject);
begin
   SetarBotoes('X');
end;

procedure TfrmCadServicos.btnEditarClick(Sender: TObject);
begin
   SetarBotoes('A');

   if ( Trim(edtServico.Text) = '' ) then
   begin
      Application.MessageBox('Selecione um registro a ser alterado!','Informação',MB_OK);
      SetarBotoes('X');
   end
   else edtServico.SetFocus;
end;

procedure TfrmCadServicos.btnGravarClick(Sender: TObject);
begin
   servicos := TServicos.Create;
   if acao = 'I' then
   begin
      with servicos do
      begin
         NOMESERVICO := edtServico.Text;
         CODIGOSERVICO := edtCodigo.Text;

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
      with servicos do
      begin
         NOMESERVICO    := edtServico.Text;
         CODIGOSERVICO  := edtCodigo.Text;
         IDSERVICO      := StrToInt(edtID.Text);

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
   servicos.Free;
end;

procedure TfrmCadServicos.CarregaGrid;
begin

   qryPesquisa               := TSQLQuery.Create(Self);
   qryPesquisa.SQLConnection := frmPrincipal.SQLConnection;
   with qryPesquisa, SQL do
   begin
      Close;
      Clear;
      Add('select idservico as Id, nomeservico as "Serviço", codigoservico as "Código" from servico order by nomeservico');
   end;

   dspPesquisa.DataSet       := qryPesquisa;
   cdsPesquisa.ProviderName  := dspPesquisa.Name;
   dsPesquisa.DataSet        := cdsPesquisa;
   cdsPesquisa.Active        := False;
   cdsPesquisa.Active        := True;
   dbgServicos.DataSource    := dsPesquisa;
   dbnServicos.DataSource    := dsPesquisa;
end;

procedure TfrmCadServicos.SetarCamposEdit;
begin
   edtID.Text      := dbgServicos.DataSource.DataSet.FieldByName('Id').AsString;
   edtServico.Text := dbgServicos.DataSource.DataSet.FieldByName('Serviço').AsString;
   edtCodigo.Text  := dbgServicos.DataSource.DataSet.FieldByName('Código').AsString;
end;

procedure TfrmCadServicos.LimparCampos;
begin
   edtID.Clear;
   edtServico.Clear;
   edtCodigo.Clear;
end;

procedure TfrmCadServicos.SetarBotoes(tipo: string);
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
