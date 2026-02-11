unit TSS_BE_ScreenDesigner_Form_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,vcl.imaging.jpeg,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,TSS_BE_FeldPanel_unit, Vcl.Grids, Vcl.DBGrids;

type
  TTSS_BE_ScreenDesigner_Form = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SelectCountLAbel: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Panel2: TPanel;
    SpeedButton7: TSpeedButton;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    DataSource1: TDataSource;
    TSS_BE_FeldData: TFDQuery;
    TSS_BE_SingleFeld: TFDQuery;
    DataSource2: TDataSource;
    Notebook1: TNotebook;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    TSS_BE_KundenDaten: TFDQuery;
    DataSource3: TDataSource;
    TSS_BE_KundendatenSingle: TFDQuery;
    DataSource4: TDataSource;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton18: TSpeedButton;
    Label2: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Image1: TImage;
    TSS_BE_BildMedien: TFDQuery;
    DataSource5: TDataSource;
    SpeedButton19: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    SpeedButton20: TSpeedButton;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    TSS_BE_CenterPlaylist: TFDQuery;
    DataSource6: TDataSource;
    SpeedButton25: TSpeedButton;
    Label6: TLabel;
    SpeedButton26: TSpeedButton;
    DBText1: TDBText;
    Label7: TLabel;
    Label9: TLabel;
    DBText2: TDBText;
    TSS_BE_Vertragsdaten: TFDQuery;
    DataSource7: TDataSource;
    Label10: TLabel;
    DBText3: TDBText;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    CheckBox1: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    SpeedButton27: TSpeedButton;
    DBLookupComboBox4: TDBLookupComboBox;
    FDQuery1: TFDQuery;
    DataSource8: TDataSource;
    TSS_BE_KDMedia_Source: TDataSource;
    TSS_BE_KDMedia: TFDQuery;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    TSS_BE_Gallery: TFDQuery;
    TSS_BE_Gallery_Source: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBLookupComboBox3CloseUp(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure ComboBox2CloseUp(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure DBLookupComboBox3Enter(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
  private
    FSelectCount: word;
    FDrawnpanels: TStrings;
    SelectedFields:Tstrings;
    selectedbutton:TFeldPanel;
    procedure SetSelectCount(const Value: word);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    property selectcount:word read FSelectCount write SetSelectCount;
  end;

var
  TSS_BE_ScreenDesigner_Form: TTSS_BE_ScreenDesigner_Form;

implementation

{$R *.dfm}

uses TSS_BE_DataForm_unit, TSS_BE_KundenAddForm, TSS_BE_KDSearchForm,
  TSS_BE_VideoSearchForm, TSS_BE_KDSelectForm_unit;

procedure TTSS_BE_ScreenDesigner_Form.ComboBox2CloseUp(Sender: TObject);
begin
  DBLookupComboBox4.hide;
  DBLookupComboBox5.hide;
  DBLookupComboBox6.Hide;
  SpeedButton27.Hide;
  if ComboBox2.ItemIndex=0 then begin
    DBLookupComboBox4.show;
  end else
  if ComboBox2.ItemIndex=1 then begin
    DBLookupComboBox6.Hide;
    TSS_BE_KDMedia.Close;
    TSS_BE_KDMedia.Params[0].asintegeR:=DBLookupComboBox1.KeyValue;
    TSS_BE_KDMedia.open;
    DBLookupComboBox5.show;
    SpeedButton27.Show;
  end else
  if ComboBox2.ItemIndex=2 then begin
    TSS_BE_Gallery.Close;
    TSS_BE_Gallery.Params[0].asintegeR:=DBLookupComboBox1.KeyValue;
    TSS_BE_Gallery.open;
    DBLookupComboBox6.show;
    SpeedButton27.hide;
  end else
  if ComboBox2.ItemIndex=3 then begin
    SpeedButton27.Show;
  end else begin

  end;
end;

procedure TTSS_BE_ScreenDesigner_Form.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  TSS_BE_KDMedia.Close;
  TSS_BE_KDMedia.Params[0].asintegeR:=DBLookupComboBox1.KeyValue;
  TSS_BE_KDMedia.open;
end;

procedure TTSS_BE_ScreenDesigner_Form.DBLookupComboBox3CloseUp(Sender: TObject);
var
  FPfad:string;
begin
  if TSS_BE_BildMedien.FieldByName('Zuordnung_Typ').asstring='20' then Begin
    FPfad:=TSS_BE_DataForm.MainPath+TSS_BE_BildMedien.FieldByName('Kunden_uid').asstring+'\';
  end else begin
    FPfad:=TSS_BE_DataForm.MainPath+TSS_BE_DataForm.Global_Schematic_id+'\';
  end;

if Fileexists(FPfad+TSS_BE_BildMedien.FieldByName('media_file').asstring) then
  Image1.Picture.LoadFromFile(FPfad+TSS_BE_BildMedien.FieldByName('media_file').asstring);
end;

procedure TTSS_BE_ScreenDesigner_Form.DBLookupComboBox3Enter(Sender: TObject);
begin
  TSS_BE_BildMedien.Close;
  if DBLookupcomboBox1.KeyValue>0 then begin
    TSS_BE_BildMedien.SQL.Text:='select m.* from logumedia.media m inner Join logumedia.kunden k on k.kunden_uid=m.kunden_uid where m.media_typ=101 and k.kunden_id=:kundenid';
    TSS_BE_BildMedien.Params[0].AsString:=DBLookupcomboBox1.KeyValue;
  end else begin
    TSS_BE_BildMedien.SQL.Text:='select m.* from logumedia.media m where media_typ=101 and schematic_id=:schematicid';
    TSS_BE_BildMedien.Params[0].AsString:=TSS_BE_DataForm.Global_Schematic_id;
  end;
  TSS_BE_BildMedien.Open;
end;

procedure TTSS_BE_ScreenDesigner_Form.DBRadioGroup1Change(Sender: TObject);
begin
  Notebook1.PageIndex:=RadioGroup1.ItemIndex;
end;

procedure TTSS_BE_ScreenDesigner_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if SelectedFields<>nil then freeandnil(SelectedFields);
  if FDrawnpanels<>nil then freeandnil(FDrawnpanels);;
end;

procedure TTSS_BE_ScreenDesigner_Form.FormCreate(Sender: TObject);
begin
  SelectedFields:=TStringlist.Create;
  FDrawnpanels:=TStringlist.Create;
  panel2.Hide;
end;

procedure TTSS_BE_ScreenDesigner_Form.FormShow(Sender: TObject);
begin
  TSS_BE_FeldData.Close;
  TSS_BE_FeldData.params[0].AsString:=TSS_BE_DataForm.Global_Schematic_id;
  TSS_BE_FeldData.Open;
end;

procedure TTSS_BE_ScreenDesigner_Form.MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var a,b,c,d,mt,ml,mt2,ml2: Integer;
    mypanel:TFeldpanel;
  I: Integer;
  J: Integer;
  tp:Tpoint;
begin
  if Button=mbLeft then begin
    if TFeldpanel(sender).BevelInner=bvRaised then begin
      if SelectCount=0 then begin
        selectedbutton:=TFeldpanel(sender);
      end else begin
        Panel2.Hide;
      end;
      SelectCount:=Selectcount+1;
      TFeldpanel(sender).BevelInner:=bvLowered;
      TFeldpanel(sender).Color:=clyellow;
      TFeldpanel(sender).Repaint;
      SelectedFields.Add(TFeldpanel(sender).name)
    end else begin
      TFeldpanel(sender).BevelInner:=bvRaised;
      if TFeldpanel(sender).Feldtype=1 then TFeldpanel(sender).color:=clblack
      else if TFeldpanel(sender).FeldStatus=3 then TFeldpanel(sender).color:=rgB(0,0,150)
      else TFeldpanel(sender).color:=clgray;
      SelectCount:=Selectcount-1;
      if SelectCount<0 then begin
        SelectCount:=0;
        SelectedFields.Clear;
        selectedbutton:=nil;
      end else begin
        TFeldpanel(sender).Repaint;
        SelectedFields.Delete(SelectedFields.IndexOf(TFeldpanel(sender).name));
        if SelectCount=0 then selectedbutton:=nil;
      end;
    end;
  end else begin
    if selectcount=-2 then begin
      myPanel:=TFeldpanel(Panel1.FindComponent(SelectedFields.Strings[0]));
      mt:=mypanel.Top;
      ml:=mypanel.Left;
      mt2:=TFeldpanel(sender).Top;
      ml2:=TFeldpanel(sender).left;
      if mt>TFeldpanel(sender).top then begin
        mt:=TFeldpanel(sender).Top;
        mt2:=mypanel.Top;
      end;
      if ml>TFeldpanel(sender).left then begin
        ml:=TFeldpanel(sender).left;
        ml2:=mypanel.Top;
      end;
      a:=mt div 40;
      b:=ml div 40;
      c:=mt2 div 40;
      d:=ml2 div 40;
      for I := a to c-1 do begin
        for J := b to d-1 do begin
          Tp.X:=5+(I*41)+5;
          tp.Y:=5+(I*41)+5;
          mypanel:=TFeldpanel(Panel1.ControlAtPos(Tp,true));
          if mypanel<>nil then begin
            SelectCount:=Selectcount+1;
            Mypanel.BevelInner:=bvLowered;
            MYpanel.Repaint;
          end;
        end;
      end;
    end;
  end;
end;

procedure TTSS_BE_ScreenDesigner_Form.SetSelectCount(const Value: word);
begin
  FSelectCount := Value;
  SelectCountLAbel.Caption:='Ausgewählt : '+inttostr(value);
  if Value>0 then begin
    SpeedButton2.Show;
    SpeedButton7.Show;
    if Value=1 then begin
      SpeedButton3.Show;
      SpeedButton4.Show;
      SpeedButton5.Show;
      SpeedButton6.Show;
    end else begin;
      SpeedButton3.Hide;
      SpeedButton4.Hide;
      SpeedButton5.hide;
      SpeedButton6.hide;
    end;
  end else begin
    SpeedButton2.Hide;
    SpeedButton3.Hide;
    SpeedButton4.Hide;
    SpeedButton5.hide;
    SpeedButton6.hide;
    SpeedButton7.hide;
  end;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton10Click(Sender: TObject);
begin
  panel2.Hide;
  SelectedButton.BevelInner:=bvRaised;
  SelectedButton:=nil;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton11Click(Sender: TObject);
begin
  panel2.Hide;
  SelectedButton.BevelInner:=bvRaised;
  SelectedButton:=nil;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton12Click(Sender: TObject);
begin
  panel2.Hide;
  SelectedButton.BevelInner:=bvRaised;
  SelectedButton:=nil;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton13Click(Sender: TObject);
begin
  panel2.Hide;
  SelectedButton.BevelInner:=bvRaised;
  SelectedButton:=nil;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton14Click(Sender: TObject);
begin
  selectedbutton.Feldtype:=RadioGroup1.ItemIndex;
  selectedbutton.FeldStatus:=3;
  Panel2.Hide;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton15Click(Sender: TObject);
var FPfad:string;
begin
  selectedbutton.Feldtype:=RadioGroup1.ItemIndex;
  selectedbutton.BGImageid:=DBLookupComboBox3.KeyValue;
  selectedbutton.Kundenid:=DBLookupComboBox1.KeyValue;
  selectedbutton.FeldStatus:=3;
  selectedbutton.ButtonActive:=CheckBox1.Checked;
  selectedbutton.ButtonInAction:=Combobox1.ItemIndex;
  selectedbutton.ButtonAction:=Combobox2.ItemIndex;
  if Combobox2.ItemIndex=0 then selectedbutton.ButtonAction_VideoID:=DBLookupComboBox4.KeyValue;
  if Combobox2.ItemIndex=1 then selectedbutton.ButtonAction_VideoID:=DBLookupComboBox5.KeyValue;
  if Combobox2.ItemIndex=2 then selectedbutton.ButtonAction_Gallerie_ID:=DBLookupComboBox6.KeyValue;
  TSS_BE_DataForm.TSS_BE_AlgQuery.Close;
  TSS_BE_DataForm.TSS_BE_AlgQuery.sql.Text:='Select * from media where media_id=:mediaid';
  TSS_BE_DataForm.TSS_BE_AlgQuery.Params[0].AsString:=DBLookupComboBox3.KeyValue;
  TSS_BE_DataForm.TSS_BE_AlgQuery.open;
  if TSS_BE_DataForm.TSS_BE_AlgQuery.recordcount>0 then begin
    if TSS_BE_DataForm.TSS_BE_AlgQuery.FieldByName('Zuordnung_Typ').asstring='20' then Begin
      FPfad:=TSS_BE_DataForm.MainPath+TSS_BE_DataForm.TSS_BE_AlgQuery.FieldByName('Kunden_uid').asstring+'\';
    end else begin
      FPfad:=TSS_BE_DataForm.MainPath+TSS_BE_DataForm.Global_Schematic_id+'\';
    end;
    if Fileexists(FPfad+TSS_BE_DataForm.TSS_BE_AlgQuery.FieldByName('media_file').asstring) then
      selectedbutton.SetImage(FPfad+TSS_BE_DataForm.TSS_BE_AlgQuery.FieldByName('media_file').asstring);
  end;
  SpeedButton27.Hide;
  DBLookupComboBox4.hide;
  Panel2.Hide;
  SelectedButton.BevelInner:=bvRaised;
  SelectedButton:=nil;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton18Click(Sender: TObject);
begin
  kundenaddform.TSS_BE_KundenTable.Open();
  kundenaddform.TSS_BE_KundenTable.Append;
  kundenaddform.showmodal;
  DBLookupComboBox1.listSource.DataSet.Refresh;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton1Click(Sender: TObject);
var
  a: Integer;
  b: Integer;
  Pnl:TFeldpanel;
  c: Integer;
begin
  if Panel1.ComponentCount>0 then
  for c:= 0 to Panel1.ComponentCount do begin
    Panel1.RemoveComponent(Panel1.Components[0]);
  end;
  SelectCount:=0;
  for a := 1 to 20 do begin
    for b := 1 to 11 do begin
      pnl:=TFeldpanel.Create(Panel1);
      pnl.Parent:=panel1;
      pnl.Caption:=CHR(64+a)+inttostr(b);
      pnl.Width:=40;
      pnl.Height:=40;
      pnl.Left:=5+(a-1)*41;
      pnl.Top:=5+(b-1)*41;
      pnl.Tag:=0;
      pnl.Name:='CPanel_'+pnl.Caption;
      pnl.BevelInner:=bvRaised;
      pnl.FeldStatus:=90;
      pnl.Feldtype:=0;
      pnl.Kundenid:=0;
      Pnl.ParentBackground:=false;
      Pnl.ParentColor:=falsE;
      pnl.Color:=clbtnface;
      pnl.UUID:=TSS_BE_DataForm.MYCreateGuid;
      pnl.OnMouseDown:=MouseDown;
    end;
  end;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton20Click(Sender: TObject);
begin
  TSS_BE_KDSelectform.showmodal;
  if TSS_BE_KDSelectform.Take then begin
    if DBLookupComboBox1.ListSource.DataSet.Locate('Kundenkurzname',TSS_BE_KDSelectform.TakeDS,[]) then
      DBLookupComboBox1.KeyValue :=DBLookupComboBox1.ListSource.DataSet.FieldByName(DBLookupComboBox1.KeyField).Value;  end;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton21Click(Sender: TObject);
var maxpos:integer;mysql:string;
begin
  VideoSearchForm.TSS_BE_VideoMedien.close;
  VideoSearchForm.TSS_BE_VideoMedien.Params[0].AsString:=TSS_BE_DataForm.Global_Schematic_id;
  VideoSearchForm.TSS_BE_VideoMedien.open;
  videosearchform.showmodal;
  if VideoSearchForm.selectedfileid<>0 then begin
    mysql:='select max(playlist_pos) as maxp from logumedia.playlists where playlist_uid='''+selectedbutton.UUID+''';';
    TSS_BE_DataForm.TSS_BE_AlgQuery.close;
    TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
    TSS_BE_DataForm.TSS_BE_AlgQuery.open;
    if TSS_BE_DataForm.TSS_BE_AlgQuery.Recordcount=1 then begin
      maxpos:=TSS_BE_DataForm.TSS_BE_AlgQuery.fieldbyname('maxp').AsInteger;
      mysql:='insert into logumedia.playlists (playlist_uid,playlist_media_id,playlist_playtime,playlist_pos) Values ';
      mysql:=mysql+'('''+selectedbutton.UUID+''','+inttostr(VideoSearchForm.selectedfileid)+',10,'+inttostr(maxpos+1)+');';
      TSS_BE_DataForm.TSS_BE_AlgQuery.close;
      TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
      TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
      if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected=1 then begin
        TSS_BE_CenterPlaylist.Close;
        TSS_BE_CenterPlaylist.Params[0].AsString:=selectedbutton.CenterPlaylistUUID;
        TSS_BE_CenterPlaylist.open;
        DBGrid1.Refresh;
      end else messagedlg('Fehler #2/2/1 beim einfügen von Video : '+inttostr(VideoSearchForm.selectedfileid)+#13#10+' in Playliste : '+selectedbutton.uuid+'!!',mtwarning,mbOKCancel,0);
    end else messagedlg('Fehler #2/1/1 beim suche nach max. pos in Playliste : '+selectedbutton.uuid+'!!',mtwarning,mbOKCancel,0);
  end;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton22Click(Sender: TObject);
var plid:integer;
begin
  plid:=DBGrid1.DataSource.DataSet.fieldbyname('playlist_id').asinteger;
  TSS_BE_DataForm.TSS_BE_AlgQuery.close;
  TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:='delete from logumedia.playlists where playlist_id='+inttostr(plid)+';';
  TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
  if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected<>1 then begin
    messagedlg('Fehler #3/1/1 beim löschen aus Playliste : '+selectedbutton.uuid+' - Pos : '+inttostR(plid)+'!!',mtwarning,mbOKCancel,0);
  end;
  TSS_BE_CenterPlaylist.Close;
  TSS_BE_CenterPlaylist.Params[0].AsString:=selectedbutton.CenterPlaylistUUID;
  TSS_BE_CenterPlaylist.open;
  DBGrid1.Refresh;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton25Click(Sender: TObject);
var knr:String;
begin
  KdSearchform.showmodal;
  if KdSearchform.clicked>0 then begin
    if KdSearchform.clicked=1 then begin
      TSS_BE_DataForm.TSS_BE_AlgQuery.Close;
      TSS_BE_DataForm.TSS_BE_AlgQuery.sql.Text:='Select * from logumedia.kunden where Kundennummer like '''+KDSearchForm.SearchText+'''';
      TSS_BE_DataForm.TSS_BE_AlgQuery.open;
      if TSS_BE_DataForm.TSS_BE_AlgQuery.RecordCount=1 then DBLookupComboBox1.KeyValue:=TSS_BE_DataForm.TSS_BE_AlgQuery.fieldbyname('kunden_id').AsInteger;
    end;
    if KdSearchform.clicked=2 then begin
      TSS_BE_DataForm.TSS_BE_AlgQuery.Close;
      TSS_BE_DataForm.TSS_BE_AlgQuery.sql.Text:='Select * from logumedia.kunden where kunden_name_1 like '''+KDSearchForm.SearchText+''' or kunden_name_2 like '''+KDSearchForm.SearchText+'''';
      TSS_BE_DataForm.TSS_BE_AlgQuery.open;
      if TSS_BE_DataForm.TSS_BE_AlgQuery.RecordCount=1 then DBLookupComboBox1.KeyValue:=TSS_BE_DataForm.TSS_BE_AlgQuery.fieldbyname('kunden_id').AsInteger;
    end;
    if KdSearchform.clicked=3 then DBLookupComboBox1.ListSource.DataSet.Locate('Kunden_strasse',KDSearchForm.SearchText,[loCaseInsensitive,loPartialKey]);
  end;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton2Click(Sender: TObject);
var
  a,mt,ml,mb,mr: Integer;
  remF,AllCaption,IDString:string;
  myPanel:TFeldpanel;
begin
  mt:=1000;
  ml:=1000;
  mr:=0;
  mb:=0;
  AllCaption:='';
  remF:='';
  for a := 1 to SelectedFields.count do begin
    myPanel:=TFeldpanel(Panel1.FindComponent(SelectedFields.Strings[a-1]));
    if mt>Mypanel.top then mt:=mypanel.Top;
    if ml>Mypanel.left then ml:=mypanel.left;
    if mr<(Mypanel.left+Mypanel.Width) then mr:=(Mypanel.left+Mypanel.Width);
    if mb<(Mypanel.top+Mypanel.height) then mb:=(Mypanel.top+Mypanel.height);
    if mypanel.DBFeldid>0 then remf:=remf+'/'+inttostr(mypanel.DBFeldid);
    if mypanel.RemoveFields<>'' then remf:=remf+mypanel.RemoveFields;
    IDString:=copy(mypanel.Name,pos('_',mypanel.Name)+1,length(mypanel.Name));
    AllCaption:=AllCaption+IDString;
    mypanel.Destroy;
  end;
  if TSS_BE_DataForm.Debug then Messagedlg('ermittelt : Top: '+inttostR(mt)+' Left: '+inttostr(ml)+' Bottom: '+inttostr(mb)+' Right: '+inttostR(mr),mtinformation,mbokcancel,0);
  myPanel:=TFeldpanel.Create(panel1);
  mypanel.Parent:=panel1;
  mypanel.Left:=ml;
  Mypanel.Top:=mt;
  mypanel.Width:=mr-ml;
  mypanel.height:=mb-mt;
  mypanel.Name:= TSS_BE_Dataform.compNameCreate;
  mypanel.Caption:='unbek.';
  mypanel.BevelInner:=bvRaised;
  mypanel.OnMouseDown:=MouseDown;
  myPanel.RemoveFields:=remF;
  mypanel.FeldStatus:=99;
  mypanel.Feldtype:=0;
  mypanel.Kundenid:=0;
  mypanel.ParentBackground:=false;
  mypanel.ParentColor:=falsE;
  mypanel.Color:=clbtnface;
  mypanel.UUID:=TSS_BE_DataForm.MYCreateGuid;
  mypanel.CenterPlaylistUUID:=mypanel.uuid;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton3Click(Sender: TObject);
var a,mt,ml,mw,mh: Integer;
    mypanel:TFeldpanel;
begin
  myPanel:=TFeldpanel(Panel1.FindComponent(SelectedFields.Strings[0]));
  mt:=Mypanel.Top;
  ml:=mypanel.Left;
  mw:=mypanel.Width;
  mh:=mypanel.Height;
  mypanel.Destroy;
  for a := 1 to (mw div 40) do begin
    Mypanel:=TFeldpanel.Create(panel1);
    Mypanel.Parent:=panel1;
    mypanel.Name:=TSS_BE_Dataform.compNameCreate;
    Mypanel.Top:=mt;
    Mypanel.Left:=ml+(a-1)*41;
    Mypanel.Width:=40;
    mypanel.Height:=mh;
    mypanel.BevelInner:=bvRaised;
    mypanel.OnMouseDown:=MouseDown;
    mypanel.Caption:='unbek.';
    mypanel.FeldStatus:=99;
    mypanel.Feldtype:=0;
    mypanel.Kundenid:=0;
    mypanel.ParentBackground:=false;
    mypanel.ParentColor:=falsE;
    mypanel.Color:=clbtnface;
    mypanel.UUID:=TSS_BE_DataForm.MYCreateGuid;
    mypanel.CenterPlaylistUUID:=mypanel.uuid;
  end;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton4Click(Sender: TObject);
var a,mt,ml,mw,mh: Integer;
    mypanel:TFeldpanel;
begin
  myPanel:=TFeldpanel(Panel1.FindComponent(SelectedFields.Strings[0]));
  mt:=Mypanel.Top;
  ml:=mypanel.Left;
  mw:=mypanel.Width;
  mh:=mypanel.Height;
  mypanel.Destroy;
    for a := 1 to (mh div 40) do begin
      Mypanel:=TFeldpanel.Create(panel1);
      Mypanel.Parent:=panel1;
      mypanel.Name:=TSS_BE_Dataform.compNameCreate;
      Mypanel.Top:=mt+(a-1)*41;
      Mypanel.Left:=ml;
      Mypanel.Width:=mw;
      mypanel.Height:=40;
      mypanel.BevelInner:=bvRaised;
      mypanel.OnMouseDown:=MouseDown;
      mypanel.Caption:='unbek.';
      mypanel.FeldStatus:=99;
      mypanel.Feldtype:=0;
      mypanel.Kundenid:=0;
      mypanel.ParentBackground:=false;
      mypanel.ParentColor:=falsE;
      mypanel.Color:=clbtnface;
      mypanel.UUID:=TSS_BE_DataForm.MYCreateGuid;
      mypanel.CenterPlaylistUUID:=mypanel.uuid;
    end;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton5Click(Sender: TObject);
var s:String;
   mypanel:TFeldpanel;
begin
  myPanel:=TFeldpanel(Panel1.FindComponent(SelectedFields.Strings[0]));
  S:=inputbox('Neuer Name ? ','Wie soll das Feld heissen ?',Mypanel.caption);
  mypanel.Caption:=s;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton6Click(Sender: TObject);
var FPfad:String;
begin
  Notebook1.PageIndex:=selectedbutton.Feldtype;
  RadioGroup1.ItemIndex:=selectedbutton.Feldtype;
  TSS_BE_SingleFeld.cancel;
  TSS_BE_SingleFeld.Close;
  TSS_BE_SingleFeld.Params[0].asinteger:=selectedbutton.DBFeldid;
  TSS_BE_SingleFeld.Open();
  CheckBox1.Checked:=selectedbutton.ButtonActive;
  Combobox1.ItemIndex:=selectedbutton.ButtonInAction;
  Combobox2.ItemIndex:=selectedbutton.ButtonAction;
  TSS_BE_KundenDaten.Close;
  TSS_BE_KundenDaten.open;
  TSS_BE_BildMedien.Close;
  TSS_BE_BildMedien.Params[0].AsString:=TSS_BE_DataForm.Global_Schematic_id;
  TSS_BE_BildMedien.open;
  TSS_BE_Vertragsdaten.Close;
  TSS_BE_Vertragsdaten.Params[0].AsString:=selectedbutton.UUID;
  TSS_BE_Vertragsdaten.open;
  DBLookupComboBox3.KeyValue:=selectedbutton.BGImageid;
  DBLookupComboBox1.KeyValue:=selectedbutton.Kundenid;
  TSS_BE_KDMedia.Close;
  TSS_BE_KDMedia.Params[0].asintegeR:=selectedbutton.Kundenid;
  TSS_BE_KDMedia.open;
  DBLookupComboBox5.Hide;
  DBLookupComboBox4.Hide;
  TSS_BE_Gallery.Close;
  TSS_BE_Gallery.Params[0].asinteger:=selectedbutton.Kundenid;
  TSS_BE_Gallery.open;
  DBLookupComboBox6.Hide;
  if selectedbutton.ButtonAction=0 then begin
    DBLookupComboBox4.KeyValue:=selectedbutton.ButtonAction_VideoID;
    DBLookupComboBox4.show;
  end else
  if selectedbutton.ButtonAction=1 then begin
    TSS_BE_KDMedia.Close;
    TSS_BE_KDMedia.Params[0].asintegeR:=DBLookupComboBox1.KeyValue;
    TSS_BE_KDMedia.open;
    DBLookupComboBox5.KeyValue:=selectedbutton.ButtonAction_VideoID;
    DBLookupComboBox5.show;
    SpeedButton27.Show;
  end else
  if selectedbutton.ButtonAction=2 then begin
    DBLookupComboBox6.KeyValue:=selectedbutton.ButtonAction_Gallerie_ID;
    DBLookupComboBox6.show;
    SpeedButton27.Show;
  end else
  if selectedbutton.ButtonAction=3 then begin
    SpeedButton27.Show;
  end else begin
    messagedlg('Fehler #12/1/1 beim Darstellen von Felddaten : '+selectedbutton.caption+' !!',mtwarning,mbOKCancel,0);
  end;
  label3.Caption:=selectedbutton.UUID;
  label4.Caption:=inttostr(selectedbutton.DBFeldid)+'/'+inttostr(selectedbutton.Kundenid)+'/';
  if selectedbutton.Feldtype=0 then begin
    if TSS_BE_BildMedien.FieldByName('Zuordnung_Typ').asstring='20' then Begin
      FPfad:=TSS_BE_DataForm.MainPath+TSS_BE_BildMedien.FieldByName('Kunden_uid').asstring+'\';
    end else begin
      FPfad:=TSS_BE_DataForm.MainPath+TSS_BE_DataForm.Global_Schematic_id+'\';
    end;
    if Fileexists(TSS_BE_DataForm.MainPath+TSS_BE_DataForm.Global_Schematic_id+'\'+TSS_BE_BildMedien.FieldByName('media_file').asstring) then
      Image1.Picture.LoadFromFile(TSS_BE_DataForm.MainPath+TSS_BE_DataForm.Global_Schematic_id+'\'+TSS_BE_BildMedien.FieldByName('media_file').asstring);
    TSS_BE_CenterPlaylist.Close;
    TSS_BE_CenterPlaylist.Params[0].AsString:=selectedbutton.CenterPlaylistUUID;
    TSS_BE_CenterPlaylist.open;
  end;
  Panel2.Show;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton7Click(Sender: TObject);
var
  a: Integer;
  myPanel:TFeldpanel;
begin
  for a := 1 to SelectedFields.count do begin
    myPanel:=TFeldpanel(Panel1.FindComponent(SelectedFields.Strings[a-1]));
    mypanel.Destroy;
  end;
  SelectedFields.Clear;
  selectcount:=0;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton8Click(Sender: TObject);
var selectdisplay,mysql:String;
    a,b,I,J,c:integer;
    Mypanel,pnl:TFeldpanel;
    FPfad:string;
begin
  selectdisplay:=DBLookupComboBox2.KeyValue;
  if selectdisplay<>'' then begin
    if Panel1.ComponentCount>0 then
    for c:= 0 to Panel1.ComponentCount-1 do begin
      Panel1.RemoveComponent(Panel1.Components[0]);
    end;
    SelectCount:=0;
    TSS_BE_FeldData.close;
    TSS_BE_FeldData.Params[0].AsString:=selectdisplay;
    TSS_BE_FeldData.Open;
    if TSS_BE_FeldData.recordcount>0 then begin
      TSS_BE_FeldData.first;
      repeat
        Mypanel:=TFeldpanel.Create(panel1);
        Mypanel.Parent:=panel1;
        mypanel.Name:=TSS_BE_Dataform.compNameCreate;
        Mypanel.Top:=(((TSS_BE_FeldData.FieldByName('posy').asinteger-1)*41)+5);
        Mypanel.Left:=(((TSS_BE_FeldData.FieldByName('posx').asinteger-1)*41)+5);
        Mypanel.Width:=(((TSS_BE_FeldData.FieldByName('sizex').asinteger)*41)-1);;
        mypanel.Height:=(((TSS_BE_FeldData.FieldByName('sizey').asinteger)*41)-1);
        for I := 0 to TSS_BE_FeldData.FieldByName('sizex').asinteger-1 do begin
          for J := 0 to TSS_BE_FeldData.FieldByName('sizey').asinteger-1 do begin
            FDrawnpanels.Add(inttostr((TSS_BE_FeldData.FieldByName('posy').asinteger-1+J)*20+TSS_BE_FeldData.FieldByName('posx').asinteger+I));
          end;
        end;
        mypanel.BevelInner:=bvRaised;
        mypanel.name:=TSS_BE_DataForm.compNameCreate;
        mypanel.OnMouseDown:=MouseDown;
        Mypanel.UUID:=TSS_BE_FeldData.FieldByName('feld_uuid').asstring;
        mypanel.CenterPlaylistUUID:=TSS_BE_FeldData.FieldByName('feld_uuid').asstring;
        mypanel.ParentColor:=false;
        Mypanel.ParentBackground:=false;
        Mypanel.Color:=clGray;
        Mypanel.FeldStatus:=1;
        Mypanel.DBFeldid:=TSS_BE_FeldData.FieldByName('feld_id').asinteger;
        Mypanel.BGImageid:=TSS_BE_FeldData.FieldByName('Button_media_id').asinteger;
        Mypanel.Kundenid:=TSS_BE_FeldData.FieldByName('kunden_id').asinteger;
        Mypanel.Feldtype:=TSS_BE_FeldData.FieldByName('feld_typ').asinteger;
        mypanel.Caption:=TSS_BE_FeldData.FieldByName('feld_name').asstring;
        mypanel.ButtonActive:=TSS_BE_FeldData.FieldByName('button_active').AsBoolean;
        mypanel.ButtonInAction:=TSS_BE_FeldData.FieldByName('button_action_InactiveClick').asinteger;
        mypanel.ButtonAction:=TSS_BE_FeldData.FieldByName('button_action_activeClick').asinteger;
        mypanel.ButtonAction_Gallerie_ID:=TSS_BE_FeldData.FieldByName('click_gallery_id').asstring;
        if (TSS_BE_FeldData.FieldByName('click_playlist_id').asstring<>'') and (TSS_BE_FeldData.FieldByName('click_playlist_id').asstring<>'0') then begin
          mypanel.ButtonAction_Video_PlaylistID:=TSS_BE_FeldData.FieldByName('click_playlist_id').asstring;
          mysql:='select * from logumedia.playlists where playlist_uid='''+mypanel.ButtonAction_Video_PlaylistID+'''';
          TSS_BE_DataForm.TSS_BE_AlgQuery.close;
          TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
          TSS_BE_DataForm.TSS_BE_AlgQuery.open;
          if TSS_BE_DataForm.TSS_BE_AlgQuery.recordcount>1 then begin
            messagedlg('Fehler #7/2/1 beim laden Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
          end else
          if TSS_BE_DataForm.TSS_BE_AlgQuery.recordcount<1 then begin
            mypanel.ButtonAction_VideoID:=0;
          end else begin
            mypanel.ButtonAction_VideoID:=TSS_BE_DataForm.TSS_BE_AlgQuery.FieldByName('playlist_media_id').AsInteger;
          end;
        end else begin
          mypanel.ButtonAction_Video_PlaylistID:=TSS_BE_DataForm.MYCreateGuid;
        end;
        Mypanel.RemoveFields:='';
        if TSS_BE_FeldData.FieldByName('Zuordnung_Typ').asstring='20' then Begin
          FPfad:=TSS_BE_DataForm.MainPath+TSS_BE_FeldData.FieldByName('Kunden_uid').asstring+'\';
        end else begin
          FPfad:=TSS_BE_DataForm.MainPath+selectdisplay+'\';
        end;
        if Fileexists(FPfad+TSS_BE_FeldData.FieldByName('media_file').asstring) then
          Mypanel.SetImage(FPfad+TSS_BE_FeldData.FieldByName('media_file').asstring)
        else begin
          mypanel.visible:=true;
        end;
        if Mypanel.Feldtype=1 then Mypanel.color:=clblack else Mypanel.color:=clgray;
        mypanel.Repaint;
        TSS_BE_FeldData.next;
      until TSS_BE_FeldData.eof;
    end;
    for a := 1 to 20 do begin
      for b := 1 to 11 do begin
        if FDrawnpanels.IndexOf(inttostr((b-1)*20+a))=-1 then begin
          pnl:=TFeldpanel.Create(Panel1);
          pnl.Parent:=panel1;
          pnl.Caption:=CHR(64+a)+inttostr(b);
          pnl.RemoveFields:='';
          pnl.Width:=40;
          pnl.Height:=40;
          pnl.Left:=5+(a-1)*41;
          pnl.Top:=5+(b-1)*41;
          pnl.Tag:=0;
          pnl.Name:='CPanel_'+pnl.Caption;
          pnl.BevelInner:=bvRaised;
          pnl.FeldStatus:=90;
          pnl.Feldtype:=0;
          pnl.Kundenid:=0;
          Pnl.ParentBackground:=false;
          Pnl.ParentColor:=falsE;
          pnl.Color:=clbtnface;
          pnl.OnMouseDown:=MouseDown;
          pnl.ButtonActive:=false;
          pnl.ButtonAction:=0;
          pnl.ButtonInAction:=0;
          pnl.ButtonAction_Video_PlaylistID:=TSS_BE_DataForm.MYCreateGuid;
          pnl.UUID:=TSS_BE_DataForm.MYCreateGuid;
          pnl.CenterPlaylistUUID:=pnl.uuid
        end;
      end;
    end;
    TSS_BE_FeldData.close;
  end;
end;

procedure TTSS_BE_ScreenDesigner_Form.SpeedButton9Click(Sender: TObject);
var
  I: Integer;
  mypanel:Tfeldpanel;
  px,py,sx,sy,mysql:string;
  mycontinue:boolean;
begin
  for I := 0 to Panel1.ComponentCount-1 do begin
    myPanel:=TFeldpanel(Panel1.Components[I]);
    if mypanel.FeldStatus>1 then begin
      if mypanel.FeldStatus=99 then begin
        px:=inttostr(((mypanel.Left-5) div 40)+1);
        py:=inttostr(((mypanel.top-5) div 40)+1);
        sx:=inttostr(mypanel.Width div 40);
        sy:=inttostr(mypanel.Height div 40);
        mysql:='Insert into logumedia.felder (feld_name,kunden_id,posx,posy,sizex,sizey,button_media_id,center_playlist_id,click_playlist_id,click_gallery_id,feld_Typ,feld_uuid,button_active,button_action_inactiveclick,button_action_activeclick) Values ';
        mysql:=mysql+'('''+mypanel.Caption+''','+inttostr(mypanel.Kundenid)+','+px+','+py+','+sx+','+sy+','+inttostr(mypanel.BGImageid)+',0,'''+mypanel.ButtonAction_Video_PlaylistID+''','''+mypanel.ButtonAction_Gallerie_ID+''','+inttostr(mypanel.Feldtype)+','''+mypanel.UUID+''','+Booltostr(mypanel.ButtonActive)+','+inttostr(mypanel.ButtonInAction)+','+inttostr(mypanel.ButtonAction)+');';  //,'+inttostr(mypanel.ButtonAction_VideoID)+'
        TSS_BE_DataForm.TSS_BE_AlgQuery.close;
        TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
        TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
        if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected=1 then begin
          mysql:='select feld_id from logumedia.felder where feld_uuid ='''+mypanel.UUID+'''';
          TSS_BE_DataForm.TSS_BE_AlgQuery.close;
          TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
          TSS_BE_DataForm.TSS_BE_AlgQuery.open;
          if TSS_BE_DataForm.TSS_BE_AlgQuery.Recordcount=1 then begin
            mysql:='insert into schematic (schematic_id,feld_id) values ('''+DBLookupComboBox2.KeyValue+''','+TSS_BE_DataForm.TSS_BE_AlgQuery.fieldbyname('feld_id').asstring+')';
            TSS_BE_DataForm.TSS_BE_AlgQuery.close;
            TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
            TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
            if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected<>1 then begin
              messagedlg('Fehler #1/99/3 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
            end else begin
              mysql:='select * from logumedia.playlists where playlist_uid='''+mypanel.ButtonAction_Video_PlaylistID+'''';
              TSS_BE_DataForm.TSS_BE_AlgQuery.close;
              TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
              TSS_BE_DataForm.TSS_BE_AlgQuery.open;
              if TSS_BE_DataForm.TSS_BE_AlgQuery.recordcount>1 then begin
                messagedlg('Fehler #6/1/1 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
                mycontinue:=false;
              end else
              if TSS_BE_DataForm.TSS_BE_AlgQuery.recordcount<1 then begin
                mysql:='insert into logumedia.playlists (playlist_uid)  values ('''+mypanel.ButtonAction_Video_PlaylistID+''')';
                TSS_BE_DataForm.TSS_BE_AlgQuery.close;
                TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
                TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
                if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected=1 then begin
                  mycontinue:=true;
                end else begin
                  messagedlg('Fehler #6/1/2 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
                  mycontinue:=false;
                end;
              end else begin
                mycontinue:=true;
              end;
              if mycontinue then begin
                mysql:='update logumedia.playlists set playlist_media_id='+inttostr(mypanel.ButtonAction_VideoID)+' where playlist_uid='''+mypanel.ButtonAction_Video_PlaylistID+'''';
                TSS_BE_DataForm.TSS_BE_AlgQuery.close;
                TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
                TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
                if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected=1 then begin
                end else begin
                  messagedlg('Fehler #6/2/2 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
                end;
              end;
            end;
          end else messagedlg('Fehler #1/99/2 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
        end else messagedlg('Fehler #1/99/1 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
      end else
      if mypanel.FeldStatus=3 then begin
        mysql:='update logumedia.felder set kunden_id='+inttostr(mypanel.Kundenid)+', button_media_id='+inttostr(mypanel.BGImageid)+', feld_Typ='+inttostr(mypanel.Feldtype)+', Button_active='+BoolToStr(mypanel.ButtonActive)+', Button_Action_inactiveclick='+inttostr(mypanel.ButtonInAction)+', Button_action_activeclick='+inttostr(mypanel.ButtonAction)+', Button_action_activeclick='+inttostr(mypanel.ButtonAction)+', click_playlist_id='''+mypanel.ButtonAction_Video_PlaylistID+''', click_gallery_id='''+mypanel.ButtonAction_Gallerie_ID+''' where feld_uuid='''+mypanel.UUID+'''';
        TSS_BE_DataForm.TSS_BE_AlgQuery.close;
        TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
        TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
        if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected=1 then begin
          mysql:='select * from logumedia.playlists where playlist_uid='''+mypanel.ButtonAction_Video_PlaylistID+'''';
          TSS_BE_DataForm.TSS_BE_AlgQuery.close;
          TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
          TSS_BE_DataForm.TSS_BE_AlgQuery.open;
          if TSS_BE_DataForm.TSS_BE_AlgQuery.recordcount<1 then begin
            mysql:='insert into logumedia.playlists (playlist_uid)  values ('''+mypanel.ButtonAction_Video_PlaylistID+''');';
            TSS_BE_DataForm.TSS_BE_AlgQuery.close;
            TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
            TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
            if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected=1 then begin
              mycontinue:=true;
              mypanel.feldstatus:=1;
            end else begin
              messagedlg('Fehler #5/3/1 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
              mycontinue:=False;
            end;
          end else
          if TSS_BE_DataForm.TSS_BE_AlgQuery.recordcount>1 then begin
            messagedlg('Fehler #5/3/2 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
            mycontinue:=False;
          end else begin
            mycontinue:=true;
          end;
          if mycontinue then begin
            mysql:='update logumedia.playlists set playlist_media_id='+inttostr(mypanel.ButtonAction_VideoID)+' where playlist_uid='''+mypanel.ButtonAction_Video_PlaylistID+'''';
            TSS_BE_DataForm.TSS_BE_AlgQuery.close;
            TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
            TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
            if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected=1 then begin
            end else begin
              messagedlg('Fehler #6/4/4 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
            end;
          end;
    end else messagedlg('Fehler #1/3/1 beim einfügen von Feld : '+mypanel.caption+' !!',mtwarning,mbOKCancel,0);
      end;
    end;
  end;
   mysql:='update logumedia.displays set UpdateID='''+TSS_BE_DataForm.MYCreateGuid+''' where schematic_id='''+DBLookupComboBox2.KeyValue+'''';
  TSS_BE_DataForm.TSS_BE_AlgQuery.close;
  TSS_BE_DataForm.TSS_BE_AlgQuery.SQL.text:=mysql;
  TSS_BE_DataForm.TSS_BE_AlgQuery.ExecSQL;
  if TSS_BE_DataForm.TSS_BE_AlgQuery.RowsAffected=1 then begin
  end else begin
    messagedlg('Fehler #7/4/1 beim Updateeintrag !!',mtwarning,mbOKCancel,0);
  end;
end;

end.
