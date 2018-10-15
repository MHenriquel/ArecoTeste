unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, WideStrings, SqlExpr, DBXFirebird, FMTBcd,
  Provider, SimpleDS, DBClient, Grids, DBGrids, ImgList, ExtCtrls, DBCtrls, Mask, uItem;

type
  TfrmPrincipal = class(TForm)
    grbItens: TGroupBox;
    SQLConnection: TSQLConnection;
    dbgItens: TDBGrid;
    ImageList1: TImageList;
    grbDadosItens: TGroupBox;
    btnInserir: TButton;
    btnEditar: TButton;
    btnDeletar: TButton;
    btnGravar: TButton;
    btnDesfazer: TButton;
    dbnItens: TDBNavigator;
    Label3: TLabel;
    edtID: TEdit;
    Label1: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtDescricao: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    dblPesoAltura: TDBLookupComboBox;
    Label7: TLabel;
    dblCategoria: TDBLookupComboBox;
    Label8: TLabel;
    dblServico: TDBLookupComboBox;
    btnServicos: TButton;
    btnProduto: TButton;
    btnCategoria: TButton;
    edtVlrUnit: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnServicosClick(Sender: TObject);
    procedure btnCategoriaClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure dbgItensCellClick(Column: TColumn);
    procedure dbnItensClick(Sender: TObject; Button: TNavigateBtn);
    procedure edtVlrUnitExit(Sender: TObject);
  private
    { Private declarations }
    qryPesquisa : TSQLQuery;
    acao        : string;
    dsPesquisa  : TDataSource;
    dspPesquisa : TDataSetProvider;
    cdsPesquisa : TClientDataSet;

    qryPesquisaCaracteristica : TSQLQuery;
    dsPesquisaCaracteristica  : TDataSource;
    dspPesquisaCaracteristica : TDataSetProvider;
    cdsPesquisaCaracteristica : TClientDataSet;

    qryPesquisaCategoria      : TSQLQuery;
    dsPesquisaCategoria       : TDataSource;
    dspPesquisaCategoria      : TDataSetProvider;
    cdsPesquisaCategoria      : TClientDataSet;

    qryPesquisaSerico         : TSQLQuery;
    dsPesquisaServico         : TDataSource;
    dspPesquisaSerico         : TDataSetProvider;
    cdsPesquisaServico        : TClientDataSet;


    procedure CarregaGrid;
    procedure CarregaCombos;
    procedure SetarCamposEdit;
    procedure LimparCampos;
    procedure SetarBotoes(tipo: string);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  item : TItem;



implementation

uses uUtils, uConnection, UCategoria, uCaracteristicaProduto, uCadServicos, ufrmCadCategoria, uCadCaracteristicaProduto;

{$R *.dfm}

procedure TfrmPrincipal.btnCategoriaClick(Sender: TObject);
begin
   frmCadCategoria :=  TfrmCadCategoria.Create(Application);
   frmCadCategoria.ShowModal;
   CarregaCombos;
end;

procedure TfrmPrincipal.btnDeletarClick(Sender: TObject);
begin
   if dbgItens.DataSource.DataSet.RecordCount > 0 then
   begin
      SetarBotoes('D');
      if Application.MessageBox('Confirma exclusão do registro selecionado?','Confirmação', MB_YESNO) = mrYes then
      begin
         if acao = 'D' then
         begin
            item := TItem.Create(SQLConnection);

            with item do
            begin
               IDITEM      := StrToInt(edtID.Text);

               if InserirAlterarDeletar(acao,SQLConnection) then
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
            item.Free;
         end;
      end;
   end;
end;

procedure TfrmPrincipal.btnDesfazerClick(Sender: TObject);
begin
   SetarBotoes('X');
end;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin
   SetarBotoes('A');

   if dbgItens.DataSource.DataSet.RecordCount > 0 then
   begin
      if ( Trim(edtCodigo.Text) = '' ) then
      begin
         Application.MessageBox('Selecione um registro a ser alterado!','Informação',MB_OK);
         SetarBotoes('X');
      end
      else edtCodigo.SetFocus;
   end
   else SetarBotoes('X');
end;

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
   item := TItem.Create(SQLConnection);
   if acao = 'I' then
   begin
      with item do
      begin
         CODIGO            := edtCodigo.Text;
         NOME              := edtNome.Text;
         DESCRICAO         := edtDescricao.Text;
         VALORUNITARIO     := StrToFloat( edtVlrUnit.Text );
         IDCARACTERISTICA  := dblPesoAltura.KeyValue;
         IDSERVICO         := dblServico.KeyValue;
         IDCATEGORIA       := dblCategoria.KeyValue;

         if InserirAlterarDeletar(acao, SQLConnection ) then
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
      with item do
      begin
         CODIGO            := edtCodigo.Text;
         NOME              := edtNome.Text;
         DESCRICAO         := edtDescricao.Text;
         VALORUNITARIO     := StrToFloat( edtVlrUnit.Text );
         IDCARACTERISTICA  := dblPesoAltura.KeyValue;
         IDSERVICO         := dblServico.KeyValue;
         IDCATEGORIA       := dblCategoria.KeyValue;
         IDITEM            := StrToInt(edtID.Text);

         if InserirAlterarDeletar(acao, SQLConnection) then
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
   item.Free;
