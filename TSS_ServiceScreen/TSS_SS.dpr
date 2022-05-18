program TSS_SS;

uses
  Vcl.Forms,
  TSS_SS_Mainform_unit in 'TSS_SS_Mainform_unit.pas' {TSS_SS_MainForm},
  TSS_SS_DataForm_unit in 'TSS_SS_DataForm_unit.pas' {DataForm},
  TSS_SS_ServicePanelClass_unit in 'TSS_SS_ServicePanelClass_unit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTSS_SS_MainForm, TSS_SS_MainForm);
  Application.CreateForm(TDataForm, DataForm);
  Application.Run;
end.
