unit uCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, WideStrings, SqlExpr, DBXFirebird, DBXCommon,
  FMTBcd, Provider, SimpleDS, DBClient, uPrincipal;

    Type TCategoria = class

       function InserirAlterarDeletar(parametro:string) : boolean;

       private
         FIDCATEGORIA     : Integer;
         FCODIGOCATEGORIA : String;
         FNOMECATEGORIA   : String;
         FQryCategoria    : TSQLQuery;
         FSProcedure      : TSQLStoredProc;


         procedure SetNomeCategoria(const Value: String);
         procedure SetCodigoCategoria(const Value: String);
         procedure SetIDCategoria(const Value: Integer);
         procedure SetQry(const Value: TSQLQuery);
         procedure SetSProcedure(const Value: TSQLStoredProc);


       protected

       public
          constructor Create;
          property IDCATEGORIA       :Integer        read FIDCATEGORIA     write SetIDCategoria;
          property CODIGOCATEGORIA   :String         read FCODIGOCATEGORIA write SetCodigoCategoria;
          property NOMECATEGORIA     :String         read FNOMECATEGORIA   write SetNomeCategoria;
          property QryCategoria      :TSQLQuery      read FQryCategoria    write SetQry;
          property SPProcedure       :TSQLStoredProc read FSProcedure      write SetSProcedure;

       published
    end;

implementation

var transaction : TDBXTransaction;


constructor TCategoria.Create;
begin
  QryCategoria               := TSQLQuery.Create(nil);
  QryCategoria.SQLConnection := frmPrincipal.SQLConnection;

  SPProcedure                := TSQLStoredProc.Create(nil);
  SPProcedure.SQLConnection  := frmPrincipal.SQLConnection;
  SPProcedure.StoredProcName := 'PCATEGORIA';
end;

procedure TCategoria.SetCodigoCategoria(const Value: String);
begin
   FCODIGOCATEGORIA := Value;
end;

procedure TCategoria.SetNomeCategoria(const Value: String);
begin
   FNOMECATEGORIA := Value;
end;

procedure TCategoria.SetIDCategoria(const Value: Integer);
begin
   FIDCATEGORIA := Value;
end;

procedure TCategoria.SetQry(const Value: TSQLQuery);
begin
   FQryCategoria := Value;
end;

procedure TCategoria.SetSProcedure(const Value: TSQLStoredProc);
begin
   FSProcedure := Value;
end;

function TCategoria.InserirAlterarDeletar(parametro:string): boolean;
begin
   transaction := frmPrincipal.SQLConnection.BeginTransaction;

   with SPProcedure do
   begin
      Close;

      if ( parametro = 'A' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 4;
         Params.ParamByName('VEID').Value               := FIDCATEGORIA;
         Params.ParamByName('VECODIGOCATEGORIA').Value  := FCODIGOCATEGORIA;
         Params.ParamByName('VENOMECATEGORIA').Value    := FNOMECATEGORIA;
      end
      else if (  parametro = 'D' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 3;
         Params.ParamByName('VEID').Value               := FIDCATEGORIA;
         Params.ParamByName('VECODIGOCATEGORIA').Value  := NULL;
         Params.ParamByName('VENOMECATEGORIA').Value    := NULL;
      end
      else if (  parametro = 'I' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 2;
         Params.ParamByName('VEID').Value               := null;
         Params.ParamByName('VECODIGOCATEGORIA').Value  := FCODIGOCATEGORIA;
         Params.ParamByName('VENOMECATEGORIA').Value    := FNOMECATEGORIA;
      end;

      try
         ExecProc;
         frmPrincipal.SQLConnection.CommitFreeAndNil(transaction);
         result := true;
      except
         result := false;
      end;

   end;
end;

end.

