unit TSS_FE_DataForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Phys.MySQLDef,system.inifiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, DsFancyButton,IdBaseComponent,
  IdComponent, IdTCPConnection, IdDNSResolver, IdTCPClient, IdFinger, IdRawBase,
  IdRawClient, IdIcmpClient, OverbyteIcsWndControl, OverbyteIcsPing,TSS_Wifi,TSS_ButtonClass_unit,System.Generics.Collections,Dateutils;

type
  W4Array = array[1..4] of Word;
  S4Array = array[1..4] of String;

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
    TSS_FE_LogQuery: TFDQuery;
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
    FButtonOffset_X: integer;
    FButtonOffset_Y: integer;
    FDoScreenshot: Boolean;
    FSomeEdited: Boolean;
    FPopup_X: integer;
    FPopup_Y: integer;
    FEditMode: Boolean;
    FEditorCode: String;
    FCodeEditorInput: boolean;
    FCodeSpecialInput: boolean;
    FSpecialCode: String;
    FCfgInifile: String;
    FCodeMode: Boolean;
    FCenterPanelTop: Word;
    FCenterPanelLeft: Word;
    FCenterPanelHeight: Word;
    FCenterPanelWidth: Word;
    FCenterOpenSpeed: Word;
    FCloseButtonCustom: Boolean;
    FCloseButtonCount: Word;
    FCloseButtonWidth: TStringList;
    FCloseButtonImage: TStringList;
    FCloseButtonText: TStringList;
    FCloseButtonTop: TStringList;
    FCloseButtonHeight: TStringList;
    FCloseButtonLeft: TStringList;
    FCloseButtonVAlign: TStringList;
    FCloseButtonAlign: TStringList;
    FUseMediaPlayer: Boolean;
    FvlcPath: string;
    FShellmode: Boolean;
    FShowInfoTime: boolean;
    FClickTimeout: word;
    FDisplayScreen: word;
    FDisplayMonitor: Word;
    FDisplayID: String;
    FMainPath: String;
    FHasSignage: Boolean;
    FSignage_H: Integer;
    FSignage_X: Integer;
    FSignage_Y: Integer;
    FSignage_W: Integer;
    FSignageType: word;
    FSignageTaken: Boolean;
    FBackgroundImage: string;
    FUDPResponder_receiver: Boolean;
    FUDPResponder: Boolean;
    FUDPResponder_port: word;
    FUDPResponder_Host: string;
    FSignageWindowName: String;
    FMixPlayList: Boolean;
    FMainform_X: integer;
    FMainform_Y: integer;
    FMainform_W: integer;
    FMainform_H: integer;
    FStretchClickContent: boolean;
    procedure SetSystemOffline(const Value: Boolean);
    function GetSystemOffline: Boolean;
    procedure SetDebugmode(const Value: Boolean);
    procedure SetMaxLogSize(const Value: Word);
    procedure SetPopupButton(const Value: TTSS_Button);
    procedure SetButtonOffset_X(const Value: integer);
    procedure SetButtonOffset_Y(const Value: integer);
    procedure SetDoScreenshot(const Value: Boolean);
    procedure SetSomeEdited(const Value: Boolean);
    procedure SetPopup_X(const Value: integer);
    procedure SetPopup_Y(const Value: integer);
    procedure SetEditMode(const Value: Boolean);
    procedure SetEditorCode(const Value: String);
    procedure SetCodeEditorInput(const Value: boolean);
    procedure SetCodeSpecialInput(const Value: boolean);
    procedure SetSpecialCode(const Value: String);
    procedure SetCfgInifile(const Value: String);
    procedure SetCodeMode(const Value: Boolean);
    procedure SetCenterPanelHeight(const Value: Word);
    procedure SetCenterPanelLeft(const Value: Word);
    procedure SetCenterPanelTop(const Value: Word);
    procedure SetCenterPanelWidth(const Value: Word);
    procedure SetCenterOpenSpeed(const Value: Word);
    procedure SetCloseButtonCount(const Value: Word);
    procedure SetCloseButtonCustom(const Value: Boolean);
    procedure SetUseMediaPlayer(const Value: Boolean);
    procedure SetvlcPath(const Value: string);
    procedure SetShellmode(const Value: Boolean);
    procedure SetShowInfoTime(const Value: boolean);
    procedure SetClickTimeout(const Value: word);
    procedure SetDisplayScreen(const Value: word);
    procedure SetDisplayMonitor(const Value: Word);
    procedure SetDisplayID(const Value: String);
    procedure SetMainPath(const Value: String);
    procedure SetHasSignage(const Value: Boolean);
    procedure SetSignage_H(const Value: Integer);
    procedure SetSignage_W(const Value: Integer);
    procedure SetSignage_X(const Value: Integer);
    procedure SetSignage_Y(const Value: Integer);
    procedure SetSignageType(const Value: word);
    procedure SetSignageTaken(const Value: Boolean);
    procedure SetBackgroundImage(const Value: string);
    procedure SetUDPResponder(const Value: Boolean);
    procedure SetUDPResponder_port(const Value: word);
    procedure SetUDPResponder_receiver(const Value: Boolean);
    procedure SetUDPResponder_Host(const Value: string);
    procedure SetSignageWindowName(const Value: String);
    procedure SetMixPlayList(const Value: Boolean);
    procedure SetMainform_H(const Value: integer);
    procedure SetMainform_W(const Value: integer);
    procedure SetMainform_X(const Value: integer);
    procedure SetMainform_Y(const Value: integer);
    procedure SetStretchClickContent(const Value: boolean);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Global_Schematic_id:String;
    specialContentID:String;
    Update_id:String;
    CenterVideoFile:String;
    SchematicFile:String;
    DisplayFile:String;
    ButtonsAktiv:boolean;
    OnlineRun:boolean;
    specialContent:Boolean;
    specialContentTimer:Boolean;
    specialContentdone:Boolean;
    specialContentTimerDay:TDatetime;
    specialContentTimerTime:TDatetime;
    specialContentTyp:integer;
    specialContentGallery:String;
    specialContentCodeMode:Boolean;
    indebug,finished:boolean;
    Pingstate:integer;
    dnsHost:string;
    stopExpetion:boolean;
    Wifi:TWifiObj;
    ButtonList:TObjectList<TTSS_Button>;
    PartnerContentTyp:word;
    PartnerContentFile:String;
    PartnerContentPos_x,PartnerContentPos_y,PartnerContentsize_w,PartnerContentSize_h:Word;
    XiboHandle:HWND;
    property SystemOffline:Boolean read GetSystemOffline write SetSystemOffline;
    property ClickTimeout:word read FClickTimeout write SetClickTimeout;
    property MaxLogSize:Word read FMaxLogSize write SetMaxLogSize;
    property PopupButton:TTSS_Button read FPopupButton write SetPopupButton;
    property Popup_X:integer read FPopup_X write SetPopup_X;
    property Popup_Y:integer read FPopup_Y write SetPopup_Y;
    property ButtonOffset_X:integer read FButtonOffset_X write SetButtonOffset_X;
    property ButtonOffset_Y:integer read FButtonOffset_Y write SetButtonOffset_Y;
    property DisplayScreen:word read FDisplayScreen write SetDisplayScreen;
    property DisplayID:String read FDisplayID write SetDisplayID;
    property DisplayMonitor:Word read FDisplayMonitor write SetDisplayMonitor;
    property Debugmode:Boolean read FDebugmode write SetDebugmode;
    property Shellmode:Boolean read FShellmode write SetShellmode;
    property CfgInifile:String read FCfgInifile write SetCfgInifile;
    property DoScreenshot:Boolean read FDoScreenshot write SetDoScreenshot;
    property MainPath:String read FMainPath write SetMainPath;
    property EditMode:Boolean read FEditMode write SetEditMode;
    property CodeMode:Boolean read FCodeMode write SetCodeMode;
    property SomeEdited:Boolean read FSomeEdited write SetSomeEdited;
    property EditorCode:String read FEditorCode write SetEditorCode;
    property SpecialCode:String read FSpecialCode write SetSpecialCode;
    property HasSignage:Boolean read FHasSignage write SetHasSignage;
    property SignageTaken:Boolean read FSignageTaken write SetSignageTaken;
    property Signage_X:Integer read FSignage_X write SetSignage_X;
    property Signage_Y:Integer read FSignage_Y write SetSignage_Y;
    property Signage_W:Integer read FSignage_W write SetSignage_W;
    property Signage_H:Integer read FSignage_H write SetSignage_H;
    property SignageType:word read FSignageType write SetSignageType;
    property SignaBackgroundImage:string read FBackgroundImage write SetBackgroundImage;
    property SignageWindowName:String read FSignageWindowName write SetSignageWindowName;
    property CodeEditorInput:boolean read FCodeEditorInput write SetCodeEditorInput;
    property CodeSpecialInput:boolean read FCodeSpecialInput write SetCodeSpecialInput;
    property CenterPanelTop: Word read FCenterPanelTop write SetCenterPanelTop;
    property CenterPanelHeight: Word read FCenterPanelHeight write SetCenterPanelHeight;
    property CenterPanelLeft: Word read FCenterPanelLeft write SetCenterPanelLeft;
    property CenterPanelWidth: Word read FCenterPanelWidth write SetCenterPanelWidth;
    property CenterOpenSpeed: Word read FCenterOpenSpeed write SetCenterOpenSpeed;
    property CloseButtonCustom: Boolean read FCloseButtonCustom write SetCloseButtonCustom;
    property CloseButtonCount: Word read FCloseButtonCount write SetCloseButtonCount;
    property CloseButtonAlign: TStringList read FCloseButtonAlign write FCloseButtonAlign;
    property CloseButtonVAlign:TStringList read FCloseButtonVAlign write FCloseButtonVAlign;
    property CloseButtonLeft:TStringList read FCloseButtonLeft write FCloseButtonLeft;
    property CloseButtonTop:TStringList read FCloseButtonTop write FCloseButtonTop;
    property CloseButtonWidth:TStringList read FCloseButtonWidth write FCloseButtonWidth;
    property CloseButtonHeight:TStringList read FCloseButtonHeight write FCloseButtonHeight;
    property CloseButtonImage:TStringList read FCloseButtonImage write FCloseButtonImage;
    property CloseButtonText:TStringList read FCloseButtonText write FCloseButtonText;
    property ShowInfoTime:boolean read FShowInfoTime write SetShowInfoTime;
    property BackgroundImage:string read FBackgroundImage write SetBackgroundImage;
    property vlcPath:string read FvlcPath write SetvlcPath;
    property UseMediaPlayer:Boolean read FUseMediaPlayer write SetUseMediaPlayer;
    property UDPResponder:Boolean read FUDPResponder write SetUDPResponder;
    property UDPResponder_Host:string read FUDPResponder_Host write SetUDPResponder_Host;
    property UDPResponder_Port:word read FUDPResponder_port write SetUDPResponder_port;
    property UDPResponder_receiver:Boolean read FUDPResponder_receiver write SetUDPResponder_receiver;
    property MixPlayList:Boolean read FMixPlayList write SetMixPlayList;
    property StretchClickContent:boolean read FStretchClickContent write SetStretchClickContent;
    property Mainform_X:integer read FMainform_X write SetMainform_X;
    property Mainform_Y:integer read FMainform_Y write SetMainform_Y;
    property Mainform_W:integer read FMainform_W write SetMainform_W;
    property Mainform_H:integer read FMainform_H write SetMainform_H;
    procedure writeDBLog(LogCode,s,Data:string;l:integer);
    procedure UpdateCfg(filename:string;LineNR:word;Value:String);
    procedure SwitchDebugmode;
    function MYCreateGuid: String;
    procedure saveButtonFile;
    procedure writeIniValue(Inifile,section,field,value:string);
    procedure writeIniValueBB(Inifile, section, field: string; value: Boolean);
    procedure writeIniValueB(Inifile, section, field: string; value: Boolean);
    function FindWindowByTitle(WindowTitle: string): Hwnd;
  end;

