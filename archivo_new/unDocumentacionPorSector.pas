unit unDocumentacionPorSector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, PatternEdit, ComboEditor, CheckCombo,
  DBCheckCombo, DB, SDEngine, Buttons, DataExport, DataToXLS, Grids,
  DBGrids, unCustomConsulta, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, Menus, Provider,
  DBClient, ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, CardinalEdit, RxToolEdit, RxPlacemnt;

type
  TfrmDocumentacionPorSector = class(TfrmCustomConsulta)
    sdqSectores: TSDQuery;
    dsSectores: TDataSource;
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    gbSectores: TGroupBox;
    cmbSectores: TDBCheckCombo;
    ShortCutControl1: TShortCutControl;
    gbUsuarios: TGroupBox;
    cmbUsuarios: TDBCheckCombo;
    sdqUsuario: TSDQuery;
    dsUsuario: TDataSource;
    gbFecha: TGroupBox;
    edFechaRecepDesde: TDateComboBox;
    Label9: TLabel;
    edFechaRecepHasta: TDateComboBox;
    gbArchivo: TGroupBox;
    fraTipoArchivo: TfraCodigoDescripcion;
    pnlSeleccionados: TPanel;
    edCantSelecc: TCardinalEdit;
    ToolButton1: TToolButton;
    chkExcluirArchivosSinMovimCarpetas: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbEnviarMailClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    procedure RefreshData; override;
  private
    procedure EnviarMails;
    procedure DoValidarYCargarCarpetasSeleccionadas;
    procedure CalcularFilasSel;
    procedure InicializarContadores;
  public
  end;

var
  frmDocumentacionPorSector: TfrmDocumentacionPorSector;

implementation

uses
  unDmPrincipal, CustomDlgs, unEspera, AnsiSql, ArchFuncs, unComunesMail, unSesion,
  unComunes, unConstantArchivo, unUtilsArchivo, unART, StrFuncs;

{$R *.dfm}

