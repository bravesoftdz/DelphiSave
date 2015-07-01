unit unSeleccionGBPA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox;

type
  TfrmSeleccionGBPA = class(TfrmCustomConsulta)
    tbSalir2: TToolButton;
    ShortCutControl1: TShortCutControl;
    ToolButton1: TToolButton;
    tbSeleccionar: TToolButton;
    gbFechaAprobado: TGroupBox;
    edFechaAprobadoDesde: TDateComboBox;
    Label1: TLabel;
    edFechaAprobadoHasta: TDateComboBox;
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSeleccionarClick(Sender: TObject);
  private
  public
  end;

var
  frmSeleccionGBPA: TfrmSeleccionGBPA;

implementation

uses
  CustomDlgs, AnsiSql, unDmPrincipal, SqlFuncs, unSesion, General, unArt, DateTimeFuncs;

{$R *.dfm}

procedure TfrmSeleccionGBPA.tbLimpiarClick(Sender: TObject);
begin
  edFechaAprobadoDesde.Clear;
  edFechaAprobadoHasta.Clear;

  inherited;
end;

procedure TfrmSeleccionGBPA.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: String;
begin
  Verificar(edFechaAprobadoDesde.IsEmpty, edFechaAprobadoDesde, 'Debe indicar la fecha de aprobado desde.');
  Verificar(edFechaAprobadoHasta.IsEmpty, edFechaAprobadoHasta, 'Debe indicar la fecha de aprobado hasta.');

  sSql := 'SELECT VG_CONPAGO CONPAGO, TB_DESCRIPCION GRUPO_PAGO, ''PM Genéricos'' BASE_ORIGEN, SUBSTR(VO_ESTADO, 1, 1) ESTADO, ' +
                 'VO_FECHAFACTURA F_FACTURA, VO_FECHALTA F_CARGA, VO_FECHAPAGO F_APROBACION, VG_IMPFACTURADO COSTO, ' +
                 'CA_CLAVE CUIT_PRESTADOR, CA_DESCRIPCION NOMBRE_PRESTADOR, ' +
                 'VO_FACTURATIPO || ''-'' || VO_FACTURAESTABLE || ''-'' || VO_FACTURANRO NUMERO_FACTURA, VO_VOLANTE VOLANTE, ' +
                 'VG_NUMPAGO NUMPAGO, VO_USUAPRO USUAPRO ' +
            'FROM CTB_TABLAS, SCP_CONPAGO, CPR_PRESTADOR, SVG_VOL_GENERICO, SVO_VOLANTES ' +
           'WHERE VO_ESTADO IN(''EG'', ''EAG'', ''AP'') ' +
             'AND VO_VOLANTE = VG_VOLANTE ' +
             'AND VO_PRESTADOR = CA_IDENTIFICADOR ' +
             'AND VG_CONPAGO = CP_CONPAGO ' +
             'AND TB_CLAVE = ''GGPBA'' ' +
             'AND TB_CODIGO = CP_GRUPOGPBA ' +
             'AND NOT EXISTS(SELECT 1 ' +
                              'FROM OGG_GPBAGENERICO ' +
                             'WHERE VG_VOLANTE = GG_VOLANTE ' +
                               'AND VG_NUMPAGO = GG_NUMPAGO ' +
                               'AND GG_FECHABAJA IS NULL)';

  sWhere := SqlBetweenDateTime(' AND VO_FECHAPAGO ', edFechaAprobadoDesde.Date, edFechaAprobadoHasta.Date);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmSeleccionGBPA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if sdqConsulta.FieldByName('COSTO') is TFloatField then
    TFloatField(sdqConsulta.FieldByName('COSTO')).Currency := True;
end;

procedure TfrmSeleccionGBPA.tbSeleccionarClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'Debe seleccionar al menos una fila de la grilla.');

  if MsgBox('¿Está seguro de querer insertar los registros?', MB_YESNO + MB_ICONQUESTION ) = IDYES then
    begin
      try
        BeginTrans;

        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            with sdqConsulta do
              begin
                GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                sSql := 'INSERT INTO OGG_GPBAGENERICO(GG_ID, GG_VOLANTE, GG_NUMPAGO, ' +
                                                     'GG_PORCENTAJE, GG_FECHAALTA, GG_USUALTA) ' +
                               'VALUES(SEQ_OGG_ID.NEXTVAL, :Volante, :NumPago, CONT.GET_PORCENTAJEGPBA(:Fecha), ' +
                                      'SYSDATE, :User)';
                EjecutarSqlSTEx(sSql, [FieldByName('VOLANTE').AsInteger, FieldByName('NUMPAGO').AsInteger, TDateTimeEx.Create(FieldByName('F_APROBACION').AsDateTime), Sesion.UserId]);
              end;
          end;

        CommitTrans;
        MsgBox('Registros insertados correctamente.', MB_ICONINFORMATION);

        sdqConsulta.Refresh;
        Grid.UnSelectAll;
      except
        on E: Exception do
          begin
            RollBack;
            raise Exception.Create(E.Message + CRLF + 'Error al insertar los registros.');
          end;
      end;
    end;
end;

end.
 