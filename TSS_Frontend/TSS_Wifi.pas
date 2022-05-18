unit TSS_Wifi;

interface
uses
  system.Types,SysUtils,ActiveX,Windows,ComObj,system.Variants,Generics.Collections, Classes,
  ShellApi,nduWlanAPI,nduWlanTypes,vcl.Forms, Vcl.Dialogs;  //,

type
 TWifiInfo = record
  SSID: string;
  Profile: string;
  Connectable: Boolean
 end;

 TWifiConnectionInfo = record
    Name                   : string; //Wi-Fi
    Description            : string; //Intel(R) Dual Band Wireless-AC 7265
    GUID                   : string; //3bce2cb5-7a1d-4c23-a2a3-7337e985db13
    Physical_address       : string; //5c:e0:c5:4a:9b:42
    State                  : string; //connected
    SSID                   : string; //..............
    BSSID                  : string; //c0:ea:e4:c1:f6:ad
    Network_type           : string; //Infrastructure
    Radio_type             : string; //802.11ac
    Authentication         : string; //WPA2-Personal
    Cipher                 : string; //CCMP
    Connection_mode        : string; //Profile
    Channel                : integer; //44
    Receive_rate           : integer; //130
    Transmit_rate          : integer; //130
    Signal                 : integer; //46%
    Profile                : string; //...............
 end;

 TWifiObj = class(Tobject)
  Private
   FAdapter: boolean;
   procedure GetWifiList;
  public
   WifiList:Tlist<TWifiInfo>;
   Constructor Create;
   Destructor Destroy; override;
   function Connect(aSSID:string):boolean;
   function Connect2(aSSID:string):boolean;
   function GetConnectionInfo():TWifiConnectionInfo;
  published
   property Adapter:boolean read FAdapter;

 end;

implementation

{ TWifiObj }

