unit unManAcciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, unArtFrame,
  unFraCodigoDescripcion, StdCtrls, ExtCtrls, mwCustomEdit, mwHighlighter, mwSqlSyn, ComCtrls, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, ToolWin, IntEdit, Buttons, QueryToFile, CheckCombo, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, PatternEdit, FormPanel, QueryPrint, ImageComboBox, ComboEditor, AsciiCombo, Mask,
  ListSearchEdit, Menus, unArt, unCustomAccionABM, unParser, mwPasSyn, unfraCtbTablas, RxRichEd, unfraUsuarios,
  unFraToolbarRTF, sx_MAPI, ToolEdit, unArtDBAwareFrame, ImgList,
  mwGeneralSyn, AdvMemo, AdvmWS, RxToolEdit, RxPlacemnt;

type
	TfrmManAcciones = class(TfrmCustomAccionABM)
		PageControl: TPageControl;
		tsDatosGenerales: TTabSheet;
		edCodigo: TIntEdit;
		lbCodigo: TLabel;
		Label2: TLabel;
		mwSqlSyn: TmwSqlSyn;
		sdqCampos: TSDQuery;
		dsCampos: TDataSource;
		qpCampos: TQueryPrint;
		PrinterSetupDialog: TPrinterSetupDialog;
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
    fpEventosABM: TFormPanel;
    Bevel4: TBevel;
    Label21: TLabel;
    btnEvAceptar: TButton;
    btnEvCancelar: TButton;
		Label3: TLabel;
    cmbEvMomento: TImageComboBox;
    Label16: TLabel;
    cmbEvErrores: TImageComboBox;
		Bevel5: TBevel;
		pnlEventSql: TPanel;
    chkEvCheckParams: TCheckBox;
		sdqEventos: TSDQuery;
		dsEventos: TDataSource;
		qpEventos: TQueryPrint;
    chkLogErrores: TCheckBox;
    tbEvToolBar: TToolBar;
    tbEvAbmLimpiar: TToolButton;
    ToolButton5: TToolButton;
    tbEvAbmSintaxis: TToolButton;
    tbEvAbmImprimir: TToolButton;
		tbEvAbmSintaxisEx: TToolButton;
    ToolButton10: TToolButton;
    tbEvAgrCampo: TToolButton;
    pmnuCampos: TPopupMenu;
		btnEvAplicar: TButton;
		pcEvent: TPageControl;
		tsSqlScript: TTabSheet;
		tsPascalScript: TTabSheet;
    mwEvSql: TmwCustomEdit;
    mwEvScript: TmwCustomEdit;
    mOutputCompilacion: TMemo;
		Spl: TSplitter;
		edDescripcion: TMemo;
    tsFormatoMensaje: TTabSheet;
		tsSql: TTabSheet;
    CoolBar1: TCoolBar;
		tbarSql: TToolBar;
		tbSqlLimpiar: TToolButton;
		ToolButton8: TToolButton;
		tbSqlSintaxis: TToolButton;
		ToolButton2: TToolButton;
		tbSqlVistaPrevia: TToolButton;
		ToolButton12: TToolButton;
		tbSqlImprimir: TToolButton;
		mwSql: TmwCustomEdit;
		fraUsuarioPropietario: TfraUsuario;
    lUsuarioPropietario: TLabel;
    tbArmarSql: TToolButton;
    Label5: TLabel;
    lbProceso: TLabel;
		fraProceso: TfraCodigoDescripcion;
		fraTipoAccion: TfraCtbTablas;
    tbEvAgrParametro: TToolButton;
		pmnuParametros: TPopupMenu;
    sdqParametrosAccion: TSDQuery;
    ToolButton1: TToolButton;
    edtCantidadRegistrosSuspenderAlerta: TIntEdit;
    Label4: TLabel;
    Label1: TLabel;
    cmbDestinoCorreo: TComboBox;
    lblCampoRepresentaDestino: TLabel;
    tsParametros: TTabSheet;
    CoolBar2: TCoolBar;
    ToolBar1: TToolBar;
    tbParaNuevo: TToolButton;
    tbParaModificar: TToolButton;
    tbParaEliminar: TToolButton;
    ToolButton3: TToolButton;
    tbParamMoverAbajo: TToolButton;
    tbParamMoverArriba: TToolButton;
    ToolButton9: TToolButton;
    ToolButton14: TToolButton;
    dbgParametros: TRxDBGrid;
    fpParametros: TFormPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    spVerificarSintaxis: TSpeedButton;
    fraParaTipoDato: TfraCtbTablas;
    edParaCodigo: TPatternEdit;
    edParaDescripcion: TEdit;
    btnParaAceptar: TButton;
    btnParaCancelar: TButton;
    edParaOrigen: TEdit;
    dsParametrosAccion: TDataSource;
    Label6: TLabel;
    edMotivoMensaje: TEdit;
    chkAnexa: TCheckBox;
    chkAdjuntaArchivo: TCheckBox;
    edDirectoryExport: TDirectoryEdit;
    lblDirectory: TLabel;
    Label7: TLabel;
    edDirectoryImport: TDirectoryEdit;
    Label8: TLabel;
    edDirectoryProcesoImport: TDirectoryEdit;
    ilColor: TImageList;
    ilByN: TImageList;
    pcMensaje: TPageControl;
    tsRTF: TTabSheet;
    tsHTML: TTabSheet;
    fraFormatoMensaje: TfraToolbarRTF;
    edFormatoMensaje: TRxRichEdit;
    edHTML: TAdvMemo;
    AdvHTMLMemoStyler: TAdvHTMLMemoStyler;

    procedure FSFormCreate(Sender: TObject);
		procedure tbSqlLimpiarClick(Sender: TObject);
		procedure tbSqlSintaxisClick(Sender: TObject);
    procedure qpCamposGetValues(Sender: TObject; Field: TPrintField; var Value: String);
    procedure tbArmarSqlClick(Sender: TObject);
		procedure tbEvNuevoClick(Sender: TObject);
    procedure tbEvModificarClick(Sender: TObject);
    procedure tbEvEliminarClick(Sender: TObject);
    procedure btnEvAceptarClick(Sender: TObject);
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
    procedure tbEvAbmSintaxisExClick(Sender: TObject);
		procedure tbEvImprimirClick(Sender: TObject);
    procedure fpEventosABMShow(Sender: TObject);
    procedure pmnuCamposClick(Sender: TObject);
    procedure tbSqlImprimirClick(Sender: TObject);
    procedure fraFormatoMensajetbGuardarClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure tbParaNuevoClick(Sender: TObject);
    procedure tbParaModificarClick(Sender: TObject);
    procedure tbParaEliminarClick(Sender: TObject);
    procedure tbParamMoverAbajoClick(Sender: TObject);
    procedure btnParaAceptarClick(Sender: TObject);
    procedure spVerificarSintaxisClick(Sender: TObject);
    procedure fraFormatoMensajetbPegarClick(Sender: TObject);
    procedure chkAdjuntaArchivoClick(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
	private
    DefParamEditor: TWinControl;
    FAEOrden: Integer;
		iTotal: Integer;
    ModoAbmEvento: TModoAbm;

		procedure CargarCamposParametros;
		procedure CargarParametros;
		procedure CheckScript;
		procedure CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
		procedure CheckSQL(Sender: TObject);
		procedure OnFraTipoAccionChange(Sender: TObject);
    procedure OnFraTipoDatoParametroChange(Sender: TObject);
		procedure pmnuParametrosClick(Sender: TObject);
		procedure SqlAutoCampos;
		procedure SqlEliminarCampos;
  public
		function DoABM: Boolean; override;
		function Validar: Boolean; override;

		procedure ClearControls(ClearPK: Boolean = False); override;
		procedure LoadControls; override;
		procedure LoadGrids;
		procedure LockControls(ALocked: Boolean = True); override;
	end;

const
	PAG_GENERAL   = 0;
	PAG_SQL       = 1;
  PAG_PARAMETRO = 2;
	PAG_EVENTOS   = 3;

	PAG_EVENTOSSQL 		= 0;
	PAG_EVENTOSSCRIPT = 1;
	PAG_EVENTOSMAIL 	= 2;


  ALINEACIONES: Array[0..2] of String = ('L', 'R', 'C');

var
  frmManAcciones: TfrmManAcciones;

implementation

uses
  unDmPrincipal, General, StrFuncs, AnsiSql, SqlFuncs, CustomDlgs, EditDialog, unAlertaTypes, DBFuncs,
  unAlertas, unImpoExpoTypes, unParams, unSesion, Internet;

{$R *.DFM}

procedure TfrmManAcciones.ClearControls(ClearPK: Boolean);
begin
  inherited;
  
  if ClearPK then
    fraPrimaryKey.Clear;

  edCodigo.Text         := '';
  edDescripcion.Text    := '';
  edMotivoMensaje.Text  := '';
  chkLogErrores.Checked := False;
  chkAnexa.Checked := False;


  fraUsuarioPropietario.Limpiar;
  fraTipoAccion.Limpiar;

//  fraProceso.visible := false;
//  lbProceso.Visible  := false;

  fraProceso.Clear;
  chkAdjuntaArchivo.Checked := False;
  edDirectoryExport.Clear;
  edDirectoryImport.Clear;
  edDirectoryProcesoImport.Clear;

  tbSqlLimpiarClick(nil);
  PageControl.ActivePageIndex := PAG_GENERAL;

  sdqCampos.Close;
  sdqParametrosAccion.Close;  
  sdqEventos.Close;
end;

function TfrmManAcciones.DoABM: Boolean;
var
  Sql: TSql;
begin
  Result := False;
  Sql := TSql.Create('CAN_ACCION');
  try
    if ModoABM = maAlta then
      edCodigo.Value := IncSql('SELECT MAX(AN_ID) FROM CAN_ACCION');

    Sql.PrimaryKey.Add('AN_ID', edCodigo.Value);
    if ModoABM = maBaja then
    begin
      Sql.Fields.Add('AN_USUBAJA',   Sesion.UserId);
      Sql.Fields.Add('AN_FECHABAJA', SQL_ACTUALDATE, False);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.Fields.Add('AN_DESCRIPCION',             edDescripcion.Text);
      Sql.Fields.Add('AN_MOTIVOMENSAJE',           edMotivoMensaje.Text);
      Sql.Fields.Add('AN_REGISTROSSUSPENDEACCION', edtCantidadRegistrosSuspenderAlerta.Text);
      Sql.Fields.Add('AN_USUARIO',                 fraUsuarioPropietario.edCodigo.text);
      Sql.Fields.Add('AN_TIPOACCION',              fraTipoAccion.Value);

      if (fraTipoAccion.edCodigo.Text = 'IE') then
      begin
        Sql.Fields.Add('AN_SQL',                    SQL_NULL, False);
        Sql.Fields.Add('AN_IDPROCESO',              Integer(fraProceso.Value));
        Sql.Fields.Add('AN_ADJUNTAARCHIVOIMPOEXPO', chkAdjuntaArchivo.Checked);
        Sql.Fields.Add('AN_DIRECTORIOEXPORT',       edDirectoryExport.Text);
        Sql.Fields.Add('AN_DIRECTORIOIMPORT',       edDirectoryImport.Text);
        Sql.Fields.Add('AN_DIRIMPORTPROCESADA',     edDirectoryProcesoImport.Text);
      end
      else
      begin
        Sql.Fields.Add('AN_IDPROCESO', SQL_NULL, False);
        Sql.Fields.Add('AN_ADJUNTAARCHIVOIMPOEXPO', SQL_NULL, False);
        Sql.Fields.Add('AN_DIRECTORIOEXPORT', SQL_NULL, False);
        Sql.Fields.Add('AN_DIRECTORIOIMPORT', SQL_NULL, False);
        Sql.Fields.Add('AN_DIRIMPORTPROCESADA', SQL_NULL, False);
      end;

      Sql.Fields.Add('AN_LOG_ERRORES', chkLogErrores.Checked);
      Sql.Fields.Add('AN_ANEXA',       chkAnexa.Checked);

      case ModoABM of
        maAlta:
        begin
          Sql.Fields.Add('AN_USUALTA',   Sesion.UserId);
          Sql.Fields.Add('AN_FECHAALTA', SQL_ACTUALDATE, False);
          Sql.SqlType := stInsert;
        end;
        maModificacion:
        begin
          Sql.Fields.Add('AN_USUMODIF',   Sesion.UserId);
          Sql.Fields.Add('AN_FECHAMODIF', SQL_ACTUALDATE, False);
          Sql.Fields.Add('AN_USUBAJA',    SQL_NULL, False);
          Sql.Fields.Add('AN_FECHABAJA',  SQL_NULL, False);
          Sql.SqlType := stUpdate;
        end;
      end;
    end;

    try
      EjecutarSql(Sql.Sql);

      //Borro siempre los campos. Si corresponde los regenerará mas abajo..
      SqlEliminarCampos;
      if (Trim(mwSql.Lines.Text) <> '') then
      begin
        SaveBlob('SELECT AN_SQL' +
                  ' FROM CAN_ACCION' +
                 ' WHERE AN_ID = ' + SqlValue(edCodigo.Value),
								 'UPDATE CAN_ACCION' +
                   ' SET AN_SQL = :AN_SQL' +
                 ' WHERE AN_ID = ' + SqlValue(edCodigo.Value),
								 'AN_SQL', mwSql.Lines);
      end;


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
          if (fraTipoAccion.edCodigo.Text = 'FD') then
            SqlAutoCampos;
        end;

        maModificacion:
        begin
          fraPrimaryKey.Reload;
          LoadGrids;
          if (fraTipoAccion.edCodigo.Text = 'FD') then
            SqlAutoCampos;
        end;
        maBaja:
          ClearControls(True);
      end;
  finally
    Sql.Free;
    if (ModoABM = maAlta) and (Result) then
      ModoABM := maModificacion;
  end;
end;

procedure TfrmManAcciones.FSFormCreate(Sender: TObject);
begin
	inherited;

	with fraPrimaryKey do
  begin
    FieldID       := 'AN_ID';
    FieldCodigo   := 'AN_ID';
    FieldDesc     := 'AN_DESCRIPCION';
    FieldBaja     := 'AN_FECHABAJA';
    TableName     := 'CAN_ACCION';
    {$IFNDEF ART2}
    IdType        := ctInteger;
    CodigoType    := ctInteger;
    {$ENDIF}
  end;

  with fraProceso do
  begin
    TableName     := 'IPR_PROCESO';
    FieldID       := 'PR_ID';
    FieldCodigo   := 'PR_CODIGO';
    FieldDesc     := 'PR_DESCRIPCION';
    FieldBaja     := 'PR_FECHABAJA';
    CaseSensitive := False;
    ShowBajas     := True;
  end;

  fraTipoAccion.Clave := 'TACCI';
  fraTipoAccion.FieldID := 'TB_CODIGO';
  fraTipoAccion.OnChange := OnFraTipoAccionChange;

  ClearControls;

	UnTouch := TList.Create ;
	UnTouch.Add(edCodigo);
//  UnTouch.Add( tbCampMoverAbajo );
//  UnTouch.Add( tbCampMoverArriba );
//  UnTouch.Add( tbEvMoverAbajo );
//  UnTouch.Add( tbEvMoverArriba );

	fpEventosABM.Height := Trunc(Screen.Height * 0.9);
	fpEventosABM.Width  := Trunc(Screen.Width  * 0.9);

	{$IFDEF SCRIPTING}
	 tsPascalScript.TabVisible := True;
	{$ELSE}
	 tsPascalScript.TabVisible := False;
	{$ENDIF}

	pcEvent.ActivePage := tsSqlScript;

	fraFormatoMensaje.Edit := edFormatoMensaje;
end;

procedure TfrmManAcciones.OnFraTipoAccionChange(Sender: TObject);
begin
  if fraTipoAccion.Codigo = 'IE' then
  begin
    fraProceso.Locked := False;
    fraProceso.Enabled := True;
    lbProceso.Enabled := True;
    chkAdjuntaArchivo.Enabled := True;
    edDirectoryExport.Enabled := True;
    edDirectoryImport.Enabled := True;
    edDirectoryProcesoImport.Enabled := True;
    PageControl.Pages[1].TabVisible := False;
    PageControl.ActivePageIndex := PAG_GENERAL;
  end
  else
  begin
    fraProceso.Locked := True;
    fraProceso.Enabled := False;
    lbProceso.Enabled := False;
    PageControl.Pages[1].TabVisible := True;
    edDirectoryExport.Enabled := False;
    edDirectoryImport.Enabled := False;
    edDirectoryProcesoImport.Enabled := False;
    chkAdjuntaArchivo.Enabled := False;
    PageControl.ActivePageIndex := PAG_GENERAL;
  end;
end;

procedure TfrmManAcciones.LoadControls;
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByName('pCodigo').AsInteger := fraPrimaryKey.Value;
  sdqConsulta.Open;

  inherited;

  edCodigo.Value            := sdqConsulta.FieldByName('AN_ID').AsInteger;
  edDescripcion.Text        := sdqConsulta.FieldByName('AN_DESCRIPCION').AsString;
  edMotivoMensaje.Text      := sdqConsulta.FieldByName('AN_MOTIVOMENSAJE').AsString;
  chkLogErrores.Checked     := sdqConsulta.FieldByName('AN_LOG_ERRORES').AsString  = SQL_TRUE;
  chkAnexa.Checked          := sdqConsulta.FieldByName('AN_ANEXA').AsString  = SQL_TRUE;
  fraUsuarioPropietario.Cargar(sdqConsulta.FieldByName('AN_USUARIO').AsString);
  fraTipoAccion.Value       := sdqConsulta.FieldByName('AN_TIPOACCION').AsString;
  edtCantidadRegistrosSuspenderAlerta.Text := sdqConsulta.FieldByName('AN_REGISTROSSUSPENDEACCION').AsString;
  chkAdjuntaArchivo.Checked := sdqConsulta.FieldByName('AN_ADJUNTAARCHIVOIMPOEXPO').AsString  = SQL_TRUE;

  edDirectoryExport.Text        := sdqConsulta.FieldByName('AN_DIRECTORIOEXPORT').AsString;
  edDirectoryImport.Text        := sdqConsulta.FieldByName('AN_DIRECTORIOIMPORT').AsString;
  edDirectoryProcesoImport.Text := sdqConsulta.FieldByName('AN_DIRIMPORTPROCESADA').AsString;

  if chkAdjuntaArchivo.Checked then
  begin
    edDirectoryExport.Clear;
    edDirectoryImport.Clear;
    edDirectoryProcesoImport.Clear;
  end;

  fraTipoAccion.OnChange(nil);
  if sdqConsulta.FieldByName('AN_IDPROCESO').AsString <> '' then
    fraProceso.Value := sdqConsulta.FieldByName('AN_IDPROCESO').AsInteger;
  mwSql.Text := sdqConsulta.FieldByName('AN_SQL').AsString;

//  edCampNombre.Items.Clear;

  LoadGrids;
end;

function TfrmManAcciones.Validar: Boolean;
var
  AQuery: TSDQuery;
  sSql: String;
begin
  Result := VerificarMultiple([
                    'Mantenimiento de Acciones',

                    edDescripcion,
                    edDescripcion.Text <> '',
										'Debe ingresar la descripción de la Acción.',

										fraUsuarioPropietario.edCodigo,
										fraUsuarioPropietario.edCodigo.Text <> '',
										'Debe ingresar un usuario propietario de la Acción.',

										fraTipoAccion,
										fraTipoAccion.Value <> '',
										'Debe ingresar un tipo de Acción.',

										fraProceso,
										((fraProceso.Locked) or (fraProceso.Value > 0)),
										'Debe ingresar un proceso.',

										edDirectoryExport,
										((fraProceso.Locked) or (chkAdjuntaArchivo.Checked) or (not IsEmptyString(edDirectoryExport.Text)))
                    or ((fraProceso.Locked) or (chkAdjuntaArchivo.Checked) or (not IsEmptyString(edDirectoryImport.Text))),
										'Debe seleccionar una carpeta de exportación o de importación .'
(*
										edDirectoryExport,
										((not fraProceso.Enabled) or (chkAdjuntaArchivo.Checked) or (IsEmptyString(edDirectoryExport.Text)) or (DirectoryExists(edDirectoryExport.Text))),
										'Debe seleccionar una carpeta válida.',

										edDirectoryImport,
										((not fraProceso.Enabled) or (chkAdjuntaArchivo.Checked) or (IsEmptyString(edDirectoryImport.Text)) or (DirectoryExists(edDirectoryImport.Text))),
										'Debe seleccionar una carpeta válida.',

										edDirectoryProcesoImport,
										((not fraProceso.Enabled) or (chkAdjuntaArchivo.Checked) or (IsEmptyString(edDirectoryProcesoImport.Text)) or (DirectoryExists(edDirectoryProcesoImport.Text))),
										'Debe seleccionar una carpeta válida.'
*)
										]);


  if fraTipoAccion.edCodigo.Text = 'FD' then
  try
    AQuery := TSDQuery.Create(Self);
    try
      SetDatabaseToQuery(AQuery);
      VerificarMultiple(['Mantenimiento de Acciones', mwSql, not IsEmptyString(mwSql.text), 'Debe espeficar una fuente de datos']);
      sSql := mwSql.Lines.Text;
      CheckAndOpenQuery(AQuery, sSql, True);
    finally
      AQuery.Free;
    end;
  except
    PageControl.ActivePage := tsSql;
    mwSql.SetFocus;
    raise;
  end;
end;

procedure TfrmManAcciones.LockControls(ALocked: Boolean);
var
  i: Integer;
begin
	inherited;
	PageControl.Enabled := True;
{
	if ALocked Then
		 mwSql.Color := clBtnFace
	else
		 mwSql.Color := clWindow;
}

	for i := 0 to mwSqlSyn.AttrCount - 1 do
    mwSqlSyn.Attribute[i].Background := mwSql.Color;
end;

procedure TfrmManAcciones.tbSqlLimpiarClick(Sender: TObject);
begin
  mwSql.Lines.Text := ' ';
end;

procedure TfrmManAcciones.tbSqlSintaxisClick(Sender: TObject);
begin
  if pcEvent.ActivePageIndex = 0 then
    CheckSQL(Sender)
  else
    CheckScript;
end;

procedure TfrmManAcciones.CheckScript;
var
  Parser: TScriptParser;
begin
  Parser := TScriptParser.Create;
  Parser.GetFieldList(sdqCampos);
  try
    Parser.SourceCode := mwEvScript.Text;
    Parser.ParserCompile;
    mOutputCompilacion.Text := Parser.CompilerOutputResult.Text;
  finally
    Parser.Free;
  end;
end;

procedure TfrmManAcciones.CheckSQL(Sender: TObject);
var
  sdqSintaxis: TSDQuery;
begin
  try
    sdqSintaxis := TSDQuery.Create(Self);
    try
      SetDatabaseToQuery(sdqSintaxis);
      CheckSintaxis(sdqSintaxis, (Sender = tbSqlSintaxis)); // or (Sender =  tbCampComprobar));

        //if Sender = tbCampComprobar Then
				//begin
        //  sdqSintaxis.Fields.GetFieldNames(edCampNombre.Items);
        //  TStringList(edCampNombre.Items).Sort;
        //end;


    finally
      sdqSintaxis.Free;
    end;

    MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);
  except
    on E: Exception do
      ErrorMsg(E, 'Error de Sintaxis.');
  end;
