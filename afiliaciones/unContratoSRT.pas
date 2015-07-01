unit unContratoSRT;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion, unFraActividad, Mask,
  ToolEdit, DateComboBox, HotKeyControl, IntEdit, unfraCtbTablas, unArtDbFrame, ShortCutControl, unART, QueryPrint,
  unArtDBAwareFrame;

type
  TfrmContratoSRT = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbImprimir: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ArtDBGrid: TArtDBGrid;
    grbIdentifica: TGroupBox;
    ToolButton1: TToolButton;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    grbEmpresa: TGroupBox;
    lbCUIT: TLabel;
    edCUIT: TMaskEdit;
    lbRazonSocial: TLabel;
    edRazonSocial: TEdit;
    lbART: TLabel;
    lbContrato: TLabel;
    edIS_IDFORMULARIO: TIntEdit;
    lbIS_VIGENCIADESDE: TLabel;
    lbVigHasta: TLabel;
    lbOperacion: TLabel;
    Label1: TLabel;
    lbActividadUno: TLabel;
    lbActividadDos: TLabel;
    lbActividadTres: TLabel;
    lbFechaExtincion: TLabel;
    lbFRegularizacion: TLabel;
    edIS_VIGENCIADESDE: TDateComboBox;
    edIS_VIGENCIAHASTA: TDateComboBox;
    fraIS_OPERACION: TfraCtbTablas;
    fraIS_IDACTIVIDAD1: TfraActividad;
    fraIS_IDACTIVIDAD2: TfraActividad;
    fraIS_IDACTIVIDAD3: TfraActividad;
    edIS_FECHAEXTINCION: TDateComboBox;
    edIS_FECHAREGULARIZACION: TDateComboBox;
    edIS_NIVEL: TPatternEdit;
    tlbBaja: TToolButton;
    grbSolicitud: TGroupBox;
    edCO_CONTRATO: TEdit;
    ShortCutControl: TShortCutControl;
    fraIS_ART: TfraCodigoDescripcion;
    QueryPrint: TQueryPrint;
    PrintDialog: TPrintDialog;
    tbSRT: TToolButton;
    ToolButton3: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure tlbBajaClick(Sender: TObject);
    procedure tlbImprimirClick(Sender: TObject);
    procedure tlbSalirClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ArtDBGridCellClick(Column: TColumn);
    procedure tbSRTClick(Sender: TObject);
  private
    FContrato: Integer;
    FCuit: String;
    FFuncion: TFuncionShowForm;
    FIdFormulario: Integer;
    FNombreEmpresa: String;

    function IsValidar: Boolean;

    procedure DoGuardarSRT;
    procedure SeleccionSRT;
    procedure SetFuncion(F: TFuncionShowForm);

    property Funcion: TFuncionShowForm read FFuncion write SetFuncion;
  public
    procedure DoCargarDatos(const aContrato: Integer; const aNombreEmpresa, aCuit: String; const aIdFormulario: Integer;
                            fsFuncion: TFuncionShowForm); overload;
    procedure DoCargarDatos(const aContrato: Integer; const aNombreEmpresa, aCuit: String; const aIdFormulario: Integer); overload;
  end;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, General, AnsiSQL, SqlFuncs, VCLExtra, unImportCryptoSrt, unSesion, CUIT;

{$R *.DFM}

const
  CaptionBase: String = 'Carga de S.R.T.';

procedure TfrmContratoSRT.SetFuncion(F: TFuncionShowForm);
begin
  FFuncion := F;
  case F of
    fsNone:
    begin
      Caption := CaptionBase;
      tlbBaja.Enabled := False;
      tlbImprimir.Enabled := False;
    end;
    fsAgregar:
    begin
      Caption := CaptionBase + ' [ALTA]';
      tlbBaja.Enabled := False;
      tlbImprimir.Enabled := False;
    end;
    fsModificar:
    begin
      Caption := CaptionBase + ' [MODIFICACION]';
      tlbBaja.Enabled := True;
      tlbImprimir.Enabled := True;
    end;
    fsConsultar:
    begin
      Caption := CaptionBase + ' [CONSULTA]';
      tlbNuevo.Enabled := False;
      tlbGuardar.Enabled := False;
      tlbBaja.Enabled := False;
      LockControls([grbIdentifica], True);
    end;
  end;
