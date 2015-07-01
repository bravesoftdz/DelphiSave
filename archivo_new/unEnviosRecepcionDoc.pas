unit unEnviosRecepcionDoc;

interface
               
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Menus, ToolEdit, DateComboBox,
  unArtFrame, unArtDBAwareFrame, unFraCodigoDescripcion, Mask, PatternEdit,
  ComboEditor, CheckCombo, DBCheckCombo, IntEdit, unFraUsuario,
  unFraFiltroArchivo, CardinalEdit, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, RxToolEdit, RxPlacemnt;

type
  TfrmEnviosRecepcionDoc = class(TfrmCustomGridABM)
    pmnuSeleccionar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    gbUsuarios: TGroupBox;
    cmbUsuarios: TDBCheckCombo;
    gbArchivo: TGroupBox;
    fraTipoArchivo: TfraCodigoDescripcion;
    gbFechaEntrega: TGroupBox;
    Label1: TLabel;
    edFechaEntregaDesde: TDateComboBox;
    edFechaEntregaHasta: TDateComboBox;
    sdqUsuario: TSDQuery;
    dsUsuario: TDataSource;
    gbRemito: TGroupBox;
    edRemitoDesde: TIntEdit;
    Label2: TLabel;
    edRemitoHasta: TIntEdit;
    rgEstadoRemito: TRadioGroup;
    chkPendientesRecepc: TCheckBox;
    fraAMUsuario: TfraUsuarios;
    Label3: TLabel;
    fraAMFiltroArchivo: TfraFiltroArchivo;
    lblDocumento: TLabel;
    fraAMTipoDocumento: TfraCodigoDescripcion;
    lblCantidadHojas: TLabel;
    edAMHojas: TIntEdit;
    lblObservaciones: TLabel;
    edAMObservaciones: TMemo;
    edAMLote: TIntEdit;
    Label4: TLabel;
    edAMFEntrega: TDateComboBox;
    edAMFRecepcion: TDateComboBox;
    Label5: TLabel;
    Label6: TLabel;
    ShortCutControl1: TShortCutControl;
    pmnuImpresion: TPopupMenu;
    mnuUsuImprimirRemito: TMenuItem;
    mnuImprimirListado: TMenuItem;
    mnuUsuGenerarRemito: TMenuItem;
    tbExtraviado: TToolButton;
    ToolButton2: TToolButton;
    tbSalir2: TToolButton;
    pmnuExtraviado: TPopupMenu;
    mnuMarcarExtraviado: TMenuItem;
    mnuDesmarcarExtraviado: TMenuItem;
    chkMostrarExtraviados: TCheckBox;
    chkNoMostrarBajas: TCheckBox;
    Label7: TLabel;
    edAMCaja: TIntEdit;
    gbLote: TGroupBox;
    edLote: TIntEdit;
    tbEnviarMailDoc: TToolButton;
    ToolButton1: TToolButton;
    pnlSeleccionados: TPanel;
    edCantSelecc: TCardinalEdit;
    fraAMErrorCarga: TfraStaticCTB_TABLAS;
    Label8: TLabel;
    mnuUsuario: TMenuItem;
    mnuAdministradora: TMenuItem;
    mnuAdminGenerarRemito: TMenuItem;
    mnuAdminUsuImprimirRemito: TMenuItem;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    edRemitoAdminDesde: TIntEdit;
    edRemitoAdminHasta: TIntEdit;
    rgEstadoRemitoAdmin: TRadioGroup;
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure edRemitoDesdeExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure fraTipoArchivoPropiedadesChange(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure mnuImprimirListadoClick(Sender: TObject);
    procedure mnuUsuImprimirRemitoClick(Sender: TObject);
    procedure mnuUsuGenerarRemitoClick(Sender: TObject);
    procedure tbExtraviadoClick(Sender: TObject);
    procedure mnuMarcarExtraviadoClick(Sender: TObject);
    procedure GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
    procedure tbEnviarMailDocClick(Sender: TObject);
    procedure tbOrdenarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mnuAdminGenerarRemitoClick(Sender: TObject);
    procedure edRemitoAdminDesdeExit(Sender: TObject);
    procedure mnuAdminUsuImprimirRemitoClick(Sender: TObject);
  private
    procedure ImprimirRemito(Remito: Integer);
    procedure ImprimirRemitoAdmin(Remito: Integer);
    function IsExtraviado: Boolean;
    function DoValidarDatosExtraviados(Extraviado: Boolean): Boolean;
    function VerificarRemitos: Boolean;
    function VerificarRemitosAdmin: Boolean;
    function GenerarRemitosGrilla: Boolean;
    function GenerarRemitosGrillaAdmin: Boolean;
    procedure DoEnviarMailsDocumentacion;
    function DoValidarYCargarDocumentacionSeleccionada: Boolean;
    procedure CalcularFilasSel;
    procedure InicializarContadores;
    procedure DoGenerarEroresUsuarios;
    function GetObservacionesErrorUsuario(Clave, Documento, Caja, Observaciones, Remito: String): String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
    procedure RefreshData; override;
  public
  end;

var
  frmEnviosRecepcionDoc: TfrmEnviosRecepcionDoc;

implementation

uses
  unDmPrincipal, CustomDlgs, AnsiSql, unSesion, unComunes, SqlFuncs, General,
  unArt, DateTimeFuncs, unqrRemitoEnvioRecepcionDoc, unEspera, unConstantArchivo,
  ArchFuncs, DataToXLS, unComunesMail, unUtilsArchivo, StrFuncs,
  unqrRemitoAdminEnvioRecepcionDoc;

{$R *.dfm}

procedure TfrmEnviosRecepcionDoc.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilasSel;
end;

procedure TfrmEnviosRecepcionDoc.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  InicializarContadores;
end;

procedure TfrmEnviosRecepcionDoc.edRemitoDesdeExit(Sender: TObject);
begin
  if not edRemitoDesde.IsEmpty and edRemitoHasta.IsEmpty then
    edRemitoHasta.Value := edRemitoDesde.Value;
end;

procedure TfrmEnviosRecepcionDoc.tbLimpiarClick(Sender: TObject);
begin
  edFechaEntregaDesde.Clear;
  edFechaEntregaHasta.Clear;
  edLote.Clear;
  cmbUsuarios.Clear;
  fraTipoArchivo.Clear;
  edRemitoDesde.Clear;
  edRemitoHasta.Clear;
  edRemitoAdminDesde.Clear;
  edRemitoAdminHasta.Clear;
  rgEstadoRemito.ItemIndex      := 2;   // Todos
  rgEstadoRemitoAdmin.ItemIndex := 2;   // Todos
  chkPendientesRecepc.Checked   := False;
  chkMostrarExtraviados.Checked := True;
  chkNoMostrarBajas.Checked     := True;

  InicializarContadores;

  inherited;
end;

procedure TfrmEnviosRecepcionDoc.RefreshData;
var
  sWhere, sSql: string;
begin
  sSql := 'SELECT EC_ID, EC_USUARIO, EC_IDLOTE, EC_HOJAS, EC_FECHAENTREGA, EC_OBSERVACIONES, ' +
                 'EC_FECHARECEPCION, TA_DESCRIPCION, TD_DESCRIPCION, ' +
                 'DECODE(EC_IDARCHIVO, NULL, NULL, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE)) CLAVE, ' +
                 'TRUNC(EC_FECHAIMPRESION) FECHAIMPRESION, EC_USUIMPRESION, TRUNC(EC_FECHABAJA) FECHABAJA, ' +
                 'EC_USUBAJA, EC_IDARCHIVO, EC_IDTIPODOCUMENTO, EC_TIPOARCHIVO, EC_REMITO, ' +
                 'TRUNC(EC_FECHAALTAEXTRAVIADO) FECHAALTAEXTRAVIADO, EC_CAJA, EC_CODERROR CODERROR, ' +
                 'TB_DESCRIPCION DESCRERROR, EC_REMITOADMIN, TRUNC(EC_FECHAIMPRESIONADMIN) FECHAIMPRESIONADMIN, ' +
                 'EC_USUIMPRESIONADMIN ' +
            'FROM CTB_TABLAS, RTC_TIPOCLAVE, RAR_ARCHIVO, RTD_TIPODOCUMENTO, RTA_TIPOARCHIVO, REC_ENVIORECEPCIONDOC ' +
           'WHERE EC_TIPOARCHIVO = TA_ID(+) ' +
             'AND EC_IDTIPODOCUMENTO = TD_ID(+) ' +
             'AND EC_IDARCHIVO = AR_ID(+) ' +
             'AND TB_CLAVE(+) = ''EUAGA'' ' +
             'AND TB_CODIGO(+) = EC_CODERROR ' +
             'AND TA_FORMULARIO = TC_CLAVE(+) ';

  sWhere := SqlBetweenDateTime(' AND EC_FECHAENTREGA ', edFechaEntregaDesde.Date, edFechaEntregaHasta.Date) +
            SqlBetween(' AND EC_REMITO ', edRemitoDesde.Value, edRemitoHasta.Value) +
            SqlBetween(' AND EC_REMITOADMIN ', edRemitoAdminDesde.Value, edRemitoAdminHasta.Value);

  if not edLote.IsEmpty then
    sWhere := sWhere + ' AND EC_IDLOTE = ' + SqlValue(edLote.Value);

  if cmbUsuarios.Text <> '' then
    sWhere := sWhere + ' AND EC_USUARIO ' + cmbUsuarios.InSql;

  if fraTipoArchivo.IsSelected then
    sWhere := sWhere + ' AND EC_TIPOARCHIVO = ' + SqlValue(fraTipoArchivo.Value);

  case rgEstadoRemito.ItemIndex of
    0: sWhere := sWhere + ' AND EC_FECHAIMPRESION IS NULL';
    1: sWhere := sWhere + ' AND EC_FECHAIMPRESION IS NOT NULL';
  end;

  case rgEstadoRemitoAdmin.ItemIndex of
    0: sWhere := sWhere + ' AND EC_FECHAIMPRESIONADMIN IS NULL';
    1: sWhere := sWhere + ' AND EC_FECHAIMPRESIONADMIN IS NOT NULL';
  end;

  if chkPendientesRecepc.Checked then
    sWhere := sWhere + ' AND EC_FECHARECEPCION IS NULL';

  if not chkMostrarExtraviados.Checked then
    sWhere := sWhere + ' AND EC_FECHAALTAEXTRAVIADO IS NULL';

  if chkNoMostrarBajas.Checked then
    sWhere := sWhere + ' AND EC_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  InicializarContadores;
end;

procedure TfrmEnviosRecepcionDoc.ClearControls;
begin
  fraAMUsuario.Clear;
  fraAMFiltroArchivo.Clear;
  fraAMTipoDocumento.Clear;
  fraTipoArchivoPropiedadesChange(nil);
  edAMCaja.Clear;
  edAMHojas.Clear;
  edAMLote.Clear;
  edAMFEntrega.Clear;
  edAMFRecepcion.Clear;
  edAMObservaciones.Clear;
  fraAMErrorCarga.Clear;
end;

procedure TfrmEnviosRecepcionDoc.LoadControls;
begin
  with sdqConsulta do
    begin
      fraAMUsuario.Value := FieldByName('EC_USUARIO').AsString;

      if FieldByName('EC_CAJA').IsNull then
        edAMCaja.Clear
      else
        edAMCaja.Value := FieldByName('EC_CAJA').AsInteger;

      if FieldByName('EC_HOJAS').IsNull then
        edAMHojas.Clear
      else
        edAMHojas.Value := FieldByName('EC_HOJAS').AsInteger;

      if FieldByName('EC_IDLOTE').IsNull then
        edAMLote.Clear
      else
        edAMLote.Value := FieldByName('EC_IDLOTE').AsInteger;

      edAMFEntrega.Date            := FieldByName('EC_FECHAENTREGA').AsDateTime;
      edAMFRecepcion.Date          := FieldByName('EC_FECHARECEPCION').AsDateTime;
      edAMObservaciones.Lines.Text := FieldByName('EC_OBSERVACIONES').AsString;
      fraAMErrorCarga.Codigo       := FieldByName('CODERROR').AsString;
    end;
end;

function TfrmEnviosRecepcionDoc.DoABM: Boolean;
begin
  with Sql do
    begin
      Clear;
      if ModoABM = maBaja then
        begin
          PrimaryKey.Add('EC_ID',             sdqConsulta.FieldByName('EC_ID').AsInteger);
          Fields.Add('EC_USUBAJA',            Sesion.UserID);
          Fields.Add('EC_FECHABAJA',          exDateTime);

          SqlType := stUpdate;
        end
      else
        begin
          if ModoABM = maAlta then
            begin
              PrimaryKey.Add('EC_ID',         GetSecNextVal('SEQ_REC_ID'));
              Fields.Add('EC_USUALTA',        Sesion.UserID);
              Fields.Add('EC_FECHAALTA',      exDateTime);
            end
          else
            begin
              PrimaryKey.Add('EC_ID',         sdqConsulta.FieldByName('EC_ID').AsInteger);
              Fields.Add('EC_USUMODIF',       Sesion.UserID);
              Fields.Add('EC_FECHAMODIF',     exDateTime);
              Fields.Add('EC_USUBAJA',        exNull);
              Fields.Add('EC_FECHABAJA',      exNull);
            end;

          Fields.Add('EC_USUARIO',            fraAMUsuario.Value);
          Fields.Add('EC_TIPOARCHIVO',        fraAMFiltroArchivo.Tipo, True);

          if fraAMFiltroArchivo.IdArchivo = -1 then
            Fields.Add('EC_IDARCHIVO',        exNull)
          else
            Fields.Add('EC_IDARCHIVO',        fraAMFiltroArchivo.IdArchivo);

          Fields.Add('EC_IDTIPODOCUMENTO',    fraAMTipoDocumento.Value, True);
          Fields.Add('EC_IDLOTE',             edAMLote.Value, True);
          Fields.Add('EC_CAJA',               edAMCaja.Value, True);
          Fields.Add('EC_HOJAS',              edAMHojas.Value, True);
          Fields.Add('EC_CODERROR',           fraAMErrorCarga.Codigo);

          if edAMFEntrega.IsEmpty then
            Fields.Add('EC_FECHAENTREGA',     exNull)
          else
            Fields.Add('EC_FECHAENTREGA',     edAMFEntrega.Date);

          if edAMFRecepcion.IsEmpty then
            Fields.Add('EC_FECHARECEPCION',   exNull)
          else
            Fields.Add('EC_FECHARECEPCION',   edAMFRecepcion.Date);

          Fields.Add('EC_OBSERVACIONES',      edAMObservaciones.Lines.Text);
        end;
    end;

  Result := inherited DoABM;
end;

function TfrmEnviosRecepcionDoc.Validar: Boolean;
begin
  Verificar(fraAMUsuario.IsEmpty, fraAMUsuario, 'Debe ingresar el usuario.');
  Verificar(not fraAMFiltroArchivo.IsSelected, fraAMFiltroArchivo, 'Debe indicar el tipo de archivo.');
  Verificar(fraAMFiltroArchivo.IsCompleted and (fraAMFiltroArchivo.IdArchivo = -1), fraAMFiltroArchivo, 'La carpeta seleccionada no existe.');
  Verificar(fraAMFiltroArchivo.IsCompleted and not edAMCaja.IsEmpty, fraAMFiltroArchivo, 'Puede ingresar la carpeta o la caja, pero no ambos.');
  Verificar(fraAMTipoDocumento.IsSelected and not edAMCaja.IsEmpty, fraAMTipoDocumento, 'Puede ingresar el documento o la caja, pero no ambos.');
  Verificar(edAMFEntrega.IsEmpty, edAMFEntrega, 'La fecha de entrega es obligatoria.');
  Verificar(edAMFEntrega.Date > DBDate(), edAMFEntrega, 'La fecha de entrega no puede ser mayor a la fecha actual.');
  Verificar(edAMFRecepcion.Date > DBDate(), edAMFRecepcion, 'La fecha de recepción no puede ser mayor a la fecha actual.');
  Verificar(not edAMFRecepcion.IsEmpty and (edAMFRecepcion.Date < edAMFEntrega.Date), edAMFRecepcion, 'La fecha de recepción no puede ser menor que la fecha de entrega.');
  Verificar((fraAMErrorCarga.Codigo = CODERROR_SEGUSU_DOCLOTEINEXISTENTE) and edAMLote.IsEmpty, edAMLote, 'Debe indicar el lote.');

  if not edAMLote.IsEmpty then
    begin
      Verificar(not Is_ExisteLote(edAMLote.Value), edAMLote, 'No se encuentra el lote o el mismo se encuentra dado de baja.');

      if fraAMFiltroArchivo.IsSelected then
        Verificar(not Is_ExisteLoteEnTipoArchivo(edAMLote.Value, fraAMFiltroArchivo.Tipo), edAMLote, 'El tipo del archivo del lote no corresponde con el tipo de archivo ingresado.');
    end;

  Result := True;
end;

procedure TfrmEnviosRecepcionDoc.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;

  OpenQuery(sdqUsuario);

  with fraTipoArchivo do
    begin
      TableName   := 'RTA_TIPOARCHIVO';
      FieldID     := 'TA_ID';
      FieldCodigo := 'TA_CODIGO';
      FieldDesc   := 'TA_DESCRIPCION';
      ShowBajas   := True;
    end;

  fraAMUsuario.ShowBajas := False;

  fraTipoArchivoPropiedadesChange(nil);

  FieldBaja     := 'FECHABAJA';
  Sql.TableName := 'REC_ENVIORECEPCIONDOC';
end;

procedure TfrmEnviosRecepcionDoc.fraTipoArchivoPropiedadesChange(Sender: TObject);
begin
  with fraAMTipoDocumento do
    begin
      TableName   := 'RTD_TIPODOCUMENTO';
      FieldID     := 'TD_ID';
      FieldCodigo := 'TD_CODIGO';
      FieldDesc   := 'TD_DESCRIPCION';
      FieldBaja   := 'TD_FECHABAJA';

      if fraAMFiltroArchivo.IsSelected then
        ExtraCondition := ' AND EXISTS (SELECT 1 ' +
                                         'FROM RAD_TIPOARCHIVODOCUMENTO ' +
                                        'WHERE AD_IDTIPOARCHIVO = ' + SqlValue(fraAMFiltroArchivo.Tipo) + ' ' +
                                          'AND AD_FECHABAJA IS NULL ' +
                                          'AND AD_IDTIPODOCUMENTO = TD_ID) '
      else
        ExtraCondition := ' AND 1 = 2';

      ShowBajas := False;
      Clear;
    end;

  with fraAMErrorCarga do
    begin
      Clave     := 'EUAGA';
      ShowBajas := False;
    end;

  fraAMFiltroArchivo.OnArchivoChange(Sender);
end;

procedure TfrmEnviosRecepcionDoc.fpAbmEnter(Sender: TObject);
begin
  if ModoABM = maModificacion then    // lo puse acá sinó daba error al asignar el tipo de archivo
    with sdqConsulta do
      begin
        fraAMFiltroArchivo.Clear;

        if FieldByName('EC_IDARCHIVO').IsNull then
          begin
            if FieldByName('EC_TIPOARCHIVO').IsNull then
              fraAMFiltroArchivo.Clear
            else
              fraAMFiltroArchivo.Tipo := FieldByName('EC_TIPOARCHIVO').AsInteger;
          end
        else
          fraAMFiltroArchivo.IdArchivo := FieldByName('EC_IDARCHIVO').AsInteger;

        fraTipoArchivoPropiedadesChange(nil);
        fraAMTipoDocumento.Value := FieldByName('EC_IDTIPODOCUMENTO').AsInteger;
      end;

  fraAMUsuario.edCodigo.Setfocus;
end;

procedure TfrmEnviosRecepcionDoc.tbImprimirClick(Sender: TObject);
begin
  tbImprimir.CheckMenuDropdown;
end;

procedure TfrmEnviosRecepcionDoc.mnuImprimirListadoClick(Sender: TObject);
begin
  PrintResults;
end;

procedure TfrmEnviosRecepcionDoc.ImprimirRemito(Remito: Integer);
begin
  with TqrRemitoEnvioRecepcionDoc.Create(Self) do
    try
      ImprimirRemito(Remito);
    finally
      Free;
    end;
end;

procedure TfrmEnviosRecepcionDoc.mnuUsuImprimirRemitoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Seleccione solo un registro en la grilla que contenga el remito que quiere imprimir.');
  Verificar(sdqConsulta.FieldByName('EC_REMITO').IsNull, Grid, 'El remito no ha sido generado.');

  ImprimirRemito(sdqConsulta.FieldByName('EC_REMITO').AsInteger);
end;

function TfrmEnviosRecepcionDoc.VerificarRemitos: Boolean;
var
 i: Integer;
 sSql: String;
begin
  Do_LimpiarTablaTemporal('TMP.TEC_ENVIORECEPCIONDOC', 'EC_USUARIO', Sesion.Userid);

  sdqConsulta.DisableControls;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        Verificar(not sdqConsulta.FieldByName('EC_REMITO').IsNull, nil, 'Uno de los registros tiene un remito al usuario generado.');
        Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'Uno de los registros se encuentra dado de baja.');
        Verificar(not sdqConsulta.FieldByName('FECHAALTAEXTRAVIADO').IsNull, nil, 'Uno de los registros se encuentra extraviado.');

        sSql := 'INSERT INTO TMP.TEC_ENVIORECEPCIONDOC(EC_USUARIO, EC_IDENVIORECEPCIONDOC) ' +
                     'VALUES(:UserId, :Id)';
        EjecutarSqlEx(sSql, [Sesion.Userid, sdqConsulta.FieldByName('EC_ID').AsInteger]);
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;

