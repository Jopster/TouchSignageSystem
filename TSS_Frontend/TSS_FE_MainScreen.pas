unit TSS_FE_MainScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,TSS_ButtonClass_unit, Vcl.StdCtrls,
  Vcl.ExtCtrls, dsLeds, DsFancyButton, FloatingWindow, Vcl.OleCtrls, WMPLib_TLB,TSS_DisplayClass_unit,
  Vcl.Buttons, IdBaseComponent, IdThreadComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, DSPack,TSS_Wifi,
  Vcl.Imaging.pngimage,MahUSB,TSS_FE_Updateform, Vcl.Menus;

const
  wlanapi = 'wlanapi.dll';
  WLAN_NOTIFICATION_SOURCE_ACM = $00000008;

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
    DsFancyButton1: TDsFancyButton;
    InfoTopPanel: TPanel;
    DsFancyButton2: TDsFancyButton;
    Debugpanel: TFloatingWindow;
    CenterVideos: TListBox;
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
    dsLed1: TdsLed;
    dsLed2: TdsLed;
    SpeedButton1: TSpeedButton;
    dsLed3: TdsLed;
    dsLed4: TdsLed;
    WDAliveTimer: TTimer;
    SpeedButton2: TSpeedButton;
    Button3: TButton;
    Image1: TImage;
    CheckWorkTimer: TTimer;
    Button4: TButton;
    dsLed5: TdsLed;
    Panel2: TPanel;
    Panel3: TPanel;
    dsLed6: TdsLed;
    dsLed7: TdsLed;
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
    Ipanel: TPanel;
    Wlabel: TLabel;
    Wimg: TImage;
    dsLed8: TdsLed;
    ScreensaveTimer: TTimer;
    PlayNextTimer: TTimer;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    SpeedButton3: TSpeedButton;
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
    KlickAktion1: TMenuItem;
    KlickVideoansehen1: TMenuItem;
    N1: TMenuItem;
    Buttonneuladen1: TMenuItem;
    Buttonspeichern1: TMenuItem;
    N2: TMenuItem;
    DebugmodeonOoff1: TMenuItem;
    N3: TMenuItem;
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
    procedure OpenupTimerTimer(Sender: TObject);
    procedure closeuptimerTimer(Sender: TObject);
    procedure runsecondtimerTimer(Sender: TObject);
    procedure DsFancyButton1Click(Sender: TObject);
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
  public
    { Public-Deklarationen }
    DisplayPanel,TopDisplayPanel:TTSS_Display;
    closeCommand:String;
    Allowclick:boolean;
    function GetSCREENSHOT: TBitmap;
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

  end;

var
  MainDisplayForm: TMainDisplayForm;
  WM_OURMESSAGE,WM_OURMESSAGETEXT: DWORD;

implementation

{$R *.dfm}

uses TSS_FE_DataForm, TSS_BE_FTPForm_unit,Exif, TSS_FE_FTPLoadFormunit,
  TSS_FE_Specialform_unit, TSS_FE_XtraBtnForm_unit;

const
  cTileSize = 250;


function TMainDisplayForm.GetSCREENSHOT: TBitmap;
var
  Locked: Boolean;
  X, Y, XS, YS: Integer;
  Canvas: TCanvas;
  R: TRect;
begin
  Result := TBitmap.Create;
  Result.Width := screen.Monitors[DataForm.DisplayScreen].Width;
  Result.Height := screen.Monitors[DataForm.DisplayScreen].Height;
  Canvas := TCanvas.Create;
  Canvas.Handle := GetDC(0);
  Locked := Canvas.TryLock;
  try
    XS := Pred(screen.Monitors[DataForm.DisplayScreen].Width div cTileSize);
    if screen.Monitors[DataForm.DisplayScreen].Width mod cTileSize > 0 then
      Inc(XS);
    YS := Pred(screen.Monitors[DataForm.DisplayScreen].Height div cTileSize);
    if screen.Monitors[DataForm.DisplayScreen].Height mod cTileSize > 0 then
      Inc(YS);
    for X := 0 to XS do
      for Y := 0 to YS do
      begin
        R := Rect(
          X * cTileSize, Y * cTileSize, Succ(X) * cTileSize,
          Succ(Y) * cTileSize);
        Result.Canvas.CopyRect(R, Canvas, R);
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

procedure TMainDisplayForm.InfoPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MessageBeep(0)
end;

procedure TMainDisplayForm.IpanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MessageBeep(0);
end;

procedure OnWlanNotify(data : PWLanNotificationData; context : PVOID); stdcall;
begin
  showMessage(IntToStr(data^.NotificationCode));
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

