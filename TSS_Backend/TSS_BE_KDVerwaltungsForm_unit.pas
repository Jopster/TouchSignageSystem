unit TSS_BE_KDVerwaltungsForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons;

type
  TKDVerwaltungsForm = class(TForm)
    DBGrid1: TDBGrid;
    TSS_BE_KundenTable: TFDTable;
    TSS_BE_KundenTable_Source: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  KDVerwaltungsForm: TKDVerwaltungsForm;

implementation

{$R *.dfm}

uses TSS_BE_DataForm_unit, TSS_BE_KundenAddForm;

procedure TKDVerwaltungsForm.SpeedButton18Click(Sender: TObject);
begin
  kundenaddform.TSS_BE_KundenTable.Open();
  kundenaddform.TSS_BE_KundenTable.Append;
  kundenaddform.showmodal;
  TSS_BE_KundenTable.Refresh;
end;

procedure TKDVerwaltungsForm.SpeedButton1Click(Sender: TObject);
begin
  if MessageDlg('Eintrag wirklich löschen ?',mtwarning,mbyesno,0)=mryes then TSS_BE_KundenTable.Delete;

end;

procedure TKDVerwaltungsForm.SpeedButton2Click(Sender: TObject);
begin
  kundenaddform.TSS_BE_KundenTable.Open();
  kundenaddform.TSS_BE_KundenTable.Locate('kunden_id',TSS_BE_KundenTable.FieldByName('kunden_id').AsString,[loCaseInsensitive]);
  kundenaddform.TSS_BE_KundenTable.Edit;
  kundenaddform.showmodal;
  TSS_BE_KundenTable.Refresh;
end;

end.
