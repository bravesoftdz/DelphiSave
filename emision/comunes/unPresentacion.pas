unit unPresentacion;

interface

uses
  SysUtils, Classes, ImgList, Controls, DB, SDEngine, Dialogs;

type
  TPresentacion = class
  private
    { Private declarations }
    FSdqPresentaciones: TSDQuery;
    function GetCount : integer;
    function GetActive: boolean;
    procedure GetPresentacionCUIT(ACuit : string);
    procedure GetPresentacionContrato(AContrato : integer);
    procedure GetPresentacionCUITPeriodo(ACuit, APeriodo : string; AUltima : Boolean = False);
    procedure GetPresentacionContratoPeriodo(AContrato : integer; APeriodo : string; AUltima : Boolean = False);
    procedure GetPresentacionId(AId : integer);
    procedure Init;
  public
    { Public declarations }
    property Presentacion : TSDQuery read FSdqPresentaciones;
    property Count : Integer read GetCount;
    property Active : boolean read GetActive;
    constructor Create(ACuit, APeriodo: string; AId : Integer); overload;
    constructor Create(ACuit, APeriodo : string; AUltima : Boolean = False); overload;
    constructor Create(ACuit : string); overload;
    constructor Create(AContrato : integer; APeriodo : string; AUltima : Boolean = False); overload;
    constructor Create(AContrato : integer); overload;
    destructor  Destroy; override;
  end;

implementation

uses unDmPrincipal, SqlFuncs, AnsiSql, DbFuncs, unFuncionesEmision;

const
 PORCUIT     = '     AND idj.dj_cuit = ';
 PORCONTRATO = '     AND idj.dj_contrato = ';
 PORPERIODO  = '     AND idj.dj_periodo = ';
 PORID  = '     AND idj.dj_id = ';


{------------------------------------------------------------------------------}

procedure TPresentacion.GetPresentacionContrato(AContrato: integer);
begin
  try
    FSdqPresentaciones.DisableControls;
    FSdqPresentaciones.Sql.Add(PORCONTRATO + SqlValue(AContrato));
  finally
    FSdqPresentaciones.Open;
  end;
end;
{------------------------------------------------------------------------------}
procedure TPresentacion.GetPresentacionContratoPeriodo(AContrato: integer;
  APeriodo: string; AUltima : Boolean = False);
begin
  try
    FSdqPresentaciones.DisableControls;
    FSdqPresentaciones.Sql.Add(PORCONTRATO + SqlValue(AContrato));
    FSdqPresentaciones.Sql.Add(PORPERIODO + SqlValue(APeriodo));
  finally
    FSdqPresentaciones.Open;
  end;
end;
{------------------------------------------------------------------------------}
procedure TPresentacion.GetPresentacionCUIT(ACuit : string);
begin
  try
    FSdqPresentaciones.DisableControls;
    FSdqPresentaciones.Sql.Add(PORCUIT + SqlValue(ACuit));
  finally
    FSdqPresentaciones.Open;
  end;
end;
{------------------------------------------------------------------------------}
procedure TPresentacion.GetPresentacionCUITPeriodo(ACuit,
  APeriodo: string; AUltima : Boolean = False);
begin
  try
    FSdqPresentaciones.DisableControls;
    FSdqPresentaciones.Sql.Add(PORCUIT + SqlValue(ACuit));
    FSdqPresentaciones.Sql.Add(PORPERIODO + SqlValue(APeriodo));
  finally
    FSdqPresentaciones.Open;
  end;
end;
{------------------------------------------------------------------------------}
procedure TPresentacion.GetPresentacionId(AId: integer);
begin
  try
    FSdqPresentaciones.DisableControls;
    FSdqPresentaciones.Sql.Add(PORID + SqlValue(AId));
  finally
    FSdqPresentaciones.Open;
  end;
end;
{------------------------------------------------------------------------------}
function TPresentacion.GetCount: integer;
begin
  result := FSdqPresentaciones.RecordCount;
end;
{------------------------------------------------------------------------------}
function TPresentacion.GetActive: boolean;
begin
  result := FSdqPresentaciones.Active;
end;
{------------------------------------------------------------------------------}
constructor TPresentacion.Create(ACuit: string);
begin
  Init;
  GetPresentacionCUIT(ACuit);
end;
{------------------------------------------------------------------------------}
constructor TPresentacion.Create(AContrato: integer);
begin
  Init;
  GetPresentacionContrato(AContrato);
end;
{------------------------------------------------------------------------------}
constructor TPresentacion.Create(ACuit, APeriodo: string;
  AUltima: Boolean);
begin
  Init;
  if not AUltima then
    GetPresentacionCUITPeriodo(ACuit, APeriodo)
  else
   GetPresentacionId(get_ultimaiddeclaracion(ACuit, APeriodo));

end;
{------------------------------------------------------------------------------}
constructor TPresentacion.Create(AContrato: integer; APeriodo: string;
  AUltima: Boolean);
