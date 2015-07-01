unit unManCFI_FIRMA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider, ShortCutControl,
  Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, StdCtrls, ExtCtrls, FormPanel,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtDlgs, FSDBGrid, RxMemDS, unArtFrame,
  unFraCodigoDescripcion, unfraCtbTablas, RxLookup, IntEdit, unFraStaticCodigoDescripcion, unFraUsuario, unComunes,
  unArtDBAwareFrame, unfraUsuarios;

type
  TfrmManCFI_FIRMA = class(TfrmCustomGridABM)
    PageControl: TPageControl;
    tsDatosPrincipales: TTabSheet;
    tsAreas: TTabSheet;
    lbApellidoNombre: TLabel;
    edFI_FIRMANTE: TEdit;
    Label1: TLabel;
    edFI_DOCUMENTO: TEdit;
    Label2: TLabel;
    edFI_CARACTER: TEdit;
    tsFirma: TTabSheet;
    ScrollBox: TScrollBox;
    ToolBar1: TToolBar;
    tbFirmAbrir: TToolButton;
    tbFirmGuardar: TToolButton;
    ToolButton7: TToolButton;
    tbFirmLimpiar: TToolButton;
    OpenPictureDialog: TOpenPictureDialog;
    SavePictureDialog: TSavePictureDialog;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    tbAreasAgregar: TToolButton;
    tbAreasQuitar: TToolButton;
    dsAreas: TDataSource;
    sdqAreas: TSDQuery;
    fpAbmAreas: TFormPanel;
    Bevel1: TBevel;
    btnAreasAceptar: TButton;
    btnAreasCancelar: TButton;
    lbModulo: TLabel;
    dbgAreas: TRxDBGrid;
    sduConsulta: TSDUpdateSQL;
    memAreas: TRxMemoryData;
    chkActivos: TCheckBox;
    fraArea: TfraStaticCodigoDescripcion;
    Label4: TLabel;
    Label5: TLabel;
    fraFirmantes: TfraStaticCodigoDescripcion;
    fraModulo: TfraStaticCodigoDescripcion;
    shpMargenInferior: TShape;
    imgFirma: TImage;
    Label3: TLabel;
    fraUsuario: TfraUsuario;
    Label6: TLabel;
    edFI_MATRICULA: TEdit;
    chkFirmaDigital: TCheckBox;
    tbAreasModificar: TToolButton;
    procedure tbFirmAbrirClick(Sender: TObject);
    procedure tbFirmLimpiarClick(Sender: TObject);
    procedure btnAreasAceptarClick(Sender: TObject);
    procedure tbFirmGuardarClick(Sender: TObject);
    procedure dbgAreasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbAreasAgregarClick(Sender: TObject);
    procedure tbAreasQuitarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure ScrollBoxResize(Sender: TObject);
    procedure imgFirmaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbAreasModificarClick(Sender: TObject);
    procedure fpAbmAreasBeforeShow(Sender: TObject);
    procedure dbgAreasDblClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    FArea: TAreas;

    procedure CargarFirma;
    procedure GuardarFirma;
    procedure HabilitaClaveModificar;
    procedure SetArea(const Value: TAreas);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property Area: TAreas read FArea write SetArea;
  end;

var
  frmManCFI_FIRMA: TfrmManCFI_FIRMA;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, VCLExtra, DBFuncs, CustomDlgs, General, unArt, SqlFuncs,
  unSesion {$IFNDEF VER130}, Variants{$ENDIF}, jpeg;

const
  PAGE_DATOSGENERALES = 0;
  PAGE_AREAS          = 1;
  OPERACION_NONE      = '';
  OPERACION_INSERT    = 'I';
  OPERACION_UPDATE    = 'U';
  IMG_NONE            = 0;
  IMG_MODIFIED        = 1;
  IMG_CLEARED         = 2;

{$R *.DFM}

