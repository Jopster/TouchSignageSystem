program TSS_UDPDash;

uses
  Vcl.Forms,
  TSS_UPDDash_Mainunit in 'TSS_UPDDash_Mainunit.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
