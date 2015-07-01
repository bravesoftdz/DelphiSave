unit unManArchivosExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, unArtFrame,
  unFraCodigoDescripcion, StdCtrls, ExtCtrls, mwCustomEdit, mwHighlighter, mwSqlSyn, ComCtrls, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, ToolWin, IntEdit, Buttons, QueryToFile, CheckCombo, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, PatternEdit, FormPanel, QueryPrint, ImageComboBox, ComboEditor, AsciiCombo, Mask,
  ListSearchEdit, Menus, unArt, unCustomAccionABM, unArtDBAwareFrame,
  AdvMemo, Advmxml, ImgList, RxPlacemnt;

type
  TfrmManArchivosExp = class(TfrmCustomAccionABM)
    PageControl: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsSql: TTabSheet;
    tsCampos: TTabSheet;
    edCodigo: TIntEdit;
    lbCodigo: TLabel;
    Label2: TLabel;
    edDescripcion: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CoolBar1: TCoolBar;
    tbarSql: TToolBar;
    tbSqlLimpiar: TToolButton;
    ToolButton8: TToolButton;
    tbSqlSintaxis: TToolButton;
    tbSqlAutoCampos: TToolButton;
    Label9: TLabel;
    edArchivo: TEdit;
    mwSql: TmwCustomEdit;
    mwSqlSyn: TmwSqlSyn;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    tbCampNuevo: TToolButton;
    tbCampModificar: TToolButton;
    tbCampEliminar: TToolButton;
    ToolButton9: TToolButton;
    tbCampImprimir: TToolButton;
    dbgCampos: TArtDBGrid;
    sdqCampos: TSDQuery;
    dsCampos: TDataSource;
    fpCamposABM: TFormPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edCampOrden: TIntEdit;
    edCampDescripcion: TEdit;
    cmbCampAlineacion: TComboBox;
    edCampAncho: TIntEdit;
    Bevel3: TBevel;
    btnCampAceptar: TButton;
    btnCampCancelar: TButton;
    lbCampMuestra: TLabel;
    qpCampos: TQueryPrint;
    ToolButton1: TToolButton;
    tbCampMoverAbajo: TToolButton;
    tbCampMoverArriba: TToolButton;
    PrinterSetupDialog: TPrinterSetupDialog;
    tbArmarSql: TToolButton;
    tsEventos: TTabSheet;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    tbEvNuevo: TToolButton;
    tbEvModificar: TToolButton;
    tbEvEliminar: TToolButton;
    ToolButton7: TToolButton;
    tbEvMoverAbajo: TToolButton;
    tbEvMoverArriba: TToolButton;
    ToolButton13: TToolButton;
    tbEvImprimir: TToolButton;
    dbgEventos: TArtDBGrid;
    sdqEventos: TSDQuery;
    dsEventos: TDataSource;
    qpEventos: TQueryPrint;
    Bevel6: TBevel;
    Label17: TLabel;
    edRegCommit: TIntEdit;
    Label18: TLabel;
    Label4: TLabel;
    edMaxRegistros: TIntEdit;
    chkFileMustExists: TCheckBox;
    chkResetFile: TCheckBox;
    Label20: TLabel;
    edInsertTabla: TEdit;
    ToolButton2: TToolButton;
    tbSqlImprimir: TToolButton;
    chkSaveHeaders: TCheckBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edQuoteTxt: TPatternEdit;
    edSeparatorTxt: TPatternEdit;
    edEOFTxt: TPatternEdit;
    edEOLTxt: TPatternEdit;
    chkLogErrores: TCheckBox;
    edQuote: TAsciiCombo;
    edSeparator: TAsciiCombo;
    edEOL: TAsciiCombo;
    edEOF: TAsciiCombo;
    Label25: TLabel;
    edCondicion: TEdit;
    edCampCompletar: TAsciiCombo;
    ToolButton3: TToolButton;
    tbCampComprobar: TToolButton;
    edCampNombre: TListSearchEdit;
    tbSqlVistaPrevia: TToolButton;
    ToolButton12: TToolButton;
    pmnuCampos: TPopupMenu;
    Label1: TLabel;
    edFuncionArchivo: TEdit;
    btnAyudaFuncionArchivo: TBitBtn;
    tsXML: TTabSheet;
    edXMLTransformation: TAdvMemo;
    AdvXMLMemoStyler: TAdvXMLMemoStyler;
    ilColor: TImageList;
    ilByN: TImageList;
    pmnuParametros: TPopupMenu;
    procedure FSFormCreate(Sender: TObject);
    procedure tbSqlLimpiarClick(Sender: TObject);
    procedure tbSqlSintaxisClick(Sender: TObject);
    procedure tbSqlAutoCamposClick(Sender: TObject);
    procedure btnCampAceptarClick(Sender: TObject);
    procedure tbCampNuevoClick(Sender: TObject);
    procedure tbCampModificarClick(Sender: TObject);
    procedure tbCampEliminarClick(Sender: TObject);
    procedure tbCampImprimirClick(Sender: TObject);
    procedure qpCamposGetValues(Sender: TObject; Field: TPrintField; var Value: String);
    procedure tbArmarSqlClick(Sender: TObject);
    procedure tbEvNuevoClick(Sender: TObject);
    procedure tbEvModificarClick(Sender: TObject);
    procedure tbEvEliminarClick(Sender: TObject);
    procedure dbgEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure OnCharacterChange(Sender: TObject);
    procedure tbCampMoverClick(Sender: TObject);
    procedure sdqCamposAfterScroll(DataSet: TDataSet);
    procedure tbEvMoverClick(Sender: TObject);
    procedure sdqEventosAfterScroll(DataSet: TDataSet);
    procedure edCampCompletarCloseUp(Sender: TObject);
    procedure tbEvAbmLimpiarClick(Sender: TObject);
    procedure dbgCamposGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbCampComprobarClick(Sender: TObject);
    procedure tbEvImprimirClick(Sender: TObject);
    procedure pmnuCamposClick(Sender: TObject);
    procedure tbEvAgrCampoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure FSFormDestroy(Sender: TObject);
    procedure FSFormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
                               var Handled: Boolean);
    procedure btnAyudaFuncionArchivoClick(Sender: TObject);
    procedure edArchivoChange(Sender: TObject);
  private
    iTotal: Integer;

    procedure CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
    procedure CargarParametros;
  public
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls(ClearPK: Boolean = False); override;
    procedure LoadControls; override;
    procedure LoadGrids;
    procedure LockControls(ALocked: Boolean = True); override;
  end;

