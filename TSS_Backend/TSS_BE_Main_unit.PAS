unit TSS_BE_Main_unit;

interface

uses
  Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin, System.ImageList,
  System.Actions, TransparentPanel;

type
  TTSS_BE_Main = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolBar1: TToolBar;
    ToolButton9: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    HelpAbout1: TAction;
    StatusBar: TStatusBar;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    Medienmanager1: TMenuItem;
    ScreenDesigner1: TMenuItem;
    Verwalten1: TMenuItem;
    Bearbeiten1: TMenuItem;
    SpeedButton21: TSpeedButton;
    N2: TMenuItem;
    KonfigurationsGenerator1: TMenuItem;
    N3: TMenuItem;
    ButtonGenerator1: TMenuItem;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Verwalten1Click(Sender: TObject);
    procedure Bearbeiten1Click(Sender: TObject);
    procedure CutItemClick(Sender: TObject);
    procedure KonfigurationsGenerator1Click(Sender: TObject);
    procedure ButtonGenerator1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TSS_BE_Main: TTSS_BE_Main;

implementation

uses TSS_BE_About_unit, TSS_BE_DataForm_unit, TSS_BE_MediaForm_unit,
  TSS_BE_ScreenDesigner_Form_unit, TSS_BE_KDVerwaltungsForm_unit,
  TSS_BE_ConfigGenForm_unit, TSS_BE_ButtonGenForm_unit;

{$R *.dfm}

procedure TTSS_BE_Main.FileNew1Execute(Sender: TObject);
begin
  { Nichts ausführen }
end;

procedure TTSS_BE_Main.FileOpen1Execute(Sender: TObject);
begin
  OpenDialog.Execute;
end;

procedure TTSS_BE_Main.FileSave1Execute(Sender: TObject);
begin
  SaveDialog.Execute;
end;

procedure TTSS_BE_Main.FormShow(Sender: TObject);
var F:TextFile;Standort,FName,SF,S2:String;
begin
  TSS_BE_DataForm.Debug:=false;
  AssignFile(F,'C:\TSS\Config\TSS_BE_Init.ini');
  Reset(f);
  readln(F,SF);
  readln(F,S2);
  S2:=copy(S2,1,pos(' ',S2)-1);
  TSS_BE_DataForm.MainPath:=s2;
  SF:=copy(SF,1,pos(' ',SF)-1);
  CloseFile(f);
  TSS_BE_Dataform.Display_id:=SF;
  StatusBar.Panels[1].Text:='D['+TSS_BE_Dataform.Display_id+']';
  Statusbar.Repaint;
  StatusBar.Panels[1].Text:='Verbinde Online Datenbank';
  Statusbar.Repaint;
  try
    TSS_BE_Dataform.TSS_FE_Connection.Connected:=false;
    TSS_BE_Dataform.TSS_FE_Connection.Connected:=true;
    StatusBar.Panels[2].Text:='Online';
  except
  end;
    if not TSS_BE_Dataform.TSS_FE_Connection.Connected then begin
      TSS_BE_Dataform.TSS_FE_Connection.Params.Values['Server']:='localhost';
      TSS_BE_Dataform.TSS_FE_Connection.Connected:=true;
      if not TSS_BE_Dataform.TSS_FE_Connection.Connected then begin
        Messagedlg('Fehler beim verbinden zu einer Datenbank !',mterror,mbOKCancel,0);
        application.terminate;
      end else StatusBar.Panels[2].Text:='Local/Offline';
    end;
  TSS_BE_Dataform.TSS_FE_DisplayConfig.Params[0].AsString:=SF;
  TSS_BE_Dataform.TSS_BE_DisplayList.Open;
  TSS_BE_Dataform.TSS_FE_DisplayConfig.Open;
  StatusBar.Panels[1].Text:='Ermittle - Standortname';
  Statusbar.Repaint;
  if TSS_BE_Dataform.TSS_FE_DisplayConfig.RecordCount=1 then begin
    Standort:=TSS_BE_Dataform.TSS_FE_DisplayConfig.FieldByName('displayname').AsString;
    TSS_BE_Dataform.Global_Schematic_id:=TSS_BE_Dataform.TSS_FE_DisplayConfig.FieldByName('Schematic_id').AsString;
    StatusBar.Panels[1].Text:='D['+TSS_BE_Dataform.Display_id+']'+'S['+TSS_BE_Dataform.Global_Schematic_id+'] / '+Standort;
    Statusbar.Repaint;
  end else begin
    StatusBar.Panels[1].Text:=TSS_BE_Dataform.Global_Schematic_id+' / Fehler: unbekannt';
    Statusbar.Repaint;
  end;
end;

procedure TTSS_BE_Main.Bearbeiten1Click(Sender: TObject);
begin
  TSS_BE_ScreenDesigner_Form.showmodal;
end;

procedure TTSS_BE_Main.ButtonGenerator1Click(Sender: TObject);
begin
  TSS_BE_ButtonGenForm.showmodal;
end;

procedure TTSS_BE_Main.CutItemClick(Sender: TObject);
begin
  KDVerwaltungsform.TSS_BE_KundenTable.close;
  KDVerwaltungsform.TSS_BE_KundenTable.Open;
  KDVerwaltungsform.showmodal;
end;

procedure TTSS_BE_Main.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TTSS_BE_Main.HelpAbout1Execute(Sender: TObject);
begin
  TSS_BE_About.ShowModal;
end;

procedure TTSS_BE_Main.KonfigurationsGenerator1Click(Sender: TObject);
begin
  TSS_BE_ConfigGenForm.showmodal;
end;

procedure TTSS_BE_Main.Verwalten1Click(Sender: TObject);
begin
  TSS_BE_MEdiaform.show;
end;

end.