function TfrmEnviosRecepcionDoc.GenerarRemitosGrilla: Boolean;
var
  sSql: String;
  Remito: TTableId;
begin
  sSql := 'SELECT DISTINCT REC.EC_USUARIO USUREMITO ' +
            'FROM TMP.TEC_ENVIORECEPCIONDOC TMPREC, REC_ENVIORECEPCIONDOC REC ' +
           'WHERE TMPREC.EC_USUARIO = :Usuario ' +
             'AND TMPREC.EC_IDENVIORECEPCIONDOC = REC.EC_ID ' +
           'ORDER BY 1';

  BeginTrans;
  try
    with GetQueryEx(sSql, [Sesion.UserId]) do
      try
        while not Eof do
          begin
            Remito := GetSecNextVal('SEQ_REC_REMITO_ID');

            sSql := 'UPDATE REC_ENVIORECEPCIONDOC ' +
                       'SET EC_REMITO = :Remito, ' +
                           'EC_FECHAIMPRESION = SYSDATE, ' +
                           'EC_USUIMPRESION = :Usuario1 ' +
                     'WHERE EC_ID IN (SELECT TMPREC.EC_IDENVIORECEPCIONDOC ' +
                                       'FROM TMP.TEC_ENVIORECEPCIONDOC TMPREC, REC_ENVIORECEPCIONDOC REC ' +
                                      'WHERE TMPREC.EC_USUARIO = :Usuario2 ' +
                                        'AND TMPREC.EC_IDENVIORECEPCIONDOC = REC.EC_ID ' +
                                        'AND REC.EC_USUARIO = :UsuarioRemito)';
            EjecutarSqlSTEx(sSql, [Remito, Sesion.UserId, Sesion.UserId, FieldByName('USUREMITO').AsString]);

            ImprimirRemito(Remito);

            Next;
          end;

        CommitTrans;
        Result := True;
      finally
        Free;
      end;
  except
    on E : exception do
    begin
      Rollback;
      Raise Exception.Create('Se produjo un error al intentar generar el remito al usuario.' + CRLF + E.Message);
    end;
  end;
