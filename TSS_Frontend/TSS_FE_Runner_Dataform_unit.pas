unit TSS_FE_Runner_Dataform_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TTSS_FE_Runner_Dataform = class(TForm)
  private
    FDoScreenshot: Boolean;
    FCfgInifile: String;
    FDisplayMonitor: Word;
    FDebugmode: Boolean;
    FShellmode: Boolean;
    FDisplayScreen: word;
    FEditMode: Boolean;
    FDisplayID: String;
    FMainPath: String;
    FGestureDone: Boolean;
    FGestureValidtime: Word;
    Fdrawcodeline: Boolean;
    FProzessrestart: boolean;
    Fsettings_rundetect_posx: word;
    Fsettings_rundetect_posy: word;
    Fsettings_rundetect_maxfail: word;
    Fsettings_rundetect_doReboot: boolean;
    Fsettings_Blackdetect_posx2: worD;
    Fsettings_Blackdetect_posy2: worD;
    Fsettings_Blackdetect_posx1: worD;
    Fsettings_Blackdetect_posy1: worD;
    Fsettings_Blackdetect_MaxFail: word;
    Fsettings_Blackdetect_doReboot: Boolean;
    FAutoRunSystem: Boolean;
    FSystemID: String;
    FUDPLevel: Word;
    FUDPLogPort: Word;
    FUDPLogServer: String;
    FTCPPort: Word;
    FTCPInterval: word;
    FTCPServer: string;
    FEnigneEXE: string;
    FForceScreen_W: integer;
    FForceScreen_H: integer;
    FForceScreen: boolean;
    procedure SetCfgInifile(const Value: String);
    procedure SetDebugmode(const Value: Boolean);
    procedure SetDisplayMonitor(const Value: Word);
    procedure SetDisplayScreen(const Value: word);
    procedure SetDoScreenshot(const Value: Boolean);
    procedure SetEditMode(const Value: Boolean);
    procedure SetShellmode(const Value: Boolean);
    procedure SetDisplayID(const Value: String);
    procedure SetMainPath(const Value: String);
    procedure SetGestureDone(const Value: Boolean);
    procedure SetGestureValidtime(const Value: Word);
    procedure Setdrawcodeline(const Value: Boolean);
    procedure SetProzessrestart(const Value: boolean);
    procedure Setsettings_rundetect_posx(const Value: word);
    procedure Setsettings_rundetect_posy(const Value: word);
    procedure Setsettings_rundetect_maxfail(const Value: word);
    procedure Setsettings_rundetect_doReboot(const Value: boolean);
    procedure Setsettings_Blackdetect_posx1(const Value: worD);
    procedure Setsettings_Blackdetect_posx2(const Value: worD);
    procedure Setsettings_Blackdetect_posy1(const Value: worD);
    procedure Setsettings_Blackdetect_posy2(const Value: worD);
    procedure Setsettings_Blackdetect_doReboot(const Value: Boolean);
    procedure Setsettings_Blackdetect_MaxFail(const Value: word);
    procedure SetAutoRunSystem(const Value: Boolean);
    procedure SetSystemID(const Value: String);
    procedure SetUDPLevel(const Value: Word);
    procedure SetUDPLogPort(const Value: Word);
    procedure SetUDPLogServer(const Value: String);
    function GetGestureDone:Boolean;
    procedure SetTCPInterval(const Value: word);
    procedure SetTCPPort(const Value: Word);
    procedure SetTCPServer(const Value: string);
    procedure SetEnigneEXE(const Value: string);
    procedure SetForceScreen_H(const Value: integer);
    procedure SetForceScreen_W(const Value: integer);
    procedure SetForceScreen(const Value: boolean);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    property DisplayScreen:word read FDisplayScreen write SetDisplayScreen;
    property DisplayMonitor:Word read FDisplayMonitor write SetDisplayMonitor;
    property AutoRunSystem:Boolean read FAutoRunSystem write SetAutoRunSystem;
    property Debugmode:Boolean read FDebugmode write SetDebugmode;
    property Shellmode:Boolean read FShellmode write SetShellmode;
    property CfgInifile:String read FCfgInifile write SetCfgInifile;
    property DoScreenshot:Boolean read FDoScreenshot write SetDoScreenshot;
    property EditMode:Boolean read FEditMode write SetEditMode;
    property DisplayID:String read FDisplayID write SetDisplayID;
    property SystemID:String read FSystemID write SetSystemID;
    property UDPLevel:Word read FUDPLevel write SetUDPLevel;
    property UDPLogPort:Word read FUDPLogPort write SetUDPLogPort;
    property UDPLogServer:String read FUDPLogServer write SetUDPLogServer;
    property MainPath:String read FMainPath write SetMainPath;
    property GestureDone:Boolean read GetGestureDone write SetGestureDone;
    property GestureValidtime:Word read FGestureValidtime write SetGestureValidtime;
    property drawcodeline:Boolean read Fdrawcodeline write Setdrawcodeline;
    property Prozessrestart:boolean read FProzessrestart write SetProzessrestart;
    property settings_rundetect_posx:word read Fsettings_rundetect_posx write Setsettings_rundetect_posx;
    property settings_rundetect_posy:word read Fsettings_rundetect_posy write Setsettings_rundetect_posy;
    property settings_rundetect_maxfail:word read Fsettings_rundetect_maxfail write Setsettings_rundetect_maxfail;
    property settings_rundetect_doReboot:boolean read Fsettings_rundetect_doReboot write Setsettings_rundetect_doReboot;
    property settings_Blackdetect_posx1:worD read Fsettings_Blackdetect_posx1 write Setsettings_Blackdetect_posx1;
    property settings_Blackdetect_posy1:worD read Fsettings_Blackdetect_posy1 write Setsettings_Blackdetect_posy1;
    property settings_Blackdetect_posx2:worD read Fsettings_Blackdetect_posx2 write Setsettings_Blackdetect_posx2;
    property settings_Blackdetect_posy2:worD read Fsettings_Blackdetect_posy2 write Setsettings_Blackdetect_posy2;
    property settings_Blackdetect_MaxFail:word read Fsettings_Blackdetect_MaxFail write Setsettings_Blackdetect_MaxFail;
    property settings_Blackdetect_doReboot:Boolean read Fsettings_Blackdetect_doReboot write Setsettings_Blackdetect_doReboot;
    property TCPInterval:word read FTCPInterval write SetTCPInterval;
    property TCPServer:string read FTCPServer write SetTCPServer;
    property TCPPort:Word read FTCPPort write SetTCPPort;
    property EnigneEXE:string read FEnigneEXE write SetEnigneEXE;
    property ForceScreen:boolean read FForceScreen write SetForceScreen;
    property ForceScreen_W:integer read FForceScreen_W write SetForceScreen_W;
    property ForceScreen_H:integer read FForceScreen_H write SetForceScreen_H;
    function FindWindowByTitle(WindowTitle: string): Hwnd;
  end;