procedure TfrmManCFI_FIRMA.FormCreate(Sender: TObject);
begin
  inherited;

  AutoLock    := False;   // Lu Tk 166 : lo cambie a False porque sino no me tomaria al Modificar con campos editables en el fpAbm
  FieldBaja   := 'FI_FECHABAJA';
  ShowActived := False;

  with fraModulo do
  begin
    ShowBajas   := True;
    TableName   := 'cat_areatexto';
    FieldID     := 'at_id';
    FieldCodigo := 'at_id';
    FieldDesc   := 'at_descripcion';
    FieldBaja   := 'at_fechabaja';
  end;

  with fraArea do
  begin
    ShowBajas   := True;
    TableName   := 'cat_areatexto';
    FieldID     := 'at_id';
    FieldCodigo := 'at_id';
    FieldDesc   := 'at_descripcion';
    FieldBaja   := 'At_fechabaja';
  end;

  with fraFirmantes do
  begin
    ShowBajas   := True;
    TableName   := 'cfi_firma';
    FieldID     := 'fi_id';
    FieldCodigo := 'fi_id';
    FieldDesc   := 'fi_firmante';
    FieldBaja   := 'fi_fechabaja';
  end;
end;

procedure TfrmManCFI_FIRMA.ClearControls;
begin
  PageControl.ActivePageIndex := PAGE_DATOSGENERALES;
  edFI_FIRMANTE.Text  := '';
  edFI_DOCUMENTO.Text := '';
  edFI_CARACTER.Text  := '';
  edFI_MATRICULA.Text := '';
  fraUsuario.Limpiar;

  tbFirmLimpiarClick(nil);
  imgFirma.Tag := IMG_NONE;

  memAreas.Close;
  memAreas.Open;  {Para los Registros Nuevos}
end;

