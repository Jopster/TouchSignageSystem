unit TSS_BE_ButtonGenForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtDlgs, Vcl.Grids, Vcl.Outline, System.Generics.Collections,
  Vcl.ComCtrls, Vcl.TabNotBk;

type
  TTSS_BE_ButtonGenForm = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    FileOpenDialog1: TFileOpenDialog;
    FileSaveDialog1: TFileSaveDialog;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label15: TLabel;
    Edit8: TEdit;
    SpeedButton3: TSpeedButton;
    TSS_BE_KundenDaten: TFDQuery;
    DataSource3: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ListBox1: TListBox;
    Label34: TLabel;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    ScrollBox1: TScrollBox;
    FileOpenDialog2: TFileOpenDialog;
    SpeedButton22: TSpeedButton;
    FileSaveDialog2: TFileSaveDialog;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    ListBox2: TListBox;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    FileOpenDialog3: TFileOpenDialog;
    Label35: TLabel;
    Edit28: TEdit;
    Label36: TLabel;
    Edit29: TEdit;
    Label37: TLabel;
    Edit30: TEdit;
    Label38: TLabel;
    Edit31: TEdit;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    ListBox3: TListBox;
    Edit32: TEdit;
    SpeedButton13: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    SpeedButton43: TSpeedButton;
    SpeedButton44: TSpeedButton;
    Label40: TLabel;
    Edit33: TEdit;
    SpeedButton45: TSpeedButton;
    Label41: TLabel;
    FileOpenDialog4: TFileOpenDialog;
    Label39: TLabel;
    CheckBox2: TCheckBox;
    Label42: TLabel;
    Edit34: TEdit;
    Label43: TLabel;
    Edit35: TEdit;
    Label44: TLabel;
    Edit36: TEdit;
    Label45: TLabel;
    Edit37: TEdit;
    Label46: TLabel;
    Edit38: TEdit;
    SpeedButton47: TSpeedButton;
    Edit39: TEdit;
    Label47: TLabel;
    Edit40: TEdit;
    Label48: TLabel;
    TabbedNotebook1: TTabbedNotebook;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label28: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit18: TEdit;
    Image1: TImage;
    Edit22: TEdit;
    Edit21: TEdit;
    Edit20: TEdit;
    Edit14: TEdit;
    Edit13: TEdit;
    Edit12: TEdit;
    Edit11: TEdit;
    Edit10: TEdit;
    Edit9: TEdit;
    ComboBox6: TComboBox;
    ComboBox5: TComboBox;
    CheckBox1: TCheckBox;
    SpeedButton46: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label32: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label33: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit19: TEdit;
    Edit23: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton46Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton47Click(Sender: TObject);
  private
    { Private-Deklarationen }
    function ReadValue(FileID,Valuename:string):String;
  public
    { Public-Deklarationen }
    procedure ReadBDTA(Filename:string);
  end;

var
  TSS_BE_ButtonGenForm: TTSS_BE_ButtonGenForm;
  PaintPanels:TObjectlist<Tpanel>;

implementation

uses TSS_BE_DataForm_unit, TSS_BE_KundenAddForm, TSS_BE_KDSearchForm,
  TSS_BE_KDSelectForm_unit,system.inifiles,iniplus;

{$R *.dfm}

procedure TTSS_BE_ButtonGenForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var a:word;pan:TPanel;
begin
  if PaintPanels.OwnsObjects then begin
    for a:=1 to PaintPanels.Count do begin
     pan:=Tpanel(PaintPanels.Items[a-1]);
     Freeandnil(pan);
    end;
  end;
  if PaintPanels<>nil then freeandnil(PaintPanels);
end;

procedure TTSS_BE_ButtonGenForm.FormShow(Sender: TObject);
begin
  if PaintPanels=nil then PaintPanels:=TObjectlist<TPanel>.create;
end;

procedure TTSS_BE_ButtonGenForm.RadioButton1Click(Sender: TObject);
begin
  Scrollbox1.Top:=70;
  Scrollbox1.left:=520;
  Scrollbox1.Width:=384;
  Scrollbox1.Height:=216;
  Scrollbox1.Repaint;
end;

procedure TTSS_BE_ButtonGenForm.RadioButton2Click(Sender: TObject);
begin
  Scrollbox1.Top:=70;
  Scrollbox1.left:=520;
  Scrollbox1.Width:=216;
  Scrollbox1.Height:=384;
  Scrollbox1.Repaint;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton12Click(Sender: TObject);
