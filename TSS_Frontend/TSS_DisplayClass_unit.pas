unit TSS_DisplayClass_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,TSS_HttpButtonImgLoadThread_unit, Vcl.OleCtrls, WMPLib_TLB,
  Vcl.StdCtrls,system.inifiles,centervideo_class_unit,Tlhelp32;

type
  TTSS_Display = class(TControl)
    constructor Create(AOwner : TComponent); override;
  private
    BGImage: TImage;
    Mplayer1 : TWindowsMediaPLayeR;
    Imgplayer1 : TImage;
    ImgTimer : TTimer;
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
    FCurrentPlayPos: Integer;
    FStopcall:boolean;
    FOnMPMouseup: TMouseEvent;
    FOnPlaying: TnotifyEvent;
    FVolume: integer;
    FCenteritemList: TCentervideoList;
    FuseNextCurrentPlayPos: Integer;
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
    procedure SetCurrentPlayPos(const Value: Integer);
    procedure SetOnMPMouseup(const Value: TMouseEvent);
    procedure SetOnPlaying(const Value: TnotifyEvent);
    procedure SetVolume(const Value: integer);
    procedure SetCenteritemList(const Value: TCentervideoList);
    procedure SetuseNextCurrentPlayPos(const Value: Integer);
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
    //property FileList:TStrings read FFileList write SetFileList;
    property CenteritemList : TCentervideoList read FCenteritemList write SetCenteritemList;
    property CurrentPlayPos:Integer read FCurrentPlayPos write SetCurrentPlayPos;
    property useNextCurrentPlayPos:Integer read FuseNextCurrentPlayPos write SetuseNextCurrentPlayPos;
    property Volume:integer read FVolume write SetVolume;
    procedure initDisplay(typ:integeR);
    procedure PlayVideo(id:Word);
    procedure PlayNextVideo;
    procedure PlayNextVideo2;
    procedure DisplayAdress;
    procedure DisplayLoading;
    procedure stopVideo;
    procedure continueVideo;
//    function GetNextVideoFileName:string;
    Procedure LoadDisplay(FileId,Section:string);
    Procedure SaveDisplay(FileId:string);
    procedure LoadContent(FileId,Section: string);
    procedure ImgTimerTimer(Sender: TObject);

  end;

var
  allreadyadd:boolean;
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
    Mplayer1.hide;
    Imgplayer1:=Timage.create(AOwner);
    Imgplayer1.Parent:=MainDisplayForm;
    Imgplayer1.hide;
    ImgTimer:=TTimer.create(nil);
    ImgTimer.Enabled:=false;
    ImgTimer.onTimer:=ImgTimerTimer;
end;

procedure TTSS_Display.DisplayAdress;
begin
end;

procedure TTSS_Display.DisplayLoading;
begin
end;

procedure TTSS_Display.ImgTimerTimer(Sender: TObject);
begin
  ImgTimer.Enabled:=false;
  PlayNextVideo;
end;

//function TTSS_Display.GetNextVideoFileName: string;
//begin
//  Result:=extractfilename(FFileList.Strings[FCurrentPlayPos]);
//end;

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
  if fileexists(FileId) then begin
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
end;

procedure TTSS_Display.LoadDisplay(FileId,Section: string);
var F:textfile;Readstring:string;
    IniPl:TIniFile;
begin
  if fileexists(FileId) then begin
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
    if ImgPlayer1<>nil then begin
      ImgPlayer1.left:=self.left;
      ImgPlayer1.top:=self.top;
      ImgPlayer1.height:=self.height;
      ImgPlayer1.width:=self.width;
    end;
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
  if not dataform.finished then begin
  DataForm.writeDBLog('RUN_PLAYVIDEO','Video Playstate :',inttostr(NewState),9);
  if (NewState = wmppsPlaying) then begin
    TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=falsE;
  end;
  if (NewState = wmppsReady) then begin
    if not allreadyadd then begin
      FCurrentPlayPos:=FCurrentPlayPos+1;
      allreadyadd:=true;
    end else allreadyadd:=false;
    if FCurrentPlayPos>(FCenteritemList.Count-1) then FCurrentPlayPos:=0;
    TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=falsE;
    TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=true;
  end;
  if (NewState = wmppsStopped) then begin
    TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=falsE;
    OnVideoEnd(ASender);
  end;
  end;
end;

procedure TTSS_Display.PlayVideo(id:word);
var Filename,FileTyp:String;Playtime:word;Cv1:TCenterVideoItem;
begin
  if not FStopcall then begin
    if FCenteritemList<>nil then
      if FCenteritemList.Count>0 then begin
        cv1:=TCenterVideoItem(FCenteritemList.Items[id]);
        Filename:=Cv1.ItemFile;
        if Cv1.ItemTyp=tcvitem_video then begin
          if fileexists(Filename) then begin
            Mplayer1.URL:='file://'+Filename;
          //Mplayer1.BringToFront;
            Imgplayer1.hide;
            Mplayer1.Show;
          end else begin
            DataForm.writeDBLog('RUN_PLAYVIDEO','Video fehlt:'+Filename,inttostr(FCurrentPlayPos),9);
          end;
        end;
        if Cv1.ItemTyp=tcvitem_image then begin
          if fileexists(Filename) then begin
            Imgplayer1.Picture.LoadFromFile(Filename);
          //Mplayer1.BringToFront;
            Mplayer1.hide;
            Imgplayer1.show;
          end else begin
            DataForm.writeDBLog('RUN_PLAYVIDEO','Image fehlt:'+Filename,inttostr(FCurrentPlayPos),9);
          end;
        end;
      end;
  end;