end;

procedure TfrmManAcciones.tbEvAbmSintaxisExClick(Sender: TObject);
var
	AParam: TParam;
	AParams: TParams;
	i: Integer;
	sdqEvento: TSDQuery;
	sdqSql: TSDQuery;
begin
  try
		sdqSql := TSDQuery.Create(Self);
		try
      if not IsEmptyString(mwSql.Lines.Text) then
			begin
				SetDatabaseToQuery(sdqSql);
				CheckSintaxis(sdqSql, True);
			end;

			AParams := TParams.Create(Self);
			try
				{ Agrega los Parámetros del Sistema }
				for i := Low(PARAMETROS_ALL) to High(PARAMETROS_ALL) do
				begin
					AParam := TParam.Create(AParams);
					AParam.Name := ACTION_PARAM + PARAMETROS_ALL[i];
					AParam.DataType := PARAMETROS_ALL_TIPO[i];
				end;

				for i := 0 to sdqSql.Fields.Count - 1 do
        begin
					AParam := TParam.Create(AParams);
					AParam.Name := FIELD_PARAM + sdqSql.Fields[i].FieldName;
					AParam.DataType := sdqSql.Fields[i].DataType;
				end;

				with TDataCycler.Create(sdqCampos) do
				try
					repeat
						AParam := TParam.Create(AParams);
						AParam.Name := FIELD_PARAM + sdqCampos.FieldByName('AC_NOMBRE').AsString;
						AParam.DataType := ftString;
					until not Cycle;
				finally
					Free;
				end;

				with TDataCycler.Create(sdqParametrosAccion) do
				try
          repeat
            AParam := TParam.Create(AParams);
            AParam.Name := ACTION_PARAM + sdqParametrosAccion.FieldByName('AT_CODIGO').AsString;
            AParam.ParamType := ptInputOutput;
            AParam.DataType := ftString;
          until not Cycle;
				finally
					Free;
				end;


				{ Agrega los Parámetros de los procesos }
				with GetQueryEx('SELECT DISTINCT AT_CODIGO, AT_TIPO' +
												 ' FROM CAT_ACCIONPARAMETRO' +
												' WHERE AT_IDACCION = :IdAccion',
												[fraPrimaryKey.Value]) do
				try
					First;
					while not Eof do
					begin
						AParam := TParam.Create(AParams);
						AParam.Name := FieldByName('AT_CODIGO').AsString;
						AParam.DataType := TipoDatoToFieldType(FieldByName('AT_TIPO').AsString);
						Next;
					end;
				finally
					Free;
				end;

				sdqEvento := TSDQuery.Create(Self);
				try
					SetDatabaseToQuery(sdqEvento);
					CheckAndOpenQuery(sdqEvento, mwEvSql.Lines.Text, False, AParams);
				finally
					AParams.Free;
				end;

			finally
				sdqEvento.Free;
			end;
		finally
			sdqSql.Free;
		end;

		MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);

		fpEventosABMShow(nil);
	except
		on E: Exception do
      ErrorMsg(E, 'Error de Sintaxis.');
	end;
