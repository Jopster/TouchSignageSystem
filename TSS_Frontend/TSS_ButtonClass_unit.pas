unit TSS_ButtonClass_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,TSS_HttpButtonImgLoadThread_unit,
  Vcl.StdCtrls, Vcl.Menus;

type
  TTSS_Button = class(TPanel)
  private
    BGShape: TShape;
    BGImage: TImage;
    NameText: TLabel;
    Name2Text: TLabel;
    StrassenText:TLabel;
    PlzOrtText:Tlabel;
    LoadText:TLabel;
    ImgHttpLoadThread:THttpButtonImgLoadThread;
    BtnTimer:TTimer;
    FLeft: Integer;
    Ftop: Integer;
    FWidth: integer;
    FHeight: integer;
    FBGColor: TColor;
    FName: String;
    FParent: TWincontrol;
    FKundenName: String;
    FKundenName2: String;
    FKundenStrasse: String;
    FKundenPLZOrt: String;
    FOnMouseUp: TMouseEvent;
    FInfoBox: TListBox;
    FButtonActive: boolean;
    FButtonActionActive: word;
    FButtonActionInActive: word;
    FhParent: TWincontrol;
    FTag: word;
    FButtonAction_VideoID: word;
    FButtonAction_Video_PlaylistID: string;
    FButtonAction_Gallerie_ID: string;
    FButtonid: String;
    FButtonimgFilename: String;
    FClickPlayListCount: integer;
    FClickPlayListFileName: String;
    FClickPlayListZuordnung: String;
    FClickPlayListGalleryid: String;
    FClickPlayListKundenuid: String;
    Fbutton_media_id: integer;
    Fmedia_typ: integer;
    Fzuordnung_typ: integeR;
    FGalerieFiles:TStringlist;
    FFGallerieID: String;
    FFeldname: String;
    FHasTimer: Boolean;
    FTimerTime: Word;
    FButtonActionShowImage: string;
    FButtonActionShowImageTimer: word;
    FButtonActionShowImageX: word;
    FButtonActionShowImageY: word;
    FButtonActionShowImageH: word;
    FButtonActionShowImageW: word;
    FGallerieDivider: Word;
    FGallerieRows: Word;
    FGallerieW: Word;
    FGallerieH: Word;
    FGallerieCols: Word;
    FButtonFileId: string;
    FBtnPopup: TPopupMenu;
    procedure SetFLeft(const Value: Integer);
    procedure SetFtop(const Value: Integer);
    procedure SetFWidth(const Value: integer);
    procedure SetFHeight(const Value: integer);
    procedure SetFBGColor(const Value: TColor);
    procedure SetFName(const Value: String);
    procedure SetFParent(const Value: TWincontrol);
    procedure SetFKundenName(const Value: String);
    procedure SetFKundenName2(const Value: String);
    procedure SetFKundenStrasse(const Value: String);
    procedure SetFKundenPLZOrt(const Value: String);
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure SetInfoBox(const Value: TListBox);
    procedure SetOnMouseup(const Value: TMouseEvent);
    procedure SetButtonActive(const Value: boolean);
    procedure SetButtonActionActive(const Value: word);
    procedure SetButtonActionInActive(const Value: word);
    procedure SethParent(const Value: TWincontrol);
    procedure SetTag(const Value: word);
    procedure SetButtonAction_VideoID(const Value: word);
    procedure SetButtonAction_Video_PlaylistID(const Value: string);
    procedure SetButtonAction_Gallerie_ID(const Value: string);
    procedure SetFButtonid(const Value: String);
    procedure SetFButtonimgFilename(const Value: String);
    procedure SetClickPlayListCount(const Value: integer);
    procedure SetClickPlayListFileName(const Value: String);
    procedure SetClickPlayListGalleryid(const Value: String);
    procedure SetClickPlayListKundenuid(const Value: String);
    procedure SetClickPlayListZuordnung(const Value: String);
    procedure Setbutton_media_id(const Value: integer);
    procedure Setmedia_typ(const Value: integer);
    procedure Setzuordnung_typ(const Value: integeR);
    procedure SetFGallerieID(const Value: String);
    procedure SetGalerieFiles(const Value: TStringList);
    procedure SetFeldname(const Value: String);
    procedure SetHasTimer(const Value: Boolean);
    procedure SetTimerTime(const Value: Word);
    procedure SetButtonActionShowImage(const Value: string);
    procedure SetButtonActionShowImageTimer(const Value: word);
    procedure SetButtonActionShowImageX(const Value: word);
    procedure SetButtonActionShowImageY(const Value: word);
    procedure SetButtonActionShowImageH(const Value: word);
    procedure SetButtonActionShowImageW(const Value: word);
    procedure SetGallerieDivider(const Value: Word);
    procedure SetGallerieCols(const Value: Word);
    procedure SetGallerieH(const Value: Word);
    procedure SetGallerieRows(const Value: Word);
    procedure SetGallerieW(const Value: Word);
    procedure SetButtonFileId(const Value: string);
    procedure SetBtnPopup(const Value: TPopupMenu);
  published
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Property ButtonFileId:string read FButtonFileId write SetButtonFileId;
    Property EBGImage:Timage read BGImage;
    property BtnPopup:TPopupMenu read FBtnPopup write SetBtnPopup;
    Property left:Integer read FLeft Write SetFLeft;
    Property top:Integer read Ftop Write SetFtop;
    property width:integer read FWidth Write SetFWidth;
    property height:integer read FHeight Write SetFHeight;
    property InfoBox:TListBox read FInfoBox write SetInfoBox;
    property Tag:word read FTag write SetTag;
    property BGColor:TColor read FBGColor write SetFBGColor;
    property Buttonid:String read FButtonid write SetFButtonid;
    property Name:String read FName write SetFName;
    property KundenName:String read FKundenName write SetFKundenName;
    property KundenName2:String read FKundenName2 write SetFKundenName2;
    property KundenStrasse:String read FKundenStrasse write SetFKundenStrasse;
    property KundenPLZOrt:String read FKundenPLZOrt write SetFKundenPLZOrt;
    property Parent:TWincontrol read FParent Write SetFParent;
    property hParent:TWincontrol read FhParent write SethParent;
    property ButtonActive:boolean read FButtonActive write SetButtonActive;
    property ButtonActionInActive:word read FButtonActionInActive write SetButtonActionInActive;
    property ButtonActionActive:word read FButtonActionActive write SetButtonActionActive;
    property ButtonAction_VideoID:word read FButtonAction_VideoID write SetButtonAction_VideoID;
    property ButtonAction_Video_PlaylistID:string read FButtonAction_Video_PlaylistID write SetButtonAction_Video_PlaylistID;
    property ButtonAction_Gallerie_ID:string read FButtonAction_Gallerie_ID write SetButtonAction_Gallerie_ID;
    property ButtonActionShowImage:string read FButtonActionShowImage write SetButtonActionShowImage;
    property ButtonActionShowImageX:word read FButtonActionShowImageX write SetButtonActionShowImageX;
    property ButtonActionShowImageY:word read FButtonActionShowImageY write SetButtonActionShowImageY;
    property ButtonActionShowImageW:word read FButtonActionShowImageW write SetButtonActionShowImageW;
    property ButtonActionShowImageH:word read FButtonActionShowImageH write SetButtonActionShowImageH;
    property ButtonActionShowImageTimer:word read FButtonActionShowImageTimer write SetButtonActionShowImageTimer;
    property ClickPlayListCount:integer read FClickPlayListCount write SetClickPlayListCount;
    property ButtonimgFilename:String read FButtonimgFilename write SetFButtonimgFilename;
    property ClickPlayListFileName:String read FClickPlayListFileName write SetClickPlayListFileName;
    property ClickPlayListKundenuid:String read FClickPlayListKundenuid write SetClickPlayListKundenuid;
    property ClickPlayListGalleryid:String read FClickPlayListGalleryid write SetClickPlayListGalleryid;
    property ClickPlayListZuordnung:String read FClickPlayListZuordnung write SetClickPlayListZuordnung;
    property button_media_id:integer read Fbutton_media_id write Setbutton_media_id;
    property media_typ:integer read Fmedia_typ write Setmedia_typ;
    property zuordnung_typ:integeR read Fzuordnung_typ write Setzuordnung_typ;
    property OnMouseup: TMouseEvent read FOnMouseup write SetOnMouseup;
    property GalerieFiles:TStringList read FGalerieFiles write SetGalerieFiles;
    property GallerieID:String read FFGallerieID write SetFGallerieID;
    property Feldname:String read FFeldname write SetFeldname;
    property HasTimer:Boolean read FHasTimer write SetHasTimer;
    property TimerTime:Word read FTimerTime write SetTimerTime;
    procedure MyBtnOnTimer(Sender: TObject);
    property GallerieDivider:Word read FGallerieDivider write SetGallerieDivider;
    property GallerieRows:Word read FGallerieRows write SetGallerieRows;
    property GallerieCols:Word read FGallerieCols write SetGallerieCols;
    property GallerieH:Word read FGallerieH write SetGallerieH;
    property GallerieW:Word read FGallerieW write SetGallerieW;
    constructor Create(AOwner : TComponent); override;
    destructor done;
    procedure LoadButtonImage(Filename:string);
    procedure DisplayButton;
    procedure DisplayAdress;
    procedure DisplayLoading;
    Procedure LoadButton(FileId:string);
    Procedure SaveButton(FileId:string);
    Procedure SaveButtonSelf;
    procedure ButtomMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  end;

