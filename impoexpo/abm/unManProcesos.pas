unit unManProcesos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, PatternEdit, unArtFrame, unFraCodigoDescripcion,
  FormPanel, Grids, DBGrids, RXDBCtrl, unCustomAccionABM, unFraCtbTablas, unfraUsuarios, Mask, unArtDBAwareFrame,
  ImgList;

type
  TfrmManProcesos = class(TfrmCustomPanelABM)
    fraProceso: TfraCodigoDescripcion;
    Label1: TLabel;
    PageControl: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsAcciones: TTabSheet;
    tsParametros: TTabSheet;
    edCodigo: TPatternEdit;
    Label2: TLabel;
    Label4: TLabel;
    edCondicion: TEdit;
    Label5: TLabel;
    edDescripcion: TEdit;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbAccNuevo: TToolButton;
    tbAccModificar: TToolButton;
    tbAccEliminar: TToolButton;
    tbAccMoverAbajo: TToolButton;
    tbAccMoverArriba: TToolButton;
    ToolButton9: TToolButton;
    tbAccImprimir: TToolButton;
    dbgAcciones: TRxDBGrid;
    fpAcciones: TFormPanel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel3: TBevel;
    cmbAccTipo: TComboBox;
    fraProcesoArchivo: TfraCodigoDescripcion;
    chkOpcional: TCheckBox;
    btnAccAceptar: TButton;
    btnAccCancelar: TButton;
    sdqAcciones: TSDQuery;
    dsAcciones: TDataSource;
    fpParametros: TFormPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    fraParaTipoDato: TfraCtbTablas;
    edParaCodigo: TPatternEdit;
    edParaDescripcion: TEdit;
    btnParaAceptar: TButton;
    btnParaCancelar: TButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbParaNuevo: TToolButton;
    tbParaModificar: TToolButton;
    tbParaEliminar: TToolButton;
    ToolButton7: TToolButton;
    tbParamMoverArriba: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    dbgParametros: TRxDBGrid;
    sdqParametros: TSDQuery;
    dsParametros: TDataSource;
    Label19: TLabel;
    cmbAccTipoArchivo: TComboBox;
    Label3: TLabel;
    cmbModoLectura: TComboBox;
    tsUsuarios: TTabSheet;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    tbUsuNuevo: TToolButton;
    tbUsuEliminar: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    sdqUsuarios: TSDQuery;
    dsUsuarios: TDataSource;
    dbgUsuarios: TRxDBGrid;
    fpUsuarios: TFormPanel;
    Label8: TLabel;
    Bevel2: TBevel;
    btnUsuAceptar: TButton;
    btnUsuCancelar: TButton;
    fraUsuario: TfraUsuario;
    tbParamMoverAbajo: TToolButton;
    tbSintaxisCheck: TToolButton;
    ToolButton3: TToolButton;
    chkParaVisible: TCheckBox;
    Label12: TLabel;
    ToolButton2: TToolButton;
    tbEjecutar: TToolButton;
    tbSalir2: TToolButton;
    ToolButton5: TToolButton;
    ToolBar4: TToolBar;
    tbAccNuevoProcArch: TToolButton;
    tbAccModificarProcArch: TToolButton;
    ilColor: TImageList;
    ilByN: TImageList;
    procedure FSFormCreate(Sender: TObject);
    procedure tbAccNuevoClick(Sender: TObject);
    procedure cmbAccTipoChange(Sender: TObject);
    procedure tbAccModificarClick(Sender: TObject);
    procedure tbAccEliminarClick(Sender: TObject);
    procedure btnAccAceptarClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure tbParaNuevoClick(Sender: TObject);
    procedure tbParaModificarClick(Sender: TObject);
    procedure tbParaEliminarClick(Sender: TObject);
    procedure dbgParametrosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnParaAceptarClick(Sender: TObject);
    procedure tbUsuNuevoClick(Sender: TObject);
    procedure tbUsuEliminarClick(Sender: TObject);
    procedure btnUsuAceptarClick(Sender: TObject);
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tbAccMoverClick(Sender: TObject);
    procedure sdqAccionesAfterScroll(DataSet: TDataSet);
    procedure tbParamMoverClick(Sender: TObject);
    procedure sdqParametrosAfterScroll(DataSet: TDataSet);
    procedure tbSintaxisCheckClick(Sender: TObject);
    procedure tbEjecutarClick(Sender: TObject);
    procedure tbAccNuevoProcArchClick(Sender: TObject);
    procedure tbAccModificarProcArchClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
  private
    DefParamEditor: TWinControl;

    function GetAccionABMClass: TfrmCustomAccionABMClass;

    procedure OnFraProcesoArchivoChange(Sender: TObject);
    procedure OnFraProcesoChange(Sender: TObject);
    procedure OnFraTipoDatoParametroChange(Sender: TObject);
  public
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls(ClearPK: Boolean = False); override;
    procedure LoadControls; override;
    procedure LockControls(ALocked: Boolean = True); override;    
    procedure LoadGrids;
  end;

