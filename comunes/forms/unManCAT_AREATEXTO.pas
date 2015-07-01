unit unManCAT_AREATEXTO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, mwCustomEdit, mwHighlighter,
  mwSqlSyn, StdCtrls, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog,
  SortDlg, Db, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin,
  unArtFrame, unFraCodigoDescripcion, unCustomConsulta, LookupDialog, unComunes, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unArtDBAwareFrame;

type
  TfrmManCAT_AREATEXTO = class(TfrmCustomGridABM)
    mwSqlSyn: TmwSqlSyn;
    sduConsulta: TSDUpdateSQL;
    PageControl1: TPageControl;
    tsUsuarios: TTabSheet;
    tsSQL: TTabSheet;
    lbSQL: TLabel;
    edAT_SQL: TmwCustomEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    tbUsuarioNuevo: TToolButton;
    tbUsuarioEliminar: TToolButton;
    ArtDBGrid1: TArtDBGrid;
    sdqAreaUsuario: TSDQuery;
    dsAreaUsuario: TDataSource;
    dsUsuarios: TDataSource;
    sdqUsuarios: TSDQuery;
    ldUsuarios: TLookupDialog;
    pnlDatos: TPanel;
    Label1: TLabel;
    lbDescripcion: TLabel;
    edAT_DESCRIPCION: TEdit;
    edAT_CODIGOREMITENTE: TEdit;    
    chkRespuesta: TCheckBox;
    lbModulo: TLabel;
    edAT_MODULO: TEdit;
    lbParam: TLabel;
    fraArea: TfraStaticCTB_TABLAS;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbUsuarioNuevoClick(Sender: TObject);
    procedure tbUsuarioEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure fpAbmEnter(Sender: TObject);
  private
    FArea: TAreas;
    FIdArea: String;

    procedure SetArea(const aValue: TAreas);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property Area: TAreas read FArea write SetArea;
    property IdArea: String read FIdArea write FIdArea;
  end;

var
  frmManCAT_AREATEXTO: TfrmManCAT_AREATEXTO;

implementation

uses
  unDmPrincipal, CustomDlgs, unArt, AnsiSQL, SQLFuncs, VCLExtra {$IFNDEF VER130}, Variants{$ENDIF}, General, unSesion,
  unPrincipal;

{$R *.DFM}

procedure TfrmManCAT_AREATEXTO.ClearControls;
begin
  FIdArea := ValorSql('SELECT seq_cat_areatexto.NEXTVAL FROM DUAL');
  sdqAreaUsuario.Close;
  chkRespuesta.Checked := False;
  edAT_MODULO.Clear;
  edAT_DESCRIPCION.Clear;
  edAT_CODIGOREMITENTE.Clear;

  if (FArea <> aCobranzas) and (FArea <> aEmision) then   // area cobranzas/emisión es fijo, y no puede cambiarse, el resto sí
  begin
    fraArea.Clear;
    VCLExtra.LockControl(fraArea, False);
  end;

  edAT_SQL.ClearAll;
  VCLExtra.LockControl(edAT_MODULO, False);
end;

function TfrmManCAT_AREATEXTO.DoABM: Boolean;
begin
  try
    case ModoABM of
      maAlta:
      begin
        sdqConsulta.Insert;
        sdqConsulta.FieldByName('at_id').AsInteger         := StrToInt(FIdArea); {Para que no Putee}
        sdqConsulta.FieldByName('at_usualta').AsString     := frmPrincipal.DBLogin.UserID;
        sdqConsulta.FieldByName('at_fechaalta').AsDateTime := DBDateTime;
      end;
      maModificacion:
      begin
        sdqConsulta.Edit;
        sdqConsulta.FieldByName('at_usumodif').AsString     := frmPrincipal.DBLogin.UserID;
        sdqConsulta.FieldByName('at_fechamodif').AsDateTime := DBDateTime;
        sdqConsulta.FieldByName('at_usubaja').Value         := Null;
        sdqConsulta.FieldByName('at_fechabaja').Value       := Null;
      end;
      maBaja:
      begin
        sdqConsulta.Edit;
        sdqConsulta.FieldByName('at_usubaja').AsString     := frmPrincipal.DBLogin.UserID;
        sdqConsulta.FieldByName('at_fechabaja').AsDateTime := DBDateTime;
      end;
    end;

    if ModoABM <> maBaja then
    begin
      sdqConsulta.FieldByName('at_modulo').AsString          := edAT_MODULO.Text;
      sdqConsulta.FieldByName('at_descripcion').AsString     := edAT_DESCRIPCION.Text;
      sdqConsulta.FieldByName('at_codigoremitente').AsString := edAT_CODIGOREMITENTE.Text;
      sdqConsulta.FieldByName('at_area').AsString            := fraArea.Value;
      sdqConsulta.FieldByName('at_sql').AsString             := edAT_SQL.Text;
      if chkRespuesta.Checked then
        sdqConsulta.FieldByName('at_respuestacliente').AsString := 'S'
      else
        sdqConsulta.FieldByName('at_respuestacliente').AsString := 'N';
    end;

    sdqConsulta.Post;
    sdqConsulta.ApplyUpdates;

    Result := True;
  except
    on E: Exception do
    begin
      ErrorMsg(E, 'Error al guardar los datos.');
      sdqConsulta.Cancel;
      Result := False;
    end;
  end;
