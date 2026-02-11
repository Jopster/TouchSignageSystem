unit TSS_FE_MainScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,TSS_ButtonClass_unit, Vcl.StdCtrls,
  Vcl.ExtCtrls, dsLeds, DsFancyButton, FloatingWindow, Vcl.OleCtrls, WMPLib_TLB,TSS_DisplayClass_unit,
  Vcl.Buttons, IdBaseComponent, IdThreadComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, DSPack,TSS_Wifi,
  Vcl.Imaging.pngimage,MahUSB,TSS_FE_Updateform, Vcl.Menus,shellAPI,Dateutils,
  Vcl.ExtDlgs, Vcl.Touch.GestureMgr, System.Win.Registry,Tlhelp32,
  Vcl.Imaging.jpeg,system.Contnrs,CenterVideo_Class_unit,TSS_FE_StorryPanel_class_unit,
  IdUDPServer, IdUDPBase, IdUDPClient, IdGlobal, IdSocketHandle;

const
  wlanapi = 'wlanapi.dll';
  WLAN_NOTIFICATION_SOURCE_ACM = $00000008;
  LOG_INFO = 6;
  LOG_WARNING = 4;
  LOG_ERROR = 2;
  LOG_DEBUG = 8;

type
  PMyEnumParam = ^TMyEnumParam;
  TMyEnumParam = record
    lb: String;
  end;

type
  TMyFileRecord = packed record
    b: integer;
    s: string[255];
  end;
  PMyFileRecord = ^TMyFileRecord;

  TWMMYMessage = record
    Msg: Cardinal;   // ( first is the message ID )
    Handle: HWND;    // ( this is the wParam, Handle of sender)
    Info: Longint;   // ( this is lParam, pointer to our data)
    Result: Longint;
  end;

type
  PMSGLogdata = ^TMSGLogdata;
  TMSGLogdata = record
    LogTime:Tdatetime;
    LogLevel:Word;
    LogProg:Array[0..50] of char;
    LogPart:Array[0..50] of char;
    LogMessage1Len:worD;
    LogMessage1: Array[0..0] of char;
    LogMessage2Len:worD;
    LogMessage2: Array[0..0] of char;
  end;

type
  GUID = TGUID;
  HANDLE = THandle;

  PWLanNotificationData = ^TWLanNotificationData;
  TWLanNotificationData = record
    NotificationSource: DWORD;
    NotificationCode: DWORD;
    InterfaceGuid: GUID;
    dwDataSize: DWORD;
    pData: PVOID;
  end;

TWLanNotificationCallback = procedure(data: PWLanNotificationData; context: PVOID); stdcall;

function WlanOpenHandle(dwClientVersion: DWORD; pReserved: PVOID;
  out pdwNegotiatedVersion: DWORD; out phClientHandle: HANDLE): DWORD; stdcall;
  external wlanapi name 'WlanOpenHandle';

function WlanRegisterNotification(hClientHandle: HANDLE; dwNotifSource: DWORD;
  bIgnoreDuplicate: BOOL; funcCallback: TWLanNotificationCallback; pCallbackContext: PVOID;
  pReserved: PVOID; out pdwPrevNotifSource: DWORD): DWORD; stdcall;
  external wlanapi name 'WlanRegisterNotification';

