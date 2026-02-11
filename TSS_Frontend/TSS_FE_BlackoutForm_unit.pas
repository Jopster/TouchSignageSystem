unit TSS_FE_BlackoutForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TBlackoutForm = class(TForm)
    Image2: TImage;
    Panel1: TPanel;
    Panel4: TPanel;
    Image1: TImage;
    Image3: TImage;
    Label1: TLabel;
    leftside: TLabel;
    RightSide: TLabel;
    procedure FormResize(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  BlackoutForm: TBlackoutForm;

implementation

{$R *.dfm}

procedure TBlackoutForm.FormResize(Sender: TObject);
begin
  Leftside.Width:=round((screen.Width/5));
  RightSide.Width:=round((screen.Width/5));
  Panel1.height:=round((screen.Height/5));
  Image1.width:=round((screen.Height/5));
  Image3.width:=round((screen.Height/5));
  Label1.height:=round((screen.Height/5));
end;

end.
