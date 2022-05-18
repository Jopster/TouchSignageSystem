unit TSS_FE_DataForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, DsFancyButton,IdBaseComponent,
  IdComponent, IdTCPConnection, IdDNSResolver, IdTCPClient, IdFinger, IdRawBase,
  IdRawClient, IdIcmpClient, OverbyteIcsWndControl, OverbyteIcsPing,TSS_Wifi,TSS_ButtonClass_unit,System.Generics.Collections;

type
  TDataForm = class(TForm)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    TSS_FE_Connection: TFDConnection;
    TSS_FE_DisplayList: TFDTable;
    FDTransaction1: TFDTransaction;
    TSS_FE_DisplayConfig: TFDQuery;
    TSS_FE_SchematicData: TFDQuery;
    TSS_FE_MediaData: TFDQuery;
    TSS_FE_Playlists: TFDQuery;
    TSS_FE_AlgQuery: TFDQuery;
    TSS_FE_AlgQuery2: TFDQuery;
    DsFancyButton1: TDsFancyButton;
    TSS_FE_LogQuery: TFDQuery;
    Ping1: TPing;
    procedure TSS_FE_ConnectionError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure TSS_FE_AlgQueryError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure TSS_FE_LogQueryError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure TSS_FE_ConnectionAfterConnect(Sender: TObject);
    procedure Ping1BgException(Sender: TObject; E: Exception;
      var CanClose: Boolean);
    procedure Ping1DnsLookupDone(Sender: TObject; Error: Word);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FSystemOffline: Boolean;
    FDebugmode: Boolean;
    FMaxLogSize: Word;
    FPopupButton: TTSS_Button;
    procedure SetSystemOffline(const Value: Boolean);
    function GetSystemOffline: Boolean;
    procedure SetDebugmode(const Value: Boolean);
    procedure SetMaxLogSize(const Value: Word);
    procedure SetPopupButton(const Value: TTSS_Button);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Global_Schematic_id:String;
    specialContentID:String;
    DisplayID:String;
    Update_id:String;
    CenterVideoFile:String;
    SchematicFile:String;
    DisplayFile:String;
    MainPath:String;
    ButtonsAktiv:boolean;
    OnlineRun:boolean;
    specialContent:Boolean;
    specialContentTyp:integer;
    specialContentGallery:String;
    indebug,finished:boolean;
    Pingstate:integer;
    dnsHost:string;
    stopExpetion:boolean;
    Wifi:TWifiObj;
    DisplayScreen:word;
    ButtonList:TObjectList<TTSS_Button>;
    property SystemOffline:Boolean read GetSystemOffline write SetSystemOffline;
    property Debugmode:Boolean read FDebugmode write SetDebugmode;
    property MaxLogSize:Word read FMaxLogSize write SetMaxLogSize;
    property PopupButton:TTSS_Button read FPopupButton write SetPopupButton;
    procedure writeDBLog(LogCode,s,Data:string;l:integer);
    procedure UpdateCfg(filename:string;LineNR:word;Value:String);
    procedure SwitchDebugmode;
  end;

var
  DataForm: TDataForm;
  inrequest:boolean;

implementation

{$R *.dfm}

uses TSS_FE_MainScreen;

{ TDataForm }

procedure TDataForm.FormCreate(Sender: TObject);
begin
  ButtonList:=TObjectList<TTSS_Button>.create;
end;

procedure TDataForm.FormDestroy(Sender: TObject);
begin
  Freeandnil(ButtonList);
end;

function TDataForm.GetSystemOffline: Boolean;
begin
  pingstate:=0;
  if not DataForm.OnlineRun then begin
    MainDisplayForm.dsLed8.OnColor:=clblue;
    MainDisplayForm.dsLed8.LedOn:=True;
    MainDisplayForm.dsLed8.Repaint;
  end else begin
    try
      if not inrequest then begin
        inrequest:=true;
        Ping1.DnsLookup(dataform.dnsHost);
      end;
    finally
      MainDisplayForm.dsLed8.OnColor:=clyellow;
      MainDisplayForm.dsLed8.LedOn:=True;
      MainDisplayForm.dsLed8.Repaint;
      repeat
        Application.ProcessMessages;
      until Pingstate<>0;
      MainDisplayForm.dsLed8.OnColor:=cllime;
      MainDisplayForm.dsLed8.LedOn:=not FSystemOffline;
      MainDisplayForm.dsLed8.Repaint;
       Result:= FSystemOffline;
    end;
  end;
