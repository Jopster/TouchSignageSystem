unit TSS_FE_XtraBtnForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TTSS_FE_XtraBtnForm = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TSS_FE_XtraBtnForm: TTSS_FE_XtraBtnForm;

implementation

{$R *.dfm}
procedure TTSS_FE_XtraBtnForm.FormCreate(Sender: TObject);
const
  // Image Color to be made transparent
  MASKCOLOR = clWhite;

  // Cutting adjustments
  ADJ_TOP = 22;{TitleBar}
  ADJ_BOTTOM = 22 ;{TitleBar}
  ADJ_LEFT = 3;{Border}
  ADJ_RIGHT = 3;{Border}
var
  ShowRegion,CutRegion: HRgn;
  y,x1,x2:integer;
  PixelColor:TColor;
begin

  ShowRegion:=CreateRectRgn(Image1.Left+ADJ_LEFT,Image1.Top+ADJ_TOP,
    Image1.Left+Image1.Width+ADJ_RIGHT,Image1.Top+Image1.Height+ADJ_BOTTOM);

  // Cut the parts whose color is equal to MASKCOLOR by rows
  for y:=0 to Image1.Picture.Bitmap.Height-1 do
    begin
      x1:=0; // starting point of cutting
      x2:=0; // end point of cutting
      repeat
        PixelColor:=Image1.Picture.Bitmap.Canvas.Pixels[x2,y];
        // the above will return -1 if x2 reached beyond the image
        if (PixelColor=MaskColor) then
          Inc(x2)
        else
          begin
            //do following if pixel reached beyond image or if color of pixel is not MaskColor
            if x1 <> x2 then
              begin
                // Create the region to be cut. The region will be one line of pixels/a pixel with color of                   // MaskColor
                CutRegion:=CreateRectRgn(
                X1+Image1.Left+ADJ_LEFT ,
                Y+Image1.Top+ADJ_TOP,
                X2+Image1.Left+ADJ_RIGHT ,
                Y+Image1.Top+ADJ_TOP+1);

                try
                  CombineRgn(ShowRegion,ShowRegion,CutRegion,RGN_DIFF);
                  // RGN_DIFF will get the difference of ShowRegion
                finally
                  DeleteObject(CutRegion);
                end;
              end;

            Inc(x2);
            x1:=x2;
          end;
      until PixelColor=-1;
    end;

  // Set the window to have the above defined region
  SetWindowRgn(TSS_FE_XtraBtnForm.Handle,ShowRegion,True);

  // NOTE : Do not free close/delete ShowRegion because it will become owned
  // by the operating system

  // You can manually disable the showing of the whole
  //form while dragging, with the following line but
  // just leave it since it is dependent on your
  // windows settings. Some people may want to have their
  // windows show its contents while dragging.

  // SystemParametersInfo(SPI_SETDRAGFULLWINDOWS, 0, nil, 0); {Disable drag showing}
  // SystemParametersInfo(SPI_SETDRAGFULLWINDOWS, 1, nil, 0); {Enable drag showing}
end;


procedure TTSS_FE_XtraBtnForm.Image1Click(Sender: TObject);
begin
  TSS_FE_XtraBtnForm.close;
end;

end.