end;

procedure TfrmManAcciones.tbCampComprobarClick(Sender: TObject);
begin
{  tbSqlSintaxisClick(tbCampComprobar);
  dbgCampos.Repaint;
}
end;

procedure TfrmManAcciones.SqlEliminarCampos;
begin
	EjecutarSql('delete from cac_accioncampo where ac_idaccion = ' + edCodigo.Text);
end;

procedure TfrmManAcciones.SqlAutoCampos;
var
  i            : Integer;
  sdqAutoFields: TSDQuery;
  Sql          : TSql;
begin
  sdqAutoFields := TSDQuery.Create(Self);
  try
    SetDatabaseToQuery(sdqAutoFields);
    CheckSintaxis(sdqAutoFields, True); // Utiliza chechsintaxis por si tiene parámetros
    Sql := TSql.Create('CAC_ACCIONCAMPO');
    try
      for i := 0 to sdqAutoFields.Fields.Count - 1 do
        with sdqAutoFields.Fields[i] do
        begin
          Sql.Clear;
          Sql.Fields.Add('AC_IDACCION',  fraPrimaryKey.Value);
          Sql.Fields.Add('AC_ORDEN',     IncSql('SELECT MAX(AC_ORDEN) FROM cac_accioncampo WHERE AC_IDACCION = ' + SqlInt(fraPrimaryKey.Value)));
          Sql.Fields.Add('AC_TITULO',    DisplayLabel);
          Sql.Fields.Add('AC_NOMBRE',    FieldName);
          Sql.Fields.Add('AC_ANCHO',     DataSize - 1);
          Sql.Fields.Add('AC_FECHAALTA', SQL_ACTUALDATE, False);
          Sql.Fields.Add('AC_USUALTA',   Sesion.LoginName);

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

