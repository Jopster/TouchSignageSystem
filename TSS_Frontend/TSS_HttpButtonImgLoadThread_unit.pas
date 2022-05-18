unit TSS_HttpButtonImgLoadThread_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls, URLMon , vcl.imaging.jpeg, System.Net.HttpClient, Wininet;

type
  THttpButtonImgLoadThread = class(TThread)
  private
    FUrl: String;
    FNewFilename: String;
    FLr:Longint;
    FDisplayIMage: TImage;
    FInfoListBox: TListbox;
    procedure SetUrl(const Value: String);
    procedure SetNewFilename(const Value: String);
    procedure SetDisplayIMage(const Value: Timage);
    procedure doDisplayImage;
    function DownloadFile(const url: string;const destinationFileName: string): boolean;
    procedure SetInfoListBox(const Value: TListbox);
    procedure SetInfook;
    procedure SetInfoFail;
    procedure SetInfo(St: String);
  public
    property Url:String read FUrl write SetUrl;
    property NewFilename:String read FNewFilename write SetNewFilename;
    property DisplayIMage:Timage read FDisplayIMage write SetDisplayIMage;
    property InfoListBox:TListbox read FInfoListBox write SetInfoListBox;
    procedure Execute; override;
  end;

implementation

function THttpButtonImgLoadThread.DownloadFile(
    const url: string;
    const destinationFileName: string): boolean;
var
  hInet: HINTERNET;
  hFile: HINTERNET;
  localFile: File;
  buffer: array[1..1024] of byte;
  bytesRead: DWORD;
begin
  result := False;
  hInet := InternetOpen(PChar(application.title),
    INTERNET_OPEN_TYPE_PRECONFIG,nil,nil,0);
  hFile := InternetOpenURL(hInet,PChar(url),nil,0,0,0);
  if Assigned(hFile) then
  begin
    AssignFile(localFile,destinationFileName);
    Rewrite(localFile,1);
    repeat
      InternetReadFile(hFile,@buffer,SizeOf(buffer),bytesRead);
      BlockWrite(localFile,buffer,bytesRead);
    until bytesRead = 0;
    CloseFile(localFile);
    result := true;
    InternetCloseHandle(hFile);
  end;
  InternetCloseHandle(hInet);
end;

procedure THttpButtonImgLoadThread.doDisplayImage;
begin
  FDisplayIMage.Picture.LoadFromFile(FNewFilename);
  FDisplayIMage.Repaint;
  FDisplayIMage.Show;
end;

procedure THttpButtonImgLoadThread.Execute;
var Hresult:longint;
begin
  while not Terminated do begin
    Sleep(1000);
    Hresult:=URLDownloadToFile(nil,PWideChar(FUrl),PWideChar(FNewFileName),0,nil);
    Flr:=Hresult;
    if Hresult=0 then begin
      synchronize(SetInfook);
      Synchronize(doDisplayImage);
    end else begin
      synchronize(SetInfoFail);
    end;
    Terminate;
  end;
end;

procedure THttpButtonImgLoadThread.SetDisplayIMage(const Value: Timage);
begin
  FDisplayIMage := Value;
end;

procedure THttpButtonImgLoadThread.SetInfo(St: String);
begin
  FInfoListBox.Items.Add(St);
  FInfoListBox.Repaint;
end;

procedure THttpButtonImgLoadThread.SetInfoFail;
begin
  Setinfo('    Download fail : ('+inttostr(Flr)+') '+SysErrorMessage(Flr));
end;

procedure THttpButtonImgLoadThread.SetInfoListBox(const Value: TListbox);
begin
  FInfoListBox := Value;
end;

procedure THttpButtonImgLoadThread.SetInfook;
begin
  Setinfo('    Download ok');
end;

procedure THttpButtonImgLoadThread.SetNewFilename(const Value: String);
begin
  FNewFilename := Value;
end;

procedure THttpButtonImgLoadThread.SetUrl(const Value: String);
begin
  FUrl := Value;
end;

end.
