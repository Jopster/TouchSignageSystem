unit TSS_BE_GallerieAddForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Buttons, Vcl.DBCtrls,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TGallerieAddForm = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TSS_BE_Kunden: TFDTable;
    TSS_BE_Kunden_Source: TDataSource;
    DBLookupComboBox3: TDBLookupComboBox;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  GallerieAddForm: TGallerieAddForm;

implementation

{$R *.dfm}

uses TSS_BE_DataForm_unit;

procedure TGallerieAddForm.FormShow(Sender: TObject);
begin
  Label2.Visible:=not RadioButton1.Checked;
  SpeedButton2.Visible:=not RadioButton1.Checked;
  DBLookupComboBox3.Visible:=not RadioButton1.Checked;
end;

procedure TGallerieAddForm.RadioButton1Click(Sender: TObject);
begin
  Label2.Visible:=not RadioButton1.Checked;
  SpeedButton2.Visible:=not RadioButton1.Checked;
  DBLookupComboBox3.Visible:=not RadioButton1.Checked;
end;

procedure TGallerieAddForm.RadioButton2Click(Sender: TObject);
begin
  Label2.Visible:=RadioButton2.Checked;
  SpeedButton2.Visible:=RadioButton2.Checked;
  DBLookupComboBox3.Visible:=RadioButton2.Checked;
end;

procedure TGallerieAddForm.SpeedButton4Click(Sender: TObject);
var Galuid:String;
begin
  TSS_BE_Dataform.TSS_BE_AlgQuery.Close;
  Galuid:=TSS_BE_DataForm.MYCreateGuid;
  if RadioButton2.checked then
   TSS_BE_Dataform.TSS_BE_AlgQuery.SQL.Text:='insert into Gallery (UID,Name,Kundenid) Values ('''+GalUid+''','''+Edit1.Text+''','+inttostr(DBLookupComboBox3.KeyValue)+');'
  else
    TSS_BE_Dataform.TSS_BE_AlgQuery.SQL.Text:='insert into Gallery (UID,Name,Kundenid) Values ('''+Galuid+''','''+Edit1.Text+''',0);';
  TSS_BE_Dataform.TSS_BE_AlgQuery.ExecSQL;
  CreateDir(TSS_BE_Dataform.MainPath+Galuid);
  close;
end;

procedure TGallerieAddForm.SpeedButton5Click(Sender: TObject);
begin
  close;
end;

end.
