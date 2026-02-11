unit TSS_FE_BtnVisibleListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,TSS_ButtonClass_unit;

type
  TBtnVisibleList = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckListBox1: TCheckListBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  BtnVisibleList: TBtnVisibleList;

implementation

{$R *.dfm}

uses TSS_FE_DataForm;

procedure TBtnVisibleList.Button1Click(Sender: TObject);
var a:word;sh:TTSS_Button;
begin
  for a:=0 to dataform.ButtonList.Count-1 do begin
    sh:=dataform.ButtonList.items[a];
    sh.Buttonvisible:=CheckListBox1.checked[a];
    sh.visible:=CheckListBox1.checked[a];
    sh.parent.Repaint;
    sh.SaveButtonSelf;
  end;
  self.close;
end;

procedure TBtnVisibleList.Button2Click(Sender: TObject);
begin
  self.close;
end;

procedure TBtnVisibleList.FormShow(Sender: TObject);
var a:word;sh:TTSS_Button;
begin
  for a:=0 to dataform.ButtonList.Count-1 do begin
    sh:=dataform.ButtonList.items[a];
    CheckListBox1.items.add(sh.Buttonid+'/'+sh.KundenName);
    CheckListBox1.Checked[a]:=sh.Buttonvisible;
  end;
end;

end.
