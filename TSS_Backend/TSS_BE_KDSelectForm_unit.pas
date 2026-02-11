unit TSS_BE_KDSelectForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TTSS_BE_KDSelectform = class(TForm)
    TSS_BE_GALQuery: TFDQuery;
    DataSource2: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    Take:boolean;TakeDS,TakeID:String;
  end;

var
  TSS_BE_KDSelectform: TTSS_BE_KDSelectform;

implementation

{$R *.dfm}

procedure TTSS_BE_KDSelectform.Button1Click(Sender: TObject);
begin
  Take:=true;
  TakeDS:=TSS_BE_GALQuery.fieldbyname('Kundenkurzname').asstring;
  TakeID:=TSS_BE_GALQuery.fieldbyname('Kunden_UID').asstring;
  close;
end;

procedure TTSS_BE_KDSelectform.Button2Click(Sender: TObject);
begin
  Take:=false;
  TakeDS:='0';
  TakeID:='';
  close;
end;

procedure TTSS_BE_KDSelectform.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TSS_BE_GALQuery.Close;
  TSS_BE_GALQuery.SQL.Text := 'Select * from kunden where kundennummer like '''+Edit1.Text+'%''';
  TSS_BE_GALQuery.Open;
  DBGrid1.Repaint;
end;

end.