var
  DataForm: TDataForm;
  inrequest:boolean;

implementation

{$R *.dfm}

uses TSS_FE_MainScreen;

{ TDataForm }

function TDataForm.FindWindowByTitle(WindowTitle: string): Hwnd;
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

procedure TDataForm.FormCreate(Sender: TObject);
begin
  ButtonList:=TObjectList<TTSS_Button>.create;
  CloseButtonAlign:=TStringList.Create;
  CloseButtonVAlign:=TStringList.create;
  CloseButtonLeft:=TStringList.create;
  CloseButtonTop:=TStringList.create;
  CloseButtonWidth:=TStringList.create;
  CloseButtonHeight:=TStringList.create;
  CloseButtonImage:=TStringList.create;
  CloseButtonText:=TStringList.create;
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
//        Ping1.DnsLookup(dataform.dnsHost);
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
  if (Error <> 0) or (1=1) then begin
        FSystemOffline:=true;
        MainDisplayForm.dsLed8.OnColor:=clred;
        MainDisplayForm.dsLed8.LedOn:=true;
        MainDisplayForm.dsLed8.Repaint;
        Pingstate:=2;
      Exit;
  end else begin
    Try
//      Ping1.Address:=Ping1.DnsResult;
//      retvalue := Ping1.Ping;
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