procedure TMainDisplayForm.Buttonspeichern1Click(Sender: TObject);
begin
  DataForm.PopupButton.SaveButtonSelf;
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
begin
  CheckWorkTimer.Enabled:=false;
  dsLed5.LedOn:=true;
  dsled5.Repaint;
  dsLed6.LedOn:=true;
  dsled6.Repaint;
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
  if checkbox1.Checked then LogCopy.Items.Add(ColorToString(clr));
  if (clr<>clOlive) then begin
     Application.BringToFront;
     MainDisplayForm.BringToFront;
  end;
  dsLed5.LedOn:=false;
  dsled5.Repaint;
  dsLed6.LedOn:=false;
  dsled6.Repaint;
  if DataForm.pingstate<>0 then begin
    DataForm.pingstate:=0;
    DataForm.Ping1.DnsLookup(Dataform.dnsHost);
  end;
  CheckWorkTimer.Enabled:=true;
end;

procedure TMainDisplayForm.closeuptimerTimer(Sender: TObject);
begin
  CloseupTimer.Enabled:=false;
  if centerpl<>nil then Freeandnil(centerpl);
  if centerplPanel<>nil then Freeandnil(centerplPanel);
  Overlaypanel.Top:=0;
  Overlaypanel.BringToFront;
  Overlaypanel.left:=0;
  Overlaypanel.Width:=FCountOpensteps*48;
  Overlaypanel.height:=FCountOpensteps*27;
  Overlaypanel.Repaint;
  dec(FCountOpensteps);
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

procedure TMainDisplayForm.DsFancyButton1Click(Sender: TObject);
begin
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

procedure TMainDisplayForm.dsLed8DblClick(Sender: TObject);
begin
  DataForm.OnlineRun:=not DataForm.OnlineRun;
end;

procedure TMainDisplayForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
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
end;

procedure TMainDisplayForm.FormShow(Sender: TObject);
begin
  if DataForm.stopExpetion then label15.font.Color:=cllime else label15.font.Color:=clred;
  label15.Repaint;
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
    Debugpanel.show;
    SpeedButton2.show;
    SpeedButton3.show;
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
begin
  if FBeforeclick=2 then begin
    Label5.Font.Color:=clred;
    Label5.Repaint;
    FBeforeclick:=3;
  end else begin
    ResetKeeper;
  end;
end;

procedure TMainDisplayForm.Label8Click(Sender: TObject);
begin
  DisplayPanel.PlayVideo(2);
end;

procedure TMainDisplayForm.mixplaylist;
var
  I,a: Integer;s:String;
begin
  DataForm.writeDBLog('MIX_VIDEOS','Videos Mischen : '+inttostr(MainDisplayForm.CenterVideos.Count),inttostr(MainDisplayForm.CenterVideos.Count),8);
  for I := 0 to MainDisplayForm.CenterVideos.Count-1 do begin
    a:=random(MainDisplayForm.CenterVideos.Count-1);
    S:=MainDisplayForm.CenterVideos.Items[a];
    MainDisplayForm.CenterVideos.Items.Delete(a);
    MainDisplayForm.CenterVideos.Items.Add(s);
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
  end;
end;

procedure TMainDisplayForm.MyGalMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var ZoomImgPnl:TFloatingWindow;ZoomIMg:Timage;
    CloseBut,CloseBut2:TDsFancyButton;
    ths,tvs,hs,vs:word;
