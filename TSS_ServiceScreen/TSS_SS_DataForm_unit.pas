unit TSS_SS_DataForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TDataForm = class(TForm)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Global_Schematic_id:String;
    MainPath:String;
    WatcherID:string;
  end;

var
  DataForm: TDataForm;

implementation

{$R *.dfm}

end.