end;

procedure TfrmManCAT_AREATEXTO.LoadControls;
begin
  sdqAreaUsuario.Close;
  sdqAreaUsuario.ParamByName('at_id').Value := sdqConsulta.FieldByName('at_id').AsString;
  OpenQuery(sdqAreaUsuario);

  edAT_MODULO.Text          := sdqConsulta.FieldByName('at_modulo').AsString;
  edAT_DESCRIPCION.Text     := sdqConsulta.FieldByName('at_descripcion').AsString;
  edAT_CODIGOREMITENTE.Text := sdqConsulta.FieldByName('at_codigoremitente').AsString;
  edAT_SQL.Text             := sdqConsulta.FieldByName('at_sql').AsString;
  fraArea.Value             := sdqConsulta.FieldByName('at_area').AsString;
  FIdArea                   := sdqConsulta.FieldByName('at_id').AsString;
  chkRespuesta.Checked      := sdqConsulta.FieldByName('at_respuestacliente').AsString = 'S';

  VCLExtra.LockControls([edAT_MODULO, fraArea], True);
end;

function TfrmManCAT_AREATEXTO.Validar: Boolean;
var
  sSql: String;
begin
  Result := False;

  if Trim(edAT_MODULO.Text) = '' then
    InvalidMsg(edAT_MODULO, 'Debe ingresar el módulo.')
  else if Trim(edAT_DESCRIPCION.Text) = '' then
    InvalidMsg(edAT_DESCRIPCION, 'Debe ingresar la descripción del área.')
  else if fraArea.IsEmpty then
    InvalidMsg(fraArea.edCodigo, 'Debe ingresar el área.')
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM cat_areatexto' +
      ' WHERE at_area = :area' +
        ' AND at_modulo = :modulo';
    if (ModoABM = maAlta) and ExisteSqlEx(sSql, [fraArea.Value, edAT_MODULO.Text]) then
      InvalidMsg(fraArea.edCodigo, 'El módulo y área ya existen.')
    else
      Result := True;
  end;
end;

procedure TfrmManCAT_AREATEXTO.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja         := 'at_fechabaja';
  fraArea.Clave     := 'AREA';
  tsSQL.TabVisible  := (Seguridad.Claves.IsActive('PermisoEditarSQLArea'));
  tbRefrescarClick(nil);
end;

procedure TfrmManCAT_AREATEXTO.tbUsuarioNuevoClick(Sender: TObject);
var
  sUsuariosAreas: String;
begin
  if ModoABM = maAlta then
    if (MsgBox('Debe grabar para poder seguir adelante. ¿ Desea hacerlo ?', MB_YESNO + MB_ICONEXCLAMATION) = IDYES) and Validar and DoAbm then
      ModoABM := maModificacion;

  if ModoABM = maModificacion then
  begin
    OpenQuery(sdqUsuarios);
    sUsuariosAreas := sdqAreaUsuario.SQL.Text;
    AddCondition(sUsuariosAreas, ' au_usuario = :usuario ');

    if ldUsuarios.Execute(true) then
      if ExisteSqlEx(sUsuariosAreas, [sdqUsuarios.FieldByName('se_usuario').AsString, sdqConsulta.FieldByName('at_id').AsString]) then
        MsgBox('Error: El usuario ya pertenece al área actual.')
      else
        with TSql.Create('cau_areausuario') do
        try
          SqlType := stInsert;
          PrimaryKey.Add('au_id', 'SEQ_CAU_ID.NEXTVAL', False);

          Fields.Add('au_usuario',     sdqUsuarios.FieldByName('se_usuario').AsString);
          Fields.Add('au_idareatexto', FIdArea);
          Fields.Add('au_fechaalta',   SQL_ACTUALDATE, False);
          Fields.Add('au_usualta',     frmPrincipal.DBLogin.UserId);

          try
            EjecutarSql(Sql);
            sdqAreaUsuario.Close;
            sdqAreaUsuario.ParamByName('at_id').Value := FIdArea;
            OpenQuery(sdqAreaUsuario);
          except
            on E: Exception do
              ErrorMsg(E, 'Error al guardar los datos.');
          end;
        finally
          Free;
        end;
    sdqUsuarios.Close;
  end;
