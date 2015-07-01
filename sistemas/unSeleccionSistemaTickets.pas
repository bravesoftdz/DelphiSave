unit unSeleccionSistemaTickets;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomForm, Vcl.StdCtrls, Vcl.ImgList,
  XPMenu, RxPlacemnt, Data.DB, SDEngine, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid;

type
  TfrmSeleccionSistemaTickets = class(TfrmCustomForm)
    btnSeleccionar: TButton;
    dbgSistemas: TJvDBGrid;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    procedure btnSeleccionarClick(Sender: TObject);
  private
    function GetSistemaTicket: Integer;
  public
    class function Seleccionar(AUsuario: String): Integer;

    property IdSistemaTicket: Integer read GetSistemaTicket;
  end;

var
  frmSeleccionSistemaTickets: TfrmSeleccionSistemaTickets;

implementation

{$R *.dfm}

uses
  unDmPrincipal;

var
  nIdSistemaElegido: Integer;

procedure TfrmSeleccionSistemaTickets.btnSeleccionarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

function TfrmSeleccionSistemaTickets.GetSistemaTicket: Integer;
begin
  if sdqConsulta.Active and (not sdqConsulta.IsEmpty) then
    nIdSistemaElegido := sdqConsulta.FieldByName('TS_IDSISTEMATICKET').AsInteger;

  Result := nIdSistemaElegido;
end;

class function TfrmSeleccionSistemaTickets.Seleccionar(AUsuario: String): Integer;
begin
  if nIdSistemaElegido <> -1 then
    Result := nIdSistemaElegido
  else
    with TfrmSeleccionSistemaTickets.Create(nil) do
    try
      OpenQueryEx(sdqConsulta, [AUsuario, 'S']);
      if ShowModal = mrOk then
        Result := IdSistemaTicket
      else
        Result := -1;
    finally
      Free;
    end;
end;

initialization
  nIdSistemaElegido := -1;

end.
