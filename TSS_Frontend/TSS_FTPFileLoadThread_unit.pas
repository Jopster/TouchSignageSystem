unit TSS_FTPFileLoadThread_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  URLMon , vcl.imaging.jpeg, System.Net.HttpClient, Wininet,IdFTP;

type
  TFTPThread = class(TThread)
  private
    FFilename: string;
    FSavepath: string;
    FServerHost: string;
    FFtp:TIdFTP;
    FServerPath: string;
    procedure AddfileName;
    procedure SetFilename(const Value: string);
    procedure SetSavepath(const Value: string);
    procedure SetServerHost(const Value: string);
    procedure SetServerPath(const Value: string);
  protected
    procedure Execute; override;
  public
    property Filename:string read FFilename write SetFilename;
    property Savepath:string read FSavepath write SetSavepath;
    property ServerHost:string read FServerHost write SetServerHost;
    property ServerPath:string read FServerPath write SetServerPath;
    constructor Create(Filename:string);
  end;

implementation

uses TSS_FE_MainScreen;
{ TFTPThread }

procedure TFTPThread.AddfileName;
begin
  MaindisplayForm.ReqFiles.Items.Add(FFilename);
end;

constructor TFTPThread.Create(Filename: string);
begin
  FFilename:=Filename;
  Synchronize(AddfileName);
end;

procedure TFTPThread.Execute;
var
  ftpDownStream: TFileStream;
  myftp: TIdFTP;
begin
  ftpDownStream:= TFileStream.create(Savepath+FFilename, fmCreate);
  FFtp:= TIdFTP.create(nil);
  try
    FFtp.Host:=FServerHost;
    FFtp.Port:=21;
    FFtp.Username:='LoguMediaContentFTPU';
    FFtp.Password:='LM2020#ContentFTP';
    FFtp.Connect;
    FFtp.Passive:= true;
    //myftp.filestructure
    FFtp.ChangeDir(FServerPath);
    //download
    FFtp.Get(Filename, ftpDownStream, false);
  finally
    ftpDownStream.Free;
    Fftp.Quit;
    Fftp.Free;
  end;
end;

procedure TFTPThread.SetFilename(const Value: string);
begin
  FFilename := Value;
end;

procedure TFTPThread.SetSavepath(const Value: string);
begin
  FSavepath := Value;
end;

procedure TFTPThread.SetServerHost(const Value: string);
begin
  FServerHost := Value;
end;

procedure TFTPThread.SetServerPath(const Value: string);
begin
  FServerpath := Value;
end;

end.
