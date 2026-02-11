unit TSS_FE_StorryPanel_class_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,TSS_ButtonClass_unit, Vcl.StdCtrls,WMPLib_TLB,
  Vcl.ExtCtrls,system.Contnrs,system.IniFiles,system.strutils;


type
  TTSSRegion = Class(TObject)
  private
    Fwidth: Word;
    FTop: word;
    Fheight: word;
    FLeft: word;
    Fmark: boolean;
    FAction: String;
    FActionOption: String;
    procedure Setheight(const Value: word);
    procedure SetLeft(const Value: word);
    procedure SetTop(const Value: word);
    procedure Setwidth(const Value: Word);
    procedure Setmark(const Value: boolean);
    procedure SetAction(const Value: String);
    procedure SetActionOption(const Value: String);
  published
    property Top:word read FTop write SetTop;
    property Left:word read FLeft write SetLeft;
    property width:Word read Fwidth write Setwidth;
    property height:word read Fheight write Setheight;
    property mark:boolean read Fmark write Setmark;
    property Action:String read FAction write SetAction;
    property ActionOption:String read FActionOption write SetActionOption;
    function CheckClick(x,y:word):boolean;
  End;

Type
  TActionNotifyEvent = procedure(Sender: TObject;Aktion,AktionOption:String) of object;

type
  TTSS_StorryPanel = Class(TPanel)
    Images:TObjectList;
    Videos:TObjectList;
    Buttons:TObjectList;
    Regions:TObjectList;
    MyInfoPanel:tpanel;
    WaitTimerBTN:TImage;
    CounterText:TLabel;
    MyTimeoutTimer:TTimer;
    CountdownTimer:TTimer;
  private
    FLoadError:string;
    Fisinfopanel: boolean;
    FisTimeout: boolean;
    FStorrytimeOut: word;
    FOnAktion: TActionNotifyEvent;
    FFilename: String;
    Ftimeoutstorry: String;
    Fclosestorry: String;
    FTimeOutButtonImage: String;
    FisCounter: boolean;
    FCountercount:Word;
    FCounterText:string;
    procedure MyMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function CheckRegions(x,y:word):boolean;
    procedure SetOnAktion(const Value: TActionNotifyEvent);
    procedure SetFilename(const Value: String);
    procedure Settimeoutstorry(const Value: String);
    procedure Setclosestorry(const Value: String);
    procedure SetTimeOutButtonImage(const Value: String);
    procedure SetisCounter(const Value: boolean);
  public
    constructor create(AOwner:TComponent); override;
    procedure close;
    Function LoadStorry(Filename:string):Boolean;
    Function RunStorry:boolean;
    function CheckVarInt(s:string):Integer;
    destructor destroy; override;
    procedure myTimeoutAktion(Sender: TObject);
    procedure sekundenausgabe(Sender: TObject);
  published
    property LoadError:string read FLoadError;
    property Storrytimeout:word read FStorrytimeOut;
    property isinfopanel:boolean read Fisinfopanel;
    property isTimeout:boolean read FisTimeout;
    property isCounter:boolean read FisCounter write SetisCounter;
    property Filename:String read FFilename write SetFilename;
    property timeoutstorry:String read Ftimeoutstorry write Settimeoutstorry;
    property closestorry:String read Fclosestorry write Setclosestorry;
    property TimeOutButtonImage:String read FTimeOutButtonImage write SetTimeOutButtonImage;
    property OnAktion: TActionNotifyEvent read FOnAktion write SetOnAktion;
    procedure MyStorryMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  end;


implementation

uses TSS_FE_DataForm, TSS_FE_MainScreen,TSS_FE_BlackoutForm_unit;

{ TTSS_StorryPanel }

function TTSS_StorryPanel.CheckRegions(x, y: word):boolean;
var
  count: Integer;
  reg:TTSSRegion;
  i,a:word;
  found:boolean;
  img:TImage;
  substr,subOption:string;
  SdynArr:TArray<string>;
function findimg(nr:word):Timage;
var a2:word;img2:timage;
begin
  a2:=0;
  found:=false;
  img2:=nil;
  while (a2<Images.count) and (not found) do begin
    img2:=Timage(images.items[a2]);
    found:=img2.tag=nr;
    inc(a2);
  end;
  if found then result:=img2 else result:=nil;
end;