function TfrmManCFI_FIRMA.DoABM: Boolean;
begin
  try
    BeginTrans;
    if ModoABM = maBaja then
    begin
      sdqConsulta.Edit;
      sdqConsulta.FieldByName('fi_usubaja').AsString     := Sesion.UserID;
      sdqConsulta.FieldByName('fi_fechabaja').AsDateTime := DBDate;
      sdqConsulta.Post;
      sdqConsulta.ApplyUpdates;
    end
    else if ModoABM = maAlta then
    begin
      if not sdqConsulta.Active then
        tbRefrescarClick(nil);
      sdqConsulta.Insert;
      sdqConsulta.FieldByName('fi_id').AsInteger             := GetSecNextVal('SEQ_CFI_ID');
      sdqConsulta.FieldByName('fi_firmante').AsString        := edFI_FIRMANTE.Text;
      sdqConsulta.FieldByName('fi_documento').AsString       := edFI_DOCUMENTO.Text;
      sdqConsulta.FieldByName('fi_caracter').AsString        := edFI_CARACTER.Text;
      sdqConsulta.FieldByName('fi_matricula').AsString       := edFI_MATRICULA.Text;
      sdqConsulta.FieldByName('fi_usualta').AsString         := Sesion.UserID;
      sdqConsulta.FieldByName('fi_codusuario').AsString      := fraUsuario.UserID;
      sdqConsulta.FieldByName('fi_margeninferior').AsInteger := imgFirma.Height - shpMargenInferior.Top;
      sdqConsulta.Post;
      sdqConsulta.ApplyUpdates;
    end
    else
    begin
      sdqConsulta.Edit;
      sdqConsulta.FieldByName('fi_usubaja').Value       := NULL;
      sdqConsulta.FieldByName('fi_fechabaja').Value     := NULL;
      sdqConsulta.FieldByName('fi_usumodif').Value      := Sesion.UserID;;
      sdqConsulta.FieldByName('fi_fechamodif').Value    := Date;
      sdqConsulta.FieldByName('fi_firmante').AsString   := edFI_FIRMANTE.Text;
      sdqConsulta.FieldByName('fi_documento').AsString  := edFI_DOCUMENTO.Text;
      sdqConsulta.FieldByName('fi_caracter').AsString   := edFI_CARACTER.Text;
      sdqConsulta.FieldByName('fi_matricula').AsString  := edFI_MATRICULA.Text;
      sdqConsulta.FieldByName('fi_codusuario').AsString := fraUsuario.UserID;

      case imgFirma.Tag of
        IMG_MODIFIED: GuardarFirma;
        IMG_CLEARED:  sdqConsulta.FieldByName('fi_firma').AsString := '';
      end;

      sdqConsulta.FieldByName('fi_margeninferior').AsInteger := imgFirma.Height - shpMargenInferior.Top;
      sdqConsulta.Post;
      sdqConsulta.ApplyUpdates;
    end;

    if memAreas.Active then
    begin
      Sql.TableName := 'cfa_firmantearea';
      memAreas.First;
      repeat
        if memAreas.FieldByName('modificado').AsBoolean then
        begin
          Sql.Clear;
          if memAreas.FieldByName('fa_id').AsInteger = ART_EMPTY_ID then
          begin
            Sql.SqlType := stInsert;
            Sql.PrimaryKey.Add('fa_id',       'SEQ_CFA_ID.NEXTVAL', False);
            Sql.Fields.Add('fa_idareatexto',  memAreas.FieldByName('fa_idareatexto').AsString);
            Sql.Fields.Add('fa_idfirmante',   sdqConsulta.FieldByName('fi_id').AsInteger);
            Sql.Fields.Add('fa_usualta',      Sesion.UserID);
            Sql.Fields.Add('fa_fechaalta',    SQL_ACTUALDATE, False);
            Sql.Fields.Add('fa_firmadigital', memAreas.FieldByName('fa_firmadigital').AsString);
          end
          else
          begin
            Sql.SqlType := stUpdate;
            Sql.PrimaryKey.Add('fa_id', memAreas.FieldByName('fa_id').AsInteger);
            if memAreas.FieldByName('fa_fechabaja').IsNull then
            begin
              Sql.Fields.Add('fa_usubaja',      SQL_NULL, False);
              Sql.Fields.Add('fa_fechabaja',    SQL_NULL, False);
              Sql.Fields.Add('fa_usumodif',     Sesion.UserID);
              Sql.Fields.Add('fa_fechamodif',   SQL_ACTUALDATE, False);
              Sql.Fields.Add('fa_firmadigital', memAreas.FieldByName('fa_firmadigital').AsString);
            end
            else
            begin
              Sql.Fields.Add('fa_usubaja',   Sesion.UserID);
              Sql.Fields.Add('fa_fechabaja', SQL_ACTUALDATE, False);
            end;
          end;
          EjecutarSqlST(Sql.Sql);
        end;
        memAreas.Next;
      until memAreas.Eof;
    end;

    Result := True;
    CommitTrans;
  except
    on E: Exception do
    begin
      Rollback;
      ErrorMsg(E, 'Error al guardar los datos.');
      Result := False;
    end;
  end;
end;

procedure TfrmManCFI_FIRMA.LoadControls;
begin

  PageControl.ActivePageIndex := PAGE_DATOSGENERALES; {Para que no de error al pasar el foco}

  edFI_FIRMANTE.Text  := sdqConsulta.FieldByName('fi_firmante').AsString;
  edFI_DOCUMENTO.Text := sdqConsulta.FieldByName('fi_documento').AsString;
  edFI_CARACTER.Text  := sdqConsulta.FieldByName('fi_caracter').AsString;
  edFI_MATRICULA.Text := sdqConsulta.FieldByName('fi_matricula').AsString;
  fraUsuario.Cargar(sdqConsulta.FieldByName('fi_codusuario').AsString);

  CargarFirma;

  if sdqConsulta.FieldByName('fi_margeninferior').IsNull then
    shpMargenInferior.Top := 0
  else
    shpMargenInferior.Top := imgFirma.Height - sdqConsulta.FieldByName('fi_margeninferior').AsInteger;

  memAreas.Close;
  sdqAreas.Close; {POR LAS DUDAS}

  //sdqAreas.ParamByName('firmante').AsInteger := sdqConsulta.FieldByName('fi_id').AsInteger;
  OpenQueryEx(sdqAreas, [sdqConsulta.FieldByName('fi_id').AsInteger]);

  memAreas.Open;
  memAreas.LoadFromDataSet(sdqAreas, 0 , lmAppend);