end;

procedure TfrmEnviosRecepcionDoc.mnuUsuGenerarRemitoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla');

  if VerificarRemitos() then
    if GenerarRemitosGrilla() then
      begin
        DoGenerarEroresUsuarios;
        RefreshData;
      end;
end;

procedure TfrmEnviosRecepcionDoc.tbExtraviadoClick(Sender: TObject);
begin
  tbExtraviado.CheckMenuDropdown;
end;

function TfrmEnviosRecepcionDoc.IsExtraviado: Boolean;
begin
  Result := not sdqConsulta.FieldByName('FECHAALTAEXTRAVIADO').IsNull;
end;

function TfrmEnviosRecepcionDoc.DoValidarDatosExtraviados(Extraviado: Boolean): Boolean;
var
  sEsta: String;
  bValidar: Boolean;
  i: Integer;
begin
  sdqConsulta.DisableControls;
  try
    with sdqConsulta do
      begin
        for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

            if Extraviado then
              begin
                bValidar := IsExtraviado();
                sEsta    := ' no';
              end
            else
              begin
                bValidar := not IsExtraviado();
                sEsta    := '';
              end;

            Verificar(not bValidar, nil, 'El registro ' + sEsta + ' se encuentra extraviado.');
          end;
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;

procedure TfrmEnviosRecepcionDoc.mnuMarcarExtraviadoClick(Sender: TObject);
var
  bMarcarExtraviados: Boolean;
  sMarcado, sSql: String;
  i: Integer;
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla.');

  bMarcarExtraviados := (Sender = mnuMarcarExtraviado);
  sMarcado           := Iif(bMarcarExtraviados, 'marcado', 'desmarcado');

  if DoValidarDatosExtraviados(not bMarcarExtraviados) then
    begin
      sdqConsulta.DisableControls;
      try
        if MsgBox('¿Confirma el ' + sMarcado + ' de los registros seleccionados?', MB_ICONQUESTION+MB_YESNO) = ID_YES then
          begin
            BeginTrans;
            try
              with sdqConsulta do
                for i := 0 to Grid.SelectedRows.Count - 1 do
                  begin
                    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

                    if bMarcarExtraviados then
                      begin
                        sSql := 'UPDATE REC_ENVIORECEPCIONDOC ' +
                                   'SET EC_USUALTAEXTRAVIADO = :Usuario, ' +
                                       'EC_FECHAALTAEXTRAVIADO = SYSDATE ' +
                                 'WHERE EC_ID = :Id';
                        EjecutarSqlSTEx(sSql, [Sesion.UserId, sdqConsulta.FieldByName('EC_ID').AsInteger]);
                      end
                    else
                      begin
                        sSql := 'UPDATE REC_ENVIORECEPCIONDOC ' +
                                   'SET EC_USUALTAEXTRAVIADO = NULL, ' +
                                       'EC_FECHAALTAEXTRAVIADO = NULL ' +
                                 'WHERE EC_ID = :Id';
                        EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('EC_ID').AsInteger]);
                      end;
                  end;

               CommitTrans;
               MsgBox('Registros procesados correctamente.', MB_ICONINFORMATION);
               RefreshData;
            except
              on E:Exception do
                begin
                  Rollback;
                  Raise Exception.Create(E.Message + CRLF + 'Error al procesar el ' + sMarcado + ' los registros.');
                end;
            end;
          end;
      finally
        sdqConsulta.EnableControls;
      end;
    end;
