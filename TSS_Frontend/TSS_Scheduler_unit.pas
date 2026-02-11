unit TSS_Scheduler_unit;

interface

uses System.Contnrs, Vcl.ExtCtrls, Sysutils, system.DateUtils,dsLeds,Vcl.Graphics;

type

Ttask=class(Tobject)
  ID:string;
  day:smallint;
  time:Ttime;
  ExeCoptions:integer;
  SysCommand,ExeCommand,CommandParam:String;
end;

Ttasklist=class(Tobjectlist)
end;

TTaskNotifyEvent = procedure(ID:string;Task:TTask) of object;


TTSS_Scheduler=class
  private
    FTimer:Ttimer;
    FTasklist:Ttasklist;
    FPriortime:Ttime;
    FStarted:boolean;
    FOnTask: TTaskNotifyEvent;
    FCheckInterval: Integer;
    FStatusLed: TdsLed;
    procedure checktask(sender:Tobject);
    procedure SetCheckInterval(const Value: Integer);
    procedure SetStatusLed(const Value: TdsLed);
  published
    property OnTask: TTaskNotifyEvent read FOnTask write FOnTask;
    property Started: boolean read Fstarted write Fstarted;
    property CheckInterval: Integer read FCheckInterval write SetCheckInterval;
    property StatusLed:TdsLed read FStatusLed write SetStatusLed;
  public
    function Addtask:Ttask;
    constructor create;
    destructor destroy;
    procedure start;
    procedure stop;
end;

implementation

function TTSS_Scheduler.addtask:Ttask;
var
  t:TTask;
begin
  t:=Ttask.create;
  Ftasklist.add(t);
  result:=t;
  if assigned(FStatusLed) then FStatusLed.ShowHint:=True;
  if assigned(FStatusLed) then FStatusLed.hint:='Aktuell sind '+inttostr(FTasklist.Count)+' Ereigniss(e) aktiv';
end;

constructor TTSS_Scheduler.create;
begin
  inherited;
  Ftasklist:=Ttasklist.Create;
  FCheckInterval:=2000;
  Ftimer:=Ttimer.Create(nil);
  Ftimer.Interval:=FCheckInterval;
  Ftimer.Enabled:=false;
  Ftimer.OnTimer:=checktask;
end;

destructor TTSS_Scheduler.destroy;
begin
  inherited;
  Ftasklist.free;
  Ftimer.Free;
end;

procedure TTSS_Scheduler.SetCheckInterval(const Value: Integer);
begin
  FCheckInterval := Value;
  Ftimer.Interval:=FCheckInterval;
end;

procedure TTSS_Scheduler.SetStatusLed(const Value: TdsLed);
begin
  FStatusLed := Value;
  if assigned(FStatusLed) then if Fstarted then FStatusLed.OffColor:=clred else FStatusLed.OffColor:=clMaroon;
  if assigned(FStatusLed) then FStatusLed.repaint;
end;

procedure TTSS_Scheduler.checktask;
var
  idx: Integer;
  curday:smallint;
  curtime:Ttime;
  t:Ttask;
  run:boolean;
begin
  Ftimer.Enabled:=false;
  try
    curday:=dayofweek(date);
    curtime:=now;
// scorro la lista dei task
    for idx := 0 to Ftasklist.Count-1 do begin
      if assigned(FStatusLed) then FStatusLed.LedOn:=true;
      if assigned(FStatusLed) then FStatusLed.Repaint;
      t:=(Ftasklist[idx] as Ttask);
      if t.day=99 then if timeinrange(t.time,Fpriortime,curtime) then
        run:=true
      else
        if t.day>0 then if ((t.day=curday) and timeinrange(t.time,Fpriortime,curtime)) then run:=true else run:=false else if (timeinrange(t.time,Fpriortime,curtime)) then run:=true else run:=false;
      if run and assigned(Fontask) then FOnTask(t.id,t);
    end;
    Fpriortime:=curtime;
  finally
    if assigned(StatusLed) then StatusLed.LedOn:=False;
    if assigned(StatusLed) then StatusLed.Repaint;
    Ftimer.Enabled:=true;
  end;
end;

procedure TTSS_Scheduler.start;
begin
  Fpriortime:=now;
  Ftimer.enabled:=true;
  Fstarted:=true;
  if assigned(FStatusLed) then FStatusLed.OffColor:=clred;
end;

procedure TTSS_Scheduler.stop;
begin
  Ftimer.enabled:=false;
  Fstarted:=false;
  if assigned(FStatusLed) then FStatusLed.OffColor:=clMaroon;
end;

end.
