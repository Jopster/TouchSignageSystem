program TSS_WD;

uses
  Vcl.Forms,
  Mainform_unit in 'Mainform_unit.pas' {Form1},
  TSS_WD_DataForm_unit in 'TSS_WD_DataForm_unit.pas' {DataForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataForm, DataForm);
  Application.Run;
end.
