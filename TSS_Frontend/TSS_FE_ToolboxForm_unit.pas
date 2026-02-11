unit TSS_FE_ToolboxForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JPP.PngButton;

type
  TTSS_FE_Toolboxform = class(TForm)
    JppPngButton3: TJppPngButton;
    JppPngButton1: TJppPngButton;
    procedure JppPngButton3Click(Sender: TObject);
    procedure JppPngButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TSS_FE_Toolboxform: TTSS_FE_Toolboxform;

implementation

{$R *.dfm}

procedure TTSS_FE_Toolboxform.JppPngButton1Click(Sender: TObject);
begin
  DeleteFile('C:\TSS\Config\TSS_FE.DBG');
end;

procedure TTSS_FE_Toolboxform.JppPngButton3Click(Sender: TObject);
var f:textfile;
begin
  Assignfile(f,'C:\TSS\Config\TSS_FE.DBG');
  rewrite(f);
  Closefile(f);
end;

end.
