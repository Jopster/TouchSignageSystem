unit Mainform_unit;



interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,system.inifiles,
  Vcl.Buttons, dsLeds, Vcl.StdCtrls,tlHelp32,shellAPi,ScktComp, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient,math, Vcl.ComCtrls;


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

  TForm1 = class(TForm)
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    dsLed1: TdsLed;
    OvertimeAllert: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    dsLed2: TdsLed;
    Label3: TLabel;
    dsLed3: TdsLed;
    Label4: TLabel;
    dsLed4: TdsLed;
    RestartTimer: TTimer;
    dsLed5: TdsLed;
    Label5: TLabel;
    Image1: TImage;
    screenshottimer: TTimer;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Label6: TLabel;
    starttimer: TTimer;
    Label7: TLabel;
    IdTCPClient1: TIdTCPClient;
    SpeedButton2: TSpeedButton;
    dsLed6: TdsLed;
    Label8: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Label10: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Label11: TLabel;
    Bevel8: TBevel;
    Bevel7: TBevel;
    dsLed7: TdsLed;
    dsLed8: TdsLed;
    dsLed9: TdsLed;
    dsLed10: TdsLed;
    dsLed11: TdsLed;
    dsLed12: TdsLed;
    Label12: TLabel;
    dsLed13: TdsLed;
    dsLed14: TdsLed;
    dsLed15: TdsLed;
    dsLed16: TdsLed;
    dsLed17: TdsLed;
    Label13: TLabel;
    Timer2: TTimer;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel1: TPanel;
    SpeedButton3: TSpeedButton;
    dsLed18: TdsLed;
    dsLed19: TdsLed;
    dsLed20: TdsLed;
    dsLed21: TdsLed;
    dsLed22: TdsLed;
    dsLed23: TdsLed;
    dsLed24: TdsLed;
    dsLed25: TdsLed;
    dsLed26: TdsLed;
    dsLed27: TdsLed;
    dsLed28: TdsLed;
    Panel2: TPanel;
    Label14: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Timer3: TTimer;
    Label15: TLabel;
    Label16: TLabel;
    ColorTimer: TTimer;
    dsLed29: TdsLed;
    Edit6: TEdit;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Label17: TLabel;
    dsLed30: TdsLed;
    Timer4: TTimer;
    DigiPoint_1: TdsLed;
    DigiPoint_2: TdsLed;
    DigiPoint_3: TdsLed;
    DigiPoint_4: TdsLed;
    DigiPoint_5: TdsLed;
    DigiPoint_6: TdsLed;
    DigiPoint_7: TdsLed;
    DigiPoint_8: TdsLed;
    Label18: TLabel;
    Bevel11: TBevel;
    Label19: TLabel;
    Bevel12: TBevel;
    CheckBox2: TCheckBox;
    Label20: TLabel;
    UpdTimerLabel: TLabel;
    Label22: TLabel;
    UpdateSekundenTimer: TTimer;
    Updatetimer: TTimer;
    dsLed31: TdsLed;
    Edit7: TEdit;
    Bevel13: TBevel;
    Memo1: TMemo;
    SpeedButton4: TSpeedButton;
    Memo2: TMemo;
    SpeedButton5: TSpeedButton;
    ProgressBar1: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure DefaultHandler(var Message); override;
    procedure Timer1Timer(Sender: TObject);
    procedure OvertimeAllertTimer(Sender: TObject);
    procedure RestartTimerTimer(Sender: TObject);
    procedure screenshottimerTimer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure starttimerTimer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure ColorTimerTimer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure UpdateSekundenTimerTimer(Sender: TObject);
    procedure dsLed31Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    ClientSocket1: TClientSocket;
    ServerSocket1: TServerSocket;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    AlertState:worD;
    nextplayFileName:String;
    Progdetect,blackdetect:Word;
    WaitUpdateSekunden:word;
    UpdateErrorcount:word;
    function GetSCREENSHOT: TBitmap;
    procedure WMCOPYDATA(var msg: TWMCopyData); message WM_COPYDATA;
    function GetColorat(x,y:word):Tcolor;
    function MyExitWindows(RebootParam: Longword): Boolean;
    procedure writeLog(s:string);
    function runUpdate(s:string):Boolean;
  end;

