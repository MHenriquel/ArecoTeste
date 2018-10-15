unit uItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, WideStrings, SqlExpr, DBXFirebird, DBXCommon,
  FMTBcd, Provider, SimpleDS, DBClient;


    Type TItem = class

       function InserirAlterarDeletar(parametro:string; conexao: TSQLConnection) : boolean;

       private
         FIDItem                 : Integer;
         FCodigo                 : string;
         FNome                   : string;
         FDescricao              : string;
         FValorUnitario          : Double;
         FIDCaracteristica       : Integer;
         FIDCategoria            : Integer;
         FIDServico              : Integer;
         FQry                    : TSQLQuery;
         FSProcedure             : TSQLStoredProc;

         procedure SetCodigo(const Value: string);
         procedure SetNome(const Value: string);
         procedure SetDescricao(const Value: string);
         procedure SetValorUnitario(const Value: Double);
         procedure SetIDCaracteristica(const Value: integer);
         procedure SetIDCategoria(const Value: integer);
         procedure SetIDServico(const Value: integer);
         procedure SetIDItem(const Value: integer);

         procedure SetQry(const Value: TSQLQuery);
         procedure SetSProcedure(const Value: TSQLStoredProc);



       protected

       public
          constructor Create(conexao: TSQLConnection);

          property IDITEM                   :Integer read FIDItem            write SetIDItem;
          property CODIGO                   :string  read FCodigo            write SetCodigo;
          property NOME                     :string  read FNome              write SetNome;
          property DESCRICAO                :string  read FDescricao         write SetDescricao;
          property VALORUNITARIO            :Double  read FValorUnitario     write SetValorUnitario;
          property IDCARACTERISTICA         :integer read FIDCaracteristica  write SetIDCaracteristica;
          property IDSERVICO                :integer read FIDServico         write SetIDServico;
          property IDCATEGORIA              :integer read FIDCategoria       write SetIDCategoria;

          property Qry                      :TSQLQuery      read FQry             write SetQry;
          property SPProcedure              :TSQLStoredProc read FSProcedure      write SetSProcedure;


       published
    end;

implementation

var transaction : TDBXTransaction;

constructor TItem.Create(conexao: TSQLConnection);
begin
  Qry                        := TSQLQuery.Create(nil);
  Qry.SQLConnection          := conexao;

  SPProcedure                := TSQLStoredProc.Create(nil);
  SPProcedure.SQLConnection  := conexao;
  SPProcedure.StoredProcName := 'PITEM';
end;

procedure TItem.SetCodigo(const Value: string);
begin
   FCodigo := Value;
end;

procedure TItem.SetNome(const Value: string);
begin
   FNome := Value;
end;

procedure TItem.SetDescricao(const Value: string);
begin
   FDescricao := Value;
end;

procedure TItem.SetValorUnitario(const Value: Double);
begin
   FValorUnitario := Value;
end;

procedure TItem.SetIDCaracteristica(const Value: integer);
begin
   FIDCaracteristica := Value;
end;

procedure TItem.SetIDCategoria(const Value: integer);
begin
   FIDCategoria := Value;
end;

procedure TItem.SetIDServico(const Value: integer);
begin
   FIDServico := Value;
end;

procedure TItem.SetIDItem(const Value: Integer);
begin
   FIDItem := Value;
end;

procedure TItem.SetQry(const Value: TSQLQuery);
begin
   FQry := Value;
end;

procedure TItem.SetSProcedure(const Value: TSQLStoredProc);
begin
   FSProcedure := Value;
end;

function TItem.InserirAlterarDeletar(parametro:string; conexao: TSQLConnection): boolean;
begin
   transaction := conexao.BeginTransaction;

   with SPProcedure do
   begin
      Close;

      if ( parametro = 'A' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 4;
         Params.ParamByName('VEID').Value               := FIDItem;
         Params.ParamByName('VECODIGO').Value           := FCodigo;
         Params.ParamByName('VENOME').Value             := FNome;
         Params.ParamByName('VEDESCRICAO').Value        := FDescricao;
         Params.ParamByName('VEVALORUNITARIO').Value    := FValorUnitario;
         Params.ParamByName('VEIDCARACTERISTICA').Value := FIDCaracteristica;
         Params.ParamByName('VEIDCATEGORIA').Value      := FIDCategoria;
         Params.ParamByName('VEIDSERVICO').Value        := FIDServico;
      end
      else if (  parametro = 'D' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 3;
         Params.ParamByName('VEID').Value               := FIDItem;
         Params.ParamByName('VECODIGO').Value           := null;
         Params.ParamByName('VENOME').Value             := null;
         Params.ParamByName('VEDESCRICAO').Value        := null;
         Params.ParamByName('VEVALORUNITARIO').Value    := null;
         Params.ParamByName('VEIDCARACTERISTICA').Value := null;
         Params.ParamByName('VEIDCATEGORIA').Value      := null;
         Params.ParamByName('VEIDSERVICO').Value        := null;
      end
      else if (  parametro = 'I' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 2;
         Params.ParamByName('VEID').Value               := null;
         Params.ParamByName('VECODIGO').Value           := FCodigo;
         Params.ParamByName('VENOME').Value             := FNome;
         Params.ParamByName('VEDESCRICAO').Value        := FDescricao;
         Params.ParamByName('VEVALORUNITARIO').Value    := FValorUnitario;
         Params.ParamByName('VEIDCARACTERISTICA').Value := FIDCaracteristica;
         Params.ParamByName('VEIDCATEGORIA').Value      := FIDCategoria;
         Params.ParamByName('VEIDSERVICO').Value        := FIDServico;
      end;

      try
         ExecProc;
         conexao.CommitFreeAndNil(transaction);
         result := true;
      except
         result := false;
      end;

   end;
end;



end.