procedure TDataForm.saveButtonFile;
var IniPl:TIniFile;a:worD;
begin
  IniPl:=TInifile.Create(Dataform.SchematicFile);
  IniPl.WriteInteger('Common','Buttons',DataForm.ButtonList.count);
  for a := 0 to DataForm.ButtonList.count-1 do IniPl.WriteString('Common','Button'+inttostr(a+1),DataForm.ButtonList.items[a].Buttonid);
end;

procedure TDataForm.SetBackgroundImage(const Value: string);
begin
  FBackgroundImage := Value;
end;

procedure TDataForm.SetButtonOffset_X(const Value: integer);
begin
  FButtonOffset_X := Value;
end;

procedure TDataForm.SetButtonOffset_Y(const Value: integer);
begin
  FButtonOffset_Y := Value;
end;

procedure TDataForm.SetCenterOpenSpeed(const Value: Word);
begin
  FCenterOpenSpeed := Value;
end;

procedure TDataForm.SetCenterPanelHeight(const Value: Word);
begin
  FCenterPanelHeight := Value;
end;

procedure TDataForm.SetCenterPanelLeft(const Value: Word);
begin
  FCenterPanelLeft := Value;
end;

procedure TDataForm.SetCenterPanelTop(const Value: Word);
begin
  FCenterPanelTop := Value;