implementation

uses system.inifiles,TSS_FE_DataForm;

procedure TTSS_Button.ButtomMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p:TPopupMenu;
begin
  if button=mbRight then begin
    if dataform.Debugmode then begin
      DataForm.PopupButton:=self;
      FBtnPopup.Popup(self.left+x,self.top+y);
    end;
  end else begin
    FOnMouseUp(sender,Button,Shift,x,y);
  end;
end;

constructor TTSS_Button.Create(AOwner: TComponent);
begin
  inherited;
  FGalerieFiles:=TStringList.Create;
  BGShape:=TShape.Create(self);
  BGImage:=TImage.Create(self);
  FBtnPopup:=TPopupMenu.Create(nil);
  BGImage.Stretch:=true;
  BGImage.Hide;
  NameText:=TLabel.Create(self);
  NameText.AutoSize:=false;
  NameText.Alignment:=tacenter;
  NameText.Hide;
  Name2Text:=TLabel.Create(self);
  Name2Text.AutoSize:=false;
  Name2Text.Alignment:=tacenter;
  Name2Text.Hide;
  StrassenText:=TLabel.Create(self);
  StrassenText.AutoSize:=false;
  StrassenText.Alignment:=tacenter;
  StrassenText.Hide;
  PlzOrtText:=TLabel.Create(Self);
  PlzOrtText.AutoSize:=false;
  PlzOrtText.Alignment:=tacenter;
  PlzOrtText.Hide;
  LoadText:=TLabel.Create(Self);
  LoadText.Caption:='Der Inhalt des Partners ist'#13#10'neu überarbeitet worden und '#13#10' wird noch aus dem Internet geladen !'#13#10'Bitte etwas Gedult.';
  LoadText.Height:=40;
  LoadText.Alignment:=tacenter;
  LoadText.Font.Size:=6;
  LoadText.Hide;
  BtnTimer:=Ttimer.Create(AOwner);
  BtnTimer.Enabled:=false;
  BtnTimer.OnTimer:=MyBtnOnTimer;
