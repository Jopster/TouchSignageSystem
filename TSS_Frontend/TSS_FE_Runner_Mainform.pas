unit TSS_FE_Runner_Mainform;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,shellAPi,
  Vcl.StdCtrls, ES.BaseControls, ES.Layouts,
  Vcl.Buttons, JPP.BasicPngButtonEx, JPP.Panel,
  Vcl.TitleBarCtrls, dsLeds, Vcl.Imaging.jpeg,
  Vcl.ComCtrls,tlHelp32,ScktComp, Vcl.Touch.GestureMgr, EZTexturePanel,
  JPP.PngButton,system.inifiles, SHFolder, wcrypt2,
  Vcl.TabNotBk, ES.Switch,System.Win.Registry,TSS_OS_IconClass_unit, JPP.Labels,TSS_Scheduler_unit,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,wininet, Vcl.Mask;

type
  TAllowedCircles = set of 0 .. 15;

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
  TWMMYMessage = record
    Msg: Cardinal;   // ( first is the message ID )
    Handle: HWND;    // ( this is the wParam, Handle of sender)
    Info: Longint;   // ( this is lParam, pointer to our data)
    Result: Longint;
  end;

  TTSS_Runner_Mainform = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    EsPanel1: TEZTexturePanel;
    Image1: TImage;
    PW1Window: TEZTexturePanel;
    Panel1: TPanel;
    dsLed1: TdsLed;
    dsLed2: TdsLed;
    dsLed3: TdsLed;
    Image3: TImage;
    InfoLabel2: TLabel;
    InfoLabel1: TLabel;
    PW2Window: TEZTexturePanel;
    Panel2: TPanel;
    dsLed4: TdsLed;
    dsLed5: TdsLed;
    dsLed6: TdsLed;
    Image6: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    ProgressBar2: TProgressBar;
    CheckBox2: TCheckBox;
    MainTimer: TTimer;
    GestureManager1: TGestureManager;
    Gesturewindow: TEZTexturePanel;
    Panel4: TPanel;
    dsLed7: TdsLed;
    dsLed8: TdsLed;
    dsLed9: TdsLed;
    Image10: TImage;
    Panel7: TPanel;
    SYSWindow1: TEZTexturePanel;
    Panel8: TPanel;
    dsLed10: TdsLed;
    dsLed11: TdsLed;
    dsLed12: TdsLed;
    Image12: TImage;
    Panel9: TPanel;
    Label12: TLabel;
    JppPngButton1: TJppPngButton;
    JppPngButton2: TJppPngButton;
    Watchdog_MainTimer: TTimer;
    StatecheckTimer: TTimer;
    dsLed13: TdsLed;
    JppPngButton3: TJppPngButton;
    Panel11: TPanel;
    GestureLed: TdsLed;
    Label22: TLabel;
    Clock: TTimer;
    imgDrawConnectionLine: TImage;
    img15: TImage;
    img14: TImage;
    img13: TImage;
    img12: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img11: TImage;
    img7: TImage;
    img3: TImage;
    img2: TImage;
    img6: TImage;
    img5: TImage;
    img1: TImage;
    Img0: TImage;
    img4: TImage;
    imgBlackBackground: TImage;
    JppPngButton4: TJppPngButton;
    dsLed20: TdsLed;
    GroupBox4: TGroupBox;
    SpeedButton3: TSpeedButton;
    CheckBox3: TCheckBox;
    dsLed21: TdsLed;
    Label30: TLabel;
    Prozesstimer: TTimer;
    dsLed22: TdsLed;
    dsLed23: TdsLed;
    GroupBox5: TGroupBox;
    SpeedButton4: TSpeedButton;
    dsLed24: TdsLed;
    Label31: TLabel;
    CheckBox4: TCheckBox;
    LogPanel: TEZTexturePanel;
    Panel10: TPanel;
    dsLed25: TdsLed;
    dsLed26: TdsLed;
    GroupBox7: TGroupBox;
    SpeedButton5: TSpeedButton;
    dsLed27: TdsLed;
    Label17: TLabel;
    CheckBox5: TCheckBox;
    TabbedNotebook1: TTabbedNotebook;
    LogMemo: TMemo;
    StdLogMemo: TMemo;
    Panel12: TPanel;
    dsLed17: TdsLed;
    dsLed18: TdsLed;
    dsLed19: TdsLed;
    Image13: TImage;
    dsLed16: TdsLed;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Image4: TImage;
    OSLogMemo: TMemo;
    StartRunTimer: TTimer;
    ReStayBackTimer: TTimer;
    dsLed14: TdsLed;
    dsLed15: TdsLed;
    IdUDPClient1: TIdUDPClient;
    Versionlabel: TLabel;
    dsLed28: TdsLed;
    dsLed29: TdsLed;
    TCPConnectTimer: TTimer;
    Memo1: TMemo;
    TCPServerCheck: TCheckBox;
    TCPServerAdress: TLabeledEdit;
    TCPPort: TLabeledEdit;
    TCPCheckInterval: TLabeledEdit;
    UDPLogsend: TCheckBox;
    UDPServerAdress: TLabeledEdit;
    UDPPort: TLabeledEdit;
    UDPLogLevel: TLabeledEdit;
    DisplayID: TLabeledEdit;
    Shape1: TShape;
    InfoLabel3: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure DefaultHandler(var Message); override;
    procedure ExitButtonClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure MainTimerTimer(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure SYSWindow1MouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image12MouseLeave(Sender: TObject);
    procedure JppPngButton1Click(Sender: TObject);
    procedure Watchdog_MainTimerTimer(Sender: TObject);
    procedure StatecheckTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SYSWindow1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure JppPngButton2Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure ClockTimer(Sender: TObject);
    procedure Img0MouseEnter(Sender: TObject);
    procedure Img0Click(Sender: TObject);
    procedure GestureLedClick(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure JppPngButton4Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure dsLed20Click(Sender: TObject);
    procedure ProzesstimerTimer(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure img12DblClick(Sender: TObject);
    procedure IconMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StartRunTimerTimer(Sender: TObject);
    procedure ReStayBackTimerTimer(Sender: TObject);
    procedure OnSeheduler(ID:string;Task:TTask);
    procedure dsLed15Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure OSLogMemoChange(Sender: TObject);
    procedure IdUDPClient1Connected(Sender: TObject);
    procedure IdUDPClient1Disconnected(Sender: TObject);
    procedure JppPngButton3Click(Sender: TObject);
    procedure UDPLogsendClick(Sender: TObject);
    procedure UDPLogLevelChange(Sender: TObject);
    procedure TCPServerCheckClick(Sender: TObject);
    procedure TCPCheckIntervalChange(Sender: TObject);
    procedure TCPConnectTimerTimer(Sender: TObject);
  private
    function GetColorat(x, y: word): Tcolor;
    procedure readCFgIni;
    procedure writeLog(s: string);
    function MyExitWindows(RebootParam: Longword): Boolean;
    function ChangeResolution(XResolution, YResolution, Depth: DWORD): BOOL;
    procedure DoCheckShell;
  private
    FOnSheduler: TTaskNotifyEvent;
  private published
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    FMoveControl:Tcontrol;
    FStartLeft:integer;
    FStarttop:integer;
    FStartX:integer;
    FStartY:integer;
    mainstate:integer;
    AppWnd : DWORD;
    Stayback:boolean;
    StaybackByMsg:boolean;
    StaybackIcon:TSS_OS_IconClass;
    Clicked: Boolean;
    Circle1, Circle2: TImage;
    LastImg: Byte;
    CurrentPassword, EnteredPassword: string;
    icons:Tlist;
    Sheduler:TTSS_Scheduler;
    procedure StartEngine(IconStart:boolean = false);
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure WMCOPYDATA(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure Gesturecheck;
    procedure LogLine(Log:word;s:string);
    function checkInternet : boolean;
  end;

type
  TFileVersionInfo = record
    fCompanyName,
      fFileDescription,
      fFileVersion,
      fInternalName,
      fLegalCopyRight,
      fLegalTradeMark,
      fOriginalFileName,
      fProductName,
      fProductVersion,
      fComments: string;
  end;

var
  TSS_Runner_Mainform: TTSS_Runner_Mainform;
  WM_LOGENTRY,WM_VIDEOFILEPLAYED,WM_IMAGEFILEPLAYED,WM_OURMESSAGE,WM_OURMESSAGETEXT: DWORD;
  UDPConnected:boolean;

implementation

{$R *.dfm}

uses
  GraphUtil, TSS_FE_Runner_Dataform_unit, TSS_FE_Runner_Helpform_unit,
  TSS_FE_Runner_Settingsform_unit,Winsvc, TSS_FE_ToolboxForm_unit;

var prozesscheckdone,Statecheckdone:boolean;

function Get_This_EXE_Version: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function ServiceGetKeyName(
  sMachine,
  sServiceDispName : string ) : string;
var
  //
  // service control
  // manager handle
  schm          : SC_Handle;

  //
  // max key name len
  nMaxNameLen   : Cardinal;

  //
  // temp. string
  psServiceName : PChar;
begin
  Result := '';

  // expect a service key
  // name shorter than 255
  // characters
  nMaxNameLen := 255;

  // connect to the service
  // control manager
  schm := OpenSCManager(
    PChar(sMachine),
    Nil,
    SC_MANAGER_CONNECT);

  // if successful...
  if(schm > 0)then
  begin
    psServiceName :=
      StrAlloc(nMaxNameLen+1);

    if(nil <> psServiceName)then
    begin
      if( GetServiceKeyName(
        schm,
        PChar(sServiceDispName),
        psServiceName,
        nMaxNameLen) )then
      begin
        psServiceName
          [nMaxNameLen] := #0;

        Result :=
          StrPas( psServiceName );
      end;

      StrDispose(psServiceName);
    end;

    // close service control
    // manager handle
    CloseServiceHandle(schm);
  end;
end;

//
// start service
//
// return TRUE if successful
//
// sMachine:
//   machine name, ie: \SERVER
//   empty = local machine
//
// sService
//   service name, ie: Alerter
//
function ServiceStart(sMachine,sService : string ) : boolean;
var
  //
  // service control
  // manager handle
  schm,
  //
  // service handle
  schs   : SC_Handle;
  //
  // service status
  ss     : TServiceStatus;
  //
  // temp char pointer
  psTemp : PChar;
  //
  // check point
  dwChkP : DWord;
begin
  ss.dwCurrentState := 0;

  // connect to the service
  // control manager
  schm := OpenSCManager(
    PChar(sMachine),
    Nil,
    SC_MANAGER_CONNECT);

  // if successful...
  if(schm > 0)then
  begin
    // open a handle to
    // the specified service
    schs := OpenService(
      schm,
      PChar(sService),
      // we want to
      // start the service and
//      READ_CONTROL or WRITE_DAC
      SERVICE_START or SERVICE_QUERY_STATUS or SC_MANAGER_ALL_ACCESS
//      or
      // query service status
//      SERVICE_QUERY_STATUS)

);
    // if successful...
    if(schs > 0)then
    begin
      psTemp := Nil;
      if(StartService(
           schs,
           0,
           psTemp))then
      begin
        // check status
        if(QueryServiceStatus(
             schs,
             ss))then
        begin
          while(SERVICE_RUNNING
            <> ss.dwCurrentState)do
          begin
            //
            // dwCheckPoint contains a
            // value that the service
            // increments periodically
            // to report its progress
            // during a lengthy
            // operation.
            //
            // save current value
            //
            dwChkP := ss.dwCheckPoint;

            //
            // wait a bit before
            // checking status again
            //
            // dwWaitHint is the
            // estimated amount of time
            // the calling program
            // should wait before calling
            // QueryServiceStatus() again
            //
            // idle events should be
            // handled here...
            //
            Sleep(ss.dwWaitHint);

            if(not QueryServiceStatus(
                 schs,
                 ss))then
            begin
              // couldn't check status
              // break from the loop
              break;
            end;

            if(ss.dwCheckPoint <
              dwChkP)then
            begin
              // QueryServiceStatus
              // didn't increment
              // dwCheckPoint as it
              // should have.
              // avoid an infinite
              // loop by breaking
              break;
            end;
          end;
        end;
      end;

      // close service handle
      CloseServiceHandle(schs);
    end;
    // close service control
    // manager handle
    CloseServiceHandle(schm);
  end;

  // return TRUE if
  // the service status is running
  Result :=
    SERVICE_RUNNING =
      ss.dwCurrentState;
end;

function processExists(exeFileName: string): Boolean;
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

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(
                        OpenProcess(PROCESS_TERMINATE,
                                    BOOL(0),
                                    FProcessEntry32.th32ProcessID),
                                    0));
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function GetMD5HashCode(const Input: string): string;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array [0 .. $7F] of Byte;
  dwHashBytes: Cardinal;
  pbContent: PByte;
  i: Integer;
begin
  dwHashBytes := 16;
  pbContent := Pointer(PChar(Input));
  Result := '';
  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL,
    CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input) * sizeof(char), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashBytes, 0) then
        begin
          for i := 0 to dwHashBytes - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;
    CryptReleaseContext(hCryptProvider, 0);
  end;
  Result := AnsiLowerCase(Result);
end;

procedure TTSS_Runner_Mainform.Gesturecheck;
begin
  LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Gesture Eingabe Beginn');
  if Fileexists('C:\TSS\Config\TSS_FE.DBG') then begin
    LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Gesture Abbruch da DBG vorhanden');
    GestureLed.OnColor:=clYellow;
    GestureLed.LedOn:=true;
    GestureLed.Repaint;
    TSS_FE_Runner_Dataform.GestureDone:=true;
    TSS_FE_Runner_Dataform.GestureValidtime:=60;
  end else begin
    EnteredPassword:='';
    imgDrawConnectionLine.Canvas.FillRect(TRect.Create(0,0,imgDrawConnectionLine.width,imgDrawConnectionLine.height));
    Gesturewindow.visible:=true;
  end;
end;

procedure TTSS_Runner_Mainform.GestureLedClick(Sender: TObject);
begin
  if (TSS_FE_Runner_Dataform.GestureValidtime>10) then begin
    TSS_FE_Runner_Dataform.GestureValidtime:=600;
    LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Gesture Gueltigkeit verlaengert');
  end;
end;

function TTSS_Runner_Mainform.GetColorat(x,y:word):Tcolor;
var
  Locked: Boolean;
  Canvas: TCanvas;
  R2,R: TRect;
  clr:Tcolor;
  Resultb:TBitmap;
begin
  Resultb:= TBitmap.Create;
  Resultb.Width := 10;
  Resultb.Height := 10;
  Canvas := TCanvas.Create;
  Canvas.Handle := GetDC(0);
  Locked := Canvas.TryLock;
  try
    begin
      R := Rect(x-5,y-5,x+5,y+5);
      R2 := Rect(0,10,10,0);
      Resultb.Canvas.CopyRect(R2, Canvas, R);
    end;
  finally
    if Locked then
      Canvas.Unlock;
    ReleaseDC(0, Canvas.Handle);
    Canvas.Free;
  end;
  clr:=Resultb.Canvas.Pixels[5,5];
  resultb.free;
  Result:=clr;
end;

procedure ShellExecute(FileName: string; Params: string);
var
  exInfo: TShellExecuteInfo;
  Ph: DWORD;
begin
  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    Wnd := GetActiveWindow();
    ExInfo.lpVerb := 'open';
    ExInfo.lpParameters := PChar(Params);
    lpFile := PChar(FileName);
    nShow := SW_SHOWNORMAL;
  end;
  if ShellExecuteEx(@exInfo) then
    Ph := exInfo.HProcess
  else
  begin
    ShowMessage(SysErrorMessage(GetLastError));
    Exit;
  end;
end;

procedure TTSS_Runner_Mainform.CheckBox3Click(Sender: TObject);
begin
  if TSS_FE_Runner_Dataform.GestureDone then begin
    CheckBox3.Checked:=not CheckBox3.Checked;
  end;
end;

procedure TTSS_Runner_Mainform.ClockTimer(Sender: TObject);
begin
  label22.Caption:=timetostr(now);
end;


procedure TTSS_Runner_Mainform.dsLed15Click(Sender: TObject);
begin
  if dsled15.OnColor=clMaroon then begin
    dsled15.OffColor:=clred;
    Sheduler.start;
  end else begin
    dsled15.OffColor:=clMaroon;
    Sheduler.stop;
  end;
end;

procedure TTSS_Runner_Mainform.dsLed20Click(Sender: TObject);
begin
  TSS_FE_Runner_Dataform.drawcodeline:=not TSS_FE_Runner_Dataform.drawcodeline;
  dsled20.ledon:=not TSS_FE_Runner_Dataform.drawcodeline;
end;

procedure TTSS_Runner_Mainform.ExitButtonClick(Sender: TObject);
begin
  application.Terminate;
end;

procedure TTSS_Runner_Mainform.FormCreate(Sender: TObject);
begin
  inherited;
  mainstate:=1;
  icons:=Tlist.create;
  RegisterHotKey(Handle, 1, MOD_CONTROL or MOD_ALT, VK_F5);
  RegisterHotKey(Handle, 2, MOD_CONTROL or MOD_ALT, ord('D'));
  RegisterHotKey(Handle, 3, MOD_SHIFT, ord('D'));
  Sheduler:=TTSS_Scheduler.create;
  Sheduler.StatusLed:=dsled15;
  sheduler.OnTask:=OnSeheduler;
  Sheduler.start;
end;

procedure TTSS_Runner_Mainform.FormDeactivate(Sender: TObject);
begin
  FMoveControl := nil;
end;

procedure TTSS_Runner_Mainform.FormDestroy(Sender: TObject);
begin
  Freeandnil(icons);
  Sheduler.free;
  UnRegisterHotKey(Handle, 0)
end;

procedure TTSS_Runner_Mainform.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  I: Integer;
begin
  // Check if there is a control under X, Y
  FMoveControl := nil;
  for I := 0 to ControlCount - 1 do
  begin
    if (Controls[I].Name = 'Runpanel') or (Controls[I].Name = 'Icon1') then
    begin
      if (Controls[I].Left <= X) and (Controls[I].Top <= Y) and
         ((Controls[I].Left + Controls[I].Width) >= X) and ((Controls[I].Top + Controls[I].Height) >= Y) then
      begin
        FMoveControl := Controls[I];
        break;
      end;
    end;
  end;
  if Assigned(FMoveControl) then
  begin
    FStartLeft := FMoveControl.Left;
    FStartTop := FMoveControl.Top;
    FStartX := X;
    FStartY := Y;
  end;
end;

procedure TTSS_Runner_Mainform.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(FMoveControl) then
  begin
    FMoveControl.Left := FStartLeft + (X - FStartX);
    FMoveControl.Top := FStartTop + (Y - FStartY);
  end;
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

procedure TTSS_Runner_Mainform.DoCheckShell;
begin
  if TSS_FE_Runner_Dataform.Shellmode then begin
    dsled22.OnColor:=clyellow;
    dsled22.LedOn:=true;
    if GetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell')='C:\TSS\Frontend\TSS_FE.exe' then begin
      dsled22.Hint:='Shellmode in Config : ON .. und in Registry gefunden ... OK';
      dsled22.ShowHint:=true;
      dsled22.OnColor:=cllime;
      dsled22.LedOn:=true;
    end else begin
      SetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell','C:\TSS\Frontend\TSS_FE.exe');
      dsled22.OnColor:=clblue;
      dsled22.Hint:='Shellmode in Config : ON .. aber nicht in Registry gefunden ... gesetzt';
      dsled22.ShowHint:=true;
      dsled22.LedOn:=true;
    end;
    if processExists('explorer.exe') then dsled23.Oncolor:=clblue else dsled23.Oncolor:=cllime;
  end else begin
    dsled22.LedOn:=false;
    if GetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell')='C:\TSS\Frontend\TSS_FE.exe' then begin
      dsled22.OnColor:=clgreen;
      dsled22.Hint:='Shellmode in Config : OFF .. aber Registry gefunden ... zurückgesetzt';
      dsled22.ShowHint:=true;
      SetRegistryValue(HKEY_CURRENT_USER,'\Software\Microsoft\Windows NT\CurrentVersion\Winlogon','Shell','Explorer.exe');
      dsled22.LedOn:=true;
    end else begin
      dsled22.OnColor:=clyellow;
      dsled22.Hint:='Shellmode in Config : OFF .. und nicht in Registry gefunden ... OK';
      dsled22.ShowHint:=true;
      dsled22.LedOn:=False;
    end;
  end;
end;

function TTSS_Runner_Mainform.checkInternet : boolean;
  var
     origin : cardinal;
  begin
     if not InternetGetConnectedState(@origin,0) then begin
       dsled28.OnColor:=clred;
       dsled28.LedOn:=true;
       dsled28.repaint;
     end else begin
       if origin= 1 then begin                   //Local system uses a modem to connect to the Internet.
         dsled28.OnColor:=clyellow;
         dsled28.LedOn:=true;
         dsled28.repaint;
       end else
       if origin= 2 then begin                  //Local system uses a local area network to connect to the Internet.
         dsled28.OnColor:=clOlive;
         dsled28.LedOn:=true;
         dsled28.repaint;
       end else
       if origin=16 then begin                  //Local system has RAS installed.
         dsled28.OnColor:=clDkGray;
         dsled28.LedOn:=true;
         dsled28.repaint;
       end else
       if origin= 17 then begin                 // 16 + 1
         dsled28.OnColor:=clgreen;
         dsled28.LedOn:=true;
         dsled28.repaint;
       end else
       if origin= 18 then begin                // 16 + 2
         dsled28.OnColor:=cllime;
         dsled28.LedOn:=true;
         dsled28.repaint;
       end else
       if origin=32 then begin                  //Local system is in offline mode.
         dsled28.OnColor:=clBlack;
         dsled28.LedOn:=true;
         dsled28.repaint;
       end else
       if origin=64 then begin                  //Local system has a valid connection to the Internet, but it might or might not be currently connected.
         dsled28.OnColor:=clBlue;
         dsled28.LedOn:=true;
         dsled28.repaint;
       end;
     end;

     result := InternetGetConnectedState(@origin,0);

     //connections origins by origin value
     //NO INTERNET CONNECTION              = 0;
     //INTERNET_CONNECTION_MODEM           = 1;
     //INTERNET_CONNECTION_LAN             = 2;
     //INTERNET_CONNECTION_PROXY           = 4;
     //INTERNET_CONNECTION_MODEM_BUSY      = 8;
  end;


function TTSS_Runner_Mainform.ChangeResolution(XResolution, YResolution, Depth: DWORD): BOOL;
var
  DevMode: TDeviceMode;
  i: Integer;
begin
  Result := False;
  i      := 0;
  while EnumDisplaySettings(nil, i, DevMode) do begin
    LogLine(3,'                Display : '+inttostr(i)+' '+inttostr(DevMode.dmPelsWidth)+' '+inttostr(DevMode.dmPelsHeight));
    with DevMode do begin
      if (dmPelsWidth = XResolution) and (dmPelsHeight = YResolution) and (dmBitsPerPel = Depth) then begin
        LogLine(3,'                Auflösung vorhanden');
        if ChangeDisplaySettings(DevMode, CDS_UPDATEREGISTRY) = DISP_CHANGE_SUCCESSFUL then begin
          Result := True;
          SendMessage(HWND_BROADCAST, WM_DISPLAYCHANGE, SPI_SETNONCLIENTMETRICS, 0);
        end;
        Break;
      end;
    end;
    Inc(i);
  end;
end;



procedure TTSS_Runner_Mainform.readCFgIni;
var
    IniPl:TInifile;a,iconcount:worD;Testicon:Timage;Icon:TSS_OS_IconClass;
  I: Integer;Rzp:TEZTexturePanel;CommandAktiv,iconfound,Autorunfound:boolean;CommandTyp,Command,CommandParameter:String;
begin
    if fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_init.ini') then begin
      IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_init.ini');
    end else begin
      if fileexists(Paramstr(0)[1]+':\TSS\Config\TSS_FE_init.ini') then begin
        IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Config\TSS_FE_init.ini');
      end else begin
        Messagedlg('Es wurde keine TSS_FE ini-Datei gefunden !'#13#10#13#10'Bitte Hauptprogramm einmal manuell starten um Standard anzulegen',TMsgDlgType.mtInformation,[mbok],0);
        application.Terminate;
      end;
    end;
    TSS_FE_Runner_Dataform.CfgInifile:=IniPl.FileName;
    TSS_FE_Runner_Dataform.DisplayID:=IniPl.ReadString('Common','SchematicID','unbekannt');
    if TSS_FE_Runner_Dataform.DisplayID='' then begin
      MessageDlg('Keine SchematicID in der INI '#13#10#13' Abbruch !',mterror,[mbok],0);
      Application.Terminate;
    end;
    TSS_FE_Runner_Dataform.Debugmode:=IniPl.ReadBool('Debug','Debugmode',False) or FileExists(Paramstr(0)[1]+':\TSS\Config\TSS_FE.DBG');
    //MainDisplayForm.DebugLed.LedOn:=DataForm.Debugmode;

    TSS_FE_Runner_Dataform.DisplayScreen:=IniPl.ReadInteger('Common','DisplayScreen',1)-1;
    TSS_FE_Runner_Dataform.Shellmode:=IniPl.ReadBool('Common','UseShellMode',False);
    TSS_Runner_Mainform.left:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Left;
    TSS_Runner_Mainform.top:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].top;
    TSS_Runner_Mainform.width:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Width;
    TSS_Runner_Mainform.Height:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Height;
    TSS_Runner_Mainform.Resize;
    LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Bildschirm Information !');
    LogLine(3,'                Links  : '+inttostr(Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Left));
    LogLine(3,'                Oben   : '+inttostr(Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].top));
    LogLine(3,'                Breite : '+inttostr(Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].width));
    LogLine(3,'                Höhe   : '+inttostr(Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].height));
    TSS_FE_Runner_Dataform.MainPath:=IniPl.ReadString('Common','BasePath','');
    TSS_FE_Runner_Dataform.DoScreenshot:=IniPl.ReadBool('Remote','DoScreenshot',False);
    {9E956F70-BA7A-4F99-A2DE-889867C511D0}
    IniPl.free;
    if fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_OS_init.ini') then begin
      IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_OS_init.ini');
    end else begin
      if fileexists(Paramstr(0)[1]+':\TSS\Config\TSS_OS_init.ini') then begin
        IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Config\TSS_OS_init.ini');
      end else begin
        Messagedlg('Keine OS System ini-Datei gefunden !'#13#10#13#10'Das Betriebssystem wird ohne Einstellungen gestartet'#13#10'Bitte manuell einstellen und speichern !',TMsgDlgType.mtInformation,[mbok],0);
      end;
    end;
    if IniPl<>nil then begin
      TSS_FE_Runner_Dataform.autorunsystem:=IniPl.ReadBool('Common','AutoRunSystem',True);
      TSS_FE_Runner_Dataform.EnigneEXE:=IniPl.ReadString('Common','EngineEXE','C:\TSS\WebTemp\Engine\TSS_FE_Engine.exe');
      TSS_FE_Runner_Dataform.settings_rundetect_posx:=IniPl.ReadInteger('Common','RunDetectPosx',1000);
      TSS_FE_Runner_Dataform.settings_rundetect_posy:=IniPl.ReadInteger('Common','RunDetectPosy',500);
      TSS_FE_Runner_Dataform.settings_rundetect_MaxFail:=IniPl.ReadInteger('Common','RunDetectMaxFail',20);
      TSS_FE_Runner_Dataform.settings_rundetect_doReboot:=IniPl.ReadBool('Common','RunDetectDoReboot',True);
      TSS_FE_Runner_Dataform.settings_Blackdetect_posx1:=IniPl.ReadInteger('Common','BlackDetectPosx1',1000);
      TSS_FE_Runner_Dataform.settings_Blackdetect_posy1:=IniPl.ReadInteger('Common','BlackDetectPosy1',500);
      TSS_FE_Runner_Dataform.settings_Blackdetect_posx2:=IniPl.ReadInteger('Common','BlackDetectPosx2',1000);
      TSS_FE_Runner_Dataform.settings_Blackdetect_posy2:=IniPl.ReadInteger('Common','BlackDetectPosy2',500);
      TSS_FE_Runner_Dataform.settings_Blackdetect_MaxFail:=IniPl.ReadInteger('Common','BlackDetectMaxFail',20);
      TSS_FE_Runner_Dataform.settings_Blackdetect_doReboot:=IniPl.ReadBool('Common','BlackDetectDoReboot',True);
      TSS_FE_Runner_Dataform.ForceScreen_W:=IniPl.ReadInteger('Common','ForceScreen_W',1920);
      TSS_FE_Runner_Dataform.ForceScreen_H:=IniPl.ReadInteger('Common','ForceScreen_H',1080);
      TSS_FE_Runner_Dataform.ForceScreen:=IniPl.ReadBool('Common','ForceScreen',False);
      if TSS_FE_Runner_Dataform.ForceScreen then begin
        LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Bildschirmauflösung Setzen !');
        LogLine(3,'                Breite : '+inttostr(TSS_FE_Runner_Dataform.ForceScreen_W));
        LogLine(3,'                Höhe   : '+inttostr(TSS_FE_Runner_Dataform.ForceScreen_H));
        if ChangeResolution(TSS_FE_Runner_Dataform.ForceScreen_W, TSS_FE_Runner_Dataform.ForceScreen_H, 32) then begin
          LogLine(3,'                Erfolgreich !');
        end else begin
          LogLine(3,'                Fehlerhaft !');
        end;
      end;
      TSS_FE_Runner_Dataform.SystemID:=IniPl.ReadString('Common','SystemID','DIID:'+TSS_FE_Runner_Dataform.DisplayID);
      DisplayID.Text:=TSS_FE_Runner_Dataform.SystemID;
      TSS_FE_Runner_Dataform.UDPLevel:=IniPl.ReadInteger('RemoteLog','UDPLogLevel',0);
      TSS_FE_Runner_Dataform.UDPLogPort:=IniPl.Readinteger('RemoteLog','UDPLogPort',9800);
      TSS_FE_Runner_Dataform.UDPLogserver:=IniPl.ReadString('RemoteLog','UDPLogserver','');
      UDPLogsend.Checked:=(TSS_FE_Runner_Dataform.UDPLevel>0);
      UDPLogLevel.text:=inttostr(TSS_FE_Runner_Dataform.UDPLevel);
      UDPServerAdress.text:=TSS_FE_Runner_Dataform.UDPLogserver;
      UDPPort.text:=inttostr(TSS_FE_Runner_Dataform.UDPLogPort);
      TSS_FE_Runner_Dataform.TCPInterval:=IniPl.ReadInteger('RemoteLog','TCPInterval',0);
      TSS_FE_Runner_Dataform.TCPPort:=IniPl.Readinteger('RemoteLog','TCPPort',9800);
      TSS_FE_Runner_Dataform.TCPServer:=IniPl.ReadString('RemoteLog','TCPServer','');
      TCPServerCheck.Checked:=(TSS_FE_Runner_Dataform.TCPInterval>0);
      TCPCheckInterval.text:=inttostr(TSS_FE_Runner_Dataform.TCPInterval);
      TCPServerAdress.text:=TSS_FE_Runner_Dataform.TCPServer;
      TCPPort.text:=inttostr(TSS_FE_Runner_Dataform.TCPPort);
      IdUDPClient1.Port:=TSS_FE_Runner_Dataform.UDPLogPort;
      IdUDPClient1.Host:=TSS_FE_Runner_Dataform.UDPLogserver;
      UDPConnected:=False;
      if checkInternet then begin
        Try
          IdUDPClient1.connect;
        Finally
          UDPConnected:=true;
        End;
      end;
      i:=1;
      iconfound:=IniPl.ReadString('Icon'+inttostr(i),'Image','none')<>'none';
      while IconFound do begin
        Icon:=TSS_OS_IconClass.Create(self);
        icon.IconName:='Icon'+inttostr(i);
        icon.parent:=self;
        icon.show;
        icon.left:=10;
        icon.top:=10;
        icon.loadIcon;
        icon.OnMouseup:=IconMouseUp;
        icons.add(icon);
        if icon.ActionCommand='StaybackBtn' then StaybackIcon:=icon;
        icon.showicon;
        inc(i);
        iconfound:=IniPl.ReadString('Icon'+inttostr(i),'Image','none')<>'none';
      end;
    end;
end;

procedure TTSS_Runner_Mainform.ReStayBackTimerTimer(Sender: TObject);
begin
  ReStayBackTimer.enabled:=false;
  Stayback:=true;
  StaybackByMsg:=false;
  if StaybackIcon<>nil then StaybackIcon.LBT.Caption:='beenden';
  LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : StayBack Timer executed');
  LogLine(3,'                Stop StayBack beendet!');
end;

procedure TTSS_Runner_Mainform.FormMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FMoveControl := nil;
end;

procedure TTSS_Runner_Mainform.FormShow(Sender: TObject);
begin
  readCFgIni;
  Timer1.enabled:=true;
  StartRunTimer.enabled:=true;
  Stayback:=true;
  StaybackByMsg:=false;
  LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Programmstart erfolgreich !');
  LogLine(3,'                StayBack aktiviert !');
  Logpanel.Left:=TSS_Runner_Mainform.Width-Logpanel.Width;
  PW2Window.Left:=TSS_Runner_Mainform.Width-PW2Window.Width;
end;

procedure TTSS_Runner_Mainform.IconMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ActionCommand: string;
    Actiontype: string;
    ActionOption: string;

begin
  Actiontype:=TSS_OS_IconClass(TWincontrol(sender).owner).Actiontype;
  ActionCommand:=TSS_OS_IconClass(TWincontrol(sender).owner).ActionCommand;
  ActionOption:=TSS_OS_IconClass(TWincontrol(sender).owner).ActionOption;
  LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : IconClick '+TSS_OS_IconClass(TWincontrol(sender).owner).LabelTop.caption+' '+TSS_OS_IconClass(TWincontrol(sender).owner).LBT.caption);
  if TSS_FE_Runner_Dataform.GestureDone then begin
    if actiontype='Intern' then begin
      if ActionCommand='StartSystem' then begin
        StartEngine(true);
        Mainstate:=1;
      end else
      if ActionCommand='KillSystem' then begin
        KillTask('TSS_FE_Engine.exe');
        Mainstate:=99;
      end else
      if ActionCommand='OpenCFG' then begin
        TSS_FE_Runner_Settingsform.Showmodal;
      end else
      if ActionCommand='StaybackBtn' then begin
        if not StaybackByMsg then begin
          if Stayback then begin
            Stayback:=false;
            StaybackByMsg:=false;
            TSS_OS_IconClass(TWincontrol(sender).owner).LBT.caption:='aktivieren';
            LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : StayBack Stop Icon gedrückt');
            LogLine(3,'                Stop StayBack permanent in der Session !');
          end else begin
            Stayback:=True;
            StaybackByMsg:=false;
            TSS_OS_IconClass(TWincontrol(sender).owner).LBT.caption:='beenden';
            LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : StayBack Stop Icon gedrückt');
            LogLine(3,'                StayBack wieder permanent in der Session !');
          end;
        end else begin
          ReStayBackTimer.enabled:=false;
          Stayback:=false;
          StaybackByMsg:=false;
          TSS_OS_IconClass(TWincontrol(sender).owner).LBT.caption:='aktivieren';
          LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : StayBack Stop Icon gedrückt');
          LogLine(3,'                Stop StayBack nun permanent in der Session !');
        end;
      end else ShowMessage(ActionCommand);
    end else
    if actiontype='extern_run' then begin
      shellAPi.ShellExecute(Handle,'open', PChar(ActionCommand) , Pchar(ActionOption) , nil, SW_NORMAL);
    end;
  end else Gesturecheck;
end;

procedure TTSS_Runner_Mainform.IdUDPClient1Connected(Sender: TObject);
begin
  UDPConnected:=true;
end;

procedure TTSS_Runner_Mainform.IdUDPClient1Disconnected(Sender: TObject);
begin
  UDPConnected:=False;
end;

procedure TTSS_Runner_Mainform.Image12MouseLeave(Sender: TObject);
begin
  SYSWindow1.hide;
end;

procedure TTSS_Runner_Mainform.Image14Click(Sender: TObject);
begin
  if TSS_FE_Runner_Dataform.GestureDone then begin
  end else Gesturecheck;
end;

procedure TTSS_Runner_Mainform.Image15Click(Sender: TObject);
begin
  if TSS_FE_Runner_Dataform.GestureDone then begin
    shellAPi.ShellExecute(Handle,'open', 'regedit.exe', '', nil, SW_NORMAL);
  end else Gesturecheck;
end;

procedure TTSS_Runner_Mainform.Image1Click(Sender: TObject);
begin
//  mouse_event( MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE,  SYSWindow1.top+100, SYSWindow1.left+100, 0,   0);
  if TSS_FE_Runner_Dataform.GestureDone then begin
    SYSWindow1.top:=TSS_Runner_Mainform.top+EsPanel1.top+Image1.top-SYSWindow1.height-20;
    SYSWindow1.show;
  end else Gesturecheck;
end;

procedure TTSS_Runner_Mainform.Image4Click(Sender: TObject);
begin
  if logpanel.left<(Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Width-30) then begin
    logpanel.left:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Width-25;
    logpanel.top:=(Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].height-30)-580;
    logpanel.Width:=25;
    LogPanel.Height:=520;
  end else begin
    logpanel.left:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Width-825;
    logpanel.top:=(Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].height-30)-580;
    logpanel.Width:=825;
    LogPanel.Height:=520;
  end;