const
  PAG_GENERAL = 0;
  PAG_SQL     = 1;
  PAG_CAMPOS  = 2;
  ALINEACIONES: Array[0..2] of String = ('L', 'R', 'C');

var
  frmManArchivosExp: TfrmManArchivosExp;

implementation

uses
  unDmPrincipal, General, StrFuncs, AnsiSql, SqlFuncs, CustomDlgs, EditDialog, unImpoExpo, DBFuncs,
  unEventosABM, unImpoExpoUtils, unSesion;

{$R *.DFM}

procedure TfrmManArchivosExp.CargarParametros;
var
  i: Integer;
	MenuItem: TMenuItem;
begin
	pmnuParametros.Items.Clear;
  with TDataCycler.Create(sdqParametrosAccion) do
  try
    repeat
      if pmnuParametros.FindComponent(sdqParametrosAccion.FieldByName('AT_DESCRIPCION').AsString) = nil then
      begin
        MenuItem := TMenuItem.Create(pmnuCampos);
        MenuItem.Caption := sdqParametrosAccion.FieldByName('AT_CODIGO').AsString;
        MenuItem.OnClick := pmnuParametrosClick;
        pmnuParametros.Items.Add(MenuItem);
      end;
    until not Cycle;

  for i := Low(PARAMETROS_ALL) to High(PARAMETROS_ALL) do
  begin
    MenuItem := TMenuItem.Create(pmnuCampos);
    MenuItem.Caption := PARAMETROS_ALL[i];
    MenuItem.OnClick := pmnuParametrosClick;
    pmnuParametros.Items.Add(MenuItem);
  end;

  finally
    Free;
  end;

  tbEvAgrParametro.Enabled := pmnuParametros.Items.Count > 0;
}
end;

procedure TfrmManArchivosExp.ClearControls(ClearPK: Boolean);
begin
  inherited;
  if ClearPK then
     fraPrimaryKey.Clear;

{
  if ModoABM = maAlta Then
     edCodigo.Value   := IncSql('SELECT MAX(AR_ID) FROM IAR_ARCHIVO')
  else}
     edCodigo.Text    := '';

  edDescripcion.Text        := '';
  edArchivo.Text            := '';
  edFuncionArchivo.Text     := '';
  chkLogErrores.Checked     := True;
  edRegCommit.Text          := '';
  edMaxRegistros.Text       := '';
  edInsertTabla.Text        := '';

  edQuote.Text              := '';
  edSeparator.Text          := '';
  edEOF.Text                := '';
  edEOL.Text                := '';

  edQuoteTxt.Text           := '';
  edSeparatorTxt.Text       := '';
  edEOFTxt.Text             := '';
  edEOLTxt.Text             := '';

  chkFileMustExists.Checked := False;
  chkResetFile.Checked      := True;
  chkSaveHeaders.Checked    := False;

  tbSqlLimpiarClick(nil);

  PageControl.ActivePageIndex := PAG_GENERAL;

  edCampNombre.Items.Clear;
  CargarParametros;

  sdqCampos.Close;
  sdqEventos.Close;
end;

function TfrmManArchivosExp.DoABM: Boolean;
var
  Sql: TSql;
begin
  Sql := TSql.Create('IAR_ARCHIVO');
  try
    if ModoABM = maAlta then
      edCodigo.Value := IncSql('SELECT MAX(AR_ID) FROM IAR_ARCHIVO');

    Sql.PrimaryKey.Add('AR_ID', edCodigo.Value);

    if ModoABM = maBaja then
    begin
      Sql.Fields.Add('AR_USUBAJA', Sesion.UserId);
      Sql.Fields.Add('AR_FECHABAJA', SQL_ACTUALDATE, False);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.Fields.Add('AR_DESCRIPCION',    edDescripcion.Text);
      Sql.Fields.Add('AR_LOG_ERRORES',    chkLogErrores.Checked);