end;

procedure TfrmContratoSRT.FormCreate(Sender: TObject);
begin
  inherited;

  fraIS_ART.TableName   := 'aar_art';
  fraIS_ART.FieldID     := 'ar_id';
  fraIS_ART.FieldCodigo := 'ar_id';
  fraIS_ART.FieldDesc   := 'ar_nombre';

  fraIS_OPERACION.Clave := 'COPER';

  LockControls([edCUIT, edRazonSocial, edCO_CONTRATO, edIS_IDFORMULARIO], True);
end;

procedure TfrmContratoSRT.DoCargarDatos(const aContrato: Integer; const aNombreEmpresa, aCuit: String;
                                        const aIdFormulario: Integer; fsFuncion: TFuncionShowForm);
begin
  Funcion := fsFuncion;
  DoCargarDatos(aContrato, aNombreEmpresa, aCuit, aIdFormulario);
end;

procedure TfrmContratoSRT.DoCargarDatos(const aContrato: Integer; const aNombreEmpresa, aCuit: String; const aIdFormulario: Integer);
begin
  FFuncion := fsAgregar;
  FContrato := aContrato;
  FIdFormulario := aIdFormulario;
  FCuit := aCuit;
  FNombreEmpresa := aNombreEmpresa;

  sdqDatos.SQL.Text :=
    'SELECT is_id, is_idart, ar_nombre, is_contrato, is_vigenciadesde, is_vigenciahasta, t2.tb_descripcion, is_nivel,' +
          ' is_idactividad1, is_idactividad2, is_idactividad3, is_fechaextincion, is_fecharegularizacion, co_idformulario,' +
          ' is_operacion, is_usubaja, is_fechabaja, is_contrato' +
     ' FROM ais_informacionsrt, ctb_tablas t2, aar_art, aco_contrato' +
    ' WHERE t2.tb_clave = ''COPER''' +
      ' AND is_operacion = t2.tb_codigo' +
      ' AND is_idart = ar_id' +
      ' AND is_idformulario = :idformulario' +
      ' AND co_contrato = :contrato';
  OpenQueryEx(sdqDatos, [aIdFormulario, aContrato]);

  edCUIT.Text := aCuit;
  edRazonSocial.Text := aNombreEmpresa;
  edCO_CONTRATO.Text := IntToStr(aContrato);
  edIS_IDFORMULARIO.Text := IntToStr(aIdFormulario);
end;

function TfrmContratoSRT.IsValidar: Boolean;
  procedure Verificar(Condicion: Boolean; AControl: TWinControl; AText: String);
  begin
    if Condicion then
    begin
      InvalidMsg(AControl, AText);
      Abort;
    end;
  end;
  
begin
  Verificar(fraIS_ART.IsEmpty, fraIS_ART.edCodigo, 'La ART es obligatoria.');
  Verificar(edIS_VIGENCIADESDE.IsEmpty, edIS_VIGENCIADESDE, 'La Vigencia Desde es obligatoria.');
  Verificar(edIS_VIGENCIAHASTA.IsEmpty, edIS_VIGENCIAHASTA, 'La Vigencia Hasta es obligatoria.');
  Verificar(edIS_VIGENCIADESDE.Date >= edIS_VIGENCIAHASTA.Date, edIS_VIGENCIAHASTA, 'La fecha de vigencia hasta no puede ser menor o igual a la fecha desde.');
  Verificar(fraIS_OPERACION.IsEmpty, fraIS_OPERACION.edCodigo, 'La Operación es obligatoria.');
  Verificar((edIS_NIVEL.Text = ''), edIS_NIVEL, 'El nivel es obligatorio.');
  Verificar(fraIS_IDACTIVIDAD1.IsEmpty, fraIS_IDACTIVIDAD1.edCodigo, 'La Actividad es obligatoria.');

  Result := True;