end;

procedure TTSS_Runner_Mainform.Image8Click(Sender: TObject);
begin
  if TSS_FE_Runner_Dataform.GestureDone then begin
  end else Gesturecheck;
end;

procedure TTSS_Runner_Mainform.Image9Click(Sender: TObject);
begin
  if TSS_FE_Runner_Dataform.GestureDone then begin
    shellAPi.ShellExecute(Handle,'open', 'control', '', nil, SW_NORMAL);
  end else Gesturecheck;
end;

procedure TTSS_Runner_Mainform.Img0Click(Sender: TObject);
begin
  Img0MouseEnter(sender);
end;

procedure TTSS_Runner_Mainform.Img0MouseEnter(Sender: TObject);
var
  LineArea: Array [0 .. 15] of TAllowedCircles;
begin
  // Allowed circles that each circle can access them
  LineArea[0] := [1, 4, 5];
  LineArea[1] := [0, 2, 4, 5, 6];
  LineArea[2] := [1, 3, 5, 6, 7];
  LineArea[3] := [2, 6, 7];
  LineArea[4] := [0, 1, 5, 8, 9];
  LineArea[5] := [0, 1, 2, 4, 6, 8, 9, 10];
  LineArea[6] := [1, 2, 3, 5, 7, 9, 10, 11];
  LineArea[7] := [2, 3, 6, 10, 11];
  LineArea[8] := [4, 5, 9, 12, 13];
  LineArea[9] := [4, 5, 6, 8, 10, 12, 13, 14];
  LineArea[10] := [5, 6, 7, 9, 11, 13, 14, 15];
  LineArea[11] := [6, 7, 10, 14, 15];
  LineArea[12] := [8, 9, 13];
  LineArea[13] := [8, 9, 10, 12, 14];
  LineArea[14] := [9, 10, 11, 13, 15];
  LineArea[15] := [10, 11, 14];
  // Draw line between 2 circles
  if Clicked then
    if TImage(Sender).Tag in LineArea[LastImg] then
    begin
      Circle2 := TImage(Sender);
      LastImg := Circle2.Tag;
      // Assign tag of image that mouse cursor move on it to EnteredPassword variable
      EnteredPassword := EnteredPassword + ',' + IntToStr(Circle2.Tag);
      if TSS_FE_Runner_Dataform.drawcodeline then imgDrawConnectionLine.Canvas.LineTo(Circle2.Left + 32, Circle2.Top + 15);
    end;
  // Check if EnteredPassword = CurrentPassword then show setting form
  if (Trim(GetMD5HashCode(EnteredPassword)) = Trim('d03c5457c931ca488928899d5cc3833a')) or   (CurrentPassword = 'lm2020#TSS') then begin
     LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Gesture Eingabe gueltig');
     TSS_FE_Runner_Dataform.GestureDone:=true;
     TSS_FE_Runner_Dataform.GestureValidtime:=60;
     EnteredPassword:='';
     Gesturewindow.hide;
  end else
  if length(EnteredPassword)>34 then begin
     LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Gesture Eingabe ungueltig');
     EnteredPassword:='';
     Gesturewindow.hide;
  end;
