unit TSS_FE_AND_ButtonClass_Unit;

interface

uses
  System.SysUtils, System.Variants, System.Classes, FMX.Graphics,FMX.Types,FMX.Colors,FMX.ListBox,System.UITypes,
  FMX.Controls.Presentation,FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ExtCtrls, FMX.StdCtrls, FMX.Menus,FMX.Objects,
  FMX.Platform.Android;
type
  TextFeld = Record
    Text : String;
    left : word;
    top : word;
    Size : word;
    Color : TColorObject;
    font : TFont;
  End;


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
    BtnTimer:TTimer;
    FLeft: Integer;
    Ftop: Integer;
    FWidth: integer;
    FHeight: integer;
    FBGColor: TAlphaColor;
    FName: String;
    FParent: Tcontrol;
    FKundenName: String;
    FKundenName2: String;
    FKundenStrasse: String;
    FKundenPLZOrt: String;
    FOnMouseUp: TMouseEvent;
    FInfoBox: TListBox;
    FButtonActive: boolean;
    FButtonActionActive: word;
    FButtonActionInActive: word;
    FhParent: Tcontrol;
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
    FCanEditButton: Boolean;
    FBtnEditPopup: TPopupMenu;
    FTextZeile1: TextFeld;
    FTextZeile2: TextFeld;
    FTextZeile3: TextFeld;
    FTextZeile4: TextFeld;
    FTextZeile2_Text: String;
    FTextZeile3_Text: String;
    FTextZeile1_Text: String;
    FTextZeile4_Text: String;
    FTextZeile2_Text_X: Integer;
    FTextZeile3_Text_X: Integer;
    FTextZeile2_Text_Y: Integer;
    FTextZeile3_Text_Y: Integer;
    FTextZeile1_Text_X: Integer;
    FTextZeile1_Text_Y: Integer;
    FTextZeile4_Text_X: Integer;
    FTextZeile4_Text_Y: Integer;
    FTextZeile4_Text_S: TFont;
    FTextZeile2_Text_S: Tfont;
    FTextZeile3_Text_S: TFont;
    FTextZeile1_Text_S: TFont;
    FTextZeile1_Text_V: Boolean;
    FTextZeile4_Text_V: Boolean;
    FTextZeile2_Text_V: Boolean;
    FTextZeile3_Text_V: Boolean;
    FCenterVideo2File: String;
    FCenterVideo3File: String;
    FCenterVideo1File: String;
    FCenterVideo4File: String;
    FButtonvisible: boolean;
    Fvisible: Boolean;
    procedure SetFLeft(const Value: Integer);
    procedure SetFtop(const Value: Integer);
    procedure SetFWidth(const Value: integer);
    procedure SetFHeight(const Value: integer);
    procedure SetFBGColor(const Value: TAlphaColor);
    procedure SetFName(const Value: String);
    procedure SetFParent(const Value: TControl);
    procedure SetFKundenName(const Value: String);
    procedure SetFKundenName2(const Value: String);
    procedure SetFKundenStrasse(const Value: String);
    procedure SetFKundenPLZOrt(const Value: String);
    procedure MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SetInfoBox(const Value: TListBox);
    procedure SetOnMouseup(const Value: TMouseEvent);
    procedure SetButtonActive(const Value: boolean);
    procedure SetButtonActionActive(const Value: word);
    procedure SetButtonActionInActive(const Value: word);
    procedure SethParent(const Value: TControl);
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
    procedure SetCanEditButton(const Value: Boolean);
    procedure SetBtnEditPopup(const Value: TPopupMenu);
    procedure SetTextZeile1_Text(const Value: String);
    procedure SetTextZeile2_Text(const Value: String);
    procedure SetTextZeile3_Text(const Value: String);
    procedure SetTextZeile4_Text(const Value: String);
    procedure SetTextZeile1_Text_X(const Value: Integer);
    procedure SetTextZeile1_Text_Y(const Value: Integer);
    procedure SetTextZeile2_Text_X(const Value: Integer);
    procedure SetTextZeile2_Text_Y(const Value: Integer);
    procedure SetTextZeile3_Text_X(const Value: Integer);
    procedure SetTextZeile3_Text_Y(const Value: Integer);
    procedure SetTextZeile4_Text_X(const Value: Integer);
    procedure SetTextZeile4_Text_Y(const Value: Integer);
    procedure SetTextZeile1_Text_S(const Value: Tfont);
    procedure SetTextZeile2_Text_S(const Value: Tfont);
    procedure SetTextZeile3_Text_S(const Value: TFont);
    procedure SetTextZeile4_Text_S(const Value: TFont);
    procedure SetTextZeile1_Text_V(const Value: Boolean);
    procedure SetTextZeile2_Text_V(const Value: Boolean);
    procedure SetTextZeile3_Text_V(const Value: Boolean);
    procedure SetTextZeile4_Text_V(const Value: Boolean);
    procedure SetCenterVideo1File(const Value: String);
    procedure SetCenterVideo2File(const Value: String);
    procedure SetCenterVideo3File(const Value: String);
    procedure SetCenterVideo4File(const Value: String);
    procedure SetButtonvisible(const Value: boolean);
    procedure Setvisible(const Value: Boolean);
  published
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Property ButtonFileId:string read FButtonFileId write SetButtonFileId;
    Property EBGShape:TShape read BGShape;
    Property EBGImage:Timage read BGImage;
    property BtnPopup:TPopupMenu read FBtnPopup write SetBtnPopup;
    Property left:Integer read FLeft Write SetFLeft;
    Property top:Integer read Ftop Write SetFtop;
    property width:integer read FWidth Write SetFWidth;
    property height:integer read FHeight Write SetFHeight;
    property InfoBox:TListBox read FInfoBox write SetInfoBox;
    property Tag:word read FTag write SetTag;
    property BGColor:TAlphaColor read FBGColor write SetFBGColor;
    property Buttonid:String read FButtonid write SetFButtonid;
    property Name:String read FName write SetFName;
    property KundenName:String read FKundenName write SetFKundenName;
    property KundenName2:String read FKundenName2 write SetFKundenName2;
    property KundenStrasse:String read FKundenStrasse write SetFKundenStrasse;
    property KundenPLZOrt:String read FKundenPLZOrt write SetFKundenPLZOrt;
    property TextZeile1_Text:String read FTextZeile1_Text write SetTextZeile1_Text;
    property TextZeile1_Text_X:Integer read FTextZeile1_Text_X write SetTextZeile1_Text_X;
    property TextZeile1_Text_Y:Integer read FTextZeile1_Text_Y write SetTextZeile1_Text_Y;
    property TextZeile1_Text_S:TFont read FTextZeile1_Text_S write SetTextZeile1_Text_S;
    property TextZeile1_Text_V:Boolean read FTextZeile1_Text_V write SetTextZeile1_Text_V;
    property TextZeile2_Text:String read FTextZeile2_Text write SetTextZeile2_Text;
    property TextZeile2_Text_X:Integer read FTextZeile2_Text_X write SetTextZeile2_Text_X;
    property TextZeile2_Text_Y:Integer read FTextZeile2_Text_Y write SetTextZeile2_Text_Y;
    property TextZeile2_Text_S:Tfont read FTextZeile2_Text_S write SetTextZeile2_Text_S;
    property TextZeile2_Text_V:Boolean read FTextZeile2_Text_V write SetTextZeile2_Text_V;
    property TextZeile3_Text:String read FTextZeile3_Text write SetTextZeile3_Text;
    property TextZeile3_Text_X:Integer read FTextZeile3_Text_X write SetTextZeile3_Text_X;
    property TextZeile3_Text_Y:Integer read FTextZeile3_Text_Y write SetTextZeile3_Text_Y;
    property TextZeile3_Text_S:TFont read FTextZeile3_Text_S write SetTextZeile3_Text_S;
    property TextZeile3_Text_V:Boolean read FTextZeile3_Text_V write SetTextZeile3_Text_V;
    property TextZeile4_Text:String read FTextZeile4_Text write SetTextZeile4_Text;
    property TextZeile4_Text_X:Integer read FTextZeile4_Text_X write SetTextZeile4_Text_X;
    property TextZeile4_Text_Y:Integer read FTextZeile4_Text_Y write SetTextZeile4_Text_Y;
    property TextZeile4_Text_S:TFont read FTextZeile4_Text_S write SetTextZeile4_Text_S;
    property TextZeile4_Text_V:Boolean read FTextZeile4_Text_V write SetTextZeile4_Text_V;
    property Parent:Tcontrol read FParent Write SetFParent;
    property hParent:Tcontrol read FhParent write SethParent;
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
    property CanEditButton:Boolean read FCanEditButton write SetCanEditButton;
    property BtnEditPopup:TPopupMenu read FBtnEditPopup write SetBtnEditPopup;
    property Buttonvisible:boolean read FButtonvisible write SetButtonvisible;
    procedure MyBtnOnTimer(Sender: TObject);
    property GallerieDivider:Word read FGallerieDivider write SetGallerieDivider;
    property GallerieRows:Word read FGallerieRows write SetGallerieRows;
    property GallerieCols:Word read FGallerieCols write SetGallerieCols;
    property GallerieH:Word read FGallerieH write SetGallerieH;
    property GallerieW:Word read FGallerieW write SetGallerieW;
    property CenterVideo1File:String read FCenterVideo1File write SetCenterVideo1File;
    property CenterVideo2File:String read FCenterVideo2File write SetCenterVideo2File;
    property CenterVideo3File:String read FCenterVideo3File write SetCenterVideo3File;
    property CenterVideo4File:String read FCenterVideo4File write SetCenterVideo4File;
    property visible:Boolean read Fvisible write Setvisible;
    constructor Create(AOwner : TComponent); override;
    destructor done;
    procedure LoadButtonImage(Filename:string);
    procedure DisplayButton;
    procedure DisplayAdress;
    procedure SwitchAdress;
    function Adressvisible:boolean;
    procedure HideAdress;
    procedure DisplayLoading;
    Procedure ReLoadButton;
    Procedure LoadButton(FileId:string;reload:boolean=False);
    Procedure SaveButton(FileId:string);
    Procedure SaveButtonSelf;
    procedure ShowLed;
    Procedure HideLed;
    Procedure SetInfoLED(onOff:boolean);
    procedure ButtomMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function FontToString(tfd:TFont):String;
    procedure StringToFont(tfd:TFont;s:String);
    procedure AddCenterVideos(Liste:TStrings);
    function ConvertPathToAndroid(Path:string):StrinG;
  end;