end;

procedure TfrmContratoSRT.tlbNuevoClick(Sender: TObject);
begin
   Funcion := fsAgregar;

   fraIS_ART.Clear;
   edIS_VIGENCIADESDE.Clear;
   edIS_VIGENCIAHASTA.Clear;
   fraIS_OPERACION.Clear;
   edIS_NIVEL.Clear;
   fraIS_IDACTIVIDAD1.Clear;
   fraIS_IDACTIVIDAD2.Clear;
   fraIS_IDACTIVIDAD3.Clear;
   edIS_FECHAEXTINCION.Clear;
   edIS_FECHAREGULARIZACION.Clear;
   fraIS_ART.edCodigo.SetFocus;
end;

procedure TfrmContratoSRT.DoGuardarSRT;
begin
  with TSql.Create('ais_informacionsrt') do
  try
    case Funcion of
      fsAgregar:
      begin
        SqlType := stInsert;
        PrimaryKey.Add('is_id',   'AFI.SEQ_AIS_ID.nextval', False);
        Fields.Add('is_fechaalta', SQL_ACTUALDATE, False);
        Fields.Add('is_usualta',   frmPrincipal.DBLogin.UserId);
      end;
      fsModificar:
      begin
        SqlType := stUpdate;
        PrimaryKey.Add('is_id',     sdqDatos.FieldByName('is_id').AsInteger, False);
        Fields.Add('is_fechamodif', SQL_ACTUALDATE, False);
        Fields.Add('is_usumodif',   frmPrincipal.DBLogin.UserId);
      end;
    end;

    Fields.Add('is_idactividad1',        fraIS_IDACTIVIDAD1.Value);
    Fields.Add('is_idactividad2',        fraIS_IDACTIVIDAD2.Value);
    Fields.Add('is_idactividad3',        fraIS_IDACTIVIDAD3.Value);
    Fields.Add('is_idart',               fraIS_ART.Value);
    Fields.Add('is_contrato',            edCO_CONTRATO.Text);
    Fields.Add('is_fechaextincion',      edIS_FECHAEXTINCION.Date);
    Fields.Add('is_fecharegularizacion', edIS_FECHAREGULARIZACION.Date);
    Fields.Add('is_idformulario',        FIdFormulario);
    Fields.Add('is_nivel',               edIS_NIVEL.Text);
    Fields.Add('is_operacion',           fraIS_OPERACION.Value);
    Fields.Add('is_vigenciadesde',       edIS_VIGENCIADESDE.Date);
    Fields.Add('is_vigenciahasta',       edIS_VIGENCIAHASTA.Date);

    try
      EjecutarSQL(Sql);
      sdqDatos.Close;
      OpenQuery(sdqDatos);
    except
      on E: Exception do
        ErrorMsg(E, 'Error al guardar los datos.');
    end;
  finally
    Free;
  end;
end;

procedure TfrmContratoSRT.tlbGuardarClick(Sender: TObject);
begin
  if Funcion = fsModificar then
    if (not sdqDatos.Eof) and (not sdqDatos.FieldByName('is_fechabaja').IsNull) then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;

  if IsValidar then
    DoGuardarSRT;
end;

