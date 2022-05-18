unit TSS_DisplayClass_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,TSS_HttpButtonImgLoadThread_unit, Vcl.OleCtrls, WMPLib_TLB,
  Vcl.StdCtrls,system.inifiles;

type
  TTSS_Display = class(TControl)
    constructor Create(AOwner : TComponent); override;
  private
    BGImage: TImage;
    Mplayer1 : TWindowsMediaPLayeR;
    LoadText:TLabel;
    FLeft: Integer;
    Ftop: Integer;
    FWidth: integer;
    FHeight: integer;
    FBGColor: TColor;
    FName: String;
    FParent: TWincontrol;
    FOnMouseUp: TMouseEvent;
    FOnVideoEnd: TnotifyEvent;
    FFileList: TStrings;
    FCurrentPlayPos: Integer;
    FStopcall:boolean;
    FOnMPMouseup: TMouseEvent;
    FOnPlaying: TnotifyEvent;
    FVolume: integer;
    procedure SetFLeft(const Value: Integer);
    procedure SetFtop(const Value: Integer);
    procedure SetFWidth(const Value: integer);
    procedure SetFHeight(const Value: integer);
    procedure SetFBGColor(const Value: TColor);
    procedure SetFName(const Value: String);
    procedure SetFParent(const Value: TWincontrol);
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MPMouseUp(Sender:Tobject; Button: Smallint; Shift: smallint;
      X, Y: Integer);
    procedure PlayStateChange(ASender: TObject; NewState: Integer);
    procedure PlayingState(ASender: TObject);
    procedure SetOnMouseup(const Value: TMouseEvent);
    procedure SetOnVideoEnd(const Value: TnotifyEvent);
    procedure SetFileList(const Value: TStrings);
    procedure SetCurrentPlayPos(const Value: Integer);
    procedure SetOnMPMouseup(const Value: TMouseEvent);
    procedure SetOnPlaying(const Value: TnotifyEvent);
    procedure SetVolume(const Value: integer);
  published
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Property left:Integer read FLeft Write SetFLeft;
    Property top:Integer read Ftop Write SetFtop;
    property width:integer read FWidth Write SetFWidth;
    property height:integer read FHeight Write SetFHeight;
    property BGColor:TColor read FBGColor write SetFBGColor;
    property Name:String read FName write SetFName;
    property Parent:TWincontrol read FParent Write SetFParent;
    property OnMouseup: TMouseEvent read FOnMouseup write SetOnMouseup;
    property OnVideoEnd: TnotifyEvent read FOnVideoEnd write SetOnVideoEnd;
    property OnPlaying: TnotifyEvent read FOnPlaying write SetOnPlaying;
    property OnMPMouseup: TMouseEvent read FOnMPMouseup write SetOnMPMouseup;
    property FileList:TStrings read FFileList write SetFileList;
    property CurrentPlayPos:Integer read FCurrentPlayPos write SetCurrentPlayPos;
    property Volume:integer read FVolume write SetVolume;
    procedure initDisplay(typ:integeR);
    procedure PlayVideo(id:Word);
    procedure PlayNextVideo;
    procedure PlayNextVideo2;
    procedure DisplayAdress;
    procedure DisplayLoading;
    procedure stopVideo;
    procedure continueVideo;
    function GetNextVideoFileName:string;
    Procedure LoadDisplay(FileId,Section:string);
    Procedure SaveDisplay(FileId:string);
    procedure LoadContent(FileId,Section: string);
  end;

implementation

uses TSS_FE_DataForm,TSS_FE_MainScreen;

procedure TTSS_Display.continueVideo;
begin
  FStopcall:=false;
end;

constructor TTSS_Display.Create(AOwner: TComponent);
begin
  inherited;
    MPlayer1:=TWindowsMediaPlayer.Create(AOwner);
    Mplayer1.OnPlayStateChange:=PlayStateChange;
    Mplayer1.uiMode:='none';
    Mplayer1.stretchToFit:=true;
    Mplayer1.settings.volume:=1;
    Mplayer1.OnMouseUp:=MPMouseUp;
    Mplayer1.enableContextMenu:=false;
    Mplayer1.Show;
end;

procedure TTSS_Display.DisplayAdress;
begin
end;