end;

function TfrmManCFI_FIRMA.Validar: Boolean;
begin
  Result := False;

  if edFI_FIRMANTE.Text = '' then
    InvalidMsg(edFI_FIRMANTE, 'Debe ingresar Apellido y Nombre del Firmante.')
  else if edFI_CARACTER.Text = '' then
    InvalidMsg(edFI_CARACTER, 'Debe ingresar el Caracter.')
  else
    Result := True;
end;

procedure TfrmManCFI_FIRMA.tbFirmAbrirClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    imgFirma.Picture.LoadFromFile(OpenPictureDialog.FileName);
    imgFirma.Tag := IMG_MODIFIED;
  end;
end;

procedure TfrmManCFI_FIRMA.tbFirmGuardarClick(Sender: TObject);
begin
  if SavePictureDialog.Execute then
    imgFirma.Picture.SaveToFile(SavePictureDialog.FileName);
end;

procedure TfrmManCFI_FIRMA.tbFirmLimpiarClick(Sender: TObject);
begin
  imgFirma.Picture.Bitmap := nil;
  imgFirma.Tag            := IMG_CLEARED;
  shpMargenInferior.Top   := 0;
end;

procedure TfrmManCFI_FIRMA.btnAreasAceptarClick(Sender: TObject);
begin
  Verificar(fraModulo.IsEmpty, fraModulo.edCodigo, 'Debe seleccionar el Módulo a agregar.');
  Verificar(CountRecords(memAreas, ['FA_IDAREATEXTO', 'FA_FECHABAJA'], [fraModulo.Value, ''], 1) > 0,
            fraModulo.edCodigo, 'El Módulo seleccionado ya ha sido cargado para el firmate.');
  Verificar(chkFirmaDigital.Checked and sdqConsulta.FieldByName('fi_firma').IsNull,
            chkFirmaDigital, 'Para poder firmar digitalmente, antes se debe cargar la imagen correspondiente.');
  try
    if memAreas.Locate('fa_idareatexto', fraModulo.Value, []) then
    begin
      memAreas.Edit;
      memAreas.FieldByName('fa_fechabaja').Value       := Null;
      memAreas.FieldByName('fa_usubaja').Value         := Null;
      memAreas.FieldByName('fa_firmadigital').AsString := IIF(chkFirmaDigital.Checked, 'S', 'N');
    end
    else
    begin
      memAreas.Insert;
      memAreas.FieldByName('fa_id').AsInteger          := ART_EMPTY_ID;
      memAreas.FieldByName('fa_idareatexto').AsVariant := fraModulo.Value;
      memAreas.FieldByName('area').AsString            := fraModulo.cmbDescripcion.Text;
      memAreas.FieldByName('fa_usualta').AsString      := Sesion.UserID;
      memAreas.FieldByName('fa_firmadigital').AsString := IIF(chkFirmaDigital.Checked, 'S', 'N');
    end;

    memAreas.FieldByName('modificado').AsBoolean := True;
    memAreas.Post;

    fpAbmAreas.ModalResult := mrOk;
  except
    on E: Exception do
      ErrorMsg(E, 'Error al guardar los datos del Area.');
  end;
end;

procedure TfrmManCFI_FIRMA.dbgAreasGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                 Highlight: Boolean);
begin
  if not memAreas.FieldByName('fa_fechabaja').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManCFI_FIRMA.tbAreasAgregarClick(Sender: TObject);
begin
  fraModulo.Clear;
  chkFirmaDigital.Checked := False;
  if fpAbmAreas.ShowModal = mrOk then
    memAreas.Refresh;
end;

