unit TSS_BE_KundenAddForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TSS_BE_Dataform_unit , FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TKundenAddForm = class(TForm)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBImage1: TDBImage;
    SpeedButton19: TSpeedButton;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton15: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    TSS_BE_KundenTable: TFDTable;
    TSS_BE_KundenTable_source: TDataSource;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    DBCheckBox1: TDBCheckBox;
    Edit1: TEdit;
    SpeedButton6: TSpeedButton;
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  KundenAddForm: TKundenAddForm;

implementation

{$R *.dfm}


procedure TKundenAddForm.SpeedButton10Click(Sender: TObject);
begin
  TSS_BE_KundenTable.Cancel;
  close;
end;

procedure TKundenAddForm.SpeedButton15Click(Sender: TObject);
var mysql:string;
begin
  if TSS_BE_KundenTable.fieldbyname('Kunden_UID').asstring='' then TSS_BE_KundenTable.fieldbyname('Kunden_UID').asstring:=TSS_BE_DataForm.MYCreateGuid;
  TSS_BE_KundenTable.Post;
(*  mysql:='update logumedia.displays set UpdateID='''+TSS_BE_DataForm.MYCreateGuid+''' where schematic_id='''+TSS_BE_DataForm.Global_Schematic_id+'''';
  TSS_BE_DataForm.TSS_BE_AlgQuery.close;
  TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
  TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
  if TSS_BE_KundenTable.RowsAffected=1 then begin
  end else begin
    messagedlg('Fehler #6/4/4 beim Updateeintrag : !!',mtwarning,mbOKCancel,0);
  end;*)
  close;
end;

procedure TKundenAddForm.SpeedButton6Click(Sender: TObject);
var s:string;
begin
  s:=edit1.Text+#9;
  TSS_BE_KundenTable.FieldByName('kundennummer').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kundenkurzname').asstring:=Copy(s,1,pos(#9,s)-1);
  TSS_BE_KundenTable.FieldByName('kunden_name_1').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kunden_name_2').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kunden_strasse').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kunden_plz').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kunden_ort').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kunden_telefon1').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kunden_telefon2').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kunden_skype').asstring:=Copy(s,1,pos(#9,s)-1);
  delete(s,1,pos(#9,s));
  TSS_BE_KundenTable.FieldByName('kunden_mail').asstring:=Copy(s,1,pos(#9,s)-1);
  edit1.Text:='';
end;

end.
