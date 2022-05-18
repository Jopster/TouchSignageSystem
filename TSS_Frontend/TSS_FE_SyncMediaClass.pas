unit TSS_FE_SyncMediaClass;

interface

type
  { Declare a new object type }
  TSyncMedia = class
  private
    FFilename: String;
  public
    constructor Create(const FName: String);
    destructor Destroy(); override;
  end;

{ TNewObject }



implementation

constructor TSyncMedia.Create(const FName: String);
begin
  FFileName := FName;
end;

destructor TSyncMedia.Destroy;
begin
  { Show a message whenever an object is destroyed }
  inherited;
end;

end.
