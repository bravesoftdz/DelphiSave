unit unCargaCertificadoRetencion;

interface
                     
uses
{$IFNDEF VER130}Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, PatternEdit, ComboEditor,
  CheckCombo, DBCheckCombo, Menus, CurrEdit, unFraStaticCodigoDescripcion;

type
  TfrmCargaCertificadoRetencion = class(TfrmCustomGridABM)
    gbEmpresa: TGroupBox;
    Label3: TLabel;
    fraCT_CONTRATO: TfraEmpresa;
    gbFechaAlta: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    cmbCT_FECHAALTADesde: TDateComboBox;
    cmbCT_FECHAALTAHasta: TDateComboBox;
    gbFechaAprobacion: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbCT_FECHAAPROBACIONDesde: TDateComboBox;
    cmbCT_FECHAAPROBACIONHasta: TDateComboBox;
    gbProvinciaIB: TGroupBox;
    cmbCT_PROVINCIAIB: TDBCheckCombo;
    sdqProvinciasIB: TSDQuery;
    dsProvinciasIB: TDataSource;
    tbSalir2: TToolButton;
    tbAprobar: TToolButton;
    ToolButton1: TToolButton;
    dsCuotas: TDataSource;
    sdqCuotas: TSDQuery;
    gbConvenios: TGroupBox;
    dbgCuotas: TArtDBGrid;
    mnuSeleccion: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    frafpCT_CONTRATO: TfraEmpresa;
    Label10: TLabel;
    edfpCT_IMPORTE: TCurrencyEdit;
    edfpCT_NUMERO: TEdit;
    Label4: TLabel;
    frafpCT_PROVINCIAIB: TfraStaticCodigoDescripcion;
    Label5: TLabel;
    rgTipo: TRadioGroup;
    tbTotalesRegGrilla: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbTotalesRegGrillaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure tbEliminarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure frafpCT_CONTRATOOnChange(Sender: TObject);
    procedure sdqCuotasAfterOpen(DataSet: TDataSet);
    procedure btnAceptarClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure fpAbmShow(Sender: TObject);
  private
    procedure CalcTotales;
    function IsDatosValidosBaja: Boolean;
    function IsDatosValidosAprobar: Boolean;
    procedure DoHabilitarControlesCertificadoRet(Habilitar: Boolean);
    procedure DoCargarCuotasPlan(NroContrato: Integer);
    function ValidarDatos: Boolean;
    function DoABMDatos: Boolean;
    procedure DoLimpiarDatosCuotas;
    procedure DoLimpiarCargarDatosCuotas;
    function DoCrearTablaTemporalRegSeleccionados: Boolean;
    function DoCrearTablaTemporalConvenio: Boolean;
    function DoActualizarTablaTemporalImpSinImputarConvenio: Boolean;
    procedure DoProcesarConvenio;
    procedure DoConciliarReg;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  end;

var
  frmCargaCertificadoRetencion: TfrmCargaCertificadoRetencion;
  TotalConsulta: array of extended;

const
  MAXCOLS = 0;
  CAMPOS_SUMA: array [0..MAXCOLS] of string = ('CT_IMPORTE');

implementation

uses
  unDmPrincipal, AnsiSql, DbFuncs, CustomDlgs, General, Strfuncs, unSesion, unArt,
  VCLExtra, Math, SqlFuncs, unCobranzas;

{$R *.DFM}
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.FormCreate(Sender: TObject);
begin
  inherited;

  fraCT_CONTRATO.ShowBajas := True;

  with frafpCT_CONTRATO do
    begin
      ShowBajas := True;
      OnChange  := frafpCT_CONTRATOOnChange;
    end;

  with frafpCT_PROVINCIAIB do
    begin
      TableName   := 'CPV_PROVINCIAS';
      FieldID     := 'PV_CODIGO';
      FieldCodigo := 'PV_CODIGO';
      FieldDesc   := 'PV_DESCRIPCION';
    end;

  SetLength( TotalConsulta,  MAXCOLS + 1 );
  OpenQuery( sdqProvinciasIB );
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraCT_CONTRATO.Clear;
  cmbCT_FECHAALTADesde.Clear;
  cmbCT_FECHAALTAHasta.Clear;
  cmbCT_FECHAAPROBACIONDesde.Clear;
  cmbCT_FECHAAPROBACIONHasta.Clear;
  cmbCT_PROVINCIAIB.Clear;

  fraCT_CONTRATO.mskCUIT.SetFocus;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.tbRefrescarClick(Sender: TObject);
