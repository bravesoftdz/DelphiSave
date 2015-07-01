unit unDmConnection;

interface

uses ADODB;

procedure Conectar;

var
  Connection: TADOConnection;

implementation



procedure Conectar;
begin
  Connection := TADOConnection.Create(nil);
  with Connection do
  begin
    Name := 'Connection';
    Connected := True;
    ConnectionString :=
    'Provider := SQLOLEDB.1;Password=xxx;Persist Security Info=True;User' +
    ' ID := pmarrone;Initial Catalog=Legales;Data Source=PC405;Use Proce' +
    'dure for Prepare := 1;Auto Translate=True;Packet Size=4096;Workstat' +
    'ion ID := PC405;Use Encryption for Data=False;Tag with column colla' +
    'tion when possible := False';
    LoginPrompt := False;
    Provider := 'SQLOLEDB.1';
  end;
end;


end.
