unit TSS_FE_AND_DataUnit;

interface

uses TSS_FE_AND_ButtonClass_Unit,contnrs;


    Type TDataCollector = class(TObject)
    private
      FSchemaid: String;
      FButtonCount: word;
    FButtonList: TObjectlist;
      constructor Create;
      procedure SetSchemaid(const Value: String);
    procedure SetButtonCount(const Value: word);
    procedure SetButtonList(const Value: TObjectlist);
    public
      property Schemaid:String read FSchemaid write SetSchemaid;
      property ButtonCount:word read FButtonCount write SetButtonCount;
      property ButtonList:TObjectlist read FButtonList write SetButtonList;
    end;

implementation

{ DataCollector }

constructor TDataCollector.Create;
begin
  inherited;
end;

procedure TDataCollector.SetButtonCount(const Value: word);
begin
  FButtonCount := Value;
end;

procedure TDataCollector.SetButtonList(const Value: TObjectlist);
begin
  FButtonList := Value;
end;

procedure TDataCollector.SetSchemaid(const Value: String);
begin
  FSchemaid := Value;
end;

end.