end;

procedure TfrmEnviosRecepcionDoc.GridGetCellProps(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;

  if IsBaja() then
    AFont.Color := clRed
  else if IsExtraviado() then
    AFont.Color := clMaroon;
end;

procedure TfrmEnviosRecepcionDoc.tbEnviarMailDocClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla');

  DoEnviarMailsDocumentacion;
end;

function TfrmEnviosRecepcionDoc.DoValidarYCargarDocumentacionSeleccionada: Boolean;
var
 i: Integer;
 sSql: String;
begin
  Do_LimpiarTablaTemporal('TMP.TEC_ENVIORECEPCIONDOC', 'EC_USUARIO', Sesion.Userid);

  sdqConsulta.DisableControls;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'Para alguno de los documentos seleccionados, el mismo se encuentra dado de baja.');
        Verificar(not sdqConsulta.FieldByName('EC_FECHARECEPCION').IsNull, nil, 'Para alguno de los documentos seleccionados, está cargada la fecha de recepción.');

        sSql := 'INSERT INTO TMP.TEC_ENVIORECEPCIONDOC(EC_USUARIO, EC_IDENVIORECEPCIONDOC) ' +
                     'VALUES(:UserId, :Id)';
        EjecutarSqlEx(sSql, [Sesion.Userid, sdqConsulta.FieldByName('EC_ID').AsInteger]);
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;

