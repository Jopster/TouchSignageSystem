program TSS_FE;

uses
  Vcl.Forms,
  TSS_FE_Runner_Mainform in 'TSS_FE_Runner_Mainform.pas' {TSS_Runner_Mainform},
  TSS_FE_Runner_Dataform_unit in 'TSS_FE_Runner_Dataform_unit.pas' {TSS_FE_Runner_Dataform},
  TSS_FE_Runner_Helpform_unit in 'TSS_FE_Runner_Helpform_unit.pas' {Helpform},
  TSS_FE_Runner_Settingsform_unit in 'TSS_FE_Runner_Settingsform_unit.pas' {TSS_FE_Runner_Settingsform},
  TSS_OS_IconClass_unit in 'TSS_OS_IconClass_unit.pas',
  TSS_Scheduler_unit in 'TSS_Scheduler_unit.pas',
  TSS_FE_ToolboxForm_unit in 'TSS_FE_ToolboxForm_unit.pas' {TSS_FE_Toolboxform};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTSS_Runner_Mainform, TSS_Runner_Mainform);
  Application.CreateForm(TTSS_FE_Runner_Dataform, TSS_FE_Runner_Dataform);
  Application.CreateForm(THelpform, Helpform);
  Application.CreateForm(TTSS_FE_Runner_Settingsform, TSS_FE_Runner_Settingsform);
  Application.CreateForm(TTSS_FE_Toolboxform, TSS_FE_Toolboxform);
  Application.Run;
end.
