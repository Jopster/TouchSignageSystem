unit TSS_FE_SyncMediaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdThreadComponent,TSS_FE_SyncMediaClass;

type
  TSyncData = record
    Media_id:Longint;
    DestFile:String;
  end;

type
  TSyncMediaForm = class(TForm)
    IdThreadComponent1: TIdThreadComponent;
  private
    FTSyncMediaList:TObjectList<TSyncMedia>;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure AddSyncMedia(Id:longint;DestFile:string;TagetName:String);
  end;

var
  SyncMediaForm: TSyncMediaForm;

implementation

{$R *.dfm}

{ TSyncMediaForm }

procedure TSyncMediaForm.AddSyncMedia(Id:longint;DestFile:string;TagetName:String);
var Obj:TSyncMedia;
begin

end;

end.