procedure TfrmEnviosRecepcionDoc.DoEnviarMailsDocumentacion;
var
  sAsunto, sCuerpo, sSql, sTempFile: string;
  qryDocumentos: TSDQuery;
begin
  if MsgBox( '¿Confirma el envío de mails a los usuarios, por los documentos seleccionados?', MB_ICONQUESTION+MB_YESNO ) = ID_YES then
    begin
      IniciarEspera('Preparando documentos...');
      try
        DoValidarYCargarDocumentacionSeleccionada;

        IniciarEspera('Enviando correo...');
        try
          sSql := 'SELECT SE_MAIL MAIL, SE_USUARIO USUARIO, SE_NOMBRE USUNOMBRE ' +
                    'FROM USE_USUARIOS ' +
                   'WHERE SE_USUARIO IN ' +
                          '(SELECT DISTINCT REC.EC_USUARIO ' +
                             'FROM TMP.TEC_ENVIORECEPCIONDOC TMPREC, REC_ENVIORECEPCIONDOC REC ' +
                            'WHERE TMPREC.EC_USUARIO = :Usuario ' +
                              'AND TMPREC.EC_IDENVIORECEPCIONDOC = REC.EC_ID) ' +
                     'AND SE_FECHABAJA IS NULL ' +
                     'AND SE_MAIL IS NOT NULL ' +
                'ORDER BY SE_MAIL';

          with GetQueryEx(sSql, [Sesion.UserId]) do
            try
              VALOR_PARAMETRO_CORREO_DOCUMENTACION := get_ParametrobyId(PARAMETRO_CORREO_DOCUMENTACION);

              sAsunto := '[Documentación] Solicitud de Documentación Pendiente de Entrega';
              sCuerpo := 'Solicitamos la entrega de la documentación enviada oportunamente.' + CRLF + 'Se ha adjuntado el archivo con dicha documentación.';

              while not EOF do
                begin
                  sSql := 'SELECT TA_DESCRIPCION "Tipo Archivo", DECODE(REC.EC_IDARCHIVO, NULL, NULL, ARCHIVO.GETDESCRIPCIONCLAVE(TC_ID, AR_CLAVE)) "Clave", ' +
                                 'REC.EC_CAJA "Caja", TD_DESCRIPCION "Documento", REC.EC_HOJAS "Cant. Hojas", ' +
                                 'REC.EC_IDLOTE "Lote", REC.EC_FECHAENTREGA "F. Entrega", REC.EC_REMITO "Remito Usuario", ' +
                                 'REC.EC_OBSERVACIONES "Observaciones" ' +
                            'FROM RTC_TIPOCLAVE, RAR_ARCHIVO, RTD_TIPODOCUMENTO, RTA_TIPOARCHIVO, TMP.TEC_ENVIORECEPCIONDOC TMPREC, REC_ENVIORECEPCIONDOC REC ' +
                           'WHERE REC.EC_TIPOARCHIVO = TA_ID(+) ' +
                             'AND REC.EC_IDTIPODOCUMENTO = TD_ID(+) ' +
                             'AND EC_IDARCHIVO = AR_ID(+) ' +
                             'AND TA_FORMULARIO = TC_CLAVE(+) ' +
                             'AND REC.EC_FECHABAJA IS NULL ' +
                             'AND TMPREC.EC_USUARIO = :Usuario ' +
                             'AND TMPREC.EC_IDENVIORECEPCIONDOC = REC.EC_ID ' +
                             'AND REC.EC_USUARIO = :UsuarioDoc ' +
                        'ORDER BY TA_DESCRIPCION, TD_DESCRIPCION';

                  qryDocumentos := GetQueryEx( sSql, [Sesion.UserId, FieldByName('USUARIO').AsString] );
                  try
                    if not qryDocumentos.Eof then
                      begin
                        sTempFile := GetTempFromFileName('Documentos.xls');

                        with TDataToXLS.Create(nil) do
                          try
                            Title.Text := 'Documentación del usuario: ' + FieldByName('USUNOMBRE').AsString;
                            DataSet := qryDocumentos;
                            SaveToFile( sTempFile );
                          finally
                            Free;
                          end;

                        SendByMailServer(FieldByName('MAIL').AsString,
                           Sesion.UserId, sAsunto, sTempFile,
                           sCuerpo, False, False, False, Sesion.UserId, True);

                        SendByMailServer(VALOR_PARAMETRO_CORREO_DOCUMENTACION,
                           Sesion.UserId, sAsunto, sTempFile,
                           sCuerpo, False, True, False, Sesion.UserId, True);
                      end;
                  finally
                    qryDocumentos.free;
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