procedure TfrmContratoSRT.tlbBajaClick(Sender: TObject);
begin
  if Funcion = fsModificar then // este es el único caso en el que hay establecimiento seleccionado
  begin
    if not sdqDatos.Eof and not sdqDatos.FieldByName('is_fechabaja').IsNull then
    begin
      MsgBox('Este registro se encuentra dado de baja.');
      Abort;
    end;

    if not sdqDatos.Eof then
    begin
      if MsgBox('¿ Realmente desea borrar este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      begin
        with TSql.Create('ais_informacionsrt') do
        try
          SqlType := stUpdate;
          PrimaryKey.Add('is_id',    sdqDatos.FieldByName('is_id').AsInteger, False);
          Fields.Add('is_fechabaja', SQL_ACTUALDATE, False);
          Fields.Add('is_usubaja',   frmPrincipal.DBLogin.UserId);

          try
            EjecutarSQL(Sql);
            MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
            sdqDatos.Close;
            OpenQuery(sdqDatos);
          except
            on E: Exception do
              ErrorMsg(E, 'Error al guardar los datos');
          end;
        finally
          Free;
        end;
      end;
    end;
  end;
end;

procedure TfrmContratoSRT.tlbImprimirClick(Sender: TObject);
begin
  try
    if sdqDatos.Active and (not sdqDatos.IsEmpty) and PrintDialog.Execute then
    begin
      QueryPrint.SubTitle.Lines.Add('CUIT: ' + FCuit);
      QueryPrint.SubTitle.Lines.Add('Razón Social: ' + FNombreEmpresa);
      QueryPrint.SubTitle.Lines.Add('Contrato: ' + IntToStr(FContrato));
      QueryPrint.SetGridColumns(ArtDBGrid, true, [baDetail, baHeader, baTotal, baSubTotal]);
      QueryPrint.Title.Text := CaptionBase;
      QueryPrint.Print;
    end;
  finally
    QueryPrint.SubTitle.Lines.Clear;
    QueryPrint.Fields.Clear;
  end;
end;

procedure TfrmContratoSRT.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmContratoSRT.SeleccionSRT;
begin
  if (Funcion = fsConsultar) then
    Funcion := fsModificar;

  with sdqDatos do
  begin
    fraIS_ART.Value               := FieldByName('is_idart').AsInteger;
    edIS_VIGENCIADESDE.Date       := FieldByName('is_vigenciadesde').AsDateTime;
    edIS_VIGENCIAHASTA.Date       := FieldByName('is_vigenciahasta').AsDateTime;
    fraIS_OPERACION.Value         := FieldByName('is_operacion').AsString;
    edIS_NIVEL.Text               := FieldByName('is_nivel').AsString;
    fraIS_IDACTIVIDAD1.Value      := FieldByName('is_idactividad1').AsInteger;
    fraIS_IDACTIVIDAD2.Value      := FieldByName('is_idactividad2').AsInteger;
    fraIS_IDACTIVIDAD3.Value      := FieldByName('is_idactividad3').AsInteger;
    edIS_FECHAEXTINCION.Date      := FieldByName('is_fechaextincion').AsDateTime;
    edIS_FECHAREGULARIZACION.Date := FieldByName('is_fecharegularizacion').AsDateTime;
  end;
end;

procedure TfrmContratoSRT.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  SeleccionSRT;
end;

procedure TfrmContratoSRT.ArtDBGridCellClick(Column: TColumn);
begin
  SeleccionSRT;
end;

procedure TfrmContratoSRT.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                 Highlight: Boolean);
begin
  if not sdqDatos.FieldByName('is_usubaja').IsNull then
    AFont.Color := IIF(Highlight, clBtnFace, clRed);
end;

procedure TfrmContratoSRT.tbSRTClick(Sender: TObject);
var
  sSql: String;
  aSql: TSql;
  Vig : TCuilSRT;
  i : Integer;
  sRegularizacion : String;
  iOperacion, iIdArt, iCiiu : Integer;