//      Sql.Fields.Add( 'AR_SQL',            mwSql.Text);
      Sql.Fields.Add('AR_MAXREGISTROS',   edMaxRegistros.Value);
      Sql.Fields.Add('AR_ARCHIVONOMBRE',  edArchivo.Text);
      Sql.Fields.Add('AR_ARCHIVOFUNCION', edFuncionArchivo.Text);
      Sql.Fields.Add('AR_SEPARADOR',      Chr(edSeparator.Value));
      Sql.Fields.Add('AR_CAL_TEXTO',      Chr(edQuote.Value));
      Sql.Fields.Add('AR_EOL',            Chr(edEOL.Value));
      Sql.Fields.Add('AR_EOF',            Chr(edEOF.Value));
      Sql.Fields.Add('AR_FILEMUSTEXISTS', chkFileMustExists.Checked);
      Sql.Fields.Add('AR_RECREARARCHIVO', chkResetFile.Checked);
      Sql.Fields.Add('AR_ENCABEZADO',     chkSaveHeaders.Checked);
      Sql.Fields.Add('AR_TRANSACTION',    edRegCommit.Value);
      Sql.Fields.Add('AR_TABLA',          edInsertTabla.Text);

      case ModoABM of
        maAlta:
        begin
          Sql.Fields.Add('AR_USUALTA',   Sesion.UserId);
          Sql.Fields.Add('AR_FECHAALTA', SQL_ACTUALDATE, False);
          Sql.SqlType := stInsert;
        end;

        maModificacion:
        begin
          Sql.Fields.Add('AR_USUMODIF',   Sesion.UserId);
          Sql.Fields.Add('AR_FECHAMODIF', SQL_ACTUALDATE, False);
          Sql.Fields.Add('AR_USUBAJA',    SQL_NULL, False);
          Sql.Fields.Add('AR_FECHABAJA',  SQL_NULL, False);
          Sql.SqlType := stUpdate;
        end;
      end;
    end;

    try
      EjecutarSql(Sql.Sql);

      SaveBlob('SELECT AR_SQL FROM IAR_ARCHIVO WHERE AR_ID = ' + SqlValue(edCodigo.Value),
               'UPDATE IAR_ARCHIVO SET AR_SQL = :AR_SQL WHERE AR_ID = ' + SqlValue(edCodigo.Value),
               'AR_SQL', mwSql.Lines);

      if tsXML.TabVisible then
        SaveBlob('SELECT AR_XMLTRANSFORMATIONFILE FROM IAR_ARCHIVO WHERE AR_ID = ' + SqlValue(edCodigo.Value),
                 'UPDATE IAR_ARCHIVO SET AR_XMLTRANSFORMATIONFILE = :AR_XMLTRANSFORMATIONFILE WHERE AR_ID = ' + SqlValue(edCodigo.Value),
                 'AR_XMLTRANSFORMATIONFILE', edXMLTransformation.Lines);

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
          fraPrimaryKey.Value := Sql.PrimaryKey[0].Value;
          LoadGrids;
        end;

        maModificacion: fraPrimaryKey.Reload;
        maBaja: ClearControls(True);
       end;
  finally
    Sql.Free;
  end;
end;

procedure TfrmManArchivosExp.FSFormCreate(Sender: TObject);
begin
  inherited;
  frmEventosABM := TfrmEventosABM.Create(Self);

  with fraPrimaryKey do
  begin
    FieldID       := 'AR_ID';
    FieldCodigo   := 'AR_ID';
    FieldDesc     := 'AR_DESCRIPCION';
    FieldBaja     := 'AR_FECHABAJA';
    TableName     := 'IAR_ARCHIVO';
    ExtraFields   := ', AR_ARCHIVONOMBRE ';
    {$IFNDEF ART2}
    IdType        := ctInteger;
    CodigoType    := ctInteger;
    {$ENDIF}
  end;
  ClearControls;

  UnTouch := TList.Create;

  UnTouch.Add(edCodigo);
  UnTouch.Add(edQuoteTxt);
  UnTouch.Add(edSeparatorTxt);
  UnTouch.Add(edEOFTxt);
  UnTouch.Add(edEOLTxt);
  UnTouch.Add(tbCampMoverAbajo);
  UnTouch.Add(tbCampMoverArriba);
  UnTouch.Add(tbEvMoverAbajo);
  UnTouch.Add(tbEvMoverArriba);
end;

procedure TfrmManArchivosExp.LoadControls;
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByName('pCodigo').AsInteger := fraPrimaryKey.Value;
  sdqConsulta.Open;

  inherited;
  edCodigo.Value             := sdqConsulta.FieldByName('AR_ID').AsInteger;
  edDescripcion.Text         := sdqConsulta.FieldByName('AR_DESCRIPCION').AsString;
  chkLogErrores.Checked      := sdqConsulta.FieldByName('AR_LOG_ERRORES').AsString = SQL_TRUE;
  mwSql.Text                 := sdqConsulta.FieldByName('AR_SQL').AsString;
  edMaxRegistros.Value       := sdqConsulta.FieldByName('AR_MAXREGISTROS').AsInteger;
  edArchivo.Text             := sdqConsulta.FieldByName('AR_ARCHIVONOMBRE').AsString;
  edFuncionArchivo.Text      := sdqConsulta.FieldByName('AR_ARCHIVOFUNCION').AsString;
  edSeparator.Value          := Ord( GetChar(sdqConsulta.FieldByName('AR_SEPARADOR').AsString));
  edQuote.Value              := Ord( GetChar(sdqConsulta.FieldByName('AR_CAL_TEXTO').AsString));
  edEOL.Value                := Ord( GetChar(sdqConsulta.FieldByName('AR_EOL').AsString));
  edEOF.Value                := Ord( GetChar(sdqConsulta.FieldByName('AR_EOF').AsString));
  chkFileMustExists.Checked  := sdqConsulta.FieldByName('AR_FILEMUSTEXISTS').AsString = SQL_TRUE;
  chkResetFile.Checked       := sdqConsulta.FieldByName('AR_RECREARARCHIVO').AsString = SQL_TRUE;
  chkSaveHeaders.Checked     := sdqConsulta.FieldByName('AR_ENCABEZADO').AsString     = SQL_TRUE;
  edRegCommit.Value          := sdqConsulta.FieldByName('AR_TRANSACTION').AsInteger;
  edInsertTabla.Text         := sdqConsulta.FieldByName('AR_TABLA').AsString;

  edCampNombre.Items.Clear;

  OnCharacterChange(edQuote);
  OnCharacterChange(edSeparator);
  OnCharacterChange(edEOF);
  OnCharacterChange(edEOL);
  CargarParametros;
  LoadGrids;
  BlobSql('SELECT AR_XMLTRANSFORMATIONFILE FROM IMPOEXPO.IAR_ARCHIVO WHERE AR_ID = ' + sdqConsulta.FieldByName('AR_ID').AsString, edXMLTransformation.Lines);
end;