procedure TfrmEnviosRecepcionDoc.CalcularFilasSel;
begin
  edCantSelecc.Value := Grid.SelectedRows.Count;
end;

procedure TfrmEnviosRecepcionDoc.InicializarContadores;
begin
  edCantSelecc.Value := 0;
end;

procedure TfrmEnviosRecepcionDoc.tbOrdenarClick(Sender: TObject);
begin
  inherited;
  CalcularFilasSel;
end;

procedure TfrmEnviosRecepcionDoc.GridCellClick(Column: TColumn);
begin
  inherited;
  CalcularFilasSel;
end;

procedure TfrmEnviosRecepcionDoc.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  CalcularFilasSel;
end;

function TfrmEnviosRecepcionDoc.GetObservacionesErrorUsuario(Clave, Documento, Caja, Observaciones, Remito: String): String;
var
  sDescr: String;
begin
  Result := Observaciones;
  sDescr := '';

  if not IsEmptyString(Clave) then
    sDescr := sDescr + 'Clave Carpeta: ' + Clave + ' - ';

  if not IsEmptyString(Documento) then
    sDescr := sDescr + 'Cód. Doc.: ' + Documento + ' - ';

  if not IsEmptyString(Remito) then
    sDescr := sDescr + 'Remito: ' + Remito + ' - ';

  if not IsEmptyString(Caja) then
    sDescr := sDescr + 'Caja: ' + Caja + ' - ';

  if not IsEmptyString(sDescr) then
    Result := Trim(Result + ' (' + CutRight(sDescr, 3) + ')');
