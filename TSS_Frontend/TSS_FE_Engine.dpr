program TSS_FE_Engine;
{$I cef.inc}

uses
  vcl.Forms,
  Windows,
  sysutils,
  uCEFApplication,
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
  TSS_FE_XtraBtnForm_unit in 'TSS_FE_XtraBtnForm_unit.pas' {TSS_FE_XtraBtnForm},
  TSS_CodeForm in 'TSS_CodeForm.pas' {CodeForm},
  TSS_CenterSetupForm in 'TSS_CenterSetupForm.pas' {CenterSetupForm},
  TSS_FE_BtnVisibleListForm in 'TSS_FE_BtnVisibleListForm.pas' {BtnVisibleList},
  TSS_FE_InternetForm_unit in 'TSS_FE_InternetForm_unit.pas' {TSS_FE_InternetForm},
  TSS_FE_KioskInternetForm_unit in 'TSS_FE_KioskInternetForm_unit.pas' {KioskInternetForm},
  CenterVideo_class_unit in 'CenterVideo_class_unit.pas',
  TSS_FE_StorryPanel_class_unit in 'TSS_FE_StorryPanel_class_unit.pas',
  TSS_FE_XpertButtonSetupForm in 'TSS_FE_XpertButtonSetupForm.pas' {XpertButtonSetupForm};

{$R *.res}

var
Mutex:Thandle;

begin
  GlobalCEFApp := TCefApplication.Create;
  GlobalCEFApp.ResourcesDirPath:='C:\TSS\WebTemp\Engine';
  GlobalCEFApp.LocalesDirPath:='C:\TSS\WebTemp\Engine\locales';
  GlobalCEFApp.FrameworkDirPath:='C:\TSS\WebTemp\Engine';


  // In case you want to use custom directories for the CEF3 binaries, cache and user data.
{
  GlobalCEFApp.FrameworkDirPath     := 'cef';
  GlobalCEFApp.ResourcesDirPath     := 'cef';
  GlobalCEFApp.LocalesDirPath       := 'cef\locales';
  GlobalCEFApp.cache                := 'cef\cache';
  GlobalCEFApp.UserDataPath         := 'cef\User Data';
}
//  Mutex := CreateMutex(nil, True, 'TSSENgine');
//  if (Mutex <> 0) and (GetLastError = 0) then
//  begin
    if GlobalCEFApp.StartMainProcess then
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
  Application.CreateForm(TCodeForm, CodeForm);
  Application.CreateForm(TCenterSetupForm, CenterSetupForm);
  Application.CreateForm(TBtnVisibleList, BtnVisibleList);
  Application.CreateForm(TTSS_FE_InternetForm, TSS_FE_InternetForm);
  Application.CreateForm(TKioskInternetForm, KioskInternetForm);
  Application.CreateForm(TXpertButtonSetupForm, XpertButtonSetupForm);
  Application.Run;
    end;
//  end;
  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.
