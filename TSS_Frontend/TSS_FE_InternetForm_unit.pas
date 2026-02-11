unit TSS_FE_InternetForm_unit;

{$I cef.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.Buttons,
  Vcl.ExtCtrls, uCEFChromiumCore, uCEFFMXChromium, uCEFWinControl,
  uCEFLinkedWinControlBase, uCEFChromium, uCEFWindowParent, uCEFChromiumWindow, uCEFTypes, uCEFInterfaces,
  uCEFSentinel, Vcl.Touch.Keyboard, uCEFBufferPanel, Vcl.AppEvnts;

type
  TTSS_FE_InternetForm = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Timer1: TTimer;
    ChromiumWindow1: TChromiumWindow;
    procedure WebBrowser1ShowScriptError(ASender: TObject; const AErrorLine,
      AErrorCharacter, AErrorMessage, AErrorCode, AErrorUrl: OleVariant;
      var AOut: OleVariant; var AHandled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    urlgoto:string;
    FCanClose : boolean;  // Set to True in TChromium.OnClose
    FClosing  : boolean;  // Set to True in the CloseQuery event.

    procedure Chromium_OnBeforePopup(Sender: TObject; const browser: ICefBrowser; const frame: ICefFrame; const targetUrl, targetFrameName: ustring; targetDisposition: TCefWindowOpenDisposition; userGesture: Boolean; const popupFeatures: TCefPopupFeatures; var windowInfo: TCefWindowInfo; var client: ICefClient; var settings: TCefBrowserSettings; var extra_info: ICefDictionaryValue; var noJavascriptAccess: Boolean; var Result: Boolean);

  end;

var
  TSS_FE_InternetForm: TTSS_FE_InternetForm;

implementation

{$R *.dfm}

uses
  uCEFApplication;

procedure TTSS_FE_InternetForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FCanClose := True;
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure TTSS_FE_InternetForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := FCanClose;

  if not(FClosing) then
    begin
      FClosing := True;
      Visible  := False;
    end;
end;

procedure TTSS_FE_InternetForm.FormCreate(Sender: TObject);
begin
  FCanClose := False;
  FClosing  := False;
  // The browser will load the URL in AddressEdt initially.
  ChromiumWindow1.ChromiumBrowser.DefaultURL := 'https://zwoenitzer-anzeiger.de/';
end;

procedure TTSS_FE_InternetForm.FormShow(Sender: TObject);
begin
 // For simplicity, this demo blocks all popup windows and new tabs
  ChromiumWindow1.ChromiumBrowser.OnBeforePopup := Chromium_OnBeforePopup;
  // You *MUST* call CreateBrowser to create and initialize the browser.
  // This will trigger the AfterCreated event when the browser is fully
  // initialized and ready to receive commands.
  // GlobalCEFApp.GlobalContextInitialized has to be TRUE before creating any browser
  // If it's not initialized yet, we use a simple timer to create the browser later.
  if not(ChromiumWindow1.CreateBrowser) then Timer1.Enabled := True;
end;

procedure TTSS_FE_InternetForm.Chromium_OnBeforePopup(      Sender             : TObject;
                                        const browser            : ICefBrowser;
                                        const frame              : ICefFrame;
                                        const targetUrl          : ustring;
                                        const targetFrameName    : ustring;
                                              targetDisposition  : TCefWindowOpenDisposition;
                                              userGesture        : Boolean;
                                        const popupFeatures      : TCefPopupFeatures;
                                        var   windowInfo         : TCefWindowInfo;
                                        var   client             : ICefClient;
                                        var   settings           : TCefBrowserSettings;
                                        var   extra_info         : ICefDictionaryValue;
                                        var   noJavascriptAccess : Boolean;
                                        var   Result             : Boolean);
begin
  // For simplicity, this demo blocks all popup windows and new tabs
  Result := (targetDisposition in [WOD_NEW_FOREGROUND_TAB, WOD_NEW_BACKGROUND_TAB, WOD_NEW_POPUP, WOD_NEW_WINDOW]);
end;

procedure TTSS_FE_InternetForm.SpeedButton1Click(Sender: TObject);
begin
  TSS_FE_InternetForm.close;
end;

procedure TTSS_FE_InternetForm.SpeedButton2Click(Sender: TObject);
begin
  ChromiumWindow1.LoadURL(urlgoto);
end;

procedure TTSS_FE_InternetForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if not(ChromiumWindow1.CreateBrowser) and not(ChromiumWindow1.Initialized) then Timer1.Enabled := True else ChromiumWindow1.LoadURL(urlgoto);
end;

procedure TTSS_FE_InternetForm.WebBrowser1ShowScriptError(ASender: TObject;
  const AErrorLine, AErrorCharacter, AErrorMessage, AErrorCode,
  AErrorUrl: OleVariant; var AOut: OleVariant; var AHandled: Boolean);
begin
  ahandled:=true;
end;

end.