procedure TTSS_Display.DisplayLoading;
begin
end;

function TTSS_Display.GetNextVideoFileName: string;
begin
  Result:=extractfilename(FFileList.Strings[FCurrentPlayPos]);
end;

procedure TTSS_Display.initDisplay(typ: integeR);
begin
  if typ=1 then begin
    BGImage:=TImage.Create(self);
    BGImage.Stretch:=true;
    BGImage.Align:=alClient;
    BGImage.AutoSize:=true;
    BGImage.Show;
  end;
end;

procedure TTSS_Display.LoadContent(FileId,Section: string);
var F:textfile;fs,Readstring:string;
    IniPl:TIniFile;
begin
  AssignFile(F,FileId);
  Reset(f);
  Readln(f,Readstring);
  Closefile(f);
  if readstring='MainDisplay' then begin
  end else begin
    IniPl:=TInifile.Create(FileId);
    if IniPl.ReadInteger(Section,'ContentFileType',0)=101 then begin
      fs:=IniPl.ReadString(Section,'ContentFile','C:\TSS\WebTemp\baustelle2.jpg');
      BGImage.Picture.LoadFromFile(Fs);
      if GetLastError>0 then begin
        MessageDlg(inttostr(GetLastError),mterror,[mbok],0);
      end;
      BGImage.Show;
    end;
    if IniPl.ReadInteger(Section,'ContentFileType',0)=102 then begin
    end;
  end;
end;

procedure TTSS_Display.LoadDisplay(FileId,Section: string);
var F:textfile;Readstring:string;
    IniPl:TIniFile;
begin
  AssignFile(F,FileId);
  Reset(f);
  Readln(f,Readstring);
  Closefile(f);
  if readstring='MainDisplay' then begin
    AssignFile(F,FileId);
    Reset(f);
    Readln(f,Readstring);
    self.Name:=ReadString;
    Readln(f,Readstring);
    self.Left:=strtoint(ReadString);
    Readln(f,Readstring);
    self.top:=strtoint(ReadString);
    Readln(f,Readstring);
    self.width:=strtoint(ReadString);
    Readln(f,Readstring);
    self.height:=strtoint(ReadString);
    Readln(f,Readstring);
    self.Tag:=strtoint(ReadString);
    Closefile(f);
  end else begin
    IniPl:=TInifile.Create(FileId);
    self.left:=IniPl.ReadInteger(Section,'left',0);
    self.top:=IniPl.ReadInteger(Section,'top',0);
    self.width:=IniPl.ReadInteger(Section,'width',0);
    self.height:=IniPl.ReadInteger(Section,'height',0);
    self.Tag:=IniPl.ReadInteger(Section,'IDTag',0);
  end;
  if BGImage<>nil then begin
    BGImage.left:=self.left;
    BGImage.top:=self.top;
    BGImage.height:=self.height;
    BGImage.width:=self.width;
  end;
  if MPlayer1<>nil then begin
    MPlayer1.left:=self.left;
    MPlayer1.top:=self.top;
    MPlayer1.height:=self.height;
    MPlayer1.width:=self.width;
  end;
end;

procedure TTSS_Display.Mouseup(Button: TMouseButton; Shift: TShiftState;X, Y: Integer);
begin
  MessageBeep(0);
end;

procedure TTSS_Display.MPMouseUp(sender:Tobject; Button, Shift: smallint; X, Y: Integer);
begin
  Abort;
end;

procedure TTSS_Display.PlayStateChange(ASender: TObject; NewState: Integer);
begin
  DataForm.writeDBLog('RUN_PLAYVIDEO','Video Playstate :',inttostr(NewState),9);
  if (NewState = wmppsPlaying) then begin
    TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=falsE;
  end;
  if (NewState = wmppsReady) then begin
    inc(FCurrentPlayPos);
    if FCurrentPlayPos>(FFilelist.Count-1) then FCurrentPlayPos:=0;
    TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=falsE;
    TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=true;
  end;
  if (NewState = wmppsStopped) then begin
    TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=falsE;
    FOnVideoEnd(ASender);
  end;
end;

procedure TTSS_Display.PlayVideo(id:word);
begin
  if not FStopcall then begin
    if FFileList.Count>0 then begin
      Mplayer1.URL:='file://'+FFileList.Strings[id];
      Mplayer1.BringToFront;
      Mplayer1.Show;
    end;
  end;
