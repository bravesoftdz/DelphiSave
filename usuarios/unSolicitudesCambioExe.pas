unit unSolicitudesCambioExe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls,
  ToolWin, ExtCtrls, StdCtrls, Mask, ToolEdit, DateComboBox, Menus,
  unCustomGridABM, FormPanel, unArt, RxToolEdit, RxPlacemnt;

type
  TfrmSolicitudesCambioExe = class(TfrmCustomGridABM)
    grpFechaOP: TGroupBox;
    Label4: TLabel;
    edFechaAltaDesde: TDateComboBox;
    edFechaAltaHasta: TDateComboBox;
    rgImpresas: TRadioGroup;
    ShortCutControl1: TShortCutControl;
    mnuSeleccion: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    mnuImprimir: TPopupMenu;
    mnuImprimirSolicitud: TMenuItem;
    mnuImprimirResultados: TMenuItem;
    rgPropiedad: TRadioGroup;
    rgActivas: TRadioGroup;
    rgAutorizacion: TRadioGroup;
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuImprimirResultadosClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirSolicitudClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  protected
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override; 
  public
    procedure RefreshData; override;
    procedure ClearData; override;
    function DoABM: Boolean; override;
    function DoValidarImpresion: Boolean;
  end;

  procedure DoProcesarAnalista_CopiarArchivo(Usuario, Dir, UbicacionProgr, PathProgrCompleto, NombreProgr: String; NroSolicitud: TTableId);

var
  frmSolicitudesCambioExe: TfrmSolicitudesCambioExe;

implementation

uses
  unRptSolicitudCambioExe, unDmPrincipal, AnsiSql, unSesion, unComunes, CustomDlgs,
  unAltaSolicitudesCambioExe, SqlFuncs, ArchFuncs, StrFuncs, General,
  unEspera, VCLExtra;

{$R *.dfm}

procedure TfrmSolicitudesCambioExe.ClearData;
begin
  edFechaAltaDesde.Clear;
  edFechaAltaHasta.Clear;
  rgImpresas.ItemIndex     := 1; // Pendientes de Impresión
  rgPropiedad.ItemIndex    := 0; // Propiedad = Todas
  rgActivas.ItemIndex      := 1; // Activas = Sí
  rgAutorizacion.ItemIndex := 2; // Autorización = No
  inherited;
end;

procedure TfrmSolicitudesCambioExe.RefreshData;
var
  sWhere, sSql: String;
begin
  sSql := 'SELECT JC_NROSOLICITUD, JC_NOMBREPROGR, JC_FECHAPROGR, JC_FECHAALTA, ' +
                 'JC_MODIFICACIONES, JC_ANALISTA, JC_FIMPRESIONSOLICITUD, ' +
                 'DECODE(JC_PRIORIDAD, 0, ''Baja'', 1, ''Mediana'', 2, ''Alta'', ''Mediana'') PRIORIDAD, ' +
                 'JC_USUBAJA, TRUNC(JC_FECHABAJA) FECHABAJA, VARIOS.PUTLASTBAR(JC_UBICACIONPROGR) || JC_NOMBREPROGR PATHPROGRCOMPLETO,  ' +
                 'JC_UBICACIONPROGR, JC_USUALTA ' +
            'FROM EJC_PROGREJECUTABLES ' +
           'WHERE 1 = 1';

  sWhere := SqlBetween(' AND JC_FECHAALTA', edFechaAltaDesde.Date, edFechaAltaHasta.Date);

  case rgPropiedad.ItemIndex of
    1: sWhere := sWhere + ' AND JC_USUALTA = ' + SqlValue(Sesion.UserId);
    2: sWhere := sWhere + ' AND JC_USUALTA <> ' + SqlValue(Sesion.UserId);
  end;

  case rgActivas.ItemIndex of
    1: sWhere := sWhere + ' AND JC_FECHABAJA IS NULL';
    2: sWhere := sWhere + ' AND JC_FECHABAJA IS NOT NULL';
  end;

  case rgAutorizacion.ItemIndex of
    1: sWhere := sWhere + ' AND JC_ANALISTA IS NOT NULL';
    2: sWhere := sWhere + ' AND JC_ANALISTA IS NULL';
  end;

  case rgImpresas.ItemIndex of
    1: sWhere := sWhere + ' AND JC_FIMPRESIONSOLICITUD IS NULL';
    2: sWhere := sWhere + ' AND JC_FIMPRESIONSOLICITUD IS NOT NULL';
  end;

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmSolicitudesCambioExe.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;

procedure TfrmSolicitudesCambioExe.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnSelectAll;
end;

procedure TfrmSolicitudesCambioExe.FormCreate(Sender: TObject);
begin
  inherited;

  edFechaAltaHasta.Date := DBDateTime();
  edFechaAltaDesde.Date := edFechaAltaHasta.Date - 6;

  FieldBaja := 'FECHABAJA';
end;

procedure TfrmSolicitudesCambioExe.mnuImprimirResultadosClick(Sender: TObject);
begin
  inherited tbImprimirClick(nil);
end;