begin
  for count := 0 to Regions.count-1 do begin
    reg:=TTSSRegion(Regions[count]);
    if reg.checkclick(x,y) then begin
      if UpperCase(reg.Action)='CLOSE' then begin
        FOnAktion(self,UpperCase(reg.Action),reg.ActionOption);
        break;
      end else
      if UpperCase(reg.Action)='UDP' then begin
        FOnAktion(self,UpperCase(reg.Action),reg.ActionOption);
        break;
      end else begin
        if UpperCase(reg.Action)='SHOWIMAGE' then begin
          if pos('H[',reg.ActionOption)>0 then begin
            subOption:=copy(reg.ActionOption,pos('H[',reg.ActionOption)+2,pos(']H',reg.ActionOption)-pos('H[',reg.ActionOption)-2);
            SdynArr:=SplitString(subOption,',');
            for I := 0 to High(SdynArr) do begin
              substr:=SdynArr[i];
              if pos('-',substr)>0 then begin
                for a := strtoint(copy(substr,1,pos('-',substr)-1)) to strtoint(copy(substr,pos('-',substr)+1,length(substr))) do begin
                  img:=findimg(a);
                  if img<>nil then begin
                    img.visible:=false;
                    Self.repaint;
                  end;
                end;
              end else begin
                img:=findimg(strtoint(substr));
                if img<>nil then begin
                  img.visible:=false;
                  Self.repaint;
                end;
              end;
            end;
          end;
          if pos('S[',reg.ActionOption)>0 then begin
            subOption:=copy(reg.ActionOption,pos('S[',reg.ActionOption)+2,pos(']S',reg.ActionOption)-pos('S[',reg.ActionOption)-2);
            SdynArr:=SplitString(subOption,',');
            for I := 0 to high(SdynArr) do begin
              substr:=SdynArr[i];
              if pos('-',substr)>0 then begin
                for a := strtoint(copy(substr,1,pos('-',substr)-1)) to strtoint(copy(substr,pos('-',substr)+1,length(substr))) do begin
                  img:=findimg(a);
                  if img<>nil then begin
                    img.visible:=true;
                    img.BringToFront;
                    Self.repaint;
                  end;
                end;
              end else begin
                img:=findimg(strtoint(substr));
                if img<>nil then begin
                  img.visible:=true;
                  img.BringToFront;
                  Self.repaint;
                end;
              end;
            end;
          end;
          a:=0;
        end;
      end;
    end;
  end;
end;

function TTSS_StorryPanel.CheckVarInt(s: string): Integer;
var vari:string;
    StorryFile:TIniFile;
begin
  if s[1]='[' then begin
    vari:=s;
    delete(vari,1,1);
    delete(vari,length(vari),1);
    StorryFile:=TInifile.Create(FFilename);
    Result:=StorryFile.Readinteger('Variable_'+vari,'Value',0);
  end else Result:=strtoint(s);
end;

procedure TTSS_StorryPanel.close;
var counter:word;img:timage;
begin
  if Videos.Count>0 then for counter := 0 to Videos.Count-1 do freeandnil(TWindowsMediaPlayer(Videos[counter]));
  Freeandnil(Regions);
  Freeandnil(Buttons);
  Freeandnil(Videos);
  Freeandnil(images);
end;

constructor TTSS_StorryPanel.create(AOwner: TComponent);
begin
  inherited;
  images:=TObjectList.create;
  Videos:=TObjectList.create;
  Buttons:=TObjectList.create;
  Regions:=TObjectList.create;
  MyInfoPanel:=TPanel.create(self);
  MyInfoPanel.parent:=self;
  MyInfoPanel.Height:=40;
  MyInfoPanel.Width:=400;
  MyInfoPanel.Left:=DataForm.Mainform_X-MyInfoPanel.Width-2;
  MyInfoPanel.top:=DataForm.Mainform_Y-MyInfoPanel.Height-2;
  CounterText:=TLabel.create(self);
  CounterText.parent:=self;
  CounterText.top:=10;
  CounterText.Left:=100;
  CounterText.Caption:='00';
  WaitTimerBTN:=TImage.create(MyInfoPanel);
  WaitTimerBTN.Parent:=MyInfoPanel;
  WaitTimerBTN.Align:=alClient;
  WaitTimerBTN.Visible:=true;
  WaitTimerBTN.Stretch:=true;
  WaitTimerBTN.OnMouseUp:=MyStorryMouseUp;
  MyTimeoutTimer:=TTimer.Create(nil);
  CountdownTimer:=TTimer.Create(nil);
  CountdownTimer.OnTimer:=sekundenausgabe;
  self.OnMouseup:=MyMouseUp;
end;

