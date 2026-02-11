unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, TransparentPanel;

const
  MaxSpaceHome = 'http://www.zecos.com/maxspc';

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Image1: TImage;
    Label4: TLabel;
    Image2: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    TransparentPanel1: TTransparentPanel;
    TrackBar1: TTrackBar;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Edit1: TEdit;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ShellApi;

{$R *.dfm}

procedure TForm1.Image1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', MaxSpaceHome, '', '', SW_MAXIMIZE);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TrackBar1.Max := Panel2.Width - TransparentPanel1.Width;
  TrackBar1.Position := TransparentPanel1.Left;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  TransparentPanel1.Transparent := not TransparentPanel1.Transparent;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  TransparentPanel1.Left := TrackBar1.Position;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
