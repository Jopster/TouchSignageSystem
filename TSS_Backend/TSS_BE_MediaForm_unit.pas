unit TSS_BE_MediaForm_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.WinXCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtDlgs,
  Vcl.ExtCtrls;

type
  TTSS_BE_MediaForm = class(TForm)
    TSS_BE_MediaList_Source: TDataSource;
    DBGrid1: TDBGrid;
    TSS_BE_MediaList: TFDQuery;
    ToggleSwitch1: TToggleSwitch;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    TSS_BE_Displays: TFDTable;
    TSS_BE_Displays_Source: TDataSource;
    Neubtn: TSpeedButton;
    Editbtn: TSpeedButton;
    Delbtn: TSpeedButton;
    EditPanel: TPanel;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    Label9: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    FileList: TListBox;
    OpenPictureDialog2: TOpenPictureDialog;
    DBRadioGroup2: TDBRadioGroup;
    Label10: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label11: TLabel;
    TSS_BE_Kunden_Source: TDataSource;
    TSS_BE_Kunden: TFDTable;
    Label12: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    TSS_BE_Felder: TFDQuery;
    DataSource1: TDataSource;
    DBLookupComboBox5: TDBLookupComboBox;
    Label13: TLabel;
    TSS_BE_GALQuery: TFDQuery;
    DataSource2: TDataSource;
    SpeedButton18: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEdit7: TDBEdit;
    SpeedButton3: TSpeedButton;
    DBEdit8: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure NeubtnClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure EditbtnClick(Sender: TObject);
    procedure DelbtnClick(Sender: TObject);
    procedure DBRadioGroup2Change(Sender: TObject);
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBLookupComboBox3CloseUp(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  TSS_BE_MediaForm: TTSS_BE_MediaForm;

implementation

{$R *.dfm}

uses TSS_BE_DataForm_unit, TSS_BE_KundenAddForm, TSS_BE_GallerieAddForm,
  TSS_BE_FTPForm_unit, TSS_BE_KDSelectForm_unit;

procedure TTSS_BE_MediaForm.DBGrid1CellClick(Column: TColumn);
begin
  Editbtn.Enabled:=true;
  Delbtn.Enabled:=true;
end;

procedure TTSS_BE_MediaForm.DBGrid1Exit(Sender: TObject);
begin
  Editbtn.Enabled:=false;
  Delbtn.Enabled:=false;
end;

procedure TTSS_BE_MediaForm.DBLookupComboBox2CloseUp(Sender: TObject);
begin
  TSS_BE_Felder.Close;
  TSS_BE_Felder.Params[0].AsString:=DBLookupComboBox2.KeyValue;
  TSS_BE_Felder.open;
end;

procedure TTSS_BE_MediaForm.DBLookupComboBox3CloseUp(Sender: TObject);
begin
  if DBRadioGroup2.ItemIndex=4 then begin
    TSS_BE_GALQuery.close;
    TSS_BE_GALQuery.sql.Text:='Select g.* from logumedia.gallery g where g.kundenid=:1';
    TSS_BE_GALQuery.Params[0].AsString:=DBLookupComboBox3.KeyValue;
    TSS_BE_GALQuery.open;
  end;
  TSS_BE_DataForm.TSS_BE_AlgQuery.Close;
  TSS_BE_DataForm.TSS_BE_AlgQuery.sql.Text:='Select k.* from logumedia.kunden k where k.kunden_id=:1';
  TSS_BE_DataForm.TSS_BE_AlgQuery.Params[0].AsString:=DBLookupComboBox3.KeyValue;
  DBEdit8.Text:=DBLookupComboBox3.KeyValue;
  TSS_BE_DataForm.TSS_BE_AlgQuery.open;
  DBEdit7.Text:=TSS_BE_DataForm.TSS_BE_AlgQuery.FieldByName('kunden_uid').AsString;
end;

procedure TTSS_BE_MediaForm.DBRadioGroup2Change(Sender: TObject);
begin
  DBLookupComboBox2.visible:=((DBRadioGroup2.ItemIndex=0) or (DBRadioGroup2.ItemIndex=2) or (DBRadioGroup2.ItemIndex=1));
  DBLookupComboBox4.visible:=(DBRadioGroup2.ItemIndex=2);
  DBLookupComboBox3.visible:=((DBRadioGroup2.ItemIndex=1) or (DBRadioGroup2.ItemIndex=4));
  DBLookupComboBox5.visible:=((DBRadioGroup2.ItemIndex=3) or (DBRadioGroup2.ItemIndex=4));
  Label8.visible:=((DBRadioGroup2.ItemIndex=0) or (DBRadioGroup2.ItemIndex=2) or (DBRadioGroup2.ItemIndex=1));
  Label11.visible:=((DBRadioGroup2.ItemIndex=1) or (DBRadioGroup2.ItemIndex=4));
  Label13.visible:=((DBRadioGroup2.ItemIndex=3) or (DBRadioGroup2.ItemIndex=4));
  Label12.visible:=(DBRadioGroup2.ItemIndex=2);
  SpeedButton18.visible:=((DBRadioGroup2.ItemIndex=3) or (DBRadioGroup2.ItemIndex=4));
  SpeedButton2.visible:=(DBRadioGroup2.ItemIndex=2);
  TSS_BE_Kunden.Close;
  TSS_BE_Kunden.open;
  TSS_BE_GALQuery.close;
  TSS_BE_GALQuery.sql.Text:='Select g.* from logumedia.gallery g where kundenid=0';
  TSS_BE_GALQuery.Open;
end;

procedure TTSS_BE_MediaForm.DelbtnClick(Sender: TObject);
begin
  if MessageDlg('Wirklich löschen ?',mtWarning,mbYesNo,0)=mryes then begin
    TSS_BE_MediaList.delete;
    FileList.Hide;
    dbedit4.Show;
  end;
end;

procedure TTSS_BE_MediaForm.EditbtnClick(Sender: TObject);
begin
  TSS_BE_MediaList.edit;
  FileList.Hide;
  dbedit4.Show;
  EditPanel.Show;
end;

procedure TTSS_BE_MediaForm.FormShow(Sender: TObject);
begin
  TSS_BE_MediaList.Close;
  TSS_BE_MediaList.open;
  TSS_BE_Displays.Open;
end;

procedure TTSS_BE_MediaForm.NeubtnClick(Sender: TObject);
begin
  TSS_BE_MediaList.Append;
  FileList.Hide;
  dbedit4.Show;
  EditPanel.Show;
end;

procedure TTSS_BE_MediaForm.SpeedButton18Click(Sender: TObject);
begin
  gallerieaddform.TSS_BE_Kunden.Close;
  gallerieaddform.TSS_BE_Kunden.Open;
  gallerieaddform.showmodal;
  TSS_BE_GALQuery.Close;
  TSS_BE_GALQuery.Open;
end;

procedure TTSS_BE_MediaForm.SpeedButton1Click(Sender: TObject);
var a:word;s,MainPath:String;All,Cop:boolean;Answere:integeR;
begin
  if DBRadioGroup1.Value<>'' then begin
   if DBRadioGroup1.Value[1]='1' then begin
    if OpenPictureDialog1.Execute then begin
      if OpenPictureDialog1.Files.Count>1 then begin
        FileList.show;
        FileList.Items:=OpenPictureDialog1.Files;
        dbedit4.Hide;
      end else begin
        dbedit4.show;
        dbedit4.Text:=OpenPictureDialog1.FileName;
      end;
    end;
   end;
   if DBRadioGroup1.Value[1]='2' then begin
    if OpenPictureDialog2.Execute then begin
      if OpenPictureDialog2.Files.Count>1 then begin
        FileList.show;
        FileList.Items:=OpenPictureDialog2.Files;
        dbedit4.Hide;
      end else begin
        DBEdit4.show;
        dbedit4.Text:=OpenPictureDialog2.FileName;
      end;
    end;
   end;
  end else begin
    Messagedlg('Bitte erst Medientyp wählen !!',mtError,mbOKCancel,0);
  end;
end;

procedure TTSS_BE_MediaForm.SpeedButton2Click(Sender: TObject);
begin
  kundenaddform.TSS_BE_KundenTable.Open();
  kundenaddform.TSS_BE_KundenTable.Append;
  kundenaddform.showmodal;
  DBLookupComboBox3.listSource.DataSet.Refresh;
end;

procedure TTSS_BE_MediaForm.SpeedButton3Click(Sender: TObject);
begin
  TSS_BE_KDSelectform.showmodal;
  if TSS_BE_KDSelectform.Take then begin
    if DBLookupComboBox3.ListSource.DataSet.Locate('Kundenkurzname',TSS_BE_KDSelectform.TakeDS,[]) then
      DBLookupComboBox3.KeyValue :=DBLookupComboBox3.ListSource.DataSet.FieldByName(DBLookupComboBox3.KeyField).Value;
    DBLookupComboBox3CloseUp(sender);
  end;
end;

procedure TTSS_BE_MediaForm.SpeedButton4Click(Sender: TObject);
var a,SelRes:worD;Filename,DestFile,Typ,s,schema,Galuid,DisplayID,kundenid:string;All,Cop:boolean;Answere,Midx:integeR;
Begin
  if DBedit4.Visible then begin
    Filename:=Dbedit4.text;
    Dbedit4.text:=ExtractFileName(Filename);
    TSS_BE_MediaList.Post;
    Midx:=DBRadioGroup2.ItemIndex;
    if midx<=5 then begin
      if Midx=0 then begin
        DisplayID:=DBLookupComboBox2.KeyValue;
      end else
      if Midx=1 then begin
        TSS_BE_DataForm.TSS_BE_AlgQuery.Close;
        TSS_BE_DataForm.TSS_BE_AlgQuery.sql.Text:='Select * from Logumedia.kunden where kunden_id='+DBEdit8.text;
        TSS_BE_DataForm.TSS_BE_AlgQuery.open;
        DisplayID:=TSS_BE_DataForm.TSS_BE_AlgQuery.FieldByName('kunden_uid').AsString;
      end else
      if Midx=2 then begin
        TSS_BE_DataForm.TSS_BE_AlgQuery.Close;
        TSS_BE_DataForm.TSS_BE_AlgQuery.sql.Text:='Select * from Logumedia.felder where feld_id='+DBLookupComboBox4.KeyValue;
        TSS_BE_DataForm.TSS_BE_AlgQuery.open;
        DisplayID:=TSS_BE_DataForm.TSS_BE_AlgQuery.FieldByName('feld_uuid').AsString;
      end else
      if Midx>2 then begin
        DisplayID:=DBLookupComboBox5.KeyValue;
      end;
      if not fileexists(TSS_BE_DataForm.Mainpath+DisplayID+'\'+ExtractFileName(Filename)) then begin
        DestFile:=TSS_BE_DataForm.Mainpath+DisplayID+'\'+ExtractFileName(Filename);
        if not DirectoryExists(TSS_BE_DataForm.Mainpath+DisplayID) then  CreateDir(TSS_BE_DataForm.Mainpath+DisplayID);
        if fileexists(Filename) then CopyFile(Pwidechar(Filename),pwidechar(DestFile),false) else
          if fileexists(TSS_BE_DataForm.Mainpath+ExtractFileName(Filename)) then CopyFile(Pwidechar(TSS_BE_DataForm.Mainpath+Filename),pwidechar(DestFile),false);
        TSS_BE_FTPForm.Transferfile(DestFile,DisplayID,ExtractFileName(Filename),'Dateiübertragung ...',ExtractFileName(Filename),'',1,1);
      end;
    end;
    EditPanel.hide;
  end else begin
    SelRes:=MessageDlg('Es wurden mehrere Dateien ausgewählt. Soll je Datei ein Eintrag erzeugt werden ?',mtConfirmation,mbYesNoCancel,0);
    if SelRes=mrYes then begin
      typ:=DBRadioGroup1.Value;
      Midx:=DBRadioGroup2.ItemIndex;
      if Midx=0 then Begin
        Schema:=DBLookupComboBox2.KeyValue;
        Galuid:='';
        kundenid:='';
      end else
      if Midx=1 then Begin
        kundenid:=DBLookupComboBox3.KeyValue;
        Schema:=DBLookupComboBox2.KeyValue;
        Galuid:='';
      end else
      if Midx=-1 then Begin
        kundenid:='';
        Schema:='';
        Galuid:='';
      end else begin
        Galuid:=DBLookupComboBox5.KeyValue;
        Schema:='';
        kundenid:='';
      end;
      for a := 1 to FileList.Items.Count do begin
        TSS_BE_MediaList.fieldbyname('media_typ').AsString:=Typ;
        TSS_BE_MediaList.fieldbyname('media_file').AsString:=ExtractFileName(FileList.Items[0]);
        TSS_BE_MediaList.fieldbyname('schematic_id').AsString:=Schema;
        TSS_BE_MediaList.fieldbyname('Gallery_uid').AsString:=Galuid;
        if kundenid<>'' then begin
          TSS_BE_MediaList.fieldbyname('kunden_id').AsString:=kundenid;
          TSS_BE_MediaList.fieldbyname('kunden_uid').AsString:=TSS_BE_DataForm.getKundenuid(kundenid);
        end;
        TSS_BE_MediaList.post;
        TSS_BE_MediaList.Append;
        if Midx<2 then begin
          s:=ExtractFilePath(FileList.Items[0]);
          if ((s<>TSS_BE_DataForm.MainPath) or (not fileexists(TSS_BE_DataForm.Mainpath+Schema+'\'+ExtractFileName(Filelist.Items[0])))) and not All then begin
            Answere:=messageDlg('Die gewählte Datei befindet sich nicht im Medien Archiv. Soll die datei dort hin KOPIERT werden ?',mtConfirmation,mbYesAllNoAllCancel,0);
            if Answere=mrYesToAll then all:=true;
            if Answere=mryes then Cop:=true;
          end;
          if All or Cop then begin
            if not DirectoryExists(TSS_BE_DataForm.Mainpath+Schema) then CreateDir(TSS_BE_DataForm.Mainpath+Schema);
            if not fileexists(TSS_BE_DataForm.Mainpath+Schema+'\'+ExtractFileName(FileList.Items[0])) then begin
              DestFile:=TSS_BE_DataForm.Mainpath+Schema+'\'+ExtractFileName(FileList.Items[0]);
              CopyFile(Pwidechar(FileList.Items[0]),pwidechar(DestFile),false);
              TSS_BE_FTPForm.Transferfile(DestFile,Schema,ExtractFileName(FileList.Items[0]),'Dateiübertragung ...',ExtractFileName(FileList.Items[0]),'',a,FileList.Items.Count);
            end;
          end;
        end else begin
          s:=ExtractFilePath(FileList.Items[0]);
          if (s<>TSS_BE_DataForm.MainPath) and not All then begin
            Answere:=messageDlg('Die gewählte Datei befindet sich nicht im Medien Archiv. Soll die datei dort hin KOPIERT werden ?',mtConfirmation,mbYesAllNoAllCancel,0);
            if Answere=mrYesToAll then all:=true;
            if Answere=mryes then Cop:=true;
          end;
          if All or Cop then begin
            if not fileexists(TSS_BE_DataForm.Mainpath+Galuid+'\'+ExtractFileName(FileList.Items[0])) then begin
              DestFile:=TSS_BE_DataForm.Mainpath+Galuid+'\'+ExtractFileName(FileList.Items[0]);
              CopyFile(Pwidechar(FileList.Items[0]),pwidechar(DestFile),false);
              TSS_BE_FTPForm.Transferfile(DestFile,Galuid,ExtractFileName(FileList.Items[0]),'Dateiübertragung ...',ExtractFileName(FileList.Items[0]),'',a,FileList.Items.Count);
            end;
          end;
        end;
        FileList.Items.Delete(0);
      end;
      TSS_BE_MediaList.cancel;
      EditPanel.hide;
    end else
    if SelRes=mrCancel then begin

    end else begin
      TSS_BE_MediaList.cancel;
      EditPanel.hide;
    end;
  end;
end;

procedure TTSS_BE_MediaForm.SpeedButton5Click(Sender: TObject);
begin
  TSS_BE_MediaList.Cancel;
  EditPanel.hide;
end;

procedure TTSS_BE_MediaForm.ToggleSwitch1Click(Sender: TObject);
begin
  if ToggleSwitch1.State=tssoff then begin
    TSS_BE_MediaList.Filtered:=false;
  end else begin
    TSS_BE_MediaList.Filtered:=false;
    TSS_BE_MediaList.Filter:='schematic_id='''+TSS_BE_DataForm.Global_Schematic_id+'''';
    TSS_BE_MediaList.Filtered:=true;
  end;
end;

end.
