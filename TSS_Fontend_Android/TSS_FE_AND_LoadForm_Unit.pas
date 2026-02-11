unit TSS_FE_AND_LoadForm_Unit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,System.IniFiles,TSS_FE_AND_MainForm_Unit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,TSS_FE_AND_DataUnit,TSS_FE_AND_ButtonClass_Unit;

type
  TLoadForm = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    Image2: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    MainDataCollector:TDataCollector;
    MyMainForm:TMainForm;
  end;

var
  LoadForm: TLoadForm;

implementation

{$R *.fmx}

procedure TLoadForm.Timer1Timer(Sender: TObject);
var ini:Tinifile;a:word;btn:TTSS_Button;Filename:string;Bmp:TBitmap;Filen:string;
begin
  Timer1.Enabled:=false;
  begin
    ini:=Tinifile.Create('/sdcard/TSS/WebTemp/Config/TSS_FE_Init.ini');
    MainDataCollector.Schemaid:=Ini.ReadString('Common','SchematicID','');
    ini.Free;
    ini:=Tinifile.Create('/sdcard/TSS/WebTemp/SchemaTemp/'+MainDataCollector.Schemaid+'.DSCH');
    MainDataCollector.ButtonCount:=ini.ReadInteger('Common','Buttons',0);
    LoadForm.ProgressBar1.max:=MainDataCollector.ButtonCount;
    Label2.text:=inttostr(MainDataCollector.ButtonCount)+' Button werden geladen';
    Label2.Repaint;
    for a := 1 to MainDataCollector.ButtonCount do begin
      LoadForm.ProgressBar1.Value:=a;
      LoadForm.ProgressBar1.Repaint;
      btn:=TTSS_Button.Create(MyMainForm);
      Filename:='/sdcard/TSS/WebTemp/SchemaTemp/'+Ini.ReadString('Common','Button'+inttostR(a),'')+'.BDTA';
      btn.LoadButton(Filename);
      btn.LoadButtonImage(btn.ConvertPathToAndroid(btn.ButtonimgFilename));
      bmp:=TBitmap.create;
      Filen:=btn.ConvertPathToAndroid(btn.ButtonimgFilename);
      try
        bmp.LoadFromFile(Filen);
        image2.bitmap.SetSize(bmp.Width,bmp.Height);
        image2.bitmap.assign(bmp);
        image2.MultiResBitmap.Assign(image1.MultiResBitmap);
      finally
        bmp.free;
      end;
      btn.DisplayButton;
      Label3.text:='Lade Button '+inttostr(a)+' '+btn.Buttonid;
      LoadForm.Invalidate;
      MainDataCollector.ButtonList.add(btn);
    end;
    ini.Free;
    self.close;
    MyMainForm.Invalidate;
  end;
end;

end.
