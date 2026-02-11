unit TSS_FE_Specialform_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,WMPLib_TLB, Vcl.ExtCtrls,
  Vcl.OleCtrls,System.Generics.Collections,TSS_ButtonClass_unit,
  System.ImageList, Vcl.ImgList, AnimatedButton;

type
  TTSS_FE_Specialform = class(TForm)
    Panel4: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel5: TPanel;
    SpeedButton4: TSpeedButton;
    Playtimer: TTimer;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    ImageList1: TImageList;
    WPlayer1: TWindowsMediaPlayer;
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PlaytimerTimer(Sender: TObject);
    procedure PlayStateChange(ASender: TObject; NewState: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Specialpl:TWindowsMediaPlayer;
    Playpos:integer;
    PLaylist:Tstringlist;
    Doclose:boolean;
    Elements:TObjectList<TComponent>;
    procedure MySpecialMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  end;

var
  TSS_FE_Specialform: TTSS_FE_Specialform;

implementation

{$R *.dfm}

uses TSS_FE_DataForm, system.inifiles;

procedure TTSS_FE_Specialform.FormClose(Sender: TObject;
  var Action: TCloseAction);
var ele:TComponent;
begin
  if Elements.Count>0 then begin
    try
      Elements.Clear;
      for ele in Elements do begin
        ele.free;
      end;
    finally
//      elements.Free;
    end;
  end;
end;

procedure TTSS_FE_Specialform.FormCreate(Sender: TObject);
begin
  Elements:=TObjectList<TComponent>.Create();
end;

procedure TTSS_FE_Specialform.FormShow(Sender: TObject);
var a:word;pl,imgcount,Btncount,VideoCount:integer;
    IniPl:TInifile;
    Im:Timage;
    Btn:TTSS_Button;
begin
  TSS_FE_Specialform.Top:=0;
  TSS_FE_Specialform.Left:=0;
  TSS_FE_Specialform.Width:=screen.Width;
  TSS_FE_Specialform.Height:=screen.Height;
  TSS_FE_Specialform.WindowState:=wsMaximized;
  TSS_FE_Specialform.Top:=0;
  TSS_FE_Specialform.Left:=0;
  TSS_FE_Specialform.panel1.Hide;
  if dataform.specialContentTyp=1 then begin
    if (not Dataform.SystemOffline) and DataForm.OnlineRun then begin
      if DataForm.TSS_FE_AlgQuery.Active then DataForm.TSS_FE_AlgQuery.close;
      DataForm.TSS_FE_AlgQuery.SQL.Text:='Select * from logumedia.media where Gallery_uid='''+dataform.specialContentID+''';';
      DataForm.TSS_FE_AlgQuery.open;
      if Dataform.TSS_FE_AlgQuery.RecordCount>=1 then begin
        PLaylist:=TStringlist.Create;
        DataForm.TSS_FE_AlgQuery.First;
        for a := 1 to Dataform.TSS_FE_AlgQuery.RecordCount do begin
          PLaylist.Add(Dataform.TSS_FE_AlgQuery.FieldByName('media_file').asstring);
          DataForm.TSS_FE_AlgQuery.next;
        end;
        DataForm.TSS_FE_AlgQuery.close;
      end;
    end else begin
      PLaylist:=TStringlist.Create;
      Playlist.LoadFromFile(DataForm.MainPath+'SchemaTemp\'+dataform.specialContentID+'.GAL');
    end;
    Panel1.Show;
    if WPlayer1=nil then begin
      WPlayer1:=TWindowsMediaPlayer.Create(Panel1);
      WPlayer1.Parent:=Panel1;
    end;
    WPlayer1.Left:=0;
    WPlayer1.Top:=0;
    WPlayer1.Width:=panel1.Width;
    WPlayer1.Height:=Panel1.Height;
    WPlayer1.uiMode:='none';
    WPlayer1.stretchToFit:=true;
    Wplayer1.OnPlayStateChange:=PlayStateChange;
    WPlayer1.BringToFront;
    playpos:=0;
    playtimer.enabled:=true;
  end else
  if dataform.specialContentTyp=2 then begin
    IniPl:=TInifile.Create(DataForm.MainPath+'SchemaTemp\'+dataform.specialContentID+'.SCON');
    imgCount:=IniPl.ReadInteger('Common','Images',0);
    BtnCount:=IniPl.ReadInteger('Common','Buttons',0);
    VideoCount:=IniPl.ReadInteger('Common','Videos',0);
    DataForm.writeDBLog('SPECIAL_CONTENT','Specialcontent : Bilder '+inttostr(imgCount)+' Video '+inttostr(VideoCount)+' Buttons '+inttostr(BtnCount),'',2);
    for a:=1 to imgCount do begin
      Im:=Timage.Create(TSS_FE_Specialform);
      Im.Parent:=TSS_FE_Specialform;
      Im.Left:=IniPl.ReadInteger('Image_'+inttostr(a),'PosX',0);
      Im.Top:=IniPl.ReadInteger('Image_'+inttostr(a),'PosY',0);
      Im.Width:=IniPl.ReadInteger('Image_'+inttostr(a),'Width',0);
      Im.Height:=IniPl.ReadInteger('Image_'+inttostr(a),'Height',0);
      Im.Picture.LoadFromFile(IniPl.ReadString('Image_'+inttostr(a),'File',''));
      DataForm.writeDBLog('SPECIAL_CONTENT','Specialcontent : Bild '+inttostr(a)+' Datei : '+IniPl.ReadString('Image_'+inttostr(a),'File',''),'',2);
      Im.Show;
      Elements.Add(Im);
    end;
    for a:=1 to BtnCount do begin
      Btn:=TTSS_Button.Create(TSS_FE_Specialform);
      Btn.Parent:=TSS_FE_Specialform;
      Btn.LoadButton(DataForm.MainPath+'SchemaTemp\'+IniPl.ReadString('Button_'+inttostr(a),'ButtonID','')+'.BDTA');
      DataForm.writeDBLog('SPECIAL_CONTENT','Specialcontent : Button '+inttostr(a)+' Datei : '+IniPl.ReadString('Button_'+inttostr(a),'ButtonID','')+'.BDTA','',2);
      Btn.LoadButtonImage(btn.ButtonimgFilename);
      Btn.OnMouseup:=MySpecialMouseUp;
      Btn.DisplayButton;
      Elements.Add(Btn);
    end;
  end;
  TSS_FE_Specialform.Resize;
  TSS_FE_Specialform.Repaint;
end;

procedure TTSS_FE_Specialform.MySpecialMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ClickBtn:TTSS_Button;
var Benabled:boolean;Action1,Action2:word;
    Showimage:timage;
begin
  if sender.classname='TImage' then ClickBtn:=TTSS_Button(Timage(Sender).Owner);
    Benabled:=ClickBTn.Buttonactive;
    Action1:=ClickBTn.buttonactioninactive;
    Action2:=ClickBTn.buttonactionactive;
    if BEnabled  then begin
      if Action2=12 then self.Close;
      if Action2=14 then Begin
         if FindComponent('ShowImage')<>nil then begin
           showimage:=TimagE(FindComponent('ShowImage'));
           freeandnil(Showimage);
         end;
         Showimage:=Timage.Create(TSS_FE_Specialform);
         Showimage.Left:=ClickBtn.ButtonActionShowImageX;
         Showimage.top:=ClickBtn.ButtonActionShowImagey;
         Showimage.width:=ClickBtn.ButtonActionShowImageW;
         Showimage.height:=ClickBtn.ButtonActionShowImageH;
         Showimage.Stretch:=true;
         Showimage.Name:='ShowImage';
         Showimage.Parent:=TSS_FE_Specialform;
         Showimage.Picture.LoadFromFile(ClickBtn.ButtonActionShowImage);
         Showimage.Transparent:=true;
         Showimage.Visible:=true;
         Showimage.BringToFront;
         Showimage.Repaint;
      End;
    end;
end;

procedure TTSS_FE_Specialform.PlayStateChange(ASender: TObject;
  NewState: Integer);
begin
  if newstate=8 then begin
    playpos:=playpos+1;
  end;
  if newstate=1 then begin
    Playtimer.Enabled:=true and not Doclose;
  end;
end;

procedure TTSS_FE_Specialform.PlaytimerTimer(Sender: TObject);
begin
  Playtimer.Enabled:=false;
  if playpos>PLaylist.Count-1 then playpos:=0;
  WPlayer1.URL:=Dataform.MainPath+Dataform.specialContentGallery+'\'+PLaylist.Strings[playpos];
  DataForm.writeDBLog('SPECIAL_CONTENT','Specialcontent PlayListFile : '+Dataform.MainPath+Dataform.specialContentGallery+'\'+PLaylist.Strings[playpos],'',2);
  WPlayer1.BringToFront;
  WPlayer1.controls.play;
end;

procedure TTSS_FE_Specialform.SpeedButton1Click(Sender: TObject);
begin
  playpos:=playpos+1;
  WPlayer1.controls.stop;
  Playtimer.Enabled:=true;
end;

procedure TTSS_FE_Specialform.SpeedButton2Click(Sender: TObject);
begin
  Wplayer1.settings.volume:=0;
end;

procedure TTSS_FE_Specialform.SpeedButton4Click(Sender: TObject);
begin
  Doclose:=true;
  Playtimer.Enabled:=false;
  WPlayer1.controls.stop;
  WPlayer1.url:='';
  WPlayer1.close;
  close;
end;

end.
