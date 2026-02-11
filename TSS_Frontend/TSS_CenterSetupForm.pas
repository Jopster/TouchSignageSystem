unit TSS_CenterSetupForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask;

type
  TCenterSetupForm = class(TForm)
    LabeledEdit1: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    LabeledEdit2: TLabeledEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    LabeledEdit3: TLabeledEdit;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    LabeledEdit4: TLabeledEdit;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    LabeledEdit5: TLabeledEdit;
    SpeedButton11: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  CenterSetupForm: TCenterSetupForm;

implementation

{$R *.dfm}

uses TSS_FE_DataForm;

procedure TCenterSetupForm.Button1Click(Sender: TObject);
var fn:string;
begin
  if LabeledEdit1.Text<>'' then begin
    fn:=dataform.MainPath+'Schematemp\'+dataform.PopupButton.Buttonid+'\'+ExtractFileName(LabeledEdit1.Text);
    CopyFile(pchar(LabeledEdit1.Text),pchar(fn),False);
    LabeledEdit1.Text:=fn;
  end;
  if LabeledEdit2.Text<>'' then begin
    fn:=dataform.MainPath+'Schematemp\'+dataform.PopupButton.Buttonid+'\'+ExtractFileName(LabeledEdit2.Text);
    CopyFile(pchar(LabeledEdit2.Text),pchar(fn),False);
    LabeledEdit2.Text:=fn;
  end;
  if LabeledEdit3.Text<>'' then begin
    fn:=dataform.MainPath+'Schematemp\'+dataform.PopupButton.Buttonid+'\'+ExtractFileName(LabeledEdit3.Text);
    CopyFile(pchar(LabeledEdit3.Text),pchar(fn),False);
    LabeledEdit3.Text:=fn;
  end;
  if LabeledEdit4.Text<>'' then begin
    fn:=dataform.MainPath+'Schematemp\'+dataform.PopupButton.Buttonid+'\'+ExtractFileName(LabeledEdit4.Text);
    CopyFile(pchar(LabeledEdit4.Text),pchar(fn),False);
    LabeledEdit4.Text:=fn;
  end;
  if LabeledEdit5.Text<>'' then begin
    fn:=dataform.MainPath+'Schematemp\'+dataform.PopupButton.Buttonid+'\'+ExtractFileName(LabeledEdit5.Text);
    CopyFile(pchar(LabeledEdit5.Text),pchar(fn),False);
    LabeledEdit5.Text:=fn;
  end;
  dataform.PopupButton.CenterVideo1File:=LabeledEdit1.Text;
  dataform.PopupButton.CenterVideo2File:=LabeledEdit2.Text;
  dataform.PopupButton.CenterVideo3File:=LabeledEdit3.Text;
  dataform.PopupButton.CenterVideo4File:=LabeledEdit4.Text;
  dataform.PopupButton.ClickPlayListFileName:=LabeledEdit5.Text;
  dataform.PopupButton.ClickPlayListZuordnung:='1';
  DataForm.SomeEdited:=true;
  self.close;
end;

procedure TCenterSetupForm.Button2Click(Sender: TObject);
begin
  self.close;
end;

procedure TCenterSetupForm.FormShow(Sender: TObject);
begin
  LabeledEdit1.Text:=dataform.PopupButton.CenterVideo1File;
  LabeledEdit2.Text:=dataform.PopupButton.CenterVideo2File;
  LabeledEdit3.Text:=dataform.PopupButton.CenterVideo3File;
  LabeledEdit4.Text:=dataform.PopupButton.CenterVideo4File;
  LabeledEdit5.Text:=dataform.PopupButton.ClickPlayListFileName;
end;

procedure TCenterSetupForm.SpeedButton10Click(Sender: TObject);
begin
 if OpenDialog1.Execute then LabeledEdit5.Text:=OpenDialog1.FileName;
end;

procedure TCenterSetupForm.SpeedButton1Click(Sender: TObject);
begin
  LabeledEdit1.Text:='';
end;

procedure TCenterSetupForm.SpeedButton2Click(Sender: TObject);
begin
 if OpenDialog1.Execute then LabeledEdit1.Text:=OpenDialog1.FileName;
end;

procedure TCenterSetupForm.SpeedButton3Click(Sender: TObject);
begin
  LabeledEdit2.Text:='';
end;

procedure TCenterSetupForm.SpeedButton4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then LabeledEdit2.Text:=OpenDialog1.FileName;
end;

procedure TCenterSetupForm.SpeedButton5Click(Sender: TObject);
begin
  LabeledEdit3.Text:='';
end;

procedure TCenterSetupForm.SpeedButton6Click(Sender: TObject);
begin
  if OpenDialog1.Execute then LabeledEdit3.Text:=OpenDialog1.FileName;
end;

procedure TCenterSetupForm.SpeedButton7Click(Sender: TObject);
begin
  LabeledEdit4.Text:='';
end;

procedure TCenterSetupForm.SpeedButton8Click(Sender: TObject);
begin
  if OpenDialog1.Execute then LabeledEdit4.Text:=OpenDialog1.FileName;
end;

procedure TCenterSetupForm.SpeedButton9Click(Sender: TObject);
begin
  LabeledEdit5.texT:='';
end;

end.
