unit TSS_SS_Mainform_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dsLeds, Vcl.ExtCtrls,
  IdContext, IdScheduler, IdSchedulerOfThread, IdSchedulerOfThreadDefault,jpeg,ScktComp,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer,TSS_SS_ServicePanelClass_unit,
  Vcl.Buttons;

type
  TTSS_SS_MainForm = class(TForm)
    IdTCPServer1: TIdTCPServer;
    IdSchedulerOfThreadDefault1: TIdSchedulerOfThreadDefault;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dsLed1: TdsLed;
    dsLed2: TdsLed;
    dsLed3: TdsLed;
    dsLed4: TdsLed;
    SpeedButton1: TSpeedButton;
    procedure IdTCPServer1Connect(AContext: TIdContext);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure IdTCPServer1Execute(AContext: TIdContext);
  private
    { Private-Deklarationen }
    ServerSocket1: TServerSocket;
  public
    { Public-Deklarationen }
    finished:boolean;
    D1:TTSS_ServiceScreen;
    procedure ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
  end;

var
  TSS_SS_MainForm: TTSS_SS_MainForm;

implementation

{$R *.dfm}

uses TSS_SS_DataForm_unit;

procedure TTSS_SS_MainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=Finished;
end;

procedure TTSS_SS_MainForm.FormShow(Sender: TObject);
var a:word;F:TextFile;Standort,FName,SF,S3,S2,S1:String;SSP:TTSS_ServiceScreen;
begin
  finished:=false;
  AssignFile(F,'C:\TSS\Config\TSS_SS_Init.ini');
  Reset(f);
  readln(F,SF);
  readln(F,S1);
  readln(F,S2);
  DataForm.MainPath:=copy(SF,1,pos(' ',SF)-1);
  S1:=copy(S1,1,pos(' ',S1)-1);
 S2:=copy(S2,1,pos(' ',S2)-1);
  for a := 1 to strtoint(s2) do begin
    readln(F,S3);
    S3:=copy(S3,1,pos(' ',S3)-1);
    SSP:=TTSS_ServiceScreen.Create(self);
    SSP.Parent:=TSS_SS_MainForm;
    SSP.top:=0;
    SSP.left:=(a-1)*210;
    SSP.width:=210;
    SSP.height:=210;
    SSP.image.Picture.LoadFromFile(Dataform.MainPath+'unnamed.jpg');
    SSP.ScreenID:=S3;
    D1:=SSP;
  end;
  CloseFile(f);
  IdTCPServer1.DefaultPort:=strtoint(s1);
  IdTCPServer1.Active:=true;
end;

procedure TTSS_SS_MainForm.IdTCPServer1Connect(AContext: TIdContext);
begin
  messagebeep(0);
end;

procedure TTSS_SS_MainForm.IdTCPServer1Execute(AContext: TIdContext);
var size: integer;
    ms:TMemoryStream;
begin
  try

    dsLed1.oncolor:=cllime;
    dsled1.LedOn:=true;
    ms:=TMemoryStream.Create;
    AContext.Connection.IOHandler.readStream(ms);
    ms.Position:=0;
    D1.Image.Picture.Bitmap.LoadFromStream(ms);
    D1.Image.Repaint;
  except
    on e:exception do begin
      dsLed1.oncolor:=clred;
      dsled1.LedOn:=true;
    end;
  end;
end;

procedure TTSS_SS_MainForm.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
end;

procedure TTSS_SS_MainForm.SpeedButton1Click(Sender: TObject);
begin
  finished:=true;
  Close;
end;

end.