begin
  GetJPGSize(TImage(sendeR).HelpKeyword,hs,vs);
  if hs>1900 then begin
    ths:=hs;
    hs:=1800;
    vs:=round(vs/(ths/hs));
  end;
  if vs>1000 then begin
    tvs:=vs;
    vs:=900;
    hs:=round(hs/(tvs/vs));
  end;
  DataForm.writeDBLog('CAL_PICTU_PRESS','Bild TastenDruck erfolgt - ClickBild : '+TImage(sendeR).HelpKeyword,'',5);
  ZoomImgPnl:=TFloatingWindow.Create(Overlaypanel);
  ZoomImgPnl.Parent:=Overlaypanel;
  ZoomImgPnl.Show;
  ZoomImgPnl.Tag:=99;
  ZoomImgPnl.Left:=round((1900-hs)/2);
  ZoomImgPnl.Width:=hs;
  ZoomImgPnl.Height:=vs+20;
  ZoomImgPnl.top:=round((1000-vs)/2);
  ZoomImg:=Timage.Create(ZoomImgPnl);
  ZoomIMg.Parent:=ZoomImgPnl;
  ZoomIMg.Proportional:=true;
  ZoomIMg.Stretch:=true;
  ZoomImg.Left:=round((1900-hs)/2);
  ZoomImg.top:=round((1000-vs)/2);
  ZoomImg.Picture.LoadFromFile(TImage(sendeR).HelpKeyword);
  ZoomImg.Align:=alClient;
  ZoomImg.show;
  zoomImg.Width:=hs;
  ZoomIMg.Height:=vs;
  ZoomIMg.Tag:=99;
  CloseBut:=TDsFancyButton.Create(ZoomImgPnl);
  CloseBut.Parent:=ZoomImgPnl;
  CloseBut.Left:=ZoomImgPnl.Width-50;
  CloseBut.Top:=0;
  CloseBut.Width:=45;
  CloseBut.Height:=45;
  CloseBut.Caption:='';
  closeBut.Glyphs.Layout:=lyCenter;
  closeBut.Glyphs.Distance:=20;
  CloseBut.Glyphs.Glyph.LoadFromFile(Dataform.MainPath+'close.bmp');
  CloseBut.Show;
  CloseBut.OnMouseUp:=GalCloseMouseup;
  CloseBut2:=TDsFancyButton.Create(ZoomImgPnl);
  CloseBut2.Parent:=ZoomImgPnl;
  CloseBut2.Left:=ZoomImgPnl.Width-50;
  CloseBut2.Top:=ZoomImgPnl.Height-70;
  CloseBut2.Width:=45;
  CloseBut2.Height:=45;
  CloseBut2.Caption:='';
  closeBut2.Glyphs.Layout:=lyCenter;
  closeBut2.Glyphs.Distance:=20;
  CloseBut2.Glyphs.Glyph.LoadFromFile(Dataform.MainPath+'close.bmp');
  CloseBut2.Show;
  CloseBut2.OnMouseUp:=GalCloseMouseup
end;

procedure TMainDisplayForm.MyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Benabled:boolean;Action1,Action2:word;
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
          TSS_FE_Specialform.showmodal;
          StartCEnterVideo;
          CheckWorkTimer.Enabled:=True;
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
 // if FNextVideoIndex>MainDisplayForm.CenterVideos.Items.Count-1 then FNextVideoIndex:=0 else inc(FNextVideoIndex);
   dsLed1.LedOn:=False;
   dsLed1.Repaint;
   dsLed2.LedOn:=true;
   dsLed2.Repaint;
   Timer1.Enabled:=true;
end;

procedure TMainDisplayForm.N48inH1Click(Sender: TObject);
begin
  DataForm.PopupButton.height:=DataForm.PopupButton.height+48;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.N48inH2Click(Sender: TObject);
begin
  DataForm.PopupButton.Height:=DataForm.PopupButton.Height-48;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.N48inW1Click(Sender: TObject);
begin
  DataForm.PopupButton.Width:=DataForm.PopupButton.Width+48;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.N48inW2Click(Sender: TObject);
begin
  DataForm.PopupButton.width:=DataForm.PopupButton.width-48;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.N96inx1Click(Sender: TObject);
begin
  DataForm.PopupButton.Left:=DataForm.PopupButton.Left+48;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.N96inx2Click(Sender: TObject);
begin
  DataForm.PopupButton.Left:=DataForm.PopupButton.Left-48;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.N96iny1Click(Sender: TObject);
begin
  DataForm.PopupButton.top:=DataForm.PopupButton.top+48;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.N96iny2Click(Sender: TObject);
