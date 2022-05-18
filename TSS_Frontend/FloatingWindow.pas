unit FloatingWindow;

interface

uses
  Windows, Messages, SysUtils, Classes, vcl.Graphics, vcl.ExtCtrls, vcl.Controls;

type
  TTitleBarPosition = (tbTop, tbLeft);

  TFloatingWindow = class(TCustomPanel)
  private
    { Private declarations }
    fExpanded: Boolean;
    fSizeable: Boolean;
    fShowButtons: Boolean;
    fTitleBarPosition: TTitleBarPosition;
    fOnExpand: TNotifyEvent;
    fOnHide: TNotifyEvent;
    fOnShow: TNotifyEvent;
    rCloseButton: TRect;
    rExpandButton: TRect;
    saveHeight: Integer;
    active: Boolean;
    isOverCloseButton: Boolean;
    isOverExpandButton: Boolean;
    procedure DrawClient;
    procedure DrawNonClient;
    procedure WMNCHitTest(var msg: TMessage); message WM_NCHITTEST;
    procedure WMNCCalcSize(var msg: TMessage); message WM_NCCALCSIZE;
    procedure WMNCPaint(var msg: TMessage); message WM_NCPAINT;
    procedure WMWindowPosChanging(var msg: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
    procedure CMMouseLeave(var msg: TMessage); message CM_MOUSELEAVE;

    procedure SetCtl3D(Value: Boolean);
    procedure SetExpanded(const Value: Boolean);
    procedure SetTitleBarPosition(const Value: TTitleBarPosition);
    procedure SetShowButtons(const Value: Boolean);
    procedure RotateFont(f: TFont; alpha: Integer);
  protected
    { Protected declarations }
    procedure Paint; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure WndProc(var msg: TMessage); override;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent); override;
    procedure Hide;
    procedure Show;
  published
    { Published declarations }
    property Ctl3D write SetCtl3D;
    property Expanded: Boolean read fExpanded write SetExpanded default true;
    property Sizeable: Boolean read fSizeable write fSizeable default true;
    property ShowButtons: Boolean read fShowButtons write SetShowButtons default true;
    property TitleBarPosition: TTitleBarPosition read fTitleBarPosition write SetTitleBarPosition default tbTop;
    property OnExpand: TNotifyEvent read fOnExpand write fOnExpand;
    property OnHide: TNotifyEvent read fOnHide write fOnHide;
    property OnShow: TNotifyEvent read fOnShow write fOnShow;
  public
    property DockManager;
    property MouseCapture;
  published
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Caption;
    property Color;
    property Constraints;
    property UseDockManager default True;
    property DockSite;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FullRepaint;
    property Font;
    property Locked;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

procedure Register;

implementation

const
  CAPTION_WIDTH = 16;

{ TFloatingWindow }

procedure TFloatingWindow.CMMouseLeave(var msg: TMessage);
begin
  inherited;
  isOverCloseButton := false;
  isOverExpandButton := false;
  DrawNonClient
end;

constructor TFloatingWindow.Create(aOwner: TComponent);
begin
  inherited;
  Height := 105;
  fExpanded := true;
  fSizeable := true;
  fShowButtons := true;
  fTitleBarPosition := tbTop;
  saveHeight := Height;
end;

procedure TFloatingWindow.DoEnter;
begin
  inherited;
  active := true;
  DrawNonClient;
end;

procedure TFloatingWindow.DoExit;
begin
  inherited;
  active := false;
  DrawNonClient
end;

procedure TFloatingWindow.DrawClient;
begin
  Canvas.Brush.Color := Color;
  Canvas.FillRect(ClientRect)
end;

procedure TFloatingWindow.DrawNonClient;
const
  arrTextColors: array[Boolean] of TColor = (clInactiveCaptionText, clCaptionText);
  arrCaptionColors: array[Boolean] of TColor = (clInactiveCaption, clActiveCaption);
var
  r: TRect;
  cnv: TCanvas;
  k: Byte;