begin
  Init;
  if not AUltima then
   GetPresentacionContratoPeriodo(AContrato, APeriodo)
  else
   GetPresentacionId(get_ultimaiddeclaracion(AContrato, APeriodo));

end;
{------------------------------------------------------------------------------}
constructor TPresentacion.Create(ACuit, APeriodo: string; AId : Integer);
begin
  Init;
  GetPresentacionId(Trunc(AId));
end;
{------------------------------------------------------------------------------}
{------------------------------------------------------------------------------}
procedure TPresentacion.Init;
begin
  FSdqPresentaciones := TSDQuery.Create(nil);
  with FSdqPresentaciones do
  begin
    Name := 'FSdqPresentaciones';
    DatabaseName := 'dbprincipal';
    SQL.Clear;
    Sql.Text :=   ' SELECT   idj.dj_id "Id", idj.dj_periodo "Período",'           +
                  ' idj.dj_empleados "Empleados", idj.dj_masasalarial "Masa Salarial",' +
                  ' DECODE(idj.dj_suss,                                       ' +
                  ' ''1'', ''SUSS'',                                          ' +
                  ' ''2'', ''NO SUSS'',                                       ' +
                  ' ''3'', ''MIXTA'') "SUSS",                                 ' +
                  ' idj.dj_fechapresentacion "Fecha Presentación",            ' +
                  ' DECODE(idj.dj_codigorectificativa,                        ' +
                  ' 0, ''Original'',                                     ' +
                  ' ''Rectificativa'') "Rectificativa",                       ' +
                  ' ion.on_descripcion "Origen", idj.dj_codigorectificativa "Cod.Rect.",' +
                  ' ht_porcmasa "%", ht_sumafija "Fija", ht_vigenciatarifa "Vig.Tarifa",' +
                  ' (SELECT MAX(de_fechacalculo)                              ' +
                  ' FROM emi.ide_devengado                                    ' +
                  ' WHERE de_idddjj = dj_id) "F.Emisión",                     ' +
                  ' (SELECT MAX(ld_id)                                        ' +
                  ' FROM emi.ild_loteddjj                                     ' +
                  ' WHERE ld_idddjj = dj_id) "Gestión",                       ' +
                  ' DECODE((SELECT COUNT(*)                                   ' +
                  ' FROM emi.ild_loteddjj                                     ' +
                  ' WHERE ld_idddjj = dj_id AND ld_fechafinalgestion IS NULL),' +
                  ' 0, '''',                                                  ' +
                  ' ''Pendiente'') "Estado",                                  ' +
                  ' (SELECT COUNT(*)                                          ' +
                  ' FROM emi.ido_ddjjobservacion ido                          ' +
                  ' WHERE ido.do_idddjj = dj_id                               ' +
                  ' AND do_fechafinobservacion IS NULL) "Observaciones",      ' +
                  ' DECODE((SELECT COUNT(*)                                   ' +
                  ' FROM emi.ido_ddjjobservacion ido, emi.iob_observacion iob ' +
                  ' WHERE ido.do_idddjj = dj_id                           '     +
                  ' AND do_fechafinobservacion IS NULL                    '     +
                  ' AND ido.do_idobservacion = iob.ob_id                  '     +
                  ' AND iob.ob_rechazo = ''S''),                          '     +
                  ' 0, ''No'',                                            '     +
                  ' ''Sí'') "Rechazada",                                  '     +
                  ' itf.tf_descripcion "Formulario",                      '     +
//                  ' ipr.pr_fechainicio "F.Ingreso",                       '     +
                  ' idj.DJ_IMPORTESCERO "Sueldo Cero"                     ' +
                  ' FROM emi.irp_resumenperiodo irp,                      ' +
                  ' emi.ide_devengado ide,                                ' +
                  ' emi.idj_ddjj idj,                                     ' +
                  ' emi.ion_origennomina ion,                             ' +
                  ' emi.itf_tipoformulario itf,                           ' +
                  ' afi.aen_endoso aen,                                   ' +
                  ' afi.aht_historicotarifario aht                        ' +
                  ' WHERE                                                 ' +
                  '  idj.dj_id = irp.rp_idddjj (+)                        ' +
                  '     AND irp.rp_iddevengado       = ide.de_id (+)      ' +
                  '     AND aen.en_idhistoricotarifa = aht.ht_id          ' +
                  '     AND aht.ht_id = art.afiliacion.get_idmaxendosovig(rp_contrato, rp_periodo) ' +
                  '     AND idj.dj_idorigennomina    = ion.on_id (+)      ' +
                  '     AND idj.dj_idformulario      = itf.tf_id(+)       ';
  end;
end;
{------------------------------------------------------------------------------}
destructor TPresentacion.Destroy;
begin
  FSdqPresentaciones.Close;
  FSdqPresentaciones.Free;
end;

end.

