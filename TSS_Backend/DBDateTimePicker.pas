unit DBDateTimePicker;
(*
TDBDateTimePicker,(c) 2000-2006 Brad Prendergast (bradp@bpsoftware.com),
                  http://www.bpsoftware.com/products/delphi.htm

Version: 1.6.1.0, Jan 04, 2006

TDBDateTimePicker is a data-aware descendant of native TDateTimepicker control.
This TDBDateTimePicker control also displays a blank value for a no date value.


New:
  Properties -
    DataField: String - Specifies the field which the DBDateTimePicker control displays data.
    DataSource: TDataSource - Links the DBDateTimePickerControl to the dataset that contains
                              the field it represents.


There is no guarantee or warranty, expressed or implied, concerning the applicability of
code and techniques included in this example.  This example code is supplied AS IS.  If
you wish to use this code or technique, it is your responsibility to test and certify
the code in your project.
*)
interface

uses
  system.SysUtils, system.Classes, vcl.Controls, vcl.ComCtrls,Messages,data.DB, vcl.DBCtrls,
  CommCtrl,
  {$IFDEF WIN32}
    Windows, vcl.Graphics, vcl.Forms, vcl.Dialogs{$IFDEF VER170}, Variants{$ENDIF}
   {$ELSE}
  System.ComponentModel, Borland.Vcl.Variants
   {$ENDIF}
  ;

type
  TDBDateTimePicker = class(TDateTimePicker)
  private
    { Private declarations }
    FDataLink: TFieldDataLink;
    FFocused: Boolean;

   Function GetDataField: string;
   Function GetDataSource: TDataSource;
   Procedure SetDataField(const Value: string);
   Procedure SetDataSource(Value: TDataSource);
   Procedure DataChange(Sender: TObject);
   Procedure DataUpdate(Sender: TObject);
   procedure CMExit(var Message: TCMExit); message CM_EXIT;
   procedure CMEnter(var Message: TCMEnter); message CM_ENTER;

  protected
    { Protected declarations }
    procedure Change; override;
    procedure Reset;
    procedure ResetDateFormat;
  public
    { Public declarations }
  Constructor Create(AOwner: TComponent); override;
  Destructor Destroy; override;
  published
    { Published declarations }
    Property DataField: string read GetDataField write SetDataField;
    Property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

procedure Register;

implementation

{ TDBDateTimePicker }
Constructor TDBDateTimePicker.Create(AOwner: TComponent);
Begin
  inherited Create(AOwner);
  FDataLink:= TFieldDataLink.Create;
  FDataLink.Control:= Self;
  FDataLink.OnDataChange:= DataChange;
  FDataLink.OnUpdateData:= DataUpdate;
End;

Destructor TDBDateTimePicker.Destroy;
Begin
  FDataLink.OnDataChange:= nil;
  FDataLink.OnUpdateData:= nil;
  FDataLink.Free;
  FDataLink:= nil;
  inherited Destroy;
End;

Function TDBDateTimePicker.GetDataField: string;
Begin
  Result:= FDataLink.FieldName;
End;

Function TDBDateTimePicker.GetDataSource: TDataSource;
Begin
  Result:= FDataLink.DataSource;
End;

Procedure TDBDateTimePicker.SetDataField(const value: string);
Begin
  FDataLink.FieldName:= Value;
End;

Procedure TDBDateTimePicker.SetDataSource(Value: TDataSource);
Begin
  FDataLink.DataSource:= Value;
End;
{
Procedure TDBDateTimePicker.DataChange(Sender: TObject);
Begin
  if not assigned( FDataLink.Field ) then
    exit;
  if ( DataSource.DataSet.State in [dsEdit, dsInsert] ) then
    begin
      if (FDataLink.field <> nil) then
        begin
          if FDataLink.CanModify then
            begin
              DateTime:= FDataLink.Field.AsDateTime;
            end
          else
            begin
              DateTime:= StrToDateTime(FDataLink.Field.AsString);
              if FDataLink.Editing then
                FDataLink.Modified;
            end;
          end;
        end
      else
        begin
          DateTime := FDataLink.Field.AsDateTime;
        end;
      If ((FDataLink.Field <> nil) and (FDataLink.Field.AsString = '') and (Kind = dtkDate)) then
        begin
          DateTime_SetFormat(Handle,'''''');
          /* for opening calendar */
          DateTime:= Now();/* and Now date in calendar is actual */
        end
      Else
        ResetDateFormat;
End;
}
Procedure TDBDateTimePicker.DataChange(Sender: TObject);
Begin
  if (FDataLink.field <> nil) then
    begin
      if (FFocused and FDataLink.CanModify) or (fDataLink.DataSource.State = dsBrowse) then
        DateTime:= FDataLink.Field.AsDateTime;
    end
  else
    begin
      DateTime:= StrToDateTime(FDataLink.Field.AsString);
      if FDataLink.Editing then
        FDataLink.Modified;
    end;

  if ((FDataLink.Field <> nil) and (FDataLink.Field.AsString = '')
       and (Kind = dtkDate)) then
    begin
      DateTime_SetFormat(Handle,'''''');
      DateTime:= Now(); { and Now date in calendar is actual suggested by Jan Tobolík  [tobolik@email.cz]}
    end
  else
    ResetDateFormat;
End;

Procedure TDBDateTimePicker.DataUpdate(Sender: TObject);
Begin
  if FDataLink.CanModify then
    FDataLink.field.AsDateTime:= DateTime;
End;

Procedure TDBDateTimePicker.Change;
Begin
  if not(FDataLink.Editing) then
    FDataLink.Edit;
  FDataLink.Modified;
  ResetDateFormat;
  inherited;
End;

procedure TDBDateTimePicker.CMExit(var Message: TCMExit);
begin
   try
      FDataLink.UpdateRecord;
      FFocused:= False;
   except
    SetFocus;
    raise;
   end;
   inherited;
end;

procedure TDBDateTimePicker.CMEnter(var Message: TCMEnter);
begin
  FFocused:= True;
  inherited;
  FDataLink.CanModify;
end;

procedure TDBDateTimePicker.Reset;
begin
  FDataLink.Reset;
end;

procedure TDBDateTimePicker.ResetDateFormat;
begin
  case DateFormat of
    {$IFDEF WIN32}
    dfShort: DateTime_SetFormat(Handle,PChar(FormatSettings.ShortDateFormat));
    dfLong: DateTime_SetFormat(Handle,PChar(FormatSettings.LongDateFormat));
    {$ELSE}
    dfShort: DateTime_SetFormat(Handle,FormatSettings.ShortDateFormat);
    dfLong: DateTime_SetFormat(Handle,FormatSettings.LongDateFormat);
    {$ENDIF}
  end;
end;

procedure Register;
begin
  RegisterComponents('BPComponents',[TDBDateTimePicker]);
end;

end.