begin
  if csDesigning in ComponentState then active := true;
  r := Rect(0, 0, Width, Height);
  cnv := TCanvas.Create;
  cnv.Handle := GetWindowDC(Handle);

  //Draw window frame
  if Ctl3D then
  begin
    Frame3D(cnv, r, clBtnFace, cl3DDkShadow, 1);
    Frame3D(cnv, r, clWindow, clBtnShadow, 1);
    k := 2;
  end
  else begin
    Frame3D(cnv, r, cl3DDkShadow, cl3DDkShadow, 1);
    k := 1;
  end;

  if fTitleBarPosition = tbTop then
  begin
    //Draw title bar
    r := Rect(k, k, Width - k, CAPTION_WIDTH + k);
    cnv.Font := Font;
    cnv.Font.Color := arrTextColors[active];
    cnv.Brush.Color := arrCaptionColors[active];
    cnv.FillRect(r);
    OffsetRect(r, 4, k - 1);
    Dec(r.Right, 30);
    DrawText(cnv.Handle, PChar(Caption), Length(Caption), r, DT_END_ELLIPSIS);

    if not fShowButtons then
    begin
      SetRectEmpty(rCloseButton);
      SetRectEmpty(rExpandButton)
    end
    else begin
      //Draw buttons
      cnv.Pen.Color := arrTextColors[active];
      cnv.Brush.Color := arrTextColors[active];
      //Draw close button
      rCloseButton := Rect(Width - 12 - k, 2 + k, Width - k, 14 + k);
      r := rCloseButton;
      InflateRect(r, -4, -4);
      if isOverCloseButton then
      begin
        cnv.Pen.Color := clLime;
        cnv.Brush.Color := clLime;
      end
      else begin
        cnv.Pen.Color := arrTextColors[active];
        cnv.Brush.Color := arrTextColors[active];
      end;
      cnv.FillRect(r);
      //Draw expand button
      rExpandButton := Rect(Width - 23 - k, 2 + k, Width - 11 - k, 14 + k);
      if isOverExpandButton then
      begin
        cnv.Pen.Color := clLime;
        cnv.Brush.Color := clLime;
      end
      else begin
        cnv.Pen.Color := arrTextColors[active];
        cnv.Brush.Color := arrTextColors[active];
      end;
      with rExpandButton do
        if Expanded then
          cnv.Polygon([Point(Left + 2, Top + 4), Point(Left + 8, Top + 4), Point(Left + 5, Top + 7)])
        else
          cnv.Polygon([Point(Left + 2, Top + 7), Point(Left + 8, Top + 7), Point(Left + 5, Top + 4)]);
      OffsetRect(rCloseButton, -k, -CAPTION_WIDTH - k);
      OffsetRect(rExpandButton, -k, -CAPTION_WIDTH - k)
    end
  end
  else begin //tbLeft
    //Draw title bar
    r := Rect(k, k, CAPTION_WIDTH + k, Height - k);
    cnv.Font := Font;
    cnv.Font.Color := arrTextColors[active];
    cnv.Brush.Color := arrCaptionColors[active];
    cnv.FillRect(r);
    OffsetRect(r, k - 2, 11);
    r.Right := r.Bottom - r.Top + r.Left - 30;
    RotateFont(cnv.Font, 90);
    DrawText(cnv.Handle, PChar(Caption), Length(Caption), r, DT_END_ELLIPSIS or DT_BOTTOM or DT_SINGLELINE);

    if not fShowButtons then
    begin
      SetRectEmpty(rCloseButton);
      SetRectEmpty(rExpandButton)
    end
    else begin
      //Draw buttons
      //Draw close button
      rCloseButton := Rect(2 + k, k, 14 + k, 12 + k);
      r := rCloseButton;
      InflateRect(r, -4, -4);
      if isOverCloseButton then
      begin
        cnv.Pen.Color := clLime;
        cnv.Brush.Color := clLime;
      end
      else begin
        cnv.Pen.Color := arrTextColors[active];
        cnv.Brush.Color := arrTextColors[active];
      end;
      cnv.FillRect(r);
      //Draw expand button
      rExpandButton := Rect(2 + k, 11 + k, 14 + k, 23 + k);
      if isOverExpandButton then
      begin
        cnv.Pen.Color := clLime;
        cnv.Brush.Color := clLime;
      end
      else begin
        cnv.Pen.Color := arrTextColors[active];
        cnv.Brush.Color := arrTextColors[active];
      end;
      with rExpandButton do
        if Expanded then
          cnv.Polygon([Point(Left + 4, Top + 2), Point(Left + 4, Top + 8), Point(Left + 7, Top + 5)])
        else
          cnv.Polygon([Point(Left + 7, Top + 2), Point(Left + 7, Top + 8), Point(Left + 4, Top + 5)]);
      OffsetRect(rCloseButton, -CAPTION_WIDTH - k, -k);
      OffsetRect(rExpandButton, -CAPTION_WIDTH - k, -k)
    end
  end;

  cnv.Handle := 0;
  cnv.Free
end;

procedure TFloatingWindow.Hide;
begin
  inherited;
  isOverCloseButton := false;
  if Assigned(fOnHide) then fOnHide(self)
end;

procedure TFloatingWindow.Paint;
begin
  DrawNonClient;
  DrawClient;
end;

procedure TFloatingWindow.RotateFont(f: TFont; alpha: Integer);
var
  logFont: TLogFont;
