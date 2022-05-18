{
  Author: Grega Loboda
  E-mail: grega.loboda@email.si
  Web: http://delphistep.cis.si

  ver 1.2

  Last modified: 25.03.2004

  Copyright (c) 2000 Grega Loboda

  -------------------------------------------------------------------
  TdsLed
  TdsSevenSegmentDisplay
  TdsDotMatrixDisplay
}
unit dsLeds;

interface

uses Windows, Messages, SysUtils, Classes, vcl.Graphics, vcl.Controls, vcl.Forms, vcl.ExtCtrls;

type
  TdsLedShape = (ltEllipse, ltRectangle, ltTriangleTop, ltTriangleBottom, ltTriangleLeft, ltTriangleRight);
  TdsLedStyle = (lsStandard, lsOwnerDraw);
  TdsLedBevel= (blNone, blLowered, blRaised, blBorder);
  TOnDrawLed = procedure (Sender: TObject; Rect: TRect; Canvas: TCanvas) of object;

  TdsLed = class(TGraphicControl)
  private
    FShape: TdsLedShape;
    FOnColor: TColor;
    FOffColor: TColor;
    FLedOn: Boolean;
    FStyle: TdsLedStyle;
    FBevel: TdsLedBevel;

    FOnChange: TNotifyEvent;
    FOnDrawLed: TOnDrawLed;

    procedure SetShape(Value: TdsLedShape);
    procedure SetLedOn(Value: Boolean);
    procedure SetOnColor(Value: TColor);
    procedure SetOffColor(Value: TColor);
    procedure SetBevel(Value: TdsLedBevel);

    procedure DrawLedEllipse;
    procedure DrawLedRectangle;
    procedure DrawLedTriangle;

  protected
    procedure Paint; override;
    procedure DoChange; virtual;
    procedure DrawLed; virtual;

  public
    constructor Create(AOwner:TComponent); override;

  published
    property Bevel: TdsLedBevel  read FBevel write SetBevel;
    property Shape: TdsLedShape read FShape write SetShape;
    property OnColor: TColor read FOnColor write SetOnColor;
    property OffColor: TColor read FOffColor write SetOffColor;
    property LedOn: Boolean read FLedOn write SetLedOn;
    property Style: TdsLedStyle read FStyle write FStyle;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnDrawLed: TOnDrawLed read FOnDrawLed write FOnDrawLed;

    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TdsDisplaySegment = (tsTop, tsUpperLeft, tsUpperRight, tsMiddle, tsLowerLeft, tsLowerRight, tsBottom);
  TdsDisplaySegments = set of TdsDisplaySegment;

  TdsSevenSegmentDisplay = class(TGraphicControl)
  private
    FSegments: TdsDisplaySegments;
    FSegWidth: Integer;
    FBackColor: TColor;
    FOnColor: TColor;
    FOffColor: TColor;
    FValue: Integer;

    FOnChange: TNotifyEvent;

    procedure DrawSegment(s: Byte);

    procedure SetSegments(Value: TdsDisplaySegments);
    procedure SetSegWidth(Value: Integer);
    procedure SetBackColor(Value: TColor);
    procedure SetOnColor(Value: TColor);
    procedure SetOffColor(Value: TColor);
    procedure SetValue(Value: Integer);

  protected
    procedure Paint; override;
    procedure DoChange; virtual;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property Segments: TdsDisplaySegments read FSegments write SetSegments;
    property SegmentWidth: Integer read FSegWidth write SetSegWidth;
    property BackColor: TColor read FBackColor write SetBackColor;
    property OnColor: TColor read FOnColor write SetOnColor;
    property OffColor: TColor read FOffColor write SetOffColor;
    property Value: Integer read FValue write SetValue;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;

    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  TdsDisplayDots = String[35];

  TdsDotMatrixDisplay = class(TGraphicControl)
  private
    FDots: TdsDisplayDots;
    FBackColor: TColor;
    FOnColor: TColor;
    FOffColor: TColor;

    FOnChange: TNotifyEvent;

    procedure SeTdsDisplayDots(Value: TdsDisplayDots);
    procedure SetBackColor(Value: TColor);
    procedure SetOnColor(Value: TColor);
    procedure SetOffColor(Value: TColor);

  protected
    procedure Paint; override;
    procedure DoChange; virtual;

  public
    constructor Create(AOwner: TComponent); override;

    procedure ExtSetDots(const Value: array of Byte);

  published
    property Dots: TdsDisplayDots read FDots write SeTdsDisplayDots;
    property BackColor: TColor read FBackColor write SetBackColor;
    property OnColor: TColor read FOnColor write SetOnColor;
    property OffColor: TColor read FOffColor write SetOffColor;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;

    property Visible;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

