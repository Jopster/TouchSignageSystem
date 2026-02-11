unit TSS_BE_FTPForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP;

type
  TTSS_BE_FTPForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    IdFTP1: TIdFTP;
    procedure IdFTP1Connected(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  private
    { Private-Deklarationen }
    procedure Setinfo(Bezeichnung,Info1,Info2:string);
  public
    { Public-Deklarationen }
    function Transferfile(OrgFilename,DestPath,DestFile,Bezeichnung,Info1,Info2:String;FileNr,MaxFile:Word):boolean;
  end;

var
  TSS_BE_FTPForm: TTSS_BE_FTPForm;

implementation

{$R *.dfm}

{ TTSS_BE_FTPForm }

procedure TTSS_BE_FTPForm.IdFTP1Connected(Sender: TObject);
begin
  Setinfo('Verbinde FTP Server','Verbunden .... ','Schritt 2/8');
end;

procedure TTSS_BE_FTPForm.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  ProgressBar1.Position:=AWorkCount;
  ProgressBar1.Repaint;
end;

procedure TTSS_BE_FTPForm.IdFTP1WorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  ProgressBar1.Max:=AWorkCountMax;
end;

procedure TTSS_BE_FTPForm.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar1.Position:=0;
end;

procedure TTSS_BE_FTPForm.Setinfo(Bezeichnung, Info1, Info2: string);
begin
  Label1.Caption:=Bezeichnung;
  Label2.Caption:=Info1;
  Label3.Caption:=Info2;
  Label1.Repaint;
  Label2.Repaint;
  Label3.Repaint;
end;

function TTSS_BE_FTPForm.Transferfile(OrgFilename, DestPath, DestFile,
  Bezeichnung, Info1, Info2: String;FileNr,MaxFile:Word): boolean;
begin
  self.Show;
  Setinfo('Verbinde FTP Server','Connecting .....','Schritt 1/8');
  IdFTP1.Connect;
  if IdFTP1.Connected then begin
    Setinfo('FTP Transfer ... '+inttostr(FileNr)+'/'+inttostr(MaxFile),'Erzeuge Pfad...','Schritt 3/8');
    try
      IdFTP1.MakeDir(DestPath);
    except
      on e:exception do begin

      end;
    end;
    Setinfo('FTP Transfer ... '+inttostr(FileNr)+'/'+inttostr(MaxFile),'Lösche alte Datei','Schritt 4/8');
    try
      IdFTP1.Delete(DestFile);
    except
      on e:exception do begin
      end;
    end;
    Setinfo('FTP Transfer ... '+inttostr(FileNr)+'/'+inttostr(MaxFile),'Kopiere Datei ...','Schritt 5/8');
    try
      IdFTP1.Put(OrgFilename,DestPath+'\'+DestFile,False);
    except
      on e:exception do begin
      end;
    end;
    Setinfo('Trenne FTP Server','Disconnecting .....','Schritt 8/8');
    IdFTP1.Disconnect;
  end;
  self.Hide;
end;

end.