end;


procedure TTSS_Runner_Mainform.img12DblClick(Sender: TObject);
begin
  // Check line most draw between 2 circle or no ?
  if Clicked = True then
    Clicked := False
  else
  begin
    Clicked := True;
    // Load black background to imgDrawConnectionLine
    imgDrawConnectionLine.Picture.Assign(imgBlackBackground.Picture);
    // Set connection line color & width
    imgDrawConnectionLine.Canvas.Pen.Color := RGB(0, 230, 0);;
    imgDrawConnectionLine.Canvas.Pen.Width := 20;
    // Assgin curent selected image to Circle1 variable
    Circle1 := TImage(Sender);
    // Set LastImg with current image tag
    LastImg := Circle1.Tag;
    // Assign tag value of selected image to EnteredPassword variable
    EnteredPassword := IntToStr(Circle1.Tag);
    // Move canvas pointer to current image that mouse cursor is on it
    imgDrawConnectionLine.Canvas.MoveTo(Circle1.Left + 32, Circle1.Top + 32);
  end;
end;

procedure TTSS_Runner_Mainform.JppPngButton1Click(Sender: TObject);
var canexit:boolean;
begin
  if processExists('TSS_FE_Engine.exe') then begin
    if MessageDlg('Hauptprogramm noch am laufen, Basissystem trotzdem beenden ?',mtConfirmation,mbYesNo,0)=mryes then begin
      if MessageDlg('Hauptprogramm mit beenden ?',mtConfirmation,mbYesNo,0)=mryes then begin
        KillTask('TSS_FE_Engine.exe');
        Mainstate:=99;
      end;
      canexit:=true;
    end;
  end else canexit:=true;
  if canexit then application.terminate;
