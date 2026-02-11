unit TSS_OS_IconClass_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,TSS_HttpButtonImgLoadThread_unit,
  Vcl.StdCtrls, Vcl.Menus,dsLeds,system.inifiles, JPP.Labels;

Type
  TSS_OS_IconClass=class(TPanel)
    Iconimage:TImage;
    LabelTop:TJppShadowLabel;
  private
    LabelBottom:TJppShadowLabel;
    FActionCommand: string;
    FActiontype: string;
    FActionOption: string;
    FIconName: string;
    FOnMouseup: TMouseEvent;
    Fleft: integer;
    Ftop: integeR;
    FAddTopL1: integeR;
    FAddTopL2: integeR;
    FImgLeftAdd:Integer;
    Fvisible: boolean;
    Fparent: TWinControl;
    procedure SetActionCommand(const Value: string);
    procedure SetActionOption(const Value: string);
    procedure SetActiontype(const Value: string);
    procedure SetIconName(const Value: string);
    procedure SetOnMouseup(const Value: TMouseEvent);
    procedure Setleft(const Value: integer);
    procedure Settop(const Value: integeR);
    procedure Setvisible(const Value: boolean);
    procedure Setparent(const Value: TWinControl);
    function GetLabelBottom: TJppShadowLabel;
  published
    property IconName:string read FIconName write SetIconName;
    property Actiontype:string read FActiontype write SetActiontype;
    property ActionCommand:string read FActionCommand write SetActionCommand;
    property ActionOption:string read FActionOption write SetActionOption;
    property OnMouseup: TMouseEvent read FOnMouseup write SetOnMouseup;
    property left:integer read FLeft write Setleft;
    property top:integer read FTop write Settop;
    property visible:boolean read Fvisible write Setvisible;
    property LBT:TJppShadowLabel read GetLabelBottom;
    property parent:TWinControl read Fparent write Setparent;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure loadIcon;
    procedure SaveIcon;
    procedure Showicon;
    procedure HideIcon;
  end;
implementation

{ TSS_OS_IconClass }

constructor TSS_OS_IconClass.Create(AOwner: TComponent);
begin
  inherited;
  self.Color:=clbtnface;
  self.name:='';
  Iconimage:=Timage.create(self);
  Iconimage.parent:=Twincontrol(AOwner);
  iconimage.width:=50;
  Iconimage.height:=50;
  fimgleftadd:=20;
  iconimage.left:=30+fimgleftadd;
  Iconimage.top:=50;
  iconimage.Stretch:=true;
  Iconimage.OnMouseUp:=FonMouseUp;
  Iconimage.Visible:=false;
  LabelTop:=TJppShadowLabel.create(AOwner);
  labeltop.Appearance.CaptionShadow.Enabled:=true;
  labeltop.Appearance.CaptionShadow.Color:=clGray;
  labeltop.font.color:=RGB(230,230,230);
  labeltop.parent:=Twincontrol(AOwner);
  labeltop.AutoSize:=false;
  labeltop.left:=30;
  FAddTopL1:=60;
  labeltop.top:=30+FAddTopL1;
  labeltop.caption:='___1___';
  labeltop.OnMouseUp:=FonMouseUp;
  Labeltop.Alignment:=taCenter;
  LabelTop.Width:=90;
  LabelTop.font.Style:=[fsbold];
  LabelTop.visible:=false;
  Labelbottom:=TJppShadowLabel.create(AOwner);
  Labelbottom.Appearance.CaptionShadow.Enabled:=true;
  Labelbottom.Appearance.CaptionShadow.Color:=clgray;
  Labelbottom.font.color:=RGB(230,230,230);
  Labelbottom.parent:=Twincontrol(AOwner);
  Labelbottom.AutoSize:=false;
  Labelbottom.left:=30;
  FAddTopL2:=80;
  Labelbottom.top:=30+FAddTopL2;
  LabelBottom.Width:=90;
  Labelbottom.caption:='___2___';
  Labelbottom.OnMouseUp:=FonMouseUp;
  LabelBottom.Alignment:=taCenter;
  LabelBottom.font.Style:=[fsbold];
  LabelBottom.visible:=false;
end;

destructor TSS_OS_IconClass.Destroy;
begin
  freeandnil(Iconimage);
  freeandnil(LabelTop);
  freeandnil(LabelBottom);
  inherited;
end;

function TSS_OS_IconClass.GetLabelBottom: TJppShadowLabel;
begin
  Result:=LabelBottom;
end;

procedure TSS_OS_IconClass.HideIcon;
begin
  Iconimage.Hide;
  LabelTop.hide;
  LabelBottom.hide;
end;

procedure TSS_OS_IconClass.loadIcon;
var IniPl:TInifile;
begin
  if fileexists(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_OS_init.ini') then begin
    IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Webtemp\Config\TSS_OS_init.ini');
  end else begin
    if fileexists(Paramstr(0)[1]+':\TSS\Config\TSS_OS_init.ini') then begin
      IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Config\TSS_OS_init.ini');
    end;
  end;
  if IniPl<>nil then begin
    iconimage.Picture.LoadFromFile(IniPl.ReadString(FIconName,'Image','C:\TSS\Webtemp\Default\buttonfehlt.jpg'));
    FActiontype:=IniPl.ReadString(FIconName,'ActionTyp','NONE');
    FActionCommand:=IniPl.ReadString(FIconName,'ActionCommand','NONE');
    FActionOption:=IniPl.ReadString(FIconName,'ActionOption','NONE');
    Setleft(IniPl.ReadInteger(FIconName,'Left',0));
    Settop(IniPl.ReadInteger(FIconName,'top',0));
    labeltop.caption:=IniPl.ReadString(FIconName,'Text1','');
    labelBottom.caption:=IniPl.ReadString(FIconName,'Text2','');
  end;
end;

procedure TSS_OS_IconClass.SaveIcon;
begin

end;

procedure TSS_OS_IconClass.SetActionCommand(const Value: string);
begin
  FActionCommand := Value;
end;

procedure TSS_OS_IconClass.SetActionOption(const Value: string);
begin
  FActionOption := Value;
end;

procedure TSS_OS_IconClass.SetActiontype(const Value: string);
begin
  FActiontype := Value;
end;

procedure TSS_OS_IconClass.SetIconName(const Value: string);
begin
  FIconName := Value;
end;

procedure TSS_OS_IconClass.Setleft(const Value: integer);
begin
  Fleft := Value;
  iconimage.left:=Fleft+FImgLeftAdd;
  LabelTop.left:=FLeft;
  LabelBottom.left:=FLeft;
end;

procedure TSS_OS_IconClass.SetOnMouseup(const Value: TMouseEvent);
begin
  FOnMouseup := Value;
  Iconimage.OnMouseUp:=Value;
  labeltop.OnMouseUp:=Value;
  labelBottom.OnMouseUp:=Value;
end;

procedure TSS_OS_IconClass.Setparent(const Value: TWinControl);
begin
  Fparent := Value;
end;

procedure TSS_OS_IconClass.Settop(const Value: integeR);
begin
  Ftop := Value;
  iconimage.top:=Ftop;
  LabelTop.top:=Ftop+FAddTopL1;
  LabelBottom.top:=Ftop+FAddtopL2;
end;

procedure TSS_OS_IconClass.Setvisible(const Value: boolean);
begin
  Fvisible := Value;
  if value=true then Showicon else HideIcon;
end;

procedure TSS_OS_IconClass.Showicon;
begin
  Iconimage.show;
  LabelTop.show;
  LabelBottom.show;
end;

end.