constructor TdsLed.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);

  FOnColor := clLime;
  FOffColor := clRed;
  FShape := ltEllipse;
  FStyle := lsStandard;
  FLedOn := false;

  Width := 24;
  Height := 24;
end;

procedure TdsLed.SetShape(Value: TdsLedShape);
begin
  if FShape <> Value then
  begin
    FShape := Value;
    Refresh;
  end;
end;

procedure TdsLed.SetLedOn(Value: Boolean);
begin
  if Value <> FLedOn then
  begin
    FLedOn := Value;
    //Invalidate is not good, because it happens when Windows have time.
    //Refresh happens right away.
    Refresh;
    DoChange;
  end;
end;

procedure TdsLed.DoChange;
begin
  if Assigned(FOnChange) then FOnChange(self);
end;

procedure TdsLed.SetOnColor(Value: TColor);
begin
  if FOnColor <> Value then
  begin
    FOnColor := Value;
    Refresh;
  end;
end;

procedure TdsLed.SetOffColor(Value: TColor);
begin
  if FOffColor <> Value then
  begin
    FOffColor := Value;
    Refresh;
  end;
end;

procedure TdsLed.SetBevel(Value: TdsLedBevel);
begin
  if FBevel <> Value then
  begin
    FBevel := Value;
    Refresh;
  end;
end;

procedure TdsLed.DrawLedEllipse;
var
  R: TRect;
  off: Integer;

  procedure Ellipse3D(Rect: TRect; TopColor, BottomColor: TColor; Width: Integer);
  begin
    Canvas.Pen.Width := 1;
    while Width > 0 do
    begin
      Canvas.Pen.Color := TopColor;
      Canvas.Arc(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, Rect.Right, Rect.Top, Rect.Left, Rect.Bottom);

      Canvas.Pen.Color := BottomColor;
      Canvas.Arc(Rect.Left, Rect.Top, Rect.Right, Rect.Bottom, Rect.Left, Rect.Bottom, Rect.Right, Rect.TOp);

      Dec(Width);
      InflateRect(Rect,-1,-1);
    end;
  end;

begin
  R := ClientRect;

  if Height > Width then
    off := Width div 5
  else
    off := Height div 5;

  with Canvas do
  begin
    Pen.Color := Canvas.Brush.Color;
    Ellipse(R.Left, R.Top, R.Right, R.Bottom);

    Pen.Color := clYellow;
    Brush.Color := clYellow;
    //Ellipse(R.Left+off, R.Top+off, R.Right-off, R.Bottom-off);

    //3D effect
    Pen.Color := clWhite;
    Brush.Color := clWhite;
    Chord(R.Left+off, R.Top+off, R.Right-off, R.Bottom-off, R.Right div 2 + (off div 2), R.Top+off, R.Left+off, R.Bottom div 2 + (off div 2));

    case FBevel of
      blLowered: Ellipse3D(R, clBtnShadow, clBtnHighlight, 1);
      blRaised: Ellipse3D(R, clBtnHighlight, clBtnShadow, 1);
      blBorder:
        begin
          Pen.Color := clBtnShadow;
          Brush.Style := bsClear;
          Ellipse(R.Left, R.Top, R.Right, R.Bottom);
        end;
    end;
  end;
end;

procedure TdsLed.DrawLedRectangle;
var
  R: TRect;