end;

procedure TDataForm.SetCenterPanelWidth(const Value: Word);
begin
  FCenterPanelWidth := Value;
end;

procedure TDataForm.SetCfgInifile(const Value: String);
begin
  FCfgInifile := Value;
end;


procedure TDataForm.SetClickTimeout(const Value: word);
begin
  FClickTimeout := Value;
end;

procedure TDataForm.SetCloseButtonCount(const Value: Word);
begin
  FCloseButtonCount := Value;
end;

procedure TDataForm.SetCloseButtonCustom(const Value: Boolean);
begin
  FCloseButtonCustom := Value;
end;



procedure TDataForm.SetCodeEditorInput(const Value: boolean);
begin
  FCodeEditorInput := Value;
end;

procedure TDataForm.SetCodeMode(const Value: Boolean);
begin
  FCodeMode := Value;
end;

procedure TDataForm.SetCodeSpecialInput(const Value: boolean);
begin
  FCodeSpecialInput := Value;
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

procedure TDataForm.SetDisplayID(const Value: String);
begin
  FDisplayID := Value;
end;

procedure TDataForm.SetDisplayMonitor(const Value: Word);
begin
  FDisplayMonitor := Value;
end;

procedure TDataForm.SetDisplayScreen(const Value: word);
begin
  FDisplayScreen := Value;
end;

procedure TDataForm.SetDoScreenshot(const Value: Boolean);
begin
  FDoScreenshot := Value;
  MainDisplayForm.ScreensaveTimer.enabled:=FDoScreenshot;
end;

procedure TDataForm.SetEditMode(const Value: Boolean);
var a:word;
begin
  FEditMode := Value;
  for a:= 0 to ButtonList.Count-1 do begin
    ButtonList.items[a].SetInfoLED(Value);
  end;
end;

procedure TDataForm.SetEditorCode(const Value: String);
begin
  FEditorCode := Value;
end;

procedure TDataForm.SetHasSignage(const Value: Boolean);
begin
  FHasSignage := Value;
end;

function TDataForm.MYCreateGuid: String;
var uuid:TGuid;
begin
  CreateGUID(uuid);
  Result:=GUIDToString(uuid);
end;

procedure TDataForm.SetMainform_H(const Value: integer);
begin
  FMainform_H := Value;
end;

procedure TDataForm.SetMainform_W(const Value: integer);
begin
  FMainform_W := Value;
end;

procedure TDataForm.SetMainform_X(const Value: integer);
begin
  FMainform_X := Value;
end;

procedure TDataForm.SetMainform_Y(const Value: integer);
begin
  FMainform_Y := Value;
end;

procedure TDataForm.SetMainPath(const Value: String);
begin
  FMainPath := Value;
end;

procedure TDataForm.SetMaxLogSize(const Value: Word);
begin
  FMaxLogSize := Value;
