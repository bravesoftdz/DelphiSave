unit unListPasSinEvol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ToolWin, ToolEdit, DateComboBox, StdCtrls, Mask,
  ArtComboBox, Db, SDEngine, Placemnt, SortDlg, artSeguridad, QueryPrint,
  QueryToFile, ShortCutControl, ABMDialog, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraGrupoTrabajo;

type
  TfrmListPasSinEvol = class(TForm)
    Label1: TLabel;
    edUltMoviDesde: TDateComboBox;
    Label2: TLabel;
    edUltMoviHasta: TDateComboBox;
    Label3: TLabel;
    edSinMoviDesde: TDateComboBox;
    tbarAutoriza: TToolBar;
    tbLimpiar: TToolButton;
    tbImprimir: TToolButton;
    tbExportar: TToolButton;
    ToolButton1: TToolButton;
    tbOrden: TToolButton;
    ToolButton3: TToolButton;
    tbExit: TToolButton;
    ToolButton4: TToolButton;
    sdqDatos: TSDQuery;
    SortDialog: TSortDialog;
    Seguridad: TSeguridad;
    QueryPrint: TQueryPrint;
    dsDatos: TDataSource;
    SaveDialog: TSaveDialog;
    QueryToFile: TQueryToFile;
    FormStorage: TFormStorage;
    ShortCutControl: TShortCutControl;
    ABMDialog: TABMDialog;
    tbVistaPrevia: TToolButton;
    cmbDelegacion: TArtComboBox;
    Label4: TLabel;
    sdqDelegacion: TSDQuery;
    dsDelegacion: TDataSource;
    PrintDialog: TPrintDialog;
    fraGrupoTrabajo: TfraGrupoTrabajo;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbExitClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbOrdenClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbVistaPreviaClick(Sender: TObject);
    procedure ABMDialogBeforePrint(Sender: TObject; var Cancel: Boolean);
  private
    function GenerarConsulta : Boolean;
    function Validar : Boolean;
    procedure MakeSubtitle;
  public
  end;

var
  frmListPasSinEvol: TfrmListPasSinEvol;

implementation

uses General, unDmPrincipal, unPrincipal, CustomDlgs, AnsiSql;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal.mnuListPasSinEvo.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.tbExitClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.tbLimpiarClick(Sender: TObject);
begin
    fraGrupoTrabajo.Clear;
    cmbDelegacion.FieldValue := '';
    edUltMoviDesde.ClearDate ;
    edUltMoviHasta.ClearDate ;
    edSinMoviDesde.ClearDate ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.FormCreate(Sender: TObject);
begin
  try
     CheckStoreProc('AMEBPBA');
     sdqDelegacion.Open;
  except
     on E: Exception do begin
        ErrorMsg( E );
        Close;
     end;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmListPasSinEvol.GenerarConsulta : Boolean;