function TfrmManArchivosExp.Validar: Boolean;
begin
  Result := False;

  if edDescripcion.Text = '' then
    InvalidMsg(edDescripcion, 'Debe ingresar la descripción del archivo.')
  else if edArchivo.Text = '' then
    InvalidMsg(edArchivo, 'Debe ingresar el nombre del Archivo.')
  else if Pos('@funcion@', edArchivo.Text) > 0 then
  begin
    if edFuncionArchivo.Text = '' then
      InvalidMsg(edFuncionArchivo, 'Debe ingresar el nombre de la Función del Archivo.');

    try
      EjecutarSql(Format('SELECT %s FROM DUAL', [edFuncionArchivo.Text]));
      Result := True;
    except
      on E: Exception do
        InvalidMsg(edFuncionArchivo, E.Message);
    end;
  end
  else
    Result := True;
end;

procedure TfrmManArchivosExp.LockControls(ALocked: Boolean);
var
  i: Integer;
begin
  inherited;

  PageControl.Enabled := True;
  if ALocked then
    mwSql.Color := clBtnFace
  else
    mwSql.Color := clWindow;

  for i := 0 to mwSqlSyn.AttrCount - 1 do
    mwSqlSyn.Attribute[i].Background := mwSql.Color;
end;

procedure TfrmManArchivosExp.tbSqlLimpiarClick(Sender: TObject);
begin
  mwSql.Lines.Text := ' ';
end;

procedure TfrmManArchivosExp.tbSqlSintaxisClick(Sender: TObject);
var
  sdqSintaxis: TSDQuery;
begin
  try
    sdqSintaxis := TSDQuery.Create(Self);
    try
      SetDatabaseToQuery(sdqSintaxis);
      CheckSintaxis(sdqSintaxis, (Sender = tbSqlSintaxis) or (Sender = tbCampComprobar));

      //if Sender = tbCampComprobar Then
      //begin
      sdqSintaxis.Fields.GetFieldNames(edCampNombre.Items);
      TStringList(edCampNombre.Items).Sort;
      //end;
    finally
      sdqSintaxis.Free;
    end;

    MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);
  except
    on E: Exception do
      ErrorMsg(E, 'Error de Sintaxis');
  end;
end;

procedure TfrmManArchivosExp.tbCampComprobarClick(Sender: TObject);
begin
  tbSqlSintaxisClick(tbCampComprobar);
  dbgCampos.Repaint;
end;

procedure TfrmManArchivosExp.tbSqlAutoCamposClick(Sender: TObject);
var
  sdqAutoFields: TSDQuery;
  i            : Integer;
  Sql          : TSql;
begin
  if MsgBox('Este proceso creará todos los campos del query ingresado.' + #13 + '¿ Está usted seguro ?',
            MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    sdqAutoFields := TSDQuery.Create(Self);
    try
      SetDatabaseToQuery(sdqAutoFields);
      CheckSintaxis(sdqAutoFields, True); // Utiliza chechsintaxis por si tiene parámetros
      Sql := TSql.Create('IAC_ARCHIVOCAMPO');
      try
        for i := 0 to sdqAutoFields.Fields.Count - 1 do
          with sdqAutoFields.Fields[i] do
          begin
            Sql.Clear;
            Sql.Fields.Add('AC_IDARCHIVO',  fraPrimaryKey.Value);
            Sql.Fields.Add('AC_ORDEN',      IncSql('SELECT MAX(AC_ORDEN) FROM IAC_ARCHIVOCAMPO WHERE AC_IDARCHIVO = ' + SqlInt(fraPrimaryKey.Value)));
            Sql.Fields.Add('AC_TITULO',     DisplayLabel);
            Sql.Fields.Add('AC_NOMBRE',     FieldName);
            if DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftLargeint, ftADT] then
            begin
              Sql.Fields.Add('AC_ALINEACION', 'R');
              Sql.Fields.Add('AC_FILLCHAR',   '0');
            end
            else
            begin
              Sql.Fields.Add('AC_ALINEACION', 'L');
              Sql.Fields.Add('AC_FILLCHAR',   ' ');
            end;
            Sql.Fields.Add('AC_ANCHO',      DataSize - 1);
            Sql.Fields.Add('AC_FECHAALTA',  SQL_ACTUALDATE, False);
            Sql.Fields.Add('AC_USUALTA',    Sesion.LoginName);

            EjecutarSql(Sql.InsertSql);
          end;
          sdqCampos.Refresh;
      finally
        Sql.Free;
      end;
    finally
      sdqAutoFields.Free;
    end;
  end;
end;

procedure TfrmManArchivosExp.btnCampAceptarClick(Sender: TObject);
var
  Sql: TSql;
  sSql: String;
begin
  sSql := 'SELECT 1 FROM IAC_ARCHIVOCAMPO WHERE AC_IDARCHIVO = ' + SqlValue(fraPrimaryKey.Value) + ' AND ';

  if edCampOrden.Text = '' then
    InvalidMsg(edCampOrden, 'Debe cargar el número de orden del campo.')
  else if (fpCamposABM.Caption = FORM_CAP_INSERT) and ExisteSql( sSql + 'AC_ORDEN = ' + edCampOrden.TextSql) then
    InvalidMsg(edCampOrden, 'Ya existe un campo con el mismo número de orden.')
  else if edCampNombre.Text = '' then
    InvalidMsg(edCampNombre, 'Debe cargar el nombre del campo.')