end;

procedure TTSS_Button.DisplayAdress;
begin
  BGShape.Show;
  NameText.Show;
  Name2Text.Show;
  PlzOrtText.Show;
  StrassenText.Show;
end;

procedure TTSS_Button.DisplayButton;
begin
  Self.Visible:=true;
  if FHasTimer then begin
    BtnTimer.Enabled:=true;
  end;
end;

procedure TTSS_Button.DisplayLoading;
begin
  LoadText.Show;
end;

destructor TTSS_Button.done;
begin
  freeandnil(BtnTimer);
  freeandnil(FGalerieFiles);
end;

procedure TTSS_Button.Mouseup(Button: TMouseButton; Shift: TShiftState;X, Y: Integer);
begin
  MessageBeep(0);
end;

procedure TTSS_Button.MyBtnOnTimer(Sender: TObject);
begin
  BtnTimer.Enabled:=False;
  FOnMouseUp(BGImage,mbleft,[],0,0);
end;

procedure TTSS_Button.LoadButton(FileId:string);
var f:Textfile;ReadString:string;
var IniPl:TIniFile;
begin
  AssignFile(F,FileId);
  Reset(f);
  Readln(f,Readstring);
  Closefile(f);
  if ReadString<>'[Button]' then begin
    AssignFile(F,FileId);
    Reset(f);
    self.ButtonFileId:=FileID;
    Readln(f,Readstring);
    self.Buttonid:=ReadString;
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
    Readln(f,Readstring);
    self.KundenName :=Readstring;
    Readln(f,Readstring);
    self.KundenName2 :=Readstring;
    Readln(f,Readstring);
    self.KundenStrasse :=Readstring;
    Readln(f,Readstring);
    self.KundenPLZOrt :=Readstring;
    Readln(f,Readstring);
    self.ButtonActive :=StrtoBool(Readstring);
    Readln(f,Readstring);
    self.ButtonActionInActive:=strtoint(Readstring);
    Readln(f,Readstring);
    self.ButtonActionActive:=strtoint(Readstring);
    Readln(f,Readstring);
    self.ButtonAction_Video_PlaylistID:=Readstring;
    Readln(f,Readstring);
    self.ButtonAction_Gallerie_ID:=Readstring;
    Readln(f,Readstring);
    self.ButtonAction_VideoID:=strtoint(Readstring);
    Readln(f,Readstring);
    self.Buttonid:=Readstring;
    Readln(f,Readstring);
    self.ButtonimgFilename:=Readstring;
    Readln(f,Readstring);
    self.ClickPlayListCount:=strtoint(Readstring);
    Readln(f,Readstring);
    self.ClickPlayListFileName:=Readstring;
    Readln(f,Readstring);
    self.ClickPlayListZuordnung:=Readstring;
    Readln(f,Readstring);
    self.ClickPlayListGalleryid:=Readstring;
    readln(f,Readstring);
    self.ClickPlayListKundenuid:=Readstring;
    readln(f,Readstring);
    self.Fbutton_media_id:=strtoint(Readstring);
    readln(f,Readstring);
    self.Fmedia_typ:=strtoint(Readstring);
    readln(f,Readstring);
    self.Fzuordnung_typ:=strtoint(Readstring);
    readln(f,Readstring);
    self.FFGallerieID:=Readstring;
    self.FGalerieFiles.LoadFromFile(ExtractFilePath(fileid)+'\'+FFGallerieID+'.GAL');
    readln(f,Readstring);
    self.FFeldname:=Readstring;
    Closefile(f);
  end else begin
    IniPl:=TInifile.Create(FileId);
    self.ButtonFileId:=FileID;
    self.Buttonid:=IniPl.ReadString('Button','ButtonUID','');
    self.width:=IniPl.Readinteger('Button','Width',96);
    self.Height:=IniPl.ReadInteger('Button','Height',96);
    self.Left:=IniPl.ReadInteger('Button','Left',0);
    self.top:=IniPl.ReadInteger('Button','Top',0);
    self.ClickPlayListKundenuid:=IniPl.ReadString('Customer','Kunden_UID','');
    //self.Name:=IniPl.ReadString('Customer','Kundennummer','');
    self.KundenName:=IniPl.ReadString('Customer','Kundenname_1','');
    self.KundenName2:=IniPl.ReadString('Customer','Kundenname_2','');
    self.KundenStrasse:=IniPl.ReadString('Customer','Kundenstrasse','');
    self.KundenPLZOrt:=IniPl.ReadString('Customer','KundenplzOrt','');
    //Edit13.text:=IniPl.ReadString('Button','Image','');
    self.ButtonimgFilename:=IniPl.ReadString('Button','Image','');
    self.Name:=IniPl.ReadString('Button','Name','');
    //Edit8.text:=IniPl.ReadString('Button','Tag','');
    self.ButtonActive:=IniPl.ReadBool('Aktion','Clickable',False);
    self.ButtonActionInActive:=IniPl.ReadInteger('Aktion','ClickInAktive',0);
    self.ButtonActionActive:=IniPl.ReadInteger('Aktion','ClickAktive',0);
    self.ButtonAction_VideoID:=IniPl.Readinteger('Aktion','ClickVideo',0);
    self.ButtonAction_Gallerie_ID:=IniPl.ReadString('Aktion','ClickGallerie','');
    self.ButtonAction_Video_PlaylistID:=IniPl.ReadString('Aktion','ClickPlayList','');
    self.ClickPlayListCount:=IniPl.ReadInteger('Data','PlaylistCount',0);
    self.Fbutton_media_id:=IniPl.Readinteger('Data','MediaID',0);
    self.Fmedia_typ:=IniPl.Readinteger('Data','MediaTyp',0);
    self.Fzuordnung_typ:=IniPl.Readinteger('Data','Zuordnung',0);
    self.ClickPlayListFileName:=IniPl.ReadString('Data','ClickPlayListFile','');
    self.ClickPlayListZuordnung:=IniPl.ReadString('Data','ClickPlayListZuordnung','');
    self.ClickPlayListGalleryid:=IniPl.ReadString('Data','ClickPlayListGallerID','');
    self.FFGallerieID:=IniPl.ReadString('Data','GalleryID','');
    self.FFeldname:=IniPl.ReadString('Data','FeldName','');
    self.FGallerieRows:=IniPl.Readinteger('Data','GallerieRows',0);
    self.FGallerieCols:=IniPl.Readinteger('Data','GallerieCols',0);
    self.FGallerieH:=IniPl.Readinteger('Data','GallerieH',0);
    self.FGallerieW:=IniPl.Readinteger('Data','GallerieW',0);
    if ClickPlayListGalleryid<>'' then self.FGalerieFiles.LoadFromFile(ExtractFilePath(fileid)+'\'+ClickPlayListGalleryid+'.GAL');
    self.FHasTimer:=IniPl.ReadBool('Button','TimerOn',False);
    self.TimerTime:=IniPl.ReadInteger('Button','TimerTime',0);
    self.FButtonActionShowImage:=IniPl.ReadString('Data','ClickShowImage','');
    self.FButtonActionShowImageX:=IniPl.ReadInteger('Data','ClickShowImageX',0);
    self.FButtonActionShowImageY:=IniPl.ReadInteger('Data','ClickShowImageY',0);
    self.FButtonActionShowImageW:=IniPl.ReadInteger('Data','ClickShowImageW',0);
    self.FButtonActionShowImageH:=IniPl.ReadInteger('Data','ClickShowImageH',0);
    self.FButtonActionShowImageTimer:=IniPl.ReadInteger('Data','ClickShowImageTime',0);
  end;
  DataForm.ButtonList.Add(self);
end;

procedure TTSS_Button.LoadButtonImage(Filename: string);
var S:string;
begin
  if fileexistS(Filename) then
    BGImage.Picture.LoadFromFile(Filename)
  else begin
    s:=filename;
    s[1]:=ParamStr(0)[1];
    if fileexistS(s) then BGImage.Picture.LoadFromFile(s);
  end;
  FButtonimgFilename:=FileName;
  BGImage.Repaint;
  BGImage.Show;
  BGShape.Hide;
  NameText.Hide;
  Name2Text.Hide;
  StrassenText.Hide;
  PlzOrtText.Hide;
  LoadText.Hide;
end;

procedure TTSS_Button.SaveButton(FileId: string);
var IniPl:TIniFile;
begin
    IniPl:=TInifile.Create(FileId);
    self.ButtonFileId:=FileID;
    IniPl.WriteString('Button','ButtonUID',self.Buttonid);
    IniPl.Writeinteger('Button','Width',self.width);
    IniPl.WriteInteger('Button','Height',self.Height);
    IniPl.WriteInteger('Button','Left',self.Left);
    IniPl.WriteInteger('Button','Top',self.top);
    IniPl.WriteString('Customer','Kunden_UID',self.ClickPlayListKundenuid);
    //self.Name:=IniPl.ReadString('Customer','Kundennummer','');
    IniPl.WriteString('Customer','Kundenname_1',self.KundenName);
    IniPl.WriteString('Customer','Kundenname_2',self.KundenName2);
    IniPl.WriteString('Customer','Kundenstrasse',self.KundenStrasse);
    IniPl.WriteString('Customer','KundenplzOrt',self.KundenPLZOrt);
    //Edit13.text:=IniPl.ReadString('Button','Image','');
    IniPl.WriteString('Button','Image',self.ButtonimgFilename);
    IniPl.WriteString('Button','Name',self.Name);
    //Edit8.text:=IniPl.ReadString('Button','Tag','');
    IniPl.WriteBool('Aktion','Clickable',self.ButtonActive);
    IniPl.WriteInteger('Aktion','ClickInAktive',self.ButtonActionInActive);
    IniPl.WriteInteger('Aktion','ClickAktive',self.ButtonActionActive);
    IniPl.Writeinteger('Aktion','ClickVideo',self.ButtonAction_VideoID);
    IniPl.WriteString('Aktion','ClickGallerie',self.ButtonAction_Gallerie_ID);
    IniPl.WriteString('Aktion','ClickPlayList',self.ButtonAction_Video_PlaylistID);
    IniPl.WriteInteger('Data','PlaylistCount',self.ClickPlayListCount);
    IniPl.Writeinteger('Data','MediaID',self.Fbutton_media_id);
    IniPl.Writeinteger('Data','MediaTyp',self.Fmedia_typ);
    IniPl.Writeinteger('Data','Zuordnung',self.Fzuordnung_typ);
    IniPl.WriteString('Data','ClickPlayListFile',self.ClickPlayListFileName);
    IniPl.WriteString('Data','ClickPlayListZuordnung',self.ClickPlayListZuordnung);
    IniPl.WriteString('Data','ClickPlayListGallerID',self.ClickPlayListGalleryid);
    IniPl.WriteString('Data','GalleryID',self.FFGallerieID);
    IniPl.WriteString('Data','FeldName',self.FFeldname);
    IniPl.Writeinteger('Data','GallerieRows',self.FGallerieRows);
    IniPl.Writeinteger('Data','GallerieCols',self.FGallerieCols);
    IniPl.Writeinteger('Data','GallerieH',self.FGallerieH);
    IniPl.Writeinteger('Data','GallerieW',self.FGallerieW);
    //if ClickPlayListGalleryid<>'' then self.FGalerieFiles.LoadFromFile(ExtractFilePath(fileid)+'\'+ClickPlayListGalleryid+'.GAL');
    IniPl.WriteBool('Button','TimerOn',self.FHasTimer);
    IniPl.Writeinteger('Button','TimerTime',self.TimerTime);
    IniPl.WriteString('Data','ClickShowImage',self.FButtonActionShowImage);
    IniPl.WriteInteger('Data','ClickShowImageX',self.FButtonActionShowImageX);
    IniPl.WriteInteger('Data','ClickShowImageY',self.FButtonActionShowImageY);
    IniPl.WriteInteger('Data','ClickShowImageW',self.FButtonActionShowImageW);
    IniPl.WriteInteger('Data','ClickShowImageH',self.FButtonActionShowImageH);
    IniPl.WriteInteger('Data','ClickShowImageTime',self.FButtonActionShowImageTimer);
end;

procedure TTSS_Button.SaveButtonSelf;
begin
  SaveButton(FButtonFileId);
end;

procedure TTSS_Button.SetBtnPopup(const Value: TPopupMenu);
begin
  FBtnPopup := Value;
end;

procedure TTSS_Button.SetButtonActionActive(const Value: word);
begin
  FButtonActionActive := Value;
end;

procedure TTSS_Button.SetButtonActionInActive(const Value: word);
begin
  FButtonActionInActive := Value;
end;

procedure TTSS_Button.SetButtonActionShowImage(const Value: string);
begin
  FButtonActionShowImage := Value;
end;

procedure TTSS_Button.SetButtonActionShowImageH(const Value: word);
begin
  FButtonActionShowImageH := Value;
end;

procedure TTSS_Button.SetButtonActionShowImageTimer(const Value: word);
begin
  FButtonActionShowImageTimer := Value;
end;

procedure TTSS_Button.SetButtonActionShowImageW(const Value: word);
begin
  FButtonActionShowImageW := Value;
end;

procedure TTSS_Button.SetButtonActionShowImageX(const Value: word);
begin
  FButtonActionShowImageX := Value;
end;

procedure TTSS_Button.SetButtonActionShowImageY(const Value: word);
begin
  FButtonActionShowImageY := Value;
end;

procedure TTSS_Button.SetButtonAction_Gallerie_ID(const Value: string);
begin
  FButtonAction_Gallerie_ID := Value;
end;

procedure TTSS_Button.SetButtonAction_VideoID(const Value: word);
begin
   FButtonAction_VideoID := Value;
end;

procedure TTSS_Button.SetButtonAction_Video_PlaylistID(const Value: string);
begin
  FButtonAction_Video_PlaylistID := Value;
end;

procedure TTSS_Button.SetButtonActive(const Value: boolean);
begin
  FButtonActive := Value;
end;

procedure TTSS_Button.SetButtonFileId(const Value: string);
begin
  FButtonFileId := Value;
end;

procedure TTSS_Button.Setbutton_media_id(const Value: integer);
begin
  Fbutton_media_id := Value;
end;

procedure TTSS_Button.SetClickPlayListCount(const Value: integer);
begin
  FClickPlayListCount := Value;
end;

procedure TTSS_Button.SetClickPlayListFileName(const Value: String);
begin
  FClickPlayListFileName := Value;
end;

procedure TTSS_Button.SetClickPlayListGalleryid(const Value: String);
begin
  FClickPlayListGalleryid := Value;
end;

procedure TTSS_Button.SetClickPlayListKundenuid(const Value: String);
begin
  FClickPlayListKundenuid := Value;
end;

procedure TTSS_Button.SetClickPlayListZuordnung(const Value: String);
begin
  FClickPlayListZuordnung := Value;
end;

procedure TTSS_Button.SetFBGColor(const Value: TColor);
begin
  FBGColor := Value;
  BGShape.Brush.Color:=Value;
end;

procedure TTSS_Button.SetFButtonid(const Value: String);
begin
  FButtonid := Value;
end;

procedure TTSS_Button.SetFButtonimgFilename(const Value: String);
begin
  FButtonimgFilename := Value;
end;

procedure TTSS_Button.SetFeldname(const Value: String);
begin
  FFeldname := Value;
end;

procedure TTSS_Button.SetFGallerieID(const Value: String);
begin
  FFGallerieID := Value;
end;

procedure TTSS_Button.SetFHeight(const Value: integer);
begin
  FHeight := Value;
  BGShape.Height:=Value;
  BGImage.Height:=Value-2;
  NameText.top:=FTop+(Value div 2) - 30;
  Name2Text.top:=FTop+(Value div 2) - 15;
  StrassenText.top:=FTop+(Value div 2) + 15;
  PlzOrtText.top:=FTop+(Value div 2) + 30;
  LoadText.Top:=FTop+Value-45;
end;

procedure TTSS_Button.SetFKundenName(const Value: String);
begin
  FKundenName := Value;
  NameText.Caption:=Value;
end;

procedure TTSS_Button.SetFKundenName2(const Value: String);
begin
  FKundenName2 := Value;
  Name2Text.Caption:=Value;
end;

procedure TTSS_Button.SetFKundenPLZOrt(const Value: String);
begin
  FKundenPLZOrt := Value;
  PlzOrtText.Caption:=Value;
end;

procedure TTSS_Button.SetFKundenStrasse(const Value: String);
begin
  FKundenStrasse := Value;
  StrassenText.Caption:=Value;
end;

procedure TTSS_Button.SetFLeft(const Value: Integer);
begin
  FLeft := Value;
  BGShape.Left:=Value;
  BGImage.Left:=Value;
  NameText.Left:=Value+5;
  Name2Text.Left:=Value+5;
  StrassenText.Left:=Value+5;
  PlzOrtText.Left:=Value+5;
  LoadText.Left:=Value+5;
end;

procedure TTSS_Button.SetFName(const Value: String);
begin
  FName := Value;
  BGShape.Name:=Value+'_BGS';
  BGImage.Name:=Value+'_BGI';
  NameText.Name:=Value+'_NTXT';
  Name2Text.Name:=Value+'_N2TXT';
  StrassenText.Name:=Value+'_STXT';
  PlzOrtText.Name:=Value+'_PTXT';
  LoadText.Name:=Value+'_LD';
end;

procedure TTSS_Button.SetFParent(const Value: TWincontrol);
begin
  FParent := Value;
  BGShape.Parent:=Value;;
  BGImage.Parent:=Value;
  NameText.Parent:=Value;
  Name2Text.Parent:=Value;
  StrassenText.Parent:=Value;
  PlzOrtText.Parent:=Value;
  LoadText.Parent:=Value;
end;

procedure TTSS_Button.SetFtop(const Value: Integer);
begin
  Ftop := Value;
  BGShape.Top:=Value;
  BGImage.Top:=Value+1;
  NameText.Top:=Value+5;
  Name2Text.Top:=Value+20;
  StrassenText.Top:=Value+35;
  PlzOrtText.Top:=Value+55;
  LoadText.Top:=Value+FHeight-15;
end;

procedure TTSS_Button.SetFWidth(const Value: integer);
begin
  FWidth := Value;
  BGShape.width:=value;
  BGImage.width:=value-2;
  NameText.width:=Value-10;
  Name2Text.width:=Value-10;
  StrassenText.width:=Value-10;
  PlzOrtText.width:=Value-10;
  LoadText.Width:=Value-10;
end;

procedure TTSS_Button.SetGalerieFiles(const Value: TStringList);
begin
  FGalerieFiles := Value;
end;

procedure TTSS_Button.SetGallerieCols(const Value: Word);
begin
  FGallerieCols := Value;
end;

procedure TTSS_Button.SetGallerieDivider(const Value: Word);
begin
  FGallerieDivider := Value;
end;

procedure TTSS_Button.SetGallerieH(const Value: Word);
begin
  FGallerieH := Value;
end;

procedure TTSS_Button.SetGallerieRows(const Value: Word);
begin
  FGallerieRows := Value;
end;

procedure TTSS_Button.SetGallerieW(const Value: Word);
begin
  FGallerieW := Value;
end;

procedure TTSS_Button.SetHasTimer(const Value: Boolean);
begin
  FHasTimer := Value;
end;

procedure TTSS_Button.SethParent(const Value: TWincontrol);
begin
  FhParent := Value;
  BGShape.Parent:=value;
  BGImage.Parent:=Value;
  NameText.Parent:=Value;
  Name2Text.Parent:=Value;
  StrassenText.Parent:=Value;
  PlzOrtText.Parent:=Value;
  LoadText.Parent:=Value;
end;

procedure TTSS_Button.SetInfoBox(const Value: TListBox);
begin
  FInfoBox := Value;
end;

procedure TTSS_Button.Setmedia_typ(const Value: integer);
begin
  Fmedia_typ := Value;
end;


procedure TTSS_Button.SetOnMouseup(const Value: TMouseEvent);
begin
  FOnMouseup := Value;
  BGShape.OnMouseUp:=ButtomMouseUp;
  BGImage.OnMouseUp:=ButtomMouseUp;
  NameText.OnMouseUp:=ButtomMouseUp;
  Name2Text.OnMouseUp:=ButtomMouseUp;
  StrassenText.OnMouseUp:=ButtomMouseUp;
  PlzOrtText.OnMouseUp:=ButtomMouseUp;
end;

procedure TTSS_Button.SetTag(const Value: word);
begin
  FTag := Value;
  BGShape.Tag:=value;
  BGImage.Tag:=value;
  NameText.Tag:=value;
  Name2Text.Tag:=value;
  PlzOrtText.Tag:=value;
  StrassenText.Tag:=value;
end;

procedure TTSS_Button.SetTimerTime(const Value: Word);
begin
  FTimerTime := Value;
  BtnTimer.Interval:=Value;
end;

procedure TTSS_Button.Setzuordnung_typ(const Value: integeR);
begin
  Fzuordnung_typ := Value;
end;

end.
