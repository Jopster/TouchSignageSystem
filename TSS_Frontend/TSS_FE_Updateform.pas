unit TSS_FE_Updateform;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dsLeds, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TUpdateForm = class(TForm)
    Label1: TLabel;
    dsLed1: TdsLed;
    Label2: TLabel;
    dsLed2: TdsLed;
    Label3: TLabel;
    dsLed3: TdsLed;
    Animate1: TAnimate;
    Panel1: TPanel;
    ErrLAbel: TLabel;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure BeginUpdate(Drive:String);
  end;

var
  UpdateForm: TUpdateForm;

implementation

{$R *.dfm}

uses TSS_FE_Dataform,ShellApi;

function CopyDir(const fromDir, toDir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_COPY;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure TUpdateForm.BeginUpdate(Drive:String);
var a:worD;UPdID,OrgP,DestP:String;f:textfile;
begin
  if fileexistS(Drive+':\TSS\WebTemp\SchemaTemp\'+Dataform.DisplayID+'.DSCH') then Begin
    Dsled1.LedOn:=true;
    dsLed1.Repaint;
    assignfile(f,Drive+':\TSSFE_Update.UPD');
    reset(f);
    readln(f,UPdID);
    closefile(f);
    if UPdID<>DataForm.Update_id then begin
      OrgP:=DataForm.MainPath;
      delete(OrgP,length(OrgP),1);
      DestP:=OrgP+'_UPD';
      if CreateDir(DesTP) then begin
        Dsled2.LedOn:=True;
        dsLed2.Repaint;
        Animate1.Active:=true;
        timer1.Enabled:=true;
        ErrLAbel.Caption:='Kopiere bitte warten !';
        ErrLAbel.Repaint;
        if copyDir(Drive+':\TSS\WebTemp\',DesTP) then begin
          Dsled3.LedOn:=True;
          dsLed3.Repaint;
          CopyFile(pchar(Drive+':\TSSFE_Update.UPD'),Pchar(DesTP+'\TSSFE_Update.UPD'),false);
        End else begin
          Dsled3.LedOn:=false;
          dsLed3.Repaint;
        end;
        ErrLAbel.Caption:='';
        ErrLAbel.Repaint;
        timer1.Enabled:=False;
        Animate1.Active:=false;
      End else begin
        Dsled2.LedOn:=false;
        dsLed2.Repaint;
      end;
    End else begin
      ErrLAbel.Caption:='Update bereits eingespielt !';
      ErrLAbel.Repaint;
    end;
  End else begin
    Dsled1.LedOn:=false;
    dsLed1.Repaint;
  end;
  UpdateForm.Repaint;
  sleep(2000);
end;

procedure TUpdateForm.Timer1Timer(Sender: TObject);
begin
  Animate1.Repaint;
end;

end.