end;

procedure TfrmPrincipal.btnInserirClick(Sender: TObject);
begin
   SetarBotoes('I');
   LimparCampos;
   edtCodigo.SetFocus;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
   frmCadCaracteristicaProduto := TfrmCadCaracteristicaProduto.Create(Application);
   frmCadCaracteristicaProduto.ShowModal;
   CarregaCombos;
end;

procedure TfrmPrincipal.btnServicosClick(Sender: TObject);
begin
   frmCadServicos :=  TfrmCadServicos.Create(Application);
   frmCadServicos.ShowModal;
   CarregaCombos;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DesconectarBD;
   Action := caFree;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   ConectarBD;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
     perform(wm_nextdlgctl,0,0);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
   dsPesquisa                       := TDataSource.Create(Self);
   cdsPesquisa                      := TClientDataSet.Create(Self);
   dspPesquisa                      := TDataSetProvider.Create(Self);
   dspPesquisa.Name                 := 'dspPesquisaItem' ;

   dsPesquisaCaracteristica         := TDataSource.Create(Self);
   cdsPesquisaCaracteristica        := TClientDataSet.Create(Self);
   dspPesquisaCaracteristica        := TDataSetProvider.Create(Self);
   dspPesquisaCaracteristica.Name   := 'dspPesquisaCaracteristica' ;

   dsPesquisaCategoria              := TDataSource.Create(Self);
   cdsPesquisaCategoria             := TClientDataSet.Create(Self);
   dspPesquisaCategoria             := TDataSetProvider.Create(Self);
   dspPesquisaCategoria.Name        := 'dspPesquisaCategoria' ;

   dsPesquisaServico                := TDataSource.Create(Self);
   cdsPesquisaServico               := TClientDataSet.Create(Self);
   dspPesquisaSerico                := TDataSetProvider.Create(Self);
   dspPesquisaSerico.Name           := 'dspPesquisaSerico' ;

   CarregaGrid;
   CarregaCombos;
   SetarCamposEdit;
   SetarBotoes('X');
end;

procedure TfrmPrincipal.CarregaGrid;
begin
   qryPesquisa               := TSQLQuery.Create(Self);
   qryPesquisa.SQLConnection := frmPrincipal.SQLConnection;
   with qryPesquisa, SQL do
   begin
      Close;
      Clear;
      Add('select i.iditem                      as "Id"                                    ' +
          '     , i.codigo                      as "Código"                                ' +
          '     , i.nome                        as "Nome"                                  ' +
          '     , i.descricao                   as "Descrição"                             ' +
          '     , i.valorunitario               as "Vlr Unit."                             ' +
          '     , i.IDCARACTERISTICA            as "Id Característica"                     ' +
          '     , cp.PESO || '' x '' || cp.ALTURA as "Peso x Altura"                       ' +
          '     , i.IDCATEGORIA                 as "Id Categoria"                          ' +
          '     , c.CODIGOCATEGORIA             as "Cód. Categoria"                        ' +
          '     , c.NOMECATEGORIA               as "Nome Categoria"                        ' +
          '     , i.IDSERVICO                   as "Id Serviço"                            ' +
          '     , s.CODIGOSERVICO               as "Cód. Serviço"                          ' +
          '     , s.NOMESERVICO                 as "Nome Serviço"                          ' +
          ' from ITEM i                                                                    ' +
          ' left join CARACTERISTICAPRODUTO cp on i.idcaracteristica = cp.idcaracteristica ' +
          ' left join categoria             c  on i.IDCATEGORIA      = c.IDCATEGORIA       ' +
          ' left join SERVICO               s  on i.IDSERVICO        = s.IDSERVICO         ' +
          ' order by i.iditem, i.nome, i.descricao');
   end;

   dspPesquisa.DataSet       := qryPesquisa;
   cdsPesquisa.ProviderName  := dspPesquisa.Name;
   dsPesquisa.DataSet        := cdsPesquisa;
   cdsPesquisa.Active        := False;
   cdsPesquisa.Active        := True;
   dbgItens.DataSource       := dsPesquisa;
   dbgItens.DataSource       := dsPesquisa;
   dbnItens.DataSource       := dsPesquisa;
end;

procedure TfrmPrincipal.dbgItensCellClick(Column: TColumn);
begin
   SetarCamposEdit;
end;

procedure TfrmPrincipal.dbnItensClick(Sender: TObject; Button: TNavigateBtn);
begin
   SetarCamposEdit;
end;

