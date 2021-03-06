unit TSS_SS_ServicePanelClass_unit;


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,Vcl.StdCtrls,jpeg;

type
  TTSS_ServiceScreen = class(TControl)
    constructor Create(AOwner : TComponent); override;
  private
    BGPanel: TPanel;
    BGImage: TImage;
    FLeft: Integer;
    Ftop: Integer;
    FWidth: integer;
    FHeight: integer;
    FBGColor: TColor;
    FName: String;
    FParent: TWincontrol;
    FScreenID: String;
    procedure SetFLeft(const Value: Integer);
    procedure SetFtop(const Value: Integer);
    procedure SetFWidth(const Value: integer);
    procedure SetFHeight(const Value: integer);
    procedure SetFBGColor(const Value: TColor);
    procedure SetFName(const Value: String);
    procedure SetFParent(const Value: TWincontrol);
    procedure SetScreenID(const Value: String);
  published
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Property Image:Timage read BGIMage;
    Property left:Integer read FLeft Write SetFLeft;
    Property top:Integer read Ftop Write SetFtop;
    property width:integer read FWidth Write SetFWidth;
    property height:integer read FHeight Write SetFHeight;
    property BGColor:TColor read FBGColor write SetFBGColor;
    property Name:String read FName write SetFName;
    property Parent:TWincontrol read FParent Write SetFParent;
    property ScreenID:String read FScreenID write SetScreenID;
  end;

implementation

{ TTSS_ServiceScreen }

constructor TTSS_ServiceScreen.Create(AOwner: TComponent);
begin
  inherited;
  BGPanel:=TPanel.Create(AOwner);
  BGPanel.Parent:=TWinControl(self);
  BGPanel.BevelInner:=bvLowered;
  BGPanel.ParentBackground:=false;
  BGImage:=Timage.Create(AOwner);
  BGImage.Parent:=BGPanel;
  BGImage.Height:=108;
  BGImage.Width:=192;
  BGImage.Top:=30;
  BGImage.Stretch:=true;
end;

procedure TTSS_ServiceScreen.SetFBGColor(const Value: TColor);
begin
  FBGColor:=value;
  BGPanel.Color:=Value;
end;

procedure TTSS_ServiceScreen.SetFHeight(const Value: integer);
begin
  FHeight:=Value;
  BGPanel.Height:=Value;
end;

procedure TTSS_ServiceScreen.SetFLeft(const Value: Integer);
begin
  FLeft:=Value;
  BGPanel.Left:=Value;
end;

procedure TTSS_ServiceScreen.SetFName(const Value: String);
begin
  FName:=Value;
  BGPanel.Name:=Value+'_BGP';
  BGImage.Name:=Value+'_BGI';
end;

procedure TTSS_ServiceScreen.SetFParent(const Value: TWincontrol);
begin
  FParent:=Value;
  BGPanel.Parent:=Value;
end;

procedure TTSS_ServiceScreen.SetFtop(const Value: Integer);
begin
  Ftop:=Value;
  BGPanel.Top:=value;
end;

procedure TTSS_ServiceScreen.SetFWidth(const Value: integer);
begin
  FWidth:=Value;
  BGPanel.Width:=value;
  BGImage.Left:=(Value-BGImage.Width) div 2;
end;

procedure TTSS_ServiceScreen.SetScreenID(const Value: String);
begin
  FScreenID := Value;
end;

end.