end;

procedure TTSS_Runner_Mainform.JppPngButton2Click(Sender: TObject);
begin
  if TSS_FE_Runner_Dataform.GestureDone then begin
    helpform.showmodal;
    //Hilfepanel.visible:=not Hilfepanel.visible;
  end else Gesturecheck;
end;

procedure TTSS_Runner_Mainform.JppPngButton3Click(Sender: TObject);
begin
  SYSWindow1.hide;
  TSS_FE_Toolboxform.showmodal;
end;

procedure TTSS_Runner_Mainform.JppPngButton4Click(Sender: TObject);
begin
  if TSS_FE_Runner_Dataform.GestureDone then begin
    MyExitWindows(EWX_REBOOT or EWX_FORCE);
  end else Gesturecheck;
end;

procedure TTSS_Runner_Mainform.LogLine(Log:word;s: string);
begin
  if checkInternet then begin
    Try
      IdUDPClient1.connect;
    Finally
      UDPConnected:=true;
    End;
  End else begin
    UDPConnected:=False;
  end;
  if Log=3 then begin
    if (TSS_FE_Runner_Dataform.UDPLevel>=1) and UDPConnected then begin
      IdUDPClient1.Send('TSS_OS:['+TSS_FE_Runner_Dataform.SystemID+']://'+s);
    end;
    OSLogMemo.lines.add(s);
  end else
  if Log=2 then begin
    if (TSS_FE_Runner_Dataform.UDPLevel>=2) and UDPConnected then begin
      IdUDPClient1.Send('TSS_VIDEO:['+TSS_FE_Runner_Dataform.SystemID+']://'+s);
    end;
    LogMemo.lines.add(s);
  end else
  if Log=1 then begin
    if (TSS_FE_Runner_Dataform.UDPLevel>=3) and UDPConnected then begin
      IdUDPClient1.Send('TSS_ENGINE:['+TSS_FE_Runner_Dataform.SystemID+']://'+s);
    end;
    StdLogMemo.lines.add(s);
  end;