var
  Form1: TForm1;
  WM_OURMESSAGE,WM_OURMESSAGETEXT: DWORD;

implementation

{$R *.dfm}

uses TSS_WD_DataForm_unit;

const
  cTileSize = 250;

function GetConsoleOutput2(const Command : WideString;
                          Output, Errors : TMemo) : Boolean;
var
  Buffer : array[0..2400] of AnsiChar;
  BufferStrOutput : AnsiString;
  BufferStrErrors : AnsiString;
  CreationFlags : DWORD;
  NumberOfBytesRead : DWORD;
  PipeErrorsRead : THandle;
  PipeErrorsWrite : THandle;
  PipeOutputRead : THandle;
  PipeOutputWrite : THandle;
  ProcessInfo : TProcessInformation;
  SecurityAttr : TSecurityAttributes;
  StartupInfo : TStartupInfo;
  tmpWaitR : DWORD;

  procedure AddLine(var AString : string; ALines : TStrings);
  var
    i : integer;
  begin
    i := pos(#13#10, AString);
    while i > 0 do begin
      ALines.Add(copy(AString,1,i-1));
      Delete(AString,1,i+1);
      i := pos(#13#10, AString);
    end;
  end;

begin
  //Initialisierung ProcessInfo
  FillChar(ProcessInfo, SizeOf(TProcessInformation), 0);

  //Initialisierung SecurityAttr
  FillChar(SecurityAttr, SizeOf(TSecurityAttributes), 0);
  SecurityAttr.nLength := SizeOf(TSecurityAttributes);
  SecurityAttr.bInheritHandle := True;
  SecurityAttr.lpSecurityDescriptor := nil;

  //Pipes erzeugen
  CreatePipe(PipeOutputRead, PipeOutputWrite, @SecurityAttr, 0);
  CreatePipe(PipeErrorsRead, PipeErrorsWrite, @SecurityAttr, 0);

  //Initialisierung StartupInfo
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.hStdInput := 0;
  StartupInfo.hStdOutput := PipeOutputWrite;
  StartupInfo.hStdError := PipeErrorsWrite;
  StartupInfo.wShowWindow := SW_HIDE;
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;

  CreationFlags := CREATE_DEFAULT_ERROR_MODE or
                   CREATE_NEW_CONSOLE or
                   NORMAL_PRIORITY_CLASS;

  result := CreateProcessW(nil, (PWideChar(Command)),
                   nil,
                   nil,
                   True,
                   CreationFlags,
                   nil,
                   nil,
                   StartupInfo,
                   ProcessInfo);
  if result then begin
    //Write-Pipes schließen
    CloseHandle(PipeOutputWrite);
    CloseHandle(PipeErrorsWrite);

    BufferStrOutput := '';
    BufferStrErrors := '';

    repeat
      tmpWaitR := WaitForSingleObject(ProcessInfo.hProcess, 100);

      NumberOfBytesRead := 0;
      //Ausgabe Read-Pipe auslesen
      if PeekNamedPipe(PipeOutputRead, nil, 0, nil, @NumberOfBytesRead, nil) and (NumberOfBytesRead > 0) then begin
        while ReadFile(PipeOutputRead, Buffer, Length(Buffer)-1, NumberOfBytesRead, nil) do begin
          Buffer[NumberOfBytesRead] := #0;
          OemToAnsi(Buffer, Buffer);
          BufferStrOutput := BufferStrOutput + Buffer;
          Output.Lines.Add(BufferStrOutput);
          Output.Repaint;
          Application.ProcessMessages();
        end;
      end;

      NumberOfBytesRead := 0;
      if PeekNamedPipe(PipeErrorsRead, nil, 0, nil, @NumberOfBytesRead, nil) and (NumberOfBytesRead > 0) then begin
        while ReadFile(PipeErrorsRead, Buffer, Length(Buffer)-1, NumberOfBytesRead, nil) do begin
          Buffer[NumberOfBytesRead] := #0;
          OemToAnsi(Buffer, Buffer);
          BufferStrErrors := BufferStrErrors + Buffer;
          Errors.Lines.add(BufferStrErrors);
          Errors.Repaint;
          Application.ProcessMessages();
        end;
      end;

      Application.ProcessMessages();
    until (tmpWaitR <> WAIT_TIMEOUT);

    if BufferStrOutput <> '' then Output.Lines.Add(BufferStrOutput);
    if BufferStrErrors <> '' then Errors.Lines.Add(BufferStrErrors);

    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);

    CloseHandle(PipeOutputRead);
    CloseHandle(PipeErrorsRead);
  end else begin
    //Pipes schließen
    CloseHandle(PipeOutputRead);
    CloseHandle(PipeOutputWrite);
    CloseHandle(PipeErrorsRead);
    CloseHandle(PipeErrorsWrite);
  end;
end;

function TForm1.GetSCREENSHOT: TBitmap;
var
  Locked: Boolean;
  X, Y, XS, YS: Integer;
  Canvas: TCanvas;
  R: TRect;
begin
  Result := TBitmap.Create;
  Result.Width := Screen.Width;
  Result.Height := Screen.Height;
  Canvas := TCanvas.Create;
  Canvas.Handle := GetDC(0);
  Locked := Canvas.TryLock;
  try
    XS := Pred(Screen.Width div cTileSize);
    if Screen.Width mod cTileSize > 0 then
      Inc(XS);
    YS := Pred(Screen.Height div cTileSize);
    if Screen.Height mod cTileSize > 0 then
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

function TForm1.GetColorat(x,y:word):Tcolor;
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

procedure TForm1.FormShow(Sender: TObject);
begin
  if ParamStr(1) = '-B' then begin

  end else begin
    Form1.WindowState:=wsMinimized;
  end;
  starttimer.Enabled:=true;
  WaitUpdateSekunden:=300;
end;

procedure TForm1.OvertimeAllertTimer(Sender: TObject);
begin
  if AlertState=0 then begin
    dsLed2.LedOn:=true;
    alertstate:=1;
  end else
  if AlertState=1 then begin
    dsLed3.LedOn:=true;
    alertstate:=2;
  end else
  if AlertState=2 then begin
    dsLed4.LedOn:=true;
    alertstate:=3;
    if processExists('TSS_FE.exe') then begin
      writeLog('Herzschlag Programm Neustart - Kill TSS_FE.exe');
      KillTask('TSS_FE.exe');
    end;
    restarttimer.enabled:=true;
  end;
  dsLed2.Repaint;
  dsLed3.Repaint;
  dsLed4.Repaint;
end;

procedure TForm1.RestartTimerTimer(Sender: TObject);
begin
  RestartTimer.Enabled:=false;
  dsLed5.LedOn:=true;
  dsled5.repaint;
  writeLog('Herzschlag Programm Neustart - Neustart TSS_FE.exe');
  ShellExecute('C:\TSS\Frontend\TSS_FE.exe','');
end;

function TForm1.runUpdate(s: string): Boolean;
begin
  runUpdate:=false;

end;

procedure TForm1.screenshottimerTimer(Sender: TObject);
var ms:TMemoryStream;
begin
  Image1.Picture.Bitmap:=GetSCREENSHOT;
    try
      if not IdTCPClient1.Connected then begin
        IdTCPClient1.Connect;
        dsLed6.OnColor:=cllime;
        dsLed6.LedOn:=true;
      end;
    except
      on e:exception do begin
        dsLed6.OnColor:=clred;
        dsLed6.LedOn:=true;
      end;
    end;
  if IdTCPClient1.Connected then begin
    ms:=TMemoryStream.Create;
    Image1.Picture.SaveToStream(ms);
    ms.Position:=0;
    IdTCPClient1.IOHandler.Write(ms,0,true);
    ms.Free;
    try
      if idTCPClient1.Connected then begin
        IdTCPClient1.Disconnect;
        dsLed6.OnColor:=cllime;
        dsLed6.LedOn:=false;
      end;
    except
      on e:exception do begin
        dsLed6.OnColor:=clred;
        dsLed6.LedOn:=true;
      end;
    end;
  end;
  IdTCPClient1.Disconnect;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  ClientSocket1.active:=true;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Timer2.Enabled:=not Timer2.Enabled;
  Timer3.Enabled:=not Timer3.Enabled;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
var outS,ErrS:TStringlist;
begin
  outS:=Tstringlist.create;
  ErrS:=Tstringlist.create;
  GetConsoleOutput2('cmd /A /C '+Dataform.MinerPath+'\'+Dataform.MinerExe+' '+Dataform.MinerParams,Memo2,Memo1);
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  if form1.Width>840 then form1.width:=840 else form1.width:=1430;

end;

procedure TForm1.starttimerTimer(Sender: TObject);
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
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  screenshottimer.Enabled:=CheckBox1.Checked;
  screenshottimer.Interval:=strtoint(edit1.Text);
end;

procedure TForm1.ColorTimerTimer(Sender: TObject);
begin
  ColorTimer.Enabled:=false;
  dsLed29.OnColor:=cllime;
  dsLed29.LedOn:=true;
  Timer2.Enabled:=true;
  timer3.Enabled:=true;
  timer4.Enabled:=true;
end;

procedure TForm1.DefaultHandler(var Message);
var
  ee: TWMMYMessage;
begin
  with TMessage(Message) do begin
    if (Msg = WM_OURMESSAGE) then begin
      ee.Msg    := Msg;
      ee.Handle := wParam;
      ee.Info   := lParam;
      if ee.info = $991 then begin
        AlertState:=0;
        OvertimeAllert.Enabled:=false;
        dsLed1.LedOn:=false;
        dsLed1.Repaint;
        dsLed2.LedOn:=false;
        dsLed2.Repaint;
        dsLed3.LedOn:=false;
        dsLed3.Repaint;
        dsLed4.LedOn:=false;
        dsLed4.Repaint;
        dsLed5.LedOn:=false;
        dsLed5.Repaint;
        Image1.Picture.Bitmap:=GetSCREENSHOT;
      end;
    end else inherited DefaultHandler(Message);
  end;
end;

procedure TForm1.dsLed31Click(Sender: TObject);
begin
  Dsled31.LedOn:=false;
  UpdateSekundenTimer.Enabled:=false;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  SendMessage(HWND_BROADCAST, WM_OURMESSAGE, Handle, $990);
  dsLed1.LedOn:=true;
  dsLed1.Repaint;
  OvertimeAllert.Enabled:=true;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var i,xread,yread:word;Tcol:Tcolor;tled:TdsLed;
begin
  Timer2.Enabled:=false;
  xread:=strtoint(edit2.Text);
  yread:=strtoint(edit3.Text);
  Tcol:=getcoloRat(xread,yread);
  Panel1.Color:=Tcol;
  Panel1.Repaint;
  if (Tcol=clBlack) and (Panel2.Color<>clTeal) then begin
    inc(blackdetect);
    ProgressBar1.Position:=blackdetect;
    Tdsled(form1.FindComponent('dsled'+inttostr((6+(blackdetect div 2))))).LedOn:=true;
    writeLog('Videoerkennung fehlgeschlagen : '+inttostr(blackdetect));
    if blackdetect>20 then begin
      writeLog('Videoerkennung fehlgeschlagen - Neustart');
      if not CheckBox2.checked then MyExitWindows(EWX_REBOOT or EWX_FORCE);
    end;
  end else begin
    for I := 1 to  blackdetect do Tdsled(form1.FindComponent('dsled'+inttostr((6+(I div 2))))).LedOn:=false;
    ProgressBar1.Position:=0;
    blackdetect:=0;
  end;
  timer2.Enabled:=true;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var i,xread,yread:word;Tcol,Tcol2:Tcolor;tled:TdsLed;
begin
  Timer3.Enabled:=false;
  xread:=strtoint(edit4.Text);
  yread:=strtoint(edit5.Text);
  Tcol:=getcoloRat(xread,yread);
  xread:=strtoint(edit4.Text);
  yread:=strtoint(edit6.Text);
  Tcol2:=getcoloRat(xread,yread);
  Panel2.Color:=Tcol;
  Panel2.Repaint;
  if (Tcol<>clOlive) and (Tcol<>clTeal) and (Tcol2<>clTeal) then begin
    inc(Progdetect);
    Tdsled(form1.FindComponent('dsled'+inttostr((17+(Progdetect div 2))))).LedOn:=true;
    writeLog('Programmerkennung fehlgeschlagen : '+inttostr(Progdetect));
    if Progdetect>20 then begin
      writeLog('Programmerkennung fehlgeschlagen - Neustart');
      if not CheckBox2.checked then MyExitWindows(EWX_REBOOT or EWX_FORCE);
    end;
  end else begin
    for I := 1 to  Progdetect do Tdsled(form1.FindComponent('dsled'+inttostr((17+(I div 2))))).LedOn:=false;
    Progdetect:=0;
  end;
  timer3.Enabled:=true;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var num:extended;i,xread,yread:word;Tcol,Tcol2:Tcolor;tled:TdsLed;
begin
  Timer4.Enabled:=false;
  xread:=strtoint(edit4.Text);
  yread:=strtoint(edit5.Text);
  Tcol:=getcoloRat(xread,yread);
  xread:=strtoint(edit4.Text);
  yread:=strtoint(edit6.Text);
  Tcol2:=getcoloRat(xread,yread);
  num:=0;
  if ((Tcol=clTeal) and (tcol2=clTeal)) then begin
    dsLed1.OnColor:=cllime;
    dsled30.LedOn:=true;
    for I := 1 to 8 do TdsLed(findcomponent('DigiPoint_'+inttostr(I))).LedOn:=(GetColorat(1,I)=clOlive);
    for I := 1 to 8 do if GetColorat(1,I)=clOlive then Num:=num+power(2,I);
    Label18.Caption:=inttostr(round(num));
    Timer4.Enabled:=true;
  end else begin
    dsled30.LedOn:=False;
    Timer4.enabled:=true;
  end;
end;

procedure TForm1.UpdateSekundenTimerTimer(Sender: TObject);
begin
  UpdateSekundenTimer.enableD:=false;
  Dec(WaitUpdateSekunden);
  UpdTimerLabel.caption:=inttostR(WaitUpdateSekunden);
  Dsled31.LedOn:=not Dsled31.LedOn;
  if WaitUpdateSekunden=10 then begin
    Dsled31.OnColor:=clYellow;
    Dsled31.LedOn:=true;
  end;
  if WaitUpdateSekunden=0 then begin
    if fileexists('C:\TSS\WebTemp\Config\Update.cmd') then begin
      Dsled31.OnColor:=clgreen;
      Dsled31.LedOn:=true;
      if RunUpdate('C:\TSS\WebTemp\Config\Update.cmd') or (UpdateErrorcount=3) then DeleteFile('C:\TSS\WebTemp\Config\Update.cmd') else inc(UpdateErrorcount);
    end else begin
      Dsled31.OnColor:=clred;
      Dsled31.LedOn:=true;
    end;
    WaitUpdateSekunden:=300
  end;
  UpdateSekundenTimer.enableD:=true;
end;

function TForm1.MyExitWindows(RebootParam: Longword): Boolean;
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

procedure TForm1.WMCOPYDATA(var msg: TWMCopyData);
var
  MyRecord: PMyFileRecord;
  b: integer;
  s: String[255];
begin
  b := PMyFileRecord(msg.CopyDataStruct.lpData)^.b;
  s := PMyFileRecord(msg.CopyDataStruct.lpData)^.s;
  if b=1 then Label7.caption := s;
end;


initialization
  WM_OURMESSAGE := RegisterWindowMessage('TSS_broadcast Command_message');
  WM_OURMESSAGETEXT := RegisterWindowMessage('TSS_broadcast Text_message');


end.