implementation

uses system.inifiles;

procedure TTSS_Button.AddCenterVideos(Liste: TStrings);
begin
  if self.FCenterVideo1File<>'' then Liste.add(self.FCenterVideo1File);
  if self.FCenterVideo2File<>'' then Liste.add(self.FCenterVideo2File);
  if self.FCenterVideo3File<>'' then Liste.add(self.FCenterVideo3File);
  if self.FCenterVideo4File<>'' then Liste.add(self.FCenterVideo4File);
end;

function TTSS_Button.Adressvisible: boolean;
begin
  result:=NameText.Visible;
end;

procedure TTSS_Button.ButtomMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p:TPopupMenu;
begin
  if button=TMouseButton.mbRight then begin
{    if dataform.Debugmode then begin
      DataForm.PopupButton:=self;
      FBtnPopup.Popup(self.parent.left+self.left+self.parent.top+x,self.top+y);
    end else begin
      if FCanEditButton then begin
        DataForm.PopupButton:=self;
        FBtnPopup.Popup(self.parent.left+self.left+self.parent.top+x,self.top+y);
      end;
    end;  }
  end else begin
    FOnMouseUp(sender,Button,Shift,x,y);
  end;
end;

function TTSS_Button.ConvertPathToAndroid(Path: string): StrinG;
begin
  result:=path.Replace('C:\TSS\','/sdcard/TSS/').replace('\','/');
end;

constructor TTSS_Button.Create(AOwner: TComponent);
begin
  inherited;
  FGalerieFiles:=TStringList.Create;
  BGShape:=TShape.Create(self);
  BGImage:=TImage.Create(self);
  BGImage.Bitmap:=TBitmap.Create;
  BGImage.Bitmap.setSize(100,100);
  BGImage.Bitmap.clear(TAlphaColorRec.blue);
  BGImage.Parent:=self;
  FBtnPopup:=TPopupMenu.Create(nil);
  FBtnEditPopup:=TPopupMenu.Create(nil);
//  BGImage.Scale.:=1;
  BGImage.Visible:=false;
  NameText:=TLabel.Create(self);
  NameText.AutoSize:=false;
//  NameText.Alignment:=tacenter;
  NameText.Visible:=False;
  NameText.Text:='';
  TextZeile1_Text_s:=NameText.font;
  Name2Text:=TLabel.Create(self);
  Name2Text.AutoSize:=false;
//  Name2Text.Alignment:=tacenter;
  Name2Text.visible:=false;
  Name2Text.Text:='';
  TextZeile2_Text_s:=Name2Text.font;
  StrassenText:=TLabel.Create(self);
  StrassenText.AutoSize:=false;
//  StrassenText.Alignment:=tacenter;
  StrassenText.visible:=false;
  StrassenText.Text:='';
  TextZeile3_Text_s:=StrassenText.font;
  PlzOrtText:=TLabel.Create(Self);
  PlzOrtText.AutoSize:=false;
//  PlzOrtText.Alignment:=tacenter;
  PlzOrtText.visible:=false;
  PlzOrtText.text:='';
  TextZeile4_Text_S:=PlzOrtText.font;
  LoadText:=TLabel.Create(Self);
  LoadText.Text:='Der Inhalt des Partners ist'#13#10'neu überarbeitet worden und '#13#10' wird noch aus dem Internet geladen !'#13#10'Bitte etwas Gedult.';
  LoadText.Height:=40;
//  LoadText.Alignment:=tacenter;
  LoadText.Font.Size:=6;
  LoadText.visible:=false;
  BtnTimer:=Ttimer.Create(AOwner);
  BtnTimer.Enabled:=false;
  BtnTimer.OnTimer:=MyBtnOnTimer;
end;

procedure TTSS_Button.DisplayAdress;
begin
  BGShape.visible:=true;
  NameText.visible:=true;
  Name2Text.visible:=true;
  PlzOrtText.visible:=true;
  StrassenText.visible:=true;
end;

procedure TTSS_Button.DisplayButton;
begin
//  Self.Visible:=true;
  self.Visible:=FButtonvisible;
  BGImage.visible:=FButtonvisible;
  //self.parent.Repaint;
    if FButtonimgFilename<>'' then begin
      BGImage.visible:=true;
    end;
    NameText.Visible:=TextZeile1_Text_V or Adressvisible;
    Name2Text.Visible:=TextZeile2_Text_V or Adressvisible;
    StrassenText.Visible:=TextZeile3_Text_V or Adressvisible;
    PlzOrtText.Visible:=TextZeile4_Text_V or Adressvisible;
  if FHasTimer then begin
    BtnTimer.Enabled:=true;
  end;
end;

procedure TTSS_Button.DisplayLoading;
begin
  LoadText.visible:=true;
end;

destructor TTSS_Button.done;
begin
  freeandnil(BtnTimer);
  freeandnil(FGalerieFiles);
end;

function TTSS_Button.FontToString(tfd: TFont): String;
var st:String;
begin
//  st:=tfd.Name+';'+inttostr(tfd.Size)+';'+BoolToStr(fsBold in tfd.Style)+';'+BoolToStr(fsitalic in tfd.Style)+';'+colortostring(tfd.Color);
  Result:=st;
end;

procedure TTSS_Button.HideAdress;
begin
  BGShape.visible:=false;
  NameText.visible:=false;
  Name2Text.visible:=false;
  PlzOrtText.visible:=false;
  StrassenText.visible:=false;
end;

procedure TTSS_Button.HideLed;
begin
//  InfoLed.Visible:=false;
end;

procedure TTSS_Button.Mouseup(Sender:TObject;Button: TMouseButton; Shift: TShiftState;X, Y: Single);
begin
//  MessageBeep(0);
end;

procedure TTSS_Button.MyBtnOnTimer(Sender: TObject);
begin
  BtnTimer.Enabled:=False;
  FOnMouseUp(BGImage,TMouseButton.mbleft,[],0,0);
end;

procedure TTSS_Button.ReLoadButton;
begin
  self.LoadButton(FButtonFileId);
  self.BGImage.repaint;
  self.repaint;
end;

procedure TTSS_Button.LoadButton(FileId:string;reload:boolean=False);
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
    NameText.text:=self.KundenName;
    self.KundenName2:=IniPl.ReadString('Customer','Kundenname_2','');
    Name2Text.text:=self.KundenName2;
    self.KundenStrasse:=IniPl.ReadString('Customer','Kundenstrasse','');
    StrassenText.text:=self.KundenStrasse;
    self.KundenPLZOrt:=IniPl.ReadString('Customer','KundenplzOrt','');
    PlzOrtText.text:=self.KundenPLZOrt;
    //Edit13.text:=IniPl.ReadString('Button','Image','');
    self.ButtonimgFilename:=IniPl.ReadString('Button','Image','');
    self.Name:=IniPl.ReadString('Button','Name','');
    //Edit8.text:=IniPl.ReadString('Button','Tag','');
    self.Buttonvisible:=IniPl.ReadBool('Button','visible',true);
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
    self.FCanEditButton:=IniPl.ReadBool('Button','CanEdit',False);
    self.FButtonActionShowImage:=IniPl.ReadString('Data','ClickShowImage','');
    self.FButtonActionShowImageX:=IniPl.ReadInteger('Data','ClickShowImageX',0);
    self.FButtonActionShowImageY:=IniPl.ReadInteger('Data','ClickShowImageY',0);
    self.FButtonActionShowImageW:=IniPl.ReadInteger('Data','ClickShowImageW',0);
    self.FButtonActionShowImageH:=IniPl.ReadInteger('Data','ClickShowImageH',0);
    self.FButtonActionShowImageTimer:=IniPl.ReadInteger('Data','ClickShowImageTime',0);
    self.CenterVideo1File:=IniPl.ReadString('Data','CenterVideo1','');
    self.CenterVideo2File:=IniPl.ReadString('Data','CenterVideo2','');
    self.CenterVideo3File:=IniPl.ReadString('Data','CenterVideo3','');
    self.CenterVideo4File:=IniPl.ReadString('Data','CenterVideo4','');
    self.TextZeile1_Text:=IniPl.ReadString('TextData','TextZeile_1_Text','');
    self.TextZeile2_Text:=IniPl.ReadString('TextData','TextZeile_2_Text','');
    self.TextZeile3_Text:=IniPl.ReadString('TextData','TextZeile_3_Text','');
    self.TextZeile4_Text:=IniPl.ReadString('TextData','TextZeile_4_Text','');
    self.TextZeile1_Text_x:=IniPl.ReadInteger('TextData','TextZeile_1_Text_X',0);
    self.TextZeile2_Text_x:=IniPl.ReadInteger('TextData','TextZeile_2_Text_X',0);
    self.TextZeile3_Text_x:=IniPl.ReadInteger('TextData','TextZeile_3_Text_X',0);
    self.TextZeile4_Text_x:=IniPl.ReadInteger('TextData','TextZeile_4_Text_X',0);
    self.TextZeile1_Text_y:=IniPl.ReadInteger('TextData','TextZeile_1_Text_Y',0);
    self.TextZeile2_Text_y:=IniPl.ReadInteger('TextData','TextZeile_2_Text_Y',0);
    self.TextZeile3_Text_y:=IniPl.ReadInteger('TextData','TextZeile_3_Text_Y',0);
    self.TextZeile4_Text_y:=IniPl.ReadInteger('TextData','TextZeile_4_Text_Y',0);
    self.StringtoFont(TextZeile1_Text_s,IniPl.Readstring('TextData','TextZeile_1_Text_S',''));
    self.StringtoFont(TextZeile2_Text_s,IniPl.Readstring('TextData','TextZeile_2_Text_S',''));
    self.StringtoFont(TextZeile3_Text_s,IniPl.Readstring('TextData','TextZeile_3_Text_S',''));
    self.StringtoFont(TextZeile4_Text_s,IniPl.Readstring('TextData','TextZeile_4_Text_S',''));
    self.TextZeile1_Text_v:=IniPl.ReadBool('TextData','TextZeile_1_Text_V',False);
    self.TextZeile2_Text_v:=IniPl.ReadBool('TextData','TextZeile_2_Text_V',False);
    self.TextZeile3_Text_v:=IniPl.ReadBool('TextData','TextZeile_3_Text_V',False);
    self.TextZeile4_Text_v:=IniPl.ReadBool('TextData','TextZeile_4_Text_V',False);
    PlzOrtText.Text:=self.KundenPLZOrt;
  end;
//  if not reload then DataForm.ButtonList.Add(self);
end;

procedure TTSS_Button.LoadButtonImage(Filename: string);
var S:string;
begin
  if fileexistS(Filename) then
    BGImage.Bitmap.loadFromFile(Filename)
  else begin
    s:=filename;
    s[1]:=ParamStr(0)[1];
    if fileexistS(s) then BGImage.Bitmap.LoadFromFile(s);
  end;
  FButtonimgFilename:=FileName;
  BGImage.Repaint;
  BGImage.visible:=FButtonvisible;
  BGShape.visible:=false;
  NameText.visible:=TextZeile1_Text_V;
  Name2Text.visible:=TextZeile2_Text_V;
  StrassenText.visible:=TextZeile3_Text_V;
  PlzOrtText.visible:=TextZeile4_Text_V;
  LoadText.visible:=false;
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
    IniPl.WriteBool('Button','visible',self.Buttonvisible);
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
    IniPl.WriteBool('Button','CanEdit',self.FCanEditButton);
    IniPl.WriteString('Data','CenterVideo1',self.FCenterVideo1File);
    IniPl.WriteString('Data','CenterVideo2',self.FCenterVideo2File);
    IniPl.WriteString('Data','CenterVideo3',self.FCenterVideo3File);
    IniPl.WriteString('Data','CenterVideo4',self.FCenterVideo4File);
    IniPl.WriteString('Data','ClickShowImage',self.FButtonActionShowImage);
    IniPl.WriteInteger('Data','ClickShowImageX',self.FButtonActionShowImageX);
    IniPl.WriteInteger('Data','ClickShowImageY',self.FButtonActionShowImageY);
    IniPl.WriteInteger('Data','ClickShowImageW',self.FButtonActionShowImageW);
    IniPl.WriteInteger('Data','ClickShowImageH',self.FButtonActionShowImageH);
    IniPl.WriteInteger('Data','ClickShowImageTime',self.FButtonActionShowImageTimer);
    IniPl.WriteString('TextData','TextZeile_1_Text',self.TextZeile1_Text);
    IniPl.WriteString('TextData','TextZeile_2_Text',self.TextZeile2_Text);
    IniPl.WriteString('TextData','TextZeile_3_Text',self.TextZeile3_Text);
    IniPl.WriteString('TextData','TextZeile_4_Text',self.TextZeile4_Text);
    IniPl.WriteInteger('TextData','TextZeile_1_Text_X',self.TextZeile1_Text_x);
    IniPl.WriteInteger('TextData','TextZeile_2_Text_X',self.TextZeile2_Text_x);
    IniPl.WriteInteger('TextData','TextZeile_3_Text_X',self.TextZeile3_Text_x);
    IniPl.WriteInteger('TextData','TextZeile_4_Text_X',self.TextZeile4_Text_x);
    IniPl.WriteInteger('TextData','TextZeile_1_Text_Y',self.TextZeile1_Text_y);
    IniPl.WriteInteger('TextData','TextZeile_2_Text_Y',self.TextZeile2_Text_y);
    IniPl.WriteInteger('TextData','TextZeile_3_Text_Y',self.TextZeile3_Text_y);
    IniPl.WriteInteger('TextData','TextZeile_4_Text_Y',self.TextZeile4_Text_y);
    IniPl.WriteString('TextData','TextZeile_1_Text_S',self.FontToString(self.TextZeile1_Text_s));
    IniPl.WriteString('TextData','TextZeile_2_Text_S',self.FontToString(self.TextZeile2_Text_s));
    IniPl.WriteString('TextData','TextZeile_3_Text_S',self.FontToString(self.TextZeile3_Text_s));
    IniPl.WriteString('TextData','TextZeile_4_Text_S',self.FontToString(self.TextZeile4_Text_s));
    IniPl.WriteBool('TextData','TextZeile_1_Text_V',self.TextZeile1_Text_v);
    IniPl.WriteBool('TextData','TextZeile_2_Text_V',self.TextZeile2_Text_v);
    IniPl.WriteBool('TextData','TextZeile_3_Text_V',self.TextZeile3_Text_v);
    IniPl.WriteBool('TextData','TextZeile_4_Text_V',self.TextZeile4_Text_v);
end;

procedure TTSS_Button.SaveButtonSelf;
begin
  SaveButton(FButtonFileId);
end;

procedure TTSS_Button.SetBtnEditPopup(const Value: TPopupMenu);
begin
  FBtnEditPopup := Value;
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

procedure TTSS_Button.SetButtonvisible(const Value: boolean);
begin
  FButtonvisible := Value;
end;

procedure TTSS_Button.Setbutton_media_id(const Value: integer);
begin
  Fbutton_media_id := Value;
end;

procedure TTSS_Button.SetCanEditButton(const Value: Boolean);
begin
  FCanEditButton := Value;
//  InfoLed.LedOn := Value;
end;

procedure TTSS_Button.SetCenterVideo1File(const Value: String);
begin
  FCenterVideo1File := Value;
end;

procedure TTSS_Button.SetCenterVideo2File(const Value: String);
begin
  FCenterVideo2File := Value;
end;

procedure TTSS_Button.SetCenterVideo3File(const Value: String);
begin
  FCenterVideo3File := Value;
end;

procedure TTSS_Button.SetCenterVideo4File(const Value: String);
begin
  FCenterVideo4File := Value;
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

procedure TTSS_Button.SetFBGColor(const Value: TAlphaColor);
begin
  FBGColor := Value;
  BGShape.Fill.Color:=Value;
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
  NameText.Position.Y:=FTop+(Value div 2) - 30;
  Name2Text.Position.y:=FTop+(Value div 2) - 15;
  StrassenText.Position.y:=FTop+(Value div 2) + 15;
  PlzOrtText.Position.y:=FTop+(Value div 2) + 30;
  LoadText.Position.y:=FTop+Value-45;
//  InfoLed.top:=FTop;
end;

procedure TTSS_Button.SetFKundenName(const Value: String);
begin
  FKundenName := Value;
  NameText.Text:=Value;
end;

procedure TTSS_Button.SetFKundenName2(const Value: String);
begin
  FKundenName2 := Value;
  Name2Text.text:=Value;
end;

procedure TTSS_Button.SetFKundenPLZOrt(const Value: String);
begin
  FKundenPLZOrt := Value;
  PlzOrtText.Text:=Value;
end;

procedure TTSS_Button.SetFKundenStrasse(const Value: String);
begin
  FKundenStrasse := Value;
  StrassenText.Text:=Value;
end;

procedure TTSS_Button.SetFLeft(const Value: Integer);
begin
  FLeft := Value;//+DataForm.ButtonOffset_X;
  BGShape.Position.x:=FLeft;
  BGImage.Position.x:=FLeft;
  NameText.Position.x:=FLeft+5;
  Name2Text.Position.x:=FLeft+5;
  StrassenText.Position.x:=FLeft+5;
  PlzOrtText.Position.x:=FLeft+5;
  LoadText.Position.x:=FLeft+5;
//  InfoLed.left:=FLeft;
end;

procedure TTSS_Button.SetFName(const Value: String);
begin
  FName := Value;
  BGShape.Name:=Value+'_BGS';
  BGImage.Name:=Value+'_BGI';
  NameText.Name:=Value+'_NTXT';
  NameText.Text:=FKundenName;
  Name2Text.Name:=Value+'_N2TXT';
  Name2Text.Text:=FKundenName2;
  StrassenText.Name:=Value+'_STXT';
  StrassenText.Text:=FKundenStrasse;
  PlzOrtText.Name:=Value+'_PTXT';
  PlzOrtText.Text:=KundenPLZOrt;
  LoadText.Name:=Value+'_LD';
end;

procedure TTSS_Button.SetFParent(const Value: TControl);
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
  FTop := Value;//DataForm.ButtonOffset_Y;
  BGShape.Position.y:=FTop;
  BGImage.Position.y:=Ftop+1;
  NameText.Position.y:=Ftop+5;
  Name2Text.Position.y:=Ftop+20;
  StrassenText.Position.y:=Ftop+35;
  PlzOrtText.Position.y:=Ftop+55;
  LoadText.Position.y:=Ftop+FHeight-15;
end;

procedure TTSS_Button.SetFWidth(const Value: integer);
begin
  FWidth := Value;
  BGShape.width:=value;
  BGImage.width:=value-1;
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

procedure TTSS_Button.SethParent(const Value: TControl);
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

procedure TTSS_Button.SetInfoLED(onOff: boolean);
begin
//  InfoLed.Visible:=onoff;
end;

procedure TTSS_Button.Setmedia_typ(const Value: integer);
begin
  Fmedia_typ := Value;
end;


procedure TTSS_Button.SetOnMouseup(const Value: TMouseEvent);
begin
  FOnMouseup := Value;
  BGShape.OnMouseUp:=Value;
  BGImage.OnMouseUp:=Value;
  NameText.OnMouseUp:=Value;
  Name2Text.OnMouseUp:=Value;
  StrassenText.OnMouseUp:=Value;
  PlzOrtText.OnMouseUp:=Value;
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


procedure TTSS_Button.SetTextZeile1_Text(const Value: String);
begin
  FTextZeile1_Text := Value;
end;

procedure TTSS_Button.SetTextZeile1_Text_S(const Value: Tfont);
begin
  FTextZeile1_Text_S := Value;
  NameText.font:=value;
  NameText.Height:=value.Size*5;
end;

procedure TTSS_Button.SetTextZeile1_Text_V(const Value: Boolean);
begin
  FTextZeile1_Text_V := Value;
  NameText.Visible:=value;
end;

procedure TTSS_Button.SetTextZeile1_Text_X(const Value: Integer);
begin
  FTextZeile1_Text_X := Value;
end;

procedure TTSS_Button.SetTextZeile1_Text_Y(const Value: Integer);
begin
  FTextZeile1_Text_Y := Value;
end;

procedure TTSS_Button.SetTextZeile2_Text(const Value: String);
begin
  FTextZeile2_Text := Value;
end;


procedure TTSS_Button.SetTextZeile2_Text_S(const Value: Tfont);
begin
  FTextZeile2_Text_S := Value;
  Name2Text.font:=value;
  Name2Text.Height:=value.Size*5;
end;

procedure TTSS_Button.SetTextZeile2_Text_V(const Value: Boolean);
begin
  FTextZeile2_Text_V := Value;
  Name2Text.Visible:=value;
end;

procedure TTSS_Button.SetTextZeile2_Text_X(const Value: Integer);
begin
  FTextZeile2_Text_X := Value;
end;

procedure TTSS_Button.SetTextZeile2_Text_Y(const Value: Integer);
begin
  FTextZeile2_Text_Y := Value;
end;

procedure TTSS_Button.SetTextZeile3_Text(const Value: String);
begin
  FTextZeile3_Text := Value;
end;

procedure TTSS_Button.SetTextZeile3_Text_S(const Value: TFont);
begin
  FTextZeile3_Text_S := Value;
  StrassenText.font:=value;
  StrassenText.Height:=value.Size*5;
end;

procedure TTSS_Button.SetTextZeile3_Text_V(const Value: Boolean);
begin
  FTextZeile3_Text_V := Value;
  StrassenText.Visible:=value;
end;

procedure TTSS_Button.SetTextZeile3_Text_X(const Value: Integer);
begin
  FTextZeile3_Text_X := Value;
end;

procedure TTSS_Button.SetTextZeile3_Text_Y(const Value: Integer);
begin
  FTextZeile3_Text_Y := Value;
end;

procedure TTSS_Button.SetTextZeile4_Text(const Value: String);
begin
  FTextZeile4_Text := Value;
end;

procedure TTSS_Button.SetTextZeile4_Text_S(const Value: TFont);
begin
  FTextZeile4_Text_S := Value;
  PlzOrtText.font:=value;
  PlzOrtText.Height:=value.Size*5;
end;

procedure TTSS_Button.SetTextZeile4_Text_V(const Value: Boolean);
begin
  FTextZeile4_Text_V := Value;
  PLzOrtText.Visible:=value;
end;

procedure TTSS_Button.SetTextZeile4_Text_X(const Value: Integer);
begin
  FTextZeile4_Text_X := Value;
end;

procedure TTSS_Button.SetTextZeile4_Text_Y(const Value: Integer);
begin
  FTextZeile4_Text_Y := Value;
end;

procedure TTSS_Button.SetTimerTime(const Value: Word);
begin
  FTimerTime := Value;
  BtnTimer.Interval:=Value;
end;

procedure TTSS_Button.Setvisible(const Value: Boolean);
begin
  inherited;
  Fvisible := Value;
  BGImage.Visible:=value;
  BGShape.Visible:=value;
end;

procedure TTSS_Button.Setzuordnung_typ(const Value: integeR);
begin
  Fzuordnung_typ := Value;
end;

procedure TTSS_Button.ShowLed;
begin
//  InfoLed.Visible:=True;
end;

procedure TTSS_Button.StringToFont(tfd: TFont; s: String);
var s1,ss:string;
begin
  ss:=s;
  if ss>'' then begin
    s1:=copy(ss,1,pos(';',ss)-1);
    delete(ss,1,pos(';',ss));
//    tfd.Name:=s1;
    s1:=copy(ss,1,pos(';',ss)-1);
    delete(ss,1,pos(';',ss));
    tfd.Size:=strtoint(s1);
    s1:=copy(ss,1,pos(';',ss)-1);
    delete(ss,1,pos(';',ss));
//    if StrToBool(s1) then tfd.Style:=[fsbold];
    s1:=copy(ss,1,pos(';',ss)-1);
    delete(ss,1,pos(';',ss));
//    if StrToBool(s1) then tfd.Style:=tfd.Style+[fsitalic];
    if pos(';',ss)>0 then s1:=copy(ss,1,pos(';',ss)-1) else s1:=ss;
    if pos(';',ss)>0 then delete(ss,1,pos(';',ss)) else ss:='';
//    tfd.Color:=Stringtocolor(s1);
  end;
end;

procedure TTSS_Button.SwitchAdress;
begin
  if BGShape.Visible then begin
    BGShape.visible:=false;
    NameText.visible:=false;
    Name2Text.visible:=false;
    PlzOrtText.visible:=false;
    StrassenText.visible:=false;
  end else begin
    BGShape.visible:=True;
    NameText.visible:=True;
    Name2Text.visible:=True;
    PlzOrtText.visible:=True;
    StrassenText.visible:=True;
  end;
end;

end.