end;

procedure TTSS_Runner_Mainform.MainTimerTimer(Sender: TObject);
var _hwnd:HWND;
begin
  MainTimer.enabled:=false;
  dsled20.ledon:=not TSS_FE_Runner_Dataform.drawcodeline;
  _hwnd:=TSS_FE_Runner_Dataform.FindWindowByTitle('TSS_Engine_Mainform');
  SendMessage(_hWnd, WM_OURMESSAGE, Handle, $990);
  dsLed25.LedOn:=not dsLed25.LedOn;
  dsLed25.Repaint;
  if Mainstate=1 then begin
    InfoLabel1.caption:='Programm wird geladen !';
    InfoLabel2.Caption:='Bitte warten';
    Mainstate:=101;
  end else
  if Mainstate=101 then begin
    if processExists('TSS_FE_Engine.exe') then begin
      PW1Window.hide;
      PW2Window.Show;
      Statecheckdone:=true;
      prozesscheckdone:=true;
      Watchdog_MainTimer.enabled:=true;
      Mainstate:=2;
    end;
  end else
  if Mainstate=2 then begin
    if Stayback then TSS_Runner_Mainform.SendToBack;
  end else
  if Mainstate=99 then begin
    InfoLabel1.caption:='Hauptprogramm beendet!';
    InfoLabel2.Caption:='Bitte System/Programm neu starten';
    PW1Window.show;
    PW2Window.hide;
  end;
  if TSS_FE_Runner_Dataform.GestureValidtime>0 then TSS_FE_Runner_Dataform.GestureValidtime:=TSS_FE_Runner_Dataform.GestureValidtime-1;
  if TSS_FE_Runner_Dataform.GestureValidtime>60 then begin
    GestureLed.OnColor:=clblue;
    GestureLed.LedOn:=true;
  end else
  if TSS_FE_Runner_Dataform.GestureValidtime>10 then begin
    GestureLed.OnColor:=cllime;
    GestureLed.LedOn:=true;
  end else
  if (TSS_FE_Runner_Dataform.GestureValidtime<10) and (TSS_FE_Runner_Dataform.GestureValidtime>0) then begin
    GestureLed.OnColor:=clyellow;
    GestureLed.LedOn:=true;
  end else begin
    SYSWindow1.Hide;
    CheckBox3.Checked:=TSS_FE_Runner_Dataform.Prozessrestart;
    GestureLed.LedOn:=false;
    TSS_FE_Runner_Dataform.GestureDone:=false;
  end;
  MainTimer.enabled:=True;
