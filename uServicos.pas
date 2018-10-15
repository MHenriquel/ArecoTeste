unit uServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, WideStrings, SqlExpr, DBXFirebird, DBXCommon,
  FMTBcd, Provider, SimpleDS, DBClient, uPrincipal;

    Type TServicos = class

       function InserirAlterarDeletar(parametro:string) : boolean;

       private
         FIDServico       : Integer;
         FNomeServico     : String;
         FCodigoServico   : String;
         FQry             : TSQLQuery;
         FSProcedure      : TSQLStoredProc;


         procedure SetNomeServico(const Value: String);
         procedure SetCodigoServico(const Value: String);
         procedure SetIDServico(const Value: Integer);
         procedure SetQry(const Value: TSQLQuery);
         procedure SetSProcedure(const Value: TSQLStoredProc);


       protected

       public
          constructor Create;
          property IDSERVICO         :Integer   read FIDServico       write SetIDServico;
          property NOMESERVICO       :String    read FNomeServico     write SetNomeServico;
          property CODIGOSERVICO     :String    read FCodigoServico   write SetCodigoServico;
          property Qry               :TSQLQuery read FQry             write SetQry;
          property SPProcedure       :TSQLStoredProc read FSProcedure write SetSProcedure;

       published
    end;

implementation

var transaction : TDBXTransaction;

constructor TServicos.Create;
begin
  Qry                        := TSQLQuery.Create(nil);
  Qry.SQLConnection          := frmPrincipal.SQLConnection;

  SPProcedure                := TSQLStoredProc.Create(nil);
  SPProcedure.SQLConnection  := frmPrincipal.SQLConnection;
  SPProcedure.StoredProcName := 'PSERVICOS';
end;

procedure TServicos.SetCodigoServico(const Value: String);
begin
  FCodigoServico := Value;
end;

procedure TServicos.SetNomeServico(const Value: String);
begin
  FNomeServico := Value;
end;

procedure TServicos.SetIDServico(const Value: Integer);
begin
  FIDServico := Value;
end;

procedure TServicos.SetQry(const Value: TSQLQuery);
begin
   FQry := Value;
end;

procedure TServicos.SetSProcedure(const Value: TSQLStoredProc);
begin
   FSProcedure := Value;
end;


function TServicos.InserirAlterarDeletar(parametro:string): boolean;
begin
   transaction := frmPrincipal.SQLConnection.BeginTransaction;

   with SPProcedure do
   begin
      Close;

      if ( parametro = 'A' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 4;
         Params.ParamByName('VEID').Value               := FIDServico;
         Params.ParamByName('VENOMESERVICO').Value      := FNomeServico;
         Params.ParamByName('VECODIGOSERVICO').Value    := FCodigoServico;
      end
      else if (  parametro = 'D' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 3;
         Params.ParamByName('VEID').Value               := FIDServico;
         Params.ParamByName('VENOMESERVICO').Value      := NULL;
         Params.ParamByName('VECODIGOSERVICO').Value    := NULL;
      end
      else if (  parametro = 'I' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 2;
         Params.ParamByName('VEID').Value               := null;
         Params.ParamByName('VENOMESERVICO').Value      := FNomeServico;
         Params.ParamByName('VECODIGOSERVICO').Value    := FCodigoServico;
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