procedure TfrmSolicitudesCambioExe.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmSolicitudesCambioExe.mnuImprimirSolicitudClick(Sender: TObject);
var
  i: Integer;
  sSql: String;
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos una fila de la grilla.');

  if DoValidarImpresion() then
    begin
      Do_LimpiarTablaTemporal('TMP_SOLICITUDEJECUTABLES', 'MP_USUARIO', Sesion.UserId);

      for i := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

          sSql := 'INSERT INTO TMP_SOLICITUDEJECUTABLES(MP_USUARIO, MP_NROSOLICITUD) ' +
                       'VALUES(:UserId, :Solicitud)';
          EjecutarSqlEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('JC_NROSOLICITUD').AsInteger]);
        end;

      if TqrSolicitudCambioExe.Preparar then
        RefreshData;
    end;
end;

procedure TfrmSolicitudesCambioExe.tbNuevoClick(Sender: TObject);
begin
  // esta opcion ya no se deberia usar mas...
  (*with TfrmAltaSolicitudesCambioExe.Create(nil) do
    try
      if Showmodal = mrOk then
        RefreshData;
    finally
      Free
    end;*)
end;

function TfrmSolicitudesCambioExe.DoABM: Boolean;
begin
  Sql.Clear;
  Sql.TableName := 'EJC_PROGREJECUTABLES';

  if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('JC_NROSOLICITUD', sdqConsulta.FieldByName('JC_NROSOLICITUD').AsInteger, False);
      Sql.Fields.Add('JC_FECHABAJA',        exDateTime);
      Sql.Fields.Add('JC_USUBAJA',          Sesion.UserID);

      Sql.SqlType := stUpdate;
    end;

  Result := inherited DoABM;
end;

procedure TfrmSolicitudesCambioExe.tbEliminarClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count >= 2, nil, 'Debe seleccionar solo una fila de la grilla.');

  inherited;
end;

function TfrmSolicitudesCambioExe.DoValidarImpresion: Boolean;
var
  i: Integer;
begin
  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'Uno de los registros seleccionados se encuentra dado de baja.');
      Verificar(sdqConsulta.FieldByName('JC_ANALISTA').IsNull, nil, 'Uno de los registros seleccionados no se encuentra autorizado.');
    end;

  Result := True;
end;

procedure TfrmSolicitudesCambioExe.tbPropiedadesClick(Sender: TObject);
var
  i: Integer;
  sDir: String;
begin
  with sdqConsulta do
    begin
      Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos una fila de la grilla.');

      for i := 0 to Grid.SelectedRows.Count - 1 do
        begin
          GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

          Verificar(not FieldByName('FECHABAJA').IsNull, nil, 'Uno de los registros seleccionados se encuentra dado de baja.');
          Verificar(not FieldByName('JC_ANALISTA').IsNull, nil, 'Uno de los registros seleccionados ya se encuentra autorizado.');
          Verificar(not FieldByName('JC_FIMPRESIONSOLICITUD').IsNull, nil, 'Uno de los registros seleccionados ya ha sido impreso.');
        end;

      if MsgBox('¿Confirma la autorización de las solicitudes seleccionadas y la copia de los archivos correspondientes al directorio de pre-producción?', MB_ICONQUESTION + MB_YESNO) = IDYES then
        begin
          IniciarEspera('Autorizando y copiando archivos...');
          Application.ProcessMessages;
          try
            sDir := PutLastBar(Get_CTBEspecial1('PATHS', '009'));
            BeginTrans;
            try
              for i := 0 to Grid.SelectedRows.Count - 1 do
                begin
                  GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                  DoProcesarAnalista_CopiarArchivo(Sesion.UserId, sDir, FieldByName('JC_UBICACIONPROGR').AsString, FieldByName('PATHPROGRCOMPLETO').AsString, FieldByName('JC_NOMBREPROGR').AsString, FieldByName('JC_NROSOLICITUD').AsInteger);
                end;

              CommitTrans;
              MsgBox('Solicitudes autorizadas correctamente.', MB_ICONINFORMATION);
              RefreshData;
            except
              on E: Exception do
                begin
                  ErrorMsg( E, 'Error al autorizar las solicitudes.' );
                  RollBack;
                end;
            end;
          finally
            DetenerEspera;
          end;
        end;
    end;
end;

procedure DoProcesarAnalista_CopiarArchivo(Usuario, Dir, UbicacionProgr, PathProgrCompleto, NombreProgr: String; NroSolicitud: TTableId);
var
  bCopiarArch: Boolean;
  sArchCompleto, sSql: String;
begin
  bCopiarArch := not IsEmptyString(UbicacionProgr);

  sSql := 'UPDATE EJC_PROGREJECUTABLES ' +
             'SET JC_ANALISTA = :Usuario, ' +
                 'JC_UBICACIONPROGR = :UbicProg ' +
           'WHERE JC_NROSOLICITUD = :Id';
  EjecutarSqlSTEx(sSql, [Usuario, Iif(bCopiarArch, Dir, ''), NroSolicitud]);

  if bCopiarArch then
    begin
      sArchCompleto := PathProgrCompleto;

      Verificar(not CopyFileExt(sArchCompleto, Dir + NombreProgr, False), nil, 'No se ha podido copiar a pre-producción el archivo: ' + sArchCompleto + '.');
    end;
end;

procedure TfrmSolicitudesCambioExe.ClearControls;
begin
//  inherited;
end;

procedure TfrmSolicitudesCambioExe.LoadControls;
begin
//  inherited;
end;

function TfrmSolicitudesCambioExe.Validar: Boolean;
begin
  Result := True;
end;

end.