end;

procedure TDataForm.Ping1BgException(Sender: TObject; E: Exception;
  var CanClose: Boolean);
begin
  canclose:=true;
  inrequest:=false;
end;

procedure TDataForm.Ping1DnsLookupDone(Sender: TObject; Error: Word);
var retvalue:integer;
begin
  inrequest:=false;
  if (Error <> 0) or (Ping1.DnsResult='') then begin
        FSystemOffline:=true;
        MainDisplayForm.dsLed8.OnColor:=clred;
        MainDisplayForm.dsLed8.LedOn:=true;
        MainDisplayForm.dsLed8.Repaint;
        Pingstate:=2;
      Exit;
  end else begin
    Try
      Ping1.Address:=Ping1.DnsResult;
      retvalue := Ping1.Ping;
      if retvalue = 0 then begin
        FSystemOffline:=true;
        MainDisplayForm.dsLed8.OnColor:=clred;
        MainDisplayForm.dsLed8.LedOn:=true;
        MainDisplayForm.dsLed8.Repaint;
        Pingstate:=2;
      end else begin
        FSystemOffline:=False;
        MainDisplayForm.dsLed8.OnColor:=cllime;
        MainDisplayForm.dsLed8.LedOn:=true;
        MainDisplayForm.dsLed8.Repaint;
        Pingstate:=1;
      end;
      Exit;
    Finally
    End;
  end;
end;

procedure TDataForm.SetDebugmode(const Value: Boolean);
var a:word;
begin
  FDebugmode := Value;
  MainDisplayForm.DebugLed.ledon:=Value;
    a:=0;
    repeat
      if MainDisplayForm.Components[a].ClassName='TTSS_Button' then begin
        TTSS_Button(MainDisplayForm.Components[a]).EBGImage.ShowHint:=FDebugmode;
      end;
      inc(a);
    until a=MainDisplayForm.ComponentCount;
end;

procedure TDataForm.SetMaxLogSize(const Value: Word);
begin
  FMaxLogSize := Value;
end;

procedure TDataForm.SetPopupButton(const Value: TTSS_Button);
begin
  FPopupButton := Value;
end;

procedure TDataForm.SetSystemOffline(const Value: Boolean);
begin
  FSystemOffline := Value;
end;

procedure TDataForm.SwitchDebugmode;
var
  a: Integer;
  sh:TTSS_Button;
begin
  Debugmode:=not Debugmode;
  for a := 0 to ButtonList.Count-1 do begin
    if Debugmode then begin
      sh:=ButtonList.Items[a];
      sh.Hint:=sh.Buttonid+#13#10+Sh.ButtonimgFilename;
      sh.EBGImage.Hint:=sh.Hint;
      sh.ShowHint:=true;
      sh.EBGImage.ShowHint:=true;
    end else begin
      sh.ShowHint:=false;
      sh.EBGImage.ShowHint:=False;
    end;
  end;
end;

procedure TDataForm.TSS_FE_AlgQueryError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  AException:=nil;
end;

procedure TDataForm.TSS_FE_ConnectionAfterConnect(Sender: TObject);
begin
  SystemOffline:=false;
end;

procedure TDataForm.TSS_FE_ConnectionError(ASender, AInitiator: TObject;
  var AException: Exception);
var AM:String;
begin
  AException.Destroy;
  AException:=nil;
  TSS_FE_Connection.Connected:=false;
  DataForm.SystemOffline:=true;
end;

procedure TDataForm.TSS_FE_LogQueryError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  AException:=nil;
end;

