unit TSS_FE_AND_MainForm_Unit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,contnrs,
  FMX.Controls.Presentation, FMX.StdCtrls,FMX.DialogService, FMX.Objects,TSS_FE_AND_DataUnit;

type
  TMainForm = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    MainDataCollector:TDataCollector;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses TSS_FE_AND_LoadForm_Unit;

procedure TMainForm.Button1Click(Sender: TObject);
var DS:TDialogService;
begin
  DS:=TDialogService.Create;
  Ds.ShowMessage('Hello World');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  MainDataCollector:=TDataCollector.create;
  MainDataCollector.ButtonList:=TObjectList.create;
end;

procedure TMainForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  Begin
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled:=false;
  LoadForm.MainDataCollector:=MainDataCollector;
  LoadForm.MyMainForm:=self;
  LoadForm.show;
  LoadForm.Timer1.Enabled:=true;
end;

end.
