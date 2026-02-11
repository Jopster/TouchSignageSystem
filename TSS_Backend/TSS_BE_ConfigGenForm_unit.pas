unit TSS_BE_ConfigGenForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.DBCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.StdCtrls;

type
  TTSS_BE_ConfigGenForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit3: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    CheckBox3: TCheckBox;
    TSS_BE_Displays: TFDTable;
    TSS_BE_Displays_Source: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Edit6: TEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    Label10: TLabel;
    SpeedButton5: TSpeedButton;
    FileOpenDialog1: TFileOpenDialog;
    Label11: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label12: TLabel;
    FileSaveDialog1: TFileSaveDialog;
    DBLookupComboBox5: TDBLookupComboBox;
    Label13: TLabel;
    Label14: TLabel;
    CheckBox4: TCheckBox;
    TSS_BE_MediaList: TFDQuery;
    TSS_BE_MediaList_Source: TDataSource;
    Label15: TLabel;
    CheckBox5: TCheckBox;
    Edit9: TEdit;
    SpeedButton6: TSpeedButton;
    DBText3: TDBText;
    DataSource2: TDataSource;
    TSS_BE_GALQuery: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TSS_BE_ConfigGenForm: TTSS_BE_ConfigGenForm;

implementation

{$R *.dfm}

USES system.inifiles;

procedure TTSS_BE_ConfigGenForm.FormShow(Sender: TObject);
begin
  TSS_BE_Displays.Active:=true;
  TSS_BE_GALQuery.Active:=true;
end;

procedure TTSS_BE_ConfigGenForm.SpeedButton1Click(Sender: TObject);
var F:TextFile;
    SF:String;
    IniPl:TIniFile;
begin
  if FileOpenDialog1.Execute then begin
    AssignFile(F,FileOpenDialog1.FileName);
    Reset(f);
    readln(F,SF);
    if SF<>'[Common]' then begin
      SF:=copy(SF,1,pos(' ',SF)-1);
      Edit1.Text:=SF;
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Edit2.Text:=SF;
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Checkbox1.Checked:=(SF='TRUE');
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Edit8.Text:=SF;
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Edit7.Text:=SF;
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Edit4.Text:=SF;
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Edit3.Text:=SF;
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Checkbox2.Checked:=(SF='TRUE');
      readln(F,SF);
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Edit5.Text:=SF;
      readln(F,SF);
      SF:=copy(SF,1,pos(' ',SF)-1);
      Edit6.Text:=SF;
    end else
    if SF='[Common]' then begin
      IniPl:=TInifile.Create(FileOpenDialog1.FileName);
      Edit1.text:=IniPl.ReadString('Common','SchematicID','');
      Edit3.text:=IniPl.ReadString('Common','UpdateID','');
      Edit2.text:=IniPl.ReadString('Common','BasePath','');
      CheckBox2.Checked:=IniPl.ReadBool('Common','OnlineSystem',False);
      CheckBox1.Checked:=IniPl.ReadBool('Common','ButtonsActive',False);
      Edit4.text:=IniPl.ReadString('Remote','HomeServer','');
      Edit7.text:=IniPl.ReadString('Debug','Loglevel','');
      Edit8.text:=IniPl.ReadString('Design','BlackoutImage','');
      Edit6.text:=IniPl.ReadString('Design','LoadImage','');
      Edit5.text:=IniPl.ReadString('Design','PartnerImage','');
      CheckBox3.Checked:=IniPl.ReadBool('Design','SpecialContent',False);
      CheckBox4.Checked:=IniPl.ReadBool('SpecialContent','IsGallery',False);
      Edit9.text:=IniPl.ReadString('SpecialContent','GalleryID','');
      CheckBox5.Checked:=IniPl.ReadBool('SpecialContent','IsInteractive',False);
    end;
    CloseFile(f);
  end;
end;

procedure TTSS_BE_ConfigGenForm.SpeedButton2Click(Sender: TObject);
var IniPl:TIniFile;
begin
  if FileSaveDialog1.Execute then begin
    IniPl:=TInifile.Create(FileSaveDialog1.FileName);
    IniPl.WriteString('Common','SchematicID',Edit1.text);
    IniPl.WriteString('Common','UpdateID',Edit3.text);
    IniPl.WriteString('Common','BasePath',Edit2.text);
    IniPl.WriteBool('Common','OnlineSystem',CheckBox2.Checked);
    IniPl.WriteBool('Common','ButtonsActive',CheckBox1.Checked);
    IniPl.WriteString('Remote','HomeServer',Edit4.text);
    IniPl.WriteString('Debug','Loglevel',Edit7.text);
    IniPl.WriteString('Design','BlackoutImage',Edit8.text);
    IniPl.WriteString('Design','LoadImage',Edit6.text);
    IniPl.WriteString('Design','PartnerImage',Edit5.text);
    IniPl.WriteBool('Design','SpecialContent',CheckBox3.Checked);
    IniPl.WriteBool('SpecialContent','IsGallery',CheckBox4.Checked);
    IniPl.WriteString('SpecialContent','GalleryID',Edit9.text);
    IniPl.WriteBool('SpecialContent','IsInteractive',CheckBox5.Checked);
    IniPl.Free;
  end;
end;

procedure TTSS_BE_ConfigGenForm.SpeedButton4Click(Sender: TObject);
begin
  edit1.Text:=DBText1.Caption;
end;

procedure TTSS_BE_ConfigGenForm.SpeedButton5Click(Sender: TObject);
begin
  edit3.Text:=DBText2.Caption;

end;

procedure TTSS_BE_ConfigGenForm.SpeedButton6Click(Sender: TObject);
begin
  edit9.Text:=DBText3.caption;
end;

end.