{
var
  frmManProcesos: TfrmManProcesos;
}

const
  PAG_GENERAL    = 0;
  PAG_ACCIONES   = 1;
  PAG_PARAMETROS = 2;
  PAG_USUARIOS   = 3;

implementation

uses
  unDmPrincipal, General, StrFuncs, AnsiSql, SqlFuncs, CustomDlgs, EditDialog, unImpoExpo, DBSql, Consts,
  unParams, unImpoExpoWizard, unManArchivosExp, unManProcesosOracle, unImpoExpoUtils,
  unSesion;

{$R *.DFM}

{ TfrmManProcesos }
procedure TfrmManProcesos.FSFormCreate(Sender: TObject);
begin
  inherited;

  with fraProceso do
  begin
    OnChange      := OnFraProcesoChange;
    TableName     := 'IPR_PROCESO';
    FieldID       := 'PR_ID';
    FieldCodigo   := 'PR_CODIGO';
    FieldDesc     := 'PR_DESCRIPCION';
    FieldBaja     := 'PR_FECHABAJA';
    CaseSensitive := False;
    ShowBajas     := True;
  end;

  fraParaTipoDato.Clave := 'TDAT';
  fraParaTipoDato.OnChange := OnFraTipoDatoParametroChange;

  fraProcesoArchivo.OnChange := OnFraProcesoArchivoChange;

  ClearControls(True);

  UnTouch := TList.Create ;
  UnTouch.Add(tbAccMoverArriba);
  UnTouch.Add(tbAccMoverAbajo);
  UnTouch.Add(tbParamMoverAbajo);
  UnTouch.Add(tbParamMoverArriba);
end;

procedure TfrmManProcesos.ClearControls(ClearPK: Boolean);
begin
  inherited;

  if ClearPK then
    fraProceso.Clear ;

  edCodigo.Text            := '';
  edDescripcion.Text       := '';
  edCondicion.Text         := '';
  cmbModoLectura.ItemIndex := 1;
  tbEjecutar.Enabled := False;

  PageControl.ActivePageIndex := PAG_GENERAL;

  sdqAcciones.Close;
  sdqParametros.Close;
  sdqUsuarios.Close;
end;

function TfrmManProcesos.DoABM: Boolean;
var
  Sql: TDBSql;
