program TSS_Backend;

uses
  Forms,
  TSS_BE_Main_unit in 'TSS_BE_Main_unit.PAS' {TSS_BE_Main},
  TSS_BE_About_unit in 'TSS_BE_About_unit.PAS' {TSS_BE_About};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTSS_BE_Main, TSS_BE_Main);
  Application.CreateForm(TTSS_BE_About, TSS_BE_About);
  Application.Run;
end.
 
