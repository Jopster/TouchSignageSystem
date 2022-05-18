unit TSS_FE_LoadScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.StdCtrls,TSS_ButtonClass_unit,TSS_DisplayClass_unit, Vcl.Imaging.jpeg;

const
  MONITOR_ON      = -1;
  MONITOR_OFF     =  2;
  MONITOR_STANDBY =  1;

type
  TMainForm = class(TForm)
    Timer1: TTimer;
    EndTimer: TTimer;
    Timer2: TTimer;
    ListBox1: TListBox;
    ImgPanel: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure EndTimerTimer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
    FName:String;
  public
    { Public-Deklarationen }
    function checkFile(RootPath,FilePath,Filename:String):string;
    procedure CreateSchematicFile;
    procedure AddToSchematicFile(Id,Value:string);
    function getFromSchematicFile(Id,DefValue:string):string;
    procedure CloseSchematicFile;
    procedure OpenSchematicFile;
    function DisplayExistSection(FileID,Section:String):boolean;
    function DisplayExistSectionValueStr(FileID,Section,ID:String):string;
  end;

var
  MainForm: TMainForm;
  Schemafile : Textfile;

implementation

{$R *.dfm}

uses TSS_FE_DataForm, TSS_FE_MainScreen, TSS_FE_SetupForm, TSS_FE_SyncMediaForm,
  TSS_BE_FTPForm_unit, TSS_FE_BlackoutForm_unit,ShellAPi, system.inifiles;


procedure DeleteOldLogFiles(PAth:string;days : integer = 7);
var
  fileDate : TDateTime;
  TSr : TStrings;
  res : TStrings;
  i : integer;
begin
 res := TStringList.Create;
// FindFirst(Path,faAnyFile,res);
//  for i := 0 to (res.count - 1) do
//    begin
//      fileDate := FileDateToDateTime(FileAge(res.Strings[i]));
//      if (Now - fileDate) > days then DeleteFile(res.Strings[i]);
//    end;
 res.Free;
end;



procedure TMainForm.AddToSchematicFile(Id, Value: string);
begin
  Writeln(Schemafile,ID+':'+Value);
end;

