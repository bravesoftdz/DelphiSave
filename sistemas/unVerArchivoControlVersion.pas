unit unVerArchivoControlVersion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, Mask, ToolEdit,
  ExtCtrls;

type
  TfrmVerArchivoControlVersion = class(TForm)
    font: TFontDialog;
    meArchivo: TMemo;
    t1: TTimer;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure t1Timer(Sender: TObject);
  private
  	FCadenaABuscar: String;
    FCaseSensitive: Boolean;
    FCountBusquedas: Integer;
    FKeyDown: Boolean;

    function UpperCase(const S: String): String;

		procedure BuscarCadena;
    procedure SetCadenaABuscar(const Value: String);
    procedure SetCaseSensitive(const Value: Boolean);
  public
  	property CadenaABuscar: String  read FCadenaABuscar write SetCadenaABuscar;
    property CaseSensitive: Boolean read FCaseSensitive write SetCaseSensitive default False;
  end;

var
  frmVerArchivoControlVersion: TfrmVerArchivoControlVersion;

implementation

uses
	CustomDlgs;

{$R *.dfm}

function TfrmVerArchivoControlVersion.UpperCase(const S: String): String;
begin
	Result := StringReplace(S, 'á', 'Á', [rfReplaceAll]);
  Result := StringReplace(Result, 'é', 'É', [rfReplaceAll]);
  Result := StringReplace(Result, 'í', 'Í', [rfReplaceAll]);
  Result := StringReplace(Result, 'ó', 'Ó', [rfReplaceAll]);
  Result := StringReplace(Result, 'ú', 'Ú', [rfReplaceAll]);
	Result := StringReplace(Result, 'ñ', 'Ñ', [rfReplaceAll]);
	Result := SysUtils.UpperCase(Result);
end;

procedure TfrmVerArchivoControlVersion.BuscarCadena;
var
	aTextoReducido: String;
  FoundAt: LongInt;
begin
  with meArchivo do
  begin
  	if SelStart = 0 then
    begin
      if FCaseSensitive then
      begin
  	  	aTextoReducido := Lines.Text;
    	  FoundAt := Pos(FCadenaABuscar, aTextoReducido) + 1;
      end
      else
      begin
  	  	aTextoReducido := UpperCase(Lines.Text);
    	  FoundAt := Pos(UpperCase(FCadenaABuscar), aTextoReducido) + 1;
      end;
    end
    else
    begin
      if FCaseSensitive then
      begin
  	  	aTextoReducido := Copy(Lines.Text, SelStart + 2, Length(Lines.Text));
    	  FoundAt := SelStart + Pos(FCadenaABuscar, aTextoReducido) + 2;
      end
      else
      begin
  	  	aTextoReducido := UpperCase(Copy(Lines.Text, SelStart + 2, Length(Lines.Text)));
    	  FoundAt := SelStart + Pos(UpperCase(FCadenaABuscar), aTextoReducido) + 2;
      end;

      if not ((FoundAt <> -1) and ((FoundAt - 2) <> SelStart)) then
      begin
        if FCaseSensitive then
        begin
  		  	aTextoReducido := Lines.Text;
    		  FoundAt := Pos(FCadenaABuscar, aTextoReducido) + 1;
        end
        else
        begin
  		  	aTextoReducido := UpperCase(Lines.Text);
    		  FoundAt := Pos(UpperCase(FCadenaABuscar), aTextoReducido) + 1;
        end;
      end;
    end;

    if (not FKeyDown) and (FCountBusquedas > 1) then
    	Exit;

    SelStart := FoundAt - 2;
    SelLength := Length(FCadenaABuscar);
  end;
end;

procedure TfrmVerArchivoControlVersion.SetCadenaABuscar(const Value: String);
begin
  FCadenaABuscar := Value;
end;

procedure TfrmVerArchivoControlVersion.SetCaseSensitive(const Value: Boolean);
begin
  FCaseSensitive := Value;
end;


procedure TfrmVerArchivoControlVersion.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if Key = VK_ESCAPE then
  	Close;

	if Key = VK_F3 then
  begin
  	FKeyDown := False;
    t1.Enabled := False;
  end;


  if Key = VK_F4 then
  begin
  	if font.Execute then
    	meArchivo.Font := font.Font;
  end;
end;

procedure TfrmVerArchivoControlVersion.FormCreate(Sender: TObject);
begin
	FKeyDown := False;
end;

procedure TfrmVerArchivoControlVersion.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if Key = VK_F3 then
  begin
  	FCountBusquedas := 0;
		FKeyDown := True;
    t1Timer(nil);
    t1.Enabled := True;
  end;
end;

procedure TfrmVerArchivoControlVersion.t1Timer(Sender: TObject);
begin
	Inc(FCountBusquedas);
	BuscarCadena;
end;

end.
