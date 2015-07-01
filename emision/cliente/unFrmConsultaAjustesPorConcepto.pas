unit unFrmConsultaAjustesPorConcepto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unFraCodigoDescripcion, unFraUsuario, Mask, ToolEdit,
  DateComboBox, unArtFrame, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  PatternEdit, ComboEditor, CheckCombo, DBCheckCombo, CurrEdit,
  PeriodoPicker, unFraStaticCodigoDescripcion, Buttons, Menus, CardinalEdit,
  DBCtrls, IntEdit, unfraCodigoDescripcionExt, JvMemoryDataset;

type
  TfrmConsultaAjustesPorConcepto = class(TfrmCustomGridABM)
    gmEmpresa: TGroupBox;
    Label3: TLabel;
    gbMM_USUAPROBADO: TGroupBox;
    rbSinAprobar: TRadioButton;
    rbAprobados: TRadioButton;
    rbAmbos: TRadioButton;
    gbFechaAlta: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    gbUsuarioAlta: TGroupBox;
    gbFechaAprobado: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    gbCodigoMovimiento: TGroupBox;
    dsMovimientos: TDataSource;
    sdqMovimientos: TSDQuery;
    tbSumatoria: TToolButton;
    tbAprobar: TToolButton;
    pmnuMarcar: TPopupMenu;
    mnuMarcarTodos: TMenuItem;
    mnuDesmarcarTodos: TMenuItem;
    tbVistaPrevia: TToolButton;
    mnuImpoExpo: TPopupMenu;
    mnuAyuda: TMenuItem;
    tbEstado: TToolButton;
    fraConcepto: TfraCodigoDescripcionExt;
    fraContrato: TfraEmpresa;
    edtFechaCargaDesde: TDateComboBox;
    edtFechaCargaHasta: TDateComboBox;
    edtFechaAprobacionDesde: TDateComboBox;
    edtFechaAprobacionHasta: TDateComboBox;
    fraUsuarioCarga: TfraUsuarios;
    edtNroNota: TIntEdit;
    chkNota: TCheckBox;
    edEstado: TDBMemo;
    tbSeparadorFinal: TToolButton;
    sb: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject); 
    procedure tbSumatoriaClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure mnuMarcarTodosClick(Sender: TObject);
    procedure mnuDesmarcarTodosClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbOrdenarClick(Sender: TObject);
    procedure tbVistaPreviaClick(Sender: TObject);
    procedure tbImpoExpoClick(Sender: TObject);
    procedure mnuAyudaClick(Sender: TObject);
    procedure tbEstadoClick(Sender: TObject);
    procedure sdqConsultaAfterScroll(DataSet: TDataSet);
    procedure frafpMM_CONTRATOExit(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure fraContratoExit(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FSFormShow(Sender: TObject);
  protected
    procedure EnableButtons(AEnabled : Boolean = True); override;
    procedure LoadControls; override;
    procedure ClearControls; override;
    function Validar: Boolean; override;
    function DoABM: Boolean; override;
  private
    sPantalla: string;
    pbHuboAltasModif : Boolean;
    TotalConsulta : array of extended;
    TotalRegSeleccionados : array of extended;
    procedure CalcTotales;
    procedure CalcularFilasSel;
    procedure InicializarContadores(ActualizarTotales: Boolean);
    function IsDatosValidosBaja: Boolean;
    function IsDatosValidosAprobacion: Boolean;
    procedure Do_Limpiar;
    function Do_ActualizarAprobacionRegSeleccionados: Boolean;
    function Do_InsertarMovimientos: Boolean;
    function Do_ProcesarMovConPeriodosConciliados: Boolean;
    function Get_CantRegistrosAprobar: Integer;
    function ValidarCoberturaPeriodo(Contrato: Integer; Cuit, Periodo: String): Boolean;
    procedure ReAjustarEstado;
    function GetMovimientosSeleccionados: string;
    function ConfirmarSeleccion(AIdAJuste: integer): boolean;
  public

  end;

implementation

uses AnsiSql, unDmPrincipal, CustomDlgs, SqlFuncs, General, DbFuncs, unSesion,
     unMovimientosVistaPrevia, StrFuncs, unArt, Periodo, unAyuda, unDmEmision, unPrincipal,
  unFrmAjustePorConceptos, unCustomConsulta, unFuncionesEmision;

const
//  CAMPOS_SUMA : array [0..0] of string = ('IMPORTE');
  MAXCOLS = 0;
  ALTURA_RENGLON = 16;
  SQL_ESTADO = 'REPLACE( AFILIACION.MSG_COBERTURA(CO_CONTRATO, SYSDATE), CHR(13), CHR(13) || CHR(10) ) || ' +
               'DECODE(NVL(AFILIACION.GET_CONTRATOVIGENTE(EM_CUIT, TO_CHAR(ADD_MONTHS(CO_VIGENCIADESDE, -2), ''YYYYMM'')), 0), ' +
                      'CO_CONTRATO, '''', ' +
                      '0, '''', ' +
                      'DECODE(AFILIACION.MSG_COBERTURA(CO_CONTRATO, SYSDATE), '''', '''', CHR(13) || CHR(10)) ' +
                             '|| ''Contrato anterior: '' || ' +
                             'AFILIACION.GET_CONTRATOVIGENTE(EM_CUIT, TO_CHAR(ADD_MONTHS(CO_VIGENCIADESDE, -2), ''YYYYMM''))) ESTADO ';


{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraContrato.Clear;
  edtFechaCargaDesde.Clear;
  edtFechaCargaHasta.Clear;
  edtFechaAprobacionDesde.Clear;
  edtFechaAprobacionHasta.Clear;
  fraConcepto.Clear;
  fraUsuarioCarga.Clear;
  edtNroNota.Clear;
  rbAmbos.Checked := true;
  InicializarContadores( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.FormCreate(Sender: TObject);
begin
  inherited;

  fraContrato.ShowBajas := True;


  with fraConcepto do
  begin
    TableName := 'EMI.IAJ_AJUSTE';
    FieldID := 'AJ_ID';
    FieldCodigo := 'AJ_ID';
    FieldDesc := 'AJ_DESCRIPCION';
    ShowBajas := true;
  end;


{  SetLength( TotalConsulta, MAXCOLS+1 );
   SetLength( TotalRegSeleccionados, MAXCOLS+1 );
}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.tbSumatoriaClick(Sender: TObject);
begin
//  CalcTotales;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.CalcTotales;
var
  PrevCursor: TCursor;
begin
{
  PrevCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    try
      Grid.FooterBand := tbSumatoria.Down ;
      if tbSumatoria.Down and sdqConsulta.Active then
        SumFields( sdqConsulta, CAMPOS_SUMA, TotalConsulta );
    except
      on E: Exception do ErrorMsg(E, 'Error al Calcular los Totales.');
    end;
  finally
    Screen.Cursor := PrevCursor;
  end;
}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iPos: Integer;
begin
{
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_SUMA );
  if (iPos > -1) and (iPos <= MAXCOLS) then
    Value := '$ ' + ToStr( TotalConsulta[iPos] );
}
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  if Assigned(sdqConsulta.FindField('ESTADO')) then
    edEstado.DataField := 'ESTADO';

//  if sdqConsulta.FieldByName( 'IMPORTE' ) is TFloatField Then  // para que me muestre todo con 2 decimales, como está en la base
//    TFloatField( sdqConsulta.FieldByName( 'IMPORTE' ) ).Currency := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.tbRefrescarClick(Sender: TObject);
var
  sSql, sSqlWhere: String;
begin
  sSql := 'SELECT iae.ae_id,  ' +
       'iae.ae_idajuste,  ' +
       'iae.ae_contrato,  ' +
       'aem.em_nombre,  ' +
       'aem.em_cuit,  ' +
       'iae.ae_periodo,        ' +
       'iae.ae_observacion,    ' +
       'iae.ae_usualta,        ' +
       'iae.ae_fechaalta,      ' +
       'iae.ae_usuaprobacion,  ' +
       'iae.ae_fechaaprobacion,' +
       'iae.ae_usubaja,    '  +
       'iae.ae_fechabaja,  '  +
       'iaj.aj_descripcion, ' +
       SQL_ESTADO             +
       ' FROM emi.iae_ajusteefectuado iae,  ' +
       'emi.iaj_ajuste iaj,  ' +
       'afi.aco_contrato aco,  ' +
       'afi.aem_empresa aem  ' +
       ' WHERE (    (iaj.aj_id = iae.ae_idajuste)   ' +
       '   AND (aco.co_contrato = iae.ae_contrato)  ' +
       '   AND (aem.em_id = aco.co_idempresa))';




  sSqlWhere := SqlBetweenDateTime( ' AND iae.ae_fechaalta', edtFechaCargaDesde.Date, edtFechaCargaHasta.Date ) +
               SqlBetween( ' AND iae.ae_fechaaprobacion', edtFechaAprobacionDesde.Date, edtFechaAprobacionHasta.Date );

  if fraContrato.IsSelected then
    sSqlWhere := sSqlWhere + ' AND iae.ae_contrato = ' + SqlValue( fraContrato.edContrato.Value );

  if fraUsuarioCarga.IsSelected then
    sSqlWhere := sSqlWhere + ' AND iae.ae_usualta = ' + SqlValue( fraUsuarioCarga.Value );

  if rbSinAprobar.Checked then
    sSqlWhere := sSqlWhere + ' AND iae.AE_FECHAAPROBACION IS NULL'
  else if rbAprobados.Checked then
    sSqlWhere := sSqlWhere + ' AND iae.AE_FECHAAPROBACION IS NOT NULL';

  if fraConcepto.IsSelected then
      sSqlWhere := sSqlWhere + ' AND iae.ae_idajuste = ' + fraConcepto.Codigo;


  sdqConsulta.SQL.Text := sSql + sSqlWhere + SortDialog.OrderBy;

  inherited;
//FIXME
//  InicializarContadores( True );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.EnableButtons(AEnabled: Boolean);
begin
  inherited;

  tbAprobar.Enabled   := AEnabled and Seguridad.Activar( tbAprobar );
  tbSumatoria.Enabled := AEnabled;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.IsDatosValidosBaja: Boolean;
var
  i: Integer;
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar un ajuste.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
    Verificar(not sdqConsulta.FieldByName('ae_usuaprobacion').IsNull, nil, 'Uno de los ajustes ya ha sido aprobado.');
    Verificar(not sdqConsulta.FieldByName('ae_fechabaja').isnull, nil, 'Uno de los ajustes ya ha sido dado de baja.');
  end;
  Result := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.tbEliminarClick(Sender: TObject);
var
  sSql: String;
  i: Integer;
  IdAjusteEfectuado : TTableId;
begin
  if IsDatosValidosBaja() then
    if MsgBox( '¿Desea dar de baja los ajustes seleccionados?', MB_ICONQUESTION + MB_YESNO, sPantalla ) = IDYES then
      begin
        BeginTrans(true);
        try
          for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
              sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
              IdAjusteEfectuado := sdqConsulta.FieldByName( 'ae_id' ).AsInteger;
              sSql := 'UPDATE EMI.IAE_AJUSTEEFECTUADO   ' +
                      '   SET AE_FECHABAJA = SYSDATE,     ' +
                      '       AE_USUBAJA   = SYS_CONTEXT(''USERENV'', ''OS_USER'') ' +
                      ' WHERE AE_ID = ' + SqlValue( IdAjusteEfectuado );
              EjecutarSqlST( sSql );
          end;
          CommitTrans(true);
          MsgBox( 'Los Ajustes se eliminaron correctamente.', MB_ICONINFORMATION, sPantalla );

          tbRefrescarClick( nil );
        except
          on E: Exception do
            begin
              RollBack(true);

              Raise Exception.Create ( E.Message + CRLF + 'Error al eliminar los ajustes.' );
            end;
        end;
      end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.Do_Limpiar;
begin

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.ClearControls;
begin
  Do_Limpiar;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.LoadControls;
begin

end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.DoABM: Boolean;
begin

end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.Validar: Boolean;
begin

end;
{----------------------------------------------------------------------------------------------------------------------}

procedure TfrmConsultaAjustesPorConcepto.btnLimpiarClick(Sender: TObject);
begin
  Do_Limpiar;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.btnGuardarClick(Sender: TObject);
begin

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.fpAbmEnter(Sender: TObject);
begin

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.btnSalirClick(Sender: TObject);
begin

end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.IsDatosValidosAprobacion: Boolean;
var
  i: Integer;
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un movimiento.');

  for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));

      Verificar(not sdqConsulta.FieldByName('ae_usuaprobacion').IsNull, nil, 'Uno de los ajustes ya ha sido aprobado.');

      if not Seguridad.Claves.IsActive('SuperAprobador') then
        Verificar(sdqConsulta.FieldByName( 'ae_usualta' ).AsString = Sesion.UserID, nil,
                  'Uno de los ajustes fue generado por el usuario ' + Sesion.Usuario + '.' + #13 +
                  'No tiene permiso para aprobar un movimiento generado por Ud. mismo.');
    end;

  Result := True;
end;
{--------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.GetMovimientosSeleccionados : string;
var
 i : integer;
begin
  result := '';
  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
      sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
      result := result + ',' + SqlValue( sdqConsulta.FieldByName( 'ID' ).AsInteger);
  end;
end;
{--------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.Do_ProcesarMovConPeriodosConciliados: Boolean;
var
  i : integer;
begin
  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
    if not ConfirmarSeleccion(sdqConsulta.FieldByName('AE_ID').AsInteger) then
      Grid.SelectedRows.CurrentRowSelected := False;
  end;
  result := true;
end;

function TfrmConsultaAjustesPorConcepto.ConfirmarSeleccion(AIdAJuste : integer) : boolean;
var
   sSql, sPeriodo, sDescrPerConciliado, sRazonSocial, sMensaje: String;
  iContrato: Integer;

begin
  sSql := 'SELECT IMM.MM_CONTRATO CONTRATO, IMM.MM_PERIODO PERIODO, ' +
                 'EM_NOMBRE RAZONSOCIAL ' +
            'FROM AEM_EMPRESA, ACO_CONTRATO, ZRC_RESUMENCOBRANZA, ' +
                 'EMI.IMM_MOVIMIENTOMANUAL IMM ' +
           'WHERE  ' +
             '    IMM.MM_IDAJUSTEEFECTUADO = ' + SqlValue(AIdAJuste) +
             'AND IMM.MM_CONTRATO=RC_CONTRATO(+) ' +
             'AND IMM.MM_PERIODO=RC_PERIODO(+) ' +
             'AND RC_MARCACONCILIADO IS NOT NULL ' +
             'AND IMM.MM_CONTRATO=CO_CONTRATO ' +
             'AND CO_IDEMPRESA=EM_ID ' +
        'GROUP BY IMM.MM_CONTRATO, IMM.MM_PERIODO, EM_NOMBRE';

  with GetQuery(sSql) do
  try
    if RecordCount > 0 then
    begin
      iContrato           := FieldByName( 'CONTRATO' ).AsInteger;
      sPeriodo            := FieldByName( 'PERIODO' ).AsString;
      sRazonSocial        := FieldByName( 'RAZONSOCIAL' ).AsString;
      sDescrPerConciliado := Get_DescrPerConciliado(iContrato, sPeriodo);

      sMensaje := 'Para el contrato ' + IntToStr( iContrato ) + ' (' + sRazonSocial + ')' +
                  ', el periodo ' + FormatPeriodo( sPeriodo ) + ' ya se encuentra conciliado (' + sDescrPerConciliado + ').' + CRLF +
                  '¿Confirma el alta de TODOS los movimientos, para dicho contrato y periodo? ' +
                  '(en caso contrario, ninguno de tales movimientos será procesado)';
      result := MsgBox( sMensaje, MB_ICONQUESTION+MB_YESNO, sPantalla ) = ID_YES;
    end else result := true;
  finally
     free;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.Get_CantRegistrosAprobar: Integer;
var
  sSql: String;
begin
  Result := Grid.SelectedRows.Count;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.Do_InsertarMovimientos: Boolean;
var
  i : integer;
begin
  for i := 0 to Grid.SelectedRows.Count - 1 do
  begin
    sdqConsulta.GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
    Do_ConfirmarAjuste(sdqConsulta.FieldByName('AE_ID').AsInteger);
  end;
  result := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.tbAprobarClick(Sender: TObject);
var
  iCantRegAprobar: Integer;
begin
  if IsDatosValidosAprobacion() then
    if MsgBox( '¿Confirma la aprobación de ' + IntToStr( Grid.SelectedRows.Count ) +
               ' movimiento/s?', MB_ICONQUESTION + MB_OKCANCEL, sPantalla ) = IDOK then
      begin
        if Do_ProcesarMovConPeriodosConciliados then
          begin
            iCantRegAprobar := Get_CantRegistrosAprobar;

            if iCantRegAprobar = 0 then
              MsgBox( 'De los registros seleccionados, ninguno ha sido confirmado...', MB_ICONINFORMATION, sPantalla )
            else if MsgBox( '¿Confirma la APROBACION de ' + IntToStr( iCantRegAprobar ) + ' registro/s de movimiento/s?', MB_ICONQUESTION+MB_YESNO, sPantalla ) = ID_YES then
              begin
                BeginTrans;
                try
                  if Do_InsertarMovimientos then
                  begin
                    CommitTrans;
                    MsgBox( 'Los ajustes se aprobaron correctamente.', MB_ICONINFORMATION, sPantalla );
                    tbRefrescarClick( nil );
                  end;
                except
                  on E: Exception do
                    begin
                      RollBack;
                      Raise Exception.Create ( E.Message + CRLF + 'Error al aprobar los movimientos.' );
                    end;
                end;
              end;
          end;
      end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.mnuMarcarTodosClick(Sender: TObject);
begin
  Grid.SelectAll;
  CalcularFilasSel;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.mnuDesmarcarTodosClick(Sender: TObject);
begin
  Grid.UnselectAll;
  InicializarContadores( False );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.GridCellClick(Column: TColumn);
begin
  CalcularFilasSel;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.CalcularFilasSel;
begin
{  SumBookmarkFields( sdqConsulta, Grid.SelectedRows, CAMPOS_SUMA, TotalRegSeleccionados );
}
  sb.Panels[1].Text :=  'Cantidad Contratos: ' + IntToStr(sdqConsulta.RecordCount);
  sb.Panels[2].Text :=  'Seleccionados: ' + IntToStr(Grid.SelectedRows.Count);

//  edTotalImpContratos.Value := TotalRegSeleccionados[0];


end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.GridKeyUp(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
  CalcularFilasSel;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.tbOrdenarClick(Sender: TObject);
begin
  inherited;

  InicializarContadores( False );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAjustesPorConcepto.InicializarContadores(ActualizarTotales: Boolean);
begin
  sb.Panels[1].Text :=  'Cantidad Contratos: 0';
  sb.Panels[2].Text :=  'Seleccionados: 0';

  if ActualizarTotales then
    CalcTotales;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmConsultaAjustesPorConcepto.ValidarCoberturaPeriodo(Contrato: Integer; Cuit, Periodo: String): Boolean;
var
  sSql: String;
  iContratoVigente: Integer;
begin
{  sSql := 'SELECT COBRANZA.Check_Cobertura_PeriodoCobranz(:Contrato, :Periodo)' +
            'FROM DUAL';

  if ValorSqlIntegerEx(sSql, [Contrato, Periodo]) = 1 then
    Result := True
  else
    begin
      sSql := 'SELECT AFILIACION.GET_CONTRATOVIGENTE(' + SqlValue( Cuit ) + ', ' + SqlValue( Periodo ) + ') ' +
                'FROM DUAL';

      iContratoVigente := ValorSqlInteger( sSql );


      if iContratoVigente = 0 then
        InvalidMsg( ppfpMM_PERIODO, 'El período indicado no corresponde a ningún contrato de la empresa.' )
      else if iContratoVigente = Contrato then
        InvalidMsg( ppfpMM_PERIODO, 'Para el período indicado, el contrato no se encuentra activo.' )
      else
        InvalidMsg( ppfpMM_PERIODO, 'El período indicado corresponde al contrato ' + IntToStr( iContratoVigente ) + '.' );

      Result := False;
    end;
}
end;

procedure TfrmConsultaAjustesPorConcepto.tbVistaPreviaClick(Sender: TObject);
begin
  Verificar(Grid.SelectedRows.Count = 0, nil, 'Debe seleccionar al menos un ajuste');

  with TfrmMovimientosVistaPrevia.Create(Self) do
  begin
    Contrato := Self.sdqConsulta.FieldByName('CONTRATO').AsInteger;
    Periodo  := Self.sdqConsulta.FieldByName('PERIODO').AsString;
    ShowModal;
  end;
end;

procedure TfrmConsultaAjustesPorConcepto.tbImpoExpoClick(Sender: TObject);
var
  dFecha: TDateTime;
begin
{  dFecha := DBDateTime;
  if ImpoExpoWizard('CMMOV') then
  begin
    tbLimpiarClick(nil);
    edMM_FECHAALTADesde.Date := dFecha;
    tbRefrescarClick(nil);
  end;
}
end;

procedure TfrmConsultaAjustesPorConcepto.mnuAyudaClick(Sender: TObject);
begin
  MostrarAyuda('Ayuda - Importación de Movimientos Manuales', 'Cobranzas - Carga Manual de Movimientos.rtf');
end;

procedure TfrmConsultaAjustesPorConcepto.tbEstadoClick(Sender: TObject);
begin
  inherited;
  if not edEstado.Visible then
  begin
    edEstado.Height := 0;
    edEstado.Visible := not edEstado.Visible;
    while edEstado.Height <= ((edEstado.Lines.Count * ALTURA_RENGLON) + StrToInt(iif(edEstado.Lines.Count = 0, 0, 8))) do
      edEstado.Height := edEstado.Height + 1;
  end else
  begin
    while edEstado.Height > 0 do
      edEstado.Height := edEstado.Height - 1;
    edEstado.Visible := not edEstado.Visible;
  end;
end;

procedure TfrmConsultaAjustesPorConcepto.sdqConsultaAfterScroll(DataSet: TDataSet);
begin
  if Grid.SelectedRows.Count > 1 then
    tbEstado.Enabled := False
  else
    tbEstado.Enabled := True;

  if edEstado.Visible then
    ReAjustarEstado;
end;

procedure TfrmConsultaAjustesPorConcepto.ReAjustarEstado;
begin
  while edEstado.Height <= ((edEstado.Lines.Count * ALTURA_RENGLON) + StrToInt(iif(edEstado.Lines.Count = 0, 0, 8))) do
    edEstado.Height := edEstado.Height + 1;

  while edEstado.Height > ((edEstado.Lines.Count * ALTURA_RENGLON) + StrToInt(iif(edEstado.Lines.Count = 0, 0, 8))) do
    edEstado.Height := edEstado.Height - 1;
end;

procedure TfrmConsultaAjustesPorConcepto.frafpMM_CONTRATOExit(Sender: TObject);
var
  sSQL, sEstado: string;
begin
  inherited;
  fraContrato.FrameExit(Sender);

  if fraContrato.IsSelected then
  begin
    sSQL := 'SELECT ' + SQL_ESTADO +
             ' FROM AEM_EMPRESA, ACO_CONTRATO' +
            ' WHERE CO_IDEMPRESA = EM_ID' +
              ' AND CO_CONTRATO = :CONTRATO';

    sEstado := ValorSQLEx(sSQL, [fraContrato.Contrato]);

    if sEstado > '' then
      InfoHint(fraContrato.edContrato, sEstado, False, 'Información', blnInfo, 5, False);
  end;
end;

procedure TfrmConsultaAjustesPorConcepto.tbPropiedadesClick(
  Sender: TObject);
begin
//  inherited;
   with TFrmAjustePorConceptos.Create(self) do
   try
     MostrarDetalle(sdqConsulta.FieldByName( 'ae_id' ).AsInteger);
   finally
     free;
   end;
end;

procedure TfrmConsultaAjustesPorConcepto.fraContratoExit(Sender: TObject);
var
  sSQL, sEstado: string;
begin
  inherited;
  fraContrato.FrameExit(Sender);

  if fraContrato.IsSelected then
  begin
    sSQL := 'SELECT ' + SQL_ESTADO +
             ' FROM AEM_EMPRESA, ACO_CONTRATO' +
            ' WHERE CO_IDEMPRESA = EM_ID' +
              ' AND CO_CONTRATO = :CONTRATO';

    sEstado := ValorSQLEx(sSQL, [fraContrato.Contrato]);

    if sEstado > '' then
      InfoHint(fraContrato.edContrato, sEstado, False, 'Información', blnInfo, 5, False);
  end;
end;


procedure TfrmConsultaAjustesPorConcepto.tbNuevoClick(Sender: TObject);
begin
//  inherited;
  with TFrmAjustePorConceptos.Create(self) do
  try
    NuevoAjustePorConcepto;
    tbRefrescarClick( nil );
  finally
    free;
  end;
end;

procedure TfrmConsultaAjustesPorConcepto.tbModificarClick(Sender: TObject);
begin

  if UpperCase(sdqConsulta.FieldByName('ae_usualta').asstring) = UpperCase(sesion.LoginName) then
  begin
    with TFrmAjustePorConceptos.Create(self) do
    try
      ModificarAjustePorConcepto(sdqConsulta.FieldByName('ae_id').asinteger);
    finally
      tbRefrescarClick( nil );    
      free;
    end;
  end else
   MessageDlg('Solo el usuario que generó el ajuste puede modificarlo.', mtError, [mbOK], 0);
end;

function TfrmConsultaAjustesPorConcepto.Do_ActualizarAprobacionRegSeleccionados: Boolean;
begin

end;

procedure TfrmConsultaAjustesPorConcepto.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('ae_fechabaja').IsNull Then
    AFont.Color := clRed;

  if not Field.DataSet.FieldByName('ae_fechaaprobacion').IsNull Then
    AFont.Color := clBlue;
end;

procedure TfrmConsultaAjustesPorConcepto.FSFormShow(Sender: TObject);
begin
  inherited;
   tbSeparadorFinal.Left := 440;
   tbSalir.Left := 448;
end;

end.

