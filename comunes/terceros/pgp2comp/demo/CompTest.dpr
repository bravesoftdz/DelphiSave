program CompTest;

uses
  Forms,
  TestUnit in 'TestUnit.pas' {PGPDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TPGPDemo, PGPDemo);
  Application.Run;
end.
