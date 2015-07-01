unit unUtilsLegales;

interface

uses Controls;

procedure EnableControls(AControl: TWinControl; AEnabled: Boolean = True);
procedure LockControls(AControls: Array of TControl; ALocked: Boolean{$IFNDEF VER130} = True{$ENDIF});

implementation

uses
	VclExtra;

procedure EnableControls(AControl: TWinControl; AEnabled: Boolean = True);
var
	Ctrl: TControl;
	i: Integer;
begin
	for i := 0 to AControl.ControlCount - 1 do
  begin
  	Ctrl := AControl.Controls[i];
		Ctrl.Enabled := AEnabled;
		if Ctrl is TWinControl then
    	EnableControls(TWinControl(Ctrl), AEnabled);
	end;
end;

procedure LockControls(AControls: Array of TControl; ALocked: Boolean{$IFNDEF VER130} = True{$ENDIF});
var
  i: Integer;
begin
	for i := Low(AControls) to High(AControls) do
  	if (AControls[i] is TWinControl) then
      EnableControls(TWinControl(AControls[i]), not ALocked)
    else
      AControls[i].Enabled := not ALocked;
end;

end.
