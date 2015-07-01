unit unFraDetalleGestion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, StdCtrls,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, DB, SDEngine,
  ComCtrls, ToolWin;

type
  TfraDetalleGestion = class(TFrame)
    dbgDetalle: TArtDBGrid;
    sdqDatos: TSDQuery;
    dsDatos: TDataSource;
    procedure dbgDetalleDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FIdGestionable: integer;
    function GetIdContacto: Integer;
  public
    property IdGestionable: integer read FIdGestionable write FIdGestionable;
    property IdContacto: Integer read GetIdContacto;
    procedure CargarGestion(iddetalle, idGestionable: integer; tipoDetalle: string);
  end;

implementation

uses
  unConstEmision, VCLExtra;

{$R *.dfm}

{ TfraDetalleGestion }

procedure TfraDetalleGestion.CargarGestion(iddetalle, idGestionable: integer; tipoDetalle: string);
var
  sSql: String;
begin
  FIdGestionable := idGestionable;
  if (tipoDetalle = DETALLE_POR_DDJJ) then
    sSql := ' SELECT rg_descripcion "Resultado", dj_periodo "Período", dj_empleados "Empleados", dj_masasalarial "Masa Salarial", dj_fechapresentacion "F.Presentación", tf_descripcion "Formulario", ob_descripcion "Observación", dg_fechavencimiento "F.Vencimiento", ' +
            '        dg_id Iddetalle, dg_numerogestion, dg_idcontacto ' +
            ' FROM emi.iob_observacion, emi.ido_ddjjobservacion, emi.itf_tipoformulario, emi.idj_ddjj, emi.irg_resultadogestion, emi.idg_detallesubloteengestion ' +
            ' WHERE tf_id = dj_idformulario ' +
            '   AND do_idobservacion = ob_id ' +
            '   AND do_idddjj = dj_id ' +
            '   AND dj_iddetallesublotegestion = dg_id ' +
            '   AND dg_iddetallesublote = :iddetalle ' +
            '   AND dg_idgestionable = :idgestionable ' +
            '   AND rg_id(+) = dg_idresultadogestion ' +
            '   AND ob_rechazo IN(''S'', ''G'') ';

  if (tipoDetalle = DETALLE_POR_NOTA) then
    sSql := ' SELECT rg_descripcion "Resultado", np_periodo "Período", no_secuencia "Secuencia", no_bibliorato "Bibliorato", tf_descripcion "Formulario", no_usualta "Usu.Alta", no_fechaalta "F.Alta", no_usuarioaplicacion "Usu.Aplicación", ' +
            '        no_fechaaplicacion "F.Aplicación", ob_descripcion "Observación", dg_fechavencimiento "F.Vencimiento", dg_id Iddetalle, dg_numerogestion, dg_idcontacto  ' +
            ' FROM emi.itf_tipoformulario, emi.ino_nota, emi.iob_observacion, emi.ipo_notaperiodoobservacion ipo, emi.ing_notagestion ing, ' +
            '      emi.inp_notacontratoperiodo, emi.irg_resultadogestion, emi.idg_detallesubloteengestion  ' +
            ' WHERE no_id = np_idnota ' +
            '   AND np_id = ipo.po_idnotacontratoperiodo(+) ' +
            '   AND ing.ng_idnotaperiodoobs(+) = ipo.po_id ' +
            '   AND ob_id(+) = po_idobservacion ' +
            '   AND np_idtipoformulario = tf_id(+) ' +
            '   AND np_iddetallesublotegestion = dg_id ' +
            '   AND dg_idgestionable = :idgestionable ' +
            '   AND rg_id(+) = dg_idresultadogestion ' +
            '   AND dg_iddetallesublote = :iddetalle ';

  if (tipoDetalle = DETALLE_POR_PERIODO) then
    sSql := ' SELECT rg_descripcion "Resultado", dg_periodo "Período", dg_fechavencimiento "F.Vencimiento", dg_id Iddetalle, dg_numerogestion, dg_idcontacto  ' +
            ' FROM emi.irg_resultadogestion, emi.idg_detallesubloteengestion ' +
            ' WHERE dg_iddetallesublote = :iddetalle ' +
            '  AND rg_id(+) = dg_idresultadogestion ' +
            '  AND dg_idgestionable = :idgestionable ';

  if (tipoDetalle = DETALLE_POR_CUILES) then
    sSql := ' SELECT rg_descripcion "Resultado", tg_cuil "Cuil", tj_nombre "Nombre", dg_fechavencimiento "F.Vencimiento", dg_id Iddetalle, dg_numerogestion, dg_idcontacto ' +
            ' FROM ctj_trabajador, emi.itg_trabajadorgestion, emi.irg_resultadogestion, emi.idg_detallesubloteengestion ' +
            ' WHERE tj_cuil(+) = tg_cuil ' +
            '  AND tg_iddetallesubloteengestion = dg_id ' +
            '  AND dg_idgestionable = :idgestionable ' +
            '  AND rg_id(+) = dg_idresultadogestion ' +
            '  AND dg_iddetallesublote = :iddetalle ';

  sdqDatos.SQL.Text := sSql;
  sdqDatos.Prepare;
  sdqDatos.ParamByName('iddetalle').AsInteger := iddetalle;
  sdqDatos.ParamByName('idgestionable').AsInteger := idGestionable;
  sdqDatos.Open;
  DynColWidthsByData(dbgDetalle);
end;

procedure TfraDetalleGestion.dbgDetalleDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  Column.Visible := (uppercase(Column.FieldName) <> uppercase('Iddetalle')) and (uppercase(Column.FieldName) <> uppercase('dg_numerogestion'))
                    and (uppercase(Column.FieldName) <> uppercase('dg_idcontacto'))
end;

function TfraDetalleGestion.GetIdContacto: Integer;
begin
  sdqDatos.First;
  while not sdqDatos.Eof and not sdqDatos.FieldByName('dg_idcontacto').IsNull do
    sdqDatos.Next;
  if not sdqDatos.FieldByName('dg_idcontacto').IsNull then
    result := sdqDatos.FieldByName('dg_idcontacto').AsInteger
  else
    result := 0;
end;

end.
