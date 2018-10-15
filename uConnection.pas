unit uConnection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, DB, SqlExpr, DBXCommon, DBXInterbase, uprincipal, IniFiles;



procedure ConectarBD;
procedure DesconectarBD;

implementation

procedure  ConectarBD;
var conecta : TIniFile;
begin

   conecta:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');

   frmPrincipal.SQLConnection                            := TSQLConnection.Create(nil);
   frmPrincipal.SQLConnection.ConnectionName             := 'FBConnection';
   frmPrincipal.SQLConnection.DriverName                 := 'Firebird';
   frmPrincipal.SQLConnection.GetDriverFunc              := 'getSQLDriverINTERBASE';
   frmPrincipal.SQLConnection.LibraryName                := 'dbxfb.dll';
   frmPrincipal.SQLConnection.LoginPrompt                := False;
   frmPrincipal.SQLConnection.LoadParamsOnConnect        := False;

   frmPrincipal.SQLConnection.Params.Values['Database']  :=  conecta.ReadString('DADOS','DATABASE','');
   frmPrincipal.SQLConnection.Params.Values['User_Name'] :=  conecta.ReadString('DADOS','USERNAME','');
   frmPrincipal.SQLConnection.Params.Values['Password']  := conecta.ReadString('DADOS','PASSWORD','');

   try
      frmPrincipal.SQLConnection.Connected := true;
   except on E:Exception do
      ShowMessage(e.Message);
   end;
   FreeAndNil(conecta);
end;

procedure  DesconectarBD;
begin
   if frmPrincipal.SQLConnection.Connected then
      frmPrincipal.SQLConnection.Connected := False;

end;

end.
