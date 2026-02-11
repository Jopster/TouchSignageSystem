unit TSS_FE_Runner_Settingsform_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ES.BaseControls, ES.Switch,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, JPP.BasicPngButtonEx,
  Vcl.Imaging.pngimage, dsLeds, EZTexturePanel, Vcl.Mask;

type
  TTSS_FE_Runner_Settingsform = class(TForm)
    Label23: TLabel;
    Panel12: TPanel;
    dsLed17: TdsLed;
    dsLed18: TdsLed;
    dsLed19: TdsLed;
    Image13: TImage;
    ScrollBox1: TScrollBox;
    JppBasicPngButtonEx1: TJppBasicPngButtonEx;
    JppBasicPngButtonEx2: TJppBasicPngButtonEx;
    JppBasicPngButtonEx3: TJppBasicPngButtonEx;
    JppBasicPngButtonEx4: TJppBasicPngButtonEx;
    Notebook1: TNotebook;
    Panel13: TPanel;
    Panel15: TPanel;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    settings_rundetect_posx: TLabeledEdit;
    settings_rundetect_posy: TLabeledEdit;
    settings_rundetect_maxfail: TLabeledEdit;
    settings_rundetect_doReboot: TEsSwitch;
    GroupBox6: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    EsSwitch1: TEsSwitch;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    Panel14: TPanel;
    procedure JppBasicPngButtonEx1Click(Sender: TObject);
    procedure JppBasicPngButtonEx2Click(Sender: TObject);
    procedure JppBasicPngButtonEx3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TSS_FE_Runner_Settingsform: TTSS_FE_Runner_Settingsform;

implementation

{$R *.dfm}

procedure TTSS_FE_Runner_Settingsform.JppBasicPngButtonEx1Click(
  Sender: TObject);
begin
  Notebook1.PageIndex:=0;
  Notebook1.Repaint;

end;



procedure TTSS_FE_Runner_Settingsform.JppBasicPngButtonEx2Click(
  Sender: TObject);
begin
  Notebook1.PageIndex:=1;
  Notebook1.Repaint;
end;

procedure TTSS_FE_Runner_Settingsform.JppBasicPngButtonEx3Click(
  Sender: TObject);
begin
  TSS_FE_Runner_Settingsform.close;
end;

end.