var
  TSS_FE_Runner_Dataform: TTSS_FE_Runner_Dataform;

implementation

{$R *.dfm}

{ TTSS_FE_Runner_Dataform }

function TTSS_FE_Runner_Dataform.GetGestureDone: Boolean;
begin
  result:=FGestureDone;
end;

procedure TTSS_FE_Runner_Dataform.SetAutoRunSystem(const Value: Boolean);
begin
  FAutoRunSystem := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetCfgInifile(const Value: String);
begin
  FCfgInifile := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetDebugmode(const Value: Boolean);
begin
  FDebugmode := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetDisplayID(const Value: String);
begin
  FDisplayID := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetDisplayMonitor(const Value: Word);
begin
  FDisplayMonitor := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetDisplayScreen(const Value: word);
begin
  FDisplayScreen := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetDoScreenshot(const Value: Boolean);
begin
  FDoScreenshot := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setdrawcodeline(const Value: Boolean);
begin
  Fdrawcodeline := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetEditMode(const Value: Boolean);
begin
  FEditMode := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetEnigneEXE(const Value: string);
begin
  FEnigneEXE := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetForceScreen(const Value: boolean);
begin
  FForceScreen := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetForceScreen_H(const Value: integer);
begin
  FForceScreen_H := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetForceScreen_W(const Value: integer);
begin
  FForceScreen_W := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetGestureDone(const Value: Boolean);
begin
  FGestureDone := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetGestureValidtime(const Value: Word);
begin
  FGestureValidtime := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetMainPath(const Value: String);
begin
  FMainPath := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetProzessrestart(const Value: boolean);
begin
  FProzessrestart := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_Blackdetect_doReboot(
  const Value: Boolean);
begin
  Fsettings_Blackdetect_doReboot := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_Blackdetect_MaxFail(
  const Value: word);
begin
  Fsettings_Blackdetect_MaxFail := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_Blackdetect_posx1(
  const Value: worD);
begin
  Fsettings_Blackdetect_posx1 := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_Blackdetect_posx2(
  const Value: worD);
begin
  Fsettings_Blackdetect_posx2 := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_Blackdetect_posy1(
  const Value: worD);
begin
  Fsettings_Blackdetect_posy1 := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_Blackdetect_posy2(
  const Value: worD);
begin
  Fsettings_Blackdetect_posy2 := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_rundetect_doReboot(
  const Value: boolean);
begin
  Fsettings_rundetect_doReboot := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_rundetect_maxfail(
  const Value: word);
begin
  Fsettings_rundetect_maxfail := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_rundetect_posx(const Value: word);
begin
  Fsettings_rundetect_posx := Value;
end;

procedure TTSS_FE_Runner_Dataform.Setsettings_rundetect_posy(const Value: word);
begin
  Fsettings_rundetect_posy := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetShellmode(const Value: Boolean);
begin
  FShellmode := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetSystemID(const Value: String);
begin
  FSystemID := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetTCPInterval(const Value: word);
begin
  FTCPInterval := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetTCPPort(const Value: Word);
begin
  FTCPPort := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetTCPServer(const Value: string);
begin
  FTCPServer := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetUDPLevel(const Value: Word);
begin
  FUDPLevel := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetUDPLogPort(const Value: Word);
begin
  FUDPLogPort := Value;
end;

procedure TTSS_FE_Runner_Dataform.SetUDPLogServer(const Value: String);
begin
  FUDPLogServer := Value;
end;

function TTSS_FE_Runner_Dataform.FindWindowByTitle(WindowTitle: string): Hwnd;
var
  NextHandle: Hwnd;
  NextTitle: array[0..260] of char;
begin
  // Get the first window
  NextHandle := GetWindow(Application.Handle, GW_HWNDFIRST);
  while NextHandle > 0 do
  begin
    // retrieve its text
    GetWindowText(NextHandle, NextTitle, 255);
    if Pos(WindowTitle, StrPas(NextTitle)) <> 0 then
    begin
      Result := NextHandle;
      Exit;
    end
    else
      // Get the next window
      NextHandle := GetWindow(NextHandle, GW_HWNDNEXT);
  end;
  Result := 0;
end;

end.