procedure TfrmManAcciones.qpCamposGetValues(Sender: TObject; Field: TPrintField; var Value: String);
begin
  if Field.Title = 'Desde' then
    Value := IntToStr(iTotal + 1)
  else if Field.Title = 'Hasta' then
  begin
    iTotal := iTotal + sdqCampos.FieldByName('AC_ANCHO').AsInteger;
		Value  := IntToStr(iTotal);
	end;
end;

procedure TfrmManAcciones.tbArmarSqlClick(Sender: TObject);
var
  i: Integer;
  sdqAutoQuery: TSDQuery;
  sSql: String;
  sTabla: String;
begin
  if (mwSql.Lines.Text = '') or (MsgBox('¿ Desea armar automáticamente el sql de la tabla ?', MB_ICONQUESTION + MB_YESNO) = IDYES) then
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

procedure TfrmManAcciones.tbEvNuevoClick(Sender: TObject);
begin
	pcEvent.ActivePageIndex := 0;
	cmbEvMomento.ItemIndex  := 0;
	cmbEvErrores.ItemIndex  := 0;
  pcEvent.ActivePage := tsSqlScript;
	//   cmbEvTipoAccion.ItemIndex  := 3;
	mwEvSql.Text := ' ';
	mwEvScript.Text := ' ';
	edFormatoMensaje.Text := ' ';
  edHTML.Lines.Text := ' ';

	chkEvCheckParams.Checked := True;
	CargarCamposParametros;
	CargarParametros;

  ModoAbmEvento := maAlta;

	fpEventosABM.Caption := FORM_CAP_INSERT;

	fpEventosABM.ShowModal;
end;

procedure TfrmManAcciones.tbEvModificarClick(Sender: TObject);
var
  tslAux: TStrings;
  sSQL: String;
begin
	CargarCamposParametros;
	CargarParametros;

  ModoAbmEvento := maModificacion;

  FAeOrden := sdqEventos.FieldByName('AE_ORDEN').AsInteger;

	mwEvSql.Text := ' ';
	mwEvScript.Text := ' ';
	edFormatoMensaje.Text := ' ';
  edHTML.Lines.Text := ' ';

  pcEvent.ActivePage := tsSqlScript;

	if tbEvModificar.Enabled and (not sdqEventos.IsEmpty) then
  begin
		cmbEvMomento.ItemIndex := ArrayPos(sdqEventos.FieldByName('AE_MOMENTO').AsString, TEA_MOMENTOS);
		cmbEvErrores.ItemIndex := ArrayPos(sdqEventos.FieldByName('AE_ACCIONERROR').AsString, ['C', 'I', 'P']);