{   else if Pos(':', edCampNombre.Text) > 1 Then
      InvalidMsg(edCampNombre, 'El nombre del campo no es válido')}

  else if (fpCamposABM.Caption = FORM_CAP_INSERT) and ExisteSql(sSql + 'AC_NOMBRE = ' + SqlString(edCampNombre.Text, True)) then
    InvalidMsg(edCampNombre, 'Ya existe un campo con el mismo nombre.')
  else
  begin
    Sql := TSql.Create('IAC_ARCHIVOCAMPO');
    try
      Sql.PrimaryKey.Add('AC_IDARCHIVO', fraPrimaryKey.Value);

      Sql.Fields.Add('AC_TITULO',      edCampDescripcion.Text);
      Sql.Fields.Add('AC_NOMBRE',      edCampNombre.Text);
      Sql.Fields.Add('AC_ALINEACION',  ALINEACIONES[cmbCampAlineacion.ItemIndex]);
      Sql.Fields.Add('AC_FILLCHAR',    Chr(edCampCompletar.Value));
      Sql.Fields.Add('AC_ANCHO',       edCampAncho.Value);
      Sql.Fields.Add('AC_CONDICION',   edCondicion.Text);

      if fpCamposABM.Caption = FORM_CAP_INSERT then
      begin
        Sql.PrimaryKey.Add('AC_ORDEN',   edCampOrden.Value);
        Sql.Fields.Add('AC_FECHAALTA', SQL_ACTUALDATE, False);
        Sql.Fields.Add('AC_USUALTA',   Sesion.LoginName);
        Sql.SqlType := stInsert;
      end
      else
      begin
        Sql.PrimaryKey.Add('AC_ORDEN',   sdqCampos.FieldByName('AC_ORDEN').AsInteger);
        Sql.Fields.Add('AC_ORDEN',   edCampOrden.Value);
        Sql.Fields.Add('AC_FECHAMODIF', SQL_ACTUALDATE, False);
        Sql.Fields.Add('AC_USUMODIF',    Sesion.LoginName);
        Sql.SqlType := stUpdate;
      end;
      EjecutarSql(Sql.Sql);
      RefreshAndLocate(sdqCampos, ['AC_ORDEN'], [edCampOrden.TextSql]);
      fpCamposABM.ModalResult := mrOk;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManArchivosExp.tbCampNuevoClick(Sender: TObject);
begin
  edCampOrden.Value           := IncSql('SELECT MAX(AC_ORDEN) FROM IAC_ARCHIVOCAMPO WHERE AC_IDARCHIVO = ' + SqlValue(fraPrimaryKey.Value));
  edCampDescripcion.Text      := '';
  edCampNombre.Text           := '';
  cmbCampAlineacion.ItemIndex := 0;
  edCampCompletar.Value       := 32;
  edCampCompletarCloseUp(nil);
  edCampAncho.Value           := 0;
  edCondicion.Text            := '';

  fpCamposABM.Caption := FORM_CAP_INSERT;
  fpCamposABM.ShowModal;
end;

procedure TfrmManArchivosExp.tbCampModificarClick(Sender: TObject);
begin
  if tbCampModificar.Enabled and (not sdqCampos.IsEmpty) then
  begin
    edCampOrden.Value           := sdqCampos.FieldByName('AC_ORDEN').AsInteger;
    edCampDescripcion.Text      := sdqCampos.FieldByName('AC_TITULO').AsString;
    edCampNombre.Text           := sdqCampos.FieldByName('AC_NOMBRE').AsString;
    cmbCampAlineacion.ItemIndex := ArrayPos(sdqCampos.FieldByName('AC_ALINEACION').AsString, ALINEACIONES);
    edCampCompletar.Value       := Ord(GetChar(sdqCampos.FieldByName('AC_FILLCHAR').AsString));
    edCampAncho.Value           := sdqCampos.FieldByName('AC_ANCHO').AsInteger ;
    edCondicion.Text            := sdqCampos.FieldByName('AC_CONDICION').AsString;

    fpCamposABM.Caption := FORM_CAP_MODIFY;
    fpCamposABM.ShowModal
  end;
end;

procedure TfrmManArchivosExp.tbCampEliminarClick(Sender: TObject);
var
  sSql: String;
