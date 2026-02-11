unit TSS_BE_DataForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.ExtCtrls;

type
  TTSS_BE_DataForm = class(TForm)
    TSS_FE_Connection: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    TSS_BE_DisplayList: TFDTable;
    TSS_FE_DisplayConfig: TFDQuery;
    TSS_BE_AlgQuery: TFDQuery;
    Panel1: TPanel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Global_Schematic_id:String;
    Display_id:String;
    Debug:boolean;
    Mainpath:String;
    function MYCreateGuid:String;
    function compNameCreate:string;
    function getKundenuid(id:string):string;
  end;

var
  TSS_BE_DataForm: TTSS_BE_DataForm;

implementation

{$R *.dfm}

{ TTSS_BE_DataForm }

function TTSS_BE_DataForm.compNameCreate: string;
var uuid:TGuid;s:String;
begin
  CreateGUID(uuid);
  s:=GUIDToString(uuid);
  delete(s,1,1);
  delete(s,length(s),1);
  repeat
    delete(s,pos('-',s),1);
  until pos('-',s)=0;
  Result:='C_'+copy(s,1,20);
end;

function TTSS_BE_DataForm.getKundenuid(id: string): string;
begin

end;

function TTSS_BE_DataForm.MYCreateGuid: String;
var uuid:TGuid;
begin
  CreateGUID(uuid);
  Result:=GUIDToString(uuid);
end;

end.
