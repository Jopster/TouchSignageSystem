unit TransparentPanel;

{
TransparentPanel
~~~~~~~~~~~~~~~~
Panel that can show images which are under her.
For example you use some image as background for your
application. And if you'll use this panel then this
panel will look as your background image.

Status: Freeware with full source.

Installation: Choose 'Install Component...' at the main menu.
              Choose the 'Into new package' tab. Select in
              the 'Unit file name' the TransparentPanel.pas.
              And in the 'Package file name' input any file name
              (not 'TransparentPanel' - 'TranspPanel', for example).
              Press 'Ok' button. That's all!

Properties are obvious without words:
Image: TImage
Transparent: Boolean
              
---------- Other products ----------

MaxSpace
~~~~~~~~
MaxSpace just makes Delphi and C++ Builder more comfortable in usage.
It turns the IDE ToolBar and ObjectInspector into emerging state,
giving you unbelievable freedom of program editing and form designing.
For more information visit http://www.zecos.com/maxspc

ElegantMDI
~~~~~~~~~~
This component is a new elegant realiztion of the old MDI interface.
All windows (MDIChild) will be presented as buttons on autohidden panel.
User can toggle between windows without choosing items in main menu.
It looks very effectively. Freeware.

WavePanel
~~~~~~~~~
WavePanel - component with running colors, like panel at the bottom
of the startup screen when Windows 9x loading. Freeware.

MinModal
~~~~~~~~
Minimizer for modal windows. Why we can't minimize an application when
a modal window is active? Drop this component to the form, open form by
method 'ShowModal' and try minimize this form at run time. All your
application will be minimized!

All this programs you can download from http://www.zecos.com

Zecos Software team
http://www.zecos.com
support@zecos.com
}

interface

uses
  Windows, Messages, system.Classes, vcl.ExtCtrls;

type
  TTransparentPanel = class(TPanel)
  private
    FImage: TImage;
    SelfRect: TRect;
    RectInImage: TRect;
    FTransparent: Boolean;
    procedure CalcRectInImage;
    procedure SetImage(const Value: TImage);
    procedure SetTransparent(const Value: Boolean);
    procedure ShowBackground;
  protected
    procedure Paint; override;
    procedure WMEraseBkgnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Image: TImage read FImage write SetImage;
    property Transparent: Boolean read FTransparent write SetTransparent;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Additional', [TTransparentPanel]);
end;

{ TTransparentPanel }

procedure TTransparentPanel.CalcRectInImage;
begin
  if FImage<>nil then begin
    RectInImage := Rect(ClientToScreen(Point(0,0)).X, ClientToScreen(Point(0,0)).Y, ClientToScreen(Point(Width, Height)).X, ClientToScreen(Point(Width, Height)).Y);
    RectInImage := Rect(FImage.Parent.ScreenToClient(RectInImage.TopLeft).X-FImage.Left, FImage.Parent.ScreenToClient(RectInImage.TopLeft).Y-FImage.Top, FImage.Parent.ScreenToClient(RectInImage.BottomRight).X-FImage.Left, FImage.Parent.ScreenToClient(RectInImage.BottomRight).Y-FImage.Top);
  end;
end;

constructor TTransparentPanel.Create(AOwner: TComponent);
begin
  inherited;
  FTransparent := False;
  SelfRect := Rect(0,0,0,0);
  RectInImage := Rect(0,0,0,0);
end;

destructor TTransparentPanel.Destroy;
begin
  inherited;
end;

procedure TTransparentPanel.Paint;
begin
  if (FTransparent) and (FImage<>nil) then begin
    ShowBackground;
  end
  else
    inherited;
end;

procedure TTransparentPanel.SetImage(const Value: TImage);
begin
  if FImage<>Value then begin
    FImage := Value;
    if FImage<>nil then
      CalcRectInImage;
    Repaint;
  end;
end;

procedure TTransparentPanel.SetTransparent(const Value: Boolean);
begin
  if FTransparent<>Value then begin
    FTransparent := Value;
    if FTransparent then
      CalcRectInImage;
    Repaint;
  end;
end;

procedure TTransparentPanel.ShowBackground;
begin
  if (SelfRect.Left<>Left) or (SelfRect.Top<>Top) or (SelfRect.Right<>Left+Width) or (SelfRect.Bottom<>Top+Height) then begin
    SelfRect.Left := Left;
    SelfRect.Top := Top;
    SelfRect.Right := Left+Width;
    SelfRect.Bottom := Top+Height;
    CalcRectInImage;
  end;

  Canvas.CopyRect(ClientRect, FImage.Canvas, RectInImage);
end;

procedure TTransparentPanel.WMEraseBkgnd(var Msg: TWMEraseBkgnd);
begin
  if (FTransparent) and (FImage<>nil) then
    Msg.Result := LResult(False)
  else
    inherited;
end;

end.
