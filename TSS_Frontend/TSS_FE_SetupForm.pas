unit TSS_FE_SetupForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonGroup, Vcl.ComCtrls,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,TSS_FE_DataForm, Vcl.Buttons, Vcl.StdCtrls;

type
  TSetupForm = class(TForm)
    ButtonGroup1: TButtonGroup;
    PageControl1: TPageControl;
    AllgemeinSetup: TTabSheet;
    TabSheet1: TTabSheet;
    DBLookupComboBox1: TDBLookupComboBox;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBListBox1: TDBListBox;
    FDQuery1: TFDQuery;
    DataSource2: TDataSource;
    SpeedButton3: TSpeedButton;
    Edit1: TEdit;
    SpeedButton4: TSpeedButton;
    procedure ButtonGroup1Items1Click(Sender: TObject);
    procedure ButtonGroup1Items0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  SetupForm: TSetupForm;

implementation

{$R *.dfm}

procedure TSetupForm.ButtonGroup1Items0Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
end;

procedure TSetupForm.ButtonGroup1Items1Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=1;
end;

procedure TSetupForm.FormShow(Sender: TObject);
begin
  FDTable1.Active:=true;
  DBListBox1.Refresh;
end;

procedure TSetupForm.SpeedButton3Click(Sender: TObject);
begin
  showmessage(FDTable1.FieldByName('displayname').AsString);
end;

end.
