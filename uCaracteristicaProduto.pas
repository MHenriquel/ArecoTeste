unit uCaracteristicaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, WideStrings, SqlExpr, DBXFirebird, DBXCommon,
  FMTBcd, Provider, SimpleDS, DBClient, uPrincipal;

    Type TCaracteristicaProduto = class

       function InserirAlterarDeletar(parametro:string) : boolean;

       private
         FIDCaracteristica       : Integer;
         FPeso                   : Double;
         FAltura                 : Double;
         FQry                    : TSQLQuery;
         FSProcedure             : TSQLStoredProc;

         procedure SetPeso(const Value: Double);
         procedure SetAltura(const Value: Double);
         procedure SetIDCaracteristica(const Value: Integer);
         procedure SetQry(const Value: TSQLQuery);
         procedure SetSProcedure(const Value: TSQLStoredProc);


       protected

       public
          constructor Create;
          property IDCARACTERISTICA         :Integer read FIDCaracteristica       write SetIDCaracteristica;
          property PESO                     :Double  read FPeso                   write SetPeso;
          property ALTURA                   :Double  read FAltura                 write SetAltura;
          property Qry                      :TSQLQuery      read FQry             write SetQry;
          property SPProcedure              :TSQLStoredProc read FSProcedure      write SetSProcedure;

       published
    end;

implementation

var transaction : TDBXTransaction;


constructor TCaracteristicaProduto.Create;
begin
  Qry                        := TSQLQuery.Create(nil);
  Qry.SQLConnection          := frmPrincipal.SQLConnection;

  SPProcedure                := TSQLStoredProc.Create(nil);
  SPProcedure.SQLConnection  := frmPrincipal.SQLConnection;
  SPProcedure.StoredProcName := 'PCARACTERISTICAPRODUTO';
end;

procedure TCaracteristicaProduto.SetPeso(const Value: Double);
begin
   FPeso := Value;
end;

procedure TCaracteristicaProduto.SetAltura(const Value: Double);
begin
   FAltura := Value;
end;

procedure TCaracteristicaProduto.SetIDCaracteristica(const Value: Integer);
begin
   FIDCaracteristica := Value;
end;

procedure TCaracteristicaProduto.SetQry(const Value: TSQLQuery);
begin
   FQry := Value;
end;

procedure TCaracteristicaProduto.SetSProcedure(const Value: TSQLStoredProc);
begin
   FSProcedure := Value;
end;

function TCaracteristicaProduto.InserirAlterarDeletar(parametro:string): boolean;
begin
   transaction := frmPrincipal.SQLConnection.BeginTransaction;

   with SPProcedure do
   begin
      Close;

      if ( parametro = 'A' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 4;
         Params.ParamByName('VEID').Value               := FIDCaracteristica;
         Params.ParamByName('VEPESO').Value             := FPeso;
         Params.ParamByName('VEALTURA').Value           := FAltura;
      end
      else if (  parametro = 'D' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 3;
         Params.ParamByName('VEID').Value               := FIDCaracteristica;
         Params.ParamByName('VEPESO').Value             := NULL;
         Params.ParamByName('VEALTURA').Value           := NULL;
      end
      else if (  parametro = 'I' ) then
      begin
         Params.ParamByName('VEPARAMETRO').Value        := 2;
         Params.ParamByName('VEID').Value               := null;
         Params.ParamByName('VEPESO').Value             := FPeso;
         Params.ParamByName('VEALTURA').Value           := FAltura;
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