begin
  DataForm.PopupButton.top:=DataForm.PopupButton.top-48;
  DataForm.PopupButton.Repaint;
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
var ex : TExif;fname:string;cnt:word;
begin
  OpenupTimer.Enabled:=false;
  OfflinePanel.Visible:=false;
  Overlaypanel.Top:=0;
  Overlaypanel.BringToFront;
  Overlaypanel.left:=0;
  Overlaypanel.Width:=FCountOpensteps*(screen.Monitors[DataForm.DisplayScreen].Width div 40);
  Overlaypanel.height:=FCountOpensteps*(screen.Monitors[DataForm.DisplayScreen].Height div 40);
  Overlaypanel.Repaint;
  IPanel.Visible:=False;
  Overlaypanel.show;
  inc(FCountOpensteps);
  if FCountOpensteps<41 then OpenupTimer.Enabled:=true else begin
    InfoPanel.Left:=screen.Monitors[DataForm.DisplayScreen].Width-InfoPanel.Width-2;
    InfoPanel.top:=screen.Monitors[DataForm.DisplayScreen].Height-InfoPanel.Height-2;
    InfoPanel.Show;
    InfoTopPanel.Left:=screen.Monitors[DataForm.DisplayScreen].Width-InfoPanel.Width-2;
    InfoTopPanel.top:=0;
    InfoTopPanel.Show;
    FRunningSeconds:=0;
    Wimg.Left:=round(Cpanel.Width/2-80);
    Wimg.Top:=round(Cpanel.Height/2-80);
    IPAnel.Left:=0;
    IPanel.Top:=0;
    IPanel.Height:=Cpanel.Height;
    IPanel.Width:=Cpanel.Width;
    IPanel.Visible:=true;
    Wlabel.Left:=0;
    Wlabel.Width:=IPanel.Width;
    WLabel.Top:=600;
    Wlabel.Visible:=true;
    Wlabel.Repaint;
    Wimg.Repaint;
    Fstopall:=false;
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
//          Fileid:=DataForm.TSS_FE_AlgQuery.FieldByName('playlist_media_id').Asinteger;
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
            DataForm.writeDBLog('CREATE_VIDEO','Video erzeugen : '+Filename,'',3);
            cpanel.top:=110;
            cPanel.Left:=60;
            cpanel.Height:=screen.Monitors[DataForm.DisplayScreen].Height-320;
            cpanel.Width:=screen.Monitors[DataForm.DisplayScreen].width-120;
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
              WPlayer.Left:=0;
              WPlayer.Top:=0;
              WPlayer.Width:=cpanel.Width;
              WPlayer.Height:=cPanel.Height;
              WPlayer.URL:=LoadFile;
              WPlayer.Show;
              WPlayer.BringToFront;
              Ipanel.Hide;
              WPlayer.controls.play;
            end;
//          end else begin
//            LogCopy.Items.Add('Fehler #1/44/1 Click_Playliste '+PlayList_uid+' Medium '+inttostR(Fileid)+' nicht gefunden!!');
//          end;
//        end else begin
//          LogCopy.Items.Add('Fehler #1/44/1 Click_Playliste '+PlayList_uid+' nicht gefunden!!');
//        end;
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
            Gimg.Picture.LoadFromFile(fname);
            if ex = nil then ex:=TExif.Create;
            try
              ex.ReadFromFile(fname);
              if ex.Valid then begin
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
          ipanel.hide;
          Overlaypanel.Show;
          Overlaypanel.Repaint;
          Overlaypanel.BringToFront;
        end;
      end;
//    end;
    runsecondtimer.enabled:=true;
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

procedure TMainDisplayForm.PlayNextTimerTimer(Sender: TObject);
begin
  PlayNextTimer.Enabled:=false;
  label16.Caption:=inttostr(strtoint(label16.Caption)+1);
  DisplayPanel.PlayNextVideo2;
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
begin
  runsecondtimer.Enabled:=false;
  s:=inttostr(60-FRunningSeconds);
  if length(s)<2 then s:='0'+s;
  dsSevenSegmentDisplay1.Value:=strtoint(s[1]);
  dsSevenSegmentDisplay2.Value:=strtoint(s[2]);
  for I := 1 to 8 do begin
    Tp:=TPanel(FindComponent('DigiPoint_'+inttostr(I)));
    if TestBit(FRunningSeconds,I) then Tp.Color:=clOlive else tp.Color:=clBlack;
  end;
  inc(FRunningSeconds);
  if (FRunningSeconds>60) or FStopAll then begin
    allowclick:=false;
    dsLed7.ledon:=false;
    dsled7.Repaint;
    stopall;
    closeuptimer.Enabled:=true;
  end else runsecondtimer.Enabled:=true and not Fstopall;
end;

procedure TMainDisplayForm.ScreensaveTimerTimer(Sender: TObject);
var bmp:TPicture;
begin
  ScreensaveTimer.Enabled:=false;
  bmp:=Tpicture.Create;
  bmp.Bitmap:=GetSCREENSHOT;
  bmp.SaveToFile(Paramstr(0)[1]+':\TSS\Screens\SCR_'+FormatDateTime('yyyymmdd_hhnnss', Now)+'.bmp');
  ScreensaveTimer.Enabled:=True;
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

procedure TMainDisplayForm.SpeedButton4Click(Sender: TObject);
begin
  CheckWorkTimer.Enabled:=false;
  Fstopall:=true;
  TSS_FE_Specialform.Doclose:=falsE;
  TSS_FE_Specialform.showmodal;
  StartCEnterVideo;
  CheckWorkTimer.Enabled:=True;