begin
  Sql := TDBSql.Create('IPR_PROCESO');
  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('PR_ID', fraProceso.Value);
      Sql.Fields.Add('PR_USUBAJA', Sesion.UserId);
      Sql.Fields.Add('PR_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.Fields.Add('PR_CODIGO', edCodigo.Text);
      Sql.Fields.Add('PR_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('PR_PARAMETOSCONDICION', edCondicion.Text);
      Sql.Fields.Add('PR_MODOLECTURA', Copy(PML_PATH + PML_FILES +  PML_ZIP, cmbModoLectura.ItemIndex + 1, 1));

      case ModoABM of
        maAlta:
        begin
          Sql.PrimaryKey.Add('PR_ID', IncSql('SELECT MAX(PR_ID) FROM IPR_PROCESO'));//'SEQ_IPR_ID.NEXTVAL', False);
          Sql.Fields.Add('PR_USUALTA',   Sesion.UserId);
          Sql.Fields.Add('PR_FECHAALTA', SQL_ACTUALDATE, False);
          Sql.SqlType := stInsert;
        end;

        maModificacion:
        begin
          Sql.PrimaryKey.Add('PR_ID',     fraProceso.Value);
          Sql.Fields.Add('PR_USUMODIF',   Sesion.UserId);
          Sql.Fields.Add('PR_FECHAMODIF', exDateTime);
          Sql.Fields.Add('PR_USUBAJA',    exNull);
          Sql.Fields.Add('PR_FECHABAJA',  exNull);
          Sql.SqlType := stUpdate;
        end;
      end;
    end;

    try
      Sql.Execute; //EjecutarSql( Sql.Sql );
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        ErrorMsg(E);
      end;
    end;

    if Result then
      case ModoABM of
        maAlta:
        begin
          fraProceso.Value := Sql.PrimaryKey[0].Value;
          LoadGrids;
        end;

        maModificacion, maBaja:
          fraProceso.Reload;
//        maBaja:         ClearControls( True );
      end;
  finally
    Sql.Free;
  end;
end;

procedure TfrmManProcesos.LoadControls;
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByName('IdProceso').AsInteger := fraProceso.Value;
  sdqConsulta.Open;

  inherited;
  
  edCodigo.Text            := sdqConsulta.FieldByName('PR_CODIGO').AsString;
  edDescripcion.Text       := sdqConsulta.FieldByName('PR_DESCRIPCION').AsString;
//  cmbTipo.ItemIndex        := ArrayPos( sdqConsulta.FieldByName('PR_TIPO').AsString, ['I', 'E']);
  edCondicion.Text         := sdqConsulta.FieldByName('PR_PARAMETOSCONDICION').AsString;
  cmbModoLectura.ItemIndex := ArrayPos( sdqConsulta.FieldByName('PR_MODOLECTURA').AsString, [PML_PATH, PML_FILES, PML_ZIP]);

  LoadGrids;
end;

procedure TfrmManProcesos.LoadGrids;
begin
  sdqAcciones.Close;
//  sdqAcciones.ParamByName('pProceso').AsString := fraProceso.Value;
  sdqAcciones.Sql.Text := 'SELECT PA_ORDEN, PA_TIPOACCION, ''Ejecutar proceso'' AS TIPO, PS_DESCRIPCION AS DESC_RELACION, ' +
                                 'PA_RELACION, PA_OPCIONAL, PA_TIPOARCHIVO, ' +
                                 SqlDecodeStr('PA_TIPOARCHIVO', [ATA_READ, ATA_WRITE, ATA_QUERY], ['Lectura', 'Escritura', 'Consulta']) + ' AS TIPOARCHIVO, ' +
                                 SqlDecodeStr('PA_OPCIONAL', [SQL_TRUE], ['Sí'], 'No') + ' AS OPCIONAL, ' +
                                'PS_SQL SQL ' +
                           'FROM IPA_PROCESOACCION, IPS_PROCESOSERVER ' +
                          'WHERE PA_TIPOACCION = ''' + TA_PROCESS + ''' ' +
                            'AND PS_ID = PA_RELACION ' +
                            'AND PA_IDPROCESO = ' + SqlValue(fraProceso.Value) + ' ' +
                          'UNION ALL ' +
                         'SELECT PA_ORDEN, PA_TIPOACCION, ''Procesar Archivo'' AS TIPO, AR_DESCRIPCION AS DESC_RELACION, ' +
                                'PA_RELACION, PA_OPCIONAL, PA_TIPOARCHIVO, ' +
                                 SqlDecodeStr('PA_TIPOARCHIVO', [ATA_READ, ATA_WRITE, ATA_QUERY], ['Lectura', 'Escritura', 'Consulta']) + ' AS TIPOARCHIVO, ' +
                                 SqlDecodeStr('PA_OPCIONAL', [SQL_TRUE], ['Sí'], 'No') + ' AS OPCIONAL, ' +
                                'AR_SQL SQL ' +
                           'FROM IPA_PROCESOACCION, IAR_ARCHIVO ' +
                          'WHERE PA_TIPOACCION = ''' + TA_FILE + ''' ' +
                            'AND AR_ID = PA_RELACION ' +
                            'AND PA_IDPROCESO = ' + SqlValue(fraProceso.Value) + ' ' +
                          'ORDER BY 1 ';

  sdqParametros.Close;
  sdqParametros.ParamByName('pProceso').AsInteger := fraProceso.Value;

  sdqUsuarios.Close;
  sdqUsuarios.ParamByName('pProceso').AsInteger := fraProceso.Value;

  PageControlChange(nil);
end;

procedure TfrmManProcesos.LockControls(ALocked: Boolean);
begin
  inherited;
  
  PageControl.Enabled := True;
end;

procedure TfrmManProcesos.OnFraProcesoChange(Sender: TObject);
begin
  PKChange(fraProceso.IsSelected);
  tbEjecutar.Enabled := fraProceso.IsSelected;
end;

function TfrmManProcesos.Validar: Boolean;
begin
  Result := False;
  if edCodigo.Text = '' then
    InvalidMsg(edCodigo, 'Debe ingresar el código del proceso.')
  else if edDescripcion.Text = '' then
    InvalidMsg(edDescripcion, 'Debe ingresar la descripción del proceso.')
  else
    Result := True;
end;

procedure TfrmManProcesos.tbAccNuevoClick(Sender: TObject);
begin
  cmbAccTipo.ItemIndex := 0;
  cmbAccTipoChange(nil);
  chkOpcional.Checked := False;
  fpAcciones.Caption := FORM_CAP_INSERT;
  fpAcciones.ShowModal;
end;

procedure TfrmManProcesos.cmbAccTipoChange(Sender: TObject);
begin
  {Cambia el frame fraProcesoArchivo de una tabla a otra}
  with fraProcesoArchivo do
  begin
    case cmbAccTipo.ItemIndex of
      0:
      begin
        FieldID     := 'PS_ID';
        FieldCodigo := 'PS_ID';
        FieldDesc   := 'PS_DESCRIPCION';
        FieldBaja   := 'PS_FECHABAJA';
        TableName   := 'IPS_PROCESOSERVER';
        {$IFNDEF ART2}
        IdType      := ctInteger;
        CodigoType  := ctInteger;
        {$ENDIF}
        cmbAccTipoArchivo.Enabled   := False;
        cmbAccTipoArchivo.ItemIndex := -1;
      end;
      1:
      begin
        FieldID     := 'AR_ID';
        FieldCodigo := 'AR_ID';
        FieldDesc   := 'AR_DESCRIPCION';
        FieldBaja   := 'AR_FECHABAJA';
        TableName   := 'IAR_ARCHIVO';
        {$IFNDEF ART2}
        IdType      := ctInteger;
        CodigoType  := ctInteger;
        {$ENDIF}
        cmbAccTipoArchivo.Enabled   := True;
        cmbAccTipoArchivo.ItemIndex := 1;
      end;
    end;
    Clear;
    OnFraProcesoArchivoChange(nil);
  end;
end;

procedure TfrmManProcesos.tbAccModificarClick(Sender: TObject);
begin
  if tbAccModificar.Enabled and (not sdqAcciones.IsEmpty) then
  begin
    cmbAccTipo.ItemIndex := Pos(sdqAcciones.FieldByName('PA_TIPOACCION').AsString, 'PA') - 1;
    cmbAccTipoChange(nil);

    fraProcesoArchivo.Value := sdqAcciones.FieldByName('PA_RELACION').AsInteger;
    OnFraProcesoArchivoChange(nil);

    cmbAccTipoArchivo.ItemIndex := ArrayPos(sdqAcciones.FieldByName('PA_TIPOARCHIVO').AsString, ATA_TIPOARCHIVOS);
    chkOpcional.Checked         := sdqAcciones.FieldByName('PA_OPCIONAL').AsString = SQL_TRUE;

    fpAcciones.Caption := FORM_CAP_MODIFY;
    fpAcciones.ShowModal;
  end;
end;

procedure TfrmManProcesos.tbAccEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if MsgBox('¿ Desea eliminar la Acción Seleccionada ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Sql := TSql.Create('IPA_PROCESOACCION');
    try
      Sql.PrimaryKey.Add('PA_IDPROCESO', fraProceso.Value);
      Sql.PrimaryKey.Add('PA_ORDEN',     sdqAcciones.FieldByName('PA_ORDEN').AsInteger);
      EjecutarSql(Sql.DeleteSql);
      sdqAcciones.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManProcesos.btnAccAceptarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if fraProcesoArchivo.IsEmpty then
    InvalidMsg(fraProcesoArchivo.edCodigo, 'Debe seleccionar el proceso / archivo.')
  else
  begin
    Sql := TSql.Create('IPA_PROCESOACCION');
    try
      Sql.PrimaryKey.Add('PA_IDPROCESO', fraProceso.Value);
      Sql.Fields.Add('PA_TIPOACCION', Copy('PA', cmbAccTipo.ItemIndex + 1, 1));
      Sql.Fields.Add('PA_RELACION', fraProcesoArchivo.Value);
      Sql.Fields.Add('PA_OPCIONAL', chkOpcional.Checked);
      if cmbAccTipoArchivo.ItemIndex = -1 then
        Sql.Fields.Add('PA_TIPOARCHIVO', exNull)
      else
        Sql.Fields.Add('PA_TIPOARCHIVO', ATA_TIPOARCHIVOS[cmbAccTipoArchivo.ItemIndex]);

      if fpAcciones.Caption = FORM_CAP_INSERT then
      begin
        Sql.PrimaryKey.Add('PA_ORDEN', IncSql('SELECT MAX(PA_ORDEN) FROM IPA_PROCESOACCION WHERE PA_IDPROCESO = ' + SqlValue(fraProceso.Value)));
        Sql.Fields.Add('PA_FECHAALTA', SQL_ACTUALDATE, False);
        Sql.Fields.Add('PA_USUALTA',   Sesion.LoginName);
        Sql.SqlType := stInsert;
      end
      else
      begin
        Sql.PrimaryKey.Add('PA_ORDEN',  sdqAcciones.FieldByName('PA_ORDEN').AsInteger);
        Sql.Fields.Add('PA_FECHAMODIF', SQL_ACTUALDATE, False);
        Sql.Fields.Add('PA_USUMODIF',   Sesion.LoginName);
        Sql.SqlType := stUpdate;
      end;
      EjecutarSql(Sql.Sql);
      sdqAcciones.Refresh;
      fpAcciones.ModalResult := mrOk;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManProcesos.PageControlChange(Sender: TObject);
begin
  inherited;

  case PageControl.ActivePageIndex of
//    PAG_GENERAL    :
    PAG_ACCIONES  : OpenQuery(sdqAcciones);
    PAG_PARAMETROS: OpenQuery(sdqParametros);
    PAG_USUARIOS  : OpenQuery(sdqUsuarios);
  end;
end;

procedure TfrmManProcesos.tbParaNuevoClick(Sender: TObject);
begin
  edParaCodigo.Text      := '';
  edParaDescripcion.Text := '';
  chkParaVisible.Visible := True;
  fraParaTipoDato.Limpiar;
  FreeAndNil(DefParamEditor);
  fpParametros.Constraints.MinHeight := 160;
  fpParametros.Height := 160;
  fpParametros.Constraints.MaxHeight := 160;

  fpParametros.Caption := FORM_CAP_INSERT;
  fpParametros.ShowModal;
end;

procedure TfrmManProcesos.tbParaModificarClick(Sender: TObject);
begin
  if tbParaModificar.Enabled and (not sdqParametros.IsEmpty) then
  begin
    edParaCodigo.Text      := sdqParametros.FieldByName('PP_CODIGO').AsString;
    edParaDescripcion.Text := sdqParametros.FieldByName('PP_DESCRIPCION').AsString;
    fraParaTipoDato.Value  := sdqParametros.FieldByName('PP_TIPO').AsString;
    OnFraTipoDatoParametroChange(nil);
    chkParaVisible.Checked := sdqParametros.FieldByName('PP_VISIBLE').AsString = 'S';
    SetParamEditorValue(DefParamEditor, sdqParametros.FieldByName('PP_DEFAULT').AsString);

    fpParametros.Caption := FORM_CAP_MODIFY;
    fpParametros.ShowModal;
  end;
end;

procedure TfrmManProcesos.tbParaEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if MsgBox('¿ Desea eliminar el Parámetro Seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Sql := TSql.Create('IPP_PROCESOPARAMETRO');
    try
      Sql.PrimaryKey.Add('PP_IDPROCESO', fraProceso.Value);
      Sql.PrimaryKey.Add('PP_CODIGO',    sdqParametros.FieldByName('PP_CODIGO').AsString);
      Sql.Fields.Add('PP_FECHABAJA',     SQL_ACTUALDATE, False);
      Sql.Fields.Add('PP_USUBAJA',       Sesion.LoginName);
      EjecutarSql(Sql.UpdateSql);
      sdqParametros.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManProcesos.dbgParametrosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                     var Background: TColor; Highlight: Boolean);
begin
  if not sdqParametros.FieldByName('PP_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManProcesos.btnParaAceptarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if edParaCodigo.Text = '' then
    InvalidMsg(edCodigo, 'Debe ingresar el código del Parámetro.')
  else if AreIn(UpperCase(edParaCodigo.Text), PARAMETROS_FIJOS) {or (Copy(UpperCase(edCodigo.Text), 0, 6) = 'FIELD!')} then
    InvalidMsg(edCodigo, 'El código de parámetro esta reservado por la aplicación.')
  else if fraParaTipoDato.Value = '' then
    InvalidMsg(edCodigo, 'Debe seleccionar el Tipo de Dato.')
  else if ExisteSql('SELECT 1 FROM IPP_PROCESOPARAMETRO ' +
                       'WHERE PP_IDPROCESO = ' + SqlValue(fraProceso.Value) + ' ' +
                         'AND PP_CODIGO = ''' + edCodigo.Text + '''' +
                          IIF(fpParametros.Caption = FORM_CAP_INSERT, '', 'AND PP_CODIGO <> ''' + sdqParametros.FieldByName('PP_CODIGO').AsString + '''' )) then
    InvalidMsg(edCodigo, 'Ya existe un Parámetro con el mismo código para el mismo proceso.')
  else
  begin
    Sql := TSql.Create('IPP_PROCESOPARAMETRO');
    try
      Sql.PrimaryKey.Add('PP_IDPROCESO', fraProceso.Value);
      if (fpParametros.Caption = FORM_CAP_INSERT) then
      begin
        Sql.SqlType := stInsert;
        Sql.Fields.Add('PP_FECHAALTA', SQL_ACTUALDATE, False);
        Sql.Fields.Add('PP_USUALTA',   Sesion.LoginName);
        Sql.Fields.Add('PP_ORDEN',     IncSql('SELECT MAX(PP_ORDEN) FROM IPP_PROCESOPARAMETRO ' + Sql.Where));
      end
      else
      begin
        Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('PP_CODIGO', sdqParametros.FieldByName('PP_CODIGO').AsString);
        Sql.Fields.Add('PP_FECHAMODIF', SQL_ACTUALDATE, False);
        Sql.Fields.Add('PP_USUMODIF',   Sesion.LoginName);
        Sql.Fields.Add('PP_FECHABAJA',  SQL_NULL, False);
        Sql.Fields.Add('PP_USUBAJA',    SQL_NULL, False);
      end;
      Sql.Fields.Add('PP_CODIGO',      edParaCodigo.Text);
      Sql.Fields.Add('PP_DESCRIPCION', edParaDescripcion.Text);
      Sql.Fields.Add('PP_TIPO',        fraParaTipoDato.Value);
      Sql.Fields.Add('PP_VISIBLE',     chkParaVisible.Checked);
      Sql.Fields.Add('PP_DEFAULT',     GetParamEditorValue(DefParamEditor));

      EjecutarSql(Sql.Sql);
      fpParametros.ModalResult := mrOk;
      sdqParametros.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManProcesos.tbUsuNuevoClick(Sender: TObject);
begin
  fraUsuario.Limpiar;

  fpUsuarios.Caption := FORM_CAP_INSERT;
  fpUsuarios.ShowModal;
end;

procedure TfrmManProcesos.tbUsuEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if MsgBox('¿ Desea desvincular el Usuario Seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Sql := TSql.Create('IPU_PROCESOUSUARIO');
    try
      Sql.PrimaryKey.Add('PU_IDPROCESO', fraProceso.Value);
      Sql.PrimaryKey.Add('PU_USUARIO',  sdqUsuarios.FieldByName('PU_USUARIO').AsString);

      EjecutarSql(Sql.DeleteSql);
      sdqUsuarios.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManProcesos.btnUsuAceptarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if not fraUsuario.IsSelected then
    InvalidMsg(fraUsuario.edCodigo, 'Debe seleccionar un Usuario.')
  else if ExisteSql('SELECT 1 FROM IPU_PROCESOUSUARIO ' +
                       'WHERE PU_IDPROCESO = ' + SqlValue(fraProceso.Value) + ' ' +
                         'AND PU_USUARIO = ' + SqlString(fraUsuario.edCodigo.Text, True) + ' ' +
                          IIF(fpUsuarios.Caption = FORM_CAP_INSERT, '', 'AND PU_USUARIO <> ' + SqlString(sdqUsuarios.FieldByName('PU_USUARIO').AsString, True))) then
    InvalidMsg(edCodigo, 'Ya existe un Usuario con el mismo código para el mismo proceso.')
  else
  begin
    Sql := TSql.Create('IPU_PROCESOUSUARIO');
    try
      Sql.PrimaryKey.Add('PU_IDPROCESO', fraProceso.Value);
      Sql.Fields.Add('PU_USUARIO', fraUsuario.edCodigo.Text);

      EjecutarSql(Sql.InsertSql);
      fpUsuarios.ModalResult := mrOk;
      sdqUsuarios.Refresh ;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManProcesos.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if ModoABM = maAlta then
  begin
    AllowChange := False;
    if MsgBox('Para poder agregar Acciones, Parámetros o Usuarios Relacionados, primero debe guardar los Datos Generales.' + #13 +
             '¿Desea guardar estos datos?', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      if Validar and DoABM then
      begin
        //ModoABM     := maModificacion;
        Selected    := True;
        DataLoaded  := True;
        tbModificarClick(nil);
        AllowChange := True;
      end;
    end;
  end
  else
    AllowChange := DataLoaded;
end;

procedure TfrmManProcesos.tbAccMoverClick(Sender: TObject);
var
  sSql: String;
  bAbajo: Boolean;
begin
  {$IFDEF SQLSERVER}
  MsgBox('La opción no está habilitada para SqlServer.', MB_ICONEXCLAMATION);
  {$ELSE}
  bAbajo := TComponent(Sender).Tag > 0;
  sSql := 'DECLARE ' +
            'RowId_Origen  ROWID; ' +
            'Orden_Origen  Number; ' +
            'RowId_Destino ROWID; ' +
            'Orden_Destino Number; ' +
            'BEGIN ' +
              'SELECT ROWID, PA_ORDEN ' +
                'INTO RowId_Origen, Orden_Origen ' +
                'FROM IPA_PROCESOACCION ' +
               'WHERE PA_IDPROCESO = ' + SqlValue(fraProceso.Value) + ' ' +
                 'AND PA_ORDEN = ' + SqlInt( sdqAcciones.FieldByName('PA_ORDEN').AsInteger ) + '; ' +

              'SELECT PA_ORDEN, ROWID ' +
                'INTO Orden_Destino, RowId_Destino ' +
                'FROM IPA_PROCESOACCION O ' +
               'WHERE PA_IDPROCESO = ' + SqlValue(fraProceso.Value) + ' ' +
                 'AND PA_ORDEN = (SELECT ' + IIF( bAbajo,'MIN', 'MAX')  + '(D.PA_ORDEN) ' +
                                   'FROM IPA_PROCESOACCION D ' +
                                  'WHERE D.PA_IDPROCESO = O.PA_IDPROCESO ' +
                                    'AND D.PA_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt( sdqAcciones.FieldByName('PA_ORDEN').AsInteger ) + '); ' +
              'UPDATE IPA_PROCESOACCION O ' +
                 'SET PA_ORDEN = (SELECT MAX(D.PA_ORDEN) + 1 FROM IPA_PROCESOACCION D WHERE D.PA_IDPROCESO = O.PA_IDPROCESO) ' +
               'WHERE ROWID = RowId_Origen; ' +

              'UPDATE IPA_PROCESOACCION ' +
                 'SET PA_ORDEN = Orden_Origen ' +
               'WHERE ROWID = RowId_Destino; ' +

              'UPDATE IPA_PROCESOACCION ' +
                 'SET PA_ORDEN = Orden_Destino ' +
               'WHERE ROWID = RowId_Origen; ' +
            'END;';
  EjecutarSql(sSql);
  sdqAcciones.Refresh;

  if bAbajo then
    sdqAcciones.Next
  else
    sdqAcciones.Prior;
{$ENDIF}
end;

procedure TfrmManProcesos.sdqAccionesAfterScroll(DataSet: TDataSet);
begin
  tbAccMoverArriba.Enabled := DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};
  tbAccMoverAbajo.Enabled  := DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF};
end;

procedure TfrmManProcesos.tbParamMoverClick(Sender: TObject);
var
  sSql: String;
  bAbajo: Boolean;
begin
  {$IFDEF SQLSERVER}
  MsgBox('La opción no está habilitada para SqlServer', MB_ICONEXCLAMATION);
  {$ELSE}
  bAbajo := TComponent(Sender).Tag > 0 ;
  sSql := 'DECLARE ' +
            'RowId_Origen  ROWID; ' +
            'Orden_Origen  Number; ' +
            'RowId_Destino ROWID; ' +
            'Orden_Destino Number; ' +
          'BEGIN ' +
            'SELECT ROWID, PP_ORDEN ' +
              'INTO RowId_Origen, Orden_Origen ' +
              'FROM IPP_PROCESOPARAMETRO ' +
             'WHERE PP_IDPROCESO = ' + SqlValue(fraProceso.Value) + ' ' +
               'AND PP_ORDEN = ' + SqlInt( sdqParametros.FieldByName('PP_ORDEN').AsInteger ) + '; ' +

            'SELECT PP_ORDEN, ROWID ' +
              'INTO Orden_Destino, RowId_Destino ' +
              'FROM IPP_PROCESOPARAMETRO O ' +
             'WHERE PP_IDPROCESO = ' + SqlValue(fraProceso.Value) + ' ' +
               'AND PP_ORDEN = (SELECT ' + IIF( bAbajo,'MIN', 'MAX')  + '(D.PP_ORDEN) ' +
                                 'FROM IPP_PROCESOPARAMETRO D ' +
                                'WHERE D.PP_IDPROCESO = O.PP_IDPROCESO ' +
                                  'AND D.PP_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt( sdqParametros.FieldByName('PP_ORDEN').AsInteger ) + '); ' +
            'UPDATE IPP_PROCESOPARAMETRO O ' +
               'SET PP_ORDEN = (SELECT MAX(D.PP_ORDEN) + 1 FROM IPP_PROCESOPARAMETRO D WHERE D.PP_IDPROCESO = O.PP_IDPROCESO) ' +
             'WHERE ROWID = RowId_Origen; ' +

            'UPDATE IPP_PROCESOPARAMETRO ' +
               'SET PP_ORDEN = Orden_Origen ' +
             'WHERE ROWID = RowId_Destino; ' +

            'UPDATE IPP_PROCESOPARAMETRO ' +
               'SET PP_ORDEN = Orden_Destino ' +
             'WHERE ROWID = RowId_Origen; ' +
          'END;';
  EjecutarSql(sSql);
  sdqParametros.Refresh;

  if bAbajo Then
     sdqParametros.Next
  else
     sdqParametros.Prior;
  {$ENDIF}
end;

procedure TfrmManProcesos.sdqParametrosAfterScroll(DataSet: TDataSet);
begin
  tbParamMoverArriba.Enabled := DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};
  tbParamMoverAbajo.Enabled  := DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF};
end;

procedure TfrmManProcesos.tbSintaxisCheckClick(Sender: TObject);
var
  {$IFDEF VER150}
  Bookmark: TBookmarkStr;
  {$ELSE}
  Bookmark: TBookmark;
  {$ENDIF}
begin
  sdqAcciones.DisableControls;
  try
    Bookmark := sdqAcciones.Bookmark;
    try
      sdqAcciones.First;
      while not sdqAcciones.Eof do
      begin
        if (sdqAcciones.FieldByName('PA_TIPOACCION').AsString  = TA_PROCESS) or
           (sdqAcciones.FieldByName('PA_TIPOARCHIVO').AsString = ATA_WRITE) then
        try
          WriteStatusText('Comprobando ' + sdqAcciones.FieldByName('DESC_RELACION').AsString);
          CheckQuery(fraProceso.Value, dmPrincipal.sdqConsulta, sdqAcciones.FieldByName('SQL').AsString,
                     sdqAcciones.FieldByName('PA_TIPOACCION').AsString = TA_FILE);
        except
          on E: Exception do
            raise Exception.Create(E.Message + #13#10 + sdqAcciones.FieldByName('DESC_RELACION').AsString);
        end;
        sdqAcciones.Next;
      end;
    finally
      sdqAcciones.Bookmark := Bookmark;
    end;
    WriteStatusText('');
    MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);
  finally
    sdqAcciones.EnableControls;
  end;
end;

procedure TfrmManProcesos.OnFraTipoDatoParametroChange(Sender: TObject);
var
  AClass: TWinControlClass;
begin
  if fraParaTipoDato.IsSelected then
  begin
    AClass := GetParamEditorClass(fraParaTipoDato.Value);
    if (DefParamEditor = nil) or (DefParamEditor.ClassType <> AClass) then
    begin
      DefParamEditor.Free;
      DefParamEditor := AClass.Create(Self);
      DefParamEditor.Parent := fpParametros;
      ParamInitializeEditor(DefParamEditor, '', edParaDescripcion.Width);

      with DefParamEditor do
      begin
        Left := 104;
        Top := 94;
        TabOrder := fraParaTipoDato.TabOrder + 1;
      end;
    end;
  end;
end;

procedure TfrmManProcesos.tbEjecutarClick(Sender: TObject);
begin
  inherited;

  ImpoExpoWizard(fraProceso.Value);
end;

procedure TfrmManProcesos.OnFraProcesoArchivoChange(Sender: TObject);
begin
  tbAccModificarProcArch.Enabled := fraProcesoArchivo.IsSelected;
end;

function TfrmManProcesos.GetAccionABMClass: TfrmCustomAccionABMClass;
begin
  case cmbAccTipo.ItemIndex of
    0: Result := TfrmManProcesosOracle;
    1: Result := TfrmManArchivosExp;
  else
    Result := nil;
  end;
end;

procedure TfrmManProcesos.tbAccNuevoProcArchClick(Sender: TObject);
begin
  with GetAccionABMClass.Create(Self) do
  try
    fraProcesoArchivo.Value := Insert;
    OnFraProcesoArchivoChange(nil);
  finally
    Free;
  end;
end;

procedure TfrmManProcesos.tbAccModificarProcArchClick(Sender: TObject);
begin
  with GetAccionABMClass.Create(Self) do
  try
    if Edit(fraProcesoArchivo.Value) then
      fraProcesoArchivo.Reload;
  finally
    Free;
  end;
end;

procedure TfrmManProcesos.tbEliminarClick(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea dar de baja este proceso ?') then
    inherited;
end;

end.
