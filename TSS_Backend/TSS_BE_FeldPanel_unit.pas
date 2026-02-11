unit TSS_BE_FeldPanel_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.StdCtrls,vcl.imaging.jpeg;

Type TFeldpanel = class(TPanel)
    constructor Create(AOwner : TComponent); override;
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    BgImage:Timage;
    FFeldStatus: integer;
    FDBFeldID: integer;
    FDataChanged: Boolean;
    FKundenid: integer;
    FBGImageid: integer;
    FBGImageFilename: String;
    FUUID: string;
    FFeldtype: integer;
    FRemoveFields: string;
    FCenterPlaylistUUID: string;
    FButtonActive: boolean;
    FButtonInAction: word;
    FButtonAction: word;
    FButtonAction_VideoID: word;
    FButtonAction_Video_PlaylistID: string;
    FButtonAction_Gallerie_ID: string;
    procedure SetFFeldStatus(const Value: integer);
    procedure SetFDBFeldID(const Value: integer);
    procedure SetDataChanged(const Value: Boolean);
    procedure SetKundenid(const Value: integer);
    procedure SetBGImageid(const Value: integer);
    procedure SetBGImageFilename(const Value: String);
    procedure SetUUID(const Value: string);
    procedure SetFeldtype(const Value: integer);
    procedure SetRemoveFields(const Value: string);
    procedure SetCenterPlaylistUUID(const Value: string);
    procedure SetButtonActive(const Value: boolean);
    procedure SetButtonAction(const Value: word);
    procedure SetButtonInAction(const Value: word);
    procedure SetButtonAction_VideoID(const Value: word);
    procedure SetButtonAction_Video_PlaylistID(const Value: string);
    procedure SetButtonAction_Gallerie_ID(const Value: string);
  public
    property FeldStatus:integer read FFeldStatus Write SetFFeldStatus;
    property Feldtype:integer read FFeldtype write SetFeldtype;
    property DBFeldid:integer read FDBFeldID Write SetFDBFeldID;
    property Kundenid:integer read FKundenid write SetKundenid;
    property DataChanged:Boolean read FDataChanged write SetDataChanged;
    property BGImageid:integer read FBGImageid write SetBGImageid;
    property BGImageFilename:String read FBGImageFilename write SetBGImageFilename;
    property RemoveFields:string read FRemoveFields write SetRemoveFields;
    property UUID:string read FUUID write SetUUID;
    property ButtonActive:boolean read FButtonActive write SetButtonActive;
    property ButtonInAction:word read FButtonInAction write SetButtonInAction;
    property ButtonAction:word read FButtonAction write SetButtonAction;
    property ButtonAction_VideoID:word read FButtonAction_VideoID write SetButtonAction_VideoID;
    property ButtonAction_Video_PlaylistID:string read FButtonAction_Video_PlaylistID write SetButtonAction_Video_PlaylistID;
    property ButtonAction_Gallerie_ID:string read FButtonAction_Gallerie_ID write SetButtonAction_Gallerie_ID;
    property CenterPlaylistUUID:string read FCenterPlaylistUUID write SetCenterPlaylistUUID;
    procedure SetImage(Filename: string);
  end;


implementation


{ TFelpanel }

constructor TFeldpanel.Create(AOwner: TComponent);
begin
  inherited;
  BgImage:=Timage.Create(self);
  BgImage.Parent:=self;
  BgImage.Align:=alClient;
  BGimage.OnMouseDown:=MouseDown;
  BGimage.Stretch:=true;
end;

procedure TFeldpanel.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  try
    if sender<>nil then self.OnMouseDown(TImage(sender).Parent,button,shift,x,y);
  finally

  end;
end;

procedure TFeldpanel.SetBGImageid(const Value: integer);
begin
  FBGImageid := Value;
end;

procedure TFeldpanel.SetButtonAction(const Value: word);
begin
  FButtonAction := Value;
end;

procedure TFeldpanel.SetButtonAction_Gallerie_ID(const Value: string);
begin
  FButtonAction_Gallerie_ID := Value;
end;

procedure TFeldpanel.SetButtonAction_VideoID(const Value: word);
begin
  FButtonAction_VideoID := Value;
end;

procedure TFeldpanel.SetButtonAction_Video_PlaylistID(const Value: string);
begin
  FButtonAction_Video_PlaylistID := Value;
end;

procedure TFeldpanel.SetButtonActive(const Value: boolean);
begin
  FButtonActive := Value;
end;

procedure TFeldpanel.SetButtonInAction(const Value: word);
begin
  FButtonInAction := Value;
end;

procedure TFeldpanel.SetCenterPlaylistUUID(const Value: string);
begin
  FCenterPlaylistUUID := Value;
end;

procedure TFeldpanel.SetDataChanged(const Value: Boolean);
begin
  FDataChanged := Value;
end;

procedure TFeldpanel.SetFDBFeldID(const Value: integer);
begin
  FDBFeldID := Value;
end;

procedure TFeldpanel.SetFeldtype(const Value: integer);
begin
  FFeldtype := Value;
end;

procedure TFeldpanel.SetFFeldStatus(const Value: integer);
begin
  FFeldStatus := Value;
end;

procedure TFeldpanel.SetBGImageFilename(const Value: String);
begin
  FBGImageFilename := Value;
end;

procedure TFeldpanel.SetImage(Filename: string);
begin
  BgImage.Picture.LoadFromFile(Filename);
end;

procedure TFeldpanel.SetKundenid(const Value: integer);
begin
  FKundenid := Value;
end;

procedure TFeldpanel.SetRemoveFields(const Value: string);
begin
  FRemoveFields := Value;
end;

procedure TFeldpanel.SetUUID(const Value: string);
begin
  FUUID := Value;
end;

end.
