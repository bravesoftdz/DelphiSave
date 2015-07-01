unit unListDenunciasGraves;    // Listado de la Solapa Denuncias Graves - Creado por Ticket 27721 - Cynthia Cano

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion,
  unFraCodDesc, StdCtrls, Mask, ToolEdit, unfraDelegacion, SinEdit,
  unArtDbFrame, unfraCPR_PRESTADOR, unFraPrestadorFueraDeContrato,
  DateComboBox, unfraPrestador, PatternEdit, ComboEditor, CheckCombo,
  DBCheckCombo;

type
  TfrmListDenunciasGraves = class(TfrmCustomConsulta)
    gbFechas: TGroupBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edSiniestro: TSinEdit;
    fraDelegacion: TfraDelegacion;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    edFecDesde: TDateComboBox;
    edFecHasta: TDateComboBox;
    fraPrestador: TfraPrestador;
    cmbTipoModif: TDBCheckCombo;
    dsTipoModif: TDataSource;
    sdqTipoModif: TSDQuery;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
  private
    { Private declarations }
    function Validar: boolean;
  public
    { Public declarations }
  end;

var
  frmListDenunciasGraves: TfrmListDenunciasGraves;

implementation

uses CustomDlgs, AnsiSql;

{$R *.dfm}

procedure TfrmListDenunciasGraves.tbRefrescarClick(Sender: TObject);
var sSql: string;
begin
  if Validar then
  begin
    sSql := ' SELECT EX_SINIESTRO, EX_ORDEN, EX_RECAIDA, EX_CUIL, TJ_NOMBRE, EX_CUIT, EM_NOMBRE, EX_FECHAACCIDENTE, ' +
                   ' DG_FECHAMODIFSRT1, T1.DH_DESCRIPCION TIPOMODIFSRT1, DG_TIPOMODIFSRT_OTROS1, ' +
                   ' DG_FECHAMODIFSRT2, T2.DH_DESCRIPCION TIPOMODIFSRT2, DG_TIPOMODIFSRT_OTROS2, ' +
                   ' DG_FECHAMODIFSRT3, T3.DH_DESCRIPCION TIPOMODIFSRT3, DG_TIPOMODIFSRT_OTROS3, ' +
                   ' DG_FECHAMODIFSRT4, T4.DH_DESCRIPCION TIPOMODIFSRT4, DG_TIPOMODIFSRT_OTROS4, ' +
                   ' DG_FECHAMODIFSRT5, T5.DH_DESCRIPCION TIPOMODIFSRT5, DG_TIPOMODIFSRT_OTROS5, ' +
                   ' EL_NOMBRE DELEGACION, CA_DESCRIPCION PRESTADOR, DG_FECHAIMPRESION_NOTA, DG_FECHAMAIL_NOTA ' +
              ' FROM SIN.SDG_DENUNCIAGRAVE, ART.SEX_EXPEDIENTES, CTJ_TRABAJADOR, AEM_EMPRESA, ' +
                   ' ART.DEL_DELEGACION, ART.CPR_PRESTADOR, ' +
                   ' SIN.SDH_TIPOSMODIFICACIONESSRT T1, ' +
                   ' SIN.SDH_TIPOSMODIFICACIONESSRT T2, ' +
                   ' SIN.SDH_TIPOSMODIFICACIONESSRT T3, ' +
                   ' SIN.SDH_TIPOSMODIFICACIONESSRT T4, ' +
                   ' SIN.SDH_TIPOSMODIFICACIONESSRT T5 ' +
             ' WHERE DG_IDEXPEDIENTE = EX_ID ' +
               ' AND TJ_CUIL = EX_CUIL ' +
               ' AND TJ_ID = EX_IDTRABAJADOR ' +
               ' AND EM_CUIT = EX_CUIT ' +
               ' AND EL_ID(+) = EX_DELEGACION ' +
               ' AND CA_IDENTIFICADOR(+) = EX_PRESTADOR ' +
               ' AND DG_TIPOMODIFSRT1 = T1.DH_ID(+) ' +
               ' AND DG_TIPOMODIFSRT2 = T2.DH_ID(+) ' +
               ' AND DG_TIPOMODIFSRT3 = T3.DH_ID(+) ' +
               ' AND DG_TIPOMODIFSRT4 = T4.DH_ID(+) ' +
               ' AND DG_TIPOMODIFSRT5 = T5.DH_ID(+) ';

    if (edFecDesde.Date <> 0) then  // es para las dos fechas, igual se valida que esten las dos completas.
      sSql := sSql + ' AND ( (dg_fechamodifsrt1 BETWEEN ' + SqlDate(edFecDesde.date) + ' AND ' + SqlDate(edFecHasta.date) + ') or ' +
                           ' (dg_fechamodifsrt2 BETWEEN ' + SqlDate(edFecDesde.date) + ' AND ' + SqlDate(edFecHasta.date) + ') or ' +
                           ' (dg_fechamodifsrt2 BETWEEN ' + SqlDate(edFecDesde.date) + ' AND ' + SqlDate(edFecHasta.date) + ') or ' +
                           ' (dg_fechamodifsrt2 BETWEEN ' + SqlDate(edFecDesde.date) + ' AND ' + SqlDate(edFecHasta.date) + ') or ' +
                           ' (dg_fechamodifsrt2 BETWEEN ' + SqlDate(edFecDesde.date) + ' AND ' + SqlDate(edFecHasta.date) + ') ) ';

    if not (edSiniestro.IsEmpty) then
      sSql := sSql + ' AND ex_siniestro = ' + SqlInt(edSiniestro.Siniestro) +
                     ' AND ex_orden = ' + SqlInt(edSiniestro.Orden) +
                     ' AND ex_recaida = ' + SqlInt(edSiniestro.Recaida);

    if not (fraDelegacion.IsEmpty) then
      sSql := sSql + ' AND ex_delegacion = ' + SqlValue(fraDelegacion.Codigo);

    if not (cmbTipoModif.IsEmpty) then
      sSql := sSql + ' AND ( (dg_tipomodifsrt1 ' + cmbTipoModif.InSql + ' ) or ' +
                           ' (dg_tipomodifsrt2 ' + cmbTipoModif.InSql + ' ) or ' +
                           ' (dg_tipomodifsrt3 ' + cmbTipoModif.InSql + ' ) or ' +
                           ' (dg_tipomodifsrt4 ' + cmbTipoModif.InSql + ' ) or ' +
                           ' (dg_tipomodifsrt5 ' + cmbTipoModif.InSql + ' ) ) ';

    if not (fraPrestador.IsEmpty) then
      sSql := sSql + ' AND ex_prestador = ' + SqlValue(fraPrestador.IDPrestador);


    sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
    inherited;
  end;

end;

function TfrmListDenunciasGraves.Validar: boolean;
begin
  Verificar(((edFecDesde.date > 0) and (edFecHasta.date = 0)) or
            ((edFecDesde.date = 0) and (edFecHasta.date > 0)), gbFechas, 'Debe completar la fecha faltante para filtrar por este campo');
  Result := true;
end;

procedure TfrmListDenunciasGraves.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  edFecDesde.Clear;
  edFecHasta.Clear;
  edSiniestro.Clear;
  fraDelegacion.Clear;
  cmbTipoModif.Clear;
  fraPrestador.Clear;
end;

end.
