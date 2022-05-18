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
    function Loadfile(OrgPath,OrgFile,DestPath,DestFile,Bezeichnung,Info1,Info2:String;FileNr,MaxFile:Word;OfflineOverride:Boolean):boolean;
    function fileExists(OrgPath,OrgFile:String;OfflineOverride:Boolean):boolean;
  end;

var
  TSS_BE_FTPForm: TTSS_BE_FTPForm;

implementation

{$R *.dfm}

uses TSS_FE_LoadScreen, TSS_FE_MainScreen, TSS_FE_DataForm;

{ TTSS_BE_FTPForm }

function TTSS_BE_FTPForm.fileExists(OrgPath, OrgFile:string;OfflineOverride:Boolean): boolean;
var DT:TDatetime;
begin
 if DataForm.OnlineRun or OfflineOverride then begin
  self.Show;
  DataForm.writeDBLog('FTP_FILE_EXISTS','FTP Dateiprüfung :'+OrgPath+OrgFile,'',9);
  MainDisplayForm.ColorPanel_2.Color:=clred;
  MainDisplayForm.ColorPanel_2.repaint;
  Setinfo('Verbinde FTP Server','Connecting .....','Schritt 1/8');
  IdFTP1.Connect;
  if IdFTP1.Connected then begin
    Setinfo('FTP Directory Check ... ','Prüfe Pfad...','Schritt 3/4');
    try
      IdFTP1.ChangeDir(OrgPath);
    except
      on e:exception do begin
        Result:=false;
        IdFTP1.Disconnect;
        self.Hide;
        MainDisplayForm.ColorPanel_2.Color:=clteal;
  MainDisplayForm.ColorPanel_2.repaint;
        exit;
      end;
    end;
    Setinfo('FTP File Check ... ','Prüfe Datei ...','Schritt 5/4');
    try
      DT:=IdFTP1.FileDate(OrgPath+'\'+OrgFile);
    except
      on e:exception do begin
        Result:=false;
        IdFTP1.Disconnect;
        self.Hide;
        MainDisplayForm.ColorPanel_2.Color:=clteal;
  MainDisplayForm.ColorPanel_2.repaint;
        Exit;;
      end;
    end;
    if dT=0 then begin
      Result:=false;
      IdFTP1.Disconnect;
      self.Hide;
      MainDisplayForm.ColorPanel_2.Color:=clteal;
      MainDisplayForm.ColorPanel_2.repaint;
      Exit;;
    end;
    Setinfo('Trenne FTP Server','Disconnecting .....','Schritt 8/8');
    IdFTP1.Disconnect;
    Result:=true;
  end else result:=false;
  self.Hide;
  MainDisplayForm.ColorPanel_2.Color:=clteal;
  MainDisplayForm.ColorPanel_2.repaint;
 end;
end;

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

function TTSS_BE_FTPForm.Loadfile(OrgPath, OrgFile, DestPath, DestFile,
  Bezeichnung, Info1, Info2: String; FileNr, MaxFile: Word;OfflineOverride:Boolean): boolean;
begin
 self.Show;
 if DataForm.OnlineRun or OfflineOverride then begin
  DataForm.writeDBLog('FTP_FILE_LOAD','FTP DateiDownload :'+OrgPath+OrgFile,'',9);
  MainDisplayForm.ColorPanel_2.Color:=clred;
  MainDisplayForm.ColorPanel_2.repaint;
  Setinfo('Verbinde FTP Server','Connecting .....','Schritt 1/8');
  try
    if not IdFTP1.Connected then IdFTP1.Connect;
  except
    on e:exception do begin
      MainDisplayForm.ColorPanel_2.Color:=clteal;
      MainDisplayForm.ColorPanel_2.repaint;
    end;
  end;
  if IdFTP1.Connected then begin
    Setinfo('FTP Transfer ... '+inttostr(FileNr)+'/'+inttostr(MaxFile),'Wechsle Pfad...','Schritt 3/4');
    try
      IdFTP1.ChangeDir(OrgPath);
    except
      on e:exception do begin
        Result:=false;
        self.Hide;
        MainDisplayForm.ColorPanel_2.Color:=clteal;
        MainDisplayForm.ColorPanel_2.repaint;
        exit;
      end;
    end;
    try
      CreateDir(DestPath);
    except
      on e:exception do begin
        Result:=false;
        self.Hide;
        MainDisplayForm.ColorPanel_2.Color:=clteal;
        MainDisplayForm.ColorPanel_2.repaint;
        exit;
      end;
    end;
    Setinfo('FTP Transfer ... '+inttostr(FileNr)+'/'+inttostr(MaxFile),'Kopiere Datei ...','Schritt 5/4');
    try
      IdFTP1.get(OrgFile,DestPath+'\'+DestFile,False);
    except
      on e:exception do begin
        Showmessage(e.Message);
        Result:=false;
        self.Hide;
        MainDisplayForm.ColorPanel_2.Color:=clteal;
        MainDisplayForm.ColorPanel_2.repaint;
        Exit;;
      end;
    end;
    Setinfo('Trenne FTP Server','Disconnecting .....','Schritt 8/8');
    if IdFTP1.Connected then IdFTP1.Disconnect;
    Result:=true;
  end else result:=false;
  self.Hide;
  MainDisplayForm.ColorPanel_2.Color:=clteal;
  MainDisplayForm.ColorPanel_2.repaint;
 end;
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
 if DataForm.OnlineRun then begin
  DataForm.writeDBLog('FTP_FILE_UPLOAD','FTP DateiUpload :'+OrgFilename+' '+Bezeichnung,'',9);
  MainDisplayForm.ColorPanel_2.Color:=clred;
  MainDisplayForm.ColorPanel_2.repaint;
  Setinfo('Verbinde FTP Server','Connecting .....','Schritt 1/8');
  IdFTP1.Connect;
  if IdFTP1.Connected then begin
    Setinfo('FTP Transfer ... '+inttostr(FileNr)+'/'+inttostr(MaxFile),'Erzeuge Pfad...','Schritt 3/8');
    try
      IdFTP1.MakeDir(DestPath);
    except
      on e:exception do begin
        MainDisplayForm.ColorPanel_2.Color:=clteal;
  MainDisplayForm.ColorPanel_2.repaint;
      end;
    end;
    Setinfo('FTP Transfer ... '+inttostr(FileNr)+'/'+inttostr(MaxFile),'Lösche alte Datei','Schritt 4/8');
    try
      IdFTP1.Delete(DestFile);
    except
      on e:exception do begin
        MainDisplayForm.ColorPanel_2.Color:=clteal;
  MainDisplayForm.ColorPanel_2.repaint;
      end;
    end;
    Setinfo('FTP Transfer ... '+inttostr(FileNr)+'/'+inttostr(MaxFile),'Kopiere Datei ...','Schritt 5/8');
    try
      IdFTP1.Put(OrgFilename,DestPath+'\'+DestFile,False);
    except
      on e:exception do begin
        MainDisplayForm.ColorPanel_2.Color:=clteal;
  MainDisplayForm.ColorPanel_2.repaint;
      end;
    end;
    Setinfo('Trenne FTP Server','Disconnecting .....','Schritt 8/8');
    IdFTP1.Disconnect;
  end;
  self.Hide;
  MainDisplayForm.ColorPanel_2.Color:=clteal;
  MainDisplayForm.ColorPanel_2.repaint;
 end;
end;

end.
