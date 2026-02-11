unit TSS_FE_XpertButtonSetupForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, ES.BaseControls, ES.Switch, Vcl.Mask;

type
  TXpertButtonSetupForm = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    LabeledEdit5: TLabeledEdit;
    OpenDialog1: TOpenDialog;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    LabeledEdit10: TLabeledEdit;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    Shape3: TShape;
    EsSwitch1: TEsSwitch;
    Label1: TLabel;
    EsSwitch2: TEsSwitch;
    Label2: TLabel;
    Label3: TLabel;
    EsSwitch3: TEsSwitch;
    ComboBoxEx1: TComboBoxEx;
    Label4: TLabel;
    LabeledEdit15: TLabeledEdit;
    EsSwitch4: TEsSwitch;
    Label5: TLabel;
    EsSwitch5: TEsSwitch;
    Label6: TLabel;
    EsSwitch6: TEsSwitch;
    Label7: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  XpertButtonSetupForm: TXpertButtonSetupForm;

implementation

{$R *.dfm}

uses TSS_FE_DataForm, TSS_FE_MainScreen;

procedure TXpertButtonSetupForm.Button1Click(Sender: TObject);
begin
  DataForm.PopupButton.width:=strtoint(LabeledEdit8.Text);
  DataForm.PopupButton.height:=strtoint(LabeledEdit9.Text);
  DataForm.PopupButton.left:=strtoint(LabeledEdit6.Text);
  DataForm.PopupButton.top:=strtoint(LabeledEdit7.Text);
  DataForm.PopupButton.visible:=EsSwitch1.Checked;
  DataForm.PopupButton.Enabled:=EsSwitch2.Checked;
  DataForm.PopupButton.ButtonimgFilename:=LabeledEdit10.Text;
  DataForm.PopupButton.TextZeile1_Text_V:=EsSwitch3.Checked;
  DataForm.PopupButton.KundenName:=LabeledEdit11.text;
  DataForm.PopupButton.TextZeile2_Text_V:=EsSwitch4.Checked;
  DataForm.PopupButton.KundenName2:=LabeledEdit12.text;
  DataForm.PopupButton.TextZeile3_Text_V:=EsSwitch5.Checked;
  DataForm.PopupButton.KundenStrasse:=LabeledEdit13.text;
  DataForm.PopupButton.TextZeile4_Text_V:=EsSwitch6.Checked;
  DataForm.PopupButton.KundenPLZOrt:=LabeledEdit14.text;
end;

procedure TXpertButtonSetupForm.SpeedButton1Click(Sender: TObject);
begin
 LabeledEdit1.Text:='';
end;

procedure TXpertButtonSetupForm.SpeedButton2Click(Sender: TObject);
begin
 if OpenDialog1.Execute then LabeledEdit1.Text:=OpenDialog1.FileName;
end;

procedure TXpertButtonSetupForm.SpeedButton3Click(Sender: TObject);
begin
  LabeledEdit2.Text:='';
end;

procedure TXpertButtonSetupForm.SpeedButton4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then LabeledEdit2.Text:=OpenDialog1.FileName;
end;

procedure TXpertButtonSetupForm.SpeedButton5Click(Sender: TObject);
begin
  LabeledEdit3.Text:='';
end;

procedure TXpertButtonSetupForm.SpeedButton6Click(Sender: TObject);
begin
  if OpenDialog1.Execute then LabeledEdit3.Text:=OpenDialog1.FileName;
end;

procedure TXpertButtonSetupForm.SpeedButton7Click(Sender: TObject);
begin
  LabeledEdit4.Text:='';
end;

procedure TXpertButtonSetupForm.SpeedButton8Click(Sender: TObject);
begin
  if OpenDialog1.Execute then LabeledEdit4.Text:=OpenDialog1.FileName;
end;

procedure TXpertButtonSetupForm.SpeedButton9Click(Sender: TObject);
begin
  LabeledEdit5.Text:='';
end;

end.