begin
  R := ClientRect;

  with Canvas do
  begin
    Pen.Color := Canvas.Brush.Color;
    Rectangle(0, 0, Width, Height);

    case FBevel of
      blLowered: Frame3D(Canvas, R, clBtnShadow, clBtnHighlight, 2);
      blRaised: Frame3D(Canvas, R, clBtnHighlight, clBtnShadow, 2);
      blBorder:
        begin
          Pen.Color := clBtnShadow;
          Brush.Style := bsClear;
          Rectangle(R.Left, R.Top, R.Right, R.Bottom);
        end;
    end;
  end;
end;

procedure TdsLed.DrawLedTriangle;
var
  p1, p2, p3: TPoint;

  //p1 to p2 with c1, p2 to p3 with c2, p3 to p1 with c3
  procedure DrawTriangleBevel(p1, p2, p3: TPoint; c1, c2, c3: TColor);
  begin
    with Canvas do
    begin
      Pen.Width := 2;
      MoveTo(p1.x, p1.y);

      Pen.Color := c1;
      LineTo(p2.x, p2.y);

      Pen.Color := c2;
      LineTo(p3.x, p3.y);

      Pen.Color := c3;
      LineTo(p1.x, p1.y)
    end;
  end;

begin
  with Canvas do
  begin
    Pen.Color := Canvas.Brush.Color;
    case FShape of
      ltTriangleTop: begin p1 := Point(0, Height); p2 := Point(Width, Height); p3 := Point(Width div 2, 0); end;
      ltTriangleBottom: begin p1 := Point(0, 0); p2 := Point(Width, 0); p3 := Point(Width div 2, Height); end;
      ltTriangleLeft: begin p1 := Point(0, 0); p2 := Point(0, Height); p3 := Point(Width, Height div 2); end;
      ltTriangleRight: begin p1 := Point(Width, 0); p2 := Point(Width, Height); p3 := Point(0, Height div 2); end;
    end;
    Polygon([p1, p2, p3]);

    case FBevel of
      blLowered:
        case FShape of
          ltTriangleTop: DrawTriangleBevel(p1, p2, p3, clBtnHighlight, clBtnHighlight, clBtnShadow);
          ltTriangleBottom: DrawTriangleBevel(p2, p1, p3, clBtnShadow, clBtnShadow, clBtnHighlight);
          ltTriangleLeft: DrawTriangleBevel(p2, p1, p3, clBtnShadow, clBtnShadow, clBtnHighlight);
          ltTriangleRight: DrawTriangleBevel(p3, p2, p1, clBtnHighlight, clBtnHighlight, clBtnShadow);
        end;
      blRaised:
        case FShape of
          ltTriangleTop: DrawTriangleBevel(p1, p2, p3, clBtnShadow, clBtnShadow, clBtnHighlight);
          ltTriangleBottom: DrawTriangleBevel(p2, p1, p3, clBtnHighlight, clBtnHighlight, clBtnShadow);
          ltTriangleLeft: DrawTriangleBevel(p2, p1, p3, clBtnHighlight, clBtnHighlight, clBtnShadow);
          ltTriangleRight: DrawTriangleBevel(p3, p2, p1, clBtnShadow, clBtnShadow, clBtnHighlight);
        end;
      blBorder: DrawTriangleBevel(p1, p2, p3, clBtnShadow, clBtnShadow, clBtnShadow);
    end;
  end;
end;

procedure TdsLed.DrawLed;
begin
  if Assigned(FOnDrawLed) then FOnDrawLed(self, ClientRect, Canvas);
end;

procedure TdsLed.Paint;
begin
  //set color
  if FLedOn then
    Canvas.Brush.Color := FOnColor
  else
    Canvas.Brush.Color := FOffColor;

  if FStyle = lsStandard then
  begin
    case FShape of
      ltEllipse:    DrawLedEllipse;
      ltRectangle: DrawLedRectangle;
      ltTriangleTop,
      ltTriangleBottom,
      ltTriangleLeft,
      ltTriangleRight: DrawLedTriangle;
    end;
  end
  else
    DrawLed;
end;




