unit CenterVideo_class_unit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,TSS_HttpButtonImgLoadThread_unit, Vcl.OleCtrls, WMPLib_TLB,
  Vcl.StdCtrls,system.inifiles,system.contnrs;

type
TCVItemtyp = (tcvitem_video=1,tcvitem_image=2);

TCenterVideoItem = class(TObject)
  published
  private
    FItemTyp: TCVItemtyp;
    FItemDuration: word;
    FItemFile: String;
    FLastplayed: tdatetime;
    procedure SetItemTyp(const Value: TCVItemtyp);
    procedure SetItemDuration(const Value: word);
    procedure SetItemFile(const Value: String);
    procedure SetLastplayed(const Value: tdatetime);
  public
    property ItemTyp:TCVItemtyp read FItemTyp write SetItemTyp;
    property ItemFile:String read FItemFile write SetItemFile;
    property ItemDuration:word read FItemDuration write SetItemDuration;
    property Lastplayed:tdatetime read FLastplayed write SetLastplayed;
end;

TCenterVideoList = class(TObjectList)
  public
    procedure SaveToFile(Filename:string);
    procedure AddImage(s:string;dur:worD);
    procedure AddVideo(s:string);
    function Getastext:String;
end;

implementation

{ CenterViceo }

procedure TCenterVideoList.AddImage(s: string; dur: worD);
var cv1:TCenterVideoItem;
begin
  cv1:=TCenterVideoItem.create;
  cv1.ItemTyp:=tcvitem_image;
  cv1.ItemFile:=s;
  cv1.ItemDuration:=dur;
  self.Add(cv1);
end;

procedure TCenterVideoList.AddVideo(s: string);
var cv1:TCenterVideoItem;
begin
  cv1:=TCenterVideoItem.create;
  cv1.ItemTyp:=tcvitem_video;
  cv1.ItemFile:=s;
  cv1.ItemDuration:=0;
  self.Add(cv1);
end;

function TCenterVideoList.Getastext: String;
var s:string;
begin
  Result:=s;
end;

procedure TCenterVideoList.SaveToFile(Filename: string);
var f:TIniFile;a,Videos,Images:worD;
begin
  f:=Tinifile.Create(Filename);
  f.EraseSection('Content');
  f.EraseSection('Videos');
  f.EraseSection('Images');
  Videos:=0;
  Images:=0;
  for a:= 0 to Count-1 do begin
    if TCenterVideoItem(items[a]).FItemTyp=tcvitem_video then begin
      inc(Videos);
      f.WriteString('Videos','Video'+inttostr(Videos)+'File',TCenterVideoItem(items[a]).ItemFile);
      f.WriteInteger('Videos','Video'+inttostr(Videos)+'Duration',TCenterVideoItem(items[a]).ItemDuration);
    end else if TCenterVideoItem(items[a]).FItemTyp=tcvitem_image then begin
      inc(Images);
      f.WriteString('Images','Image'+inttostr(Images)+'File',TCenterVideoItem(items[a]).ItemFile);
      f.WriteInteger('Images','Image'+inttostr(Images)+'Duration',TCenterVideoItem(items[a]).ItemDuration);
    end;
  end;
  f.WriteInteger('Content','Videos',videos);
  f.WriteInteger('Content','Images',Images);
end;

procedure TCenterVideoItem.SetItemDuration(const Value: word);
begin
  FItemDuration := Value;
end;

procedure TCenterVideoItem.SetItemFile(const Value: String);
begin
  FItemFile := Value;
end;

procedure TCenterVideoItem.SetItemTyp(const Value: TCVItemtyp);
begin
  FItemTyp := Value;
end;

procedure TCenterVideoItem.SetLastplayed(const Value: tdatetime);
begin
  FLastplayed := Value;
end;

end.