begin
  Vig := ConsultarVigencia(SacarGuiones(edCUIT.Text));
  if Vig.Error = '' then
  begin
    BeginTrans;

    try
      // Doy de baja los registros anteriores para esa cotizacion..
      sSql :=
        'UPDATE ais_informacionsrt' +
          ' SET is_usubaja = :usubaja,' +
              ' is_fechabaja = SYSDATE' +
        ' WHERE is_idformulario = :idformulario';
      EjecutarSqlSTEx(sSql, [Sesion.UserID, FIdFormulario]);

      // Inserto los registros recuperados de la SRT..

      for i := 0 to Length(Vig.Historial) -1  do
      begin

        sSql :=
            'SELECT tb_codigo' +
            ' FROM ctb_tablas' +
            ' WHERE tb_clave = ''COPER''' +
            ' AND UPPER(TRIM(art.utiles.reemplazar_acentos(tb_descripcion))) = UPPER(TRIM(art.utiles.reemplazar_acentos(:p1)))';
        with GetQueryEx(sSql, [Vig.Historial[i].OperacionHasta]) do
        try
          if not FieldByName('TB_CODIGO').IsNull then
            iOperacion  := FieldByName('TB_CODIGO').AsInteger
          else
            iOperacion := 1;
        finally
          Free;
        end;

        if Vig.Historial[i].Regularizacion = 'PAGO DE LA DEUDA' then
          sRegularizacion := '03' else
        if Vig.Historial[i].Regularizacion = 'POR EL TRANSCURSO DE UN AÑO' then
          sRegularizacion := '02'  else
        if Vig.Historial[i].Regularizacion = 'CONTRATO EXTINGUIDO' then
          sRegularizacion := '01' else
        if Vig.Historial[i].Regularizacion = '' then
          sRegularizacion := '01';

        iIdArt := ValorSqlEx('SELECT ar_id FROM aar_art WHERE ar_codigosrt =:cod',[Vig.Historial[i].Aseguradora]);

        if Length(Vig.Historial[i].Ciiu) = 5 then                   //SRT no me manda los 0s no significativos.
          Vig.Historial[i].Ciiu := '0' + Vig.Historial[i].Ciiu;

        iCiiu  := ValorSqlEx('SELECT ac_id FROM cac_actividad WHERE ac_codigo =:ciiu AND ROWNUM < 2', [Vig.Historial[i].Ciiu]);
        aSql := TSql.Create('AIS_INFORMACIONSRT');
        try
          aSql.SqlType := stInsert;
          aSql.PrimaryKey.Add('IS_ID',           'afi.seq_ais_id.NEXTVAL', False);
          aSql.Fields.Add('IS_IDFORMULARIO',          FIdFormulario);
          aSql.Fields.Add('IS_CONTRATO',          Vig.Historial[i].Contrato);
          aSql.Fields.Add('IS_IDART',          iIdArt);
          aSql.Fields.Add('IS_VIGENCIADESDE', StrToDateDef(Copy(Vig.Historial[i].FechaOperacionDesde,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_VIGENCIAHASTA', StrToDateDef(Copy(Vig.Historial[i].FechaOperacionHasta,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_OPERACION',  iOperacion);
          aSql.Fields.Add('IS_NIVEL', Vig.Historial[i].Nivel);
          aSql.Fields.Add('IS_USUALTA', Sesion.UserID);
          aSql.Fields.Add('IS_FECHAALTA', SQL_DATETIME, False);
          aSql.Fields.Add('IS_IDACTIVIDAD1', iCiiu);
          aSql.Fields.Add('IS_FECHAEXTINCION', StrToDateDef(Copy(Vig.Historial[i].FechaExtincion,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_FECHAREGULARIZACION', StrToDateDef(Copy(Vig.Historial[i].FechaRegularizacion,1,10), 0), dmDateTime);
          aSql.Fields.Add('IS_RESCISION', sRegularizacion);

          EjecutarSqlSt(aSql.Sql);
        finally
          aSql.Free;
        end;
      end;
      CommitTrans;
      sdqDatos.Refresh;
      sdqDatos.First;
      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
    except
      raise;
      RollBack;
    end;
  end;
end;

end.
