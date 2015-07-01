unit unFraRespuestaCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unArtFrame, StdCtrls, Mask, ToolEdit,
  DateComboBox;

type
  TfraRespuestaCarta = class(TArtFrame)
    lbAceptacion: TLabel;
    lbFechaAceptacion: TLabel;
    edFecha: TDateComboBox;
    cmbAceptacion: TComboBox;
  private
  public
    function GetAceptacion: String;
    function GetFecha: String;

    procedure Clear; override;
  end;

var
  fraRespuestaCarta: TfraRespuestaCarta;

implementation

{$R *.DFM}

{ TfraRespuestaCarta }

procedure TfraRespuestaCarta.Clear;
begin
  cmbAceptacion.ItemIndex := -1;
  edFecha.Clear;
end;

function TfraRespuestaCarta.GetAceptacion: String;
begin
  Result := cmbAceptacion.Text;
end;

function TfraRespuestaCarta.GetFecha: String;
begin
  Result := edFecha.Text;
end;

end.