end;

procedure TMainDisplayForm.StartCEnterVideo;
begin
  DisplayPanel.PlayVideo(0);
end;

procedure TMainDisplayForm.stopall;
var s:String;
  a: Integer;
  DelIM:Timage;
begin
  Fstopall:=true;
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
end;

procedure TMainDisplayForm.Timer1Timer(Sender: TObject);
var NextFile:String;
begin
  Timer1.Enabled:=false;
  NextFile:=DisplayPanel.GetNextVideoFileName;
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

procedure TMainDisplayForm.WDAliveTimerTimer(Sender: TObject);
var  ee: TWMMYMessage;NextFile:String;a:word;
  MyRecord: PMyFileRecord;
  cds: TCopyDataStruct;
  hWnd: THandle;
begin
  WDAliveTimer.Enabled:=false;
  hWnd := FindWindow(nil, 'Watchdog - Hauptform');
  if 1=2 then begin
      GetMem(MyRecord, sizeof(TMyFileRecord));
      try
        MyRecord.b := 1;
        MyRecord.s := DisplayPanel.GetNextVideoFileName;
        cds.dwData := 0;
        cds.cbData := sizeof(TMyFileRecord);
        cds.lpData := MyRecord;
        hWnd := FindWindow(nil, 'Watchdog - Hauptform');
        SendMessage(hWnd, WM_COPYDATA, Handle, Integer(@cds));
      finally
        FreeMem(MyRecord, sizeof(TMyFileRecord));
      end;
  end;
  dsLed3.LedOn:=false;
  dsled3.Repaint;
  dsLed4.LedOn:=false;
  dsled4.Repaint;
  SendMessage(hWnd, WM_OURMESSAGE, Handle, $991);
end;

procedure TMainDisplayForm.WMMYMessage(var Msg: TWMMYMessage);
begin
  WDAliveTimer.Enabled:=true;
end;

procedure TMainDisplayForm.WPlayerPlayStateChange(ASender: TObject;
  NewState: Integer);
begin
  if NewState=10 then begin
    Wimg.Left:=round(Cpanel.Width/2-80);
    Wimg.Top:=round(Cpanel.Height/2-80);
    IPAnel.Left:=0;
    IPanel.Top:=0;
    IPanel.Height:=Cpanel.Height;
    IPanel.Width:=Cpanel.Width;
    IPanel.Visible:=true;
    Wlabel.Left:=0;
    Wlabel.Width:=IPanel.Width;
    WLabel.Top:=600;
    Wlabel.Visible:=true;
    Wlabel.Repaint;
    Wimg.Repaint;
  end else
  if NewState=3 then begin
    IPanel.Visible:=False;
    Wlabel.Visible:=False;
    IPanel.Repaint;
    Wlabel.Repaint;
  end else
  if NewState=1 then begin
    IPanel.Visible:=False;
    Wlabel.Visible:=False;
    IPanel.Repaint;
    Wlabel.Repaint;
  end else if DataForm.indebug then ShowMessage(inttostR(NewStaTe));
end;

procedure TMainDisplayForm.XXXinH1Click(Sender: TObject);
var pix:string;pixi:integer;
begin
  pix:=InputBox('Erhöhung -+','Pixel :','0');
  pixi:=strtoint(pix);
  DataForm.PopupButton.height:=DataForm.PopupButton.height+pixi;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.XXXinW1Click(Sender: TObject);
var pix:string;pixi:integer;
begin
  pix:=InputBox('Verbreiterung -+','Pixel :','0');
  pixi:=strtoint(pix);
  DataForm.PopupButton.width:=DataForm.PopupButton.width+pixi;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.xxxinx1Click(Sender: TObject);
var pix:string;pixi:integer;
begin
  pix:=InputBox('Verschiebung -+','Pixel :','0');
  pixi:=strtoint(pix);
  DataForm.PopupButton.Left:=DataForm.PopupButton.Left+pixi;
  DataForm.PopupButton.Repaint;
end;

procedure TMainDisplayForm.yyyiny1Click(Sender: TObject);
var pix:string;pixi:integer;
begin
  pix:=InputBox('Verschiebung -+ y','Pixel :','0');
  pixi:=strtoint(pix);
  DataForm.PopupButton.top:=DataForm.PopupButton.top+pixi;
  DataForm.PopupButton.Repaint;
end;

initialization
  WM_OURMESSAGE := RegisterWindowMessage('TSS_broadcast Command_message');
  WM_OURMESSAGETEXT := RegisterWindowMessage('TSS_broadcast Text_message');

end.