begin
  if MsgBox('¿ Desea eliminar el Campo Seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    sSql := 'DELETE FROM IAC_ARCHIVOCAMPO ' +
             'WHERE AC_IDARCHIVO = ' + SqlInt(fraPrimaryKey.Value) + ' ' +
               'AND AC_ORDEN = '   + SqlInt(sdqCampos.FieldByName('AC_ORDEN').AsInteger);
    EjecutarSql(sSql);
    sdqCampos.Refresh;
  end;
end;

procedure TfrmManArchivosExp.tbCampImprimirClick(Sender: TObject);
begin
  if PrinterSetupDialog.Execute then
  begin
    iTotal := 0;
    qpCampos.Title.Text := 'Estructura del Archivo ' + fraPrimaryKey.cmbDescripcion.Text;
    qpCampos.Print;
  end;
end;

procedure TfrmManArchivosExp.qpCamposGetValues(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.Title = 'Desde' then
    Value  := IntToStr(iTotal + 1)
  else if Field.Title = 'Hasta' then
  begin
    iTotal := iTotal + sdqCampos.FieldByName('AC_ANCHO').AsInteger;
    Value  := IntToStr(iTotal);
  end;
end;

procedure TfrmManArchivosExp.tbArmarSqlClick(Sender: TObject);
var
  sdqAutoQuery: TSDQuery;
  sTabla: String;
  sSql: String;
  i: Integer;
begin
  if (mwSql.Lines.Text = '') or (MsgBox('¿ Desea armar automáticamente el sql de la tabla ?', MB_ICONQUESTION +
      MB_YESNO) = IDYES) then
  begin
    sTabla := InputBox('Consulta Automática', 'Ingrese el nombre de la tabla', '');
    if sTabla <> '' then
    begin
      sdqAutoQuery := GetQuery('SELECT * FROM ' + sTabla);
      try
        sSql := 'SELECT ';
        for i := 0 to sdqAutoQuery.Fields.Count - 1 do
          with sdqAutoQuery.Fields[i] do
            if IsValidIdent(FieldName) then
              sSql := sSql + FieldName + ', ' + #13 + '       '
            else
              sSql := sSql + '"' + FieldName + '" AS CAMPO_' + IntToStr(i) + ', ' + #13 + '       ';

        SetLength(sSql, Length(sSql) - 10);
        sSql := sSql + #13 + '  FROM ' + sTabla;
        mwSql.Lines.Text := sSql;
      finally
        sdqAutoQuery.Free;
      end;
    end;
  end;
end;

procedure TfrmManArchivosExp.tbEvNuevoClick(Sender: TObject);
begin
  frmEventosABM.cmbEvMomento.ItemIndex    := 0;
  frmEventosABM.cmbEvErrores.ItemIndex    := 0;
  frmEventosABM.cmbEvTipoAccion.ItemIndex := 3;
  frmEventosABM.mwEvSql.Text              := ' ';
  frmEventosABM.chkEvCheckParams.Checked  := True;

  frmEventosABM.Caption := FORM_CAP_INSERT;
  frmEventosABM.ShowModal;
end;

procedure TfrmManArchivosExp.tbEvModificarClick(Sender: TObject);
begin
  if tbEvModificar.Enabled and (not sdqEventos.IsEmpty) then
  begin
    frmEventosABM.cmbEvMomento.ItemIndex    := ArrayPos(sdqEventos.FieldByName('AE_MOMENTO').AsString, [TME_FILEBEFORE, TME_FILEAFTER, TME_RECORDBEFORE, TME_RECORDAFTER]);
    frmEventosABM.cmbEvErrores.ItemIndex    := ArrayPos(sdqEventos.FieldByName('AE_ACCIONERROR').AsString, ['C', 'S', 'I', 'M']);
    frmEventosABM.cmbEvTipoAccion.ItemIndex := ArrayPos(sdqEventos.FieldByName('AE_TIPOACCION').AsString, [ATA_READ, ATA_WRITE, ATA_QUERY, ATA_ALL]);

    frmEventosABM.mwEvSql.Text              := sdqEventos.FieldByName('AE_SQL').AsString + ' ';
    frmEventosABM.chkEvCheckParams.Checked  := sdqEventos.FieldByName('AE_USARPARAMETROS').AsString = SQL_TRUE;

    frmEventosABM.Caption := FORM_CAP_MODIFY;
    frmEventosABM.ShowModal
  end;
end;

procedure TfrmManArchivosExp.tbEvEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if MsgBox('¿ Desea eliminar el Evento Seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Sql := TSql.Create('IAE_ARCHIVOEVENTO');
    try
      Sql.PrimaryKey.Add('AE_IDARCHIVO', fraPrimaryKey.Value);
      Sql.PrimaryKey.Add('AE_ORDEN',     sdqEventos.FieldByName('AE_ORDEN').AsInteger);
      Sql.Fields.Add('AE_FECHABAJA',     SQL_ACTUALDATE, False);
      Sql.Fields.Add('AE_USUBAJA',       Sesion.LoginName);

      EjecutarSql(Sql.UpdateSql);
      sdqEventos.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManArchivosExp.dbgEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                     var Background: TColor; Highlight: Boolean);
begin
  if not sdqEventos.FieldByName('AE_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManArchivosExp.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  tsCampos.Enabled  := (ModoABM <> maAlta);
  tsEventos.Enabled := (ModoABM <> maAlta);
end;

procedure TfrmManArchivosExp.LoadGrids;
begin
  sdqCampos.Close;
//  sdqCampos.ParamByName('pArchivo').AsInteger := StrToInt('0' + fraPrimaryKey.Value);
  sdqCampos.Sql.Text := 'SELECT AC_ORDEN, AC_NOMBRE, ' +
                                SqlDecode('AC_ALINEACION', ['''L''', '''R''', '''C'''], ['''Izquierda''', '''Derecha''', '''Centrado''']) + ' AS ALINEACION, ' +
                                'AC_ALINEACION, AC_FILLCHAR, AC_ANCHO, AC_TITULO, AC_CONDICION ' +
                           'FROM IAC_ARCHIVOCAMPO ' +
                          'WHERE AC_IDARCHIVO = ' + SqlValue(fraPrimaryKey.Value) +
                         ' ORDER BY AC_ORDEN ';
  OpenQuery(sdqCampos);

  sdqEventos.Close;
//  sdqEventos.ParamByName('pArchivo').AsInteger := StrToInt('0' + fraPrimaryKey.Value);
  sdqEventos.Sql.Text := 'SELECT AE_ORDEN, AE_MOMENTO, AE_ACCIONERROR, AE_TIPOACCION, ' +
                                 SqlDecodeStr('AE_MOMENTO', TE_MOMENTOS, ['Antes de Procesar el Archivo', 'Despues de Procesar el Archivo', 'Antes de Procesar el Registro', 'Despues de Procesar el Registro']) + ' AS MOMENTO, ' +
                                 SqlDecodeStr('AE_ACCIONERROR', ['C', 'S', 'I', 'M'], ['Cancelar Todo', 'Omitir Registro', 'Ignorar Error', 'Mensaje (Aceptar / Cancelar)']) + ' AS ACCIONERROR, ' +
                                 SqlDecodeStr('AE_TIPOACCION', [ATA_READ, ATA_WRITE, ATA_QUERY, ATA_ALL], ['Lectura', 'Escritura', 'Consulta', 'Siempre']) + ' AS TIPOACCION, ' +
                                'AE_SQL, AE_USARPARAMETROS, AE_FECHABAJA ' +
                           'FROM IAE_ARCHIVOEVENTO ' +
                          'WHERE AE_IDARCHIVO = ' + SqlValue(fraPrimaryKey.Value) +
                         ' ORDER BY ' + SqlDecodeStr('AE_MOMENTO', TE_MOMENTOS, ['0', '3', '1', '2']) + ', AE_ORDEN';
  OpenQuery(sdqEventos);
end;

procedure TfrmManArchivosExp.OnCharacterChange(Sender: TObject);
var
  Editor: TComponent;
begin
  Editor := FindComponent(TComponent(Sender).Name + 'Txt');
  if Assigned(Editor) and (Editor is TCustomEdit) then
    TCustomEdit(Editor).Text := TAsciiCombo(Sender).ShortName;
end;

procedure TfrmManArchivosExp.tbCampMoverClick(Sender: TObject);
var
  sSql: String;
  bAbajo: Boolean;
begin
  {$IFDEF SQLSERVER}
  MsgBox('La opción no está habilitada para SqlServer', MB_ICONEXCLAMATION);
  {$ELSE}{$IFDEF MSACCESS}
  MsgBox('La opción no está habilitada para Microsoft Access', MB_ICONEXCLAMATION);
  {$ELSE}
  bAbajo := TComponent(Sender).Tag > 0 ;
  sSql := 'DECLARE ' +
            'RowId_Origen  ROWID; ' +
            'Orden_Origen  Number; ' +
            'RowId_Destino ROWID; ' +
            'Orden_Destino Number; ' +
          'BEGIN ' +
            'SELECT ROWID, AC_ORDEN ' +
              'INTO RowId_Origen, Orden_Origen ' +
              'FROM IAC_ARCHIVOCAMPO ' +
             'WHERE AC_IDARCHIVO = ' + SqlValue(fraPrimaryKey.Value) + ' ' +
               'AND AC_ORDEN = ' + SqlInt( sdqCampos.FieldByName('AC_ORDEN').AsInteger ) + '; ' +

            'SELECT AC_ORDEN, ROWID ' +
              'INTO Orden_Destino, RowId_Destino ' +
              'FROM IAC_ARCHIVOCAMPO O ' +
             'WHERE AC_IDARCHIVO = ' + SqlValue(fraPrimaryKey.Value) + ' ' +
               'AND AC_ORDEN = (SELECT ' + IIF(bAbajo, 'MIN', 'MAX') + '(D.AC_ORDEN) ' +
                                 'FROM IAC_ARCHIVOCAMPO D ' +
                                'WHERE D.AC_IDARCHIVO = O.AC_IDARCHIVO ' +
                                  'AND D.AC_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt( sdqCampos.FieldByName('AC_ORDEN').AsInteger ) + '); ' +
            'UPDATE IAC_ARCHIVOCAMPO O ' +
               'SET AC_ORDEN = (SELECT MAX(D.AC_ORDEN) + 1 FROM IAC_ARCHIVOCAMPO D WHERE D.AC_IDARCHIVO = O.AC_IDARCHIVO) ' +
             'WHERE ROWID = RowId_Origen; ' +

            'UPDATE IAC_ARCHIVOCAMPO ' +
               'SET AC_ORDEN = Orden_Origen ' +
             'WHERE ROWID = RowId_Destino; ' +

            'UPDATE IAC_ARCHIVOCAMPO ' +
               'SET AC_ORDEN = Orden_Destino ' +
             'WHERE ROWID = RowId_Origen; ' +
          'END;';
  EjecutarSql(sSql);
  sdqCampos.Refresh;

  if bAbajo Then
     sdqCampos.Next
  else
     sdqCampos.Prior;
  {$ENDIF}{$ENDIF}
end;

procedure TfrmManArchivosExp.sdqCamposAfterScroll(DataSet: TDataSet);
begin
  tbCampMoverArriba.Enabled := DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};
  tbCampMoverAbajo.Enabled  := DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF};
