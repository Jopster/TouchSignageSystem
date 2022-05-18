program TSS_FE;

uses
  Vcl.Forms,
  TSS_FE_LoadScreen in 'TSS_FE_LoadScreen.pas' {MainForm},
  TSS_FE_MainScreen in 'TSS_FE_MainScreen.pas' {MainDisplayForm},
  TSS_FE_DataForm in 'TSS_FE_DataForm.pas' {DataForm},
  TSS_FE_SetupForm in 'TSS_FE_SetupForm.pas' {SetupForm},
  TSS_ButtonClass_unit in 'TSS_ButtonClass_unit.pas',
  TSS_HttpButtonImgLoadThread_unit in 'TSS_HttpButtonImgLoadThread_unit.pas',
  TSS_FE_SyncMediaForm in 'TSS_FE_SyncMediaForm.pas' {SyncMediaForm},
  TSS_FE_SyncMediaClass in 'TSS_FE_SyncMediaClass.pas',
  TSS_DisplayClass_unit in 'TSS_DisplayClass_unit.pas',
  TSS_FTPFileLoadThread_unit in 'TSS_FTPFileLoadThread_unit.pas',
  TSS_BE_FTPForm_unit in 'TSS_BE_FTPForm_unit.pas' {TSS_BE_FTPForm},
  TSS_FE_BlackoutForm_unit in 'TSS_FE_BlackoutForm_unit.pas' {BlackoutForm},
  TSS_Wifi in 'TSS_Wifi.pas',
  MahUSB in 'MahUSB.pas',
  TSS_FE_Updateform in 'TSS_FE_Updateform.pas' {UpdateForm},
  TSS_FE_FTPLoadFormunit in 'TSS_FE_FTPLoadFormunit.pas' {TSS_FE_FTPLoadForm},
  TSS_FE_Specialform_unit in 'TSS_FE_Specialform_unit.pas' {TSS_FE_Specialform},
  TSS_FE_XtraBtnForm_unit in 'TSS_FE_XtraBtnForm_unit.pas' {TSS_FE_XtraBtnForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMainDisplayForm, MainDisplayForm);
  Application.CreateForm(TDataForm, DataForm);
  Application.CreateForm(TSetupForm, SetupForm);
  Application.CreateForm(TSyncMediaForm, SyncMediaForm);
  Application.CreateForm(TTSS_BE_FTPForm, TSS_BE_FTPForm);
  Application.CreateForm(TBlackoutForm, BlackoutForm);
  Application.CreateForm(TUpdateForm, UpdateForm);
  Application.CreateForm(TTSS_FE_FTPLoadForm, TSS_FE_FTPLoadForm);
  Application.CreateForm(TTSS_FE_Specialform, TSS_FE_Specialform);
  Application.CreateForm(TTSS_FE_XtraBtnForm, TSS_FE_XtraBtnForm);
  Application.Run;
end.