type
  TMainDisplayForm = class(TForm)
    Overlaypanel: TPanel;
    OpenupTimer: TTimer;
    runtimer: TTimer;
    closeuptimer: TTimer;
    InfoPanel: TPanel;
    dsSevenSegmentDisplay1: TdsSevenSegmentDisplay;
    dsSevenSegmentDisplay2: TdsSevenSegmentDisplay;
    runsecondtimer: TTimer;
    Debugpanel: TFloatingWindow;
    CenterVideoNames: TListBox;
    Button1: TButton;
    Label6: TLabel;
    Button2: TButton;
    Label7: TLabel;
    LogCopy: TListBox;
    Timer1: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    WDAliveTimer: TTimer;
    Button3: TButton;
    Image1: TImage;
    CheckWorkTimer: TTimer;
    Button4: TButton;
    dsLed5: TdsLed;
    Panel2: TPanel;
    Panel3: TPanel;
    CheckBox1: TCheckBox;
    ReqFiles: TListBox;
    Label8: TLabel;
    ReclickTimer: TTimer;
    Panel4: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    ColorPanel_2: TPanel;
    DigiPoint_1: TPanel;
    DigiPoint_2: TPanel;
    DigiPoint_3: TPanel;
    DigiPoint_4: TPanel;
    DigiPoint_6: TPanel;
    DigiPoint_7: TPanel;
    DigiPoint_8: TPanel;
    DigiPoint_5: TPanel;
    DigiPoint_1_6: TPanel;
    DigiPoint_1_7: TPanel;
    DigiPoint_1_8: TPanel;
    DigiPoint_1_1: TPanel;
    DigiPoint_1_2: TPanel;
    DigiPoint_1_3: TPanel;
    DigiPoint_1_4: TPanel;
    DigiPoint_1_5: TPanel;
    Cpanel: TPanel;
    WPlayer: TWindowsMediaPlayer;
    ScreensaveTimer: TTimer;
    PlayNextTimer: TTimer;
    OfflinePanel: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DsFancyButton3: TDsFancyButton;
    SpeedButton4: TSpeedButton;
    Timer2: TTimer;
    Button5: TButton;
    DebugLed: TdsLed;
    PopupMenu1: TPopupMenu;
    Buttonneuladen1: TMenuItem;
    Buttonspeichern1: TMenuItem;
    N2: TMenuItem;
    DebugmodeonOoff1: TMenuItem;
    Position1: TMenuItem;
    N96inx1: TMenuItem;
    N96inx2: TMenuItem;
    N96iny1: TMenuItem;
    N96iny2: TMenuItem;
    N4: TMenuItem;
    xxxinx1: TMenuItem;
    yyyiny1: TMenuItem;
    Size1: TMenuItem;
    N48inW1: TMenuItem;
    N48inW2: TMenuItem;
    N48inH1: TMenuItem;
    N48inH2: TMenuItem;
    N5: TMenuItem;
    XXXinW1: TMenuItem;
    XXXinH1: TMenuItem;
    Label21: TLabel;
    CheckBox2: TCheckBox;
    EditMenuPopup: TPopupMenu;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    DurchlaufVideozuweisen1: TMenuItem;
    DurchlaufVideoansehen1: TMenuItem;
    N6: TMenuItem;
    ButtonBildzuweisen1: TMenuItem;
    EditModusonOff1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem17: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    BackupderButtonsanlegen1: TMenuItem;
    NeuenButtonerstellen1: TMenuItem;
    N96x961: TMenuItem;
    N192x961: TMenuItem;
    N144x961: TMenuItem;
    N192x1921: TMenuItem;
    N7: TMenuItem;
    Systemschliessen1: TMenuItem;
    VorhButtonladen1: TMenuItem;
    ButtoninSystemeinfgen1: TMenuItem;
    N8: TMenuItem;
    Adresseonoff1: TMenuItem;
    Bildauswhlen1: TMenuItem;
    BildLschen1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    extzeilen1: TMenuItem;
    ButtonBildeinrichten1: TMenuItem;
    Durchlaufbearbeiten1: TMenuItem;
    N10: TMenuItem;
    AdresseBildumschalten1: TMenuItem;
    Zeile11: TMenuItem;
    Zeile21: TMenuItem;
    Zeile31: TMenuItem;
    Zeile41: TMenuItem;
    exteingeben1: TMenuItem;
    exteingeben2: TMenuItem;
    Schriftartfestlegen2: TMenuItem;
    exteingeben3: TMenuItem;
    Schriftartfestlegen3: TMenuItem;
    exteingeben4: TMenuItem;
    Schriftartfestlegen4: TMenuItem;
    Bildauswhlen2: TMenuItem;
    Bildlschen2: TMenuItem;
    EditmodusdesButtonsonoff1: TMenuItem;
    Debugmodusonoff1: TMenuItem;
    N11: TMenuItem;
    Videofensteranzeigen1: TMenuItem;
    FontDialog1: TFontDialog;
    Schriftartfestlegen1: TMenuItem;
    N12: TMenuItem;
    auseinblenden1: TMenuItem;
    N13: TMenuItem;
    auseinblenden2: TMenuItem;
    N14: TMenuItem;
    auseinblenden3: TMenuItem;
    N15: TMenuItem;
    auseinblenden4: TMenuItem;
    Buttonkopieren1: TMenuItem;
    inXRichtung1: TMenuItem;
    inYRichtung1: TMenuItem;
    N16: TMenuItem;
    Buttonunsichtbar1: TMenuItem;
    ButtonListeanzeigen1: TMenuItem;
    ButtonunsichtbarSpeichern1: TMenuItem;
    WImage: TImage;
    dsLed9: TdsLed;
    Button7: TButton;
    Notebook1: TNotebook;
    dsLed1: TdsLed;
    dsLed2: TdsLed;
    dsLed3: TdsLed;
    dsLed4: TdsLed;
    dsLed6: TdsLed;
    dsLed7: TdsLed;
    dsLed8: TdsLed;
    Label14: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    dsLed10: TdsLed;
    NotebookReturnTimer: TTimer;
    ManualCheckTimer: TTimer;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    PCloseButton: TImage;
    SpeedButton5: TSpeedButton;
    N1: TMenuItem;
    ExpertenEinstellung1: TMenuItem;
    Label25: TLabel;
    SpeedButton6: TSpeedButton;
    IdUDPClient1: TIdUDPClient;
    IdUDPServer1: TIdUDPServer;
    MainBackgroundImage: TImage;
    FensterListeinsDebug1: TMenuItem;
    procedure OpenupTimerTimer(Sender: TObject);
    procedure closeuptimerTimer(Sender: TObject);
    procedure runsecondtimerTimer(Sender: TObject);
    procedure PCloseButtonClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DefaultHandler(var Message); override;
    procedure WMMYMessage(var Msg: TWMMYMessage);
    procedure WDAliveTimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure OverlaypanelResize(Sender: TObject);
    procedure CheckWorkTimerTimer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DownloadthreadRun(Sender: TIdThreadComponent);
    procedure ReclickTimerTimer(Sender: TObject);
    procedure WPlayerPlayStateChange(ASender: TObject; NewState: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ScreensaveTimerTimer(Sender: TObject);
    procedure PlayNextTimerTimer(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dsLed8DblClick(Sender: TObject);
    procedure DsFancyButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure OverlaypanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IpanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InfoPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StorryAktion(Sender: TObject;Aktion,AktionOption:string);
    procedure Timer2Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N96inx1Click(Sender: TObject);
    procedure N96inx2Click(Sender: TObject);
    procedure N96iny1Click(Sender: TObject);
    procedure N96iny2Click(Sender: TObject);
    procedure xxxinx1Click(Sender: TObject);
    procedure yyyiny1Click(Sender: TObject);
    procedure N48inW1Click(Sender: TObject);
    procedure N48inW2Click(Sender: TObject);
    procedure N48inH1Click(Sender: TObject);
    procedure N48inH2Click(Sender: TObject);
    procedure XXXinW1Click(Sender: TObject);
    procedure XXXinH1Click(Sender: TObject);
    procedure Buttonspeichern1Click(Sender: TObject);
    procedure DebugmodeonOoff1Click(Sender: TObject);
    procedure EditModusonOff1Click(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure KlickAktion1Click(Sender: TObject);
    procedure KlickVideoansehen1Click(Sender: TObject);
    procedure N96x961Click(Sender: TObject);
    procedure N144x961Click(Sender: TObject);
    procedure N192x961Click(Sender: TObject);
    procedure N192x1921Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Adresseonoff1Click(Sender: TObject);
    procedure Bildauswhlen1Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure exteingeben1Click(Sender: TObject);
    procedure exteingeben2Click(Sender: TObject);
    procedure exteingeben3Click(Sender: TObject);
    procedure exteingeben4Click(Sender: TObject);
    procedure Bildlschen2Click(Sender: TObject);
    procedure Videofensteranzeigen1Click(Sender: TObject);
    procedure Schriftartfestlegen1Click(Sender: TObject);
    procedure Schriftartfestlegen2Click(Sender: TObject);
    procedure Schriftartfestlegen3Click(Sender: TObject);
    procedure Schriftartfestlegen4Click(Sender: TObject);
    procedure auseinblenden1Click(Sender: TObject);
    procedure auseinblenden2Click(Sender: TObject);
    procedure auseinblenden3Click(Sender: TObject);
    procedure auseinblenden4Click(Sender: TObject);
    procedure inXRichtung1Click(Sender: TObject);
    procedure Durchlaufbearbeiten1Click(Sender: TObject);
    procedure Buttonunsichtbar1Click(Sender: TObject);
    procedure ButtonListeanzeigen1Click(Sender: TObject);
    procedure ButtonunsichtbarSpeichern1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure runtimerTimer(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure NotebookReturnTimerTimer(Sender: TObject);
    procedure ManualCheckTimerTimer(Sender: TObject);
    procedure dsLed10Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ExpertenEinstellung1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure FensterListeinsDebug1Click(Sender: TObject);
  private
    { Private-Deklarationen }
    FCountOpensteps:Word;
    FRunningSeconds:Word;
    FBeforeclick:word;
    FNextVideoIndex:word;
    FCenterPLayList:IWMPPlaylist;
    clickTagid:word;
    ClickBtn:TTSS_Button;
    centerpl:TWindowsMediaPlayer;
    centerplPanel:tPanel;
    Fstopall: boolean;
    FUsb : TUsbClass;
    Kundenuid,Filename,loadfile:string;
    procedure UsbIN(ASender : TObject; const ADevType,ADriverName,AFriendlyName : string);
    procedure UsbOUT(ASender : TObject; const ADevType,ADriverName,AFriendlyName : string);
    procedure HandlerProcedure(Sender: TObject; E: Exception);
    function processExists(exeFileName: string): Boolean;
    procedure DoCheckShell;
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    { Public-Deklarationen }
    DisplayPanel,TopDisplayPanel:TTSS_Display;
    closeCommand:String;
    Allowclick:boolean;
    PartnerMediaPlayer:TWindowsMediaPlayer;
    Closebuttons:TList;
    Centeritems:TCenterVideoList;
    Runningstorry:TTSS_StorryPanel;
    Timeclick:boolean;
    SignagePanel:TPanel;
    firstwindowswrite:boolean;
    function GetSCREENSHOT: TBitmap;
    procedure PartnerPlayStateChange(ASender: TObject; NewState: Integer);
    procedure MyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MyGalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GalCloseMouseup(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MPMyMouseUp(Sender: TObject; Button: smallint;
      Shift: Smallint; X, Y: Integer);
    procedure MyDisplayMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure myVideoEnd(sender:Tobject);
    procedure StartCEnterVideo;
    procedure resetKeeper;
    procedure mixplaylist;
    procedure stopall;
    procedure ShowcloseBtn;
    function NButton(Sender: TObject):TTSS_Button;
    function loadvlcLibs:boolean;
  end;

  plibvlc_instance_t        = type Pointer;
  plibvlc_media_player_t    = type Pointer;
  plibvlc_media_t           = type Pointer;

var
  MainDisplayForm: TMainDisplayForm;
  WM_LOGENTRY,WM_IMAGEFILEPLAYED,WM_VIDEOFILEPLAYED,WM_OURMESSAGE,WM_OURMESSAGETEXT: DWORD;

implementation

{$R *.dfm}

uses TSS_FE_DataForm, TSS_BE_FTPForm_unit,Exif, TSS_FE_FTPLoadFormunit,
  TSS_FE_Specialform_unit, TSS_FE_XtraBtnForm_unit, TSS_CodeForm,
  TSS_CenterSetupForm, TSS_FE_BtnVisibleListForm, TSS_FE_InternetForm_unit,
  TSS_FE_KioskInternetForm_unit, TSS_FE_LoadScreen, TSS_FE_XpertButtonSetupForm;

const
  cTileSize = 250;

var
  libvlc_media_new_path              : function(p_instance : Plibvlc_instance_t; path : PAnsiChar) : Plibvlc_media_t; cdecl;
  libvlc_media_new_location          : function(p_instance : plibvlc_instance_t; psz_mrl : PAnsiChar) : Plibvlc_media_t; cdecl;
  libvlc_media_player_new_from_media : function(p_media : Plibvlc_media_t) : Plibvlc_media_player_t; cdecl;
  libvlc_media_player_set_hwnd       : procedure(p_media_player : Plibvlc_media_player_t; drawable : Pointer); cdecl;
  libvlc_media_player_play           : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_media_player_stop           : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_media_player_release        : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_media_player_is_playing     : function(p_media_player : Plibvlc_media_player_t) : Integer; cdecl;
  libvlc_media_release               : procedure(p_media : Plibvlc_media_t); cdecl;
  libvlc_new                         : function(argc : Integer; argv : PAnsiChar) : Plibvlc_instance_t; cdecl;
  libvlc_release                     : procedure(p_instance : Plibvlc_instance_t); cdecl;

  vlcLib: integer;
  vlcInstance: plibvlc_instance_t;
  vlcMedia: plibvlc_media_t;
  vlcMediaPlayer: plibvlc_media_player_t;


// -----------------------------------------------------------------------------
// Read registry to get VLC installation path
// -----------------------------------------------------------------------------
function GetVLCLibPath: String;
var
  Handle: HKEY;
  RegType: Integer;
  DataSize: Cardinal;
  Key: PWideChar;
begin
  Result := '';
  Key := 'Software\VideoLAN\VLC';
  if not (RegOpenKeyEx(HKEY_LOCAL_MACHINE, Key, 0, KEY_READ, Handle) = ERROR_SUCCESS) then begin
    Result := Dataform.vlcPath;
  end else begin
    if RegQueryValueEx(Handle, 'InstallDir', nil, @RegType, nil, @DataSize) = ERROR_SUCCESS then
    begin
      SetLength(Result, DataSize);
      RegQueryValueEx(Handle, 'InstallDir', nil, @RegType, PByte(@Result[1]), @DataSize);
      Result[DataSize] := '\';
    end
    else Showmessage('Error on reading registry');
    RegCloseKey(Handle);
    Result := String(PChar(Result));
  end;
end;

function LoadVLCLibrary(APath: string): integer;
var savecw:word;
begin
  savecw:=Get8087CW;
  Set8087CW(savecw or $7);
  Result := LoadLibrary(PWideChar(APath + 'libvlccore.dll'));
  Result := LoadLibrary(PWideChar(APath + 'libvlc.dll'));
  Set8087CW(savecw);
end;

// -----------------------------------------------------------------------------
function GetAProcAddress(handle: integer; var addr: Pointer; procName: string; failedList: TStringList): integer;
begin
  addr := GetProcAddress(handle, PWideChar(procName));
  if Assigned(addr) then Result := 0
  else begin
    if Assigned(failedList) then failedList.Add(procName);
    Result := -1;
  end;
end;
// -----------------------------------------------------------------------------
// Get address of libvlc functions
// -----------------------------------------------------------------------------
function LoadVLCFunctions(vlcHandle: integer; failedList: TStringList): Boolean;
begin
  GetAProcAddress(vlcHandle, @libvlc_new, 'libvlc_new', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_new_location, 'libvlc_media_new_location', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_player_new_from_media, 'libvlc_media_player_new_from_media', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_release, 'libvlc_media_release', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_player_set_hwnd, 'libvlc_media_player_set_hwnd', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_player_play, 'libvlc_media_player_play', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_player_stop, 'libvlc_media_player_stop', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_player_release, 'libvlc_media_player_release', failedList);
  GetAProcAddress(vlcHandle, @libvlc_release, 'libvlc_release', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_player_is_playing, 'libvlc_media_player_is_playing', failedList);
  GetAProcAddress(vlcHandle, @libvlc_media_new_path, 'libvlc_media_new_path', failedList);
  // if all functions loaded, result is an empty list, otherwise result is a list of functions failed
  Result := failedList.Count = 0;
end;


function TMainDisplayForm.GetSCREENSHOT: TBitmap;
var
  Locked: Boolean;
  X, Y, XS, YS: Integer;
  Canvas: TCanvas;
  R: TRect;
  R2: TRect;
begin
  Result := TBitmap.Create;
  Result.Width := DataForm.Mainform_W;
  Result.Height := DataForm.Mainform_H;
  Canvas := TCanvas.Create;
  Canvas.Handle := GetDC(0);
  Locked := Canvas.TryLock;
  try
    XS := Pred(DataForm.Mainform_W div cTileSize);
    if DataForm.Mainform_W mod cTileSize > 0 then
      Inc(XS);
    YS := Pred(DataForm.Mainform_H div cTileSize);
    if DataForm.Mainform_H mod cTileSize > 0 then
      Inc(YS);
    for X := 0 to XS do
      for Y := 0 to YS do
      begin
        R := Rect(
          MainDisplayForm.left+(X * cTileSize),MainDisplayForm.top+(Y * cTileSize), MainDisplayForm.left+(Succ(X) * cTileSize),MainDisplayForm.top+(Succ(Y) * cTileSize));
        R2 := Rect(
          (X * cTileSize),(Y * cTileSize), (Succ(X) * cTileSize),(Succ(Y) * cTileSize));
        Result.Canvas.CopyRect(R2, Canvas, R);
      end;
  finally
    if Locked then
      Canvas.Unlock;
    ReleaseDC(0, Canvas.Handle);
    Canvas.Free;
  end;
end;


procedure TMainDisplayForm.HandlerProcedure(Sender: TObject; E: Exception);
begin
  if not DataForm.stopExpetion then begin
    ShowMessage(E.Message);
  end;
  label14.Caption:=inttostr(strtoint(label14.Caption)+1);
  exit;
end;

procedure TMainDisplayForm.IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
  s: string;a:word;
  foundbtn:TTSS_Button;
begin
  s := BytesToString(AData);
  foundbtn:=nil;
  for a := 0 to DataForm.ButtonList.Count do begin
    if TTSS_Button(DataForm.ButtonList.Items[a]).Buttonid=s then begin
      foundbtn:=TTSS_Button(DataForm.ButtonList.Items[a]);
      break;
    end;
  end;
  if foundbtn<>nil then begin
    foundbtn.OnMouseup(foundbtn.EBGImage,mbleft,[],0,0);
  end else ShowMessage(s);
end;

procedure TMainDisplayForm.InfoPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MessageBeep(0)
end;

procedure TMainDisplayForm.inXRichtung1Click(Sender: TObject);
var neush:TTSS_Button;
begin
  neush:=NButton(sender);
  neush.left:=neush.left+strtoint(inputbox('Versatz in X ? ','Versatz','0'));
end;
procedure TMainDisplayForm.IpanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MessageBeep(0);
end;

procedure TMainDisplayForm.KlickAktion1Click(Sender: TObject);
begin
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.KlickVideoansehen1Click(Sender: TObject);
begin
  Dataform.SomeEdited:=True;
end;

procedure OnWlanNotify(data : PWLanNotificationData; context : PVOID); stdcall;
begin
  showMessage(IntToStr(data^.NotificationCode));
end;

procedure TMainDisplayForm.Adresseonoff1Click(Sender: TObject);
begin
  DataForm.PopupButton.SwitchAdress;
end;

procedure TMainDisplayForm.auseinblenden1Click(Sender: TObject);
begin
  dataform.PopupButton.TextZeile1_Text_V:=not dataform.PopupButton.TextZeile1_Text_V;
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.auseinblenden2Click(Sender: TObject);
begin
  dataform.PopupButton.TextZeile2_Text_V:=not dataform.PopupButton.TextZeile2_Text_V;
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.auseinblenden3Click(Sender: TObject);
begin
  dataform.PopupButton.TextZeile3_Text_V:=not dataform.PopupButton.TextZeile3_Text_V;
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.auseinblenden4Click(Sender: TObject);
begin
  dataform.PopupButton.TextZeile4_Text_V:=not dataform.PopupButton.TextZeile4_Text_V;
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.Bildauswhlen1Click(Sender: TObject);
var fn:string;
begin
  if OpenPictureDialog1.Execute then begin
    if not DirectoryExists(dataform.MainPath+'Schematemp\'+DataForm.PopupButton.Buttonid) then begin
      CreateDir(dataform.MainPath+'Schematemp\'+DataForm.PopupButton.Buttonid);
    end;
    if DirectoryExists(dataform.MainPath+'Schematemp\'+DataForm.PopupButton.Buttonid) then begin
      fn:=dataform.MainPath+'Schematemp\'+DataForm.PopupButton.Buttonid+'\'+ExtractFileName(OpenPictureDialog1.FileName);
      CopyFile(pchar(OpenPictureDialog1.FileName),pchar(fn),False);
      DataForm.PopupButton.ButtonimgFilename:=fn;
      DataForm.PopupButton.LoadButtonImage(DataForm.PopupButton.ButtonimgFilename);
      DataForm.PopupButton.button_media_id:=1;
      dataform.SomeEdited:=true;
//      DataForm.PopupButton.SwitchAdress;
    end
  end;
end;

procedure TMainDisplayForm.Bildlschen2Click(Sender: TObject);
begin
  DataForm.PopupButton.ButtonimgFilename:='';
  DataForm.PopupButton.EBGImage.hide;
  DataForm.PopupButton.EBGShape.show;
end;

procedure TMainDisplayForm.Button1Click(Sender: TObject);
begin
  Debugpanel.hide;
  resetKeeper;
end;

procedure TMainDisplayForm.Button2Click(Sender: TObject);
begin
  Self.closeCommand:='CLOSE';
  Dataform.finished:=true;
  Application.Terminate;
end;

procedure TMainDisplayForm.Button3Click(Sender: TObject);
begin
  closeCommand:='REFRESH';
  close;
end;


procedure TMainDisplayForm.Button4Click(Sender: TObject);
begin
  CheckWorkTimer.Enabled:=not CheckWorkTimer.Enabled;
end;

procedure TMainDisplayForm.Button5Click(Sender: TObject);
begin
  DataForm.SwitchDebugmode;
end;


 function DeleteRegistryValue(RK:HKEY;Keyname,ValueName: string): string;
 var
   Registry: TRegistry;
 begin
   Registry := TRegistry.Create(KEY_WRITE);
   try
     Registry.RootKey := RK;

     // False weil kein Eintrag erzeugt werden soll, sofern er nicht vorhanden ist.
     Registry.OpenKey(KeyName, False);
     Registry.DeleteValue(ValueName);
   finally
     Registry.Free;
   end;
 end;

 function GetRegistryValue(RK:HKEY;Keyname,ValueName: string): string;
 var
   Registry: TRegistry;
 begin
   Registry := TRegistry.Create(KEY_READ);
   try
     Registry.RootKey := RK;

     // False weil kein Eintrag erzeugt werden soll, sofern er nicht vorhanden ist.
     Registry.OpenKey(KeyName, False);

     Result := Registry.ReadString(ValueName);
   finally
     Registry.Free;
   end;
 end;

function SetRegistryValue(RK:HKEY;Keyname,ValueName,Value: string): string;
 var
   Registry: TRegistry;
 begin
   Registry := TRegistry.Create(KEY_WRITE);
   try
     Registry.RootKey := RK;

     // False weil kein Eintrag erzeugt werden soll, sofern er nicht vorhanden ist.
     Registry.OpenKey(KeyName, False);

     Registry.WriteString(ValueName,Value);
   finally
     Registry.Free;
   end;
 end;

procedure TMainDisplayForm.ButtonListeanzeigen1Click(Sender: TObject);
begin
  BtnVisibleList.showmodal;
end;

procedure TMainDisplayForm.Buttonspeichern1Click(Sender: TObject);
begin
  DataForm.PopupButton.SaveButtonSelf;
  dataform.SomeEdited:=false;
end;

procedure TMainDisplayForm.Buttonunsichtbar1Click(Sender: TObject);
begin
  dataform.PopupButton.Buttonvisible:=false;
  dataform.PopupButton.visible:=false;
  self.Repaint;
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.ButtonunsichtbarSpeichern1Click(Sender: TObject);
begin
  dataform.PopupButton.Buttonvisible:=false;
  dataform.PopupButton.visible:=false;
  self.Repaint;
  dataform.PopupButton.SaveButtonSelf;
end;


function TMainDisplayForm.processExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TMainDisplayForm.DoCheckShell;
begin
  if Dataform.Shellmode then begin
    dsled9.OnColor:=clyellow;
    dsled9.LedOn:=true;
    if GetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell')='C:\TSS\Frontend\TSS_FE.exe' then begin
      dsled9.Hint:='Shellmode in Config : ON .. und in Registry gefunden ... OK';
      dsled9.ShowHint:=true;
      dsled9.OnColor:=cllime;
      dsled9.LedOn:=true;
    end else begin
      SetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell','C:\TSS\Frontend\TSS_FE.exe');
      dsled9.OnColor:=clblue;
      dsled9.Hint:='Shellmode in Config : ON .. aber nicht in Registry gefunden ... gesetzt';
      dsled9.ShowHint:=true;
      dsled9.LedOn:=true;
    end;
    if processExists('explorer.exe') then dsled10.Oncolor:=clblue else dsled10.Oncolor:=cllime;
  end else begin
    dsled10.LedOn:=false;
    if GetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell')='C:\TSS\Frontend\TSS_FE.exe' then begin
      dsled9.OnColor:=clgreen;
      dsled9.Hint:='Shellmode in Config : OFF .. aber Registry gefunden ... zurückgesetzt';
      dsled9.ShowHint:=true;
      SetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell','Explorer.exe');
      dsled9.LedOn:=true;
    end else begin
      dsled9.OnColor:=clyellow;
      dsled9.Hint:='Shellmode in Config : OFF .. und nicht in Registry gefunden ... OK';
      dsled9.ShowHint:=true;
      dsled9.LedOn:=False;
    end;
  end;
end;

procedure ShowAppEmbedded(WindowHandle: THandle; Container: TWinControl);
var
  WindowStyle : Integer;
  FAppThreadID: Cardinal;
begin
  /// Set running app window styles.
  WindowStyle := GetWindowLong(WindowHandle, GWL_STYLE);
  WindowStyle := WindowStyle + WS_MINIMIZE - WS_MAXIMIZE;
  SetWindowLong(WindowHandle,GWL_STYLE,WindowStyle);
  sleep(1000);
  WindowStyle := WindowStyle - WS_MINIMIZE + WS_MAXIMIZE;
  SetWindowLong(WindowHandle,GWL_STYLE,WindowStyle);

  /// Attach container app input thread to the running app input thread, so that
  ///  the running app receives user input.
  FAppThreadID := GetWindowThreadProcessId(WindowHandle, nil);
  AttachThreadInput(GetCurrentThreadId, FAppThreadID, True);

  /// Changing parent of the running app to our provided container control
  Winapi.Windows.SetParent(WindowHandle,Container.Handle);
  SendMessage(Container.Handle, WM_UPDATEUISTATE, UIS_INITIALIZE, 0);
  UpdateWindow(WindowHandle);

  /// This prevents the parent control to redraw on the area of its child windows (the running app)
  SetWindowLong(Container.Handle, GWL_STYLE, GetWindowLong(Container.Handle,GWL_STYLE) or WS_CLIPCHILDREN);
  /// Make the running app to fill all the client area of the container
  SetWindowPos(WindowHandle,0,0,0,Container.ClientWidth,Container.ClientHeight,SWP_NOZORDER);

  SetForegroundWindow(WindowHandle);
end;


function EnumWindowsProc(wHandle: HWND; var lb: String): Bool; stdcall; export;
var
  Title, ClassName: array[0..255] of char;
begin
  Result := True;
  GetWindowText(wHandle, Title, 255);
  GetClassName(wHandle, ClassName, 255);
  if IsWindowVisible(wHandle) then begin
//    lb := lb + ' / ' + string(ClassName);
    DataForm.writeDBLog('SIGNAGE','Window : ',string(Title),5);
  end;
end;

procedure TMainDisplayForm.CheckWorkTimerTimer(Sender: TObject);
var
  Locked: Boolean;
  X, Y, XS, YS: Integer;
  Canvas: TCanvas;
  R2,R: TRect;
  clr:Tcolor;
  Result:Tbitmap;
  ci:TWifiConnectionInfo;
  hNotepadWindow: HWND;
  WindowsNames:string;
  Param: TMyEnumParam;

begin
  CheckWorkTimer.Enabled:=false;
  dsLed5.LedOn:=true;
  dsled5.Repaint;
  Result := TBitmap.Create;
  Result.Width := 1920;
  Result.Height := 25;
  Canvas := TCanvas.Create;
  Canvas.Handle := GetDC(0);
  Locked := Canvas.TryLock;
  try
    begin
      R := Rect(0,1080,1920,1080-25);
      R2 := Rect(0,25,1920,0);
      Result.Canvas.CopyRect(R2, Canvas, R);
    end;
  finally
    if Locked then
      Canvas.Unlock;
    ReleaseDC(0, Canvas.Handle);
    Canvas.Free;
  end;
  clr:=Result.Canvas.Pixels[209,17];
  result.free;
  Panel2.Color:=clr;
  panel2.Repaint;
  if checkbox1.Checked then LogCopy.Items.Add(' Erkannte Farbe an 209,17 '+ColorToString(clr));
  if checkbox2.Checked then SendMessage(LogCopy.Handle,WM_VSCROLL,SB_BOTTOM,0);
  if (clr<>clOlive) then begin
     if not DataForm.Debugmode then
       if not DataForm.EditMode then
         if not DataForm.Codemode then
           Application.BringToFront;
     if not DataForm.Debugmode then if not DataForm.EditMode then if not DataForm.Codemode then MainDisplayForm.BringToFront;
  end;
  //DoCheckShell;
  dsLed5.LedOn:=false;
  dsled5.Repaint;
  if DataForm.pingstate<>0 then begin
    DataForm.pingstate:=0;
//    DataForm.Ping1.DnsLookup(Dataform.dnsHost);
  end;
  if Dataform.specialContentTimer and not Dataform.specialContentdone then begin
    if IstoDay(Dataform.specialContentTimerDay) then begin
      if CompareTime(now,Dataform.specialContentTimerTime)=1 then begin
        Dataform.specialContentdone:=true;
        SpeedButton4.Click;
      end;
    end;
  end;
  if SignagePanel<>nil then begin
    if DataForm.HasSignage then begin
      DataForm.writeDBLog('SIGNAGE','Signage Request found !',''+BoolToStr(DataForm.SignageTaken),5);
      if not DataForm.SignageTaken then begin
        hNotepadWindow := FindWindow(nil,PWideChar(dataForm.SignageWindowName));
        DataForm.writeDBLog('SIGNAGE','Signage not taken : HWindow : '+dataForm.SignageWindowName +' / '+inttostr(hNotepadWindow),inttostr(hNotepadWindow),5);
        if hNotepadWindow >0 then begin
          SignagePanel.Show;
          DataForm.writeDBLog('SIGNAGE','Signage shown : HWindow : '+inttostr(hNotepadWindow)+' Top:'+IntToStr(DataForm.Signage_y)+' Left:'+IntToStr(DataForm.Signage_x)+' Width:'+IntToStr(DataForm.Signage_w)+' Height:'+IntToStr(DataForm.Signage_h),inttostr(hNotepadWindow)+'/'+IntToStr(DataForm.Signage_y)+'/'+IntToStr(DataForm.Signage_x)+'/'+IntToStr(DataForm.Signage_w)+'/'+IntToStr(DataForm.Signage_h),5);
          if DataForm.Debugmode then begin
             SignagePanel.Hint:='Signagepanel Top   :='+IntToStr(DataForm.Signage_y)+#13#10+
                                'Signagepanel Left  :='+IntToStr(DataForm.Signage_x)+#13#10+
                                'Signagepanel Width :='+IntToStr(DataForm.Signage_w)+#13#10+
                                'Signagepanel Height:='+IntToStr(DataForm.Signage_h)+#13#10#13+
                                '-----------------------'+#13#10+
                                'Xibo Signage Integration';
             SignagePanel.ShowHint:=true;
          end else begin
             SignagePanel.ShowHint:=False;
          end;
          SignagePanel.Caption:='Signage ok !';
          SignagePanel.font.color:=clwhite;
          SignagePanel.Parent:=Self;
          ShowAppEmbedded(hNotepadWindow,SignagePanel);
          Dataform.XiboHandle:=hNotepadWindow;
          DataForm.SignageTaken:=true;
        end else begin
          if firstwindowswrite then begin
            EnumWindows(@EnumWindowsProc,0);
            firstwindowswrite:=false;
          end;
          DataForm.writeDBLog('SIGNAGE','Signage not taken : HWindow not found : '+dataForm.SignageWindowName,WindowsNames,5);
          DataForm.SignageTaken:=False;
          if DataForm.Debugmode then begin
            SignagePanel.Caption:='Kein Signagesystem gefunden !';
            SignagePanel.font.color:=clwhite;
          end else begin
            signagepanel.hide;
          end;
        end;
      end else begin
        hNotepadWindow := FindWindow(nil,PWideChar(dataForm.SignageWindowName));
        if hNotepadWindow >0 then begin
          DataForm.writeDBLog('SIGNAGE','Signage lost ! : HWindow : '+inttostr(hNotepadWindow),inttostr(hNotepadWindow),5);
          DataForm.SignageTaken:=false;
        end;
      end;
    end;
  end else begin
    if DataForm.HasSignage then begin
      DataForm.writeDBLog('SIGNAGE','Signage Request found ! Window lost - Recreate and wait next check ','',5);
      MainDisplayForm.SignagePanel:=TPanel.Create(MainDisplayForm);
      MainDisplayForm.SignagePanel.Left:=DataForm.Signage_X;
      MainDisplayForm.SignagePanel.Top:=DataForm.Signage_Y;
      MainDisplayForm.SignagePanel.Width:=DataForm.Signage_W;
      MainDisplayForm.SignagePanel.Height:=DataForm.Signage_H;
      MainDisplayForm.Parent:=MainDisplayForm;
    end;
  end;
  CheckWorkTimer.Enabled:=true;
end;

procedure TMainDisplayForm.closeuptimerTimer(Sender: TObject);
begin
  CloseupTimer.Enabled:=false;
  if Dataform.CenterOpenSpeed>0 then begin
    if centerpl<>nil then Freeandnil(centerpl);
    if centerplPanel<>nil then Freeandnil(centerplPanel);
    Overlaypanel.Top:=0;
    Overlaypanel.BringToFront;
    Overlaypanel.left:=0;
    Overlaypanel.Width:=FCountOpensteps*48;
    Overlaypanel.height:=FCountOpensteps*27;
    Overlaypanel.Repaint;
    dec(FCountOpensteps);
  end else begin
    Overlaypanel.Top:=0;
    Overlaypanel.BringToFront;
    Overlaypanel.left:=0;
    Overlaypanel.Width:=0;
    Overlaypanel.height:=0;
    Overlaypanel.Repaint;
  end;
  if FCountOpensteps>0 then CloseupTimer.Enabled:=true else begin
    DataForm.writeDBLog('CLOSE_BTN','Mitte geschlossen','',4);
    Overlaypanel.hide;
    dsLed1.LedOn:=False;
    dsLed1.Repaint;
    dsLed2.LedOn:=true;
    dsLed2.Repaint;
    WPlayer.controls.stop;
    WPlayer.Hide;
    DisplayPanel.continueVideo;
    Timer1.Enabled:=true;
    allowclick:=true;
    dsLed7.ledon:=true;
    dsled7.Repaint;
  end;

end;

procedure TMainDisplayForm.DebugmodeonOoff1Click(Sender: TObject);
begin
  DataForm.SwitchDebugmode;
end;

procedure TMainDisplayForm.DefaultHandler(var Message);
var  ee: TWMMYMessage;NextFile:String;a:word;
  MyRecord: PMyFileRecord;
  cds: TCopyDataStruct;
  hWnd: THandle;
begin
  with TMessage(Message) do begin
    if (Msg = WM_OURMESSAGE) then begin
      ee.Msg    := Msg;
      ee.Handle := wParam;
      ee.Info   := lParam;
      // Checking if this message is not from us
      if ee.info = $990 then begin
        dsLed3.LedOn:=true;
        dsled3.Repaint;
        dsLed4.LedOn:=false;
        dsled4.Repaint;
        WMMYMessage(ee);
      end;
    end
    else
     inherited DefaultHandler(Message);
  end;
end;

procedure TMainDisplayForm.DownloadthreadRun(Sender: TIdThreadComponent);
var FtpC:TIdFTP;
begin

  FtpC:=TidFtp.Create(nil);
  ftpc.Host:='logumedia-content.de';
  FtpC.Port:=21;
  ftpC.Username:='LMClient';
  FtpC.Password:='LM0202';
end;

procedure TMainDisplayForm.PCloseButtonClick(Sender: TObject);
var a:word;
begin
//  MainDisplayForm.DsFancyButton1.Visible:=False;
//  MainDisplayForm.DsFancyButton2.Visible:=False;
  if Closebuttons.count>0 then for a := 0 to Closebuttons.count-1 do begin
    Timage(Closebuttons[Closebuttons.count-1]).Free;
    Closebuttons.delete(Closebuttons.count-1);
  end;
  stopall;
end;

procedure TMainDisplayForm.DsFancyButton3Click(Sender: TObject);
begin
  // Reload
  if TSS_BE_FTPForm.fileExists(Kundenuid,Filename,True) then begin
    TSS_BE_FTPForm.Loadfile(Kundenuid,filename,Dataform.MainPath+Kundenuid+'\',Filename,'','','',1,1,True);
    Loadfile:=Dataform.MainPath+Kundenuid+'\'+FileName;
  end else begin
    if TSS_BE_FTPForm.fileExists(DataForm.Global_Schematic_id,Filename,True) then begin
      TSS_BE_FTPForm.Loadfile(DataForm.Global_Schematic_id,filename,Dataform.MainPath+DataForm.Global_Schematic_id+'\',Filename,'','','',1,1,True);
      Loadfile:=Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName;
    end;
  end;
end;

procedure TMainDisplayForm.dsLed10Click(Sender: TObject);
begin
  dsled10.OnColor:=clyellow;
  dsled10.LedOn:=true;
  ManualCheckTimer.enabled:=true;
end;

procedure TMainDisplayForm.dsLed8DblClick(Sender: TObject);
begin
//  DataForm.OnlineRun:=not DataForm.OnlineRun;
end;

procedure TMainDisplayForm.Durchlaufbearbeiten1Click(Sender: TObject);
begin
  DataForm.EditMode:=true;
  CenterSetupForm.showmodal;
  DataForm.EditMode:=false;
end;

procedure TMainDisplayForm.EditModusonOff1Click(Sender: TObject);
begin
  DataForm.PopupButton.CanEditButton:= not DataForm.PopupButton.CanEditButton;
  DataForm.SomeEdited:=true;
end;

procedure TMainDisplayForm.ExpertenEinstellung1Click(Sender: TObject);
begin
  XpertButtonSetupform.LabeledEdit8.Text:=inttostr(DataForm.PopupButton.width);
  XpertButtonSetupform.LabeledEdit9.Text:=inttostr(DataForm.PopupButton.height);
  XpertButtonSetupform.LabeledEdit6.Text:=inttostr(DataForm.PopupButton.left);
  XpertButtonSetupform.LabeledEdit7.Text:=inttostr(DataForm.PopupButton.top);
  XpertButtonSetupform.LabeledEdit10.Text:=DataForm.PopupButton.ButtonimgFilename;
  XpertButtonSetupform.LabeledEdit11.Text:=DataForm.PopupButton.KundenName;
  XpertButtonSetupform.LabeledEdit12.Text:=DataForm.PopupButton.KundenName2;
  XpertButtonSetupform.LabeledEdit13.Text:=DataForm.PopupButton.KundenStrasse;
  XpertButtonSetupform.LabeledEdit14.Text:=DataForm.PopupButton.KundenPLZOrt;
  XpertButtonSetupform.EsSwitch1.Checked:=DataForm.PopupButton.visible;
  XpertButtonSetupform.EsSwitch2.Checked:=DataForm.PopupButton.enabled;
  XpertButtonSetupform.EsSwitch3.Checked:=DataForm.PopupButton.TextZeile1_Text_V;
  XpertButtonSetupform.EsSwitch4.Checked:=DataForm.PopupButton.TextZeile2_Text_V;
  XpertButtonSetupform.EsSwitch5.Checked:=DataForm.PopupButton.TextZeile3_Text_V;
  XpertButtonSetupform.EsSwitch6.Checked:=DataForm.PopupButton.TextZeile4_Text_V;
  XpertButtonSetupform.showmodal;
end;

procedure TMainDisplayForm.exteingeben1Click(Sender: TObject);
begin
  dataform.PopupButton.KundenName:=inputbox('Textzeile 1 eingeben','Zeile 1','');
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.exteingeben2Click(Sender: TObject);
begin
  dataform.PopupButton.KundenName2:=inputbox('Textzeile 2 eingeben','Zeile 2','');
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.exteingeben3Click(Sender: TObject);
begin
  dataform.PopupButton.KundenStrasse:=inputbox('Textzeile 3 eingeben','Zeile 3','');
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.exteingeben4Click(Sender: TObject);
begin
  dataform.PopupButton.KundenPLZOrt:=inputbox('Textzeile 4 eingeben','Zeile 4','');
  dataform.SomeEdited:=true;
end;

procedure TMainDisplayForm.FensterListeinsDebug1Click(Sender: TObject);
begin
  firstwindowswrite:=true;
  EnumWindows(@EnumWindowsProc,0);
end;

procedure TMainDisplayForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // unload vlc library
  FreeLibrary(vlclib);
  FreeAndNil(FUsb);
end;

procedure TMainDisplayForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=Dataform.finished or (closeCommand='REFRESH') or dataform.Debugmode;
end;

procedure TMainDisplayForm.FormCreate(Sender: TObject);
begin
//  DataForm.Wifi:=TWifiObj(TWifiObj.create());
  FUsb := TUsbClass.Create;
  FUsb.OnUsbInsertion := UsbIN;
  FUsb.OnUsbRemoval := UsbOUT;
  Application.OnException:=HandlerProcedure;
  Closebuttons:=TList.Create;
  Centeritems:=TCenterVideoList.Create;
  RegisterHotKey(Handle, 1, MOD_CONTROL or MOD_ALT, ord('S'));
  RegisterHotKey(Handle, 2, MOD_CONTROL or MOD_ALT, ord('I'));
  RegisterHotKey(Handle, 3, MOD_CONTROL or MOD_ALT, ord('O'));
end;

procedure TMainDisplayForm.FormDestroy(Sender: TObject);
begin
  UnRegisterHotKey(Handle, 1);
  Closebuttons.free;
end;

procedure TMainDisplayForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbRight then begin
    if dataform.Debugmode then begin
      DataForm.PopupButton:=nil;
      PopupMenu2.Popup(MainDisplayForm.left+x,MainDisplayForm.top+y);
      dataform.Popup_X:=MainDisplayForm.left+x;
      dataform.Popup_Y:=MainDisplayForm.top+y;
    end else begin
    end;
  end;
end;

procedure TMainDisplayForm.FormShow(Sender: TObject);
var hNotepadWindow,_hWnd:HWND;
begin
  if DataForm.stopExpetion then label15.font.Color:=cllime else label15.font.Color:=clred;
  label15.Repaint;
  _hwnd:=DataForm.FindWindowByTitle('Logumedia System OS');
  SendMessage(_hwnd, WM_OURMESSAGE, Handle, $995);
end;

procedure TMainDisplayForm.GalCloseMouseup(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DataForm.writeDBLog('BTN_PRESS_CAL_CLOSE','TastenDruck erfolgt - ClosePicture)','',5);
  TDsFancyButton(Sender).Parent.Free;
end;

procedure TMainDisplayForm.Label15Click(Sender: TObject);
begin
  DataForm.stopExpetion:=not DataForm.stopExpetion;
  if DataForm.stopExpetion then label15.font.Color:=cllime else label15.font.Color:=clred;
  label15.Repaint;
end;

procedure TMainDisplayForm.Label1Click(Sender: TObject);
begin
  if FBeforeclick=0 then begin
    Label1.Font.Color:=clred;
    Label1.Repaint;
    FBeforeclick:=1;
  end else begin
    ResetKeeper;
  end;
end;

procedure TMainDisplayForm.Label2Click(Sender: TObject);
begin
  if FBeforeclick=1 then begin
    Label2.Font.Color:=clred;
    Label2.Repaint;
    FBeforeclick:=2;
  end else begin
    if (Timeclick=true) then begin
      sendtoback;
    end;
    ResetKeeper;
  end;
end;

procedure TMainDisplayForm.Label3Click(Sender: TObject);
begin
  if FBeforeclick=4 then begin
    Label3.Font.Color:=clred;
    Label3.Repaint;
    FBeforeclick:=5;
    Debugpanel.BringToFront;
    Debugpanel.left:=288;
    Debugpanel.top:=192;
    Debugpanel.Width:=1344;
    Debugpanel.height:=696;
    Debugpanel.show;
    notebook1.pageindex:=3;
    NotebookReturnTimer.enabled:=true;
  end else begin
    ResetKeeper;
  end;
end;

procedure TMainDisplayForm.Label4Click(Sender: TObject);
begin
  if FBeforeclick=3 then begin
    Label4.Font.Color:=clred;
    Label4.Repaint;
    FBeforeclick:=4;
  end else begin
    ResetKeeper;
  end;
end;

procedure TMainDisplayForm.Label5Click(Sender: TObject);
var _hWnd:HWND;
begin
  if FBeforeclick=2 then begin
    Label5.Font.Color:=clred;
    Label5.Repaint;
    FBeforeclick:=3;
  end else begin
    ResetKeeper;
    Timeclick:=true;
    _hwnd:=DataForm.FindWindowByTitle('Logumedia System OS');
    SendMessage(_hwnd, WM_OURMESSAGE, Handle, $800);
  end;
end;

procedure TMainDisplayForm.Label8Click(Sender: TObject);
begin
  DisplayPanel.PlayVideo(2);
end;

function TMainDisplayForm.loadvlcLibs: boolean;
var sL: TStringList;
Begin
  // load vlc library
  loadvlcLibs:=True;
  vlclib := LoadVLCLibrary(GetVLCLibPath());
  if vlclib = 0 then begin
    Showmessage('Load vlc library failed ');
    loadvlcLibs:=false;
    Exit;
  end;
  // sL will contains list of functions fail to load
  sL := TStringList.Create;
  if not LoadVLCFunctions(vlclib, sL) then begin
    Showmessage('Some functions failed to load : ' + #13#10 + sL.Text);
    FreeLibrary(vlclib);
    sL.Free;
    loadvlcLibs:=false;
    Exit;
  end;
  sL.Free;
end;

procedure TMainDisplayForm.ManualCheckTimerTimer(Sender: TObject);
begin
  ManualCheckTimer.enabled:=false;
  DoCheckShell;
end;

procedure TMainDisplayForm.MenuItem31Click(Sender: TObject);
begin
  dataform.saveButtonFile;
end;

procedure TMainDisplayForm.mixplaylist;
var
  I,a: Integer;s:String;
  cv1,cv2:TCenterVideoItem;
begin
  DataForm.writeDBLog('MIX_VIDEOS','Videos Mischen : '+inttostr(MainDisplayForm.CenterItems.Count),inttostr(MainDisplayForm.CenterItems.Count),8);
  for I := 0 to MainDisplayForm.CenterItems.Count-1 do begin
    a:=random(MainDisplayForm.CenterItems.Count-1);
    cv1:=TCenterVideoItem(MainDisplayForm.CenterItems[a]);
    MainDisplayForm.CenterItems.Delete(a);
    MainDisplayForm.CenterItems.Add(TCenterVideoItem(cv1));
  end;
end;

procedure TMainDisplayForm.MPMyMouseUp(Sender: TObject; Button: Smallint;
  Shift: Smallint; X, Y: Integer);
begin
  Abort;
end;

procedure TMainDisplayForm.MyDisplayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MessageBeep(0)
end;

function ReadMWord(f: TFileStream): word;
 
type
  TMotorolaWord = record
  case byte of
  0: (Value: word);
  1: (Byte1, Byte2: byte);
end;

var
  MW: TMotorolaWord;
begin
  {It would probably be better to just read these two bytes in normally and
  then do a small ASM routine to swap them. But we aren't talking about
  reading entire files, so I doubt the performance gain would be worth the 
  trouble.}
  f.Read(MW.Byte2, SizeOf(Byte));
  f.Read(MW.Byte1, SizeOf(Byte));
  Result := MW.Value;
end;

procedure GetJPGSize(const sFile: string; var wWidth, wHeight: word);
const
  ValidSig : array[0..1] of byte = ($FF, $D8);
  Parameterless = [$01, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7];
var
  Sig: array[0..1] of byte;
  pict: TPicture;
  f: TFileStream;
  x: integer;
  Seg: byte;
  Dummy: array[0..15] of byte;
  Len: word;
  ReadLen: LongInt;
begin
  FillChar(Sig, SizeOf(Sig), #0);
  f := TFileStream.Create(sFile, fmOpenRead);
  try
    ReadLen := f.Read(Sig[0], SizeOf(Sig));
    for x := Low(Sig) to High(Sig) do
      if Sig[x] <> ValidSig[x] then
        ReadLen := 0;
      if ReadLen > 0 then
      begin
        ReadLen := f.Read(Seg, 1);
        while (Seg = $FF) and (ReadLen > 0) do
        begin
          ReadLen := f.Read(Seg, 1);
          if Seg <> $FF then
          begin
            if (Seg = $C0) or (Seg = $C1) then
            begin
              ReadLen := f.Read(Dummy[0], 3);  { don't need these bytes }
              wHeight := ReadMWord(f);
              wWidth := ReadMWord(f);
            end
            else
            begin
              if not (Seg in Parameterless) then
              begin
                Len := ReadMWord(f);
                f.Seek(Len - 2, 1);
                f.Read(Seg, 1);
              end
              else
                Seg := $FF;  { Fake it to keep looping. }
            end;
          end;
        end;
      end;
    finally
    f.Free;
    if (wHeight=0) or (WWidth=0) or (wheight/wwidth>10) then begin
      pict := TPicture.Create;
      try
        pict.LoadFromFile(sFile);
        WWidth:=pict.Width;
        wHeight:=pict.Height;
      finally
        pict.Free;
      end;
    end;
  end;
end;

procedure TMainDisplayForm.MyGalMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var ZoomImgPnl:TPanel;ZoomIMg:Timage;
    CloseBut,CloseBut2:TDsFancyButton;
    ths,tvs,hs,vs:word;
begin
  GetJPGSize(TImage(sendeR).HelpKeyword,hs,vs);
  if hs>DataForm.Mainform_W-20 then begin
    ths:=hs;
    hs:=DataForm.Mainform_W-120;
    vs:=round(vs/(ths/hs));
  end;
  if vs>DataForm.Mainform_H-80 then begin
    tvs:=vs;
    vs:=DataForm.Mainform_H-180;
    hs:=round(hs/(tvs/vs));
  end;
  DataForm.writeDBLog('CAL_PICTU_PRESS','Bild TastenDruck erfolgt - ClickBild : '+TImage(sendeR).HelpKeyword,'',5);
  ZoomImgPnl:=TPanel.Create(Overlaypanel);
  ZoomImgPnl.Parent:=Overlaypanel;
  ZoomImgPnl.Show;
  ZoomImgPnl.Tag:=99;
  ZoomImgPnl.Left:=round((DataForm.Mainform_W-20-hs)/2);
  ZoomImgPnl.Width:=hs;
  ZoomImgPnl.Height:=vs;
  ZoomImgPnl.top:=round((DataForm.Mainform_H-80-vs)/2);
  ZoomImgPnl.repaint;
  ZoomImg:=Timage.Create(ZoomImgPnl);
  ZoomIMg.Parent:=ZoomImgPnl;
  ZoomIMg.Proportional:=true;
  ZoomIMg.Stretch:=true;
  ZoomImg.Left:=round((DataForm.Mainform_W-20-hs)/2);
  ZoomImg.top:=round((DataForm.Mainform_H-80-vs)/2);
  ZoomImg.Picture.LoadFromFile(TImage(sendeR).HelpKeyword);
  ZoomImg.Align:=alClient;
  ZoomImg.show;
  zoomImg.Width:=hs;
  ZoomIMg.Height:=vs;
  ZoomIMg.Tag:=99;
  ZoomIMg.Repaint;
  CloseBut:=TDsFancyButton.Create(ZoomImgPnl);
  CloseBut.Parent:=ZoomImgPnl;
  CloseBut.Left:=ZoomImgPnl.Width-50;
  CloseBut.Top:=0;
  CloseBut.Width:=45;
  CloseBut.Height:=45;
  CloseBut.Left:=ZoomImgPnl.Width-50;
  CloseBut.Top:=2;
  CloseBut.Caption:='';
  closeBut.Glyphs.Layout:=lyCenter;
  closeBut.Glyphs.Distance:=20;
  CloseBut.Glyphs.Glyph.LoadFromFile(Dataform.MainPath+'Default\galclose.bmp');
  CloseBut.Show;
  CloseBut.repaint;
  CloseBut.OnMouseUp:=GalCloseMouseup;
end;

function  CleanDirName(DirFileName : String) : String;
var
  CheckStr : String;
  Path: array [0..MAX_PATH - 1] of WideChar;
  Filename: array[0..MAX_PATH - 1] of WideChar;
  ReturnValue: integer;

begin
  //--     The following are considered invalid characters in all names.
  //--     \ / : * ? " < > |

  CheckStr := Trim(DirFileName);
  CheckStr := StringReplace(CheckStr,'/','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'\','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'.','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,':','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'?','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'<','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'>','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'|','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'!','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'~','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'+','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'=','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,')','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'(','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'*','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'&','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'^','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'%','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'$','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'#','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'@','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'{','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'}','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'"','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,';','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,',','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'_','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'-','',[rfReplaceAll, rfIgnoreCase]);

  // '' become - nil
  CheckStr := StringReplace(CheckStr,'''','',[rfReplaceAll, rfIgnoreCase]);
  CheckStr := StringReplace(CheckStr,'  ','',[rfReplaceAll, rfIgnoreCase]);
  result := 'N'+CheckStr;
end;

procedure TMainDisplayForm.MyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Benabled:boolean;Action1,Action2:word;nextstorry,storryname:string;
begin
  if allowclick then begin
    Allowclick:=false;
    ReclickTimer.Enabled:=true;
    dsLed7.ledon:=False;
    dsled7.Repaint;
    ClickTagid:=Tcontrol(Sender).tag;
    if sender.classname='TImage' then ClickBtn:=TTSS_Button(Timage(Sender).Owner);
//    if (not Dataform.SystemOffline) and DataForm.OnlineRun then begin
//      DataForm.TSS_FE_AlgQuery.Close;
//      DataForm.TSS_FE_AlgQuery.sql.Text:='Select * from felder where feld_id='+inttostr(ClickTagid);
//      DataForm.TSS_FE_AlgQuery.open;
//      if DataForm.TSS_FE_AlgQuery.RecordCount=1 then begin
//        Benabled:=DataForm.TSS_FE_AlgQuery.FieldByName('Button_active').AsBoolean;
//        Action1:=DataForm.TSS_FE_AlgQuery.FieldByName('button_action_inactiveclick').Asinteger;
//        Action2:=DataForm.TSS_FE_AlgQuery.FieldByName('button_action_activeclick').Asinteger;
//      end else Benabled:=false;
//    end else begin
    Benabled:=ClickBTn.Buttonactive;
    Action1:=ClickBTn.buttonactioninactive;
    Action2:=ClickBTn.buttonactionactive;
//    end;
    if DataForm.ButtonsAktiv and (BEnabled or (not BEnabled and (Action1>0))) then begin
      if not BEnabled and (Action1>0) then MainDisplayForm.Image1.Picture.LoadFromFile(DataForm.MainPath+'Baustelle.jpg') else image1.Picture:=nil;
      begin
        if Action2=9 then Begin
          CheckWorkTimer.Enabled:=false;
          Fstopall:=true;
          TSS_FE_Specialform.Doclose:=falsE;
          TSS_FE_Specialform.Left:=DataForm.Mainform_X;
          TSS_FE_Specialform.top:=DataForm.Mainform_Y;
          TSS_FE_Specialform.Height:=DataForm.Mainform_H;
          TSS_FE_Specialform.Width:=DataForm.Mainform_W;
          TSS_FE_Specialform.showmodal;
          StartCEnterVideo;
          CheckWorkTimer.Enabled:=True;
        End else
        if Action2=16 then Begin
          CheckWorkTimer.Enabled:=false;
          Fstopall:=true;
          KioskInternetForm.HOMEPAGE_URL:=ClickBtn.ClickPlayListFileName;
          KioskInternetForm.showmodal;
          StartCEnterVideo;
          CheckWorkTimer.Enabled:=True;
        End else
        if (Action2=3) then Begin
          nextstorry:=ClickBtn.ClickPlayListFileName;
          if fileexists(ClickBtn.ClickPlayListFileName) then begin
            if Runningstorry<>nil then Runningstorry.close;
            Cpanel.hide;
            Overlaypanel.Show;
            Overlaypanel.Repaint;
            Overlaypanel.BringToFront;
            Runningstorry:=TTSS_StorryPanel.create(nil);
            Runningstorry.Parent:=Overlaypanel;
            Runningstorry.name:=CleanDirName(extractfilename(nextstorry));
            Runningstorry.OnAktion:=StorryAktion;
            if Runningstorry.LoadStorry(nextstorry) then begin
            end else begin
              showmessage('Fehler : '+Runningstorry.LoadError);
              closeuptimer.Enabled:=true;
            end;
          end;
        End else begin
          if Action2<>5  then Begin
            DataForm.writeDBLog('BTN_PRESS','TastenDruck erfolgt - ClickTag : '+inttostr(ClickTagid),inttostr(ClickTagid),4);
            FCountOpensteps:=0;
            Overlaypanel.Width:=FCountOpensteps*48;
            Overlaypanel.height:=FCountOpensteps*27;
            Overlaypanel.Repaint;
            ResetKeeper;
            runsecondtimer.Enabled:=false;
            closeuptimer.Enabled:=false;
            Timer1.Enabled:=false;
            DisplayPanel.stopVideo;
            dsLed2.LedOn:=False;
            dsLed2.Repaint;
            dsLed1.LedOn:=false;
            dsLed1.Repaint;
            OpenupTimer.Enabled:=true;
          end else begin
            MessageBeep(0);
          end;
        end;
      end;
    end;
  end else begin
  end;
end;

procedure TMainDisplayForm.myVideoEnd(sender: Tobject);
begin
//   if FNextVideoIndex>MainDisplayForm.Centeritems.Count-1 then FNextVideoIndex:=0 else inc(FNextVideoIndex);
   dsLed1.LedOn:=False;
   dsLed1.Repaint;
   dsLed2.LedOn:=true;
   dsLed2.Repaint;
   Timer1.Enabled:=true;
end;

procedure TMainDisplayForm.N144x961Click(Sender: TObject);
var neush:TTSS_Button;
begin
  neush:=NButton(sender);
  neush.width:=144;
  neush.height:=96;
  neush.left:=round(int((dataform.Popup_X-maindisplayform.left)/96)*96);
  neush.top:=round(int(dataform.Popup_y/96)*96);
end;

procedure TMainDisplayForm.N48inH1Click(Sender: TObject);
begin
  DataForm.PopupButton.height:=DataForm.PopupButton.height+48;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.N48inH2Click(Sender: TObject);
begin
  DataForm.PopupButton.Height:=DataForm.PopupButton.Height-48;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.N48inW1Click(Sender: TObject);
begin
  DataForm.PopupButton.Width:=DataForm.PopupButton.Width+48;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.N48inW2Click(Sender: TObject);
begin
  DataForm.PopupButton.width:=DataForm.PopupButton.width-48;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.N96inx1Click(Sender: TObject);
begin
  DataForm.PopupButton.Left:=DataForm.PopupButton.Left+48;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.N96inx2Click(Sender: TObject);
begin
  DataForm.PopupButton.Left:=DataForm.PopupButton.Left-48;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.N96iny1Click(Sender: TObject);
begin
  DataForm.PopupButton.top:=DataForm.PopupButton.top+48;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.N96iny2Click(Sender: TObject);
begin
  DataForm.PopupButton.top:=DataForm.PopupButton.top-48;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

function TMainDisplayForm.NButton(Sender: TObject):TTSS_Button;
var neush:TTSS_Button;Kundennummer:string;
begin
  Kundennummer:=inputbox('Kundennummer eingeben','Kundennummer','');
  if Kundennummer<>'' then begin
    neush:=TTSS_Button.Create(MainDisplayform);
    neush.BGColor:=clwhite;
    neush.OnMouseup:=MainDisplayForm.MyMouseUp;
    neush.Buttonid:=Dataform.MYCreateGuid;
    neush.ButtonFileId:=dataform.MainPath+'SchemaTemp\'+neush.Buttonid+'.BDTA';
    neush.BtnPopup:=MainDisplayForm.PopupMenu1;
    neush.BtnEditPopup:=MainDisplayForm.EditMenuPopup;
    neush.Hint:=neush.Buttonid+#13#10+'unbekannt'+#13#10+Kundennummer+#13#10+neush.ButtonFileId;
    neush.EBGImage.Hint:=neush.Hint;
    if DataForm.Debugmode then begin
      neush.ShowHint:=true;
      neush.EBGImage.ShowHint:=true;
    end else begin
      neush.ShowHint:=false;
      neush.EBGImage.ShowHint:=False;
    end;
    neush.Parent:=MainDisplayForm;
    neush.KundenName:='Neuer Button';
    neush.KundenName2:='Bitte Konfigurieren';
    neush.KundenPLZOrt:='Rechte Maustaste';
    neush.Name:='NB_'+Kundennummer+'_BTN';
//    neush.ButtonimgFilename:=DataForm.MainPath+'unnamed.jpg';
//    neush.LoadButtonImage(neush.ButtonimgFilename);
    neush.DisplayAdress;
    neush.DisplayButton;
    DataForm.ButtonList.Add(neush);
    NButton:=neush;
  end;
end;

procedure TMainDisplayForm.NotebookReturnTimerTimer(Sender: TObject);
begin
  Notebook1.pageindex:=0;
  Notebook1.repaint;
end;

procedure TMainDisplayForm.N96x961Click(Sender: TObject);
var neush:TTSS_Button;
begin
  neush:=NButton(sender);
  neush.width:=96;
  neush.height:=96;
  neush.left:=round(int((dataform.Popup_X-maindisplayform.left)/96)*96);
  neush.top:=round(int(dataform.Popup_y/96)*96);
  neush.visible:=true;
end;

procedure VertikalSpiegele(Bild1:TImage);
var x,y:integer;
       hilf : TColor;
begin
  for x:=0 to Bild1.width div 2 - 1 do
   for y:=0 to Bild1.height - 1 do
   begin
    hilf := Bild1.canvas.pixels[x,y];
    Bild1.canvas.pixels[x,y]:=Bild1.canvas.pixels[Bild1.width-1-x,y];
    Bild1.canvas.pixels[Bild1.width-1-x,y] := hilf;
   end
end;

procedure HorizontalSpiegeln (Bild1:TImage);
var x,y:integer;
       hilf : TColor;
begin
  for x:=0 to Bild1.width - 1 do
   for y:=0 to Bild1.height div 2 - 1 do
   begin
    hilf := Bild1.canvas.pixels[x,y];
    Bild1.canvas.pixels[x,y]:=Bild1.canvas.pixels[x,Bild1.height-1-y];
    Bild1.canvas.pixels[x,Bild1.height-1-y] := hilf;
   end
end;

type TMyhelp = array[0..0] of TRGBQuad;

procedure Drehen90Grad(Bitmap:TBitmap);
var P : PRGBQuad; //ist in der Windows Unit
    x,y,b,h : Integer;
    RowOut : ^TMyHelp;
    help : TBitmap;

BEGIN
   Bitmap.PixelFormat := pf32bit;
   help := TBitmap.Create;
   help.PixelFormat := pf32bit;
   b := bitmap.Height;
   h := bitmap.Width;
   help.Width := b;
   help.height := h;
   for y := 0 to (h-1) do begin
     rowOut := help.ScanLine[y];
     P := Bitmap.scanline[bitmap.height-1];
     inc(p,y);
     for x := 0 to (b-1) do begin
        rowout[x] := p^;
        inc(p,h);
     end;
   end;
   bitmap.Assign(help);
end;

procedure TMainDisplayForm.OpenupTimerTimer(Sender: TObject);
var BEnabled:boolean;Action1,Action2,FileID,count,max,hSize,Vsize,Hspace,VSpace,diver:word;maxcol,maxrow,column,Row:extended;PlayList_uid,Zuordnung,Galleryid:String;
    Gimg:Timage;
var ex : TExif;fname:string;cnt,a:word;
begin
  OpenupTimer.Enabled:=false;
  if Dataform.CenterOpenSpeed>0 then begin
    OfflinePanel.Visible:=false;
    Overlaypanel.Top:=0;
    Overlaypanel.BringToFront;
    Overlaypanel.left:=0;
    Overlaypanel.Width:=FCountOpensteps*(DataForm.Mainform_W div 40);
    Overlaypanel.height:=FCountOpensteps*(DataForm.Mainform_H div 40);
    Overlaypanel.Repaint;
    Overlaypanel.show;
    inc(FCountOpensteps);
  end else begin
    OfflinePanel.Visible:=false;
    Overlaypanel.Top:=0;
    Overlaypanel.BringToFront;
    Overlaypanel.left:=0;
    Overlaypanel.Width:=DataForm.Mainform_W;
    Overlaypanel.height:=DataForm.Mainform_H;
    Overlaypanel.Repaint;
    Overlaypanel.show;
    inc(FCountOpensteps);
  end;
  if (FCountOpensteps<Dataform.CenterOpenSpeed) then begin
    OpenupTimer.Enabled:=true
  end else begin
    if dataform.ShowInfoTime then begin
      InfoPanel.Height:=100;
      InfoPanel.Left:=DataForm.Mainform_W-InfoPanel.Width-2;
      InfoPanel.top:=DataForm.Mainform_H-InfoPanel.Height-2;
      InfoPanel.Show;
    end else begin
      InfoPanel.Hide;
    end;
    Overlaypanel.top:=0;
    Overlaypanel.Left:=0;
    Overlaypanel.Height:=DataForm.Mainform_H;
    Overlaypanel.Width:=DataForm.Mainform_W;
    FRunningSeconds:=0;
    Fstopall:=false;
    Begin
//    DataForm.TSS_FE_AlgQuery.Close;
//    DataForm.TSS_FE_AlgQuery.sql.Text:='Select * from felder where feld_id='+inttostr(clickTagid);
//    DataForm.TSS_FE_AlgQuery.open;
//    if DataForm.TSS_FE_AlgQuery.RecordCount=1 then begin
      Action2:=ClickBtn.ButtonActionActive;// DataForm.TSS_FE_AlgQuery.FieldByName('button_action_activeclick').Asinteger;
      Benabled:=ClickBtn.ButtonActive;// DataForm.TSS_FE_AlgQuery.FieldByName('Button_active').AsBoolean;
      Action1:=ClickBtn.ButtonActionInActive;// DataForm.TSS_FE_AlgQuery.FieldByName('button_action_inactiveclick').Asinteger;
      if BEnabled and (Action2<2) then begin
//        PLayList_uid:=DataForm.TSS_FE_AlgQuery.FieldByName('click_playlist_id').Asstring;
//        DataForm.TSS_FE_AlgQuery.Close;
//        DataForm.TSS_FE_AlgQuery.sql.Text:='Select * from playlists where playlist_uid='''+PlayList_uid+''';';
//        DataForm.TSS_FE_AlgQuery.open;
//        if DataForm.TSS_FE_AlgQuery.RecordCount=1 then begin
//          Fileid:=DataForm.TSS_FE_AlgQuery.FieldByName('6playlist_media_id').Asinteger;
//          DataForm.TSS_FE_AlgQuery.Close;
//          DataForm.TSS_FE_AlgQuery.sql.Text:='Select * from media where media_id='+inttostr(Fileid)+';';
//          DataForm.TSS_FE_AlgQuery.open;
//          if DataForm.TSS_FE_AlgQuery.RecordCount=1 then begin
//            FileName:=DataForm.TSS_FE_AlgQuery.FieldByName('media_file').Asstring;
//            Kundenuid:=DataForm.TSS_FE_AlgQuery.FieldByName('kunden_uid').Asstring;
//            Galleryid:=DataForm.TSS_FE_AlgQuery.FieldByName('gallery_uid').Asstring;
//            Zuordnung:=DataForm.TSS_FE_AlgQuery.FieldByName('zuordnung_typ').Asstring;
            FileName:=ClickBtn.ClickPlayListFileName;
            Kundenuid:=ClickBtn.ClickPlayListKundenuid;
            Galleryid:=ClickBtn.ClickPlayListGalleryid;
            Zuordnung:=ClickBtn.ClickPlayListZuordnung;
            if Zuordnung='1' then begin
              if FileExists(FileName) then begin
                Loadfile:=FileName;
              end else begin
                Loadfile:='';
              end;
            end else
            if Zuordnung='' then begin
              if FileExists(Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName) then begin
                Loadfile:=Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName;
              end else begin
                if TSS_BE_FTPForm.fileExists(DataForm.Global_Schematic_id,Filename,False) then begin
                  TSS_BE_FTPForm.Loadfile(DataForm.Global_Schematic_id,filename,Dataform.MainPath+DataForm.Global_Schematic_id+'\',Filename,'','','',1,1,False);
                  Loadfile:=Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName;
                end else Loadfile:='';
              end;
            end else
            if Zuordnung='20' then begin
              if not FileExists(Dataform.MainPath+Kundenuid+'\'+FileName) then begin
                if not FileExists(Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName) then begin
                  if TSS_BE_FTPForm.fileExists(Kundenuid,Filename,False) then begin
                    TSS_BE_FTPForm.Loadfile(Kundenuid,filename,Dataform.MainPath+Kundenuid+'\',Filename,'','','',1,1,False);
                    Loadfile:=Dataform.MainPath+Kundenuid+'\'+FileName;
                  end else begin
                    if TSS_BE_FTPForm.fileExists(DataForm.Global_Schematic_id,Filename,False) then begin
                      TSS_BE_FTPForm.Loadfile(DataForm.Global_Schematic_id,filename,Dataform.MainPath+DataForm.Global_Schematic_id+'\',Filename,'','','',1,1,False);
                      Loadfile:=Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName;
                    end else begin
                      OfflinePanel.Visible:=true;
                      Loadfile:='';
                    end;
                  end;
                end else begin
                  Loadfile:=Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName;
                end;
              end else begin
                Loadfile:=Dataform.MainPath+Kundenuid+'\'+FileName;
              end;
            end else
            if Zuordnung='50' then begin
              if not FileExists(Dataform.MainPath+Galleryid+'\'+FileName) then begin
                if not FileExists(Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName) then begin
                end else begin
                  Loadfile:=Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName;
                end;
              end else begin
                Loadfile:=Dataform.MainPath+Galleryid+'\'+FileName;
              end;
            end;
            LogCopy.Items.Add('Klick . Play : '+Dataform.MainPath+DataForm.Global_Schematic_id+'\'+FileName);
            cpanel.top:=DataForm.CenterPanelTop;
            cpanel.Left:=DataForm.CenterPanelLeft;
            cpanel.Height:=DataForm.CenterPanelHeight;
            cpanel.Width:=DataForm.CenterPanelWidth;
            cpanel.Show;
            if 1=2 then begin
              centerpl:=TWindowsMediaPlayer.Create(cpanel);
              centerpl.Top:=0;
              centerpl.Height:=cpanel.Height;
              centerpl.onmouseup:=MPMyMouseUp;
              centerpl.Parent:=cpanel; //MainDisplayForm;
              centerpl.uiMode:='none';
              centerpl.stretchToFit:=true;
              centerpl.enableContextMenu:=false;
              centerpl.Show;
              centerpl.URL:=LoadFile;
              centerpl.BringToFront;
              centerpl.controls.play;
            end else begin
              if (ExtractFileExt(Filename)='.jpg') then begin
                DataForm.writeDBLog('CREATE_Center_Image','Bild erzeugen : '+Filename,ExtractFileExt(Filename),3);
                WImage.Left:=0;
                WImage.Top:=0;
                WImage.Width:=cpanel.Width;
                WImage.Height:=cPanel.Height;
                WImage.Picture.LoadFromFile(filename);
                Wimage.Stretch:=true;
                WPlayer.Hide;
                WImage.Show;
                //WPlayer.BringToFront;
                WImage.SendToBack;
                ShowcloseBtn;
              end else begin
                DataForm.writeDBLog('CREATE_Center_Video','Video erzeugen : '+Filename,ExtractFileExt(Filename),3);
                if Dataform.UseMediaPlayer then begin
                  WPlayer.Left:=0;
                  WPlayer.Top:=0;
                  WPlayer.Width:=cpanel.Width;
                  WPlayer.Height:=cPanel.Height;
                  WPlayer.URL:=LoadFile;
                  WImage.Hide;
                  WPlayer.Show;
                //WPlayer.BringToFront;
                  WPlayer.SendToBack;
                  WPlayer.settings.playCount:=10;
                  if dataform.StretchClickContent then WPlayer.stretchToFit:=true;
                  WPlayer.controls.play;
                  ShowcloseBtn;
                end else begin
                  // create new vlc instance
                  vlcInstance := libvlc_new(0, nil);
                  // create new vlc media from file
                  vlcMedia := libvlc_media_new_path(vlcInstance, PAnsiChar(AnsiString(LoadFile)));
                  // if you want to play from network, use libvlc_media_new_location instead
                  // vlcMedia := libvlc_media_new_location(vlcInstance, 'udp://@225.2.1.27:5127');
                  // create new vlc media player
                  vlcMediaPlayer := libvlc_media_player_new_from_media(vlcMedia);
                  // now no need the vlc media, free it
                  libvlc_media_release(vlcMedia);
                  // play video in a TPanel, if not call this routine, vlc media will open a new window
                  libvlc_media_player_set_hwnd(vlcMediaPlayer, Pointer(CPanel.Handle));
                  // play media
                  libvlc_media_player_play(vlcMediaPlayer);
                  ShowcloseBtn;
                end;
              end;
            end;
//          end else begin
//            LogCopy.Items.Add('Fehler #1/44/1 Click_Playliste '+PlayList_uid+' Medium '+inttostR(Fileid)+' nicht gefunden!!');
//          end;
//        end else begin
//          LogCopy.Items.Add('Fehler #1/44/1 Click_Playliste '+PlayList_uid+' nicht gefunden!!');
//        end;
        ShowcloseBtn;
        runsecondtimer.enabled:=true;
      end else
      if BEnabled and (Action2=2) then begin
        if ClickBtn.GalerieFiles.Count>1 then begin
          max:=ClickBtn.GalerieFiles.Count;
          count:=1;
          column:=1;
          Row:=1;
          Hspace:=10;
          VSpace:=10;
          if ClickBtn.GallerieRows=0 then begin
            if (max<=8) then Diver:=2;
            if (max>8) and (max<=16) then Diver:=3;
            if (max>16) and (max<=22) then Diver:=4;
            if (max>22) and (max<=30) then Diver:=5;
            if (max>30) and (max<=38) then Diver:=8;
            maxcol:=int(max/Diver);
            if maxcol<(max/Diver) then maxcol:=maxcol+1;
            maxrow:=int(max/maxcol);
            if maxrow<(max/maxcol) then maxrow:=maxrow+1;
            hSize:=round(1700/(maxcol))-round(Hspace*maxcol);
            Vsize:=round(800/(maxrow))-round(VSpace*maxrow);
          end else begin
            maxcol:=ClickBtn.GallerieCols;
            maxrow:=ClickBtn.GallerieRows;
            if ClickBtn.GallerieH=0 then begin
              hSize:=round(1700/(maxcol))-round(Hspace*maxcol);
              vsize:=round(800/(maxrow))-round(VSpace*maxrow);
            end else begin
              vSize:=ClickBtn.GallerieH;
              hSize:=ClickBtn.GallerieW;
            end;
          end;
          DataForm.writeDBLog('CREATE_GAL','Gallerie erzeugen : '+ClickBtn.GallerieID+' - '+inttostr(ClickBtn.GalerieFiles.Count),inttostr(ClickBtn.GalerieFiles.Count),3);
          cnt:=0;
          WPlayer.SendToBack;
          WPlayer.hide;
          cpanel.Hide;
          repeat
            if Copy(ClickBtn.GalerieFiles.Strings[cnt],1,6)<>'C:\TSS' then begin
              fname := DataForm.MainPath+ClickBtn.GallerieID+'\'+ClickBtn.GalerieFiles.Strings[cnt];
            end else begin
              fname := ClickBtn.GalerieFiles.Strings[cnt];
            end;
            if not FileExists(fname,false) then begin
              TSS_BE_FTPForm.Loadfile(ClickBtn.GallerieID,ClickBtn.GalerieFiles.Strings[cnt],DataForm.MainPath+ClickBtn.GallerieID,ClickBtn.GalerieFiles.Strings[cnt],'','','',1,1,False)
            end;
            Gimg:=Timage.Create(Overlaypanel);
            Gimg.Parent:=Overlaypanel;
            Gimg.Name:='Img'+inttostr(cnt);
            Gimg.Left:=(HSize div 2)+round(((column-1)*HSize)+((column-1)*HSpace));
            Gimg.Width:=HSize;
            Gimg.Top:=(VSize div 2)+round(((row-1)*VSize)+((row-1)*VSpace));
            Gimg.Height:=VSize;
            Gimg.Stretch:=true;
            DataForm.writeDBLog('CREATE_GAL','Versuche Bild zu laden : '+fname,'',5);
            Gimg.Picture.LoadFromFile(fname);
            if ex = nil then ex:=TExif.Create;
            try
              DataForm.writeDBLog('CREATE_GAL','Gallerie File Exif Found ! '+ClickBtn.GallerieID+' - '+fname,inttostr(ClickBtn.GalerieFiles.Count),3);
              ex.ReadFromFile(fname);
              DataForm.writeDBLog('CREATE_GAL','Gallerie File Exif Found+Read ! '+ClickBtn.GallerieID+' - '+fname,inttostr(ClickBtn.GalerieFiles.Count),3);
              if ex.Valid then begin
                DataForm.writeDBLog('CREATE_GAL','Gallerie File Exif valid ! '+ClickBtn.GallerieID+' - '+ex.ToString,inttostr(ClickBtn.GalerieFiles.Count),3);
                case ex.Orientation of
                  2: HorizontalSpiegeln(Gimg);
                  3: Begin
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       Drehen90Grad(Gimg.Picture.Bitmap);
                     End;
                  4: begin
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       HorizontalSpiegeln(Gimg);
                     end;
                  5: begin
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       HorizontalSpiegeln(Gimg);
                     end;
                  6: begin
                       Drehen90Grad(Gimg.Picture.Bitmap);
                     end;
                  7: begin
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       HorizontalSpiegeln(Gimg);
                     end;
                  8: begin
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       Drehen90Grad(Gimg.Picture.Bitmap);
                       Drehen90Grad(Gimg.Picture.Bitmap);
                     end;
                end;
              end;
            finally
              freeandnil(ex);
            end;
            Gimg.Show;
            Gimg.Tag:=99;
            Gimg.HelpKeyword:=fname;
            Gimg.OnMouseUp:=MyGalMouseUp;
            count:=count+1;
            Column:=Column+1;
            if (column-1)=maxcol then begin
              row:=row+1;
              column:=1;
            end;
            cnt:=cnt+1;
          until (cnt=ClickBtn.GalerieFiles.count);
          Overlaypanel.Show;
          Overlaypanel.Repaint;
          Overlaypanel.BringToFront;
        end;
        ShowcloseBtn;
        runsecondtimer.enabled:=true;
      end else
      if BEnabled and (Action2=3) then begin
(*        if fileexists(ClickBtn.ClickPlayListFileName) then begin
          Cpanel.hide;
          Overlaypanel.Show;
          Overlaypanel.Repaint;
          Overlaypanel.BringToFront;
          Runningstorry:=TTSS_StorryPanel.create(Overlaypanel);
          Runningstorry.OnAktion:=StorryAktion;
          if Runningstorry.LoadStorry(Overlaypanel,ClickBtn.ClickPlayListFileName) then begin
            if Runningstorry.isinfopanel then begin
              InfoPanel.Height:=40;
              InfoPanel.Left:=screen.Monitors[DataForm.DisplayScreen].Width-InfoPanel.Width-2;
              InfoPanel.top:=screen.Monitors[DataForm.DisplayScreen].Height-InfoPanel.Height-2;
              InfoPanel.Show;
            end;
            if Runningstorry.isTimeout then begin
              runsecondtimer.enabled:=true;
            end;
          end else begin
            showmessage('Fehler : '+Runningstorry.LoadError);
            closeuptimer.Enabled:=true;
          end;
        end;*)
//    end;
      end else
      if BEnabled and (Action2=5) then begin
        IdUDPClient1.Host:=DataForm.UDPResponder_Host;
        IdUDPClient1.Port:=DataForm.UDPResponder_Port;
        IdUDPClient1.Send(ClickBtn.ClickPlayListFileName);
      end;
    end;
  end;
end;

procedure TMainDisplayForm.OverlaypanelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MessageBeep(1);
end;

procedure TMainDisplayForm.OverlaypanelResize(Sender: TObject);
begin
  Image1.Top:=0;
  image1.Left:=0;
  image1.Width:=Self.Width;
  image1.Height:=self.Height;
  image1.Repaint;
end;

procedure TMainDisplayForm.Panel3Click(Sender: TObject);
begin
  Notebook1.PageIndex:=1;
  NotebookReturntimer.enabled:=true;
end;

procedure TMainDisplayForm.PartnerPlayStateChange(ASender: TObject;
  NewState: Integer);
begin
  if (NewState = wmppsStopped) then begin
    TWindowsMediaPlayer(TComponent(ASender)).controls.play;
  end;
end;

procedure TMainDisplayForm.PlayNextTimerTimer(Sender: TObject);
begin
  PlayNextTimer.Enabled:=false;
  label16.Caption:=inttostr(strtoint(label16.Caption)+1);
  DisplayPanel.PlayNextVideo2;
end;

procedure TMainDisplayForm.PopupMenu1Popup(Sender: TObject);
begin
  Buttonspeichern1.Enabled:=dataform.SomeEdited;
  ButtoninSystemeinfgen1.Enabled:=(DataForm.ButtonList.IndexOf(dataform.PopupButton)<0);
  DebugmodeonOoff1.Enabled:=DataForm.Debugmode;
  Buttonkopieren1.Enabled:=DataForm.Debugmode;
  ButtoninSystemeinfgen1.Enabled:=DataForm.Debugmode;
  EditmodusdesButtonsonoff1.Enabled:=DataForm.Debugmode;
  ButtonListeanzeigen1.Enabled:=DataForm.Debugmode;
  Buttonunsichtbar1.Enabled:=DataForm.Debugmode;
  Position1.Enabled:=DataForm.Debugmode;
  Size1.Enabled:=DataForm.Debugmode;
  if DataForm.PopupButton.CanEditButton then EditmodusdesButtonsonoff1.Caption:='Editmodus des Buttons -> OFF' else EditmodusdesButtonsonoff1.Caption:='Editmodus des Buttons -> ON';
end;

procedure TMainDisplayForm.ReclickTimerTimer(Sender: TObject);
begin
  ReclickTimer.Enabled:=false;
  dsLed7.LedOn:=true;
  dsled7.Repaint;
  Allowclick:=true;
end;

procedure TMainDisplayForm.resetKeeper;
begin
  Timeclick:=False;
  Label1.Font.Color:=clwhite;
  Label1.Repaint;
  Label2.Font.Color:=clwhite;
  Label2.Repaint;
  Label3.Font.Color:=clwhite;
  Label3.Repaint;
  Label4.Font.Color:=clwhite;
  Label4.Repaint;
  Label5.Font.Color:=clwhite;
  Label5.Repaint;
  FBeforeclick:=0;
end;

function TestBit(aByte: Byte; aBitNum: Integer): Boolean;
begin
  Result := (aByte and (1 shl aBitNum)) > 0;
end;

procedure TMainDisplayForm.runsecondtimerTimer(Sender: TObject);
var s:String;
  a,I: Integer;
  DelIM:Timage;
  TP:Tpanel;
  Timeout:Word;
begin
  runsecondtimer.Enabled:=false;
  if Runningstorry<>nil then Timeout:=Runningstorry.Storrytimeout else Timeout:=dataform.ClickTimeout;
  if (Timeout-FRunningSeconds)>0 then begin
    s:=inttostr(Timeout-FRunningSeconds);
    if length(s)<2 then s:='0'+s;
    dsSevenSegmentDisplay1.Value:=strtoint(s[1]);
    dsSevenSegmentDisplay2.Value:=strtoint(s[2]);
    for I := 1 to 8 do begin
      Tp:=TPanel(FindComponent('DigiPoint_'+inttostr(I)));
      if TestBit(FRunningSeconds,I) then Tp.Color:=clOlive else tp.Color:=clBlack;
    end;
  end else begin
    dsSevenSegmentDisplay1.Value:=8;
    dsSevenSegmentDisplay2.Value:=8;
  end;
  inc(FRunningSeconds);
  if (FRunningSeconds>Timeout) or FStopAll then begin
    allowclick:=false;
    dsLed7.ledon:=false;
    dsled7.Repaint;
    stopall;
    closeuptimer.Enabled:=true;
  end else runsecondtimer.Enabled:=true and not Fstopall;
end;

procedure TMainDisplayForm.runtimerTimer(Sender: TObject);
begin
  if Dataform.Shellmode then begin
    dsled10.OnColor:=clyellow;
    dsled10.LedOn:=true;
    if GetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell')='C:\TSS\Frontend\TSS_FE.exe' then begin
      dsled10.OnColor:=cllime;
      dsled10.Hint:='Shellmode in Config : ON .. und in Registry gefunden ... OK';
      dsled10.ShowHint:=true;
      dsled10.LedOn:=true;
    end else begin
      SetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell','C:\TSS\Frontend\TSS_FE.exe');
      dsled10.OnColor:=clblue;
      dsled10.Hint:='Shellmode in Config : ON .. aber nicht in Registry gefunden ... gesetzt';
      dsled9.ShowHint:=true;
      dsled9.LedOn:=true;
    end;
  end else begin
    if GetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell')='C:\TSS\Frontend\TSS_FE.exe' then begin
      dsled9.OnColor:=clgreen;
      dsled9.Hint:='Shellmode in Config : OFF .. aber Registry gefunden ... zurückgesetzt';
      dsled9.ShowHint:=true;
      SetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell','Explorer.exe');
      dsled9.LedOn:=true;
    end else begin
      dsled9.OnColor:=clyellow;
      dsled9.Hint:='Shellmode in Config : OFF .. und nicht in Registry gefunden ... OK';
      dsled9.ShowHint:=true;
      dsled9.LedOn:=False;
    end;
  end;
end;

procedure TMainDisplayForm.Schriftartfestlegen1Click(Sender: TObject);
begin
  FontDialog1.font:=DataForm.PopupButton.TextZeile1_Text_S;
  if FontDialog1.Execute then begin
    DataForm.PopupButton.TextZeile1_Text_S:=FontDialog1.Font;
    DataForm.SomeEdited:=true;
  end;
end;

procedure TMainDisplayForm.Schriftartfestlegen2Click(Sender: TObject);
begin
  FontDialog1.font:=DataForm.PopupButton.TextZeile2_Text_S;
  if FontDialog1.Execute then begin
    DataForm.PopupButton.TextZeile2_Text_S:=FontDialog1.Font;
    DataForm.SomeEdited:=true;
  end;
end;

procedure TMainDisplayForm.Schriftartfestlegen3Click(Sender: TObject);
begin
  FontDialog1.font:=DataForm.PopupButton.TextZeile3_Text_S;
  if FontDialog1.Execute then begin
    DataForm.PopupButton.TextZeile3_Text_S:=FontDialog1.Font;
    DataForm.SomeEdited:=true;
  end;
end;

procedure TMainDisplayForm.Schriftartfestlegen4Click(Sender: TObject);
begin
  FontDialog1.font:=DataForm.PopupButton.TextZeile4_Text_S;
  if FontDialog1.Execute then begin
    DataForm.PopupButton.TextZeile4_Text_S:=FontDialog1.Font;
    DataForm.SomeEdited:=true;
  end;
end;

procedure TMainDisplayForm.ScreensaveTimerTimer(Sender: TObject);
var bmp:TPicture;
begin
  ScreensaveTimer.Enabled:=false;
  if not DirectoryExists(Paramstr(0)[1]+':\TSS\Screenshots') then CreateDir(Paramstr(0)[1]+':\TSS\Screenshots');
  bmp:=Tpicture.Create;
  bmp.Bitmap:=GetSCREENSHOT;
  bmp.SaveToFile(Paramstr(0)[1]+':\TSS\Screenshots\SCR_'+FormatDateTime('yyyymmdd_hhnnss', Now)+'.bmp');
  ScreensaveTimer.Enabled:=DataForm.DoScreenshot;
end;

procedure TMainDisplayForm.ShowcloseBtn;
var CB:Timage;a:word;
begin
  if dataform.CloseButtonCustom then begin
    for a := 0 to DataForm.CloseButtonCount-1 do begin
      CB:=Timage.Create(Overlaypanel);
      if dataform.CloseButtonAlign.Strings[a]='1' then begin
        CB.Left:=strtoint(dataform.CloseButtonLeft.Strings[a]);
      end;
      if dataform.CloseButtonAlign.Strings[a]='2' then begin
        CB.Left:=DataForm.Mainform_W-Strtoint(Dataform.CloseButtonLeft.Strings[a]);
      end;
      if dataform.CloseButtonVAlign.Strings[a]='1' then begin
        CB.Top:=Strtoint(dataform.CloseButtonTop.Strings[a]);
      end;
      if dataform.CloseButtonVAlign.Strings[a]='2' then begin
        CB.Top:=DataForm.Mainform_H-strtoint(dataform.CloseButtonTop.strings[a]);
      end;
      CB.Width:=strtoint(dataform.CloseButtonWidth.strings[a]);
      CB.Height:=strtoint(dataform.CloseButtonHeight.Strings[a]);
      if fileexists(dataform.CloseButtonImage.Strings[a]) then CB.Picture.LoadFromFile(dataform.CloseButtonImage.Strings[a]) else
       if fileexists(DataForm.MainPath+'Default\zurueckintern.jpg') then PCloseButton.Picture.LoadFromFile(DataForm.MainPath+'Default\zurueckintern.jpg');
      CB.OnClick:=PCloseButtonClick;
      CB.Parent:=Overlaypanel;
      CB.BringToFront;
      CB.Visible:=true;
      Closebuttons.add(CB);
    end;
  end else begin
    PCloseButton.left:=infopanel.Width-(PCloseButton.width+20);
    PCloseButton.top:=2;
    PCloseButton.parent:=InfoPanel;
    PCloseButton.Width:=140;
    PCloseButton.Height:=40;
    if fileexists(DataForm.MainPath+'Default\zurueckintern.jpg') then PCloseButton.Picture.LoadFromFile(DataForm.MainPath+'Default\zurueckintern.jpg');
    PCloseButton.OnClick:=PCloseButtonclick;
    PCloseButton.BringToFront;
    PCloseButton.Visible:=true;
  end;
end;

procedure TMainDisplayForm.SpeedButton1Click(Sender: TObject);
begin
  mixplaylist;
end;

procedure TMainDisplayForm.SpeedButton2Click(Sender: TObject);
begin
  DataForm.finished:=true;
  Application.Terminate;
end;

procedure TMainDisplayForm.SpeedButton3Click(Sender: TObject);
begin
  DisplayPanel.Volume:=0;
end;

procedure TMainDisplayForm.WMHotKey(var Msg: TWMHotKey);
var hNotepadWindow:HWND;
  NewWindowStyle,WindowStyle : Integer;
  FAppThreadID: Cardinal;
  WinRect:TRect;
begin
  inherited;
  if (Msg.HotKey=1) then begin
    FBeforeclick:=5;
    Debugpanel.BringToFront;
    Debugpanel.left:=288;
    Debugpanel.top:=192;
    Debugpanel.Width:=1344;
    Debugpanel.height:=696;
    Debugpanel.show;
    notebook1.pageindex:=3;
    NotebookReturnTimer.enabled:=true;
  end else
  if (Msg.HotKey=2) then begin
    if SignagePanel<>nil then begin
      if DataForm.HasSignage then begin
        hNotepadWindow := FindWindow(nil,'Xibo');
        if hNotepadWindow=0 then begin
           MessageDlg('Xibo Missing ! Nutze Backup : ',TMsgDlgType.mtInformation,[mbok],0);
           hNotepadWindow:=Dataform.XiboHandle;
        end;
        if hNotepadWindow>0 then begin
          IF dataform.Debugmode then begin
             WindowStyle := GetWindowLong(hNotepadWindow, GWL_STYLE);
             NewWindowStyle := WindowStyle
                 - WS_BORDER
                 - WS_OVERLAPPED
                 - WS_THICKFRAME;
             MessageDlg('Aktueller Fenster Status :'  +inttostr(WindowStyle)+#13#10+'Gewünscht : '+inttostr(NewWindowStyle),TMsgDlgType.mtInformation,[mbok],0);
             SetWindowLong(hNotepadWindow,GWL_STYLE,NewWindowStyle);
          end;
        end else begin
           MessageDlg('Xibo komplett Missing !',TMsgDlgType.mtInformation,[mbok],0);
        end;
      end;
    end;
  end;
end;


procedure TMainDisplayForm.SpeedButton4Click(Sender: TObject);
begin
  if Dataform.specialContentCodeMode then begin
    DataForm.CodeMode:=True;
    codeform.showmodal;
    DataForm.CodeMode:=FalsE;
    Dataform.CodeEditorInput:=codeform.Clickvalue=Dataform.EditorCode;
    Dataform.CodeSpecialInput:=codeform.Clickvalue=Dataform.SpecialCode;
    codeform.Clickvalue:='';
    if Dataform.CodeEditorInput then begin
      dataform.EditMode:=not Dataform.EditMode;
      if dataform.EditMode then TSpeedbutton(sender).Font.color:=clred else TSpeedbutton(sender).Font.color:=clwhite;
      TSpeedbutton(sender).Repaint;
    end;
    if Dataform.CodeSpecialInput then begin
      Dataform.CodeSpecialInput:=false;
      CheckWorkTimer.Enabled:=false;
      Fstopall:=true;
      Dataform.specialContentdone:=true;
      TSS_FE_Specialform.Doclose:=falsE;
      TSS_FE_Specialform.showmodal;
      StartCEnterVideo;
      CheckWorkTimer.Enabled:=True;
    end;
  end else begin
      Dataform.CodeSpecialInput:=false;
      CheckWorkTimer.Enabled:=false;
      Fstopall:=true;
      Dataform.specialContentdone:=true;
      TSS_FE_Specialform.Doclose:=falsE;
      TSS_FE_Specialform.showmodal;
      StartCEnterVideo;
      CheckWorkTimer.Enabled:=True;
  end;
end;

procedure TMainDisplayForm.SpeedButton5Click(Sender: TObject);
begin
  Mainform.readCFgIni;
end;

procedure TMainDisplayForm.SpeedButton6Click(Sender: TObject);
begin
  DisplayPanel.CurrentPlayPos:=CenterVideoNames.ItemIndex;
  DisplayPanel.useNextCurrentPlayPos:=CenterVideoNames.ItemIndex;
  if DataForm.Debugmode then showmessage('Setze auf '+CenterVideoNames.items[CenterVideoNames.ItemIndex]+'('+inttostr(CenterVideoNames.ItemIndex)+')');
end;

procedure TMainDisplayForm.StartCEnterVideo;
begin
  DisplayPanel.PlayVideo(0);
//  DisplayPanel.SendToBack;
end;

procedure TMainDisplayForm.stopall;
var s:String;
  a: Integer;
  DelIM:Timage;
begin
  Fstopall:=true;
  if Runningstorry<>nil then begin
    freeandnil(Runningstorry);
  end;
  if centerpl<>nil then Freeandnil(centerpl);
  if centerplPanel<>nil then Freeandnil(centerplPanel);
    a:=0;
    if centerpl<>nil then freeandnil(centerpl);
    if a<Overlaypanel.ComponentCount then begin
      repeat
        if Overlaypanel.Components[a]<>nil then
          if TControl(Overlaypanel.Components[a]).Tag=99 then begin
            DelIM:=TImage(Overlaypanel.Components[a]);
            freeandnil(DelIm);
          end else a:=a+1;
      until a>=Overlaypanel.ComponentCount;
    end;
  if not Dataform.UseMediaPlayer then begin
    if not Assigned(vlcMediaPlayer) then begin
      Showmessage('Not playing');
      Exit;
    end;
    // stop vlc media player
    libvlc_media_player_stop(vlcMediaPlayer);
    // and wait until it completely stops
    while libvlc_media_player_is_playing(vlcMediaPlayer) = 1 do begin
      Sleep(100);
    end;
    // release vlc media player
    libvlc_media_player_release(vlcMediaPlayer);
    vlcMediaPlayer := nil;
    // release vlc instance
    libvlc_release(vlcInstance);
  end;
end;

procedure TMainDisplayForm.StorryAktion(Sender: TObject; Aktion,AktionOption: string);
begin
  if Aktion='CLOSE' then begin
    FRunningSeconds:=9999;
  end else
  if Aktion='STORRY' then begin
    if fileexists(Aktionoption) then begin
      if Runningstorry<>nil then Runningstorry.close;
      Cpanel.hide;
//      Overlaypanel.Show;
//      Overlaypanel.Repaint;
//      Overlaypanel.BringToFront;
      Runningstorry:=TTSS_StorryPanel.create(nil);
      Runningstorry.Parent:=Overlaypanel;
      Runningstorry.name:=CleanDirName(extractfilename(AktionOption));
      Runningstorry.OnAktion:=StorryAktion;
      if Runningstorry.LoadStorry(AktionOption) then begin
      end else begin
        showmessage('Fehler : '+Runningstorry.LoadError);
        closeuptimer.Enabled:=true;
      end;
    end;
  end else
  if Aktion='TIMEOUT' then begin
    if fileexists(Aktionoption) then begin
      if Runningstorry<>nil then Runningstorry.close;
      Cpanel.hide;
//      Overlaypanel.Show;
//      Overlaypanel.Repaint;
//      Overlaypanel.BringToFront;
      Runningstorry:=TTSS_StorryPanel.create(nil);
      Runningstorry.Parent:=Overlaypanel;
      Runningstorry.name:=CleanDirName(extractfilename(AktionOption));
      Runningstorry.OnAktion:=StorryAktion;
      if Runningstorry.LoadStorry(AktionOption) then begin
      end else begin
        showmessage('Fehler : '+Runningstorry.LoadError);
        closeuptimer.Enabled:=true;
      end;
    end;
  end;
end;

procedure TMainDisplayForm.Timer1Timer(Sender: TObject);
var NextFile:String;
begin
  Timer1.Enabled:=false;
//  NextFile:=DisplayPanel.GetNextVideoFileName;
  DisplayPanel.PlayNextVideo;
  dsLed2.LedOn:=False;
  dsLed2.Repaint;
  dsLed1.LedOn:=true;
  dsLed1.Repaint;
end;

procedure TMainDisplayForm.Timer2Timer(Sender: TObject);
begin
  if not TSS_FE_XtraBtnForm.visible then TSS_FE_XtraBtnForm.show;
  TSS_FE_XtraBtnForm.Left:=DisplayPanel.left;
  TSS_FE_XtraBtnForm.top:=DisplayPanel.top;
  TSS_FE_XtraBtnForm.BringToFront;
end;

procedure TMainDisplayForm.UsbIN(ASender: TObject; const ADevType, ADriverName,
  AFriendlyName: string);
var Drvs:TStringList;
    a,Updatefound:word;
    Cmds:TStringList;
    errorcode: integer;
begin
   Updatefound:=0;
   if pos('Disk drive',ADriverName)>0 then begin
     Sleep(2000);
     Drvs:=TStringList.Create;
     FUsb.GetUsbDrives(Drvs);
     for a := 1 to Drvs.Count do begin
       if fileexists(Drvs.Strings[a-1]+':\TSSFE_Update.UPD') then Begin
         Updatefound:=a;
       end;
       if fileexists(Drvs.Strings[a-1]+':\TSSFE_Exec.bat') then Begin
         MessageBeep(1);
         MessageBeep(1);
         errorcode := ShellExecute(application.handle, 'open', PChar(Drvs.Strings[a-1]+':\TSSFE_Exec.bat'),pchar(''), nil, SW_MAXIMIZE);
         case errorcode of
           2:showmessage('file not found');
           3:showmessage('path not found');
           5:showmessage('access denied');
           8:showmessage('not enough memory');
           32:showmessage('dynamic-link library not found');
           26:showmessage('sharing violation');
           27:showmessage('filename association incomplete or invalid');
           28:showmessage('DDE request timed out');
           29:showmessage('DDE transaction failed');
           30:showmessage('DDE busy');
           31:showmessage('no application associated with the given filename extension');
         end;
       end;
     end;
     if Updatefound>0 then begin
       Updateform.show;
       Updateform.BeginUpdate(UPPERCASE(Drvs.strings[Updatefound-1]));
       Updateform.hide;
     end;
     freeandnil(drvs);
   end;
end;

procedure TMainDisplayForm.UsbOUT(ASender: TObject; const ADevType, ADriverName,
  AFriendlyName: string);
begin
//   showmessage('USB Removed - Device Type = ' + ADevType + #13#10 +
//               'Driver Name = ' + ADriverName + #13+#10 +
//               'Friendly Name = ' + AFriendlyName);
end;

procedure TMainDisplayForm.Videofensteranzeigen1Click(Sender: TObject);
begin
  DisplayPanel.BGColor:=clGray;
  DisplayPanel.Visible:=true;
  DisplayPanel.Repaint;
end;

procedure TMainDisplayForm.WDAliveTimerTimer(Sender: TObject);
var  ee: TWMMYMessage;NextFile:String;a:word;
  MyRecord: PMyFileRecord;
  cds: TCopyDataStruct;
  hWnd: THandle;
begin
  WDAliveTimer.Enabled:=false;
  dsLed3.LedOn:=false;
  dsled3.Repaint;
  dsLed4.LedOn:=false;
  dsled4.Repaint;
  hwnd:=Dataform.FindWindowByTitle('Logumedia System OS');
  SendMessage(hWnd, WM_OURMESSAGE, Handle, $991);
end;

procedure TMainDisplayForm.WMMYMessage(var Msg: TWMMYMessage);
begin
  WDAliveTimer.Enabled:=true;
end;

procedure TMainDisplayForm.WPlayerPlayStateChange(ASender: TObject;
  NewState: Integer);
begin
  if DataForm.indebug then ShowMessage(inttostR(NewStaTe));
end;

procedure TMainDisplayForm.XXXinH1Click(Sender: TObject);
var pix:string;pixi:integer;
begin
  pix:=InputBox('Erhöhung -+','Pixel :','0');
  pixi:=strtoint(pix);
  DataForm.PopupButton.height:=DataForm.PopupButton.height+pixi;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.XXXinW1Click(Sender: TObject);
var pix:string;pixi:integer;
begin
  pix:=InputBox('Verbreiterung -+','Pixel :','0');
  pixi:=strtoint(pix);
  DataForm.PopupButton.width:=DataForm.PopupButton.width+pixi;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.xxxinx1Click(Sender: TObject);
var pix:string;pixi:integer;
begin
  pix:=InputBox('Verschiebung -+','Pixel :','0');
  pixi:=strtoint(pix);
  DataForm.PopupButton.Left:=DataForm.PopupButton.Left+pixi;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.yyyiny1Click(Sender: TObject);
var pix:string;pixi:integer;
begin
  pix:=InputBox('Verschiebung -+ y','Pixel :','0');
  pixi:=strtoint(pix);
  DataForm.PopupButton.top:=DataForm.PopupButton.top+pixi;
  DataForm.PopupButton.Repaint;
  Dataform.SomeEdited:=True;
end;

procedure TMainDisplayForm.N192x1921Click(Sender: TObject);
var neush:TTSS_Button;
begin
  neush:=NButton(sender);
  neush.width:=192;
  neush.height:=192;
  neush.left:=round(int((dataform.Popup_X-maindisplayform.left)/96)*96);
  neush.top:=round(int(dataform.Popup_y/96)*96);
end;

procedure TMainDisplayForm.N192x961Click(Sender: TObject);
var neush:TTSS_Button;
begin
  neush:=NButton(sender);
  neush.width:=192;
  neush.height:=96;
  neush.left:=round(int((dataform.Popup_X-maindisplayform.left)/96)*96);
  neush.top:=round(int(dataform.Popup_y/96)*96);
end;

initialization
  WM_OURMESSAGE := RegisterWindowMessage('TSS_broadcast Command_message');
  WM_OURMESSAGETEXT := RegisterWindowMessage('TSS_broadcast Text_message');
  WM_LOGENTRY := RegisterWindowMessage('TSS_broadcast LOGEntry');
  WM_VIDEOFILEPLAYED := RegisterWindowMessage('TSS_broadcast VideoFilePlayed');
  WM_IMAGEFILEPLAYED := RegisterWindowMessage('TSS_broadcast ImageFilePlayed');
end.