end;

procedure TfrmEnviosRecepcionDoc.DoGenerarEroresUsuarios;
var
  sObserv, sSql: String;
  qry: TSDQuery;
  aSql: TSql;
begin
  sSql := 'SELECT REC.EC_USUARIO USUARIO, AR_CLAVE CLAVE, TD_CODIGO CODDOCUMENTO, REC.EC_IDLOTE LOTE, ' +
                 'REC.EC_CODERROR CODERROR, REC.EC_CAJA CAJA, REC.EC_OBSERVACIONES OBSERVACIONES, ' +
                 'REC.EC_REMITO REMITO ' +
            'FROM RAR_ARCHIVO, RTD_TIPODOCUMENTO, RTA_TIPOARCHIVO, TMP.TEC_ENVIORECEPCIONDOC TMPREC, ' +
                 'REC_ENVIORECEPCIONDOC REC ' +
           'WHERE EC_TIPOARCHIVO = TA_ID(+) ' +
             'AND EC_IDTIPODOCUMENTO = TD_ID(+) ' +
             'AND EC_IDARCHIVO = AR_ID(+) ' +
             'AND EC_FECHABAJA IS NULL ' +
             'AND TMPREC.EC_USUARIO = :Usuario ' +
             'AND TMPREC.EC_IDENVIORECEPCIONDOC = REC.EC_ID ' +
             'AND REC.EC_CODERROR IS NOT NULL ' +
        'ORDER BY EC_ID';
  qry := GetQueryEx(sSql, [Sesion.UserId]);

  with qry do
    try
      if Eof then
        MsgBox('No se han encontrado registros a traspasar al Seguimiento de Errores de Usuarios.', MB_ICONINFORMATION)
      else
        begin
          aSql := TSql.Create('REU_ERRORUSUARIO');
          try
            BeginTrans;
            try
              while not Eof do
                begin
                  with aSql do
                    begin
                      Clear;

                      sObserv := GetObservacionesErrorUsuario(FieldByName('CLAVE').AsString, FieldByName('CODDOCUMENTO').AsString, FieldByName('CAJA').AsString, FieldByName('OBSERVACIONES').AsString, FieldByName('REMITO').AsString);

                      PrimaryKey.AddExpression('EU_ID',  'SEQ_REU_ID.NEXTVAL');
                      Fields.Add('EU_FECHAALTA',         exDateTime);
                      Fields.Add('EU_USUALTA',           Sesion.UserID);
                      Fields.Add('EU_USUARIO',           FieldByName('USUARIO').AsString);
                      Fields.Add('EU_CODERROR',          FieldByName('CODERROR').AsString);

                      if not FieldByName('LOTE').IsNull then
                        Fields.Add('EU_LOTE',            FieldByName('LOTE').AsInteger);
                        
                      Fields.Add('EU_CANTERRORES',       1);
                      Fields.Add('EU_OBSERVACIONES',     sObserv);

                      SqlType := stInsert;
                      EjecutarSqlST(Sql);
                    end;

                  Next;
                end;

              CommitTrans;
              MsgBox('Registros traspasados correctamente al Seguimiento de Errores de Usuarios.', MB_ICONINFORMATION);
            except
              on E:Exception do
                begin
                  Rollback;
                  Raise Exception.Create(E.Message + CRLF + 'Error al traspasar registros al seguimiento de errores de usuarios.');
                end;
            end;
          finally
            aSql.Free;
          end;
        end;
    finally
      Free;
    end;
