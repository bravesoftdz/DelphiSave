unit unFraColumnaRecotizacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unArtFrame, CurrEdit, StdCtrls,
  Mask, ToolEdit, DateComboBox, JvExControls, JvComponent, JvLabel, ExtCtrls;

type
  TfraColumnaRecotizacion = class(TArtFrame)
    edFechaDesde: TDateComboBox;
    edFechaHasta: TDateComboBox;
    pnTituloColumna: TPanel;
    lbTituloColumna: TJvLabel;
  private
    FCountField: Integer;
  public
  	constructor Create(AOwner: TComponent); override;

		procedure AddField(const aDisplayFormat: String; const aValue: Extended);
    procedure AddTitle(const aCaption: String);
    procedure Clear; override;
    procedure FreeObjects;
    procedure HideDates;
    procedure ShowColumnTitle(const aCaption: String);
  end;

var
  fraColumnaRecotizacion: TfraColumnaRecotizacion;

implementation

{$R *.dfm}

{ TfraColumnaRecotizacion }

constructor TfraColumnaRecotizacion.Create(AOwner: TComponent);
begin
  inherited;

	FCountField := 0;
  Color := clBtnFace;
end;


procedure TfraColumnaRecotizacion.AddField(const aDisplayFormat: String; const aValue: Extended);
var
	aTop: Integer;
begin
	Inc(FCountField);

  aTop := 60 + ((FCountField - 1) * 24);

	with TCurrencyEdit.Create(Self) do
  begin
  	Color := clBtnFace;
  	DisplayFormat := aDisplayFormat;
    Left := 4;
    Name := Format('edCampoDinamico%d', [FCountField]);
    Parent := Self;
    ReadOnly := True;
    TabStop := False;
    Top := aTop;
    Value := aValue;
    Width := 120;
  end;

  Height := aTop + 28;
end;

procedure TfraColumnaRecotizacion.AddTitle(const aCaption: String);
var
	aTop: Integer;
  aWidth: Integer;
begin
	Inc(FCountField);

  aTop := 64 + ((FCountField - 1) * 24);

	with TLabel.Create(Self) do
  begin
  	Caption := aCaption;
    Left := 4;
    Name := Format('edCampoDinamico%d', [FCountField]);
    Parent := Self;
    Top := aTop;
  end;

  Height := aTop + 28;

  aWidth := TLabel(FindComponent(Format('edCampoDinamico%d', [FCountField]))).Width + 8;
  if aWidth > Width then
  	Width := aWidth;
end;

procedure TfraColumnaRecotizacion.Clear;
begin
	edFechaDesde.Clear;
  edFechaHasta.Clear;
end;

procedure TfraColumnaRecotizacion.FreeObjects;
var
	aObj: TComponent;
	iLoop: Integer;
begin
  for iLoop := 1 to FCountField do
  begin
  	aObj := FindComponent(Format('edCampoDinamico%d', [iLoop]));
    aObj.Free;
  end;

  FCountField := 0;
end;

procedure TfraColumnaRecotizacion.HideDates;
begin
  edFechaDesde.Hide;
  edFechaHasta.Hide;
end;

procedure TfraColumnaRecotizacion.ShowColumnTitle(const aCaption: String);
begin
	lbTituloColumna.Caption := aCaption;
	pnTituloColumna.Show;

  HideDates;
end;

end.