end;

procedure TDataForm.SetMixPlayList(const Value: Boolean);
begin
  FMixPlayList := Value;
end;

procedure TDataForm.SetPopupButton(const Value: TTSS_Button);
begin
  FPopupButton := Value;
end;

procedure TDataForm.SetPopup_X(const Value: integer);
begin
  FPopup_X := Value;
end;

procedure TDataForm.SetPopup_Y(const Value: integer);
begin
  FPopup_Y := Value;
end;

procedure TDataForm.SetShellmode(const Value: Boolean);
begin
  FShellmode := Value;
end;

procedure TDataForm.SetShowInfoTime(const Value: boolean);
begin
  FShowInfoTime := Value;
end;

procedure TDataForm.SetSignageTaken(const Value: Boolean);
begin
  FSignageTaken := Value;
end;

procedure TDataForm.SetSignageType(const Value: word);
begin
  FSignageType := Value;
end;

procedure TDataForm.SetSignageWindowName(const Value: String);
begin
  FSignageWindowName := Value;
end;

procedure TDataForm.SetSignage_H(const Value: Integer);
begin
  FSignage_H := Value;
end;

procedure TDataForm.SetSignage_W(const Value: Integer);
begin
  FSignage_W := Value;
end;

procedure TDataForm.SetSignage_X(const Value: Integer);
begin
  FSignage_X := Value;
end;

procedure TDataForm.SetSignage_Y(const Value: Integer);
begin
  FSignage_Y := Value;
end;

procedure TDataForm.SetSomeEdited(const Value: Boolean);
begin
  FSomeEdited := Value;
  MainDisplayForm.Buttonneuladen1.Enabled:=FSomeEdited;
  MainDisplayForm.Buttonspeichern1.Enabled:=FSomeEdited;
  MainDisplayForm.Menuitem30.Enabled:=FSomeEdited;
  MainDisplayForm.Menuitem31.Enabled:=FSomeEdited;
end;

procedure TDataForm.SetSpecialCode(const Value: String);
begin
  FSpecialCode := Value;
end;

procedure TDataForm.SetStretchClickContent(const Value: boolean);
begin
  FStretchClickContent := Value;
end;

procedure TDataForm.SetSystemOffline(const Value: Boolean);
begin
  FSystemOffline := Value;
end;

procedure TDataForm.SetUDPResponder(const Value: Boolean);
begin
  FUDPResponder := Value;
end;

procedure TDataForm.SetUDPResponder_Host(const Value: string);
begin
  FUDPResponder_Host := Value;
end;

procedure TDataForm.SetUDPResponder_port(const Value: word);
begin
  FUDPResponder_port := Value;
end;

procedure TDataForm.SetUDPResponder_receiver(const Value: Boolean);
begin
  FUDPResponder_receiver := Value;
end;

procedure TDataForm.SetUseMediaPlayer(const Value: Boolean);
begin
  FUseMediaPlayer := Value;
end;

procedure TDataForm.SetvlcPath(const Value: string);
begin
  FvlcPath := Value;
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
var f:textfile;stemp,DriveLetteR:String;_hwnd:HWND;CopyDataStruc:TCopyDataStruct;MyMsg:string;
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
  sTemp:='['''+datetostr(now)+''':'''+timetostr(now)+'''] '''+LogCode+''','''+s+''','''+Data+''','+inttostr(l);
  writeln(f,sTemp);
  closefile(f);
  _hwnd:=DataForm.FindWindowByTitle('Logumedia System OS');
  CopyDataStruc.dwData:=WM_LOGENTRY;
  CopyDataStruc.cbData:=length(sTemp)*sizeof(char);
  CopyDataStruc.lpData:=pchar(Stemp);
  SendMessage(_hwnd, WM_COPYDATA , application.Handle, LPARAM(@CopyDataStruc));
end;

procedure TDataForm.writeIniValue(Inifile, section, field, value: string);
var
    IniPl:TIniFile;
begin
  IniPl:=TInifile.Create(Inifile);
  IniPl.WriteString(Section,Field,Value);
end;

procedure TDataForm.writeIniValueB(Inifile, section, field: string;value:Boolean);
var
    IniPl:TIniFile;
begin
  IniPl:=TInifile.Create(Inifile);
  IniPl.WriteBool(section,Field,Value);
end;

procedure TDataForm.writeIniValueBB(Inifile, section, field: string;
  value: Boolean);
begin

end;

end.