var
  sSql, sWhere: string;
begin
  sSql := 'SELECT CT_ID, CT_NUMERO, EM_NOMBRE, CT_CONTRATO, PV_DESCRIPCION, CT_PROVINCIAIB, ' +
                 'CT_IDPLANVALOR, CT_USUAPROBACION, CT_USUALTA, CT_FECHAALTA, ' +
                 'PV_IDPLANCUOTA, PP_ID, CT_IMPORTE, TRUNC(CT_FECHAAPROBACION) FECHAAPROBACION, ' +
                 'CT_TIPO, DECODE(CT_TIPO, ''T'', ''Tasa'', ''I'', ''Impuesto'', '''') DESCRTIPO ' +
            'FROM CPV_PROVINCIAS, ZCT_CERTIFICADORETENCION, ZPV_PLANVALOR, ACO_CONTRATO, AEM_EMPRESA, ' +
                 'ZPC_PLANCUOTA, ZPP_PLANPAGO ' +
           'WHERE CO_CONTRATO = CT_CONTRATO ' +
             'AND CO_IDEMPRESA = EM_ID ' +
             'AND CT_IDPLANVALOR = PV_ID ' +
             'AND PV_IDPLANCUOTA = PC_ID ' +
             'AND PC_IDPLANPAGO = PP_ID ' +
             'AND CT_PROVINCIAIB = PV_CODIGO ';

  sWhere := SqlBetweenDateTime( ' AND CT_FECHAALTA', cmbCT_FECHAALTADesde.Date, cmbCT_FECHAALTAHasta.Date ) +
            SqlBetweenDateTime( ' AND CT_FECHAAPROBACION', cmbCT_FECHAAPROBACIONDesde.Date, cmbCT_FECHAAPROBACIONHasta.Date );

  if fraCT_CONTRATO.IsSelected then
    sWhere := sWhere + ' AND CT_CONTRATO = ' + SqlValue( fraCT_CONTRATO.Contrato );

  if cmbCT_PROVINCIAIB.Text <> '' then
    sWhere := sWhere + ' AND CT_PROVINCIAIB ' + cmbCT_PROVINCIAIB.InSql;


  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;

  CalcTotales;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName( 'CT_IMPORTE' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'CT_IMPORTE' ) ).Currency := True;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.tbTotalesRegGrillaClick(Sender: TObject);
begin
  CalcTotales;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.CalcTotales;
var
  PrevCursor: TCursor;
begin
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbTotalesRegGrilla.Down ;
      if tbTotalesRegGrilla.Down and sdqConsulta.Active Then
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA);
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := Get_AjusteDecimales(FloatToStr(TotalConsulta[iPos]), '$');
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.IsDatosValidosBaja: Boolean;
var
  i: Integer;
begin
  Result := False;

  if Grid.SelectedRows.Count = 0 then
    begin
      MsgBox( 'Debe seleccionar al menos una fila de la grilla', MB_ICONERROR );
      Exit;
    end;

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      if not sdqConsulta.FieldByName( 'CT_USUAPROBACION' ).IsNull then
        begin
          MsgBox( 'Uno de los certificados de retención ya ha sido aprobado', MB_ICONERROR );
          Exit;
        end;
    end;

  Result := True;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  IdCertRetencion: TTableId;
  i: Integer;
begin
  if IsDatosValidosBaja() then
    if MsgBox( '¿Desea dar de baja los registros seleccionados?', MB_ICONQUESTION + MB_YESNO ) = IDYES then
      begin
        try
          BeginTrans;

          for i := 0 to Grid.SelectedRows.Count - 1 do
            begin
              sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

              IdCertRetencion := sdqConsulta.FieldByName( 'CT_ID' ).AsInteger;

              sSql := 'DELETE FROM ZCT_CERTIFICADORETENCION ' +
                            'WHERE CT_ID=' + SqlValue( IdCertRetencion );
              EjecutarSqlST( sSql );

              sSql := 'UPDATE ZPV_PLANVALOR ' +
                         'SET PV_USUBAJA=' + SqlValue( Sesion.UserID ) + ', ' +
                             'PV_FECHABAJA=SYSDATE ' +
                       'WHERE PV_ID=' + SqlValue( sdqConsulta.FieldByName( 'CT_IDPLANVALOR' ).AsInteger );
              EjecutarSqlST( sSql );
            end;

          CommitTrans;
          MsgBox( 'Los datos de los certificados de retención se eliminaron correctamente', MB_ICONINFORMATION );

          RefreshData;
        except
          on E: Exception do
            begin
              RollBack;

              Raise Exception.Create ( E.Message + CRLF + 'Error al eliminar los certificados de retención' );
            end;
        end;
      end;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.ClearControls;
begin
  DoHabilitarControlesCertificadoRet( True );

  frafpCT_CONTRATO.Clear;
  edfpCT_NUMERO.Clear;
  edfpCT_IMPORTE.Clear;
  frafpCT_PROVINCIAIB.Clear;
  rgTipo.ItemIndex := -1;

  DoLimpiarCargarDatosCuotas
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.DoABM: Boolean;
begin
  Result := Null;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.LoadControls;
var
  iTipo: Integer;
begin
  Verificar(not sdqConsulta.FieldByName('CT_USUAPROBACION').IsNull, tbModificar, 'El certificado de retención ya ha sido aprobado' );

  DoHabilitarControlesCertificadoRet( False );

  frafpCT_CONTRATO.Contrato  := sdqConsulta.FieldByName('CT_CONTRATO').AsInteger;
  edfpCT_NUMERO.Text         := sdqConsulta.FieldByName('CT_NUMERO').AsString;
  edfpCT_IMPORTE.Value       := sdqConsulta.FieldByName('CT_IMPORTE').AsFloat;
  frafpCT_PROVINCIAIB.Codigo := sdqConsulta.FieldByName('CT_PROVINCIAIB').AsString;

  if sdqConsulta.FieldByName('CT_TIPO').AsString = 'T' then
    iTipo := 0
  else if sdqConsulta.FieldByName('CT_TIPO').AsString = 'I' then
    iTipo := 1
  else
    iTipo := -1;

  rgTipo.ItemIndex := iTipo;

  DoLimpiarCargarDatosCuotas;
  sdqCuotas.Locate( 'PC_ID', sdqConsulta.FieldByName( 'PV_IDPLANCUOTA').AsInteger, [loCaseInsensitive] );
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnSelectAll;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.Validar: Boolean;
begin
  Result := Null;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.DoHabilitarControlesCertificadoRet(Habilitar: Boolean);
begin
  VCLExtra.LockControls([frafpCT_CONTRATO], not Habilitar);
  gbConvenios.Enabled := Habilitar;
end;  
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.frafpCT_CONTRATOOnChange(Sender: TObject);
begin
  DoCargarCuotasPlan( frafpCT_CONTRATO.Contrato );
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.DoCargarCuotasPlan(NroContrato: Integer);
begin
  sdqCuotas.ParamByName( 'pEsModificacion').AsInteger := Iif( ModoABM = maModificacion, 1, 0 );
  sdqCuotas.ParamByName( 'pContrato').AsInteger       := NroContrato;

  OpenQuery( sdqCuotas );
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.sdqCuotasAfterOpen(DataSet: TDataSet);
begin
  if sdqCuotas.FieldByName( 'TOTALCUOTA' ) is TFloatField then
    TFloatField( sdqCuotas.FieldByName( 'TOTALCUOTA' )).Currency := True;

  if sdqCuotas.FieldByName( 'SALDO' ) is TFloatField then
    TFloatField( sdqCuotas.FieldByName( 'SALDO' )).Currency := True;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.btnAceptarClick(Sender: TObject);
begin
  if ValidarDatos() and DoABMDatos() Then
    begin
      tbRefrescarClick( Nil );
      CheckButtons;
      fpABM.ModalResult := mrOk;
    end;
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.DoABMDatos: Boolean;
var
  SqlPlanValor: TSql;
  IdPlanValor, IdCertRetencion: TTableId;
  sTipo: String;
begin
  Result := True;

  Sql.Clear;
  Sql.TableName := 'ZCT_CERTIFICADORETENCION';

  BeginTrans;
  try
    SqlPlanValor := TSql.Create( 'ZPV_PLANVALOR' );
    try
      if ModoABM = maAlta then
      begin
        IdCertRetencion        := GetSecNextVal( ' SEQ_ZCT_ID' );
        IdPlanValor            := GetSecNextVal( ' SEQ_ZPV_ID' );

        // TABLA ZCT_CERTIFICADORETENCION
        Sql.Fields.Add( 'CT_FECHAALTA', SQL_ACTUALDATE, False );
        Sql.Fields.Add( 'CT_USUALTA', Sesion.UserID );

        // TABLA ZPV_PLANVALOR
        SqlPlanValor.Fields.Add( 'PV_FECHAALTA', SQL_ACTUALDATE, False );
        SqlPlanValor.Fields.Add( 'PV_USUALTA', Sesion.UserID );

        SqlPlanValor.SqlType := stInsert;
      end
      else
      begin
        IdCertRetencion := sdqConsulta.FieldByName( 'CT_ID' ).AsInteger;
        IdPlanValor     := sdqConsulta.FieldByName( 'CT_IDPLANVALOR' ).AsInteger;

        // TABLA ZCT_CERTIFICADORETENCION
        Sql.Fields.Add( 'CT_FECHAMODIF', SQL_ACTUALDATE, False );
        Sql.Fields.Add( 'CT_USUMODIF', Sesion.UserID );

        // TABLA ZPV_PLANVALOR
        SqlPlanValor.Fields.Add( 'PV_FECHAMODIF', SQL_ACTUALDATE, False );
        SqlPlanValor.Fields.Add( 'PV_USUMODIF', Sesion.UserID );

        SqlPlanValor.SqlType := stUpdate;
      end;

      // TABLA ZPV_PLANVALOR
      SqlPlanValor.PrimaryKey.Add ( 'PV_ID', IdPlanValor, False );
      SqlPlanValor.Fields.Add( 'PV_IDPLANCUOTA', sdqCuotas.FieldByName( 'PC_ID' ).AsInteger , False );
      SqlPlanValor.Fields.Add( 'PV_IMPORTE', edfpCT_IMPORTE.Value, dtNumber );
      SqlPlanValor.Fields.Add( 'PV_ORIGEN', '4' );
      SqlPlanValor.Fields.Add( 'PV_IDCERTIFICADORETENCION', IdCertRetencion , False );

      EjecutarSqlST( SqlPlanValor.Sql );


      // TABLA ZCT_CERTIFICADORETENCION (cont.)
      Sql.PrimaryKey.Add ( 'CT_ID', IDCertRetencion, False );
      Sql.Fields.Add( 'CT_CONTRATO', frafpCT_CONTRATO.Contrato );
      Sql.Fields.Add( 'CT_NUMERO', edfpCT_NUMERO.Text );
      Sql.Fields.Add( 'CT_PROVINCIAIB', frafpCT_PROVINCIAIB.Codigo );
      Sql.Fields.Add( 'CT_IDPLANVALOR', IdPlanValor, False );
      Sql.Fields.Add( 'CT_IMPORTE', edfpCT_IMPORTE.Value, dtNumber );

      case rgTipo.ItemIndex of
        0: sTipo := 'T';
        1: sTipo := 'I';
      else
        sTipo := '';
      end;
      Sql.Fields.Add( 'CT_TIPO', sTipo );

      EjecutarSqlST ( Sql.Sql );

      CommitTrans;
      MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
    finally
      SqlPlanValor.Free;
    end;
  except
    on E:Exception do
    begin
      Rollback;

      Raise Exception.Create( E.Message );
    end;
  end;
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.ValidarDatos: Boolean;
var
  rImporteAnterior: Currency;
begin
  Result := False;

  if ModoABM = maAlta then
    rImporteAnterior := 0
  else
    rImporteAnterior := sdqConsulta.FieldByName('CT_IMPORTE').AsFloat;

  if (not sdqCuotas.Active or sdqCuotas.IsEmpty) then
    InvalidMsg( dbgCuotas, 'No existen cuotas en la grilla.' )

  else if frafpCT_CONTRATO.IsEmpty then
    InvalidMsg( frafpCT_CONTRATO.edContrato, 'El número de contrato es obligatorio.' )

  else if (Trim(edfpCT_NUMERO.Text) = '')  then
    InvalidMsg( edfpCT_NUMERO, 'El número de certificado es obligatorio.' )

  else if edfpCT_IMPORTE.Value <= 0 then
    InvalidMsg( edfpCT_IMPORTE, 'El importe debe ser mayor a 0.' )

  else if edfpCT_IMPORTE.Value > rImporteAnterior + sdqCuotas.FieldByName( 'SALDO' ).AsFloat then
    InvalidMsg( edfpCT_IMPORTE, 'El importe debe ser menor o igual al saldo de la cuota: ' + FloatToStr( rImporteAnterior + sdqCuotas.FieldByName( 'SALDO' ).AsFloat ) )

  else if frafpCT_PROVINCIAIB.IsEmpty then
    InvalidMsg( frafpCT_PROVINCIAIB, 'La provincia de ingresos brutos es obligatoria.' )

  else if rgTipo.ItemIndex = -1 then
    InvalidMsg( rgTipo, 'El tipo de retención es obligatorio.' )

  else
    Result := True;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.DoLimpiarDatosCuotas;
begin
  sdqCuotas.Close;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.DoLimpiarCargarDatosCuotas;
begin
  inherited;

  DoLimpiarDatosCuotas;

  if not frafpCT_CONTRATO.IsEmpty then
    DoCargarCuotasPlan( frafpCT_CONTRATO.Contrato );
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.IsDatosValidosAprobar: Boolean;
var
  i: Integer;
begin
  Result := False;

  if Grid.SelectedRows.Count = 0 then
    begin
      InvalidMsg ( Grid, 'Debe seleccionar al menos una fila de la grilla' );
      Exit;
    end
  else
    for i := 0 to Grid.SelectedRows.Count - 1 do
      begin
        sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

        if not sdqConsulta.FieldByName( 'CT_USUAPROBACION' ).IsNull then
          begin
            MessageDlg( 'Uno de los certificados de retención ya ha sido aprobado', mtError, [mbOK], 0 );
            Exit;
          end;
      end;

  Result := True;
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.DoCrearTablaTemporalRegSeleccionados: Boolean;
var
  i: Integer;
  sSql: String;
begin
  Result := False;

  with TStringList.Create do
    try
      Sorted     := True;
      Duplicates := dupIgnore;

      for i := 0 to Grid.SelectedRows.Count - 1 do
        begin
          sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
          Add( sdqConsulta.FieldByName('CT_ID').AsString );
        end;

      try
        BeginTrans;

        sSql := 'DELETE FROM TCS_CERTIFICADORETSINAPROBADOS ' +
                 'WHERE CS_USUARIO=' + SqlValue( Sesion.UserID );
        EjecutarSqlST( sSql );

        for i := 0 to Count - 1 do
          begin
            sSql := 'INSERT INTO TCS_CERTIFICADORETSINAPROBADOS(CS_USUARIO, CS_IDCERTIFICADORETENCION) ' +
                         'VALUES(' + SqlValue( Sesion.UserID ) + ', ' +
                                     SqlInteger( Strings[i] ) + ')';
            EjecutarSqlST( sSql );
          end;

        CommitTrans;
        Result := True;
      except
        On E: Exception do
          begin
            RollBack;

            Raise Exception.Create( E.Message );
          end;
      end;
    finally
      Free
    end;
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.DoCrearTablaTemporalConvenio: Boolean;
var
  sSql: String;
begin
  // ver CONT.Do_GenerarPlanDeudaPendientes
  try
    BeginTrans;

    sSql := 'DELETE FROM TPC_PLANDEUDAPENDIENTESCERTRET ' +
             'WHERE PC_USUARIO=' + SqlValue( Sesion.UserID );
    EjecutarSqlST( sSql );

    sSql := 'INSERT INTO TPC_PLANDEUDAPENDIENTESCERTRET(PC_USUARIO, PC_IDCERTIFICADORETENCION, PC_IDPLANDEUDA, ' +
                   'PC_PERIODO, PC_IMPORTEIMPUTAR, PC_SALDODEUDANOMINAL, PC_CONTRATO) ' +  // PC_ID va por trigger
            'SELECT ' + SqlValue( Sesion.UserID ) + ', CT_ID, PD_ID, PD_PERIODO, ' +
                    '0, MAX(PD_SALDODEUDANOMINAL), MAX(CT_CONTRATO) ' +
              'FROM TCS_CERTIFICADORETSINAPROBADOS, ZCT_CERTIFICADORETENCION, ZPV_PLANVALOR, ' +
                   'ZPC_PLANCUOTA, ZPD_PLANDEUDA ' +
             'WHERE CS_IDCERTIFICADORETENCION=CT_ID ' +
               'AND CT_IDPLANVALOR=PV_ID ' +
               'AND PV_IDPLANCUOTA=PC_ID ' +
               'AND PC_IDPLANPAGO=PD_IDPLANPAGO ' +
               'AND CS_USUARIO=' + SqlValue( Sesion.UserID ) + ' ' +
          'GROUP BY CT_ID, PD_ID, PD_PERIODO';
    EjecutarSqlST( sSql );

    CommitTrans;
    Result := True;
  except
    On E: Exception do
      begin
        RollBack;

        Raise Exception.Create( E.Message );
      end;
  end;
end;
{--------------------------------------------------------------------------------}
function TfrmCargaCertificadoRetencion.DoActualizarTablaTemporalImpSinImputarConvenio: Boolean;
var
  sSql, sSql2, sSql3: String;
  IdCertRetencion, IdPlanDeudaPendientes, IdPlanDeuda, IdPlanPago: TTableId;
  rImporteCertRetencion, rImporteSaldo, rImporteImputar, rSaldoIntMora: Currency;
begin
  // ver CONT.Do_ActPlanDeudaPendientes
  try
    BeginTrans;

    sSql := 'SELECT CT_ID, MAX(CT_IMPORTE) CTIMPORTE ' +
              'FROM TPC_PLANDEUDAPENDIENTESCERTRET, ZCT_CERTIFICADORETENCION ' +
             'WHERE PC_USUARIO=' + SqlValue( Sesion.UserID ) + ' ' +
               'AND PC_IDCERTIFICADORETENCION=CT_ID ' +
          'GROUP BY CT_ID';

    with GetQuery( sSql ) do  // recorro por cert. de retención seleccionado
      try
        while not EOF do
          begin
            IdCertRetencion       := FieldByName( 'CT_ID' ).AsInteger;
            rImporteCertRetencion   := FieldByName( 'CTIMPORTE' ).AsCurrency;

            sSql2 := 'SELECT PC_ID, PC_SALDODEUDANOMINAL, PC_IDPLANDEUDA ' +
                       'FROM TPC_PLANDEUDAPENDIENTESCERTRET ' +
                      'WHERE PC_USUARIO=' + SqlValue( Sesion.UserID ) + ' ' +
                        'AND PC_IDCERTIFICADORETENCION=' + SqlValue( IdCertRetencion ) + ' ' +
                        'AND PC_SALDODEUDANOMINAL>0 ' +
                   'ORDER BY PC_PERIODO';

            with GetQuery( sSql2 ) do  // proceso periodos del estado de cuenta del plan de pago correspondiente al cert. de retención seleccionado
              try
                while (not EOF) and (rImporteCertRetencion > 0) do
                  begin
                    rImporteSaldo := FieldByName( 'PC_SALDODEUDANOMINAL' ).AsCurrency;

                    if rImporteSaldo > 0 then    // pongo esta condición porque el saldo pudo haber cambiado por los updates que hago a continuación
                      begin
                        rImporteImputar       := Min(rImporteSaldo, rImporteCertRetencion);
                        IdPlanDeudaPendientes := FieldByName( 'PC_ID' ).AsInteger;
                        IdPlanDeuda           := FieldByName( 'PC_IDPLANDEUDA' ).AsInteger;

                        sSql3 := 'UPDATE TPC_PLANDEUDAPENDIENTESCERTRET ' +
                                    'SET PC_IMPORTEIMPUTAR=' + SqlNumber(rImporteImputar) + ', ' +
                                        'PC_SALDODEUDANOMINAL=PC_SALDODEUDANOMINAL-' + SqlNumber(rImporteImputar) + ', ' +
                                        'PC_TIPO=''C'' ' +
                                  'WHERE PC_ID=' + SqlValue( IdPlanDeudaPendientes );
                        EjecutarSqlST( sSql3 );

                        // Esto lo hago porque si selecciona en la grilla dos cert. de retención (ct_id, tpc.pp_IdCertificadoRetencion) que corresponden
                        // al mismo plan (zpp_PlanPago.pp_Id), entonces van a estar duplicados los estados de cuenta (zpd_PlanDeuda) para cada ct_id.
                        // Entonces, actualizo también el saldo del estado de cuenta (tpc.pc_SaldoDeudaNominal), para el resto de los mismos periodos,
                        // o sea, aquellos registros con igual tpc.pc_IdPlanDeuda (zpd_PlanDeuda.pd_Id)
                        sSql3 := 'UPDATE TPC_PLANDEUDAPENDIENTESCERTRET ' +
                                    'SET PC_SALDODEUDANOMINAL=PC_SALDODEUDANOMINAL-' + SqlNumber(rImporteImputar) + ' ' +
                                  'WHERE PC_USUARIO=' + SqlValue( Sesion.UserID ) + ' ' +
                                    'AND PC_IDPLANDEUDA=' + SqlValue( IdPlanDeuda ) + ' ' +
                                    'AND PC_ID<>' + SqlValue( IdPlanDeudaPendientes );
                        EjecutarSqlST( sSql3 );

                        rImporteCertRetencion := rImporteCertRetencion - rImporteImputar;
                      end;

                    Next;
                  end;

                // análisis de intereses
                if rImporteCertRetencion > 0 then  // primero, el dinero que queda se imputa al último periodo como intereses por mora
                  begin
                    sSql3 := 'SELECT PC_IDPLANPAGO ' +
                               'FROM ZPC_PLANCUOTA, ZPV_PLANVALOR, ZCT_CERTIFICADORETENCION ' +
                              'WHERE CT_IDPLANVALOR=PV_ID ' +
                                'AND PV_IDPLANCUOTA=PC_ID ' +
                                'AND CT_ID=' + SqlValue( IdCertRetencion );
                    IdPlanPago := ValorSqlInteger( sSql3, ART_EMPTY_ID );

                    sSql3 := 'SELECT COBRANZA.GET_SALDOINTMORA_PLAN(' + SqlValue( IdPlanPago ) + ', ' + SqlValue( Sesion.UserID ) + ') ' +
                               'FROM DUAL';
                    rSaldoIntMora := ValorSqlExtended( sSql3 );

                    rImporteImputar := Min(rSaldoIntMora, rImporteCertRetencion);

                    if rImporteImputar > 0 then
                      begin
                        sSql3 := 'INSERT INTO TPC_PLANDEUDAPENDIENTESCERTRET(PC_USUARIO, PC_IDCERTIFICADORETENCION, ' +
                                        'PC_IDPLANDEUDA, PC_PERIODO, PC_IMPORTEIMPUTAR, PC_CONTRATO, ' +
                                        'PC_TIPO) ' +   // PC_ID va por trigger
                                 'SELECT ' + SqlValue( Sesion.UserID ) + ', ' +
                                         'CT_ID, MAX(PD_ID), MAX(PD_PERIODO), ' + SqlNumber( rImporteImputar ) + ', ' +
                                         'MAX(CT_CONTRATO), ''M'' ' +
                                   'FROM ZCT_CERTIFICADORETENCION, ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPD_PLANDEUDA ' +
                                  'WHERE CT_IDPLANVALOR=PV_ID ' +
                                    'AND PV_IDPLANCUOTA=PC_ID ' +
                                    'AND PC_IDPLANPAGO=PD_IDPLANPAGO ' +
                                   'AND CT_ID=' + SqlValue( IdCertRetencion ) + ' ' +
                              'GROUP BY CT_ID';
                        EjecutarSqlST( sSql3 );

                        rImporteCertRetencion := rImporteCertRetencion - rImporteImputar;
                      end;
                  end;

                if rImporteCertRetencion > 0 then  // y finalmente, el resto del dinero que queda se imputa al último periodo como intereses por financiación
                  begin
                    sSql3 := 'INSERT INTO TPC_PLANDEUDAPENDIENTESCERTRET(PC_USUARIO, PC_IDCERTIFICADORETENCION, ' +
                                    'PC_IDPLANDEUDA, PC_PERIODO, PC_IMPORTEIMPUTAR, PC_CONTRATO, ' +
                                    'PC_TIPO) ' +   // PC_ID va por trigger
                             'SELECT ' + SqlValue( Sesion.UserID ) + ', ' +
                                     'CT_ID, MAX(PD_ID), MAX(PD_PERIODO), ' + SqlNumber( rImporteCertRetencion ) + ', ' +
                                     'MAX(CT_CONTRATO), ''F'' ' +
                               'FROM ZCT_CERTIFICADORETENCION, ZPV_PLANVALOR, ZPC_PLANCUOTA, ZPD_PLANDEUDA ' +
                              'WHERE CT_IDPLANVALOR=PV_ID ' +
                                'AND PV_IDPLANCUOTA=PC_ID ' +
                                'AND PC_IDPLANPAGO=PD_IDPLANPAGO ' +
                               'AND CT_ID=' + SqlValue( IdCertRetencion ) + ' ' +
                          'GROUP BY CT_ID';
                    EjecutarSqlST( sSql3 );
                  end;
              finally
                free;
              end;

            Next;
          end;
      finally
        free;
      end;

    CommitTrans;
    Result := True;
  except
    On E: Exception do
      begin
        RollBack;

        Raise Exception.Create( E.Message );
      end;
  end;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.DoProcesarConvenio;
var
  sSql: String;
begin
  sSql := 'COBRANZA.DO_PROCESARCONVENIOCERTRET(' + SqlValue( Sesion.UserID ) + ');';
  EjecutarStoreST( sSql );
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.tbAprobarClick(Sender: TObject);
var
  sSql: String;
begin
  if IsDatosValidosAprobar() then
    begin
      if MsgBox( '¿Confirma la aprobación de ' + IntToStr( Grid.SelectedRows.Count ) + ' certificado/s de retención?', MB_ICONQUESTION + MB_OKCANCEL ) = IDOK then
        begin
          if DoCrearTablaTemporalRegSeleccionados and DoCrearTablaTemporalConvenio and
             DoActualizarTablaTemporalImpSinImputarConvenio then
            begin
              try
                BeginTrans;

                // actualizo resumen de cobranzas, tablas de planes de pago, y genero
                // movimientos en zmo_Movimiento para los reg. seleccionados
                DoProcesarConvenio;

                // actualizo fecha y usuario de aprobación
                sSql := 'UPDATE ZCT_CERTIFICADORETENCION ' +
                           'SET CT_USUAPROBACION=' + SqlValue( Sesion.UserID ) + ', ' +
                               'CT_FECHAAPROBACION=' + SQL_DATETIME + ' ' +
                         'WHERE CT_ID IN (SELECT CS_IDCERTIFICADORETENCION ' +
                                           'FROM TCS_CERTIFICADORETSINAPROBADOS ' +
                                           'WHERE CS_USUARIO=' + SqlValue( Sesion.UserID ) + ')';
                EjecutarSqlST( sSql );

                // se concilian todos los periodos involucrados
                DoConciliarReg;

                CommitTrans;
                MsgBox( 'Los certificados de retención se aprobaron correctamente', MB_OK+MB_ICONINFORMATION );
                RefreshData;
              except
                on E: Exception do
                  begin
                    RollBack;
                    Raise Exception.Create( E.Message + CRLF + 'Error al aprobar los certificados de retención' );
                  end;
              end;
            end;
        end;
    end;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.DoConciliarReg;
var
  sSql, sPeriodo: String;
  iContrato: Integer;
begin
  // relacionado con Get_TotalContratosPeriodosRedevengar
  sSql := 'SELECT PC_CONTRATO CONTRATO, PC_PERIODO PERIODO ' +
            'FROM TPC_PLANDEUDAPENDIENTESCERTRET ' +
           'WHERE PC_USUARIO=' + SqlValue( Sesion.UserID ) + ' ' +
             'AND PC_TIPO IS NOT NULL ' +    // registros a los que se les asignó algún pc_ImporteImputar
        'GROUP BY PC_CONTRATO, PC_PERIODO';

  with GetQuery( sSql ) do
    begin
      try
        while not EOF do
          begin
            iContrato := FieldByName( 'CONTRATO' ).AsInteger;
            sPeriodo  := FieldByName( 'PERIODO' ).AsString;

            Do_RedevengarConciliar( iContrato, sPeriodo, Sesion.UserID, False, False, True );

            Next;
          end;
      finally
        free;
      end;
    end;
end;
{--------------------------------------------------------------------------------}
procedure TfrmCargaCertificadoRetencion.fpAbmShow(Sender: TObject);
begin
  inherited;

  VCLExtra.LockControls ( edfpCT_NUMERO, (ModoABM = maModificacion) );
end;
{--------------------------------------------------------------------------------}
end.