function TWifiObj.GetConnectionInfo():TWifiConnectionInfo;
 const
   CReadBuffer = 2400;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   piProcess: TProcessInformation;
   pBuffer: array[0..CReadBuffer] of AnsiChar;  //    <----- update
   dRead: DWord;
   dRunning: DWord;
   ACommand,AParameters:string;
   TempResult:string;
   strArray  : Tarray<String>;
 begin
   saSecurity.nLength := SizeOf(TSecurityAttributes);
   saSecurity.bInheritHandle := True;
   saSecurity.lpSecurityDescriptor := nil;
   TempResult:='';
   ACommand  :='netsh';
   AParameters :=  'wlan show interface';

   if CreatePipe(hRead, hWrite, @saSecurity, 0) then
   begin
     FillChar(suiStartup, SizeOf(TStartupInfo), #0);
     suiStartup.cb := SizeOf(TStartupInfo);
     suiStartup.hStdInput := hRead;
     suiStartup.hStdOutput := hWrite;
     suiStartup.hStdError := hWrite;
     suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
     suiStartup.wShowWindow := SW_HIDE;

     if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
       @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess)
       then
     begin
       repeat
         dRunning  := WaitForSingleObject(piProcess.hProcess, 100);
         Application.ProcessMessages();
         repeat
           dRead := 0;
           ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
           pBuffer[dRead] := #0;
           OemToAnsi(pBuffer, pBuffer);
           TempResult:=TempResult +String(pBuffer);
         until (dRead < CReadBuffer);
       until (dRunning <> WAIT_TIMEOUT);
       CloseHandle(piProcess.hProcess);
       CloseHandle(piProcess.hThread);
     end;

     CloseHandle(hRead);
     CloseHandle(hWrite);
   end;

   strArray:= TempResult.Split([#13#10]);

   if TempResult<>'' then
   begin
    Result.Name := copy(strArray[3], pos(':',strArray[3])+2,length(strArray[3])-pos(':',strArray[3])+1);
    Result.Description := copy(strArray[4], pos(':',strArray[4])+2,length(strArray[4])-pos(':',strArray[4]));
    Result.GUID := copy(strArray[5], pos(':',strArray[5])+2,length(strArray[5])-pos(':',strArray[5]));
    Result.Physical_address := copy(strArray[6], pos(':',strArray[6])+2,length(strArray[6])-pos(':',strArray[6]));
    Result.State := copy(strArray[7], pos(':',strArray[7])+2,length(strArray[7])-pos(':',strArray[7]));
    if Result.State = 'connected' then
    begin
     Result.SSID := copy(strArray[8], pos(':',strArray[8])+2,length(strArray[8])-pos(':',strArray[8]));
     Result.BSSID := copy(strArray[9], pos(':',strArray[9])+2,length(strArray[9])-pos(':',strArray[9]));
     Result.Network_type := copy(strArray[10], pos(':',strArray[10])+2,length(strArray[10])-pos(':',strArray[10]));

     Result.Radio_type := copy(strArray[11], pos(':',strArray[11])+2,length(strArray[11])-pos(':',strArray[11]));
     Result.Authentication := copy(strArray[12], pos(':',strArray[12])+2,length(strArray[12])-pos(':',strArray[12]));
     Result.Cipher := copy(strArray[13], pos(':',strArray[13])+2,length(strArray[13])-pos(':',strArray[13]));
     Result.Connection_mode := copy(strArray[14], pos(':',strArray[14])+2,length(strArray[14])-pos(':',strArray[14]));

     Result.Channel := strtoint(copy(strArray[15], pos(':',strArray[15])+2,length(strArray[15])-pos(':',strArray[15])));
     Result.Receive_rate := strtoint(copy(strArray[16], pos(':',strArray[16])+2,length(strArray[16])-pos(':',strArray[16])));
     Result.Transmit_rate := strtoint(copy(strArray[17], pos(':',strArray[17])+2,length(strArray[17])-pos(':',strArray[17])));
     Result.Signal := strtoint(copy(strArray[18], pos(':',strArray[18])+2,pos('%',strArray[18])-pos(':',strArray[18])-2));
     Result.Profile := copy(strArray[19], pos(':',strArray[19])+2,length(strArray[19])-pos(':',strArray[19]));
    end;
   end;

end;

function TWifiObj.Connect(aSSID: string): boolean;
var PAram: string;
i:integer;

begin
result:=false;
if wifilist.count = 0 then exit;

i:=0;
while (i<wifilist.count)and (aSSID<>Wifilist[i].SSID) do i:=i+1;
if i=wifilist.count then exit;

param:='wlan connect ssid= '+ wifilist[i-1].SSID +
       ' name= '+wifilist[i-1].Profile;
result:=ShellExecute(0, nil, 'netsh.exe',Pchar(Param), nil, SW_HIDE) =0 ;
end;

function TWifiObj.Connect2(aSSID: string): boolean;
const
WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES =$00000001;
var
  hClient              : THandle;
  dwVersion            : DWORD;
  ResultInt            : DWORD;
  pInterface           : Pndu_WLAN_INTERFACE_INFO_LIST;
  i                    : Integer;
  j                    : Integer;
  pAvailableNetworkList: Pndu_WLAN_AVAILABLE_NETWORK_LIST;
  pInterfaceGuid       : PGUID;
  NetworkFound         : Boolean;
  connectionParams     : Pndu_WLAN_CONNECTION_PARAMETERS;
  infoForSSID          : Pndu_DOT11_SSID;
begin
  ResultInt:=WlanOpenHandle(1, nil, @dwVersion, @hClient);

  if  ResultInt<> ERROR_SUCCESS then
  begin
     WriteLn('Error Open CLient'+IntToStr(ResultInt));
     Exit;
  end;

  ResultInt:=WlanEnumInterfaces(hClient, nil, @pInterface);
  if  ResultInt<> ERROR_SUCCESS then
  begin
     WriteLn('Error Enum Interfaces '+IntToStr(ResultInt));
     exit;
  end;


  i:=0;
  NetWorkFound:=false;
  while (i<pInterface^.dwNumberOfItems) and not NetWorkFound do
  begin
   pInterfaceGuid:= @pInterface^.InterfaceInfo[pInterface^.dwIndex].InterfaceGuid;
   ResultInt:=WlanGetAvailableNetworkList(hClient,pInterfaceGuid,WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES,nil,pAvailableNetworkList);
   if  ResultInt<> ERROR_SUCCESS then
   begin
    writeln('Error WlanGetAvailableNetworkList '+IntToStr(ResultInt));
    Exit;
   end;

   j:=0;
   while (j<pAvailableNetworkList^.dwNumberOfItems)and not NetWorkFound do
   Begin
    if aSSID = PAnsiChar(@pAvailableNetworkList^.Network[j].dot11Ssid.ucSSID) then
    begin
     connectionParams.wlanConnectionMode := wlan_connection_mode_discovery_unsecure;
     connectionParams.strProfile := Nil;
     Move(aSSID[1], infoForSSID.ucSSID, Length(aSSID));
     infoForSSID.uSSIDLength := length(aSSID);
		 connectionParams.pDot11Ssid := &infoForSSID;
		 connectionParams.pDesiredBssidList := nil;
		 connectionParams.dot11BssType := dot11_BSS_type_independent;
		 connectionParams.dwFlags := NDU_WLAN_CONNECTION_ADHOC_JOIN_ONLY;

     ResultInt := WlanConnect(hClient, pInterfaceGuid, @connectionParams, Nil);
    end;

    j:=j+1;
   End;
   i:=i+1;
  end;

WlanCloseHandle(hClient, nil);


end;

constructor TWifiObj.Create;
begin
WifiList:=TList<TWifiInfo>.Create;
GetWifiList;
GetConnectionInfo();
end;

destructor TWifiObj.Destroy;
begin
  WifiList.Free;
  inherited;
end;

procedure TWifiObj.GetWifiList;
const
WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES =$00000001;
var
  hClient              : THandle;
  dwVersion            : DWORD;
  ResultInt            : DWORD;
  pInterface           : Pndu_WLAN_INTERFACE_INFO_LIST;
  i                    : Integer;
  j                    : Integer;
  pAvailableNetworkList: Pndu_WLAN_AVAILABLE_NETWORK_LIST;
  pInterfaceGuid       : PGUID;
  TempWifiInfo         : TwifiInfo;
begin
  FAdapter:=true;
  ResultInt:=WlanOpenHandle(1, nil, @dwVersion, @hClient);

  if  ResultInt<> ERROR_SUCCESS then
  begin
     WriteLn('Error Open CLient'+IntToStr(ResultInt));
     Exit;
  end;

  ResultInt:=WlanEnumInterfaces(hClient, nil, @pInterface);
  if  ResultInt<> ERROR_SUCCESS then
  begin
     WriteLn('Error Enum Interfaces '+IntToStr(ResultInt));
     exit;
  end;

  for i := 0 to pInterface^.dwNumberOfItems - 1 do
  begin
   pInterfaceGuid:= @pInterface^.InterfaceInfo[pInterface^.dwIndex].InterfaceGuid;
   ResultInt:=WlanGetAvailableNetworkList(hClient,pInterfaceGuid,WLAN_AVAILABLE_NETWORK_INCLUDE_ALL_ADHOC_PROFILES,nil,pAvailableNetworkList);
   if  ResultInt<> ERROR_SUCCESS then
   begin
//    writeln('Error WlanGetAvailableNetworkList '+IntToStr(ResultInt));
    FAdapter:=false;
    Exit;
   end;

   for j := 0 to pAvailableNetworkList^.dwNumberOfItems - 1 do
   Begin
    TempWifiInfo.SSID :=PAnsiChar(@pAvailableNetworkList^.Network[j].dot11Ssid.ucSSID);
    TempWifiInfo.Profile :=pAvailableNetworkList^.Network[j].strProfileName;
    TempWifiInfo.Connectable :=pAvailableNetworkList^.Network[j].bNetworkConnectable;
    WifiList.Add(TempWifiInfo);
   End;
  end;

WlanCloseHandle(hClient, nil);

end;
end.