procedure TfrmPrincipal.edtVlrUnitExit(Sender: TObject);
var resultfloat : Double;
begin
   if not TryStrToFloat(edtVlrUnit.Text, resultfloat  ) then
   begin
      Application.MessageBox('O valor digitado não é um número float válido, verifique!','Consistência',MB_OK  );
      edtVlrUnit.SetFocus;
      Exit;
   end;

   edtVlrUnit.Text := StringReplace(edtVlrUnit.Text,'.','',[rfReplaceAll]);
end;

procedure TfrmPrincipal.CarregaCombos;
begin
   // Carrega combo de Produtos
   qryPesquisaCaracteristica := TSQLQuery.Create(Self);
   qryPesquisaCaracteristica.SQLConnection := frmPrincipal.SQLConnection;
   with qryPesquisaCaracteristica, SQL do
   begin
      Close;
      Clear;
      Add('select idcaracteristica as "Id" , PESO || '' x '' || ALTURA as "PesoxAltura"  from CARACTERISTICAPRODUTO order by idcaracteristica');
   end;

   dspPesquisaCaracteristica.DataSet       := qryPesquisaCaracteristica;
   cdsPesquisaCaracteristica.ProviderName  := dspPesquisaCaracteristica.Name;
   dsPesquisaCaracteristica.DataSet        := cdsPesquisaCaracteristica;
   cdsPesquisaCaracteristica.Active        := False;
   cdsPesquisaCaracteristica.Active        := True;
   dblPesoAltura.ListSource                := dsPesquisaCaracteristica;
   dblPesoAltura.KeyField                  := 'Id';
   dblPesoAltura.ListField                 := 'PesoxAltura';

   // Carrega combo de Categoria
   qryPesquisaCategoria                    := TSQLQuery.Create(Self);
   qryPesquisaCategoria.SQLConnection      := frmPrincipal.SQLConnection;
   with qryPesquisaCategoria, SQL do
   begin
      Close;
      Clear;
      Add('select idcategoria as "Id", nomecategoria as "Categoria" from categoria order by nomecategoria');
   end;

   dspPesquisaCategoria.DataSet            := qryPesquisaCategoria;
   cdsPesquisaCategoria.ProviderName       := dspPesquisaCategoria.Name;
   dsPesquisaCategoria.DataSet             := cdsPesquisaCategoria;
   cdsPesquisaCategoria.Active             := False;
   cdsPesquisaCategoria.Active             := True;
   dblCategoria.ListSource                 := dsPesquisaCategoria;
   dblCategoria.KeyField                   := 'Id';
   dblCategoria.ListField                  := 'Categoria';

   // Carrega combo de Serviços
   qryPesquisaSerico                       := TSQLQuery.Create(Self);
   qryPesquisaSerico.SQLConnection         := frmPrincipal.SQLConnection;
   with qryPesquisaSerico, SQL do
   begin
      Close;
      Clear;
      Add('select idservico as "Id", nomeservico as "Serviço" from servico order by idservico');
   end;

   dspPesquisaSerico.DataSet               := qryPesquisaSerico;
   cdsPesquisaServico.ProviderName         := dspPesquisaSerico.Name;
   dsPesquisaServico.DataSet               := cdsPesquisaServico;
   cdsPesquisaServico.Active               := False;
   cdsPesquisaServico.Active               := True;
   dblServico.ListSource                   := dsPesquisaServico;
   dblServico.KeyField                     := 'Id';
   dblServico.ListField                    := 'Serviço';

end;

procedure TfrmPrincipal.SetarCamposEdit;
begin
   edtID.Text             := dbgItens.DataSource.DataSet.FieldByName('Id').AsString;
   edtCodigo.Text         := dbgItens.DataSource.DataSet.FieldByName('Código').AsString;
   edtNome.Text           := dbgItens.DataSource.DataSet.FieldByName('Nome').AsString;
   edtDescricao.Text      := dbgItens.DataSource.DataSet.FieldByName('Descrição').AsString;
   edtVlrUnit.Text        := dbgItens.DataSource.DataSet.FieldByName('Vlr Unit.').AsString;
   dblPesoAltura.KeyValue := dbgItens.DataSource.DataSet.FieldByName('Id Característica').AsInteger;
   dblCategoria.KeyValue  := dbgItens.DataSource.DataSet.FieldByName('Id Categoria').AsInteger;
   dblServico.KeyValue    := dbgItens.DataSource.DataSet.FieldByName('Id Serviço').AsInteger;
end;

procedure TfrmPrincipal.LimparCampos;
begin
   edtID.Clear;
   edtCodigo.Clear;
   edtNome.Clear;
   edtDescricao.Clear;
   edtVlrUnit.Clear;
   dblPesoAltura.KeyValue := -1;
   dblCategoria.KeyValue  := -1;
   dblServico.KeyValue    := -1;
end;

procedure TfrmPrincipal.SetarBotoes(tipo: string);
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
