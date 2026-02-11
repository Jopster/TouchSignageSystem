unit TSS_BE_VideoSearchForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.ExtCtrls,
  Vcl.MPlayer, Vcl.Buttons, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.OleCtrls, WMPLib_TLB;

type
  TVideoSearchForm = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    TSS_BE_VideoMedien: TFDQuery;
    DataSource5: TDataSource;
    SpeedButton18: TSpeedButton;
    SpeedButton10: TSpeedButton;
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    selectedfileid:integer;
  end;

var
  VideoSearchForm: TVideoSearchForm;

implementation

{$R *.dfm}

uses TSS_BE_DataForm_unit;

procedure TVideoSearchForm.SpeedButton10Click(Sender: TObject);
begin
  selectedfileid:=0;
  close;
end;

procedure TVideoSearchForm.SpeedButton18Click(Sender: TObject);
begin
  WindowsMediaPlayer1.URL:='C:\TSS\WebTemp\'+TSS_BE_DataForm.Global_Schematic_id+'\'+DBLookupComboBox1.Text;
end;

procedure TVideoSearchForm.SpeedButton1Click(Sender: TObject);
begin
  selectedfileid:=DBLookupComboBox1.KeyValue;
  close;
end;

end.