begin
  alpha := alpha mod 360;
  if alpha < 0 then alpha := 360 + alpha;
  with logFont do
  begin
    lfHeight := f.Height;
    lfWidth := 0;
    lfEscapement := 10 * alpha;
    lfOrientation := 10 * alpha;
    if fsBold in f.Style then
      lfWeight := FW_BOLD
    else
      lfWeight := FW_NORMAL;
    lfItalic := Byte(fsItalic in f.Style);
    lfUnderline := Byte(fsUnderline in f.Style);
    lfStrikeOut := Byte(fsStrikeOut in f.Style);
    StrPCopy(lfFaceName, f.Name);
    lfCharSet := f.Charset;
    { Everything else as default }
    lfOutPrecision := OUT_DEFAULT_PRECIS;
    lfClipPrecision := CLIP_DEFAULT_PRECIS;
    lfQuality := DEFAULT_QUALITY;
    case f.Pitch of
      fpVariable: lfPitchAndFamily := VARIABLE_PITCH;
      fpFixed: lfPitchAndFamily := FIXED_PITCH;
      else
        lfPitchAndFamily := DEFAULT_PITCH;
    end;
  end;
  f.Handle := CreateFontIndirect(logFont);
end;

procedure TFloatingWindow.SetCtl3D(Value: Boolean);
begin
  inherited Ctl3D := Value;
  RecreateWnd
end;

procedure TFloatingWindow.SetExpanded(const Value: Boolean);
begin
  if fExpanded <> Value then
  begin
    fExpanded := Value;
    if fTitleBarPosition = tbTop then
    begin
      if fExpanded then Height := saveHeight
      else begin
        saveHeight := Height;
        ClientHeight := 0
      end;
    end
    else begin //tbLeft
      if fExpanded then Width := saveHeight
      else begin
        saveHeight := Width;
        ClientWidth := 0
      end;
    end;
    if Assigned(fOnExpand) then fOnExpand(self)
  end
end;

procedure TFloatingWindow.SetShowButtons(const Value: Boolean);
begin
  if fShowButtons <> Value then
  begin
    fShowButtons := Value;
    Invalidate
  end
end;

procedure TFloatingWindow.SetTitleBarPosition(const Value: TTitleBarPosition);
begin
  if fTitleBarPosition <> Value  then
  begin
    fTitleBarPosition := value;
    if Height < 33 then Height := 33;
    if Width < 105 then Width := 105;
    RecreateWnd
  end
end;

procedure TFloatingWindow.Show;
begin
  inherited;
  if Assigned(fOnShow) then fOnShow(self)
end;

procedure TFloatingWindow.WMNCCalcSize(var msg: TMessage);
const
  arrOffsets: array[Boolean] of Integer = (-1, -2);
var
  r: PRect;
begin
  inherited;
  r := PRect(msg.LParam);
  if fTitleBarPosition = tbTop then
  begin
    Inc(r^.Top, CAPTION_WIDTH);
    InflateRect(r^, arrOffsets[Ctl3D], arrOffsets[Ctl3D])
  end
  else begin //tbLeft
    Inc(r^.Left, CAPTION_WIDTH);
    InflateRect(r^, arrOffsets[Ctl3D], arrOffsets[Ctl3D])
  end
end;

procedure TFloatingWindow.WMNCHitTest(var msg: TMessage);
var
  p: TPoint;
