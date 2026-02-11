program TSS_FE_AND;

uses
  System.StartUpCopy,
  FMX.Forms,
  TSS_FE_AND_MainForm_Unit in 'TSS_FE_AND_MainForm_Unit.pas' {MainForm},
  TSS_FE_AND_ButtonClass_Unit in 'TSS_FE_AND_ButtonClass_Unit.pas',
  TSS_FE_AND_LoadForm_Unit in 'TSS_FE_AND_LoadForm_Unit.pas' {LoadForm},
  TSS_FE_AND_DataUnit in 'TSS_FE_AND_DataUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TLoadForm, LoadForm);
  Application.Run;
end.