end;

procedure TTSS_Display.PlayingState(ASender: TObject);
begin
  TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=falsE;
end;

procedure TTSS_Display.PlayNextVideo;
var s:string;
begin
  if not FStopcall then begin
    Mplayer1.controls.stop;
    if (FCurrentPlayPos+1)<=FFileList.Count then begin
      if fileexists(FFileList.Strings[FCurrentPlayPos]) then begin
        Mplayer1.URL:='file://'+FFileList.Strings[FCurrentPlayPos];
        DataForm.writeDBLog('RUN_PLAYVIDEO','Video Abspielen :'+FFileList.Strings[FCurrentPlayPos],inttostr(FCurrentPlayPos),9);
      end else begin
        s:=FFileList.Strings[FCurrentPlayPos];
        s[1]:=ParamStr(0)[1];
        if fileexistS(s) then begin
          Mplayer1.URL:='file://'+s;
          DataForm.writeDBLog('RUN_PLAYVIDEO','Video Abspielen :'+s,inttostr(FCurrentPlayPos),9);
        end else begin
          DataForm.writeDBLog('RUN_PLAYVIDEO','Video failed :'+s,inttostr(FCurrentPlayPos),9);
        end;
      end;
      Mplayer1.controls.play;
      Mplayer1.BringToFront;
      Mplayer1.Show;
    end;
  end;
end;


procedure TTSS_Display.PlayNextVideo2;
begin
  inc(FCurrentPlayPos);
  if FCurrentPlayPos>(FFilelist.Count-1) then FCurrentPlayPos:=0;
  FOnVideoEnd(nil);
end;

procedure TTSS_Display.SaveDisplay(FileId: string);
var F:textfile;
begin
  AssignFile(F,FileId);
  Rewrite(f);
  Writeln(f,self.Name);
  Writeln(f,inttostr(self.Left));
  Writeln(f,inttostr(self.top));
  Writeln(f,inttostr(self.width));
  Writeln(f,inttostr(self.height));
  Writeln(f,inttostr(self.Tag));
  Closefile(f);
end;

procedure TTSS_Display.SetCurrentPlayPos(const Value: Integer);
begin
  FCurrentPlayPos := Value;
end;

procedure TTSS_Display.SetFBGColor(const Value: TColor);
begin
  FBGColor := Value;
end;

procedure TTSS_Display.SetFHeight(const Value: integer);
begin
  FHeight := Value;
  MPlayer1.Height:=Value-2;
end;

procedure TTSS_Display.SetFileList(const Value: TStrings);
begin
  FFileList := Value;
end;

procedure TTSS_Display.SetFLeft(const Value: Integer);
begin
  FLeft := Value;
  MPlayer1.Left:=Value;
end;

procedure TTSS_Display.SetFName(const Value: String);
begin
  FName := Value;
end;

procedure TTSS_Display.SetFParent(const Value: TWincontrol);
begin
  FParent := Value;
  Mplayer1.Parent:=value;
end;

procedure TTSS_Display.SetFtop(const Value: Integer);
begin
  Ftop := Value;
  MPlayer1.Top:=Value+1;
end;

procedure TTSS_Display.SetFWidth(const Value: integer);
begin
  FWidth := Value;
  MPlayer1.width:=value-2;
end;

procedure TTSS_Display.SetOnMouseup(const Value: TMouseEvent);
begin
  FOnMouseup := Value;
end;

procedure TTSS_Display.SetOnMPMouseup(const Value: TMouseEvent);
begin
  FOnMPMouseup := Value;
end;

procedure TTSS_Display.SetOnPlaying(const Value: TnotifyEvent);
begin
  FOnPlaying := Value;
end;

procedure TTSS_Display.SetOnVideoEnd(const Value: TnotifyEvent);
begin
  FOnVideoEnd := Value;
end;

procedure TTSS_Display.SetVolume(const Value: integer);
begin
  FVolume := Value;
  Mplayer1.settings.volume:=FVolume;
end;

procedure TTSS_Display.stopVideo;
begin
  Mplayer1.controls.stop;
  FStopcall:=true;
end;

end.