begin
  inherited;
  if csDesigning in ComponentState then Exit;

  p := Point(msg.LParamLo, msg.LParamHi);
  p := ScreenToClient(p);
  if PtInRect(rCloseButton, p) then
  begin
    msg.Result := HTCLOSE;
    Exit;
  end
  else if PtInRect(rExpandButton, p) then
  begin
    msg.Result := HTREDUCE;
    Exit;
  end;

  if fTitleBarPosition = tbTop then
  begin
    if fSizeable then
    begin
      if p.y <= -CAPTION_WIDTH then
        if p.x < CAPTION_WIDTH then msg.Result := HTTOPLEFT
        else if p.x >= Width - CAPTION_WIDTH then msg.Result := HTTOPRIGHT
        else msg.Result := HTTOP
      else if p.y < 0 then
        msg.Result := HTCAPTION
      else if p.y >= ClientHeight then
        if p.x < CAPTION_WIDTH then msg.Result := HTBOTTOMLEFT
        else if p.x > Width - CAPTION_WIDTH then msg.Result := HTBOTTOMRIGHT
        else msg.Result := HTBOTTOM;

      if p.x <= 0 then
        if p.y < 0 then msg.Result := HTTOPLEFT
        else if p.y > ClientHeight - CAPTION_WIDTH then msg.Result := HTBOTTOMLEFT
        else msg.Result := HTLEFT
      else if p.x >= ClientWidth then
        if p.y < 0 then msg.Result := HTTOPRIGHT
        else if p.y > ClientHeight - CAPTION_WIDTH then msg.Result := HTBOTTOMRIGHT
        else msg.Result := HTRIGHT;
    end
    else if p.y < 0 then
      msg.Result := HTCAPTION
  end
  else begin //tbLeft
    if fSizeable then
    begin
      if p.x <= -CAPTION_WIDTH then
        if p.y < CAPTION_WIDTH then msg.Result := HTTOPLEFT
        else if p.y >= Height - CAPTION_WIDTH then msg.Result := HTBOTTOMLEFT
        else msg.Result := HTLEFT
      else if p.x < 0 then
        msg.Result := HTCAPTION
      else if p.x >= ClientWidth then
        if p.y < CAPTION_WIDTH then msg.Result := HTTOPRIGHT
        else if p.y > Height - CAPTION_WIDTH then msg.Result := HTBOTTOMRIGHT
        else msg.Result := HTRIGHT;

      if p.y <= 0 then
        if p.x < 0 then msg.Result := HTTOPLEFT
        else if p.x > ClientWidth - CAPTION_WIDTH then msg.Result := HTTOPRIGHT
        else msg.Result := HTTOP
      else if p.y >= ClientHeight then
        if p.x < 0 then msg.Result := HTBOTTOMLEFT
        else if p.x > ClientWidth - CAPTION_WIDTH then msg.Result := HTBOTTOMRIGHT
        else msg.Result := HTBOTTOM;
    end
    else if p.x < 0 then
      msg.Result := HTCAPTION
  end
end;

procedure TFloatingWindow.WMNCPaint(var msg: TMessage);
begin
  inherited;
  DrawNonClient
end;

procedure TFloatingWindow.WMWindowPosChanging(var msg: TWMWindowPosChanging);
const
  arrMinSize: array[Boolean] of Byte = (CAPTION_WIDTH + 2, CAPTION_WIDTH + 4);
begin
  inherited;
  if fTitleBarPosition = tbTop then
  begin
    if msg.WindowPos.cx < 105 then
      msg.WindowPos.cx := 105;
    if msg.WindowPos.cy < arrMinSize[Ctl3D] then
      msg.WindowPos.cy := arrMinSize[Ctl3D]
  end
  else begin //tbLeft
    if msg.WindowPos.cy < 33 then
      msg.WindowPos.cy := 33;
    if msg.WindowPos.cx < arrMinSize[Ctl3D] then
      msg.WindowPos.cx := arrMinSize[Ctl3D]
  end
end;

procedure TFloatingWindow.WndProc(var msg: TMessage);
var
  p: TPoint;
  b, needRedraw: Boolean;
begin
  case msg.Msg of
    WM_NCLBUTTONDBLCLK: Exit;
    WM_NCLBUTTONDOWN,
    WM_NCRBUTTONDOWN,
    WM_NCMBUTTONDOWN,
    WM_LBUTTONDOWN,
    WM_RBUTTONDOWN,
    WM_MBUTTONDOWN:
    begin
      if CanFocus then SetFocus;
      BringToFront;
      if msg.msg = WM_NCLBUTTONDOWN then
      begin
        p := Point(msg.LParamLo, msg.LParamHi);
        p := ScreenToClient(p);
        if PtInRect(rCloseButton, p) then Hide
        else if PtInRect(rExpandButton, p) then Expanded := not Expanded
      end;
    end;

    WM_NCMOUSEMOVE:
    begin
      p := Point(msg.LParamLo, msg.LParamHi);
      p := ScreenToClient(p);
      b := PtInRect(rCloseButton, p);
      needRedraw := false;
      if b <> isOverCloseButton then
      begin
        isOverCloseButton := b;
        if isOverCloseButton then isOverExpandButton := false;
        needRedraw := true;
      end;
      if not b then
      begin
        b := PtInRect(rExpandButton, p);
        if b <> isOverExpandButton then
        begin
          isOverExpandButton := b;
          if isOverExpandButton then isOverCloseButton := false;
          needRedraw := true;
        end;
      end;
      if needRedraw then DrawNonClient
    end;

    WM_MOUSEMOVE:
    begin
      if isOverCloseButton then
      begin
        isOverCloseButton := false;
        DrawNonClient
      end
      else if isOverExpandButton then
      begin
        isOverExpandButton := false;
        DrawNonClient
      end
    end;
  end;
  inherited;
end;

procedure Register;
begin
  RegisterComponents('Samples', [TFloatingWindow]);
end;

end.

