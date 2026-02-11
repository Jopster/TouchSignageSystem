unit TSS_FE_Runner_Helpform_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, dsLeds,
  EZTexturePanel, Vcl.Buttons, JPP.BasicPngButtonEx, Vcl.Grids, Vcl.Outline,
  ES.BaseControls, ES.Layouts, EsLabel;

type
  THelpform = class(TForm)
    Label17: TLabel;
    JppBasicPngButtonEx3: TJppBasicPngButtonEx;
    Panel11: TPanel;
    GestureLed: TdsLed;
    Label22: TLabel;
    dsLed20: TdsLed;
    dsLed22: TdsLed;
    dsLed23: TdsLed;
    dsLed25: TdsLed;
    dsLed26: TdsLed;
    EsPanel1: TEsPanel;
    dsLed5: TdsLed;
    dsLed6: TdsLed;
    dsLed7: TdsLed;
    EsLabel1: TEsLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EsPanel2: TEsPanel;
    dsLed8: TdsLed;
    dsLed9: TdsLed;
    dsLed10: TdsLed;
    EsLabel2: TEsLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dsLed1: TdsLed;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EsPanel3: TEsPanel;
    dsLed2: TdsLed;
    dsLed3: TdsLed;
    dsLed4: TdsLed;
    EsLabel3: TEsLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dsLed11: TdsLed;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EsPanel4: TEsPanel;
    dsLed13: TdsLed;
    dsLed17: TdsLed;
    EsLabel4: TEsLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    EsPanel5: TEsPanel;
    dsLed12: TdsLed;
    dsLed18: TdsLed;
    EsLabel5: TEsLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    EsPanel6: TEsPanel;
    EsLabel6: TEsLabel;
    dsLed14: TdsLed;
    dsLed15: TdsLed;
    Label29: TLabel;
    Label30: TLabel;
    EsPanel7: TEsPanel;
    dsLed16: TdsLed;
    dsLed19: TdsLed;
    EsLabel7: TEsLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    dsLed21: TdsLed;
    dsLed24: TdsLed;
    Label34: TLabel;
    Label35: TLabel;
    EsPanel8: TEsPanel;
    dsLed27: TdsLed;
    dsLed28: TdsLed;
    dsLed29: TdsLed;
    EsLabel8: TEsLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    dsLed30: TdsLed;
    Label39: TLabel;
    Label40: TLabel;
    dsLed31: TdsLed;
    Label41: TLabel;
    dsLed32: TdsLed;
    Label42: TLabel;
    dsLed33: TdsLed;
    Label43: TLabel;
    Label44: TLabel;
    EsPanel9: TEsPanel;
    dsLed34: TdsLed;
    dsLed35: TdsLed;
    EsLabel9: TEsLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    EsPanel10: TEsPanel;
    dsLed36: TdsLed;
    dsLed37: TdsLed;
    EsLabel10: TEsLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    dsLed38: TdsLed;
    procedure JppBasicPngButtonEx3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Helpform: THelpform;

implementation

{$R *.dfm}

procedure THelpform.JppBasicPngButtonEx3Click(Sender: TObject);
begin
  self.close;
end;

end.