end;

procedure TfrmManCAT_AREATEXTO.tbUsuarioEliminarClick(Sender: TObject);
begin
  if not sdqAreaUsuario.IsEmpty then
    with TSql.Create('cau_areausuario') do
    try
      SqlType := stUpdate;

      PrimaryKey.Add('au_id',    sdqAreaUsuario.FieldByName('au_id').AsString, False);
      Fields.Add('au_fechabaja', SQL_ACTUALDATE, False);
      Fields.Add('au_usubaja',   frmPrincipal.DBLogin.UserId);

      try
        EjecutarSql(Sql);
        sdqAreaUsuario.Close;
        sdqAreaUsuario.ParamByName('at_id').Value := sdqConsulta.FieldByName('at_id').AsString;
        OpenQuery(sdqAreaUsuario);
      except
        on E: Exception do
          ErrorMsg(E, 'Error al guardar los datos.');
      end;
    finally
      Free;
    end;
end;

procedure TfrmManCAT_AREATEXTO.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.FieldByName('at_fechabaja').IsNull then
  begin
    MsgBox('No se puede modificar un registro eliminado.');
    Abort;
  end;

  inherited;
end;

procedure TfrmManCAT_AREATEXTO.fpAbmEnter(Sender: TObject);
begin
  inherited;

  PageControl1.ActivePage := tsUsuarios;
  if ModoABM = maAlta then
    edAT_MODULO.SetFocus
  else if ModoABM = maModificacion then
    edAT_DESCRIPCION.SetFocus;
end;

procedure TfrmManCAT_AREATEXTO.SetArea(const aValue: TAreas);
var
  sSql: String;
begin
  if FArea <> aValue then
  begin
    FArea := aValue;

    case FArea Of
      aCobranzas:
      begin
        fraArea.ExtraCondition := ' AND tb_codigo = ' + SqlValue(AREA_COB);
        fraArea.Value := AREA_COB;
        VCLExtra.LockControl(fraArea);
      end;

      aAfiliaciones:
      begin  // desde afiliaciones, también se incluye al area técnica
        fraArea.ExtraCondition := ' AND tb_codigo IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';
        VCLExtra.LockControl(fraArea, False);
      end;

      aEmision:
      begin
        fraArea.ExtraCondition := ' AND tb_codigo = ' + SqlValue(AREA_EMI);
        fraArea.Value := AREA_EMI;
        VCLExtra.LockControl(fraArea);
      end;

      aMedSiniIncReca:
      begin  // camarillo, para el llamado desde RedPres (areas medica, siniestros e incapacidades)
        fraArea.ExtraCondition := ' AND tb_codigo IN (' + SqlValue(AREA_MED) + ',' +
                                                          SqlValue(AREA_SIN) + ',' +
                                                          SqlValue(AREA_INC) + ',' +
                                                          SqlValue(AREA_RECA) + ',' +
                                                          SqlValue(AREA_APAU) + ',' +
                                                          SqlValue(AREA_APTR) + ',' +
                                                          SqlValue(AREA_RECHPR) +
                                                          IIF(Sesion.Sector = 'COMPUTOS', ',' + SqlValue(AREA_DIN), '')  + ')';
         VCLExtra.LockControl(fraArea);
      end;

      aDinerarias:
      begin
        fraArea.ExtraCondition := ' AND tb_codigo = ' + SqlValue(AREA_DIN);
        fraArea.Value := AREA_DIN;
        VCLExtra.LockControl(fraArea);
      end;

      aLegales:
      begin
        fraArea.ExtraCondition := ' AND tb_codigo = ' + SqlValue(AREA_LEG);
        fraArea.Value := AREA_LEG;
        VCLExtra.LockControl(fraArea);
      end;
    end;

    sSql :=
      'SELECT at_id, at_descripcion, at_area, tb_descripcion, at_sql, at_respuestacliente, at_modulo, at_usualta,' +
            ' TRUNC(at_fechaalta) at_fechaalta, at_usumodif, at_fechamodif, at_usubaja, at_fechabaja,' +
            ' at_codigoremitente' +
       ' FROM cat_areatexto, ctb_tablas' +
      ' WHERE at_area = tb_codigo' +
        ' AND tb_clave = ''AREA'' ' + fraArea.ExtraCondition;
    sdqConsulta.SQL.Text := sSql + SortDialog.OrderBy;
    OpenQuery(sdqConsulta);
  end;
end;

end.
