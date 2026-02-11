unit TSS_BE_AlphaTransPanel_unit;

interface

uses
  windows, graphics, classes, ExtCtrls, messages;

type
  TAlphaPanel = class(ExtCtrls.TPanel)
  protected
    procedure Paint; override;
  private
    fAlphaVal : Byte;
    fBmpParent: TBitmap;
    fBmpOwn : TBitmap;
    procedure FSetAlphaVal(AValue: Byte);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AlphaBlendValue: Byte read fAlphaVal write FSetAlphaVal default 255;
  end;

implementation

constructor TAlphaPanel.Create(AOwner: TComponent);
begin
  fAlphaVal := 255;
  fBmpParent := TBitmap.Create;
  fBmpOwn := TBitmap.Create;
  inherited Create(AOwner);
end;

destructor TAlphaPanel.Destroy;
begin
  inherited Destroy;
  fBmpOwn.Free;
  fBmpParent.Free;
end;

procedure TAlphaPanel.FSetAlphaVal(AValue: Byte);
begin
  if (AValue <> fAlphaVal) then
  begin
    fAlphaVal := AValue;
    Invalidate;
  end;
end;

procedure TAlphaPanel.Paint;
var LOldCanvas: TCanvas;
    LBlendFunc: TBlendFunction;
begin
  if (fAlphaVal < 255) and HandleAllocated and Assigned(Parent) then
  begin
    fBmpOwn.Width := Width;
    fBmpOwn.Height := Height;
    LOldCanvas := Canvas;
    PPointer(@Canvas)^ := fBmpOwn.Canvas;
    inherited Paint;
    PPointer(@Canvas)^ := LOldCanvas;

    fBmpParent.Width := Parent.Width;
    fBmpParent.Height := Parent.Height;
    Parent.Perform(WM_ERASEBKGND, fBmpParent.Canvas.Handle, 0);
    Parent.Perform(WM_PAINT, fBmpParent.Canvas.Handle, 0);

    LBlendFunc.BlendOp := AC_SRC_OVER;
    LBlendFunc.BlendFlags := 0;
    LBlendFunc.SourceConstantAlpha := not(fAlphaVal);
    LBlendFunc.AlphaFormat := 0;

    AlphaBlend(fBmpOwn.Canvas.Handle, 0, 0, Width, Height,
               fBmpParent.Canvas.Handle, Left, Top, Width, Height, LBlendFunc);

    BitBlt(Canvas.Handle, 0, 0, Width, Height, fBmpOwn.Canvas.Handle, 0, 0, SRCCOPY);
  end else
    inherited;
end;

end.