Var Sql : String;
begin
     if Validar Then begin
         // La consulta la Genero Paula Atlante
         Sql := 'SELECT sc_siniestro siniestro, sc_orden orden, sc_recaida recaida, ex_cuil cuil, tj_nombre nombre, ' +
                      ' NVL(ex_fecharecaida, ex_fechaaccidente) f_accidente, ex_diagnosticooms cie10, ' +
                      ' ex_diagnostico diagnostico, sc_prestador ultimo_prestador, sc_fechalta f_movimiento, sc_tipo tipo, ' +
                      ' sc_observaciones observaciones, amebpba.get_NombreDelegacion(sc_siniestro, sc_orden, sc_recaida) delegacion, SC_LOCALIDAD, ' +
                      ' AMEBPBA.GET_ADMINISTRATIVO(ex_siniestro,ex_orden,ex_recaida, ' +  edSinMoviDesde.SqlText  + ') ADMINISTRATIVO, EX_GTRABAJO GTrabajo, siniestro.get_usuariogestor(ex_id) USUGESTOR ' +
                ' FROM msc_siniconmovi a, ctj_trabajadores, sex_expedientes, usc_sectores ' +
                ' WHERE sc_fechalta BETWEEN ' + edUltMoviDesde.SqlText + ' AND ' + edUltMoviHasta.SqlText +
                ' AND ex_cuil = tj_cuil ' +
                ' AND sc_siniestro = ex_siniestro ' +
                ' AND sc_orden = ex_orden ' +
                ' AND sc_recaida = ex_recaida ' +
                ' AND SC_CODIGO = EX_SECTOR ' +
                ' AND NVL(ex_causafin, ''0'') NOT IN (''99'',''95'',''02'') ' +
                ' AND NOT EXISTS (SELECT 1 ' +
                                ' FROM mss_sinisinmovi' +
                                ' WHERE a.sc_siniestro = ss_siniestro' +
                                ' AND a.sc_orden = ss_orden' +
                                ' AND a.sc_recaida = ss_recaida' +
                                ' AND ss_fechalta > ' +  edSinMoviDesde.SqlText  + ')' +
                ' AND NOT EXISTS (SELECT 1 ' +
                                ' FROM spe_parteegreso ' +
                                ' WHERE a.sc_siniestro = pe_siniestro ' +
                                ' AND a.sc_orden = pe_orden ' +
                                ' AND a.sc_recaida = pe_recaida) ' +
                ' AND sc_fechalta = (SELECT MAX(b.sc_fechalta) ' +
                                ' FROM msc_siniconmovi b ' +
                                ' WHERE a.sc_siniestro = b.sc_siniestro ' +
                                ' AND a.sc_orden = b.sc_orden ' +
                                ' AND a.sc_recaida = b.sc_recaida) ' +
                ' AND EX_GTRABAJO = ''' + fraGrupoTrabajo.ID + '''' +   // Lu 07/04: como el Grupo de trabajo es obligatorio va aca directamente. El usuario gestor no lo es, asi que coloque el filtro mas abajo.
                ' AND (''' + frmPrincipal.DBLogin.Delegacion + ''' = ''840'' OR EX_SECTOR = ''' + frmPrincipal.DBLogin.Sector + ''' )';
        //                ' AND AMEBPBA.GET_GRUPOTRABAJO(sc_siniestro, sc_orden, sc_recaida) = ''' + cmbGrupo.FieldValue + '''';

              If cmbDelegacion.FieldValue <> '' Then
                Sql := Sql + ' AND SC_DELEGACION = ''' + cmbDelegacion.FieldValue + '''' ;

              If fraGrupoTrabajo.cmbGestor.Text <> '' then
                SQL := SQL + ' AND siniestro.get_usuariogestor(ex_id) = ' + SqlValue(fraGrupoTrabajo.cmbGestor.Text);

         CopySqlClp( Sql );
         Try
             sdqDatos.Close ;
             sdqDatos.Sql.Text := Sql;
             sdqDatos.Open;
             Result := True;
         except
            on E: EDatabaseError do begin
              Result := False;
              MsgBox(E.Message, MB_ICONERROR, 'Error al realizar la Consulta');
            end else begin
              Result := False;
              MsgBox('Error Inesperado al Generar la Consulta ', MB_ICONERROR, 'Error al realizar la Consulta');
            end;
         end;
     end else
         Result := False;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.tbOrdenClick(Sender: TObject);
begin
     SortDialog.Execute;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.tbExportarClick(Sender: TObject);
begin
     if SaveDialog.Execute Then
        if GenerarConsulta Then
           if QueryToFile.SaveFile( SaveDialog.FileName ) Then
              MsgBox('El archivo se ha exportado con exito.')
           else
              MsgBox('Error inesperado al exportar el archivo.', MB_ICONERROR);

end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmListPasSinEvol.Validar: Boolean;
begin
    Result := False ;
    if (edUltMoviDesde.Date = 0) Then begin
       edUltMoviDesde.SetFocus ;
       MsgBox('Debe completar las fechas de movimiento.', MB_ICONEXCLAMATION);

    end else if (edUltMoviHasta.Date = 0) Then begin
       edUltMoviHasta.SetFocus ;
       MsgBox('Debe completar las fechas de movimiento.', MB_ICONEXCLAMATION);

    end else if (edSinMoviDesde.Date = 0) Then begin
       edSinMoviDesde.SetFocus ;
       MsgBox('Debe completar la fecha "sin movimiento"', MB_ICONEXCLAMATION);

    end else if (fraGrupoTrabajo.ID = '') Then begin
       fraGrupoTrabajo.SetFocus;
       MsgBox('Debe completar el grupo de trabajo.', MB_ICONEXCLAMATION);

    end else
       Result := True ;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.tbImprimirClick(Sender: TObject);
begin
     if GenerarConsulta Then
        if sdqDatos.IsEmpty Then
           MsgBox('No se encontraron datos para la selección realizada.', MB_ICONEXCLAMATION)
        else begin
           if PrintDialog.Execute then begin
            MakeSubtitle;
            QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
            QueryPrint.Print;
           end;
        end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.tbVistaPreviaClick(Sender: TObject);
begin
     if GenerarConsulta Then begin
        MakeSubtitle;
        ABMDialog.Execute ;
     end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.ABMDialogBeforePrint(Sender: TObject;  var Cancel: Boolean);
begin
  if PrintDialog.Execute then begin
     QueryPrint.Footer.Text := frmPrincipal.DBLogin.Usuario ;
     QueryPrint.Print;
     Cancel := True;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmListPasSinEvol.MakeSubtitle;
begin
    QueryPrint.SubTitle.Lines.Clear;
    With QueryPrint.SubTitle.Lines do begin
        Add('Filtros:');
        Add('    Período del último movimiento desde ' + edUltMoviDesde.Text + ' al ' + edUltMoviHasta.Text);
        Add('    Sin movimiento a partir de ' + edSinMoviDesde.Text);
        Add('    Grupo de Trabajo ' + fraGrupoTrabajo.cmbDescripcion.Text);
        If fraGrupoTrabajo.cmbGestor.Text <> '' then
          Add('    Usuario Gestor ' + fraGrupoTrabajo.cmbGestor.Text);
        If cmbDelegacion.FieldValue <> '' Then
          Add('    Delegación ' + cmbDelegacion.Text);
    end;
end;

end.