destructor TTSS_StorryPanel.destroy;
var counter:word;img:timage;
begin
  if Videos.Count>0 then for counter := 0 to Videos.Count-1 do freeandnil(TWindowsMediaPlayer(Videos[counter]));
  Freeandnil(MyTimeoutTimer);
  Freeandnil(MyInfoPanel);
  Freeandnil(Regions);
  Freeandnil(Buttons);
  Freeandnil(Videos);
  Freeandnil(images);
end;

function TTSS_StorryPanel.LoadStorry(Filename: string): Boolean;
var StorryFile:TIniFile;
    ButtonCount,Regioncount,ElementCount:word;
    z,counter: Integer;
    ETyp:string;
    buttonFname,EFile:String;
    ElementImage:Timage;
    EReg:TTSSRegion;
    Sh:TTSS_Button;
begin
  Blackoutform.show;
  Blackoutform.BringToFront;
  Blackoutform.Repaint;
  FFilename:=Filename;
  StorryFile:=TInifile.Create(Filename);
  ElementCount:=StorryFile.Readinteger('Elements','Elementcount',0);
  ButtonCount:=StorryFile.Readinteger('Elements','Buttoncount',0);
  RegionCount:=StorryFile.Readinteger('Elements','Regioncount',0);
  Fisinfopanel:=StorryFile.ReadBool('Elements','InfoShow',True);
  FisCounter:=StorryFile.ReadBool('Elements','CounterShow',False);
  MyInfoPanel.Width:=StorryFile.Readinteger('Elements','InfoPanelWidth',100);
  MyInfoPanel.height:=StorryFile.Readinteger('Elements','InfoPanelHeight',40);
  MyInfoPanel.Top:=StorryFile.Readinteger('Elements','InfoPanelTop',DataForm.Mainform_H-MyInfoPanel.Height-50);
  MyInfoPanel.Left:=StorryFile.Readinteger('Elements','InfoPanelLeft',DataForm.Mainform_W-MyInfoPanel.Width-10);
  CounterText.Top:=StorryFile.Readinteger('Elements','CounterTop',DataForm.Mainform_H-MyInfoPanel.Height-50);
  CounterText.Left:=StorryFile.Readinteger('Elements','CounterLeft',DataForm.Mainform_W-MyInfoPanel.Width-10);
  FCounterText:=StorryFile.ReadString('Elements','CounterText','');
  CounterText.Caption:=FCounterText+' 00';
  CounterText.font.color:=stringtocolor(StorryFile.ReadString('Elements','CounterColor','clWhite'));
  CounterText.font.size:=StorryFile.Readinteger('Elements','Countersize',20);
  FisTimeout:=StorryFile.ReadBool('Elements','TimeOut',True);
  FStorryTimeOut:=StorryFile.Readinteger('Elements','StorryTimeOut',60);
  FCountercount:=FStorryTimeOut;
  Ftimeoutstorry:=StorryFile.ReadString('Elements','TimeOutStorry','');
  TimeOutButtonImage:=StorryFile.ReadString('Elements','TimeOutButtonImage','');
  Fclosestorry:=StorryFile.ReadString('Elements','CloseStorry','');
  self.left:=StorryFile.Readinteger('Elements','Left',0);
  self.top:=StorryFile.Readinteger('Elements','top',0);
  self.width:=StorryFile.Readinteger('Elements','width',DataForm.Mainform_W);
  self.height:=StorryFile.Readinteger('Elements','Height',DataForm.Mainform_H);
  FLoadError:='';
  result:=true;
  for counter := 1 to Elementcount do begin
    ETyp:=StorryFile.ReadString('Element_'+inttostr(counter),'Type','');
    if UpperCase(ETyp)='NIL' then begin
    end else
    if UpperCase(ETyp)='IMAGE' then begin
      try
        ElementImage:=TImage.create(nil);
        ElementImage.Parent:=self;
        if fileexists(StorryFile.ReadString('Element_'+inttostr(counter),'File','C:\rrrr')) then begin
          ElementImage.Picture.LoadFromFile(StorryFile.ReadString('Element_'+inttostr(counter),'File',''));
        end else begin
          FLoadError:='Bild von Element '+inttostr(counter)+' ('+StorryFile.ReadString('Element_'+inttostr(counter),'File','')+') fehlt !';
          result:=false;
        end;
        ElementImage.left:=CheckVarInt(StorryFile.ReadString('Element_'+inttostr(counter),'Left','0'));
        ElementImage.top:=CheckVarInt(StorryFile.ReadString('Element_'+inttostr(counter),'Top','0'));
        ElementImage.Width:=CheckVarInt(StorryFile.ReadString('Element_'+inttostr(counter),'Width',inttostr(DataForm.Mainform_W)));
        ElementImage.Height:=CheckVarInt(StorryFile.Readstring('Element_'+inttostr(counter),'Height',inttostr(DataForm.Mainform_H)));
        ElementImage.tag:=counter;
        ElementImage.OnMouseUp:=Self.OnMouseUp;
        if UpperCase(StorryFile.ReadString('Element_'+inttostr(counter),'StretchTyp',''))='CUT' then ElementImage.Stretch:=false else ElementImage.Stretch:=true;
        ElementImage.Visible:=StorryFile.ReadBool('Element_'+inttostr(counter),'InitVis',False);
      finally
        Images.add(ElementImage);
      end;
    end;
  end;
  for counter := 1 to Regioncount do begin
    if StorryFile.ReadString('Region_'+inttostr(counter),'Action','111')<>'111' then begin
      EReg:=TTSSRegion.create;
      EReg.Action:=StorryFile.ReadString('Region_'+inttostr(counter),'Action','');
      EReg.ActionOption:=StorryFile.ReadString('Region_'+inttostr(counter),'ActionOption','');
      EReg.Left:=StorryFile.ReadInteger('Region_'+inttostr(counter),'Left',0);
      EReg.Top:=StorryFile.ReadInteger('Region_'+inttostr(counter),'top',0);
      EReg.Width:=StorryFile.ReadInteger('Region_'+inttostr(counter),'Width',0);
      EReg.Height:=StorryFile.ReadInteger('Region_'+inttostr(counter),'Height',0);
      EReg.Mark:=StorryFile.ReadBool('Region_'+inttostr(counter),'Mark',False);
      regions.add(EReg);
    end;
  end;
  self.visible:=false;
  for counter := 1 to Buttoncount do begin
    buttonFname:=StorryFile.ReadString('Buttons','Button'+inttostr(counter),'');
    if buttonFname<>'' then begin
      if fileexists(DataForm.MainPath+'SchemaTemp\'+buttonFname+'.BDTA') then begin
        sh:=TTSS_Button.Create(nil);
        sh.BGColor:=clwhite;
        sh.OnMouseup:=MyStorryMouseUp;
        sh.LoadButton(DataForm.MainPath+'SchemaTemp\'+buttonFname+'.BDTA');
        sh.BtnPopup:=MainDisplayForm.PopupMenu1;
        sh.BtnEditPopup:=MainDisplayForm.EditMenuPopup;
        sh.Hint:=sh.Buttonid+#13#10+Sh.ButtonimgFilename+#13#10+sh.Feldname+#13#10+sh.ButtonFileId;
        sh.EBGImage.Hint:=sh.Hint;
        if DataForm.Debugmode then begin
          sh.ShowHint:=true;
          sh.EBGImage.ShowHint:=true;
        end else begin
          sh.ShowHint:=false;
          sh.EBGImage.ShowHint:=False;
        end;
        sh.Parent:=self;
        if (sh.button_media_id>0) and (sh.ButtonimgFilename<>'') then begin
          if sh.media_typ>100 then Begin
            if fileexists(sh.ButtonimgFilename) then begin
              sh.LoadButtonImage(sh.ButtonimgFilename);
            end else begin
              sh.LoadButtonImage(DataForm.MainPath+'Default\buttonFehlt.jpg');
              DataForm.writeDBLog('PRG_START_NFO','Offline - Kunde - Feld '+sh.Buttonid+' Button '+sh.ButtonimgFilename+' fehlt !','',2);
            end;
          End;
        end else begin
          Sh.DisplayAdress;
          DataForm.writeDBLog('PRG_START_NFO','Offline - Kunde - Feld '+sh.Buttonid+' Button - kein Bild !','',2);
        end;
        sh.DisplayButton;
        sh.BringToFront;
      end;
    end else begin
      DataForm.writeDBLog('PRG_START_NFO','Offline - Kunde - ButtonDatei '+buttonFName+' fehlt !','',2);
    end;
    if sh<>nil then begin
      DataForm.writeDBLog('PRG_START_NFO','Offline - Kunde - Feld '+sh.Buttonid+' '+Sh.Feldname,'',2);
      DataForm.writeDBLog('PRG_START_NFO','Offline - Kunde - ButtonBild '+sh.ButtonimgFilename,'',2);
    end;
    if sh<>nil then sh.visible:=sh.Buttonvisible;
    buttons.add(sh);
    self.Repaint;
  end;
  if Fisinfopanel then begin
    if FTimeOutButtonImage<>'' then WaitTimerBTN.picture.LoadFromFile(FTimeOutButtonImage);
  end;
  MyInfoPanel.Visible:=Fisinfopanel;
  if FisTimeout then begin
    MyTimeoutTimer.Interval:=FStorrytimeOut*1000;
    MyTimeoutTimer.enabled:=FisTimeout;
    MyTimeoutTimer.OnTimer:=myTimeoutAktion;
  end else MyTimeoutTimer.enabled:=False;
  CounterText.BringToFront;
  CounterText.Visible:=Fiscounter;
  self.visible:=True;
  self.Refresh;
  self.BringToFront;
  MainDisplayForm.Panel1.BringToFront;
  BlackoutForm.close;
end;

procedure TTSS_StorryPanel.MyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (ssAlt in Shift) and (ssCtrl in Shift) then begin
    ShowMessage('Mouse :    x: '+inttostr(x)+#13#10+'           y: '+inttostr(y));
  end else begin
    CheckRegions(x,y);
  end;
end;

procedure TTSS_StorryPanel.MyStorryMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ClickBtn:TTSS_Button;nextstorry:String;
begin
  if sender.classname='TImage' then begin
    if TImage(Sender).Owner.ClassName='TTSS_Button' then begin
      ClickBtn:=TTSS_Button(Timage(Sender).Owner);
      if (ClickBTn.buttonactionactive=3) then Begin
        nextstorry:=ClickBtn.ClickPlayListFileName;
      End;
      if (ClickBTn.buttonactionactive=5) then Begin
        MainDisplayForm.IdUDPClient1.Host:=DataForm.UDPResponder_Host;
        MainDisplayForm.IdUDPClient1.Port:=DataForm.UDPResponder_Port;
        MainDisplayForm.IdUDPClient1.Send(ClickBtn.ClickPlayListFileName);
      End;
    End else
    if TImage(Sender).Owner.ClassName='TPanel' then begin
      nextstorry:=Fclosestorry;
    end;
    MyTimeoutTimer.enabled:=false;
    if assigned(FOnAktion) then FonAktion(sender,'STORRY',nextstorry);
  End;
end;

procedure TTSS_StorryPanel.myTimeoutAktion(Sender: TObject);
begin
  MyTimeoutTimer.Enabled:=false;
  if assigned(FOnAktion) then FonAktion(sender,'TIMEOUT',Ftimeoutstorry);
end;

function TTSS_StorryPanel.RunStorry: boolean;
begin
  self.visible:=True;
end;

procedure TTSS_StorryPanel.sekundenausgabe(Sender: TObject);
begin
  Dec(FCountercount);
  CounterText.caption:=FCounterText+' '+inttostr(FCountercount);
  CounterText.Repaint;
  if FCountercount<=0 then CountdownTimer.enableD:=false;
end;

procedure TTSS_StorryPanel.Setclosestorry(const Value: String);
begin
  Fclosestorry := Value;
end;

procedure TTSS_StorryPanel.SetFilename(const Value: String);
begin
  FFilename := Value;
end;

procedure TTSS_StorryPanel.SetisCounter(const Value: boolean);
begin
  FisCounter := Value;
end;

procedure TTSS_StorryPanel.SetOnAktion(const Value: TActionNotifyEvent);
begin
  FOnAktion := Value;
end;

procedure TTSS_StorryPanel.SetTimeOutButtonImage(const Value: String);
begin
  FTimeOutButtonImage := Value;
end;

procedure TTSS_StorryPanel.Settimeoutstorry(const Value: String);
begin
  Ftimeoutstorry := Value;
end;

{ TTSSRegion }

function TTSSRegion.CheckClick(x, y: word): boolean;
begin
  result:=((x>Fleft) and (x<Fleft+Fwidth) and (y>Ftop) and (y<Ftop+Fheight));
end;

procedure TTSSRegion.SetAction(const Value: String);
begin
  FAction := Value;
end;

procedure TTSSRegion.SetActionOption(const Value: String);
begin
  FActionOption := Value;
end;

procedure TTSSRegion.Setheight(const Value: word);
begin
  Fheight := Value;
end;

procedure TTSSRegion.SetLeft(const Value: word);
begin
  FLeft := Value;
end;

procedure TTSSRegion.Setmark(const Value: boolean);
begin
  Fmark := Value;
end;

procedure TTSSRegion.SetTop(const Value: word);
begin
  FTop := Value;
end;

procedure TTSSRegion.Setwidth(const Value: Word);
begin
  Fwidth := Value;
end;

end.
