unit uUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

function data(vdata:string):boolean;

implementation

function data(vdata:string):boolean;
begin
      try
         StrToDate(vdata);
         data:=true;
      except
      MessageDlg('Data Inválida !!' , mtInformation, [mbOk], 0);
      data:=false;
      end;
end;

end.