begin
  Edit32.Text:=Edit17.Text;
  if fileexists('C:\TSS\WebTemp\SchemaTemp\'+Edit32.text+'.GAL') then begin
    SpeedButton42.Click;
  end else begin
    ListBox3.Items.Clear;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton13Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;a:word;
begin
  if OpenPictureDialog1.Execute then begin
    if OpenPictureDialog1.Files.Count>1 then begin
      for a := 1 to OpenPictureDialog1.Files.Count do begin
        FN:=OpenPictureDialog1.Files[a-1];
        if Edit12.Text='' then begin
          if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
          edit12.Text:=edit1.Text;
        end;
        TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
        if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
          TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
          if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
          Copyfile(Pchar(FN),PChar(TFN),false);
        end;
        Listbox3.Items.Add(TFN);
      end;
    end else begin
      FN:=OpenPictureDialog1.FileName;
      if Edit12.Text='' then begin
        if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
        edit12.Text:=edit1.Text;
      end;
      TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
      if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
        TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
        if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
        Copyfile(Pchar(FN),PChar(TFN),false);
      end;
      Listbox3.Items.Add(TFN);
    end;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton15Click(Sender: TObject);
begin
  Edit17.Text:=TSS_BE_DataForm.MYCreateGuid;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton16Click(Sender: TObject);
var f:Textfile;ReadString:string;a,count:worD;
    IniPl:TIniFile;
begin
  if FileOpenDialog2.Execute then begin
    AssignFile(F,FileOpenDialog2.filename);
    Reset(f);
    Readln(f,Readstring);
    closefile(f);
    if Readstring<>'[Common]' then begin
      AssignFile(F,FileOpenDialog2.filename);
      Reset(f);
      if Edit25.text='' then Edit25.text:=Copy(extractfilename(FileOpenDialog2.filename),1,pos('.',FileOpenDialog2.filename)-1);
      Readln(f,Readstring);
      Edit26.text:=copy(Readstring,pos(':',Readstring)+1,length(Readstring)-pos(':',Readstring));
      Readln(f,Readstring);
      Edit27.text:=copy(Readstring,pos(':',Readstring)+1,length(Readstring)-pos(':',Readstring));
      Readln(f,Readstring);
      count:=strtoint(copy(Readstring,9,length(Readstring)-8));
      for a:=1 to count do begin
        Readln(f,Readstring);
        ListBox1.Items.Add(copy(Readstring,pos(':',Readstring)+1,length(Readstring)-8));
      end;
      Closefile(f);
    end else begin
      IniPl:=TInifile.Create(FileOpenDialog2.filename);
      if Edit25.text='' then Edit25.text:=Copy(extractfilename(FileOpenDialog2.filename),1,pos('.',FileOpenDialog2.filename)-1);
      Edit26.text:=IniPl.ReadString('Common','DisplayName','');
      Edit27.text:=IniPl.ReadString('Common','SchematicID','');
      count:=IniPl.ReadInteger('Common','Buttons',0);
      for a:=1 to count do begin
        Readstring:=IniPl.ReadString('Common','Button'+inttostr(a),'');
        ListBox1.Items.Add(Readstring);
      end;
    end;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton17Click(Sender: TObject);
var ReadString:string;a,count:worD;
    IniPl:TIniFile;
begin
  IniPl:=TInifile.Create('C:\TSS\WebTemp\SchemaTemp\'+Edit25.text+'.DSCH');
  IniPl.WriteString('Common','DisplayName',Edit26.text);
  IniPl.WriteString('Common','SchematicID',Edit27.text);
  IniPl.WriteInteger('Common','Buttons',ListBox1.Items.Count);
  for a:=1 to ListBox1.Items.Count do begin
    IniPl.WriteString('Common','Button'+inttostr(a),ListBox1.Items[a-1]);
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton19Click(Sender: TObject);
begin
  ListBox1.Items.add(Edit1.Text);
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton1Click(Sender: TObject);
begin
  if FileOpenDialog1.Execute then begin
    ReadBDTA(FileOpenDialog1.Filename);
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton20Click(Sender: TObject);
begin
  listbox1.Items.Delete(listbox1.ItemIndex);
end;

procedure TTSS_BE_ButtonGenForm.ReadBDTA(Filename: string);
var f:Textfile;ReadString:string;
var IniPl:TIniFile;
begin
    AssignFile(F,Filename);
    Reset(f);
    Readln(f,Readstring);
    closefile(f);
    if Readstring<>'[Button]' then begin
      AssignFile(F,Filename);
      Reset(f);
      Readln(f,Readstring);
      Edit1.Text:=ReadString;
      Readln(f,Readstring);
      Edit2.Text:=ReadString;
      Readln(f,Readstring);
      Combobox3.Text:=ReadString;
      Readln(f,Readstring);
      Combobox4.Text:=ReadString;
      Readln(f,Readstring);
      Combobox1.Text:=ReadString;
      Readln(f,Readstring);
      Combobox2.Text:=ReadString;
      Readln(f,Readstring);
      Edit8.Text:=ReadString;
      Edit3.Text:=ReadString;
      Readln(f,Readstring);
      Edit4.Text:=Readstring;
      Readln(f,Readstring);
      Edit7.Text:=Readstring;
      Readln(f,Readstring);
      Edit5.Text:=Readstring;
      Readln(f,Readstring);
      Edit6.Text:=Readstring;
      Readln(f,Readstring);
      Checkbox1.Checked:=StrToBool(Readstring);
      Readln(f,Readstring);
      Combobox5.ItemIndex:=strtoint(Readstring);
      Readln(f,Readstring);
      Combobox6.ItemIndex:=strtoint(Readstring);
      Readln(f,Readstring);
      Edit9.Text:=Readstring;
      Readln(f,Readstring);
      Edit10.Text:=Readstring;
      Readln(f,Readstring);
      Edit11.Text:=Readstring;
      Readln(f,Readstring);
      Edit12.Text:=Readstring;
      Readln(f,Readstring);
      Edit13.Text:=Readstring;
      Image1.Picture.LoadFromFile(Readstring);
      Readln(f,Readstring);
      Edit14.Text:=Readstring;
      Readln(f,Readstring);
      Edit15.Text:=Readstring;
      Readln(f,Readstring);
      Edit16.Text:=Readstring;
      Readln(f,Readstring);
      Edit17.Text:=Readstring;
      readln(f,Readstring);
      Edit18.Text:=Readstring;
      readln(f,Readstring);
      Edit20.Text:=Readstring;
      readln(f,Readstring);
      Edit21.Text:=Readstring;
      readln(f,Readstring);
      Edit22.Text:=Readstring;
      readln(f,Readstring);
      Edit19.Text:=Readstring;
      readln(f,Readstring);
      Edit23.Text:=Readstring;
      Closefile(f);
    end else begin
      IniPl:=TInifile.Create(Filename);
      edit1.text:=IniPl.ReadString('Button','ButtonUID','');
      edit12.text:=IniPl.ReadString('Button','ButtonUID','');
      Combobox1.text:=IniPl.ReadString('Button','Width','');
      Combobox2.text:=IniPl.ReadString('Button','Height','');
      Combobox3.text:=IniPl.ReadString('Button','Left','');
      Combobox4.text:=IniPl.ReadString('Button','Top','');
      edit18.text:=IniPl.ReadString('Customer','Kunden_UID','');
      edit3.text:=IniPl.ReadString('Customer','Kundennummer','');
      edit4.text:=IniPl.ReadString('Customer','Kundenname_1','');
      edit7.text:=IniPl.ReadString('Customer','Kundenname_2','');
      edit5.text:=IniPl.ReadString('Customer','Kundenstrasse','');
      edit6.text:=IniPl.ReadString('Customer','KundenplzOrt','');
      Edit13.text:=IniPl.ReadString('Button','Image','');
      if edit13.Text<>'' then image1.Picture.LoadFromFile(edit13.Text);
      Edit2.text:=IniPl.ReadString('Button','Name','');
      Edit8.text:=IniPl.ReadString('Button','Tag','');
      CheckBox1.Checked:=IniPl.ReadBool('Aktion','Clickable',False);
      ComboBox5.ItemIndex:=IniPl.ReadInteger('Aktion','ClickInAktive',0);
      ComboBox6.ItemIndex:=IniPl.ReadInteger('Aktion','ClickAktive',0);
      Edit9.text:=IniPl.ReadString('Aktion','ClickVideo','');
      Edit10.text:=IniPl.ReadString('Aktion','ClickGallerie','');
      Edit11.text:=IniPl.ReadString('Aktion','ClickPlayList','');
      Edit14.text:=IniPl.ReadString('Data','PlaylistCount','');
      Edit20.text:=IniPl.ReadString('Data','MediaID','');
      Edit21.text:=IniPl.ReadString('Data','MediaTyp','');
      Edit22.text:=IniPl.ReadString('Data','Zuordnung','');
      Edit15.text:=IniPl.ReadString('Data','ClickPlayListFile','');
      Edit16.text:=IniPl.ReadString('Data','ClickPlayListZuordnung','');
      Edit17.text:=IniPl.ReadString('Data','ClickPlayListGallerID','');
      Edit19.text:=IniPl.ReadString('Data','GalleryID','');
      Edit23.text:=IniPl.ReadString('Data','FeldName','');
      Edit28.text:=IniPl.ReadString('Data','CenterVideo1','');
      Edit29.text:=IniPl.ReadString('Data','CenterVideo2','');
      Edit30.text:=IniPl.ReadString('Data','CenterVideo3','');
      Edit31.text:=IniPl.ReadString('Data','CenterVideo4','');
      CheckBox2.Checked:=IniPl.ReadBool('Button','TimerOn',False);
      Edit34.text:=IniPl.ReadString('Button','TimerTime','0');
      Edit38.text:=IniPl.ReadString('Data','ClickShowImage','');
      Edit35.text:=IniPl.ReadString('Data','ClickShowImageX','');
      Edit36.text:=IniPl.ReadString('Data','ClickShowImageY','');
      Edit40.text:=IniPl.ReadString('Data','ClickShowImageW','');
      Edit39.text:=IniPl.ReadString('Data','ClickShowImageH','');
      Edit37.text:=IniPl.ReadString('Data','ClickShowImageTime','');
    end;
end;

function TTSS_BE_ButtonGenForm.ReadValue(FileID,Valuename:string):String;
var f:Textfile;ReadString:string;
    IniPl:TIniFile;
begin
  if fileexists('C:\TSS\WebTemp\SchemaTemp\'+FileId+'.BDTA') then begin
    AssignFile(F,'C:\TSS\WebTemp\SchemaTemp\'+FileId+'.BDTA');
    Reset(f);
    Readln(f,Readstring);
    closefile(f);
    if Readstring<>'[Button]' then begin
      AssignFile(F,'C:\TSS\WebTemp\SchemaTemp\'+FileId+'.BDTA');
      Reset(f);
      Readln(f,Readstring);
      Readln(f,Readstring);
      Readln(f,Readstring);
      if Valuename='left' then Result:=Readstring;
      Readln(f,Readstring);
      if Valuename='top' then Result:=Readstring;
      Readln(f,Readstring);
      if Valuename='width' then Result:=Readstring;
      Readln(f,Readstring);
      if Valuename='height' then Result:=Readstring;
      closefile(f);
    end else begin
      IniPl:=TInifile.Create('C:\TSS\WebTemp\SchemaTemp\'+FileId+'.BDTA');
      Result:=IniPl.ReadString('Button',Valuename,'');
    end;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton21Click(Sender: TObject);
var w,h,t,l,a:word;Pan:Tpanel;
begin
  for a:=1 to PaintPanels.Count do begin
    pan:=Tpanel(PaintPanels.Items[a-1]);
    try
      Freeandnil(pan);
    except
      pan:=nil;
    end;
  end;
  for a:=1 to Listbox1.Items.Count do begin
    if listbox1.Items[a-1]<>Edit1.text then begin
      w:=strtoint(ReadValue(listbox1.Items[a-1],'width'));
      h:=strtoint(ReadValue(listbox1.Items[a-1],'height'));
      l:=strtoint(ReadValue(listbox1.Items[a-1],'left'));
      t:=strtoint(ReadValue(listbox1.Items[a-1],'top'));
    end else begin
      w:=strtoint(Combobox1.Text);
      h:=strtoint(Combobox2.Text);
      l:=strtoint(Combobox3.Text);
      t:=strtoint(Combobox4.Text);
    end;
    Pan:=TPanel.Create(Scrollbox1);
    Pan.Parent:=Scrollbox1;
    pan.Width:=w div 6;
    pan.Height:=h div 6;
    pan.left:=l div 6;
    pan.top:=t div 6;
    pan.Visible:=true;
    pan.Hint:=ReadValue(listbox1.Items[a-1],'ButtonUID');
    pan.ShowHint:=true;
    pan.Color:=clblue;
    PaintPanels.Add(pan);
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton22Click(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton24Click(Sender: TObject);
begin
  edit25.text:=TSS_BE_DataForm.MYCreateGuid;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton25Click(Sender: TObject);
begin
  edit27.text:=TSS_BE_DataForm.MYCreateGuid;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton26Click(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  edit7.Text:='';
  edit8.Text:='';
  edit9.Text:='';
  edit10.Text:='';
  edit11.Text:='';
  edit12.Text:='';
  edit13.Text:='';
  edit14.Text:='';
  edit15.Text:='';
  edit16.Text:='';
  edit17.Text:='';
  edit18.Text:='';
  edit19.Text:='';
  edit20.Text:='1';
  edit21.Text:='101';
  edit22.Text:='';
  edit24.Text:='';
  edit28.Text:='';
  edit29.Text:='';
  edit30.Text:='';
  edit31.Text:='';
  CheckBox1.Checked:=false;
  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=0;
  ComboBox3.ItemIndex:=0;
  ComboBox4.ItemIndex:=0;
  ComboBox5.ItemIndex:=0;
  ComboBox6.ItemIndex:=0;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton27Click(Sender: TObject);
begin
  ReadBDTA('C:\TSS\WebTemp\SchemaTemp\'+ListBox1.Items[ListBox1.ItemIndex]+'.BDTA');
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton28Click(Sender: TObject);
begin
  ListBox2.Items.LoadFromFile('C:\TSS\WebTemp\SchemaTemp\'+Edit33.text+'.DSCV');
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton29Click(Sender: TObject);
begin
  ListBox2.Items.SavetoFile('C:\TSS\WebTemp\SchemaTemp\'+Edit33.text+'.DSCV');
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton2Click(Sender: TObject);
var IniPl:TIniFile;
begin
  begin
    IniPl:=TInifile.Create('C:\TSS\WebTemp\SchemaTemp\'+Edit1.text+'.BDTA');
    IniPl.WriteString('Button','ButtonUID',Edit1.text);
    IniPl.WriteString('Button','Left',Combobox3.text);
    IniPl.WriteString('Button','Top',Combobox4.text);
    IniPl.WriteString('Button','Width',Combobox1.text);
    IniPl.WriteString('Button','Height',Combobox2.text);
    IniPl.WriteBool('Button','TimerOn',CheckBox2.Checked);
    IniPl.WriteString('Button','TimerTime',Edit34.text);
    IniPl.WriteString('Customer','Kunden_UID',edit18.text);
    IniPl.WriteString('Customer','Kundennummer',edit3.text);
    IniPl.WriteString('Customer','Kundenname_1',edit4.text);
    IniPl.WriteString('Customer','Kundenname_2',edit7.text);
    IniPl.WriteString('Customer','Kundenstrasse',edit5.text);
    IniPl.WriteString('Customer','KundenplzOrt',edit6.text);
    IniPl.WriteString('Button','Image',Edit13.text);
    IniPl.WriteString('Button','Name',Edit2.text);
    IniPl.WriteString('Button','Tag',Edit8.text);
    IniPl.WriteBool('Aktion','Clickable',CheckBox1.Checked);
    IniPl.WriteInteger('Aktion','ClickInAktive',ComboBox5.ItemIndex);
    IniPl.WriteInteger('Aktion','ClickAktive',ComboBox6.ItemIndex);
    IniPl.WriteString('Aktion','ClickVideo',Edit9.text);
    IniPl.WriteString('Aktion','ClickGallerie',Edit10.text);
    IniPl.WriteString('Aktion','ClickPlayList',Edit11.text);
    IniPl.WriteString('Data','PlaylistCount',Edit14.text);
    IniPl.WriteString('Data','MediaID',Edit20.text);
    IniPl.WriteString('Data','MediaTyp',Edit21.text);
    IniPl.WriteString('Data','Zuordnung',Edit22.text);
    IniPl.WriteString('Data','ClickPlayListFile',Edit15.text);
    IniPl.WriteString('Data','ClickPlayListZuordnung',Edit16.text);
    IniPl.WriteString('Data','ClickPlayListGallerID',Edit17.text);
    IniPl.WriteString('Data','GalleryID',Edit19.text);
    IniPl.WriteString('Data','FeldName',Edit23.text);
    IniPl.WriteString('Data','CenterVideo1',Edit28.text);
    IniPl.WriteString('Data','CenterVideo2',Edit29.text);
    IniPl.WriteString('Data','CenterVideo3',Edit30.text);
    IniPl.WriteString('Data','CenterVideo4',Edit31.text);
    IniPl.WriteString('Data','ClickShowImage',Edit38.text);
    IniPl.WriteString('Data','ClickShowImageX',Edit35.text);
    IniPl.WriteString('Data','ClickShowImageY',Edit36.text);
    IniPl.WriteString('Data','ClickShowImageW',Edit40.text);
    IniPl.WriteString('Data','ClickShowImageH',Edit39.text);
    IniPl.WriteString('Data','ClickShowImageTime',Edit37.text);
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton30Click(Sender: TObject);
begin
  listbox2.Items.Delete(listbox2.ItemIndex);
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton31Click(Sender: TObject);
begin
  listbox2.clear;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton32Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;a:word;
begin
  if FileOpenDialog3.Execute then begin
    if FileOpenDialog3.Files.Count>1 then begin
      for a := 1 to FileOpenDialog3.Files.Count do begin
        FN:=FileOpenDialog3.Files[a-1];
        if Edit33.Text='' then begin
          if edit25.Text='' then edit25.text:=TSS_BE_DataForm.MYCreateGuid;
          edit33.Text:=edit25.Text;
        end;
        TFN:='C:\TSS\WebTemp\'+Edit33.Text+'\'+extractfilepath(fn);
        if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit33.Text+'\' then begin
          TFN:='C:\TSS\WebTemp\'+Edit33.Text+'\'+extractfilename(fn);
          if not DirectoryExists('C:\TSS\WebTemp\'+Edit33.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit33.Text+'\');
          Copyfile(Pchar(FN),PChar(TFN),false);
        end;
        Listbox2.Items.Add(TFN);
      end;
    end else begin
      FN:=FileOpenDialog3.FileName;
      if Edit33.Text='' then begin
        if edit25.Text='' then edit25.text:=TSS_BE_DataForm.MYCreateGuid;
        edit33.Text:=edit25.Text;
      end;
      TFN:='C:\TSS\WebTemp\'+Edit33.Text+'\'+extractfilepath(fn);
      if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit33.Text+'\' then begin
        TFN:='C:\TSS\WebTemp\'+Edit33.Text+'\'+extractfilename(fn);
        if not DirectoryExists('C:\TSS\WebTemp\'+Edit33.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit33.Text+'\');
        Copyfile(Pchar(FN),PChar(TFN),false);
      end;
      Listbox2.Items.Add(TFN);
    end;
  end;end;

procedure TTSS_BE_ButtonGenForm.SpeedButton33Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;
begin
  if FileOpenDialog3.execute then begin
    FN:=FileOpenDialog3.FileName;
    if Edit12.Text='' then begin
      if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
      edit12.Text:=edit1.Text;
    end;
    TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
    if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
      TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
      if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
      Copyfile(Pchar(FN),PChar(TFN),false);
    end;
    edit28.Text:=TFN;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton34Click(Sender: TObject);
begin
  listbox2.Items.Add(edit28.text);
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton35Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;
begin
  if FileOpenDialog3.execute then begin
    FN:=FileOpenDialog3.FileName;
    if Edit12.Text='' then begin
      if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
      edit12.Text:=edit1.Text;
    end;
    TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
    if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
      TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
      if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
      Copyfile(Pchar(FN),PChar(TFN),false);
    end;
    edit29.Text:=TFN;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton36Click(Sender: TObject);
begin
  listbox2.Items.Add(edit29.text);
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton37Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;
begin
  if FileOpenDialog3.execute then begin
    FN:=FileOpenDialog3.FileName;
    if Edit12.Text='' then begin
      if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
      edit12.Text:=edit1.Text;
    end;
    TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
    if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
      TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
      if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
      Copyfile(Pchar(FN),PChar(TFN),false);
    end;
    edit30.Text:=TFN;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton38Click(Sender: TObject);
begin
  listbox2.Items.Add(edit30.text);
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton39Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;
begin
  if FileOpenDialog3.execute then begin
    FN:=FileOpenDialog3.FileName;
    if Edit12.Text='' then begin
      if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
      edit12.Text:=edit1.Text;
    end;
    TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
    if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
      TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
      if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
      Copyfile(Pchar(FN),PChar(TFN),false);
    end;
    edit31.Text:=TFN;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton3Click(Sender: TObject);
begin
  edit1.text:=TSS_BE_DataForm.MYCreateGuid;
  edit12.text:=edit1.text;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton40Click(Sender: TObject);
begin
  listbox2.Items.Add(edit31.text);
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton41Click(Sender: TObject);
begin
  listbox3.Items.Delete(listbox3.ItemIndex);
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton42Click(Sender: TObject);
begin
  ListBox3.Items.LoadFromFile('C:\TSS\WebTemp\SchemaTemp\'+Edit32.text+'.GAL');
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton43Click(Sender: TObject);
begin
  ListBox3.Items.SavetoFile('C:\TSS\WebTemp\SchemaTemp\'+Edit32.text+'.GAL');
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton46Click(Sender: TObject);
begin
edit12.Text:=edit1.Text;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton47Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;
begin
  if OpenPictureDialog1.Execute then begin
    FN:=OpenPictureDialog1.FileName;
    if Edit12.Text='' then begin
      if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
      edit12.Text:=edit1.Text;
    end;
    TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
    if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
      TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
      if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
      Copyfile(Pchar(FN),PChar(TFN),false);
    end;
    edit38.Text:=TFN;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton4Click(Sender: TObject);
var knr:String;
begin
  TSS_BE_KDSelectform.showmodal;
  if TSS_BE_KDSelectform.Take then begin
    if not TSS_BE_KundenDaten.Active then TSS_BE_KundenDaten.open;
    if TSS_BE_KundenDaten.Locate('Kunden_UID',TSS_BE_KDSelectform.TakeID,[]) then begin
      Edit18.text:=TSS_BE_KundenDaten.FieldByName('Kunden_UID').asstring;
      Edit3.text:=TSS_BE_KundenDaten.FieldByName('Kundennummer').asstring;
      Edit4.text:=TSS_BE_KundenDaten.FieldByName('Kunden_name_1').asstring;
      Edit7.text:=TSS_BE_KundenDaten.FieldByName('Kunden_name_2').asstring;
      Edit5.text:=TSS_BE_KundenDaten.FieldByName('Kunden_strasse').asstring+' '+TSS_BE_KundenDaten.FieldByName('Kunden_hausnr').asstring;
      Edit6.text:=TSS_BE_KundenDaten.FieldByName('Kunden_plz').asstring+' '+TSS_BE_KundenDaten.FieldByName('Kunden_ort').asstring;
    end;
    if TSS_BE_KundenDaten.Active then TSS_BE_KundenDaten.close;
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton5Click(Sender: TObject);
begin
  kundenaddform.TSS_BE_KundenTable.Open();
  kundenaddform.TSS_BE_KundenTable.Append;
  kundenaddform.showmodal;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton6Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;
begin
  if FileOpenDialog3.execute then begin
    FN:=FileOpenDialog3.FileName;
    if Edit12.Text='' then begin
      if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
      edit12.Text:=edit1.Text;
    end;
    TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
    if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
      TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
      if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
      Copyfile(Pchar(FN),PChar(TFN),false);
    end;
    edit15.Text:=TFN;
    edit16.Text:='1';
  end;
end;

procedure TTSS_BE_ButtonGenForm.SpeedButton9Click(Sender: TObject);
var TFN,FN:String;PTFN,PFN:PWidechar;
begin
  if OpenPictureDialog1.Execute then begin
    FN:=OpenPictureDialog1.FileName;
    if Edit12.Text='' then begin
      if edit1.Text='' then edit1.text:=TSS_BE_DataForm.MYCreateGuid;
      edit12.Text:=edit1.Text;
    end;
    TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilepath(fn);
    if ExtractFilePath(FN)<>'C:\TSS\WebTemp\'+Edit12.Text+'\' then begin
      TFN:='C:\TSS\WebTemp\'+Edit12.Text+'\'+extractfilename(fn);
      if not DirectoryExists('C:\TSS\WebTemp\'+Edit12.Text+'\') then CreateDir('C:\TSS\WebTemp\'+Edit12.Text+'\');
      Copyfile(Pchar(FN),PChar(TFN),false);
    end;
    edit13.Text:=TFN;
    image1.Picture.LoadFromFile(edit13.Text);
  end;
end;

end.
