unit unManAsigPrestaFijo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit,
  unfraPrestadorAMP, Buttons, unFraCodigoDescripcion, unFraEstablecimiento,
  unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, JvgGroupBox,
  JvExExtCtrls, JvNetscapeSplitter;

type
  TfrmManAsigPrestaFijo = class(TfrmCustomGridABM)
    Label2: TLabel;
    fraPrestadores: TfraPrestadorAMP;
    pnlDescrip: TPanel;
    Label3: TLabel;
    edDescrip: TMemo;
    updHAP: TSDUpdateSQL;
    updHAE: TSDUpdateSQL;
    pnlEmpresa: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    fraEmpresaFiltro: TfraEmpresa;
    fraEstablecimientoFiltro: TfraEstablecimiento;
    sdqPrestadores: TSDQuery;
    dsPrestadores: TDataSource;
    gbTrabajadores: TJvgGroupBox;
    JvNetscapeSplitter1: TJvNetscapeSplitter;
    pnlChecks: TPanel;
    chkVerBajas: TCheckBox;
    dbgPrestadores: TArtDBGrid;
    pnlEEP: TPanel;
    fraEstablecimientoABM: TfraEstablecimiento;
    Label8: TLabel;
    Label9: TLabel;
    fraEmpresaABM: TfraEmpresa;
    dbgPrestadoresABM: TArtDBGrid;
    Label5: TLabel;
    btnPresAgregar: TBitBtn;
    btnPresQuitar: TBitBtn;
    pnlVigencia: TPanel;
    Label7: TLabel;
    Label6: TLabel;
    edVigenciaHasta: TDateEdit;
    edVigenciaDesde: TDateEdit;
    chkEstabTodos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPresAgregarClick(Sender: TObject);
    procedure btnPresQuitarClick(Sender: TObject);
    procedure chkEstabTodosClick(Sender: TObject);
    procedure dbgPrestadoresABMGetCellParams(Sender: TObject; Field: TField; AFont:
        TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgPrestadoresGetCellParams(Sender: TObject; Field: TField; AFont:
        TFont; var Background: TColor; Highlight: Boolean);
    procedure edVigenciaDesdeExit(Sender: TObject);
    procedure edVigenciaHastaExit(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure fraEmpresaABMExit(Sender: TObject);
    procedure fraEmpresaFiltroExit(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure sdqPrestadoresAfterScroll(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
  private
    procedure AplicarCambiosHAE;
    procedure AplicarCambiosHAP;
    procedure LockControles(const Habilitar: Boolean);
    function ValidarDatos: Boolean;
    function ValidarDatosLogica: boolean;
    function ValidarFechasVigencia: Boolean;
  protected
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
  public
    { Public declarations }
  end;

var
  frmManAsigPrestaFijo: TfrmManAsigPrestaFijo;

implementation

uses
  General, DateTimeFuncs, unSesion, CustomDlgs, VCLExtra, AnsiSql,
  DateUtils, undmPrincipal, unCustomConsulta, StrUtils;

{$R *.dfm}

procedure TfrmManAsigPrestaFijo.FormCreate(Sender: TObject);
begin
  inherited;
  sdqConsulta.Close;
  FieldBaja := 'AE_FECHABAJA';
end;

procedure TfrmManAsigPrestaFijo.AplicarCambiosHAE;
begin
  if ModoABM = maAlta then
    sdqConsulta.AppendRecord(
        [ 0,
          fraEmpresaABM.Contrato,
          IIF(chkEstabTodos.Checked, Null, fraEstablecimientoABM.NroEstablecimiento),
          edDescrip.Text,
          IIF(chkEstabTodos.Checked, 'S', 'N'),
          Date,
          Sesion.UserID,
          Null,
          Null,
          Null,
          Null,
          IIF(chkEstabTodos.Checked, Null, fraEstablecimientoABM.ID)
          ])
  else
  begin
    with sdqConsulta do
    begin
      Edit;
      if ModoABM = maModificacion then
      begin
        FieldByName('AE_NROESTABLECI').AsVariant :=
            IIF(fraEstablecimientoABM.IsSelected, fraEstablecimientoABM.NroEstablecimiento, Null);
        FieldByName('AE_DESCRIPCIONASIG').AsString := edDescrip.Text;
        FieldByName('AE_TODOSLOSESTAB').AsString := IIF(chkEstabTodos.Checked, 'S', 'N');
        FieldByName('AE_FECHAMODIF').AsDateTime := Date;
        FieldByName('AE_USUMODIF').AsString := Sesion.UserID;
        FieldByName('AE_FECHABAJA').AsVariant := Null;
        FieldByName('AE_USUBAJA').AsVariant := Null;
        FieldByName('AE_IDESTAB').AsVariant :=
            Iif(chkEstabTodos.Checked, Null, fraEstablecimientoABM.ID);
      end else
      begin
        FieldByName('AE_FECHABAJA').AsDateTime := Date;
        FieldByName('AE_USUBAJA').AsString := Sesion.UserID;
      end;
      Post;
    end;
  end;

  if sdqConsulta.UpdatesPending then
    sdqConsulta.ApplyUpdates;

end;

procedure TfrmManAsigPrestaFijo.AplicarCambiosHAP;
begin

  if sdqPrestadores.UpdatesPending then
    sdqPrestadores.ApplyUpdates;
end;

procedure TfrmManAsigPrestaFijo.btnAceptarClick(Sender: TObject);
begin
  if Validar then
  begin
    DoABM;
    fpAbm.Close;
    tbRefrescar.Click;
  end;
end;

procedure TfrmManAsigPrestaFijo.btnCancelarClick(Sender: TObject);
begin
  if sdqConsulta.UpdatesPending then
    sdqConsulta.CancelUpdates;

  if sdqPrestadores.UpdatesPending then
    sdqPrestadores.CancelUpdates;
end;

procedure TfrmManAsigPrestaFijo.btnPresAgregarClick(Sender: TObject);
var
  idPrestador: integer;
  hae_id: integer;
begin
  if not fraPrestadores.IsSelected then Exit;
  if not sdqPrestadores.Active then sdqPrestadores.Active := True;

  idPrestador := fraPrestadores.edCodigo.Value;
  hae_id := ValorSql( 'SELECT  TO_CHAR (last_number) last_number '
                    + '  FROM  sys.all_sequences '
                    + ' WHERE  sequence_name = ''SEQ_ASIGESTABLECIMIENTO_ID'' ');

  if ModoABM = maAlta then
  begin
    if not sdqPrestadores.Locate('AP_IDPRESTADOR', idPrestador, []) then
    begin
      sdqPrestadores.AppendRecord(
          [ fraPrestadores.cmbDescripcion.Text,
            Null,
            hae_id,
            idPrestador,
            IIF(edVigenciaDesde.Date = 0, Null, edVigenciaDesde.Date),
            IIF(edVigenciaHasta.Date = 0, Null, edVigenciaHasta.Date),
            Date,
            Sesion.UserID
          ]);
      edVigenciaDesde.Clear;
      edVigenciaHasta.Clear;
    end;
  end else
  begin
    if sdqPrestadores.Locate(
          'AP_IDPRESTADOR; AP_IDASIGNACIONESTAB',
          VarArrayOf([idPrestador, sdqConsulta.FieldByName('AE_ID').AsInteger]), []) then
    begin
      sdqPrestadores.Edit;
      sdqPrestadores.FieldByName('AP_VIGENCIADESDE').AsVariant :=
          IIF(edVigenciaDesde.Date > 0, edVigenciaDesde.Date, Null);
      sdqPrestadores.FieldByName('AP_VIGENCIAHASTA').AsVariant :=
          IIF(edVigenciaHasta.Date > 0, edVigenciaHasta.Date, Null);
      sdqPrestadores.FieldByName('AP_FECHAMODIF').AsDateTime := Date;
      sdqPrestadores.FieldByName('AP_USUMODIF').AsString := Sesion.UserID;
      sdqPrestadores.FieldByName('AP_FECHABAJA').AsVariant := Null;
      sdqPrestadores.FieldByName('AP_USUBAJA').AsVariant := Null;
      sdqPrestadores.Post;
    end else
    begin
      sdqPrestadores.AppendRecord(
          [ fraPrestadores.cmbDescripcion.Text,
            Null,
            sdqConsulta.FieldByName('AE_ID').AsInteger,
            idPrestador,
            Null,
            Null,
            Date,
            Sesion.UserID
          ]);
      edVigenciaDesde.Clear;
      edVigenciaHasta.Clear;
    end;
  end;
end;

procedure TfrmManAsigPrestaFijo.btnPresQuitarClick(Sender: TObject);
begin
  if not sdqPrestadores.IsEmpty then
  begin
    sdqPrestadores.Edit;
    sdqPrestadores.FieldByName('AP_FECHABAJA').AsDateTime := Date;
    sdqPrestadores.FieldByName('AP_USUBAJA').AsDateTime := Date;
    sdqPrestadores.Post;
    fraPrestadores.Cargar(sdqPrestadores.FieldByName('AP_IDPRESTADOR').AsString);
  end;
end;

procedure TfrmManAsigPrestaFijo.LockControles(const Habilitar: Boolean);
begin
  VCLExtra.LockControls(
      [ fraEmpresaABM,
        fraEstablecimientoABM,
        edVigenciaDesde,
        edVigenciaHasta,
        edDescrip,
        fraPrestadores.edCodigo,
        fraPrestadores.cmbDescripcion,
        btnPresAgregar,
        btnPresQuitar,
        dbgPrestadoresABM],
        Habilitar
  );

end;

procedure TfrmManAsigPrestaFijo.chkEstabTodosClick(Sender: TObject);
begin
  LockControl(fraEstablecimientoABM, chkEstabTodos.Checked);
  LockControl(Grid, chkEstabTodos.Checked);

  if chkEstabTodos.Checked then
    fraEstablecimientoABM.Clear

end;

procedure TfrmManAsigPrestaFijo.edVigenciaDesdeExit(Sender: TObject);
begin
  if not sdqPrestadores.IsEmpty then
  begin
    sdqPrestadores.Edit;
      sdqPrestadores.FieldByName('AP_VIGENCIADESDE').AsVariant :=
          IIF(edVigenciaDesde.Date > 0, edVigenciaDesde.Date, Null);
      sdqPrestadores.FieldByName('AP_VIGENCIAHASTA').AsVariant :=
          IIF(edVigenciaHasta.Date > 0, edVigenciaHasta.Date, Null);
    sdqPrestadores.Post;
  end;
end;

procedure TfrmManAsigPrestaFijo.edVigenciaHastaExit(Sender: TObject);
begin
  Verificar(
      (edVigenciaDesde.Date > edVigenciaHasta.Date) and (edVigenciaHasta.Date > 0),
      edVigenciaHasta,
      'La fecha de Vigencia Hasta es menor a la de Vigencia Desde'
  );
  edVigenciaDesde.OnExit(Sender);
end;

function TfrmManAsigPrestaFijo.ValidarDatosLogica: boolean;
var
  sWhere, sMens: string;
begin
  Result := False;

  if (not chkEstabTodos.Checked) and (fraEstablecimientoABM.IsEmpty) then
  begin
    sMens :=
        Format('No se ha especificado establecimiento. ' +
            '¿Desea dar de alta el registro para todos los establecimientos del contrato: %d ?',
             [fraEmpresaABM.Contrato]) ;

    if (MessageBox(0, PChar(sMens), PChar(Self.Caption), MB_ICONQUESTION or MB_YESNO or MB_APPLMODAL) = ID_NO) then
    begin
      fraEstablecimientoABM.edCodigo.SetFocus;
      Exit;
    end else
      chkEstabTodos.Checked := True;
  end;

  if chkEstabTodos.Checked then
  begin
    if (ExisteSql(
            '  SELECT  hae.ae_contrato '
          + '    FROM  hys.hae_asigestablecimiento hae '
          + '   WHERE  hae.ae_contrato = ' + IntToStr(fraEmpresaABM.Contrato)
          +            IIF(ModoABM = maModificacion,
                            ' AND  hae.ae_id <>  ' + sdqConsulta.FieldByName('AE_ID').AsString,
                            '')
          + '     AND  hae.ae_fechabaja IS NULL ')) then
    begin
      sMens := 'Registros para establecimientos en particular o registro que asigna a todos '
             + 'los establecimientos, preexistente(s). ';
      MessageBox(0, PChar(sMens), PChar(Self.Caption), MB_ICONSTOP or MB_OK or MB_APPLMODAL);
      sdqPrestadores.Filtered := False;
      Exit;
    end;
  end else
  begin
    if ModoABM = maAlta then
      sWhere :=
           '( ( ae_contrato = ' + IntToStr(fraEmpresaABM.Contrato)
         + '    AND ae_nroestableci = ' + IntToStr(fraEstablecimientoABM.NroEstablecimiento) + ')'
         + '  OR (ae_contrato = ' + IntToStr(fraEmpresaABM.Contrato)
         + '      AND AE_TODOSLOSESTAB = ''S'' ) )'
         + ' AND (ae_fechabaja IS NULL) '
    else
      sWhere :=
           '( ( ae_contrato = ' + IntToStr(fraEmpresaABM.Contrato)
         + '    AND ae_id <> ' + sdqConsulta.FieldByName('AE_ID').AsString
         + '    AND ae_nroestableci = ' + IntToStr(fraEstablecimientoABM.NroEstablecimiento) + ')'
         + '   OR (ae_contrato = ' + IntToStr(fraEmpresaABM.Contrato)
         + '       AND ae_todoslosestab = ''S'' '
         + '       AND ae_id <> ' + sdqConsulta.FieldByName('AE_ID').AsString + ') )'
         + ' AND (ae_fechabaja IS NULL) ' ;



    if ExisteSql(
         'SELECT 1 FROM hys.hae_asigestablecimiento  WHERE ' + sWhere) then
    begin
      sMens :=
          Format('Ya existe un registro para el Contrato: %d Establecimiento: %d, '
              +' o bien existe registro que asigna a todos los establecimientos para ese contrato.',
              [fraEmpresaABM.Contrato, fraEstablecimientoABM.NroEstablecimiento]);
      MessageBox(0, PChar(sMens), PChar(Self.Caption), MB_ICONSTOP or MB_OK or MB_APPLMODAL);
      Exit;
    end;
  end;

  sdqPrestadores.Filtered := False;
  Result := True;
end;

function TfrmManAsigPrestaFijo.ValidarDatos: Boolean;
begin
  Result := VerificarMultiple(
    [ 'Error de validación de datos.',
      fraEmpresaABM,
      not fraEmpresaABM.IsEmpty,
      'Dato Empresa debe ser completado.',
      edDescrip,
      not ((sdqPrestadores.IsEmpty) and (edDescrip.Text = EmptyStr)),
      'Se debe asignar por lo menos un prestador ó una descripción.'
//      edVigenciaDesde,
//      (not (edVigenciaDesde.Date = 0)) and (not ),
//      'Dato Fecha Desde debe ser completado.'
      ]);
end;

function TfrmManAsigPrestaFijo.ValidarFechasVigencia: Boolean;
begin
  Result := False;
  if sdqPrestadores.Locate(
      'AP_VIGENCIADESDE;AP_FECHABAJA', VarArrayOf([Null, Null]), []) then
  begin
    InvalidMsg(
        edVigenciaDesde,
        'Falta cargar la fecha a partir de la cual entra en vigencia para éste registro.'
    );
    Exit;
  end;
  Result := True;

end;

function TfrmManAsigPrestaFijo.Validar: Boolean;
begin

  Result := ValidarDatosLogica;

  if Result then
    Result := ValidarFechasVigencia;

  if Result then
    Result := ValidarDatos;

end;

procedure TfrmManAsigPrestaFijo.ClearControls;
begin
  fraEmpresaABM.Clear;
  fraEstablecimientoABM.Clear;
  edVigenciaDesde.Clear;
  edVigenciaHasta.Clear;
  edDescrip.Text := EmptyStr;
  fraPrestadores.Limpiar;
  chkEstabTodos.Checked := False;
end;

procedure TfrmManAsigPrestaFijo.dbgPrestadoresABMGetCellParams(Sender: TObject;
    Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not sdqPrestadores.FieldByName('AP_FECHABAJA').IsNull) then
      AFont.Color := clRed;
end;

procedure TfrmManAsigPrestaFijo.dbgPrestadoresGetCellParams(Sender: TObject;
    Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not sdqPrestadores.FieldByName('AP_FECHABAJA').IsNull) then
      AFont.Color := clRed;

end;

procedure TfrmManAsigPrestaFijo.LoadControls;
var
  sSQL: string;
begin
  ClearControls;
  fraEmpresaABM.Contrato := sdqConsulta.FieldByName('AE_CONTRATO').AsInteger;
  fraEstablecimientoABM.IdEmpresa := fraEmpresaABM.ID;
  fraEstablecimientoABM.Reload;
  if sdqConsulta.FieldByName('AE_TODOSLOSESTAB').AsString = 'S' then
    chkEstabTodos.Checked := True
  else
  begin
    chkEstabTodos.Checked := False;
    fraEstablecimientoABM.Contrato := fraEmpresaABM.Contrato;
    fraEstablecimientoABM.Codigo := sdqConsulta.FieldByName('AE_NROESTABLECI').AsString;
  end;

  sdqPrestadores.Close;

  sSQL := 'SELECT  cpr.ca_descripcion, hap.* '
        + '  FROM  hys.hap_asigprestadores hap, '
        + '        art.cpr_prestador cpr '
        + ' WHERE  hap.ap_idprestador = cpr.ca_identificador AND ap_idasignacionestab = :id_hae '
        ;

  sdqPrestadores  .SQL.Text := sSQL;
  sdqPrestadores.ParamByName('ID_HAE').Value := sdqConsulta.FieldByName('AE_ID').AsInteger;
  sdqPrestadores.Open;

  edDescrip.Text := sdqConsulta.FieldByName('AE_DESCRIPCIONASIG').AsString;

end;

procedure TfrmManAsigPrestaFijo.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresaFiltro.Clear;
  fraEstablecimientoFiltro.Clear;
  sdqPrestadores.Close;
end;

function TfrmManAsigPrestaFijo.DoABM: Boolean;
begin
  Result := False;
  LockControles(True);
  BeginTrans;
  try
    AplicarCambiosHAE;
    AplicarCambiosHAP;
    CommitTrans;
    Result := True;
  except
    on E: Exception do begin
      Rollback;
      ErrorMsg(E);
    end;
  end;

end;

procedure TfrmManAsigPrestaFijo.fpAbmBeforeShow(Sender: TObject);
begin
  LockControles(False);
  LockControl(fraEstablecimientoABM, chkEstabTodos.Checked);
  LockControl(fraEmpresaABM, ModoABM = maModificacion);
end;

procedure TfrmManAsigPrestaFijo.fraEmpresaABMExit(Sender: TObject);
begin
  fraEstablecimientoABM.IdEmpresa := fraEmpresaABM.ID;
  fraEstablecimientoABM.Contrato := fraEmpresaABM.Contrato;
  fraEstablecimientoABM.Reload;
  LockControls([fraEstablecimientoABM, Grid, dbgPrestadores], chkEstabTodos.Checked);
end;

procedure TfrmManAsigPrestaFijo.fraEmpresaFiltroExit(Sender: TObject);
begin
  fraEmpresaFiltro.FrameExit(Sender);
  fraEstablecimientoFiltro.IdEmpresa := fraEmpresaFiltro.ID;
end;

procedure TfrmManAsigPrestaFijo.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  sdqPrestadores.Close;
  sdqPrestadores.ParamByName('id_hae').AsInteger := sdqConsulta.FieldByName('AE_ID').AsInteger;
  sdqPrestadores.Open;
end;

procedure TfrmManAsigPrestaFijo.sdqPrestadoresAfterScroll(DataSet: TDataSet);
begin

  if not sdqPrestadores.IsEmpty then
  begin
    fraPrestadores.Cargar(sdqPrestadores.FieldByName('AP_IDPRESTADOR').AsString);
    edVigenciaDesde.Date := sdqPrestadores.FieldByName('AP_VIGENCIADESDE').AsDateTime;
    edVigenciaHasta.Date := sdqPrestadores.FieldByName('AP_VIGENCIAHASTA').AsDateTime;
  end;

end;

procedure TfrmManAsigPrestaFijo.tbEliminarClick(Sender: TObject);
begin
  inherited;
  if ModoABM = maBaja then
  begin
    EjecutarSqlEx(
        'UPDATE  hys.hap_asigprestadores '
      + '   SET  ap_fechabaja  = :date, '
      + '        ap_usubaja    = :usuario '
      + ' WHERE  ap_idasignacionestab = :idasignacionestab ',
        [TDateTimeEx.Create(Date), Sesion.UserID, sdqConsulta.FieldByName('AE_ID').AsInteger]
    );
    sdqPrestadores.Close;
    sdqPrestadores.Open;
  end;
  ModoABM := maNone;
end;

procedure TfrmManAsigPrestaFijo.tbModificarClick(Sender: TObject);
begin

  if ExisteSqlEx(
          'SELECT  1 '
        + '  FROM  hys.hae_asigestablecimiento '
        + ' WHERE  (ae_contrato = :contrato AND  ae_todoslosestab = ''S'') '
        + '   AND  (ae_fechabaja IS NULL) '
        + '   AND  (ae_id <> :ae_id)',
        [sdqConsulta.FieldByName('AE_CONTRATO').AsInteger,
         sdqConsulta.FieldByName('AE_ID').AsInteger]) then
    MessageBox(0,
        PChar(Format('Edición no permitida. Existe para el contrato %s '
            + ' un registro con asignación a todos los establecimientos.',
              [sdqConsulta.FieldByName('AE_CONTRATO').AsString])),
        PChar(Self.Caption), MB_ICONWARNING or MB_OK or MB_APPLMODAL)
  else
    inherited;

end;

procedure TfrmManAsigPrestaFijo.tbNuevoClick(Sender: TObject);
begin
  sdqPrestadores.Close;
  sdqPrestadores.ParamByName('id_hae').AsInteger := 0;
  sdqPrestadores.Open;
  inherited;
end;

procedure TfrmManAsigPrestaFijo.tbRefrescarClick(Sender: TObject);
var
  sSQL, sWhere: string;
  bkm: TBookmark;
begin
  bkm := sdqConsulta.GetBookmark;
  sdqConsulta.Close;

  if fraEmpresaFiltro.IsSelected then
    sWhere := ' AND ae_contrato = ' + IntToStr(fraEmpresaFiltro.Contrato);

  if (fraEstablecimientoFiltro.IsSelected) and (not chkEstabTodos.Checked) then
    sWhere := sWhere +' AND AE_NROESTABLECI = ' + IntToStr(fraEstablecimientoFiltro.NroEstablecimiento);

  if not chkVerBajas.Checked then
    sWhere := sWhere + ' AND ae_fechabaja IS NULL ';

    sSQL := '  SELECT  hae.*, '
          + '          CASE WHEN aes.es_id IS NULL THEN ''TODOS'' ELSE aes.es_nombre END AS nombreestab '
          + '    FROM  hys.hae_asigestablecimiento hae, '
          + '          afi.aes_establecimiento aes '
          + '   WHERE  1 = 1 AND hae.ae_idestab = aes.es_id(+) ' + sWhere + ' ' 
          + 'ORDER BY  ae_contrato, '
          + '          ae_nroestableci '
          ;

  sdqConsulta.SQL.Text := sSQL;
  sdqConsulta.Open;

  if sdqConsulta.IsEmpty then
    sdqPrestadores.Close
  else
  begin
    sdqPrestadores.Close;
    sdqPrestadores.ParamByName('id_hae').AsInteger := sdqConsulta.FieldByName('AE_ID').AsInteger;
    sdqPrestadores.Open;
  end;

  if not chkVerBajas.Checked then
  begin
    sdqPrestadores.Filter := 'AP_FECHABAJA = NULL';
    sdqPrestadores.Filtered := True;
  end else
    sdqPrestadores.Filtered := False;

  inherited;
  if not sdqConsulta.IsEmpty then
    sdqConsulta.GotoBookmark(bkm);
end;


end.
