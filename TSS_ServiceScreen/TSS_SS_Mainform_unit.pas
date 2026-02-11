unit TSS_SS_Mainform_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dsLeds, Vcl.ExtCtrls,
  IdContext, IdScheduler, IdSchedulerOfThread, IdSchedulerOfThreadDefault,jpeg,ScktComp,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer,TSS_SS_ServicePanelClass_unit,
  Vcl.Buttons,system.inifiles, IdTCPConnection, IdTCPClient, IdUDPBase,idsync,
  IdUDPClient, contnrs,pngimage;


type
 TReadingThread = class(TThread)
  protected
    FConn: TIdTCPConnection;
    procedure Execute; override;
  public
    constructor Create(AConn: TIdTCPConnection); reintroduce;
  end;

  TLog = class(TIdSync)
  protected
    FMsg: String;
    procedure DoSynchronize; override;
  public
    constructor Create(const AMsg: String);
    class procedure AddMsg(const AMsg: String);
  end;

  TTSS_SS_MainForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dsLed1: TdsLed;
    dsLed2: TdsLed;
    dsLed3: TdsLed;
    dsLed4: TdsLed;
    SpeedButton1: TSpeedButton;
    IdTCPClient1: TIdTCPClient;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    procedure IdTCPServer1Connect(AContext: TIdContext);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure IdTCPServer1Execute(AContext: TIdContext);
    procedure Button1Click(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure ButtonColor1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IdTCPClient1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdTCPClient1Disconnected(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private-Deklarationen }
    ServerSocket1: TServerSocket;
    procedure connectsystem;
    procedure BuildScreens(Count:word;Ids:string);
    function Convertidtoname(id:string):string;
  public
    { Public-Deklarationen }
    finished:boolean;
    D1:TTSS_ServiceScreen;
    Screencount,UDPPort:integer;
    Displays:TObjectlist;
  end;

var
  TSS_SS_MainForm: TTSS_SS_MainForm;
  Buildwait:boolean;
  GAnswere:string;
  rt: TReadingThread = nil;

implementation

{$R *.dfm}

uses TSS_SS_DataForm_unit;

procedure TTSS_SS_MainForm.BuildScreens(Count:word;Ids:string);
var ss:TTSS_ServiceScreen;a:worD;TempIds,id:String;
begin
  tempids:=ids;
  if displays.count>0 then begin
    for a := 1 to displays.count do begin
      freeandnil(displays.items[a-1]);
    end;
  end;
  for a := 1 to count do begin
    id:=Convertidtoname(Copy(tempids,1,pos(']',tempids)));
    delete(tempids,1,pos(']',tempids)+1);
    ss:=TTSS_ServiceScreen.Create(self);
    ss.left:=a*220;
    ss.top:=200;
    ss.height:=300;
    ss.width:=200;
    ss.Parent:=TSS_SS_MainForm;
    ss.Visible:=true;
    ss.BGColor:=cllime;
    ss.name:='Display_'+id;
    ss.repaint;
    Displays.add(ss);
  end;
  Buildwait:=false;
end;

procedure TTSS_SS_MainForm.Button1Click(Sender: TObject);
begin
  connectsystem;
end;

procedure TTSS_SS_MainForm.Button2Click(Sender: TObject);
begin
  if IdTCPClient1.Connected then begin
    IdTCPClient1.Socket.WriteLn('C_Count'+DataForm.WatcherID);
  end;
end;

procedure TTSS_SS_MainForm.ButtonColor1Click(Sender: TObject);
begin
  connectsystem;
end;

procedure TTSS_SS_MainForm.connectsystem;
begin
  dsLed1.OnColor:=clyellow;
  dsLed1.LedOn:=true;
  IdTCPClient1.Connect;
end;

function TTSS_SS_MainForm.Convertidtoname(id: string): string;
var s:string;a:worD;
begin
  s:=id;
  a:=1;
  while a<=length(s) do begin
    if (s[a] in ['-',':','{','}','[',']']) then delete(s,a,1) else inc(a);
  end;
  result:=s;
end;

procedure TTSS_SS_MainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=Finished;
end;

procedure TTSS_SS_MainForm.FormCreate(Sender: TObject);
begin
  inherited;
  Displays:=TObjectList.create;
end;

procedure TTSS_SS_MainForm.FormDestroy(Sender: TObject);
begin
  freeandnil(Displays);
  inherited;
end;

procedure TTSS_SS_MainForm.FormShow(Sender: TObject);
var a:word;F:TextFile;Standort,FName,SF,S3,S2,S1:String;SSP:TTSS_ServiceScreen;
    IniPl:TInifile;
begin
  finished:=false;
  if fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_SS_Init.ini') then begin
    IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_SS_Init.ini');
  end else begin
    if fileexists(Paramstr(0)[1]+':\TSS\Config\TSS_SS_Init.ini') then begin
      IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Config\TSS_SS_Init.ini');
    end else begin
      Messagedlg('Keine SS ini-Datei gefunden !'#13#10#13#10'Das Controlsystem wird ohne Einstellungen gestartet'#13#10'Bitte manuell einstellen und speichern !',TMsgDlgType.mtInformation,[mbok],0);
    end;
  end;
  if IniPl<>nil then begin
    IdTCPClient1.Port:=IniPl.ReadInteger('Common','Port',9900);
    Screencount:=IniPl.ReadInteger('Common','Screens',0);
    DataForm.WatcherID:=IniPl.ReadString('Common','WatchID','SID:Unbekannt');
  end;
(*  for a := 1 to Screencount do begin
    readln(F,S3);
    S3:=copy(S3,1,pos(' ',S3)-1);
    SSP:=TTSS_ServiceScreen.Create(self);
    SSP.Parent:=TSS_SS_MainForm;
    SSP.top:=0;
    SSP.left:=(a-1)*210;
    SSP.width:=210;
    SSP.height:=210;
    SSP.image.Picture.LoadFromFile(Dataform.MainPath+'unnamed.jpg');
    SSP.ScreenID:=S3;
    D1:=SSP;
  end;
  *)
//  IdTCPServer1.DefaultPort:=strtoint(s1);
//  IdTCPServer1.Active:=true;
end;

procedure TTSS_SS_MainForm.IdTCPClient1Connected(Sender: TObject);
begin
  dsLed1.OnColor:=cllime;
  dsLed1.LedOn:=true;
  rt := TReadingThread.Create(IdTCPClient1);
end;



procedure TTSS_SS_MainForm.IdTCPClient1Disconnected(Sender: TObject);
begin
  dsLed1.OnColor:=clred;
  dsLed1.LedOn:=false;
  if rt <> nil then begin
    rt.Terminate;
    rt.WaitFor;
    FreeAndNil(rt);
  end;
end;

procedure TTSS_SS_MainForm.IdTCPClient1Work(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  Showmessage('Hier');
end;

procedure TTSS_SS_MainForm.IdTCPServer1Connect(AContext: TIdContext);
begin
  messagebeep(0);
end;

procedure TTSS_SS_MainForm.IdTCPServer1Execute(AContext: TIdContext);
var size: integer;
    ms:TMemoryStream;
begin
  try
    dsLed1.oncolor:=cllime;
    dsled1.LedOn:=true;
    ms:=TMemoryStream.Create;
    AContext.Connection.IOHandler.readStream(ms);
    ms.Position:=0;
    D1.Image.Picture.Bitmap.LoadFromStream(ms);
    D1.Image.Repaint;
  except
    on e:exception do begin
      dsLed1.oncolor:=clred;
      dsled1.LedOn:=true;
    end;
  end;
end;


procedure TTSS_SS_MainForm.SpeedButton1Click(Sender: TObject);
begin
  finished:=true;
  Close;
end;

procedure TTSS_SS_MainForm.Timer1Timer(Sender: TObject);
var count:String;
begin
  Timer1.enabled:=false;
  Count:=copy(GAnswere, 1, pos('/',GAnswere)-1);
  Delete(GAnswere,1,pos('/',GAnswere));
  TSS_SS_MainForm.BuildScreens(strtoint(count),GAnswere);
end;

{ TReadingThread }

constructor TReadingThread.Create(AConn: TIdTCPConnection);
begin
  FConn := AConn;
  inherited Create(False);
end;

procedure TReadingThread.Execute;
var
  myMutex:THandle;
begin
  while not Terminated and FConn.Connected do begin
      myMutex := CreateMutex(nil, False, 'Connections');
      if myMutex = 0 then RaiseLastOSError;
      if WaitForSingleObject(myMutex, INFINITE) <> WAIT_OBJECT_0 then RaiseLastOSError;
      try
        TLog.AddMsg(FConn.IOHandler.ReadLn);
      finally
        ReleaseMutex(myMutex);
      end;
  end;
end;

{ TLog }

class procedure TLog.AddMsg(const AMsg: String);
begin
  with Create(AMsg) do try
    Synchronize;
    finally
    Free;
  end;
end;

constructor TLog.Create(const AMsg: String);
begin
  FMsg := AMsg;
  inherited Create;
end;

procedure TLog.DoSynchronize;
var
  dir,cmd,Count,Answere : string;
begin
  dir := copy(FMsg, 1, 1);
  delete(FMsg,1,1);
  cmd := copy(FMsg, 1, 7);
  delete(FMsg,1,7);
  Answere:=FMsg;
  if cmd='C_Count' then  begin
      Ganswere:=Answere;
      if not Buildwait then TSS_SS_MainForm.timer1.Enabled:=true;
  end else begin
    if dir='A' then  begin
    end else
    if cmd='I' then  begin
    end;
  end;
end;

end.