end;

procedure TfrmManArchivosExp.tbEvMoverClick(Sender: TObject);
var
  sSql: String;
  bAbajo: Boolean;
begin
  {$IFDEF SQLSERVER}
  MsgBox('La opción no está habilitada para SqlServer', MB_ICONEXCLAMATION);
  {$ELSE}{$IFDEF MSACCESS}
  MsgBox('La opción no está habilitada para Microsoft Access', MB_ICONEXCLAMATION);
  {$ELSE}
  bAbajo := TComponent(Sender).Tag > 0 ;
  sSql := 'DECLARE ' +
            'RowId_Origen  ROWID; ' +
            'Orden_Origen  Number; ' +
            'RowId_Destino ROWID; ' +
            'Orden_Destino Number; ' +
          'BEGIN ' +
            'SELECT ROWID, AE_ORDEN ' +
              'INTO RowId_Origen, Orden_Origen ' +
              'FROM IAE_ARCHIVOEVENTO ' +
             'WHERE AE_IDARCHIVO = ' + SqlValue(fraPrimaryKey.Value) + ' ' +
               'AND AE_ORDEN = ' + SqlInt( sdqEventos.FieldByName('AE_ORDEN').AsInteger ) + ' ' +
               'AND AE_MOMENTO = ''' + sdqEventos.FieldByName('AE_MOMENTO').AsString + '''; ' +

            'SELECT AE_ORDEN, ROWID ' +
              'INTO Orden_Destino, RowId_Destino ' +
              'FROM IAE_ARCHIVOEVENTO O ' +
             'WHERE AE_IDARCHIVO = ' + SqlValue(fraPrimaryKey.Value) + ' ' +
               'AND AE_MOMENTO = ''' + sdqEventos.FieldByName('AE_MOMENTO').AsString + ''' ' +
               'AND AE_ORDEN = (SELECT ' + IIF( bAbajo,'MIN', 'MAX')  + '(D.AE_ORDEN) ' +
                                 'FROM IAE_ARCHIVOEVENTO D ' +
                                'WHERE D.AE_IDARCHIVO = O.AE_IDARCHIVO ' +
                                  'AND D.AE_MOMENTO = O.AE_MOMENTO ' +
                                  'AND D.AE_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt( sdqEventos.FieldByName('AE_ORDEN').AsInteger ) + '); ' +
            'UPDATE IAE_ARCHIVOEVENTO O ' +
               'SET AE_ORDEN = (SELECT MAX(D.AE_ORDEN) + 1 FROM IAE_ARCHIVOEVENTO D WHERE D.AE_IDARCHIVO = O.AE_IDARCHIVO) ' +
             'WHERE ROWID = RowId_Origen; ' +

            'UPDATE IAE_ARCHIVOEVENTO ' +
               'SET AE_ORDEN = Orden_Origen ' +
             'WHERE ROWID = RowId_Destino; ' +

            'UPDATE IAE_ARCHIVOEVENTO ' +
               'SET AE_ORDEN = Orden_Destino ' +
             'WHERE ROWID = RowId_Origen; ' +
          'END;';
  try
     EjecutarSql(sSql);
  except
     MsgBox('No se movió el registro.' + #13 + 'Tenga en cuenta que la lista está ordenada por Momento / Orden', MB_ICONEXCLAMATION);
  end;
  sdqEventos.Refresh;

  if bAbajo then
    sdqEventos.Next
  else
    sdqEventos.Prior;
  {$ENDIF}{$ENDIF}
end;

procedure TfrmManArchivosExp.sdqEventosAfterScroll(DataSet: TDataSet);
begin
  tbEvMoverArriba.Enabled := DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};
  tbEvMoverAbajo.Enabled  := DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF};
end;

procedure TfrmManArchivosExp.edCampCompletarCloseUp(Sender: TObject);
begin
  lbCampMuestra.Caption := edCampCompletar.ShortName;
end;

procedure TfrmManArchivosExp.tbEvAbmLimpiarClick(Sender: TObject);
begin
  frmEventosABM.mwEvSql.Lines.Text := ' ';
end;

procedure TfrmManArchivosExp.CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
var
  iProcesoId: Integer;
  sSql: String;
begin
  sSql :=
    'SELECT pa_idproceso' +
     ' FROM iar_archivo JOIN ipa_procesoaccion ON(    ar_id = pa_relacion' +
                                                ' AND pa_tipoaccion = ''A'')' +
                                           ' AND ar_id = ' + SqlValue(edCodigo.Value);
  iProcesoId := ValorSqlInteger(sSql);                                           

  if ArchivoSql then
    sSql := mwSql.Lines.Text
  else
    sSql := frmEventosABM.mwEvSql.Lines.Text;

  CheckQuery(iProcesoId, AQuery, sSql, ArchivoSql);
end;

procedure TfrmManArchivosExp.dbgCamposGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                    Highlight: Boolean);
var
  iFind: Integer;
begin
  inherited;

  iFind := 0;
  if (Field.FieldName = 'AC_NOMBRE') and (not TStringList(edCampNombre.Items).Find(Field.AsString, iFind)) then
    AFont.Color := clRed;
end;

procedure TfrmManArchivosExp.tbEvImprimirClick(Sender: TObject);
begin
  if PrinterSetupDialog.Execute then
  begin
    qpEventos.SetGridColumns(dbgEventos, True, [baDetail, baHeader, baTotal, baSubTotal]);
    qpEventos.Title.Text := 'Eventos del Archivo ' + fraPrimaryKey.cmbDescripcion.Text;
    qpEventos.Print;
  end;
end;

procedure TfrmManArchivosExp.pmnuCamposClick(Sender: TObject);
begin
  frmEventosABM.mwEvSql.SelText := ':' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
end;

procedure TfrmManArchivosExp.tbEvAgrCampoClick(Sender: TObject);
begin
  frmEventosABM.tbEvAgrCampo.CheckMenuDropdown;
end;

procedure TfrmManArchivosExp.tbEliminarClick(Sender: TObject);
begin
  if MsgAsk('¿ Realmente desea dar de baja este proceso ?') then
    inherited;
end;

procedure TfrmManArchivosExp.FSFormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(frmEventosABM);
end;

procedure TfrmManArchivosExp.FSFormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
                                              var Handled: Boolean);
var
  msg: Cardinal;
  code: Cardinal;
  i, n: Integer;
begin
  if WindowFromPoint(mouse.Cursorpos) = mwSql.Handle then
  begin
    Handled := True;
    if ssShift in Shift then
      msg := WM_HSCROLL
    else
      msg := WM_VSCROLL;

    if WheelDelta < 0 then
      code := SB_LINEDOWN
    else
      code := SB_LINEUP;

    n:= Mouse.WheelScrollLines;
    for i:= 1 to n do
      mwSql.Perform(msg, code, 0);
    mwSql.Perform(msg, SB_ENDSCROLL, 0);
  end;
end;

procedure TfrmManArchivosExp.btnAyudaFuncionArchivoClick(Sender: TObject);
begin
  MsgBox(
    'Este campo se puede usar cuando uno quiere que el nombre del archivo sea dinámico.' + #13#10 +
    'En este campo debe ir el nombre de una función de oracle.' + #13#10 +
    'Para activar esta funcionalidad en el campo nombre del archivo debe ir el texto "@funcion@", por ejemplo:' + #13#10 + #13#10 +
    'Nombre del Archivo: nomina@funcion@.xls' + #13#10 +
    'Función del Archivo: ART.AFILIACIONES.GetNumeroNomina' + #13#10 + #13#10 +
    'Suponiendo que la función devuelve el valor 1, entonces el nombre del archivo se generará con el nombre nomina1.xls.',
    0, '[Ayuda]  -  Función del Archivo'    
  );
end;

procedure TfrmManArchivosExp.edArchivoChange(Sender: TObject);
begin
  tsXML.TabVisible := UpperCase(ExtractFileExt(edArchivo.Text)) = '.XML';
end;

end.
