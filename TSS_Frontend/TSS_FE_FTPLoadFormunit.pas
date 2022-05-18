unit TSS_FE_FTPLoadFormunit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DsFancyButton, Vcl.StdCtrls;

type
  TTSS_FE_FTPLoadForm = class(TForm)
    Wlabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DsFancyButton2: TDsFancyButton;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TSS_FE_FTPLoadForm: TTSS_FE_FTPLoadForm;

implementation

{$R *.dfm}

end.