//  cmbEvTipoAccion.ItemIndex := ArrayPos(sdqEventos.FieldByName('AE_TIPOACCION').AsString, [ATA_QUERY, ATA_ALL]);
		mwEvSql.Text           := sdqEventos.FieldByName('AE_SQL').AsString + ' ';
		mwEvScript.Text        := sdqEventos.FieldByName('AE_SCRIPT').AsString + ' ';

    if IsemptyString(mwEvSql.Text) then
      pcEvent.ActivePageIndex := PAG_EVENTOSMAIL;

    cmbDestinoCorreo.ItemIndex := cmbDestinoCorreo.Items.IndexOf(sdqEventos.FieldByName('AE_CAMPODESTINATARIO').AsString);

    tslAux := TStringList.Create;
    try
      sSQL := 'SELECT AE_MENSAJE' +
    				   ' FROM CAE_ACCIONEVENTO' +
  						' WHERE AE_IDACCION = ' + SqlInteger(sdqEventos.FieldByName('AE_IDACCION').AsInteger) +
    						' AND AE_ORDEN = ' + SqlInteger(sdqEventos.FieldByName('AE_ORDEN').AsInteger);
      BlobSql(sSQL, tslAux);

      if IsHTML(tslAux.Text) then
      begin
        pcMensaje.ActivePageIndex := 1;
        edHTML.Lines.Text := tslAux.Text;
      end else
      begin
        pcMensaje.ActivePageIndex := 0;
        BlobSql(sSQL, edFormatoMensaje.Lines);
      end;
    finally
      tslAux.Free;
    end;

		chkEvCheckParams.Checked  := sdqEventos.FieldByName('AE_USARPARAMETROS').AsString = SQL_TRUE;

		fpEventosABM.Caption := FORM_CAP_MODIFY;
		fpEventosABM.ShowModal;
	end;
end;

procedure TfrmManAcciones.tbEvEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if MsgBox('¿ Desea eliminar el Evento seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Sql := TSql.Create('CAE_ACCIONEVENTO');
    try
      Sql.PrimaryKey.Add('AE_IDACCION', fraPrimaryKey.Value);
      Sql.PrimaryKey.Add('AE_ORDEN',    sdqEventos.FieldByName('AE_ORDEN').AsInteger);
      Sql.Fields.Add('AE_FECHABAJA',    SQL_ACTUALDATE, False);
      Sql.Fields.Add('AE_USUBAJA',      Sesion.LoginName);

      EjecutarSql(Sql.UpdateSql);
      sdqEventos.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManAcciones.btnEvAceptarClick(Sender: TObject);
var
  Sql: TSql;
//  b : TBookmark;
begin
  if (Trim(edFormatoMensaje.Lines.Text) > '') and (pcMensaje.ActivePage = tsHTML) then
    if not MsgAsk('Atención: Tiene texto ingresado en formato RTF, sin embargo se guardará en formato HTML lo siguiente: ' +
                  CRLF + CRLF + edHTML.Lines.Text + CRLF + CRLF + '¿Desea continuar?') then
      Abort;

  if (Trim(edHTML.Lines.Text) > '') and (pcMensaje.ActivePage = tsRTF) then
    if not MsgAsk('Atención: Tiene texto ingresado en formato HTML, sin embargo se guardará en formato RTF lo siguiente: ' +
                  CRLF + CRLF + edFormatoMensaje.Lines.Text + CRLF + CRLF + '¿Desea continuar?') then
      Abort;

  Sql := TSql.Create('CAE_ACCIONEVENTO');

	try
    Sql.PrimaryKey.Add('AE_IDACCION', fraPrimaryKey.Value);

		//        Sql.Fields.Add( 'AE_SQL',            TrimRight(mwEvSql.Text) );
    Sql.Fields.Add('AE_FECHABAJA', SQL_NULL, False);
		Sql.Fields.Add('AE_USUBAJA',   SQL_NULL, False);

    if ModoAbmEvento = maAlta then
    begin
      FAeOrden := IncSql('SELECT MAX(AE_ORDEN) FROM CAE_ACCIONEVENTO WHERE AE_IDACCION = ' + SqlInt(fraPrimaryKey.Value));
			Sql.Fields.Add('AE_FECHAALTA', SQL_ACTUALDATE, False);
			Sql.Fields.Add('AE_USUALTA',   Sesion.LoginName);
			Sql.SqlType := stInsert;
		end
    else
    begin
			Sql.Fields.Add('AE_FECHAMODIF', SQL_ACTUALDATE, False);
			Sql.Fields.Add('AE_USUMODIF',   Sesion.LoginName);
			Sql.SqlType := stUpdate;
		end;

		Sql.PrimaryKey.Add('AE_ORDEN',      FAeOrden);
		Sql.Fields.Add('AE_MOMENTO',        TEA_MOMENTOS[cmbEvMomento.ItemIndex]);
		Sql.Fields.Add('AE_ACCIONERROR',    Copy('CIP', cmbEvErrores.ItemIndex + 1, 1));
//		Sql.Fields.Add( 'AE_TIPOACCION',     ATA_TIPOACCION[cmbEvTipoAccion.ItemIndex] );
		Sql.Fields.Add('AE_USARPARAMETROS', chkEvCheckParams.Checked);
		Sql.Fields.Add('AE_SCRIPT',         mwEvScript.Lines.Text);

    if cmbDestinoCorreo.ItemIndex > 0 then
      Sql.Fields.Add('AE_CAMPODESTINATARIO', cmbDestinoCorreo.Text)
    else
      Sql.Fields.AddString('AE_CAMPODESTINATARIO', '', True);

		EjecutarSql(Sql.Sql);

		SaveBlob('SELECT AE_SQL' +
 						  ' FROM CAE_ACCIONEVENTO' +
						 ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
               ' AND AE_ORDEN = ' + SqlValue(FAeOrden),
						 'UPDATE CAE_ACCIONEVENTO' +
  						 ' SET AE_SQL = :AE_SQL' +
						 ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
						   ' AND AE_ORDEN = ' + SqlValue(FAeOrden),
						 'AE_SQL', mwEvSql.Lines);

    case pcMensaje.ActivePageIndex of
      0: SaveBlob('SELECT AE_MENSAJE' +
                   ' FROM CAE_ACCIONEVENTO' +
                  ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
                    ' AND AE_ORDEN = ' + SqlValue(FAeOrden),
                  'UPDATE CAE_ACCIONEVENTO' +
                    ' SET AE_MENSAJE = :AE_MENSAJE' +
                  ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
                    ' AND AE_ORDEN = ' + SqlValue(FAeOrden),
                  'AE_MENSAJE', edFormatoMensaje.Lines);
      1: SaveBlob('SELECT AE_MENSAJE' +
                   ' FROM CAE_ACCIONEVENTO' +
                  ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
                    ' AND AE_ORDEN = ' + SqlValue(FAeOrden),
                  'UPDATE CAE_ACCIONEVENTO' +
                    ' SET AE_MENSAJE = :AE_MENSAJE' +
                  ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
                    ' AND AE_ORDEN = ' + SqlValue(FAeOrden),
                  'AE_MENSAJE', edHTML.Lines);
    end;

		sdqEventos.Refresh;
		if Sender = btnEvAceptar then
      fpEventosABM.ModalResult := mrOk;
	finally
		Sql.Free;
    ModoAbmEvento := maModificacion;
	end;
end;

procedure TfrmManAcciones.dbgEventosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                  Highlight: Boolean);
begin
  if not sdqEventos.FieldByName('AE_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManAcciones.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
//  tsCampos.Enabled  := ModoABM <> maAlta;
  tsEventos.Enabled := ModoABM <> maAlta;
  tsParametros.Enabled := ModoABM <> maAlta;
end;

procedure TfrmManAcciones.LoadGrids;
begin
	sdqCampos.Close ;
//  sdqCampos.ParamByName('pArchivo').AsInteger := StrToInt('0' + fraPrimaryKey.Value);
	sdqCampos.Sql.Text :=
    'SELECT AC_ORDEN, AC_NOMBRE, AC_ANCHO, AC_TITULO' +
     ' FROM CAC_ACCIONCAMPO' +
    ' WHERE AC_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
 ' ORDER BY AC_ORDEN ';
	OpenQuery(sdqCampos);


	sdqEventos.Close ;
//  sdqEventos.ParamByName('pArchivo').AsInteger := StrToInt('0' + fraPrimaryKey.Value);
	sdqEventos.Sql.Text :=
    'SELECT AE_ORDEN, AE_MOMENTO, AE_ACCIONERROR, AE_TIPOACCION, ' +
            SqlDecodeStr('AE_MOMENTO', TEA_MOMENTOS, ['Antes de Iniciar', 'Después de Evaluar el Registro', 'Después de Finalizado']) + ' AS MOMENTO, ' +
            SqlDecodeStr('AE_ACCIONERROR', ['C', 'I', 'P'], ['Cancelar Todo e Informar al Propietario','Ignorar el Error','Ignorar el Error e Informar al Propietario']) + ' AS ACCIONERROR, ' +
            SqlDecodeStr('AE_TIPOACCION', [ATA_READ, ATA_WRITE, ATA_QUERY, ATA_ALL], ['Lectura', 'Escritura', 'Consulta', 'Siempre']) + ' AS TIPOACCION, ' +
           'AE_SQL, AE_USARPARAMETROS, AE_FECHABAJA, AE_SCRIPT, AE_MENSAJE, AE_ANEXARMENSAJEGENERAL, AE_IDACCION,' +
          ' AE_CAMPODESTINATARIO' +
     ' FROM CAE_ACCIONEVENTO ' +
    ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
 ' ORDER BY ' + SqlDecodeStr('AE_MOMENTO', TEA_MOMENTOS, ['0', '1', '2']) + ', AE_ORDEN';
	OpenQuery(sdqEventos);

	sdqParametrosAccion.Close;
	sdqParametrosAccion.SQL.Text :=
    'SELECT *' +
     ' FROM caT_accionparametro' +
    ' WHERE AT_IDACCION = ' + SqlValue(fraPrimaryKey.Value);
	OpenQuery(sdqParametrosAccion);
end;

procedure TfrmManAcciones.OnCharacterChange(Sender: TObject);
var
  Editor: TComponent;
begin
  Editor := FindComponent(TComponent(Sender).Name + 'Txt');
  if Assigned(Editor) and (Editor is TCustomEdit) then
    TCustomEdit(Editor).Text := TAsciiCombo( Sender ).ShortName;
end;

procedure TfrmManAcciones.tbCampMoverClick(Sender: TObject);
{$IFDEF SQLSERVER}
{$ELSE}{$IFDEF MSACCESS}
{$ELSE}
var
  bAbajo: Boolean;
  sSql: String;
{$ENDIF}
{$ENDIF}
begin
{$IFDEF SQLSERVER}
  MsgBox('La opción no está habilitada para SqlServer.', MB_ICONEXCLAMATION);
{$ELSE}{$IFDEF MSACCESS}
  MsgBox('La opción no está habilitada para Microsoft Access.', MB_ICONEXCLAMATION);
{$ELSE}

  bAbajo := TComponent(Sender).Tag > 0 ;

  sSql :=
    'DECLARE' +
      ' RowId_Origen  ROWID;' +
      ' Orden_Origen  Number;' +
      ' RowId_Destino ROWID;' +
      ' Orden_Destino Number;' +
   ' BEGIN ' +
      ' SELECT ROWID, AC_ORDEN' +
        ' INTO RowId_Origen, Orden_Origen' +
        ' FROM CAC_ACCIONCAMPO' +
       ' WHERE AC_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
         ' AND AC_ORDEN = ' + SqlInt( sdqCampos.FieldByName('AC_ORDEN').AsInteger ) + ';' +

      ' SELECT AC_ORDEN, ROWID' +
        ' INTO Orden_Destino, RowId_Destino' +
        ' FROM CAC_ACCIONCAMPO O' +
       ' WHERE AC_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
         ' AND AC_ORDEN = (SELECT ' + IIF(bAbajo, 'MIN', 'MAX') + '(D.AC_ORDEN)' +
                           ' FROM CAC_ACCIONCAMPO D' +
                          ' WHERE D.AC_IDACCION = O.AC_IDACCION' +
                            ' AND D.AC_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt(sdqCampos.FieldByName('AC_ORDEN').AsInteger) + ');' +

      ' UPDATE CAC_ACCIONCAMPO O' +
         ' SET AC_ORDEN = (SELECT MAX(D.AC_ORDEN) + 1 FROM CAC_ACCIONCAMPO D WHERE D.AC_IDACCION = O.AC_IDACCION)' +
       ' WHERE ROWID = RowId_Origen;' +

      ' UPDATE CAC_ACCIONCAMPO' +
         ' SET AC_ORDEN = Orden_Origen' +
       ' WHERE ROWID = RowId_Destino;' +

      ' UPDATE CAC_ACCIONCAMPO' +
         ' SET AC_ORDEN = Orden_Destino' +
       ' WHERE ROWID = RowId_Origen;' +
   ' END;';
  EjecutarSql(sSql);
  sdqCampos.Refresh;

  if bAbajo then
    sdqCampos.Next
  else
    sdqCampos.Prior;
{$ENDIF}
{$ENDIF}
end;