end;

procedure TTSS_Display.PlayingState(ASender: TObject);
begin
  TMainDisplayForm(TComponent(ASender).Owner).PlayNextTimer.Enabled:=falsE;
end;

procedure TTSS_Display.PlayNextVideo;
var s:string;cv1:TCenterVideoItem;_hwnd:HWND;MyMsg,MyMsg2:String;
  Data:PMSGLogdata;
  DataLen:integer;
  CopyDataStruc:TCopyDataStruct;
begin
if not FStopcall then begin
    if Mplayer1.visible then Mplayer1.controls.stop;
    Mplayer1.hide;
    Imgplayer1.hide;
    MainDisplayForm.Label25.caption:=inttostr(FCurrentPlayPos)+' / '+inttostr(FCenteritemList.Count);
    MainDisplayForm.Label25.Hint:=TCenterVideoItem(FCenteritemList.items[FCurrentPlayPos]).ItemFile;
    MainDisplayForm.Label25.ShowHint:=true;
    if (FCurrentPlayPos+1)<=FCenteritemList.Count then begin
      if not allreadyadd then begin
        FCurrentPlayPos:=FCurrentPlayPos+1;
        allreadyadd:=true;
      end else allreadyadd:=false;
      if (FCurrentPlayPos)=FCenteritemList.Count then FCurrentPlayPos:=0;
      if FuseNextCurrentPlayPos<>0 then begin
        FCurrentPlayPos:=FuseNextCurrentPlayPos;
        FuseNextCurrentPlayPos:=0;
      end;
      cv1:=TCenterVideoItem(FCenteritemList.Items[FCurrentPlayPos]);
      if fileexists(cv1.ItemFile) then begin
        if Cv1.ItemTyp=tcvitem_video then begin
          _hwnd:=DataForm.FindWindowByTitle('Logumedia System OS');
          MyMsg:='0|'+pchar(Cv1.ItemFile);
          CopyDataStruc.dwData:=WM_VIDEOFILEPLAYED;
          CopyDataStruc.cbData:=length(MyMsg)*sizeof(char);
          CopyDataStruc.lpData:=pchar(MyMsg);
          SendMessage(_hwnd, WM_COPYDATA , application.Handle, LPARAM(@CopyDataStruc));
          MainDisplayForm.dsLed2.OnColor:=clLime;
          Mplayer1.URL:='file://'+cv1.ItemFile;
          Mplayer1.controls.play;
          Mplayer1.Show;
          DataForm.writeDBLog('RUN_PLAYVIDEO','Video Abspielen :'+cv1.ItemFile,inttostr(FCurrentPlayPos),9);
        end else
        if Cv1.ItemTyp=tcvitem_image then begin
          _hwnd:=DataForm.FindWindowByTitle('Logumedia System OS');
          MyMsg:=inttostr(Cv1.ItemDuration)+'|'+pchar(Cv1.ItemFile);
          CopyDataStruc.dwData:=WM_IMAGEFILEPLAYED;
          CopyDataStruc.cbData:=length(MyMsg)*sizeof(char);
          CopyDataStruc.lpData:=pchar(MyMsg);
          SendMessage(_hwnd, WM_COPYDATA , application.Handle, LPARAM(@CopyDataStruc));
          Imgplayer1.Picture.LoadFromFile(cv1.ItemFile);
          Imgplayer1.Show;
          Imgplayer1.BringToFront;
          Imgplayer1.Repaint;
          if cv1.ItemDuration>0 then begin
            MainDisplayForm.dsLed2.OnColor:=clGreen;
            ImgTimer.Interval:=cv1.ItemDuration*1000;
            ImgTimer.Enabled:=true;
          end else begin
            MainDisplayForm.dsLed2.OnColor:=clblue;
            MainDisplayForm.dsLed2.LedOn:=true;
            MainDisplayForm.dsLed2.Repaint;
          end;
          DataForm.writeDBLog('RUN_PLAYVIDEO','Image Abspielen :'+cv1.ItemFile,inttostr(FCurrentPlayPos),9);
        end;
      end else begin
        DataForm.writeDBLog('RUN_PLAYVIDEO','Video failed :'+s,inttostr(FCurrentPlayPos),9);
        PlayNextVideo;
      end;
    end else FCurrentPlayPos:=0;
  end;
end;


procedure TTSS_Display.PlayNextVideo2;
begin
//  inc(FCurrentPlayPos);
//  if FCurrentPlayPos>(FCenteritemList.Count-1) then FCurrentPlayPos:=0;
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

procedure TTSS_Display.SetCenteritemList(const Value: TCentervideoList);
begin
  FCenteritemList := Value;
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


procedure TTSS_Display.SetFLeft(const Value: Integer);
begin
  FLeft := Value+DataForm.ButtonOffset_X;
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
  Ftop := Value+DataForm.ButtonOffset_Y;
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

procedure TTSS_Display.SetuseNextCurrentPlayPos(const Value: Integer);
begin
  FuseNextCurrentPlayPos := Value;
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