function TMainForm.checkFile(RootPath,FilePath,Filename: String): string;
begin
  if fileexists(RootPath+FilePath+'\'+Filename) then result:=RootPath+FilePath+'\'+Filename else begin
    MainDisplayForm.ReqFiles.Items.Add(RootPath+FilePath+'\'+Filename);
    if TSS_BE_FTPForm.Loadfile(FilePath,Filename,RootPath+FilePath+'\',Filename,'','','',1,1,False) then Result:=RootPath+FilePath+'\'+Filename else Result:=RootPath+'\download.jpg';
  end;
end;

procedure TMainForm.CloseSchematicFile;
begin
  CloseFile(Schemafile);
  if FileExists(DataForm.SchematicFile) then begin
    if FileExists(DataForm.SchematicFile+'~t') then deletefile(DataForm.SchematicFile+'~t');
    RenameFile(DataForm.SchematicFile,DataForm.SchematicFile+'~t')
  end;
  if FileExists(DataForm.SchematicFile+'~') then begin
    RenameFile(DataForm.SchematicFile+'~',DataForm.SchematicFile)
  end;
end;

procedure TMainForm.CreateSchematicFile;
begin
  if not DirectoryExists(ExtractFilePath(DataForm.SchematicFile)) then CreateDir(ExtractFilePath(DataForm.SchematicFile));
  AssignFile(Schemafile,DataForm.SchematicFile+'~');
  Rewrite(Schemafile);
end;

procedure TMainForm.EndTimerTimer(Sender: TObject);
var a:worD;
begin
  EndTimer.Enabled:=false;
  Timer2.Enabled:=falsE;
  BlackoutForm.hide;
  MainDisplayForm.StartCEnterVideo;
  MainDisplayForm.CheckWorkTimer.Enabled:=true;
  MainForm.FormStyle:=fsNormal;
  MainForm.SendToBack;
  MainDisplayForm.ShowModal;
  if (MainDisplayform.closeCommand='REFRESH') then begin
    ListBox1.Items.Add('Reset angefordert ! - Entferne Felder');
    a:=0;
    repeat
      if MainDisplayForm.Components[a].ClassName='TTSS_Button' then begin
        ListBox1.Items.Add('            Delete - '+TTSS_Button(MainDisplayForm.Components[a]).KundenName);
        MainDisplayForm.Components[a].Free;
      end else
      if MainDisplayForm.Components[a].ClassName='TTSS_Display' then begin
        ListBox1.Items.Add('            Delete - Display ');
        MainDisplayForm.Components[a].Destroy;
      end else inc(a);
    until a=MainDisplayForm.ComponentCount;
    ListBox1.Items.Add('                    - Starte Erstellung neu');
    Timer1.Enabled:=true;
  end else Mainform.Close;
end;


procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  ImgPanel.Align:=alClient;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  BlackoutForm.show;
  BlackoutForm.Width:=screen.Width;
  BlackoutForm.Height:=screen.Height;
  BlackoutForm.top:=0;
  BlackoutForm.left:=0;
  Mainform.BringToFront;
end;

function TMainForm.getFromSchematicFile(Id, DefValue: string): string;
var sf:Textfile;found:boolean;s,ids,idv,str1:String;
    IniPl:TIniFile;
begin
  assignfile(sf,Dataform.SchematicFile);
  Reset(sf);
  readln(sf,str1);
  closefile(sf);
  if str1<>'[Common]' then begin
    assignfile(sf,Dataform.SchematicFile);
    Reset(sf);
    found:=false;
    repeat
      readln(sf,s);
      if lengtH(s)>0 then begin
        ids:=copy(s,1,pos(':',s)-1);
        if ids=id then begin
          idv:=s;
          delete(idv,1,length(ids)+1);
          found:=true;
        end;
      end;
    until eof(sf) or found;
  end else begin
    IniPl:=TInifile.Create(Dataform.SchematicFile);
    idv:=IniPl.ReadString('Common',ID,DefValue);
    if idv<>DefValue then found:=true;
  end;
  if not found then getFromSchematicFile:=DefValue else getFromSchematicFile:=idv;
end;

procedure TMainForm.Image1DblClick(Sender: TObject);
begin
  ImgPanel.Hide;
end;


procedure TMainForm.OpenSchematicFile;
begin
  assignfile(Schemafile,Dataform.SchematicFile);
  Reset(Schemafile);
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var ST,T2:Boolean;
begin
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  ImgPanel.Show;
end;

function DelDir(dir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_DELETE;
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
    pFrom  := PChar(dir + #0);
  end;
  Result := (0 = ShFileOperation(fos));
end;

function TMainForm.DisplayExistSection(FileID,Section:String):boolean;
var F:textfile;Readstring:string;
    IniPl:TIniFile;
begin
  AssignFile(F,FileId);
  Reset(f);
  Readln(f,Readstring);
  Closefile(f);
  if readstring='MainDisplay' then begin
    AssignFile(F,FileId);
    Reset(f);
    Readln(f,Readstring);
    Closefile(f);
    result:=true;
  end else begin
    IniPl:=TInifile.Create(FileId);
    if IniPl.ReadInteger(Section,'IDTag',0)>0 then result:=true else result:=false;
  end;
end;

function TMainForm.DisplayExistSectionValueStr(FileID,Section,ID:String):string;
var F:textfile;Readstring:string;
    IniPl:TIniFile;
begin
  AssignFile(F,FileId);
  Reset(f);
  Readln(f,Readstring);
  Closefile(f);
  if readstring='MainDisplay' then begin
    AssignFile(F,FileId);
    Reset(f);
    Readln(f,Readstring);
    Closefile(f);
    result:='';
  end else begin
    IniPl:=TInifile.Create(FileId);
    Result:=IniPl.ReadString(Section,ID,'');
  end;
end;


procedure TMainForm.Timer1Timer(Sender: TObject);
var buttoncount,Fileid,a,b:word;F:TextFile;UPdID,buttonFname,Standort,FName,SF,S2,FPfad:String;Sh:TTSS_Button;Fixdisplay,display:TTSS_Display;NewUpdateID,OrgP:string;runOffline:boolean;
    IniPl:TInifile;
    wndTaskbar: HWND;

begin
  Timer1.Enabled:=false;
  MainDisplayForm.Allowclick:=true;
  DataForm.finished:=false;
  DataForm.dnsHost:='logumedia.de';
  MainDisplayForm.ReqFiles.Clear;
  MaindisplayForm.SpeedButton2.hide;
  Timer2.Enabled:=true;
  ProgressBar1.Position:=1;
  AssignFile(F,Paramstr(0)[1]+':\TSS\Config\TSS_FE_Init.ini');
  Reset(f);
  readln(F,SF);
  CloseFile(f);
  if SF<>'[Common]' then begin
    AssignFile(F,Paramstr(0)[1]+':\TSS\Config\TSS_FE_Init.ini');
    Reset(f);
    readln(F,S2);
    SF:=copy(SF,1,pos(' ',SF)-1);
    DataForm.DisplayID:=SF;
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    DataForm.MainPath:=s2;
    DataForm.CenterVideoFile:=s2+'SchemaTemp\'+sf+'.DSCV';
    DataForm.SchematicFile:=s2+'SchemaTemp\'+sf+'.DSCH';
    DataForm.DisplayFile:=s2+'SchemaTemp\'+sf+'.DDIS';
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    DataForm.ButtonsAktiv:=(s2='TRUE');
    ListBox1.Items.Add('Ermittle - DisplayID');
    Listbox1.Repaint;
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    if s2<>'' then BlackoutForm.Image2.Picture.LoadFromFile(DataForm.MainPath+S2);
    BlackoutForm.Image2.Repaint;
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    DataForm.Update_id:=s2;
    readln(F,S2);
    S2:=copy(S2,1,pos(' ',S2)-1);
    DataForm.OnlineRun:=(s2='TRUE');
    CloseFile(f);
  end else
  if SF='[Common]' then begin
    IniPl:=TInifile.Create(Paramstr(0)[1]+':\TSS\Config\TSS_FE_init.ini');
    DataForm.DisplayID:=IniPl.ReadString('Common','SchematicID','');
    DataForm.Update_id:=IniPl.ReadString('Common','UpdateID','');
    DataForm.Debugmode:=IniPl.ReadBool('Debug','Debugmode',False);
    DataForm.MaxLogSize:=IniPl.ReadInteger('Debug','MaxLogSize',10000000);
    MainDisplayForm.DebugLed.LedOn:=DataForm.Debugmode;
    DataForm.DisplayScreen:=IniPl.ReadInteger('Common','DisplayScreen',1)-1;
    MainForm.Left:=Screen.Monitors[DataForm.DisplayScreen].Left;
    MainForm.top:=Screen.Monitors[DataForm.DisplayScreen].top;
    MainForm.width:=Screen.Monitors[DataForm.DisplayScreen].Width;
    MainForm.Height:=Screen.Monitors[DataForm.DisplayScreen].Height;
    MainForm.Resize;
    MainDisplayForm.Left:=Screen.Monitors[DataForm.DisplayScreen].Left;
    MainDisplayForm.top:=Screen.Monitors[DataForm.DisplayScreen].top;
    MainDisplayForm.width:=Screen.Monitors[DataForm.DisplayScreen].Width;
    MainDisplayForm.Height:=Screen.Monitors[DataForm.DisplayScreen].Height;
    MainDisplayForm.Repaint;
    DataForm.MainPath:=IniPl.ReadString('Common','BasePath','');
    DataForm.CenterVideoFile:=DataForm.MainPath+'SchemaTemp\'+DataForm.DisplayID+'.DSCV';
    DataForm.SchematicFile:=DataForm.MainPath+'SchemaTemp\'+DataForm.DisplayID+'.DSCH';
    DataForm.DisplayFile:=DataForm.MainPath+'SchemaTemp\'+DataForm.DisplayID+'.DDIS';
    DataForm.OnlineRun:=IniPl.ReadBool('Common','OnlineSystem',False);
    DataForm.ButtonsAktiv:=IniPl.ReadBool('Common','ButtonsActive',False);
//    Edit4.text:=IniPl.ReadString('Remote','HomeServer','');
//    Edit7.text:=IniPl.ReadString('Debug','Loglevel','');
    if IniPl.ReadString('Design','BlackoutImage','')<>'' then BlackoutForm.Image2.Picture.LoadFromFile(DataForm.MainPath+IniPl.ReadString('Design','BlackoutImage',''));
//    Edit6.text:=IniPl.ReadString('Design','LoadImage','');
//    Edit5.text:=IniPl.ReadString('Design','PartnerImage','');
    Dataform.specialContent:=IniPl.ReadBool('Design','SpecialContent',False);
    Dataform.specialContentTyp:=0;
    if IniPl.ReadBool('SpecialContent','IsGallery',False) then Dataform.specialContentTyp:=1;
    if IniPl.ReadBool('SpecialContent','IsInteractive',False) then Dataform.specialContentTyp:=2;
    Dataform.specialContentID:=IniPl.ReadString('SpecialContent','ContentID','');
  end;
  if not Dataform.Debugmode then begin
    wndTaskbar := FindWindow('Shell_TrayWnd', nil);
    if wndTaskbar <> 0 then begin
      EnableWindow(wndTaskbar, False); // Disable the taskbar
//    EnableWindow(wndTaskbar, True); // Enable the taskbar
      ShowWindow(wndTaskbar, SW_HIDE); // Taskbar vertecken
//    ShowWindow(wndTaskbar, SW_SHOW); // Taskbar anzeigen
    end;
  end else begin
    wndTaskbar := FindWindow('Shell_TrayWnd', nil);
    if wndTaskbar <> 0 then begin
      EnableWindow(wndTaskbar, True); // Enable the taskbar
      ShowWindow(wndTaskbar, SW_SHOW); // Taskbar anzeigen
    end;
  end;
  DeleteOldLogFiles(Paramstr(0)[1]+':\TSS\Screens\',7);
  OrgP:=Dataform.MainPath;
  delete(Orgp,lengtH(orgp),1);
  if DirectoryExists(OrgP+'_UPD') then begin
    if DirectoryExists(OrgP+'_TMP') then DelDir(OrgP+'_TMP');
    if RenameFile(Orgp,OrgP+'_TMP') then begin
      if RenameFile(OrgP+'_UPD\WebTemp',OrgP) then begin
        assignfile(f,OrgP+'_UPD\TSSFE_Update.UPD');
        reset(f);
        readln(f,UPdID);
        closefile(f);
        DataForm.UpdateCfg('C:\TSS\Config\TSS_FE_Init.ini',7,UPdID+' !UpdateID');
        DelDir(OrgP+'_UPD');
      end;
    end;
  end;
  DataForm.writeDBLog('PRG_START','ProgrammStart - Einrichtung Schema DisplayID : '+dataform.DisplayID,'',2);
  SetupForm.Edit1.Text:=dataform.DisplayID;
  ListBox1.Items.Add('DisplayID : '+dataform.DisplayID);
  Listbox1.Repaint;
  ListBox1.Items.Add('Verbinde Online Datenbank');
  Listbox1.Repaint;
  if (not Dataform.SystemOffline) and (DataForm.OnlineRun) then begin
    DataForm.writeDBLog('PRG_START_RUN','ProgrammStart - Online Modus','',2);
    Dataform.TSS_FE_Connection.Connected:=false;
    Dataform.TSS_FE_Connection.Connected:=true;
    ListBox1.Items.Add('--- ONLINE ----');
    DataForm.TSS_FE_DisplayConfig.Params[0].AsString:=dataform.DisplayID;
    DataForm.TSS_FE_DisplayList.Open;
    DataForm.TSS_FE_DisplayConfig.Open;
    ListBox1.Items.Add('Ermittle - Standortname');
    Listbox1.Repaint;
    CreateSchematicFile;
    if DataForm.TSS_FE_DisplayConfig.RecordCount=1 then begin
      Standort:=DataForm.TSS_FE_DisplayConfig.FieldByName('displayname').AsString;
      NewUpdateID:=DataForm.TSS_FE_DisplayConfig.FieldByName('Updateid').AsString;
      AddToSchematicFile('DisplayName',DataForm.TSS_FE_DisplayConfig.FieldByName('displayname').AsString);
      DataForm.Global_Schematic_id:=DataForm.TSS_FE_DisplayConfig.FieldByName('schematic_id').AsString;
      AddToSchematicFile('SchematicID',DataForm.TSS_FE_DisplayConfig.FieldByName('schematic_id').AsString);
      ListBox1.Items.Add('Standortname : '+Standort);
      ListBox1.Items.Add('DisplaySchema : '+DataForm.Global_Schematic_id);
      Listbox1.Repaint;
      ListBox1.Items.Add('Ermittle - Standortname');
      Listbox1.Repaint;
      if NewUpdateID<>DataForm.Update_id then begin
        DataForm.writeDBLog('PRG_START_UPD','ProgrammStart - Online Modus - Update Buttons/Videos','',2);
        DataForm.TSS_FE_SchematicData.Close;
        DataForm.TSS_FE_SchematicData.Params[0].AsString:=DataForm.Global_Schematic_id;
        DataForm.TSS_FE_SchematicData.Open;
        AddToSchematicFile('Buttons',inttostr(DataForm.TSS_FE_SchematicData.RecordCount));
        if DataForm.TSS_FE_SchematicData.RecordCount>0 then begin
          ListBox1.Items.Add('Gefundene Felder : '+inttostr(DataForm.TSS_FE_SchematicData.RecordCount));
          Listbox1.Repaint;
          DataForm.TSS_FE_SchematicData.first;
          repeat
            ListBox1.Items.Add(DataForm.TSS_FE_SchematicData.FieldByName('Feld_name').AsString);
            Listbox1.Repaint;
            DataForm.TSS_FE_SchematicData.Next;
          until (DataForm.TSS_FE_SchematicData.Eof);
          ListBox1.Items.Add('Erzeuge Felder :');
          Listbox1.Repaint;
          DataForm.TSS_FE_SchematicData.first;
          b:=0;
          repeat
            b:=b+1;
            AddToSchematicFile('Button'+inttostr(b),DataForm.TSS_FE_SchematicData.FieldByName('Feld_uuid').AsString);
            FName:=DataForm.TSS_FE_SchematicData.FieldByName('Feld_name').AsString;
            DataForm.writeDBLog('PRG_START_UPD','Update Feld : '+DataForm.TSS_FE_SchematicData.FieldByName('Feld_uuid').AsString+' '+FName,'',2);
            ListBox1.Items.Add(FName);
            Listbox1.Repaint;
            if DataForm.TSS_FE_SchematicData.FieldByName('feld_typ').AsInteger=0 then begin
              sh:=TTSS_Button.Create(MainDisplayform);
              sh.BGColor:=clwhite;
              sh.FeldName:=FName;
              sh.Name:='FButton_'+FName;
              sh.Buttonid:=DataForm.TSS_FE_SchematicData.FieldByName('feld_uuid').asstring;
              sh.Left:=(DataForm.TSS_FE_SchematicData.FieldByName('posx').AsInteger-1)*DataForm.TSS_FE_SchematicData.FieldByName('basesizex').AsInteger;
              sh.top:=(DataForm.TSS_FE_SchematicData.FieldByName('posy').AsInteger-1)*DataForm.TSS_FE_SchematicData.FieldByName('basesizey').AsInteger;
              sh.Width:=DataForm.TSS_FE_SchematicData.FieldByName('sizex').AsInteger*DataForm.TSS_FE_SchematicData.FieldByName('basesizex').AsInteger;
              sh.Height:=DataForm.TSS_FE_SchematicData.FieldByName('sizey').AsInteger*DataForm.TSS_FE_SchematicData.FieldByName('basesizex').AsInteger;
              sh.Tag:=DataForm.TSS_FE_SchematicData.FieldByName('feld_id').asinteger;
              sh.InfoBox:=ListBox1;
              sh.OnMouseup:=MainDisplayForm.MyMouseUp;
              ListBox1.Items.Add('  '+inttostr(sh.Tag));
              Listbox1.Repaint;
              sh.Parent:=MainDisplayForm;
              // sh.hParent:=sh;
              sh.KundenName :=DataForm.TSS_FE_SchematicData.FieldByName('kunden_name_1').asstring;
              ListBox1.Items.Add('  '+sh.KundenName);
              Listbox1.Repaint;
              sh.KundenName2:=DataForm.TSS_FE_SchematicData.FieldByName('kunden_name_2').asstring;
              sh.KundenStrasse:=DataForm.TSS_FE_SchematicData.FieldByName('kunden_strasse').asstring+' '+DataForm.TSS_FE_SchematicData.FieldByName('kunden_hausnr').asstring;
              sh.KundenPLZOrt:=DataForm.TSS_FE_SchematicData.FieldByName('kunden_PLZ').asstring+' '+DataForm.TSS_FE_SchematicData.FieldByName('kunden_Ort').asstring;
              sh.ButtonActive:=(DataForm.TSS_FE_SchematicData.FieldByName('button_Active').asboolean);
              sh.ButtonActionInActive:=DataForm.TSS_FE_SchematicData.FieldByName('button_action_inActiveclick').asinteger;
              sh.ButtonActionActive:=DataForm.TSS_FE_SchematicData.FieldByName('button_action_Activeclick').asinteger;
              sh.ButtonAction_Video_PlaylistID:=DataForm.TSS_FE_SchematicData.FieldByName('click_playlist_id').asstring;
              sh.ButtonAction_Gallerie_ID:=DataForm.TSS_FE_SchematicData.FieldByName('click_gallery_id').asstring;
              DataForm.TSS_FE_AlgQuery.Close;
              if (sh.ButtonActive) and (sh.ButtonActionActive<2) then begin
                DataForm.TSS_FE_AlgQuery.SQL.Text:='Select * from logumedia.playlists where playlist_uid='''+sh.ButtonAction_Video_PlaylistID+''';';
                DataForm.TSS_FE_AlgQuery.open;
                if Dataform.TSS_FE_AlgQuery.RecordCount>=1 then begin
                  sh.ButtonAction_VideoID:=DataForm.TSS_FE_AlgQuery.FieldByName('playlist_media_id').AsInteger;
                end else begin
                  sh.ButtonActionActive:=5;
                end;
                DataForm.TSS_FE_AlgQuery.Close;
                DataForm.TSS_FE_AlgQuery.sql.Text:='Select * from playlists where playlist_uid='''+sh.ButtonAction_Video_PlaylistID+''';';
                DataForm.TSS_FE_AlgQuery.open;
                if DataForm.TSS_FE_AlgQuery.RecordCount=1 then begin
                  Fileid:=DataForm.TSS_FE_AlgQuery.FieldByName('playlist_media_id').Asinteger;
                  DataForm.TSS_FE_AlgQuery.Close;
                  DataForm.TSS_FE_AlgQuery.sql.Text:='Select * from media where media_id='+inttostr(Fileid)+';';
                  DataForm.TSS_FE_AlgQuery.open;
                  if DataForm.TSS_FE_AlgQuery.RecordCount=1 then begin
                    sh.ClickPlayListCount:=1;
                    sh.ClickPlayListFileName:=DataForm.TSS_FE_AlgQuery.FieldByName('media_file').Asstring;
                    sh.ClickPlayListKundenuid:=DataForm.TSS_FE_AlgQuery.FieldByName('kunden_uid').Asstring;
                    sh.ClickPlayListGalleryid:=DataForm.TSS_FE_AlgQuery.FieldByName('gallery_uid').Asstring;
                    sh.ClickPlayListZuordnung:=DataForm.TSS_FE_AlgQuery.FieldByName('zuordnung_typ').Asstring;
                  end else begin
                    Sh.ClickPlayListCount:=0;
                  end;
                end else begin
                  Sh.ClickPlayListCount:=0;
                end;
              end;
              if (sh.ButtonActive) and (sh.ButtonActionActive=2) then begin
                Sh.GallerieID:=DataForm.TSS_FE_SchematicData.FieldByName('click_gallery_id').asstring;
                DataForm.TSS_FE_AlgQuery2.Close;
                DataForm.TSS_FE_AlgQuery2.sql.Text:='select m.* from logumedia.media m where gallery_uid='''+Sh.GallerieID+''';';
                DataForm.TSS_FE_AlgQuery2.open;
                if DataForm.TSS_FE_AlgQuery2.recordcount>1 then begin
                  DataForm.TSS_FE_AlgQuery2.first;
                  repeat
                    Sh.GalerieFiles.add(DataForm.TSS_FE_AlgQuery2.FieldByName('media_file').Asstring);
                    DataForm.TSS_FE_AlgQuery2.next;
                  until DataForm.TSS_FE_AlgQuery2.eof;
                end;
              end;
              ListBox1.Items.Add('  '+'Lade ButtonBild ');
              Listbox1.Repaint;
              DataForm.TSS_FE_MediaData.Close;
              sh.button_media_id:=DataForm.TSS_FE_SchematicData.FieldByName('button_media_id').asinteger;
              if DataForm.TSS_FE_SchematicData.FieldByName('button_media_id').asinteger>0 then begin
                DataForm.TSS_FE_MediaData.Params[0].asinteger:=DataForm.TSS_FE_SchematicData.FieldByName('button_media_id').asinteger;
                DataForm.TSS_FE_MediaData.Open;
                sh.media_typ:=DataForm.TSS_FE_MediaData.FieldByName('media_typ').Asinteger;
                if DataForm.TSS_FE_MediaData.FieldByName('media_typ').Asinteger>100 then Begin
                  ListBox1.Items.Add('    '+'WEB : '+DataForm.TSS_FE_MediaData.FieldByName('media_file').asstring);
                  Listbox1.Repaint;
                  sh.zuordnung_typ:=DataForm.TSS_FE_MediaData.FieldByName('zuordnung_typ').Asinteger;
                  if DataForm.TSS_FE_MediaData.FieldByName('zuordnung_typ').Asinteger=20 then Begin
                    FPfad:=DataForm.TSS_FE_MediaData.FieldByName('kunden_uid').asstring;
                  End else begin
                    FPfad:=DataForm.Global_Schematic_id;
                  end;
                  FName:=checkFile(Dataform.MainPath,FPfad,DataForm.TSS_FE_MediaData.FieldByName('media_file').asstring);
                  ListBox1.Items.Add('      '+FName);
                  DataForm.writeDBLog('PRG_START_NFO','Kunde - ButtonBild '+FName,'',2);
                  Label1.Caption:=FName;
                  LAbel1.Repaint;
                  Self.Repaint;
                  sh.LoadButtonImage(FName)
                End;
              end else begin
                Sh.DisplayAdress;
                DataForm.writeDBLog('PRG_START_NFO','Kunde - Kein ButtonBild','',2);
                ListBox1.Items.Add('    '+'Kein ButtonBild ');
                Listbox1.Repaint;
              end;
              sh.SaveButton(DataForm.MainPath+'SchemaTemp\'+sh.Buttonid+'.BDTA');
              DataForm.TSS_FE_Playlists.Close;
              DataForm.TSS_FE_Playlists.Params[0].AsString:=DataForm.TSS_FE_SchematicData.FieldByName('feld_uuid').asstring;
              DataForm.TSS_FE_Playlists.open;
              if DataForm.TSS_FE_Playlists.RecordCount>0 then begin
                ListBox1.Items.Add('    '+'CenterVideos - '+inttostr(DataForm.TSS_FE_Playlists.RecordCount));
                DataForm.TSS_FE_Playlists.First;
                repeat
                  FName:=checkFile(Dataform.MainPath,DataForm.Global_Schematic_id,DataForm.TSS_FE_Playlists.FieldByName('media_file').asstring);
                  ListBox1.Items.Add('      '+FName);
                  MainDisplayForm.CenterVideos.items.Add(FName);
                  DataForm.TSS_FE_Playlists.next;
                until DataForm.TSS_FE_Playlists.eof;
              end else begin
                ListBox1.Items.Add('    '+'Kein CenterVideo');
              end;
            end else
            if DataForm.TSS_FE_SchematicData.FieldByName('feld_typ').AsInteger=1 then begin
              display:=TTSS_Display.Create(MainDisplayform);
              display.initDisplay(2);
              display.BGColor:=clgreen;
              display.Name:='MainDisplay';
              display.Left:=(DataForm.TSS_FE_SchematicData.FieldByName('posx').AsInteger-1)*DataForm.TSS_FE_SchematicData.FieldByName('basesizex').AsInteger;
              display.top:=(DataForm.TSS_FE_SchematicData.FieldByName('posy').AsInteger-1)*DataForm.TSS_FE_SchematicData.FieldByName('basesizey').AsInteger;
              display.Width:=DataForm.TSS_FE_SchematicData.FieldByName('sizex').AsInteger*DataForm.TSS_FE_SchematicData.FieldByName('basesizex').AsInteger;
              display.Height:=DataForm.TSS_FE_SchematicData.FieldByName('sizey').AsInteger*DataForm.TSS_FE_SchematicData.FieldByName('basesizex').AsInteger;
              display.Tag:=DataForm.TSS_FE_SchematicData.FieldByName('feld_id').asinteger;
              display.OnMouseup:=MainDisplayForm.MyDisplayMouseUp;
              //ListBox1.Items.Add('    Display : '+inttostr(sh.Tag));
              Listbox1.Repaint;
              display.Parent:=MainDisplayForm;
              display.OnVideoEnd:=MainDisplayForm.myVideoEnd;
              MainDisplayForm.DisplayPanel:=display;
              DataForm.TSS_FE_Playlists.Close;
              DataForm.TSS_FE_Playlists.Params[0].AsString:=DataForm.TSS_FE_SchematicData.FieldByName('feld_uuid').asstring;
              DataForm.TSS_FE_Playlists.open;
              if DataForm.TSS_FE_Playlists.RecordCount>0 then begin
                ListBox1.Items.Add('    '+'Main CenterVideos - '+inttostr(DataForm.TSS_FE_Playlists.RecordCount));
                DataForm.TSS_FE_Playlists.First;
                repeat
                  FName:=checkFile(Dataform.MainPath,DataForm.Global_Schematic_id,DataForm.TSS_FE_Playlists.FieldByName('media_file').asstring);
                  DataForm.writeDBLog('PRG_START_NFO','Kunde - Add CenterVideo '+FName,'',2);
                  ListBox1.Items.Add('      '+FName);
                  MainDisplayForm.CenterVideos.items.Add(FName);
                  DataForm.TSS_FE_Playlists.next;
                until DataForm.TSS_FE_Playlists.eof;
              end else begin
                ListBox1.Items.Add('    '+'Kein Main CenterVideo');
                DataForm.writeDBLog('PRG_START_NFO','Kunde - Kein Main CenterVideo','',2);
              end;
              display.SaveDisplay(Dataform.DisplayFile);
            end;
            ProgressBar1.Position:=ProgressBar1.position+1;
            ProgressBar1.Repaint;
            DataForm.TSS_FE_SchematicData.Next;
          until (DataForm.TSS_FE_SchematicData.Eof);
          CloseSchematicFile;
          MainDisplayForm.CenterVideos.Items.SaveToFile(Dataform.CenterVideoFile);
        end else begin
          DataForm.writeDBLog('PRG_START_ERR','Keine Felder in der Schematic gefunden!','',2);
          ListBox1.Items.Add('Keine Felder in der Schematic gefunden!');
          Listbox1.Repaint;
          Timer1.Enabled:=false;
          timer2.Enabled:=false;
          ProgressBar1.Position:=100;
          ProgressBar1.BarColor:=clred;
          ProgressBar1.Repaint;
        end;
        ProgressBar1.Position:=ProgressBar1.Max-2;
        MainDisplayForm.LogCopy.items:=Listbox1.items;
        if MainDisplayForm.DisplayPanel = nil then begin
          MessageDlg('fehlerhafte  Configuration ! - Kein Displaypanel gefunden ',mtError,mbOKCancel,0);
          Application.Terminate;
        end;
        if MainDisplayForm.DisplayPanel <> nil then MainDisplayForm.DisplayPanel.CurrentPlayPos:=0;
        for a := 1 to 30 do MainDisplayForm.mixplaylist;
        MainDisplayForm.DisplayPanel.FileList:=MainDisplayForm.CenterVideos.Items;
        DataForm.writeDBLog('PRG_START_FIN','ProgrammStart - Einrichtung fertig !','',2);
        Endtimer.Interval:=2000;
        EndTimer.Enabled:=true;
        runOffline:=False;
        DataForm.UpdateCfg('C:\TSS\Config\TSS_FE_Init.ini',7,NewUpdateID+' !UpdateID');
      end else begin
        DataForm.writeDBLog('PRG_START_RUN','ProgrammStart - Online Modus - Update nicht nötig -> Offline lesen','',2);
        runOffline:=true;
      end;
    end else begin
      DataForm.writeDBLog('PRG_START_ERR','Fehler beim Lesen des Standortes !','',2);
      ListBox1.Items.Add('Fehler beim Lesen des Standortes !');
      Listbox1.Repaint;
      Timer1.Enabled:=false;
      timer2.Enabled:=false;
      ProgressBar1.Position:=100;
      ProgressBar1.BarColor:=clred;
      ProgressBar1.Repaint;
    end;
  end else begin
    runOffline:=true;
  end;
  if runOffline then begin
    DataForm.writeDBLog('PRG_START_RUN','ProgrammStart - Offline Modus','',2);
    ListBox1.Items.Add('--- OFFLINE ----');
    Standort:=getFromSchematicFile('DisplayName','');
    ListBox1.Items.Add('Ermittle - Standortname');
    Listbox1.Repaint;
    DataForm.Global_Schematic_id:=getFromSchematicFile('SchematicID','');
    ListBox1.Items.Add('Standortname : '+Standort);
    ListBox1.Items.Add('DisplaySchema : '+DataForm.Global_Schematic_id);
    display:=TTSS_Display.Create(MainDisplayform);
    display.BGColor:=clgreen;
    display.LoadDisplay(Dataform.DisplayFile,'MainDisplay');
    display.OnMouseup:=MainDisplayForm.MyDisplayMouseUp;
    ListBox1.Items.Add('    Display : '+inttostr(display.Tag));
    Listbox1.Repaint;
    display.Parent:=MainDisplayForm;
    display.OnVideoEnd:=MainDisplayForm.myVideoEnd;
    MainDisplayForm.DisplayPanel:=display;
    buttoncount:=strtoint(getFromSchematicFile('Buttons','0'));
    DataForm.writeDBLog('PRG_START_RUN','ProgrammStart - Lese Buttons !',inttostr(buttoncount),2);
    for b:=1 to buttoncount do begin
      buttonFname:=getFromSchematicFile('Button'+inttostr(b),'');
      if buttonFname<>'' then begin
       if fileexists(DataForm.MainPath+'SchemaTemp\'+buttonFname+'.BDTA') then begin
        sh:=TTSS_Button.Create(MainDisplayform);
        sh.BGColor:=clwhite;
        sh.InfoBox:=ListBox1;
        sh.OnMouseup:=MainDisplayForm.MyMouseUp;
        Label1.Caption:=DataForm.MainPath+'SchemaTemp\'+buttonFname+'.BDTA';
        LAbel1.Repaint;
        Self.Repaint;
        sh.LoadButton(DataForm.MainPath+'SchemaTemp\'+buttonFname+'.BDTA');
        sh.BtnPopup:=MainDisplayForm.PopupMenu1;
        if DataForm.Debugmode then begin
          sh.Hint:=sh.Buttonid+#13#10+Sh.ButtonimgFilename;
          sh.EBGImage.Hint:=sh.Hint;
          sh.ShowHint:=true;
          sh.EBGImage.ShowHint:=true;
        end else begin
          sh.ShowHint:=false;
          sh.EBGImage.ShowHint:=False;
        end;
        ListBox1.Items.Add('  '+inttostr(sh.Tag));
        Listbox1.Repaint;
        sh.Parent:=MainDisplayForm;
        if (sh.button_media_id>0) and (sh.ButtonimgFilename<>'') then begin
          if sh.media_typ>100 then Begin
            Label1.Caption:=sh.ButtonimgFilename;
            LAbel1.Repaint;
            Self.Repaint;
            sh.LoadButtonImage(sh.ButtonimgFilename);
          End;
        end else begin
          Sh.DisplayAdress;
          ListBox1.Items.Add('    '+'Kein ButtonBild ');
          Listbox1.Repaint;
        end;
        sh.DisplayButton;
        ListBox1.Items.Add('  '+sh.KundenName);
        Listbox1.Repaint;
       end;
      end;
      if sh<>nil then begin
        DataForm.writeDBLog('PRG_START_NFO','Offline - Kunde - Feld '+sh.Buttonid+' '+Sh.Feldname,'',2);
        DataForm.writeDBLog('PRG_START_NFO','Offline - Kunde - ButtonBild '+sh.ButtonimgFilename,'',2);
      end;
      ProgressBar1.Position:=ProgressBar1.position+1;
      ProgressBar1.Repaint;
    end;
    MainDisplayForm.LogCopy.items:=Listbox1.items;
    MainDisplayForm.DisplayPanel.CurrentPlayPos:=0;
    MainDisplayForm.CenterVideos.Items.Clear;
    MainDisplayForm.CenterVideos.Items.LoadFromFile(Dataform.CenterVideoFile);
    MainDisplayForm.DisplayPanel.FileList:=MainDisplayForm.CenterVideos.Items;
    for a := 1 to 30 do MainDisplayForm.mixplaylist;
    DataForm.writeDBLog('PRG_START_FIN',MainDisplayForm.CenterVideos.Items.Text,'',2);
    DataForm.writeDBLog('PRG_START_FIN','ProgrammStart - Einrichtung fertig !','',2);
    Endtimer.Interval:=2000;
    EndTimer.Enabled:=true;
    DataForm.stopExpetion:=true;
  end;
end;

procedure TMainForm.Timer2Timer(Sender: TObject);
begin
  ProgressBar1.Position:=  ProgressBar1.Position+1;
end;

end.
