program TSS_BE;

uses
  Vcl.Forms,
  TSS_BE_Main_unit in 'TSS_BE_Main_unit.PAS' {TSS_BE_Main},
  TSS_BE_About_unit in 'TSS_BE_About_unit.PAS' {TSS_BE_About},
  TSS_BE_DataForm_unit in 'TSS_BE_DataForm_unit.PAS' {TSS_BE_DataForm},
  TSS_BE_MediaForm_unit in 'TSS_BE_MediaForm_unit.pas' {TSS_BE_MediaForm},
  TSS_BE_ScreenDesigner_Form_unit in 'TSS_BE_ScreenDesigner_Form_unit.pas' {TSS_BE_ScreenDesigner_Form},
  TSS_BE_FeldPanel_unit in 'TSS_BE_FeldPanel_unit.pas',
  TSS_BE_KundenAddForm in 'TSS_BE_KundenAddForm.pas' {KundenAddForm},
  TSS_BE_KDSearchForm in 'TSS_BE_KDSearchForm.pas' {KDSearchForm},
  TSS_BE_VideoSearchForm in 'TSS_BE_VideoSearchForm.pas' {VideoSearchForm},
  TSS_BE_VertragsForm_unit in 'TSS_BE_VertragsForm_unit.pas' {TSS_BE_VertragsForm},
  TSS_BE_KDVerwaltungsForm_unit in 'TSS_BE_KDVerwaltungsForm_unit.pas' {KDVerwaltungsForm},
  TSS_BE_GallerieAddForm in 'TSS_BE_GallerieAddForm.pas' {GallerieAddForm},
  TSS_BE_FTPForm_unit in 'TSS_BE_FTPForm_unit.pas' {TSS_BE_FTPForm},
  TSS_BE_KDSelectForm_unit in 'TSS_BE_KDSelectForm_unit.pas' {TSS_BE_KDSelectform},
  TSS_BE_ConfigGenForm_unit in 'TSS_BE_ConfigGenForm_unit.pas' {TSS_BE_ConfigGenForm},
  TSS_BE_ButtonGenForm_unit in 'TSS_BE_ButtonGenForm_unit.pas' {TSS_BE_ButtonGenForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTSS_BE_Main, TSS_BE_Main);
  Application.CreateForm(TTSS_BE_About, TSS_BE_About);
  Application.CreateForm(TTSS_BE_DataForm, TSS_BE_DataForm);
  Application.CreateForm(TTSS_BE_MediaForm, TSS_BE_MediaForm);
  Application.CreateForm(TTSS_BE_ScreenDesigner_Form, TSS_BE_ScreenDesigner_Form);
  Application.CreateForm(TKundenAddForm, KundenAddForm);
  Application.CreateForm(TKDSearchForm, KDSearchForm);
  Application.CreateForm(TVideoSearchForm, VideoSearchForm);
  Application.CreateForm(TTSS_BE_VertragsForm, TSS_BE_VertragsForm);
  Application.CreateForm(TKDVerwaltungsForm, KDVerwaltungsForm);
  Application.CreateForm(TGallerieAddForm, GallerieAddForm);
  Application.CreateForm(TTSS_BE_FTPForm, TSS_BE_FTPForm);
  Application.CreateForm(TTSS_BE_KDSelectform, TSS_BE_KDSelectform);
  Application.CreateForm(TTSS_BE_ConfigGenForm, TSS_BE_ConfigGenForm);
  Application.CreateForm(TTSS_BE_ButtonGenForm, TSS_BE_ButtonGenForm);
  Application.Run;
end.
 