procedure TfrmManAcciones.sdqCamposAfterScroll(DataSet: TDataSet);
begin
//    tbCampMoverArriba.Enabled := DataSet.RecNo > 0;
//    tbCampMoverAbajo.Enabled  := DataSet.RecNo < DataSet.RecordCount -1;
end;

procedure TfrmManAcciones.tbEvMoverClick(Sender: TObject);
{$IFDEF SQLSERVER}
{$ELSE}{$IFDEF MSACCESS}
{$ELSE}
var
  bAbajo: Boolean;
  sSql: String;
{$ENDIF}
{$ENDIF}
begin
{$IFDEF SQLSERVER}
  MsgBox('La opción no está habilitada para SqlServer.', MB_ICONEXCLAMATION);
{$ELSE}{$IFDEF MSACCESS}
  MsgBox('La opción no está habilitada para Microsoft Access.', MB_ICONEXCLAMATION);
{$ELSE}
  bAbajo := TComponent(Sender).Tag > 0;
  sSql :=
    'DECLARE' +
     ' RowId_Origen  ROWID;' +
     ' Orden_Origen  Number;' +
     ' RowId_Destino ROWID;' +
     ' Orden_Destino Number;' +
   ' BEGIN' +
     ' SELECT ROWID, AE_ORDEN' +
       ' INTO RowId_Origen, Orden_Origen' +
       ' FROM CAE_ACCIONEVENTO' +
      ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
        ' AND AE_ORDEN = ' + SqlInt(sdqEventos.FieldByName('AE_ORDEN').AsInteger) +
        ' AND AE_MOMENTO = ' + SqlValue(sdqEventos.FieldByName('AE_MOMENTO').AsString) + ';' +

     ' SELECT AE_ORDEN, ROWID' +
       ' INTO Orden_Destino, RowId_Destino' +
       ' FROM CAE_ACCIONEVENTO O' +
      ' WHERE AE_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
        ' AND AE_MOMENTO = ' + SqlValue(sdqEventos.FieldByName('AE_MOMENTO').AsString) +
        ' AND AE_ORDEN = (SELECT ' + IIF( bAbajo,'MIN', 'MAX')  + '(D.AE_ORDEN)' +
                          ' FROM CAE_ACCIONEVENTO D' +
                         ' WHERE D.AE_IDACCION = O.AE_IDACCION' +
                           ' AND D.AE_MOMENTO = O.AE_MOMENTO' +
                           ' AND D.AE_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt(sdqEventos.FieldByName('AE_ORDEN').AsInteger) + ');' +

     ' UPDATE CAE_ACCIONEVENTO O' +
        ' SET AE_ORDEN = (SELECT MAX(D.AE_ORDEN) + 1 FROM CAE_ACCIONEVENTO D WHERE D.AE_IDACCION = O.AE_IDACCION)' +
      ' WHERE ROWID = RowId_Origen;' +

     ' UPDATE CAE_ACCIONEVENTO' +
        ' SET AE_ORDEN = Orden_Origen' +
      ' WHERE ROWID = RowId_Destino;' +

     ' UPDATE CAE_ACCIONEVENTO' +
        ' SET AE_ORDEN = Orden_Destino' +
      ' WHERE ROWID = RowId_Origen;' +
   ' END;';

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
{$ENDIF}
{$ENDIF}
end;