constructor TdsSevenSegmentDisplay.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Width := 40;
  Height:= 76;

  FSegWidth := 4;

  FBackColor := clGray;
  FOnColor := clBlack;
  FOffColor := clSilver;
end;

procedure TdsSevenSegmentDisplay.SetSegments(Value: TdsDisplaySegments);
begin
  if Value <> FSegments then
  begin
    FSegments := Value;
    Refresh;

    DoChange;
  end;
end;

procedure TdsSevenSegmentDisplay.SetSegWidth(Value: Integer);
begin
  if Value <> FSegWidth then
  begin
    FSegWidth := Value;
    Refresh;
  end;
end;

procedure TdsSevenSegmentDisplay.SetBackColor(Value: TColor);
begin
  if Value <> FBackColor then
  begin
    FBackColor := Value;
    Refresh;
  end;
end;

procedure TdsSevenSegmentDisplay.SetOnColor(Value: TColor);
begin
  if Value <> FOnColor then
  begin
    FOnColor := Value;
    Refresh;
  end;
end;

procedure TdsSevenSegmentDisplay.SetOffColor(Value: TColor);
begin
  if Value <> FOffColor then
  begin
    FOffColor := Value;
    Refresh;
  end;
end;

procedure TdsSevenSegmentDisplay.SetValue(Value: Integer);
begin
  if Value <> FValue then
  begin
    FValue := Value;

    case Value of
      0: Segments := [tsTop, tsUpperLeft, tsUpperRight, tsLowerLeft, tsLowerRight, tsBottom];
      1: Segments := [tsUpperRight, tsLowerRight];
      2: Segments := [tsTop, tsUpperRight, tsMiddle, tsLowerLeft, tsBottom];
      3: Segments := [tsTop, tsUpperRight, tsMiddle, tsLowerRight, tsBottom];
      4: Segments := [tsUpperLeft, tsUpperRight, tsMiddle, tsLowerRight];
      5: Segments := [tsTop, tsUpperLeft, tsMiddle, tsLowerRight, tsBottom];
      6: Segments := [tsTop, tsUpperLeft, tsMiddle, tsLowerLeft, tsLowerRight, tsBottom];
      7: Segments := [tsTop, tsUpperRight, tsLowerRight];
      8: Segments := [tsTop, tsUpperLeft, tsUpperRight, tsMiddle, tsLowerLeft, tsLowerRight, tsBottom];
      9: Segments := [tsTop, tsUpperLeft, tsUpperRight, tsMiddle, tsLowerRight, tsBottom];
      else Segments := [tsTop, tsUpperLeft, tsMiddle, tsLowerLeft, tsBottom];
    end;
  end;
end;

procedure TdsSevenSegmentDisplay.DoChange;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TdsSevenSegmentDisplay.DrawSegment(s: Byte);
var
  W, H: Double;
begin
  W := Width / 20;
  H := Height / 38;

  case s of
    0://top
      Canvas.Polygon([Point(round(w*2), round(h*1)),
                      Point(round(w*18), round(h*1)),
                      Point(round(w*(18-FSegWidth)), round(h*(1+FSegWidth))),
                      Point(round(w*(2+FSegWidth)), round(h*(1+FSegWidth)))]);
    1://upper left
      Canvas.Polygon([Point(round(w*1), round(h*2)),
                      Point(round(w*1), round(h*18)),
                      Point(round(w*(1+FSegWidth)), round(h*(18-FSegWidth))),
                      Point(round(w*(1+FSegWidth)), round(h*(2+FSegWidth)))]);
    2://upper right
      Canvas.Polygon([Point(round(w*19), round(h*2)),
                      Point(round(w*19), round(h*18)),
                      Point(round(w*(19-FSegWidth)), round(h*(18-FSegWidth))),
                      Point(round(w*(19-FSegWidth)), round(h*(2+FSegWidth)))]);

    4://lower left
      Canvas.Polygon([Point(round(w*1), round(h*20)),
                      Point(round(w*1), round(h*36)),
                      Point(round(w*(1+FSegWidth)), round(h*(36-FSegWidth))),
                      Point(round(w*(1+FSegWidth)), round(h*(20+FSegWidth)))]);

    5://lower right
      Canvas.Polygon([Point(round(w*19), round(h*20)),
                      Point(round(w*19), round(h*36)),
                      Point(round(w*(19-FSegWidth)), round(h*(36-FSegWidth))),
                      Point(round(w*(19-FSegWidth)), round(h*(20+FSegWidth)))]);
    6://bottom
      Canvas.Polygon([Point(round(w*2), round(h*37)),
                      Point(round(w*18), round(h*37)),
                      Point(round(w*(18-FSegWidth)), round(h*(37-FSegWidth))),
                      Point(round(w*(2+FSegWidth)), round(h*(37-FSegWidth)))]);

    3://middle
      Canvas.Polygon([Point(round(w*2), round(h*19)),
                      Point(round(w*(2+FSegWidth/2)), round(h*(19-FSegWidth/2))),
                      Point(round(w*(18-FSegWidth/2)), round(h*(19-FSegWidth/2))),
                      Point(round(w*18), round(h*19)),
                      Point(round(w*(18-FSegWidth/2)), round(h*(19+FSegWidth/2))),
                      Point(round(w*(2+FSegWidth/2)), round(h*(19+FSegWidth/2)))]);
  end;