procedure TfrmManCFI_FIRMA.tbAreasQuitarClick(Sender: TObject);
begin
  if (not memAreas.IsEmpty) and memAreas.FieldByName('fa_fechabaja').IsNull and
     (MsgBox('¿ Realmente desea quitar el área seleccionada ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
  begin
   memAreas.Edit;
   memAreas.FieldByName('fa_fechabaja').AsDateTime := DBDateTime;
   memAreas.FieldByName('modificado').AsBoolean    := True;
   memAreas.Post;
  end;
end;

procedure TfrmManCFI_FIRMA.GuardarFirma;
var
  fStream: TStream;
begin
  fStream := TMemoryStream.Create;
  try
    imgFirma.Picture.BitMap.SaveToStream(fStream);
    TBlobField(sdqConsulta.FieldByName('fi_firma')).LoadFromStream(fStream);
  finally
    fStream.Free;
  end;
end;

procedure TfrmManCFI_FIRMA.CargarFirma;
var
  fStream: TStream;
begin
  fStream := sdqConsulta.CreateBlobStream(sdqConsulta.FieldByName('fi_firma'), bmReadWrite); //TMemoryStream.Create;
  try
    imgFirma.Picture.BitMap.LoadFromStream(fStream);
    imgFirma.Tag := IMG_NONE;
  finally
    fStream.Free;
  end;
end;

procedure TfrmManCFI_FIRMA.tbModificarClick(Sender: TObject);
begin
  if sdqConsulta.Active and not sdqConsulta.FieldByName('fi_fechabaja').IsNull then
    raise Exception.Create('No se puede modificar un registro eliminado.');

  HabilitaClaveModificar;

  inherited;
end;

procedure TfrmManCFI_FIRMA.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sSql :=
    'SELECT fi_id, fi_firmante, fi_documento, fi_caracter, fi_firma, fi_margeninferior, fi_usualta, fi_usubaja,' +
          ' fi_fechabaja, fi_codusuario, trunc(fi_fechaalta) fi_fechaalta, fi_matricula, fi_usumodif, fi_fechamodif' +
     ' FROM cfi_firma' +
    ' WHERE 1 = 1';
  sWhere := '';

  if chkActivos.checked then
    sWhere := sWhere + ' AND fi_fechabaja IS NULL';

  if fraFirmantes.IsSelected then
    sWhere := sWhere + ' AND fi_firmante = ''' + fraFirmantes.cmbDescripcion.Text + '''';

  if fraArea.IsSelected then
    sWhere := sWhere + ' AND EXISTS (SELECT 1 ' +
                                     ' FROM cfa_firmantearea ' +
                                    ' WHERE fa_idfirmante = fi_id ' +
                                      ' AND fa_idareatexto = ' + SqlValue(fraArea.Value) + ')';

  sdqConsulta.Sql.Text := sSql + swhere + SortDialog.OrderBy;

  inherited;
end;

procedure TfrmManCFI_FIRMA.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraFirmantes.Clear;
  fraArea.Clear;
  chkActivos.Checked := False;
end;

procedure TfrmManCFI_FIRMA.SetArea(const Value: TAreas);
var
  sSql: String;
begin
  if FArea <> Value then
  begin
    FArea := Value;

    case FArea of
      aCobranzas:
        fraModulo.ExtraCondition := ' AND at_area = ' + SqlValue(AREA_COB);

      aAfiliaciones:
        // desde afiliaciones, también se incluye al area técnica
        fraModulo.ExtraCondition := ' AND at_area IN (' + SqlValue(AREA_AFI) + ', ' + SqlValue(AREA_TEC) + ')';

      aEmision:
        fraModulo.ExtraCondition := ' AND at_area = ' + SqlValue(AREA_EMI);

      aMedSiniIncReca:
        fraModulo.ExtraCondition := ' AND at_area IN (' + SqlValue(AREA_MED) + ',' +
                                                          SqlValue(AREA_SIN) + ',' +
                                                          SqlValue(AREA_INC) + ',' +
                                                          SqlValue(AREA_RECA) + ',' +
                                                          SqlValue(AREA_APAU) + ',' +
                                                          SqlValue(AREA_APTR) +  ',' +
                                                          SqlValue(AREA_RECHPR) +
                                                          IIF(Sesion.Sector = 'COMPUTOS', ',' + SqlValue(AREA_DIN), '')  + ')';
      aDinerarias:
        fraModulo.ExtraCondition := ' AND at_area = ' + SqlValue(AREA_DIN);

      aLegales:
        fraModulo.ExtraCondition := ' AND at_area = ' + SqlValue(AREA_LEG);
    end;

    fraArea.ExtraCondition := fraModulo.ExtraCondition;
    sSql :=
      'SELECT fa_id, fa_idareatexto, at_descripcion area, fa_usualta, fa_fechabaja, fa_usubaja, fa_firmadigital,' +
            ' fa_usumodif, fa_fechamodif ' +
       ' FROM cfa_firmantearea, cat_areatexto' +
      ' WHERE fa_idareatexto = at_id' +
        ' AND fa_idfirmante = :idfirmante' + fraModulo.ExtraCondition +
   ' ORDER BY area';
    sdqAreas.SQL.Text := sSql;
  end;
end;

procedure TfrmManCFI_FIRMA.imgFirmaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  shpMargenInferior.Top := Y;
end;

procedure TfrmManCFI_FIRMA.ScrollBoxResize(Sender: TObject);
begin
  shpMargenInferior.Width := ScrollBox.Width;
end;

procedure TfrmManCFI_FIRMA.HabilitaClaveModificar;
begin
  if Seguridad.Claves.IsActive('clModifica') then
  begin
    LockControl(edFI_FIRMANTE, False);
    LockControl(edFI_DOCUMENTO, False);
    LockControl(edFI_CARACTER, False);
    LockControl(fraUsuario.edCodigo, False);
    LockControl(edFI_MATRICULA, False);
  end
  else
  begin
    LockControl(edFI_FIRMANTE, True);
    LockControl(edFI_DOCUMENTO, True);
    LockControl(edFI_CARACTER, True);
    LockControl(fraUsuario.cmbDescripcion, True);
    LockControl(edFI_MATRICULA, True);
  end;
end;

procedure TfrmManCFI_FIRMA.tbAreasModificarClick(Sender: TObject);
begin
  if (not memAreas.IsEmpty) and memAreas.FieldByName('fa_fechabaja').IsNull then
  begin
    fraModulo.Codigo        := memAreas.FieldByName('fa_idareatexto').AsString;
    chkFirmaDigital.Checked := (memAreas.FieldByName('fa_firmadigital').AsString = 'S');
    if fpAbmAreas.ShowModal = mrOk then
      memAreas.Refresh;
  end;
end;

procedure TfrmManCFI_FIRMA.fpAbmAreasBeforeShow(Sender: TObject);
begin
  LockControl(fraModulo, not fraModulo.IsEmpty);
end;

procedure TfrmManCFI_FIRMA.dbgAreasDblClick(Sender: TObject);
begin
  tbAreasModificarClick(Nil);
end;

procedure TfrmManCFI_FIRMA.btnAceptarClick(Sender: TObject);
var
  sSql: String;
begin
  sSql :=
    'SELECT COUNT(*)' +
     ' FROM cfi_firma' +
    ' WHERE fi_fechabaja IS NULL' +
      ' AND fi_codusuario = :usuario';

  Verificar(fraUsuario.IsEmpty, fraUsuario, 'Debe seleccionar un usuario para continuar.');

  if ModoABM = maAlta then
    Verificar (ValorSqlEx(ssql, [fraUsuario.UserID]) > 0, fraUsuario, 'El usuario seleccionado registra actualmente otro firmante activo.')
  else
    Verificar ((ValorSqlEx(ssql, [fraUsuario.UserID]) > 0) and (fraUsuario.UserID <> sdqConsulta.FieldByName('fi_codusuario').AsString), fraUsuario, 'El usuario seleccionado registra actualmente otro firmante activo.');

  inherited;
end;

end.