procedure TfrmManAcciones.sdqEventosAfterScroll(DataSet: TDataSet);
begin
  tbEvMoverArriba.Enabled := DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};
  tbEvMoverAbajo.Enabled  := DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF};
end;


procedure TfrmManAcciones.edCampCompletarCloseUp(Sender: TObject);
begin
//   lbCampMuestra.Caption := edCampCompletar.ShortName;
end;

procedure TfrmManAcciones.tbEvAbmLimpiarClick(Sender: TObject);
begin
  if pcEvent.ActivePageIndex = 0 then
    mwEvSql.Lines.Text := ' '
  else
    mwEvScript.Lines.Text := ' ';
end;

procedure TfrmManAcciones.CheckSintaxis(AQuery: TSDQuery; ArchivoSql: Boolean);
var
  sSql: String;
begin
  if ArchivoSql then
  begin
    sSql := mwSql.Lines.Text;
    CheckAndOpenQuery(AQuery, sSql, ArchivoSql);
  end
  else
  begin
    if pcEvent.ActivePageIndex = 0 then
    begin
      sSql := mwEvSql.Lines.Text;
      CheckAndOpenQuery(AQuery, sSql, ArchivoSql);
    end
    else
    begin
        		//FIXME.. completar la validacion del scripting.
    end;
  end;
end;

procedure TfrmManAcciones.dbgCamposGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                                 Highlight: Boolean);
begin
	inherited;
	if (Field.FieldName = 'AC_NOMBRE') then
    AFont.Color := clRed;
end;

procedure TfrmManAcciones.tbEvImprimirClick(Sender: TObject);
begin
	if PrinterSetupDialog.Execute then
	begin
		qpEventos.SetGridColumns(dbgEventos, True, [baDetail, baHeader, baTotal, baSubTotal]);
		qpEventos.Title.Text := 'Eventos del Archivo ' + fraPrimaryKey.cmbDescripcion.Text;
		qpEventos.Print ;
	end;
end;

procedure TfrmManAcciones.pmnuCamposClick(Sender: TObject);
begin
  case pcEvent.ActivePageIndex of
	  PAG_EVENTOSSQL:     mwEvSql.SelText := ':' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
	  PAG_EVENTOSSCRIPT:  mwEvScript.SelText := ':' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
	  PAG_EVENTOSMAIL:    case pcMensaje.ActivePageIndex of
                          0: edFormatoMensaje.SelText := '<:' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption + '>', '&', '', [rfReplaceAll]);
                          1: edHTML.Selection := '<:' + FIELD_PARAM + StringReplace(TMenuItem(Sender).Caption + '>', '&', '', [rfReplaceAll]);
                        end;
  end;
end;

procedure TfrmManAcciones.pmnuParametrosClick(Sender: TObject);
begin
  case pcEvent.ActivePageIndex of
	  PAG_EVENTOSSQL:     mwEvSql.SelText := ':' + ACTION_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
	  PAG_EVENTOSSCRIPT:  mwEvScript.SelText := ':' + ACTION_PARAM + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);
	  PAG_EVENTOSMAIL:    case pcMensaje.ActivePageIndex of
                          0: edFormatoMensaje.SelText := '<:' + ACTION_PARAM + StringReplace(TMenuItem(Sender).Caption + '>', '&', '', [rfReplaceAll]);
                          1: edHTML.Selection := '<:' + ACTION_PARAM + StringReplace(TMenuItem(Sender).Caption + '>', '&', '', [rfReplaceAll]);                          
                        end;
  end;
end;

procedure TfrmManAcciones.CargarCamposParametros;
var
  MenuItem: TMenuItem;
begin
	pmnuCampos.Items.Clear;
  cmbDestinoCorreo.Items.Clear;
  cmbDestinoCorreo.Items.Add(' ');
	with TDataCycler.Create(sdqCampos) do
  try
    repeat
      if pmnuCampos.FindComponent(sdqCampos.FieldByName('AC_NOMBRE').AsString) = nil then
      begin
        MenuItem := TMenuItem.Create(pmnuCampos);
				MenuItem.Caption := sdqCampos.FieldByName('AC_NOMBRE').AsString;
        MenuItem.OnClick := pmnuCamposClick;
        pmnuCampos.Items.Add(MenuItem);
      end;

      if (Pos('CORREO', UpperCase(sdqCampos.FieldByName('AC_NOMBRE').AsString)) > 0) or
         (Pos('MAIL', UpperCase(sdqCampos.FieldByName('AC_NOMBRE').AsString)) > 0) then
        cmbDestinoCorreo.Items.Add(sdqCampos.FieldByName('AC_NOMBRE').AsString);
    until not Cycle;
	finally
    Free;
	end;
	tbEvAgrCampo.Enabled := pmnuCampos.Items.Count > 0;
end;

procedure TfrmManAcciones.CargarParametros;
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
end;

procedure TfrmManAcciones.fpEventosABMShow(Sender: TObject);
begin
//	cmbEvTipoAccionChange(Nil);
end;

procedure TfrmManAcciones.tbSqlImprimirClick(Sender: TObject);
begin
	inherited;

	if PrinterSetupDialog.Execute then
  begin
    iTotal := 0;
    qpCampos.Title.Text := 'Estructura del Archivo ' + fraPrimaryKey.cmbDescripcion.Text;
    qpCampos.Print;
	end;
end;

procedure TfrmManAcciones.fraFormatoMensajetbGuardarClick(Sender: TObject);
begin
  inherited;
  fraFormatoMensaje.tbGuardarClick(Sender);
end;

procedure TfrmManAcciones.PageControlChange(Sender: TObject);
begin
  inherited;
  
  case PageControl.ActivePageIndex of
    PAG_PARAMETRO:
      if ModoABM = maModificacion then
        OpenQuery(sdqParametrosAccion);
  end;
end;

procedure TfrmManAcciones.tbParaNuevoClick(Sender: TObject);
begin
  edParaCodigo.Text := '';
  edParaDescripcion.Text := '';
  edParaOrigen.Text := '';
  fraParaTipoDato.Limpiar ;
  FreeAndNil(DefParamEditor);

  fpParametros.Caption := FORM_CAP_INSERT;
  fpParametros.ShowModal;
end;

procedure TfrmManAcciones.tbParaModificarClick(Sender: TObject);
begin
  with sdqParametrosAccion do
    if tbParaModificar.Enabled and (not sdqParametrosAccion.IsEmpty) then
    begin
      edParaCodigo.Text      := FieldByName('AT_CODIGO').AsString;
      edParaDescripcion.Text := FieldByName('AT_DESCRIPCION').AsString;
      fraParaTipoDato.Value  := FieldByName('AT_TIPO').AsString;
      edParaOrigen.Text      := FieldByName('AT_ORIGEN').AsString;

      OnFraTipoDatoParametroChange(nil);

      SetParamEditorValue(DefParamEditor, FieldByName('AT_DEFAULT').AsString);

      fpParametros.Caption := FORM_CAP_MODIFY;
      fpParametros.ShowModal;
   end;
end;

procedure TfrmManAcciones.OnFraTipoDatoParametroChange(Sender: TObject);
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
      ParamInitializeEditor(DefParamEditor, '', edParaDescripcion.Width);
      with DefParamEditor do
      begin
        Left := 104;
        Top := 94;
        Parent := fpParametros;
        TabOrder := fraParaTipoDato.TabOrder + 1;
      end;
    end;
  end;
end;