{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.FormCreate(Sender: TObject);
begin
  Self.Width := Self.Width + 1;   // sinó, hay un problema con los botones de la toolbar, que cambian su funcionalidad al no estar maximizada la pantalla...
  inherited;

  OpenQuery( sdqSectores );

  with fraTipoArchivo do
    begin
      TableName   := 'RTA_TIPOARCHIVO';
      FieldID     := 'TA_ID';
      FieldCodigo := 'TA_CODIGO';
      FieldDesc   := 'TA_DESCRIPCION';
      ShowBajas   := True;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  InicializarContadores;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.EnviarMails;
var
  sCuerpo, sSectTxt, sSector, sSql, sTempFile: string;
  qryCarpetas: TSDQuery;
begin
  if MsgBox( '¿Confirma el envío de mails a los jefes de los usuarios, por las carpetas seleccionadas?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
    begin
      IniciarEspera('Preparando carpetas...');
      try
        DoValidarYCargarCarpetasSeleccionadas;

        IniciarEspera('Enviando correo...');
        try
          sSql := 'SELECT DISTINCT USUJEFE.SE_USUARIO, USUJEFE.SE_NOMBRE, USUJEFE.SE_SECTOR, USUJEFE.SE_MAIL MAIL, SC_CODIGO CODSECTOR, SC_DESCRIPCION DESCRSECTOR ' +
                    'FROM USC_SECTORES, USE_USUARIOS USUJEFE, USE_USUARIOS USUCARP, RAR_ARCHIVO, TCR_CARPETASELECCIONADA ' +
                   'WHERE CR_USUARIO = :UserId ' +
                     'AND CR_IDARCHIVO = AR_ID ' +
                     'AND AR_UBICACION = USUCARP.SE_USUARIO ' +
                     'AND USUCARP.SE_RESPONDEA = USUJEFE.SE_USUARIO '+
                     'AND USUJEFE.SE_FECHABAJA IS NULL ' +
                     'AND USUJEFE.SE_MAIL IS NOT NULL ' +
                     'AND USUJEFE.SE_SECTOR = SC_CODIGO ' +
                     'AND SC_FECHABAJA IS NULL ' +
                'ORDER BY SC_CODIGO, USUJEFE.SE_USUARIO';

          with GetQueryEx(sSql, [Sesion.UserId]) do
            try
              VALOR_PARAMETRO_CORREO_DOCUMENTACION := get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

              while not EOF do
                begin
                  sSql := 'SELECT TA_DESCRIPCION "Tipo Archivo", ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) "Clave", ' +
                                 'AR_FECHAMOVIMIENTO "Movimiento", AR_UBICACION "Ubicación", ' +
                                 'SC_FECHAPREVISTADEVOLUCION "Fecha Prevista Devol." ' +
                            'FROM USE_USUARIOS USUJEFE, USE_USUARIOS USUCARP, RTC_TIPOCLAVE, RAR_ARCHIVO, RTA_TIPOARCHIVO, ' +
                                 'RSC_SOLICITUDCARPETA SOLICACTUAL, TCR_CARPETASELECCIONADA ' +
                           'WHERE AR_TIPO = TA_ID ' +
                             'AND TA_FORMULARIO = TC_CLAVE ' +
                             'AND AR_ID = SOLICACTUAL.SC_IDARCHIVO(+) ' +
                             'AND AR_TIPOUBICACION = :TipoUbic ' +
                             'AND AR_UBICACION = USUCARP.SE_USUARIO ' +
                             'AND USUCARP.SE_RESPONDEA = USUJEFE.SE_USUARIO ' +
                             'AND USUJEFE.SE_USUARIO = :UsuJefe ' +
                             'AND CR_USUARIO = :UserId ' +
                             'AND CR_IDARCHIVO = AR_ID ' +
                             'AND SOLICACTUAL.SC_ID(+) = ART.ARCHIVO.GET_ULTSOLICITUDCARPETA(AR_ID)';

                  qryCarpetas := GetQueryEx(sSql, [TIPOUBICACION_USUARIO, FieldByName('SE_USUARIO').AsString, Sesion.UserId]);
                  try
                    if not qryCarpetas.Eof then
                      begin
                        sSectTxt  := 'Solicitud de Carpetas en Poder del Usuario';
                        sSector   := sSectTxt + ': ' + FieldByName('DESCRSECTOR').AsString;
                        sTempFile := GetTempFromFileName('Carpetas.xls');

                        sCuerpo := 'Se solicita la devolución de las carpetas detalladas en el archivo adjunto.' + CRLF + 'Desde ya,' + CRLF + 'Muchas Gracias';

                        with TDataToXLS.Create(nil) do
                          try
                            Title.Text := sSector;
                            DataSet := qryCarpetas;
                            SaveToFile( sTempFile );
                          finally
                            Free;
                          end;

                        SendByMailServer(FieldByName('MAIL').AsString,
                           Sesion.UserId, sSectTxt, sTempFile,
                           sCuerpo, False, False, False, Sesion.UserId, True);

                       SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
                          Sesion.UserId, sSector + ' (' + FieldByName('SE_NOMBRE').AsString + ')', sTempFile,
                          sCuerpo, False, True, False, Sesion.UserId, True);
                      end;
                  finally
                    qryCarpetas.free;
                  end;

                  Next;
                end;

              MsgBox('Mails enviados correctamente', MB_ICONINFORMATION);
            finally
              free;
            end;
        finally
          DetenerEspera;
        end;
      finally
        DetenerEspera;
      end;
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  cmbSectores.Clear;
  cmbUsuarios.Clear;
  fraTipoArchivo.Clear;
  edFechaRecepDesde.Clear;
  edFechaRecepHasta.Clear;
  chkExcluirArchivosSinMovimCarpetas.Checked := True;

  InicializarContadores;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.tbEnviarMailClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla');

  EnviarMails;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.RefreshData;
var
  sWhere, sSql: String;
begin
  sSql := 'SELECT * ' +
            'FROM (SELECT TA_DESCRIPCION TIPOARCHIVO, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE) CLAVE, ' +
                         'AR_FECHAMOVIMIENTO FMOVIMIENTO, AR_UBICACION UBICACION, AR_SECTORUSUARIO SECTORUSUARIO, ' +
                         'SOLICACTUAL.SC_FECHAPREVISTADEVOLUCION FPREVISTADEVOL, TA_ID IDRTA, ' +
                         'TRUNC(NVL(SOLICACTUAL.SC_FECHARECEPCION, AR_FECHAMOVIMIENTO)) FECHARECEPCION, ' +
                         'SECT.SC_DESCRIPCION DESCRSECTOR, AR_ID IDRAR, BO_NOMBRE ESTUDIOLEG, USUJEFE.SE_NOMBRE RESPONDEA, ' +
                         'USUJEFE.SE_MAIL MAILJEFE, USUJEFE.SE_FECHABAJA FBAJAJEFE, SC_OBSERVACPENDIENTE OBSERVACPENDIENTE ' +
                    'FROM USE_USUARIOS USUJEFE, USE_USUARIOS USUCARP, LEGALES.LBO_ABOGADO, USC_SECTORES SECT, RTC_TIPOCLAVE, ' +
                         'RAR_ARCHIVO, RTA_TIPOARCHIVO, RSC_SOLICITUDCARPETA SOLICACTUAL ' +
                   'WHERE AR_TIPO = TA_ID ' +
                     'AND TA_FORMULARIO = TC_CLAVE ' +
                     'AND AR_ID = SOLICACTUAL.SC_IDARCHIVO(+) ' +
                     'AND AR_TIPOUBICACION = ' + SqlValue(TIPOUBICACION_USUARIO) + ' ' +
                     'AND AR_SECTORUSUARIO = SECT.SC_CODIGO ' +
                     'AND SECT.SC_FECHABAJA IS NULL ' +
                     'AND AR_IDABOGADO = BO_ID(+) ' +
                     'AND SOLICACTUAL.SC_ID(+) = ART.ARCHIVO.GET_ULTSOLICITUDCARPETA(AR_ID) ' +
                     'AND AR_UBICACION = USUCARP.SE_USUARIO(+) ' +
                     'AND USUCARP.SE_RESPONDEA = USUJEFE.SE_USUARIO(+)) ' +
           'WHERE 1 = 1 ';

  sWhere := SqlBetweenDateTime(' AND FECHARECEPCION ', edFechaRecepDesde.Date, edFechaRecepHasta.Date);

  if not IsEmptyString(cmbSectores.Text) then
    sWhere := sWhere + ' AND SECTORUSUARIO ' + cmbSectores.InSql;

  if not IsEmptyString(cmbUsuarios.Text) then
    sWhere := sWhere + ' AND UBICACION ' + cmbUsuarios.InSql;

  if fraTipoArchivo.IsSelected then
    sWhere := sWhere + ' AND IDRTA = ' + SqlValue(fraTipoArchivo.Value);

  if chkExcluirArchivosSinMovimCarpetas.Checked then
    sWhere := sWhere + ' AND ARCHIVO.IS_ARCHIVOSINMOVIMCARPETAS(IDRTA) = ''N''';

  sdqConsulta.Sql.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  InicializarContadores;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.DoValidarYCargarCarpetasSeleccionadas;
var
  i: Integer;
  sSql: String;
  bResponsableOk: Boolean;
begin
  Do_LimpiarTablaTemporal('TCR_CARPETASELECCIONADA', 'CR_USUARIO', Sesion.Userid);

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      bResponsableOk := not sdqConsulta.FieldByName('RESPONDEA').IsNull and
                        not sdqConsulta.FieldByName('MAILJEFE').IsNull and
                        sdqConsulta.FieldByName('FBAJAJEFE').IsNull;
      Verificar(not bResponsableOk, nil, 'Para alguna de las carpetas seleccionadas, el usuario: ' + sdqConsulta.FieldByName('UBICACION').AsString + ' no tiene un responsable válido para la recepción de los mails.');

      sSql := 'INSERT INTO TCR_CARPETASELECCIONADA(CR_USUARIO, CR_IDARCHIVO) ' +
                 'VALUES(:UserId, :IdArchivo)';
      EjecutarSqlEx(sSql, [Sesion.Userid, sdqConsulta.FieldByName('IDRAR').AsInteger]);
    end;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.CalcularFilasSel;
begin
  edCantSelecc.Value := Grid.SelectedRows.Count;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.InicializarContadores;
begin
 edCantSelecc.Value := 0;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.tbOrdenarClick(Sender: TObject);
begin
  inherited;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.GridCellClick(Column: TColumn);
begin
  inherited;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
procedure TfrmDocumentacionPorSector.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  CalcularFilasSel;
end;
{------------------------------------------------------------------------------}
end.