end;

(*
var a:word;F:TextFile;Standort,FName,SF,S3,S2,S1:String;IniPl:Tinifile;
begin
  starttimer.Enabled:=false;
  if not fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_init.ini',true) then begin
    if not fileexists(Paramstr(0)[1]+':\TSS\Config\TSS_FE_init.ini') then begin
      Messagedlg('Es wurde keine ini-Datei gefunden !',TMsgDlgType.mtError,[mbok],0);
      application.terminate;
    end;
  end;
  if fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_init.ini') then begin
    AssignFile(F,Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_Init.ini');
  end else begin
    AssignFile(F,Paramstr(0)[1]+':\TSS\Config\TSS_FE_Init.ini');
  end;
  Reset(f);
  readln(F,SF);
  CloseFile(f);
  if SF<>'[Common]' then begin
    if fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_init.ini') then begin
      AssignFile(F,Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_Init.ini');
    end else begin
      AssignFile(F,Paramstr(0)[1]+':\TSS\Config\TSS_FE_Init.ini');
    end;
    Reset(f);
    readln(F,S2);
    SF:=copy(SF,1,pos(' ',SF)-1);
    Label6.caption:=SF;
    LAbel6.Repaint;
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    DataForm.MainPath:=s2;
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    //DataForm.ButtonsAktiv:=(s2='TRUE');
    readln(F,S2);
    S3:=copy(S2,1,pos(' ',S2)-1);
    CloseFile(f);
  end else
  if SF='[Common]' then begin
    if fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_init.ini') then begin
      IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_FE_init.ini');
    end else begin
      if fileexists(Paramstr(0)[1]+':\TSS\Config\TSS_FE_init.ini') then begin
        IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Config\TSS_FE_init.ini');
      end else begin
        Messagedlg('Es wurde keine ini-Datei gefunden !',TMsgDlgType.mtError,[mbok],0);
        application.terminate;
      end;
    end;
    Label6.caption:=IniPl.ReadString('Common','SchematicID','');
    Label6.Repaint;
    s3:=IniPl.ReadString('Remote','HomeServer','logumedia-content.de');
    try
      IdTCPClient1.Host:=S3;
      IdTCPClient1.Port:=9800;
      IdTCPClient1.Connect;
      dsLed6.OnColor:=cllime;
      dsLed6.LedOn:=true;
    except
      on e:exception do begin
        dsLed6.OnColor:=clred;
        dsLed6.LedOn:=true;
      end;
    end;
  end;
  IniPl.Free;
  IniPl:=nil;
  if not fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_MM_init.ini',true) then begin
    if not fileexists(Paramstr(0)[1]+':\TSS\Config\TSS_MM_init.ini') then begin
    end else begin
      IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Config\TSS_MM_init.ini');
    end;
  end else begin
    IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_MM_init.ini');
  end;
  if IniPl<>nil then begin
    DataForm.MinerAuto:=IniPl.ReadBool('Miner','MinerAutoStart',False);
    DataForm.MinerPath:=IniPl.ReadString('Miner','MinerPath','C:\TSS\');
    DataForm.MinerExe:=IniPl.ReadString('Miner','MinerExe','miner.exe');
    DataForm.MinerParams:=IniPl.ReadString('Miner','MinerParams','');
    IniPl.Free;
    IniPl:=nil;
//    if Dataform.MinerAuto then SpeedButton4.Click;
  end;
  timer1.Enabled:=true;
  Colortimer.Enabled:=true;
  screenshottimer.Enabled:=true;
*)


procedure TTSS_Runner_Mainform.StartEngine(IconStart:boolean = false);
begin
  if fileexists(TSS_FE_Runner_Dataform.EnigneEXE) then begin
    if TSS_FE_Runner_Dataform.AutoRunsystem or IconStart then shellAPi.ShellExecute(Handle,nil,PWidechar(TSS_FE_Runner_Dataform.EnigneEXE), 'C:\TSS\WebTemp\Engine\', nil, SW_SHOWMAXIMIZED);
    Stayback:=true;
    self.SendToBack;
  end else begin
    Infolabel2.Caption:='Engine wird nicht gestartet !';
    Infolabel3.Caption:=TSS_FE_Runner_Dataform.EnigneEXE;
    Stayback:=False;
    Infolabel2.font.color:=clred;
  end;
end;


procedure TTSS_Runner_Mainform.StartRunTimerTimer(Sender: TObject);
var
    IniPl:TInifile;
    TTimerTask:TTask;
    ExeCoptions,StartVar,TimeoutCounter,I: Integer;CommandAktiv,iconfound,Autorunfound:boolean;CommandTyp,Command,CommandParameter,CommandParameter2,SySCommand,Timertime,Timerday,Timertimes:String;
begin
  StartRunTimer.Enabled:=false;
  if fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_OS_init.ini') then begin
    IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_OS_init.ini');
  end else begin
    if fileexists(Paramstr(0)[1]+':\TSS\Config\TSS_OS_init.ini') then begin
      IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Config\TSS_OS_init.ini');
    end else begin
      Messagedlg('Keine OS System ini-Datei gefunden !'#13#10#13#10'Das Betriebssystem wird ohne Einstellungen gestartet'#13#10'Bitte manuell einstellen und speichern !',TMsgDlgType.mtInformation,[mbok],0);
    end;
  end;
  if IniPl<>nil then begin
    LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Programm Start '+Get_This_EXE_Version);
    i:=1;
    Versionlabel.caption:=Get_This_EXE_Version;
    Autorunfound:=IniPl.ReadString('AutoRun'+inttostr(i),'Command','none')<>'none';
    while Autorunfound do begin
      CommandAktiv:=IniPl.ReadBool('AutoRun'+inttostr(i),'Aktiv',False);
      if CommandAktiv then begin
        CommandTyp:=IniPl.ReadString('AutoRun'+inttostr(i),'CommandTyp','none');
        SySCommand:=IniPl.ReadString('AutoRun'+inttostr(i),'SysCommand','');
        ExeCoptions:=IniPl.ReadInteger('AutoRun'+inttostr(i),'OpenOptions',1);
        Command:=IniPl.ReadString('AutoRun'+inttostr(i),'Command','');
        CommandParameter:=IniPl.ReadString('AutoRun'+inttostr(i),'CommandParam','');
        CommandParameter2:=IniPl.ReadString('AutoRun'+inttostr(i),'CommandWaitFor','');
        Timertimes:=IniPl.ReadString('AutoRun'+inttostr(i),'TimerTime','0');
        if Commandtyp='ExeRun' then begin
          LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Programm Start ');
          LogLine(3,'                Programm : '+Command);
          if Timertimes<>'0' then begin
             timertime:=timetostr(now+strtotime(Timertimes));
             timerday:='99';
             LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Verzoegerter Programm Start ');
             LogLine(3,'                Befehl : '+Command+' '+CommandParameter+' mittels '+SySCommand);
             LogLine(3,'                Verzögerung : '+Timertimes+' '+timertime);
             LogLine(3,'                Ausführung : '+timetostr(Strtotime(Timertime)));
             TTimerTask:=Sheduler.Addtask;
             TTimerTask.id:='AutoRun'+inttostr(i);
             TTimerTask.time:=Strtotime(Timertime);
             if Timerday='0' then TTimerTask.day:=0 else TTimerTask.day:=Strtoint(Timerday);
             TTimerTask.SysCommand:=SySCommand;
             TTimerTask.CommandParam:=CommandParameter;
             TTimerTask.ExeCommand:=Command;
             TTimerTask.ExeCoptions:=ExeCoptions;
          end else begin
            StartVar:=shellAPi.ShellExecute(Handle,PWidechar(SySCommand), PWidechar(Command), PWidechar(CommandParameter), nil, ExeCoptions);
            sleep(1000);
            if StartVar<32 then begin
              LogLine(3,'                Programm Start fehlgeschlagen !');
              LogLine(3,'                LastError : '+inttostr(System.GetLastError));
            end else begin
              LogLine(3,'                Programm Start erfolgreich !');
            end;
          end;
        end else
        if Commandtyp='TimerRun' then begin
          Timertime:=IniPl.ReadString('AutoRun'+inttostr(i),'TimerTime','0:00');
          Timerday:=IniPl.ReadString('AutoRun'+inttostr(i),'TimerDay','0');
          LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Timer Start ');
          LogLine(3,'                Befehl : '+Command+' '+CommandParameter+' mittels '+SySCommand);
          LogLine(3,'                Ausführung : '+timetostr(Strtotime(Timertime)));
          TTimerTask:=Sheduler.Addtask;
          TTimerTask.id:='AutoRun'+inttostr(i);
          TTimerTask.time:=Strtotime(Timertime);
          if Timerday='0' then TTimerTask.day:=0 else TTimerTask.day:=Strtoint(Timerday);
          TTimerTask.SysCommand:=SySCommand;
          TTimerTask.CommandParam:=CommandParameter;
          TTimerTask.ExeCommand:=Command;
        end else
        if Commandtyp='RunService' then begin
          LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Service Start ');
          LogLine(3,'                Service : '+Command);
          if not ServiceStart('',Command) then begin
            LogLine(3,'                Service Start fehlgeschlagen !');
            LogLine(3,'                LastError : '+inttostr(System.getlasterror));
            LogLine(3,'                2. Versuch über KeyName suche');
            if not ServiceStart('',ServiceGetKeyName('',Command)) then begin
              LogLine(3,'                Service Start erneut fehlgeschlagen !');
              LogLine(3,'                LastError : '+inttostr(System.getlasterror));
              LogLine(3,'                3. Versuch Direktaufruf ');
            end else begin
              LogLine(3,'                Service Start erfolgreich !');
            end;
          end else begin
            LogLine(3,'                Service Start erfolgreich !');
          end;
        end else
        if Commandtyp='OpenClose' then begin
          LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : OpenClose Aktion Start ');
          LogLine(3,'                Programm : '+Command);
          if Timertimes<>'0' then begin
             timertime:=timetostr(now+strtotime(Timertimes));
             timerday:='99';
             LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Verzoegerter Start ');
             LogLine(3,'                Befehl : '+Command+' '+CommandParameter+' mittels '+SySCommand);
             LogLine(3,'                Verzögerung : '+Timertimes+' '+timertime);
             LogLine(3,'                Ausführung : '+timetostr(Strtotime(Timertime)));
             TTimerTask:=Sheduler.Addtask;
             TTimerTask.id:='AutoRun'+inttostr(i);
             TTimerTask.time:=Strtotime(Timertime);
             if Timerday='0' then TTimerTask.day:=0 else TTimerTask.day:=Strtoint(Timerday);
             TTimerTask.SysCommand:=SySCommand;
             TTimerTask.CommandParam:=CommandParameter;
             TTimerTask.ExeCommand:=Command;
          end else begin
            StartVar:=shellAPi.ShellExecute(Handle,PWidechar(SySCommand), PWidechar(Command), PWidechar(CommandParameter), nil, ExeCoptions);
            sleep(1000);
            if StartVar<32 then begin
              LogLine(3,'                Programm Start fehlgeschlagen !');
              LogLine(3,'                LastError : '+inttostr(System.GetLastError));
            end else begin
              LogLine(3,'                Programm Start erfolgreich !');
            end;
            TimeoutCounter:=1;
            while not processExists(CommandParameter2) and (TimeoutCounter<20) do begin
              LogLine(3,'                Warte auf Prozess '+CommandParameter2+'  Timeout : '+inttostr(Timeoutcounter)+' vom 20 !');
              sleep(500);
              inc(TimeoutCounter);
            end;
            if processExists(CommandParameter2) then begin
              LogLine(3,'                Prozess '+CommandParameter2+'  gefunden .. Beeende wieder !');
              KillTask(CommandParameter);
              TimeoutCounter:=1;
              while processExists(CommandParameter2) and (TimeoutCounter<20) do begin
                LogLine(3,'                Warte auf Prozessende '+CommandParameter2+'  Timeout : '+inttostr(Timeoutcounter)+' vom 20 !');
                sleep(500);
                inc(TimeoutCounter);
              end;
              if processExists(CommandParameter2) then begin
                LogLine(3,'                Prozess '+CommandParameter2+'  nicht mehr gefunden .. erfolgreich !');
              end else begin
                LogLine(3,'                Prozess '+CommandParameter2+'  noch gefunden .. Fehler !');
              end;
            end else begin
              LogLine(3,'                Prozess nicht '+CommandParameter2+'  gefunden .. Timeout !');
            end;
          end;
        end;
      end;
      inc(i);
      Autorunfound:=IniPl.ReadString('AutoRun'+inttostr(i),'Command','none')<>'none';
    end;
  end;
end;

function TTSS_Runner_Mainform.MyExitWindows(RebootParam: Longword): Boolean;
var
  TTokenHd: THandle;
  TTokenPvg: TTokenPrivileges;


cbtpPrevious: DWORD;
  rTTokenPvg: TTokenPrivileges;
  pcbtpPreviousRequired: DWORD;
  tpResult: Boolean;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    tpResult := OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      TTokenHd);
    if tpResult then
    begin
      tpResult := LookupPrivilegeValue(nil,
                                       SE_SHUTDOWN_NAME,
                                       TTokenPvg.Privileges[0].Luid);
      TTokenPvg.PrivilegeCount := 1;
      TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      cbtpPrevious := SizeOf(rTTokenPvg);
      pcbtpPreviousRequired := 0;
      if tpResult then
        //Older Delphi - replace the WinApi. to read WinApi.AdjustTokenPrivileges
        WinApi.Windows.AdjustTokenPrivileges(TTokenHd,
                                      False,
                                      TTokenPvg,
                                      cbtpPrevious,
                                      rTTokenPvg,
                                      pcbtpPreviousRequired);
    end;
  end;
  Result := ExitWindowsEx(RebootParam, 0);
end;

procedure TTSS_Runner_Mainform.OnSeheduler(ID: string; Task: TTask);
var StartVar:integeR;
begin
  LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : Timer Execute !');
  LogLine(3,'                Task : '+id);
  LogLine(3,'                Ausführung : '+Task.ExeCommand+' '+Task.CommandParam+' mittels '+Task.SysCommand);
  StartVar:=shellAPi.ShellExecute(Handle,PWidechar(Task.SySCommand), PWidechar(Task.ExeCommand), PWidechar(Task.CommandParam), nil, Task.ExeCoptions);
            if StartVar<32 then begin
              LogLine(3,'                Programm Start fehlgeschlagen !');
              LogLine(3,'                LastError : '+inttostr(System.GetLastError));
            end else begin
              LogLine(3,'                Programm Start erfolgreich !');
            end;
end;

procedure TTSS_Runner_Mainform.OSLogMemoChange(Sender: TObject);
begin
  Versionlabel.caption:=Get_This_EXE_Version;
end;

procedure TTSS_Runner_Mainform.Panel7Click(Sender: TObject);
var uid:tguid;
begin
  CreateGuid(Uid);
  TSS_FE_Runner_Dataform.SystemID:=GUIDToString(Uid);
end;

procedure TTSS_Runner_Mainform.ProzesstimerTimer(Sender: TObject);
begin
  Prozesstimer.enabled:=falsE;
  if processExists('TSS_FE_Engine.exe') then begin
    dsled21.oncolor:=cllime;
    dsled21.ledon:=not dsled21.ledon;
    prozesscheckdone:=true;
  end else begin
    dsled21.ledon:=true;
    dsled21.oncolor:=clred;
    if CheckBox3.Checked then StartEngine;
    prozesscheckdone:=true;
  end;
end;

procedure TTSS_Runner_Mainform.writeLog(s: string);
var f:TextFile;
begin
  AssignFile(f,'C:\TSS\Loggs\TSS_WD.log');
  if fileexists('C:\TSS\Loggs\TSS_WD.log') then Append(f) else Rewrite(f);
  writeln(f,'['+datetostr(now)+':'+timetostr(now)+'] '+s);
  CloseFile(f);
end;

procedure TTSS_Runner_Mainform.StatecheckTimerTimer(Sender: TObject);
var i,xread,yread:word;Tcol:Tcolor;tled:TdsLed;
begin
  StatecheckTimer.enabled:=false;
  dsled13.LedOn:=not dsled13.LedOn;
  xread:=TSS_FE_Runner_Dataform.settings_rundetect_posx;
  yread:=TSS_FE_Runner_Dataform.settings_rundetect_posy;
  Tcol:=getcoloRat(xread,yread);
  Panel1.Color:=Tcol;
  Panel1.Repaint;
  if (Tcol=clBlack) and (Panel2.Color<>clTeal) then begin
    ProgressBar2.Position:=ProgressBar2.Position+1;
    writeLog('Videoerkennung fehlgeschlagen : '+inttostr(ProgressBar2.Position));
    if ProgressBar2.Position>TSS_FE_Runner_Dataform.settings_rundetect_maxfail then begin
      writeLog('Videoerkennung fehlgeschlagen - Neustart');
      if not TSS_FE_Runner_Dataform.settings_rundetect_doReboot then MyExitWindows(EWX_REBOOT or EWX_FORCE);
    end;
  end else begin
    ProgressBar2.Position:=0;
  end;

  Statecheckdone:=true;
end;

procedure TTSS_Runner_Mainform.SYSWindow1Click(Sender: TObject);
begin
  SYSWindow1.hide;
end;

procedure TTSS_Runner_Mainform.SYSWindow1MouseLeave(Sender: TObject);
var p:Tpoint;
begin
  getCursorPos(p);
  P:=TSS_Runner_Mainform.ScreenToClient(P);
  if not ((P.X>SYSWindow1.Left) and
     (P.Y>SYSWindow1.top) and
     (P.X<SYSWindow1.Left+SYSWindow1.width) and
     (P.Y<SYSWindow1.Top+SYSWindow1.height)) then
  SYSWindow1.hide;
end;

procedure TTSS_Runner_Mainform.TCPCheckIntervalChange(Sender: TObject);
begin
  if TCPCheckInterval.text<>'' then TSS_FE_Runner_Dataform.TCPInterval:=strtoint(TCPCheckInterval.text) else TSS_FE_Runner_Dataform.TCPInterval:=0;
  TCPServerCheck.checked:=TSS_FE_Runner_Dataform.TCPInterval<>0;
  TCPConnectTimer.Interval:=TSS_FE_Runner_Dataform.TCPInterval;
  TCPConnectTimer.Enabled:=TCPServerCheck.checked;
end;

procedure TTSS_Runner_Mainform.TCPConnectTimerTimer(Sender: TObject);
begin
  dsLed29.ledon:=true;
  TCPConnectTimer.Enabled:=false;
  if TSS_FE_Runner_Dataform.TCPServer<>'' then begin
    if TSS_FE_Runner_Dataform.TCPPort<>0 then begin
      dsLed29.OnColor:=cllime;

      dsLed29.OnColor:=clMaroon;
      dsLed29.ledon:=false;
    end else dsLed29.OnColor:=clred;
  end else dsLed29.OnColor:=clred;
  TCPConnectTimer.Enabled:=true;
end;

procedure TTSS_Runner_Mainform.TCPServerCheckClick(Sender: TObject);
begin
  if TCPServerCheck.checked then begin
    TCPCheckInterval.Text:='3000'
  end else begin
    TCPCheckInterval.Text:='0';
  end;
  TSS_FE_Runner_Dataform.TCPInterval:=strtoint(TCPCheckInterval.Text);
end;

procedure TTSS_Runner_Mainform.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  PW1Window.show;
  StartEngine;
end;

procedure TTSS_Runner_Mainform.Timer2Timer(Sender: TObject);
begin
  application.Terminate;
end;

procedure TTSS_Runner_Mainform.UDPLogLevelChange(Sender: TObject);
begin
  if UDPLogLevel.text<>'' then TSS_FE_Runner_Dataform.UDPLevel:=strtoint(UDPLogLevel.text) else TSS_FE_Runner_Dataform.UDPLevel:=0;
  UDPLogsend.checked:=TSS_FE_Runner_Dataform.UDPLevel<>0;
end;

procedure TTSS_Runner_Mainform.UDPLogsendClick(Sender: TObject);
begin
  if UDPLogsend.checked then begin
    UDPLogLevel.Text:='1'
  end else begin
    UDPLogLevel.Text:='0';
  end;
end;

procedure TTSS_Runner_Mainform.Watchdog_MainTimerTimer(Sender: TObject);
begin
  Watchdog_MainTimer.Enabled:=false;
  if mainstate=2 then begin
    dsled4.LedOn:=not dsled4.LedOn;
    if Statecheckdone then begin
      Statecheckdone:=false;
      StateChecktimer.enabled:=true;
    end;
    if prozesscheckdone then begin
      prozesscheckdone:=false;
      Prozesstimer.Enabled:=true;
    end;
  end else begin
    dsled4.LedOn:=False;
  end;
  Watchdog_MainTimer.Enabled:=true;
end;

procedure TTSS_Runner_Mainform.WMCOPYDATA(var Msg: TWMCopyData);
var
  s,s2: string;

begin
  if Msg.CopyDataStruct.dwData=WM_VIDEOFILEPLAYED then begin
    LogLine(2,Datetostr(now)+'/'+timetostr(now)+' - Video wird gespielt : '+pchar(msg.CopyDataStruct.lpData));
  end else
  if Msg.CopyDataStruct.dwData=WM_IMAGEFILEPLAYED then begin
    LogLine(2,Datetostr(now)+'/'+timetostr(now)+' - Bild wird Dargstellt : '+pchar(msg.CopyDataStruct.lpData));
  end else
  if Msg.CopyDataStruct.dwData=WM_LOGENTRY then begin
    LogLine(1,Datetostr(now)+'/'+timetostr(now)+' - '+pchar(msg.CopyDataStruct.lpData));
  end;
end;

procedure TTSS_Runner_Mainform.WMHotKey(var Msg: TWMHotKey);
begin
  inherited;
  if (Msg.HotKey=1) or (Msg.HotKey=3) then begin
    if Stayback then begin
      Stayback:=false;
      StaybackByMsg:=false;
      if StaybackIcon<>nil then StaybackIcon.LBT.Caption:='aktivieren';
    end else begin
      Stayback:=True;
      StaybackByMsg:=false;
      if StaybackIcon<>nil then StaybackIcon.LBT.Caption:='beenden';
    end;
    TSS_Runner_Mainform.BringToFront;
  end else
  if Msg.HotKey=2 then begin
    TSS_FE_Runner_Dataform.DisplayScreen:=TSS_FE_Runner_Dataform.DisplayScreen+1;
    if TSS_FE_Runner_Dataform.DisplayScreen>=Screen.MonitorCount then TSS_FE_Runner_Dataform.DisplayScreen:=0;
    TSS_Runner_Mainform.left:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Left;
    TSS_Runner_Mainform.top:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].top;
    TSS_Runner_Mainform.width:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Width;
    TSS_Runner_Mainform.Height:=Screen.Monitors[TSS_FE_Runner_Dataform.DisplayScreen].Height;
    TSS_Runner_Mainform.Resize;
    TSS_Runner_Mainform.Repaint;
    TSS_Runner_Mainform.WindowState:=TWindowState.wsMinimized;
    TSS_Runner_Mainform.WindowState:=TWindowState.wsMaximized;
  end;
end;

procedure TTSS_Runner_Mainform.DefaultHandler(var Message);
var
  ee: TWMMYMessage;
begin
  with TMessage(Message) do begin
    if (Msg = WM_OURMESSAGE) then begin
      ee.Msg    := Msg;
      ee.Handle := wParam;
      ee.Info   := lParam;
      if ee.info = $800 then begin
        LogLine(3,'['+datetostr(now)+'/'+timetostr(now)+'] : StayBack Stop received ');
        LogLine(3,'                Stop StayBack für 30 Sekunden !');
        Stayback:=false;
        StaybackByMsg:=true;
        if StaybackIcon<>nil then StaybackIcon.LBT.Caption:='aktivieren *';
        ReStayBackTimer.enabled:=true;
      end else
      if ee.info = $995 then begin
        //self.WindowState:=TWindowState.wsMinimized;
        self.Repaint;
      end else
      if ee.info = $991 then begin
        dsled27.LedOn:=not dsled27.LedOn;
        dsled27.Repaint;
      end;
    end else inherited DefaultHandler(Message);
  end;
end;

initialization
  WM_OURMESSAGE := RegisterWindowMessage('TSS_broadcast Command_message');
  WM_OURMESSAGETEXT := RegisterWindowMessage('TSS_broadcast Text_message');
  WM_LOGENTRY := RegisterWindowMessage('TSS_broadcast LOGEntry');
  WM_VIDEOFILEPLAYED := RegisterWindowMessage('TSS_broadcast VideoFilePlayed');
  WM_IMAGEFILEPLAYED := RegisterWindowMessage('TSS_broadcast ImageFilePlayed');
end.