function DateLogName:string;
var s:string;
begin
  s:=datetostr(now);
  deletE(s,3,1);
  deletE(s,5,1);
  DateLogName:=s;
end;

procedure TDataForm.UpdateCfg(filename: string; LineNR: word; Value: String);
var f,f2:textfile;
  a: Integer;
  s:String;
begin
  RenameFile(filename,filename+'_');
  assignfile(f,filename+'_');
  reset(f);
  assignfile(f2,filename);
  rewrite(f2);
  a:=0;
  repeat
    a:=a+1;
    if (a = LineNR) then begin
      readln(f,s);
      writeln(f2,Value);
    end else begin
      readln(f,s);
      writeln(f2,s);
    end;
  until eof(f) or (a>12);
  closefile(f);
  closefilE(f2);
  DeleteFile(filename+'_');
end;

 function FileSize(const aFilename: String): Int64;
  var
    info: TWin32FileAttributeData;
  begin
    result := -1;

    if NOT GetFileAttributesEx(PWideChar(aFileName), GetFileExInfoStandard, @info) then
      EXIT;

    result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
  end;

procedure TDataForm.writeDBLog(LogCode, s,Data: string;l:integer);
var f:textfile;DriveLetteR:String;
begin
  if Dataform.MainPath='' then DriveLetteR:='C' else DriveLetteR:=Dataform.MainPath[1];
  if not DirectoryExists(DriveLetter+':\TSS\Loggs\') then CreateDir(DriveLetter+':\TSS\Loggs\');
  if Dataform.OnlineRun then begin
    if not Dataform.SystemOffline then Begin
      TSS_FE_LogQuery.Close;
      TSS_FE_LogQuery.SQL.Text:='Insert into logdata (Datum,Zeit,Code,Beschreibung,data,Level) Values ('''+datetostr(now)+''','''+timetostr(now)+''','''+LogCode+''','''+s+''','''+Data+''','''+inttostr(l)+''');';
      TSS_FE_LogQuery.ExecSQL;
      if TSS_FE_LogQuery.RowsAffected<1 then begin
        if indebug then MessageDlg('LogFehler !',mtwarning,mbOKCancel,0);
      end;
    end else begin
      AssignFile(f,DriveLetter+':\TSS\Loggs\TSS_FE.log_DB');
      if FileExists(DriveLetter+':\TSS\Loggs\TSS_FE.log_DB') then Append(f) else rewrite(f);
      writeln(f,'Insert into logdata (Datum,Zeit,Code,Beschreibung,data,Level) Values ('''+datetostr(now)+''','''+timetostr(now)+''','''+LogCode+''','''+s+''','''+Data+''','''+inttostr(l)+''');');
      closefile(f);
    end;
  end else begin
    AssignFile(f,DriveLetter+':\TSS\Loggs\TSS_FE.log_DB');
    if FileExists(DriveLetter+':\TSS\Loggs\TSS_FE.log_DB') then append(f) else rewrite(f);
    writeln(f,'Insert into logdata (Datum,Zeit,Code,Beschreibung,data,Level) Values ('''+datetostr(now)+''','''+timetostr(now)+''','''+LogCode+''','''+s+''','''+Data+''','''+inttostr(l)+''');');
    closefile(f);
  end;
  if FileSize(DriveLetter+':\TSS\Loggs\TSS_FE.log')>FMaxLogSize then begin
    RenameFile(DriveLetter+':\TSS\Loggs\TSS_FE.log',DriveLetter+':\TSS\Loggs\TSS_FE'+DateLogName+'.log');
  end;
  AssignFile(f,DriveLetter+':\TSS\Loggs\TSS_FE.log');
  if FileExists(DriveLetter+':\TSS\Loggs\TSS_FE.log') then append(f) else rewrite(f);
  writeln(f,'['''+datetostr(now)+''':'''+timetostr(now)+'''] '''+LogCode+''','''+s+''','''+Data+''','+inttostr(l));
  closefile(f);
end;

end.