end;

function TfrmEnviosRecepcionDoc.VerificarRemitosAdmin: Boolean;
var
 i: Integer;
begin
  sdqConsulta.DisableControls;
  try
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        Verificar(not sdqConsulta.FieldByName('EC_REMITOADMIN').IsNull, nil, 'Uno de los registros tiene un remito a la administradora generado.');
        Verificar(sdqConsulta.FieldByName('EC_REMITO').IsNull, nil, 'Uno de los registros no tiene un remito al usuario generado.');
        Verificar(sdqConsulta.FieldByName('EC_FECHAENTREGA').IsNull, nil, 'Uno de los registros no ha sido entregado al usuario.');
        Verificar(not sdqConsulta.FieldByName('FECHABAJA').IsNull, nil, 'Uno de los registros se encuentra dado de baja.');
        Verificar(not sdqConsulta.FieldByName('FECHAALTAEXTRAVIADO').IsNull, nil, 'Uno de los registros se encuentra extraviado.');
      end;
  finally
    sdqConsulta.EnableControls;
  end;

  Result := True;
end;

procedure TfrmEnviosRecepcionDoc.ImprimirRemitoAdmin(Remito: Integer);
begin
  with TqrRemitoAdminEnvioRecepcionDoc.Create(Self) do
    try
      ImprimirRemitoAdmin(Remito);
    finally
      Free;
    end;
end;

function TfrmEnviosRecepcionDoc.GenerarRemitosGrillaAdmin: Boolean;
var
  sSql: String;
  Remito: TTableId;
  i: Integer;
begin
  BeginTrans;
  try
    sdqConsulta.DisableControls;
    try
      Remito := GetSecNextVal('SEQ_REC_REMITOADMIN_ID');

      for i := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

          sSql := 'UPDATE REC_ENVIORECEPCIONDOC ' +
                     'SET EC_REMITOADMIN = :Remito, ' +
                         'EC_SEQ_REMITOADMIN = :Sec, ' +
                         'EC_FECHAIMPRESIONADMIN = SYSDATE, ' +
                         'EC_USUIMPRESIONADMIN = :Usuario ' +
                   'WHERE EC_ID = :Id';

          EjecutarSqlSTEx(sSql, [Remito, i, Sesion.UserId, sdqConsulta.FieldByName('EC_ID').AsInteger]);
        end;

        ImprimirRemitoAdmin(Remito);

        CommitTrans;
        Result := True;
    finally
      sdqConsulta.EnableControls;
    end;
  except
    on E : exception do
    begin
      Rollback;
      Raise Exception.Create('Se produjo un error al intentar generar el remito a la administradora.' + CRLF + E.Message);
    end;
  end;
end;

procedure TfrmEnviosRecepcionDoc.mnuAdminGenerarRemitoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla');

  if VerificarRemitosAdmin() then
    if GenerarRemitosGrillaAdmin() then
      RefreshData;
end;

procedure TfrmEnviosRecepcionDoc.edRemitoAdminDesdeExit(Sender: TObject);
begin
  if not edRemitoAdminDesde.IsEmpty and edRemitoAdminHasta.IsEmpty then
    edRemitoAdminHasta.Value := edRemitoAdminDesde.Value;
end;

procedure TfrmEnviosRecepcionDoc.mnuAdminUsuImprimirRemitoClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, Grid, 'No existen registros seleccionados en la grilla');
  Verificar(Grid.SelectedRows.Count > 1, Grid, 'Seleccione solo un registro en la grilla que contenga el remito que quiere imprimir.');
  Verificar(sdqConsulta.FieldByName('EC_REMITOADMIN').IsNull, Grid, 'El remito no ha sido generado.');

  ImprimirRemitoAdmin(sdqConsulta.FieldByName('EC_REMITOADMIN').AsInteger);
end;

end.