end;

procedure TdsSevenSegmentDisplay.Paint;
var
  i: Integer;
begin
  Canvas.Pen.Style := psClear;
//  Canvas.Brush.Color := FBackColor;
//  Canvas.Rectangle(0, 0, Width, Height);

  for i := 0 to 6 do
  begin
    if TdsDisplaySegment(i) in FSegments then
      Canvas.Brush.Color := FOnColor
    else
      Canvas.Brush.Color := FOffColor;

    DrawSegment(i);
  end;
end;





constructor TdsDotMatrixDisplay.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Width := 50;
  Height:= 70;

  FBackColor := clSilver;
  FOnColor := clBlack;
  FOffColor := clYellow;

  FDots := StringOfChar('0', 35);
end;

procedure TdsDotMatrixDisplay.SeTdsDisplayDots(Value: TdsDisplayDots);
begin
  if Value <> FDots then
  begin
    FDots := Value;
    Refresh;

    DoChange;
  end;
end;

procedure TdsDotMatrixDisplay.SetBackColor(Value: TColor);
begin
  if Value <> FBackColor then
  begin
    FBackColor := Value;
    Refresh;
  end;
end;

procedure TdsDotMatrixDisplay.SetOnColor(Value: TColor);
begin
  if Value <> FOnColor then
  begin
    FOnColor := Value;
    Refresh;
  end;
end;

procedure TdsDotMatrixDisplay.SetOffColor(Value: TColor);
begin
  if Value <> FOffColor then
  begin
    FOffColor := Value;
    Refresh;
  end;
end;

procedure TdsDotMatrixDisplay.DoChange;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TdsDotMatrixDisplay.Paint;
var
  i, j: Integer;
  w, h: Double;
begin
  Canvas.Pen.Style := psClear;
  Canvas.Brush.Color := FBackColor;
  Canvas.Rectangle(0, 0, Width, Height);

  w := Width / 5;
  h := Height / 7;

  for i := 0 to 6 do
    for j := 0 to 4 do
    begin
      if FDots[i * 5 + j + 1] = '1' then
        Canvas.Brush.Color := FOnColor
      else
        Canvas.Brush.Color := FOffColor;

      Canvas.Rectangle(Round(j*w), Round(i*h), Round((j+1)*w), Round((i+1)*h));
    end;
end;

procedure TdsDotMatrixDisplay.ExtSetDots(const Value: array of Byte);
var
  i: Integer;
  tmpstr: TdsDisplayDots;
begin
  tmpstr := StringOfChar('0', 35);
  for i := 0 to Length(Value) - 1 do tmpstr[Value[i]] := '1';
  Dots := tmpstr;
end;




procedure Register;
begin
  RegisterComponents('Delphi step', [TdsLed, TdsSevenSegmentDisplay, TdsDotMatrixDisplay]);
end;

end.
