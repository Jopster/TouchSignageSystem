unit TSS_BE_KDSearchForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons;

type
  TKDSearchForm = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton10: TSpeedButton;
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    clicked:integer;
    SearchText:string;
  end;

var
  KDSearchForm: TKDSearchForm;

implementation

{$R *.dfm}

procedure TKDSearchForm.SpeedButton10Click(Sender: TObject);
begin
  clicked:=0;
  close;
end;

procedure TKDSearchForm.SpeedButton1Click(Sender: TObject);
begin
  SearchText:=InputBox('Welche Kundennummer ? ',' Kundennummer :','');
  clicked:=1;
  close;
end;

procedure TKDSearchForm.SpeedButton2Click(Sender: TObject);
begin
  SearchText:=InputBox('Nach Name oder Namens-Teil ? ',' Suchwort :','');
  clicked:=2;
  close;
end;

procedure TKDSearchForm.SpeedButton3Click(Sender: TObject);
begin
  SearchText:=InputBox('Nach Ort oder Strasse ? ',' Suchbegriff :','');
  clicked:=3;
  close;
end;

end.