procedure TfrmManAcciones.tbParaEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if MsgBox('¿ Desea eliminar el Parámetro seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Sql := TSql.Create('CAT_ACCIONPARAMETRO');
    try
      Sql.PrimaryKey.Add('AT_IDACCION', fraPrimaryKey.Value);
      Sql.PrimaryKey.Add('AT_CODIGO',   sdqParametrosAccion.FieldByName('AT_CODIGO').AsString);
      Sql.Fields.Add('AT_FECHABAJA',    SQL_ACTUALDATE, False);
      Sql.Fields.Add('AT_USUBAJA',      Sesion.LoginName);
      EjecutarSql(Sql.UpdateSql);
      sdqParametrosAccion.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManAcciones.tbParamMoverAbajoClick(Sender: TObject);
var
  bAbajo: Boolean;
  sSql: String;
begin
{$IFDEF SQLSERVER}
  MsgBox('La opción no está habilitada para SqlServer.', MB_ICONEXCLAMATION);
{$ELSE}
  bAbajo := TComponent(Sender).Tag > 0;

  sSql :=
    'DECLARE' +
     ' RowId_Origen  ROWID;' +
     ' Orden_Origen  Number;' +
     ' RowId_Destino ROWID;' +
     ' Orden_Destino Number;' +
   ' BEGIN' +
     ' SELECT ROWID, AT_ORDEN' +
       ' INTO RowId_Origen, Orden_Origen' +
       ' FROM CAT_ACCIONPARAMETRO' +
      ' WHERE AT_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
        ' AND AT_ORDEN = ' + SqlInt( sdqParametrosAccion.FieldByName('AT_ORDEN').AsInteger ) + ';' +

     ' SELECT AT_ORDEN, ROWID' +
       ' INTO Orden_Destino, RowId_Destino' +
       ' FROM CAT_ACCIONPARAMETRO O' +
      ' WHERE AT_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
        ' AND AT_ORDEN = (SELECT ' + IIF( bAbajo,'MIN', 'MAX')  + '(D.AT_ORDEN)' +
                          ' FROM CAT_ACCIONPARAMETRO D' +
                         ' WHERE D.AT_IDACCION = O.AT_IDACCION' +
                           ' AND D.AT_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt( sdqParametrosAccion.FieldByName('AT_ORDEN').AsInteger ) + ');' +

     ' UPDATE CAT_ACCIONPARAMETRO O' +
        ' SET AT_ORDEN = (SELECT MAX(D.AT_ORDEN) + 1 FROM CAT_ACCIONPARAMETRO D WHERE D.AT_IDACCION = O.AT_IDACCION)' +
      ' WHERE ROWID = RowId_Origen;' +

     ' UPDATE CAT_ACCIONPARAMETRO' +
        ' SET AT_ORDEN = Orden_Origen' +
      ' WHERE ROWID = RowId_Destino;' +

     ' UPDATE CAT_ACCIONPARAMETRO' +
        ' SET AT_ORDEN = Orden_Destino' +
      ' WHERE ROWID = RowId_Origen;' +
   ' END;';
  EjecutarSql(sSql);
  sdqParametrosAccion.Refresh;

  if bAbajo then
    sdqParametrosAccion.Next
  else
    sdqParametrosAccion.Prior;
{$ENDIF}
end;

procedure TfrmManAcciones.btnParaAceptarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if edParaCodigo.Text = '' then
    InvalidMsg(edCodigo, 'Debe ingresar el código del Parámetro.')

  else if AreIn(UpperCase(edParaCodigo.Text), PARAMETROS_FIJOS) {or (Copy(UpperCase(edCodigo.Text), 0, 6) = 'FIELD!')} then
    InvalidMsg(edCodigo, 'El código de parámetro esta reservado por la aplicación.')

  else if fraParaTipoDato.Value = '' then
    InvalidMsg(edCodigo, 'Debe seleccionar el Tipo de Dato.')

  else if ExisteSql('SELECT 1' +
                     ' FROM CAT_ACCIONPARAMETRO' +
                    ' WHERE AT_IDACCION = ' + SqlValue(fraPrimaryKey.Value) +
                      ' AND AT_CODIGO = ' + SqlValue(edCodigo.Text) +
                            IIF(fpParametros.Caption = FORM_CAP_INSERT, '', ' AND AT_CODIGO <> ' + SqlValue(sdqParametrosAccion.FieldByName('AT_CODIGO').AsString))) then
    InvalidMsg(edCodigo, 'Ya existe un Parámetro con el mismo código para el mismo proceso.')

  else
  begin
    Sql := TSql.Create('CAT_ACCIONPARAMETRO');
    try
      Sql.PrimaryKey.Add('AT_IDACCION', fraPrimaryKey.Value);
      if (fpParametros.Caption = FORM_CAP_INSERT) then
      begin
        Sql.SqlType := stInsert;
        Sql.Fields.Add('AT_FECHAALTA', SQL_ACTUALDATE, False);
        Sql.Fields.Add('AT_USUALTA',   Sesion.LoginName);
        Sql.Fields.Add('AT_ORDEN',     IncSql('SELECT MAX(AT_ORDEN) FROM CAT_ACCIONPARAMETRO ' + Sql.Where));
      end
      else
      begin
        Sql.SqlType := stUpdate;
        Sql.PrimaryKey.Add('AT_CODIGO', sdqParametrosAccion.FieldByName('AT_CODIGO').AsString);
        Sql.Fields.Add('AT_FECHAMODIF', SQL_ACTUALDATE, False);
        Sql.Fields.Add('AT_USUMODIF',   Sesion.LoginName);
        Sql.Fields.Add('AT_FECHABAJA', SQL_NULL, False);
        Sql.Fields.Add('AT_USUBAJA',   SQL_NULL, False);
      end;

      Sql.Fields.Add('AT_CODIGO',      edParaCodigo.Text);
      Sql.Fields.Add('AT_DESCRIPCION', edParaDescripcion.Text);
      Sql.Fields.Add('AT_TIPO',        fraParaTipoDato.Value);
      Sql.Fields.Add('AT_DEFAULT',     GetParamEditorValue(DefParamEditor));
      Sql.Fields.Add('AT_ORIGEN',      edParaOrigen.Text);

      EjecutarSql(Sql.Sql);
      fpParametros.ModalResult := mrOk;
      sdqParametrosAccion.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManAcciones.spVerificarSintaxisClick(Sender: TObject);
begin
  with TSDQuery.Create(nil) do
  try
    try
      DatabaseName := 'dbPrincipal';
      Sql.Text := edParaOrigen.Text;
      Prepare;
      Open;

      if recordcount > 0 then
        InfoHint(edParaOrigen, 'El valor actual del parámetro es ' + Fields[0].AsString, False, 'Verificando Parámetro')
      else
        InfoHint(edParaOrigen, 'El parámetro no retorno valor', False, 'Verificando Parámetro');
    except
      on E: Exception do
      begin
        InvalidMsg(edParaOrigen, 'La sentencia de origen del parámetro no es válida. ' + #13#10 +
                                ' Verifique la consulta.', 'Verificando Parámetro');
      end;
    end;
  finally
    Free;
  end;
end;

procedure TfrmManAcciones.fraFormatoMensajetbPegarClick(Sender: TObject);
begin
  inherited;
  fraFormatoMensaje.tbPegarClick(Sender);
end;

procedure TfrmManAcciones.chkAdjuntaArchivoClick(Sender: TObject);
begin
  edDirectoryImport.Enabled := not chkAdjuntaArchivo.Checked;
  edDirectoryExport.Enabled := not chkAdjuntaArchivo.Checked;
  edDirectoryProcesoImport.Enabled := not chkAdjuntaArchivo.Checked;

  if chkAdjuntaArchivo.Checked then
  begin
    edDirectoryImport.Clear;
    edDirectoryExport.Clear;
    edDirectoryProcesoImport.Clear;
  end;
end;

procedure TfrmManAcciones.FSFormShow(Sender: TObject);
begin
  OnFraTipoAccionChange(Sender);
//  fraProceso.Enabled := not (fraTipoAccion.Codigo = 'FD');
  edDirectoryImport.Enabled := not chkAdjuntaArchivo.Checked;
  edDirectoryExport.Enabled := not chkAdjuntaArchivo.Checked;
  edDirectoryProcesoImport.Enabled := not chkAdjuntaArchivo.Checked;
end;

end.
