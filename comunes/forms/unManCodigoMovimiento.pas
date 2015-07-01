unit unManCodigoMovimiento;
{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   29-08-03
 ULTIMA MODIFICACION: 29-08-03
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomGridABM, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid,
  ComCtrls, ToolWin, unArtFrame, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unComunes, unArtDBAwareFrame;

type
  TfrmManCodigoMovimiento = class(TfrmCustomGridABM)
    Label1: TLabel;
    edCM_CODIGO: TEdit;
    Label2: TLabel;
    edCM_DESCRIPCION: TEdit;
    Label3: TLabel;
    edCM_DETALLE: TMemo;
    gbCM_COMISIONABLE: TGroupBox;
    rbComisionable: TRadioButton;
    rbNoComisionable: TRadioButton;
    fraCM_OPERACION: TfraStaticCTB_TABLAS;
    Label4: TLabel;
    fraCM_CONCEPTO: TfraStaticCTB_TABLAS;
    Label5: TLabel;
    fraCM_LIBRO: TfraStaticCTB_TABLAS;
    Label6: TLabel;
    Label7: TLabel;
    edfCM_CODIGO: TEdit;
    Label8: TLabel;
    edfCM_DESCRIPCION: TEdit;
    gbComisionable: TGroupBox;
    rbfComisionable: TRadioButton;
    rbfNoComisionable: TRadioButton;
    frafCM_OPERACION: TfraStaticCTB_TABLAS;
    Label10: TLabel;
    frafCM_CONCEPTO: TfraStaticCTB_TABLAS;
    Label11: TLabel;
    frafCM_LIBRO: TfraStaticCTB_TABLAS;
    Label12: TLabel;
    gbEstado: TGroupBox;
    rbEstadoSoloActivos: TRadioButton;
    rbEstadoTodos: TRadioButton;
    rbTodos: TRadioButton;
    gbCM_ESMOVIMIENTOINTERNO: TGroupBox;
    rbEsMovimientoInterno: TRadioButton;
    rbNoEsMovimientoInterno: TRadioButton;
    gbCM_PERFIL: TGroupBox;
    rbPerfilCobranza: TRadioButton;
    rbPerfilEmision: TRadioButton;
    rbPerfilAmbos: TRadioButton;
    gbCM_TRANSFERENCIA: TGroupBox;
    rbConTransferencia: TRadioButton;
    rbSinTransferencia: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
  private
    FArea: TAreas;
    psEspecial: String;
    procedure SetArea(const Value: TAreas);
    procedure HabilitarMenuPrincipal(bHabilitar: Boolean);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    property Area: TAreas     Read FArea     Write SetArea;
  end;

var
  frmManCodigoMovimiento: TfrmManCodigoMovimiento;

implementation
{$R *.DFM}
Uses
  unPrincipal, VCLExtra, CustomDlgs, undmPrincipal, AnsiSql;
  
procedure TfrmManCodigoMovimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmManCodigoMovimiento := nil;

  HabilitarMenuPrincipal( True );
end;

procedure TfrmManCodigoMovimiento.FormCreate(Sender: TObject);
begin
  inherited;
  ShowActived := False;

  fraCM_OPERACION.Clave := 'TOPER';
  frafCM_OPERACION.Clave := 'TOPER';
  fraCM_CONCEPTO.Clave := 'TCONC';
  frafCM_CONCEPTO.Clave := 'TCONC';
  fraCM_LIBRO.Clave := 'TLIBR';
  frafCM_LIBRO.Clave := 'TLIBR';
  FieldBaja := 'CM_FECHABAJA';
end;

procedure TfrmManCodigoMovimiento.tbRefrescarClick(Sender: TObject);
var
  sSql: string;
  sWhere: string;
begin
  sSql := 'SELECT CM_CODIGO, CM_DESCRIPCION, CM_COMISIONABLE, CM_DETALLE, OPER.TB_DESCRIPCION OPERACION,' +
          '       CONC.TB_DESCRIPCION CONCEPTO, LIBRO.TB_DESCRIPCION LIBRO, CM_CONCEPTO, CM_LIBRO, ' +
          '       CM_OPERACION, CM_FECHABAJA, CM_ID, CM_ESMOVIMIENTOINTERNO, CM_PERFIL, CM_TRANSFERENCIA, ' +
          '       DECODE(CM_PERFIL, ''C'', ''Cobranza'', ''E'', ''Emisión'', ''Ambos'') PERFIL ' +
          '  FROM CTB_TABLAS CONC, CTB_TABLAS OPER, ZCM_CODIGOMOVIMIENTO, CTB_TABLAS LIBRO' +
          ' WHERE CM_OPERACION=OPER.TB_CODIGO' +
          '   AND OPER.TB_CLAVE=''TOPER''' +
          '   AND OPER.TB_ESPECIAL1=' + SqlValue( psEspecial ) +
          '   AND CM_CONCEPTO=CONC.TB_CODIGO' +
          '   AND CONC.TB_CLAVE=''TCONC''' +
          '   AND CM_LIBRO=LIBRO.TB_CODIGO(+)' +
          '   AND LIBRO.TB_CLAVE(+)=''TLIBR''';

  sWhere := '';
  if Trim(edfCM_CODIGO.Text) <> '' then
    sWhere := sWhere + ' AND CM_CODIGO LIKE ''' + Trim(edfCM_CODIGO.Text) + '%''';
  if Trim(edfCM_DESCRIPCION.Text) <> '' then
    sWhere := sWhere + ' AND UPPER(CM_DESCRIPCION) LIKE ''' + Trim(edfCM_DESCRIPCION.Text) + '%''';
  if not frafCM_OPERACION.IsEmpty then
    sWhere := sWhere + ' AND CM_OPERACION = ''' + frafCM_OPERACION.Value + '''';
  if not frafCM_CONCEPTO.IsEmpty then
    sWhere := sWhere + ' AND CM_CONCEPTO = ''' + frafCM_CONCEPTO.Value + '''';
  if not frafCM_LIBRO.IsEmpty then
    sWhere := sWhere + ' AND CM_LIBRO = ''' + frafCM_LIBRO.Value + '''';
  if rbfComisionable.Checked then
    sWhere := sWhere + ' AND CM_COMISIONABLE = ''S''';
  if rbfNoComisionable.Checked then
    sWhere := sWhere + ' AND CM_COMISIONABLE = ''N''';
  if rbEstadoSoloActivos.Checked then
    sWhere := sWhere + ' AND CM_FECHABAJA IS NULL';

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

procedure TfrmManCodigoMovimiento.ClearControls;
begin
  edCM_CODIGO.Clear;
  edCM_DESCRIPCION.Clear;
  edCM_DETALLE.Clear;

  rbComisionable.Checked   := False;
  rbNoComisionable.Checked := False;

  rbConTransferencia.Checked := False;
  rbSinTransferencia.Checked := False;

  fraCM_OPERACION.Clear;
  fraCM_CONCEPTO.Clear;
  fraCM_LIBRO.Clear;
  rbNoEsMovimientoInterno.Checked := True;
  rbPerfilAmbos.Checked           := True;
end;

procedure TfrmManCodigoMovimiento.LoadControls;
begin
  edCM_CODIGO.Text := sdqConsulta.FieldByName ( 'CM_CODIGO').AsString;
  edCM_DESCRIPCION.Text := sdqConsulta.FieldByName ( 'CM_DESCRIPCION').AsString;
  edCM_DETALLE.Text := sdqConsulta.FieldByName ( 'CM_DETALLE').AsString;
  fraCM_OPERACION.Value := sdqConsulta.FieldByName ( 'CM_OPERACION').AsString;
  fraCM_CONCEPTO.Value := sdqConsulta.FieldByName ( 'CM_CONCEPTO').AsString;
  fraCM_LIBRO.Value := sdqConsulta.FieldByName ( 'CM_LIBRO').AsString;

  if sdqConsulta.FieldByName ( 'CM_COMISIONABLE' ).AsString = 'S' then
    rbComisionable.Checked := True
  else
    rbNoComisionable.Checked := True;

  if sdqConsulta.FieldByName ( 'CM_TRANSFERENCIA' ).AsString = 'S' then
    rbConTransferencia.Checked := True
  else
    rbSinTransferencia.Checked := True;

  if sdqConsulta.FieldByName ( 'CM_ESMOVIMIENTOINTERNO' ).AsString = 'S' then
    rbEsMovimientoInterno.Checked := True
  else
    rbNoEsMovimientoInterno.Checked := True;

  if sdqConsulta.FieldByName ( 'CM_PERFIL' ).AsString = 'C' then
    rbPerfilCobranza.Checked := True
  else if sdqConsulta.FieldByName( 'CM_PERFIL' ).AsString = 'E' then
    rbPerfilEmision.Checked := True
  else
    rbPerfilAmbos.Checked := True;
end;

function TfrmManCodigoMovimiento.Validar : Boolean;
  procedure ErrorMensaje ( Componente: TWinControl; Mensaje: string );
  begin
    Result := False;
    Componente.SetFocus;
    MessageDlg(Mensaje, mtWarning, [mbOK], 0);
    Abort;
  end;
begin
  Result := True;

  if Trim(edCM_CODIGO.Text) = '' then
    ErrorMensaje ( edCM_CODIGO, 'El número de código es obligatorio.' );

  if Trim(edCM_DESCRIPCION.Text) = '' then
    ErrorMensaje ( edCM_DESCRIPCION, 'El nombre es obligatorio.' );

  if Trim(edCM_DETALLE.Text) = '' then
    ErrorMensaje ( edCM_DETALLE, 'El detalle es obligatorio.' );

  if ((not rbComisionable.Checked) and (not rbNoComisionable.Checked)) then
    ErrorMensaje ( gbCM_COMISIONABLE, 'El código comisionable es obligatorio.' );

  if ((not rbConTransferencia.Checked) and (not rbSinTransferencia.Checked)) then
    ErrorMensaje ( gbCM_TRANSFERENCIA, 'Debe indicar si el código corresponde o no a una transferencia.' );

  if fraCM_OPERACION.IsEmpty then
    ErrorMensaje ( fraCM_OPERACION, 'La operación es obligatoria.' );

  if fraCM_CONCEPTO.IsEmpty then
    ErrorMensaje ( fraCM_CONCEPTO, 'El concepto es obligatorio.' );

  if rbEsMovimientoInterno.Checked and (((fraCM_OPERACION.edCodigo.Text <> 'C') and (fraCM_OPERACION.edCodigo.Text <> 'R')) or (fraCM_CONCEPTO.edCodigo.Text <> 'C')) then  // mov. interno y cobranza/recupero de cuota
    ErrorMensaje ( rbEsMovimientoInterno, 'Si el movimiento es interno, entonces la operación debe ser Cobranza/Recupero y el concepto Cuota.' );
end;

function TfrmManCodigoMovimiento.DoABM: Boolean;
begin
  Result := True;
  Sql.Clear;
  Sql.TableName := 'ZCM_CODIGOMOVIMIENTO';
  BeginTrans;
  try
    //Siempre esta en modo alta
    Sql.PrimaryKey.Add ( 'CM_ID', 'SEQ_ZCM_ID.NEXTVAL', False);
    Sql.Fields.Add( 'CM_CODIGO', edCM_CODIGO.Text);
    Sql.Fields.Add( 'CM_DESCRIPCION', edCM_DESCRIPCION.Text);
    Sql.Fields.Add( 'CM_DETALLE', edCM_DETALLE.Lines.Text);
    Sql.Fields.Add( 'CM_OPERACION', fraCM_OPERACION.Value);
    Sql.Fields.Add( 'CM_CONCEPTO', fraCM_CONCEPTO.Value);
    Sql.Fields.Add( 'CM_LIBRO', fraCM_LIBRO.Value);
    Sql.Fields.Add( 'CM_FECHAALTA', SQL_ACTUALDATE, False);
    Sql.Fields.Add( 'CM_USUALTA', frmPrincipal.DBLogin.UserID);

    if rbComisionable.Checked then
      Sql.Fields.Add( 'CM_COMISIONABLE', 'S')
    else
      Sql.Fields.Add( 'CM_COMISIONABLE', 'N');

    if rbConTransferencia.Checked then
      Sql.Fields.Add( 'CM_TRANSFERENCIA', 'S')
    else
      Sql.Fields.Add( 'CM_TRANSFERENCIA', 'N');

    if rbEsMovimientoInterno.Checked then
      Sql.Fields.Add( 'CM_ESMOVIMIENTOINTERNO', 'S')
    else
      Sql.Fields.Add( 'CM_ESMOVIMIENTOINTERNO', 'N');

    if rbPerfilCobranza.Checked then
      Sql.Fields.Add( 'CM_PERFIL', 'C')
    else if rbPerfilEmision.Checked then
      Sql.Fields.Add( 'CM_PERFIL', 'E')
    else
      Sql.Fields.Add( 'CM_PERFIL', 'A');

    EjecutarSqlST ( Sql.Sql );

    CommitTrans;
    MessageDlg('Los datos se han guardado correctamente.', mtInformation, [mbOK], 0);
  except
    on E:Exception do
    begin
      Rollback;
      Raise Exception.Create( E.Message );
    end;
  end;
end;

procedure TfrmManCodigoMovimiento.tbEliminarClick(Sender: TObject);
var
  sSql: string;
begin
  if (msgbox('Está seguro que quiere dar de baja el registro?', MB_YESNO, 'Confirmación') = mrYes) then
  begin
    sSql := 'UPDATE ZCM_CODIGOMOVIMIENTO ' +
            '   SET CM_USUBAJA = ''' + frmPrincipal.DBLogin.UserID + ''', ' +
            '       CM_FECHABAJA = ' + SQL_ACTUALDATE +
            ' WHERE CM_ID = ' + sdqConsulta.FieldByName( 'CM_ID' ).AsString;
    EjecutarSql ( sSql );
    RefreshData;
  end;
end;

procedure TfrmManCodigoMovimiento.GridDblClick(Sender: TObject);
begin
  VCLExtra.LockControls( fpABM, True );
  VCLExtra.LockControls( btnCancelar, False );
  LoadControls;
  fpABM.ShowModal;
end;

procedure TfrmManCodigoMovimiento.tbNuevoClick(Sender: TObject);
begin
  VCLExtra.LockControls( fpABM, False );
  inherited;
end;

procedure TfrmManCodigoMovimiento.SetArea(const Value: TAreas);
begin
  if FArea <> Value then
    begin
      FArea := Value;

      case FArea of
        aEmision:
          psEspecial := 'EMIS';

        aCobranzas:
          psEspecial := 'COBR';
      end;

      fraCM_OPERACION.Especial1 := psEspecial;
    end;
end;

procedure TfrmManCodigoMovimiento.HabilitarMenuPrincipal(bHabilitar: Boolean);
begin
  case FArea of
    {$IFNDEF COBRANZAS}
    aEmision:
      frmPrincipal.mnuManEmisCodigodeMovimiento.Enabled := bHabilitar;
    {$ENDIF}  
    aCobranzas:
      frmPrincipal.mnuManCodigodeMovimiento.Enabled     := bHabilitar;
  end;
end;

end.
