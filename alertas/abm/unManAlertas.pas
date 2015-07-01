unit unManAlertas;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomPanelABM, Db, SDEngine, Placemnt,
  artSeguridad, ShortCutControl, StdCtrls, ComCtrls, ToolWin, ExtCtrls, PatternEdit, unArtFrame, unFraCodigoDescripcion,
  FormPanel, Grids, DBGrids, RXDBCtrl, unfraUsuariosExternos, unCustomAccionABM, unFraCtbTablas, unfraUsuarios, Mask,
  IntEdit, unAlertas, unAlertaTypes, DateTimeEditors, Buttons, DateTimeFuncs, unArtDBAwareFrame,
  ImgList, RxPlacemnt;

type
  TfrmManAlertas = class(TfrmCustomPanelABM)
    Label1: TLabel;
    PageControl: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsAcciones: TTabSheet;
    tsParametros: TTabSheet;
    edCodigo: TPatternEdit;
    Label2: TLabel;
    Label5: TLabel;
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
		lbAccion: TLabel;
    Bevel3: TBevel;
    fraAlertaAccion: TfraCodigoDescripcion;
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
    sdqUsuarios: TSDQuery;
    tbParamMoverAbajo: TToolButton;
    tbSintaxisCheck: TToolButton;
    ToolButton3: TToolButton;
    Label12: TLabel;
    ToolButton2: TToolButton;
    tbEjecutar: TToolButton;
    ToolButton5: TToolButton;
    ToolBar4: TToolBar;
    tbAccNuevoProcArch: TToolButton;
    tbAccModificarProcArch: TToolButton;
    Label13: TLabel;
    edParaOrigen: TEdit;
    gbProgramacion: TGroupBox;
    edDescripcion: TMemo;
    dsUsuarios: TDataSource;
    fraUsuarioPropietario: TfraUsuario;
    lUsuarioPropietario: TLabel;
    sdqProgramacion: TSDQuery;
    fraAlerta: TfraCodigoDescripcion;
    nbProgramacion: TNotebook;
    gbPeriodoDiario: TGroupBox;
    Label3: TLabel;
    UpDown1: TUpDown;
		edtFrecuenciaDiaria: TIntEdit;
    gbMensualmente: TGroupBox;
    chkEnero: TCheckBox;
    chkFebrero: TCheckBox;
    chkMarzo: TCheckBox;
    chkAbril: TCheckBox;
    chkMayo: TCheckBox;
    chkJunio: TCheckBox;
    chkJulio: TCheckBox;
    chkAgosto: TCheckBox;
    chkSetiembre: TCheckBox;
    chkOctubre: TCheckBox;
    chkNoviembre: TCheckBox;
    chkDiciembre: TCheckBox;
    gbSemanalmente: TGroupBox;
    chkLunes: TCheckBox;
    chkMartes: TCheckBox;
    chkMiercoles: TCheckBox;
    chkJueves: TCheckBox;
    chkViernes: TCheckBox;
    nbFrecuencia: TNotebook;
    gbFrecuencia: TGroupBox;
    lbEmpezando: TLabel;
    Label4: TLabel;
    rbUnaVez: TRadioButton;
    rbEjecutarCada: TRadioButton;
    cmbPeriodo: TComboBox;
    edtCantidadUnidadTiempo: TIntEdit;
    rbOcurrencia: TRadioGroup;
    spVerificarSintaxis: TSpeedButton;
    tsDestinos: TTabSheet;
    fpUsuarios: TFormPanel;
    Label8: TLabel;
    Bevel2: TBevel;
    btnUsuAceptar: TButton;
    btnUsuCancelar: TButton;
    fraUsuario: TfraUsuariosExternos;
    dbgUsuarios: TRxDBGrid;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    tbUsuNuevo: TToolButton;
    tbUsuEliminar: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    lbDias: TLabel;
    Label6: TLabel;
    edMotivoMensaje: TEdit;
    edHoraEjecucion: TDateTimePicker;
    edEmpezando: TDateTimePicker;
    edTerminando: TDateTimePicker;
    tbTestear: TToolButton;
    chkAlertaHabilitada: TCheckBox;
    chkAnexan: TCheckBox;
    Label7: TLabel;
    edEmail: TEdit;
    ilColor: TImageList;
    ilByN: TImageList;
    procedure FSFormCreate(Sender: TObject);
    procedure tbAccNuevoClick(Sender: TObject);
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
    procedure rbUnaVezClick(Sender: TObject);
    procedure rbEjecutarCadaClick(Sender: TObject);
    procedure rbOcurrenciaClick(Sender: TObject);
    procedure spVerificarSintaxisClick(Sender: TObject);
    procedure tbTestearClick(Sender: TObject);
    procedure edEmailChange(Sender: TObject);
    procedure fraUsuariocmbDescripcionChange(Sender: TObject);
    procedure FSFormClose(Sender: TObject; var Action: TCloseAction);
  private
    DefParamEditor: TWinControl;
    function  GetAccionABMClass: TfrmCustomAccionABMClass;
    procedure OnFraAlertaChange(Sender: TObject);
    procedure OnfraAlertaAccionChange(Sender: TObject);
    procedure OnFraTipoDatoParametroChange(Sender: TObject);
    function  CalcularValorFrecuenciaSemanal: integer;
    function  CalcularValorFrecuenciaMensual: integer;
    function  CalcularUnidadFrecuencia : string;
    procedure LoadProgramacion;
    procedure LoadProgramacionMensual(Frecuencia: integer);
    procedure LoadProgramacionSemanal(Frecuencia: integer);
		procedure HabilitacionFrecuenciaProgramacion;
		function ValidarOcurrencia: Boolean;
    function ValidarFrecuencia: Boolean;
	protected
  public
    procedure ClearControls(ClearPK : Boolean = False); override;
    procedure LoadControls; override;
    procedure LoadGrids;
		function Validar : Boolean; override;
		function DoABM: Boolean; override;
    procedure LockControls( ALocked : Boolean = True ); override;
  end;

const
  PAG_GENERAL    = 0;
  PAG_ACCIONES   = 1;
  PAG_PARAMETROS = 2;
  PAG_USUARIOS   = 3;

var
  frmManAlertas: TfrmManAlertas;  

implementation

uses
  unDmPrincipal, unPrincipal, General, StrFuncs, AnsiSql, SqlFuncs, CustomDlgs, EditDialog, unImpoExpoTypes, DBSql,
  Consts, unParams, unManAcciones, unSesion, unfrmTesteoProgramacion, Internet;

{$R *.DFM}

{ TfrmManProcesos }

procedure TfrmManAlertas.FSFormCreate(Sender: TObject);
begin
  AutoTransactions := False;
  inherited;

  with fraAlerta do
  begin
    OnChange      := OnfraAlertaChange;
    TableName     := 'CAL_ALERTA';
    FieldID       := 'AL_ID';
    FieldCodigo   := 'AL_CODIGO';
    FieldDesc     := 'AL_DESCRIPCION';
    FieldBaja     := 'AL_FECHABAJA';
    CaseSensitive := False;
    ShowBajas     := True;
  end;


  with fraAlertaAccion do
  begin
    FieldID     := 'AN_ID';
    FieldCodigo := 'AN_ID';
    FieldDesc   := 'AN_DESCRIPCION';
    FieldBaja   := 'AN_FECHABAJA';
    TableName   := 'CAN_ACCION';
    {$IFNDEF ART2}
    IdType      := ctInteger;
    CodigoType  := ctInteger;
    {$ENDIF}
    OnChange := OnfraAlertaAccionChange;
    Clear;

    OnfraAlertaAccionChange(Nil);
  end;

  fraParaTipoDato.Clave := 'TDAT';
  fraParaTipoDato.OnChange := OnFraTipoDatoParametroChange;
  ClearControls(True);

  UnTouch := TList.Create ;
  UnTouch.Add(tbAccMoverArriba);
  UnTouch.Add(tbAccMoverAbajo);
  UnTouch.Add(tbParamMoverAbajo);
  UnTouch.Add(tbParamMoverArriba);
  AutoTransactions := False;  
end;

procedure TfrmManAlertas.ClearControls(ClearPK: Boolean);
begin
  inherited;
  if ClearPK Then
    fraAlerta.Clear;

  edCodigo.Text              := '';
  chkAlertaHabilitada.Checked := false;
  chkAnexan.Checked := false;
  edDescripcion.Text         := '';
  edMotivoMensaje.Text       := '';
  fraUsuarioPropietario.Limpiar;

  tbEjecutar.Enabled := False;
  tbTestear.Enabled := false;

  rbOcurrencia.ItemIndex := 0;
  nbFrecuencia.PageIndex := 0;
  gbFrecuencia.Caption := rbOcurrencia.Items.Strings[rbOcurrencia.ItemIndex];

  edHoraEjecucion.DateTime := 0;
  edtCantidadUnidadTiempo.value := 0;
  cmbPeriodo.ItemIndex := -1;

  edHoraEjecucion.DateTime := 0;
  edEmpezando.DateTime := 0;
  edTerminando.DateTime := 0;

  PageControl.ActivePageIndex := PAG_GENERAL;

  sdqAcciones.Close;
  sdqParametros.Close;
  sdqUsuarios.Close;
end;

function TfrmManAlertas.DoABM: Boolean;
var
  Sql: TDBSql;
  SqlProgramacion : TDBSql;
  IdAlerta : integer;
begin
  BeginTrans(True);
  Sql := TDBSql.Create('CAL_ALERTA');
  SqlProgramacion := TDBSql.Create('CPG_ALERTAPROGRAMACION');
  Result := False;
  try
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add( 'AL_ID', fraAlerta.Value );
      Sql.Fields.Add( 'AL_USUBAJA', frmPrincipal.DBLogin.UserId );
      Sql.Fields.Add( 'AL_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;

      SqlProgramacion.PrimaryKey.Add( 'PG_IDALERTA', fraAlerta.Value, false );
      SqlProgramacion.PrimaryKey.Add( 'PG_ORDEN', 1, false );
      SqlProgramacion.Fields.Add( 'PG_USUBAJA', frmPrincipal.DBLogin.UserId );
      SqlProgramacion.Fields.Add( 'PG_FECHABAJA', exDateTime);
      SqlProgramacion.SqlType := stUpdate;
    end
    else
    begin
      Sql.Fields.Add('AL_CODIGO', edCodigo.Text);

      if chkAlertaHabilitada.Checked then
         Sql.Fields.Add('AL_ACTIVO', 'S')
      else Sql.Fields.Add('AL_ACTIVO', 'N');

      if chkAnexan.Checked then
         Sql.Fields.Add('AL_ANEXA', 'S')
      else Sql.Fields.Add('AL_ANEXA', 'N');


      Sql.Fields.Add('AL_DESCRIPCION', edDescripcion.Text);
      Sql.Fields.Add('AL_MOTIVOMENSAJE', edMotivoMensaje.Text);
      Sql.Fields.Add('AL_USUARIO', fraUsuarioPropietario.edCodigo.Text);

      case rbOcurrencia.ItemIndex of
       0 : begin
             SqlProgramacion.Fields.Add( 'PG_TIPOPROGRAMACION', 'D', true);
             SqlProgramacion.Fields.AddInteger( 'PG_VALOR', edtFrecuenciaDiaria.Text);
           end;
       1 : begin
             SqlProgramacion.Fields.Add( 'PG_TIPOPROGRAMACION', 'S', true);
             SqlProgramacion.Fields.Add( 'PG_VALOR', CalcularValorFrecuenciaSemanal);
           end;
       2 : begin
             SqlProgramacion.Fields.Add( 'PG_TIPOPROGRAMACION', 'M', true);
             SqlProgramacion.Fields.Add( 'PG_VALOR', CalcularValorFrecuenciaMensual);
           end;
      end;

      if rbUnaVez.Checked then
      begin
        SqlProgramacion.Fields.Add( 'PG_TIPOFRECUENCIA', 'U', true );
        SqlProgramacion.Fields.AddInteger( 'PG_FRECUENCIA', DateTimeFuncs.timetoseconds( edHoraEjecucion.Time), false);
      end else
      begin
        SqlProgramacion.Fields.Add( 'PG_TIPOFRECUENCIA', 'R' );
        SqlProgramacion.Fields.AddInteger( 'PG_FRECUENCIA', edtCantidadUnidadTiempo.Value, false );

        SqlProgramacion.Fields.AddInteger( 'PG_FRECUENCIADESDE', DateTimeFuncs.timetoseconds(edEmpezando.Time) , false);
        SqlProgramacion.Fields.AddInteger( 'PG_FRECUENCIAHASTA', DateTimeFuncs.timetoseconds(edTerminando.Time), false);
        SqlProgramacion.Fields.Add( 'PG_UNIDADFRECUENCIA', CalcularUnidadFrecuencia, true );
      end;


      case ModoABM of
        maAlta:
        begin
          IdAlerta := IncSql('SELECT MAX(AL_ID) FROM CAL_ALERTA');
          Sql.PrimaryKey.Add('AL_ID', IdAlerta);//'SEQ_IPR_ID.NEXTVAL', False);
          Sql.Fields.Add('AL_USUALTA',   frmPrincipal.DBLogin.UserId);
          Sql.Fields.Add('AL_FECHAALTA', SQL_ACTUALDATE, False);
          Sql.SqlType := stInsert;

          SqlProgramacion.PrimaryKey.Add('PG_IDALERTA', IdAlerta, false);
          SqlProgramacion.PrimaryKey.Add('PG_ORDEN', IncSql('SELECT MAX(PG_ORDEN) FROM CPG_ALERTAPROGRAMACION WHERE PG_IDALERTA = ' + inttostr(IdAlerta)),False);

          SqlProgramacion.Fields.Add('PG_USUALTA',   frmPrincipal.DBLogin.UserId);
          SqlProgramacion.Fields.Add('PG_FECHAALTA', SQL_ACTUALDATE, False);
          SqlProgramacion.SqlType := stInsert;
        end;
        maModificacion:
        begin
          Sql.PrimaryKey.Add('AL_ID',     fraAlerta.Value);
          Sql.Fields.Add('AL_USUMODIF',   frmPrincipal.DBLogin.UserId);
          Sql.Fields.Add('AL_FECHAMODIF', exDateTime);
          Sql.Fields.Add('AL_USUBAJA',    exNull);
          Sql.Fields.Add('AL_FECHABAJA',  exNull);
          Sql.SqlType := stUpdate;


          SqlProgramacion.PrimaryKey.Add('PG_IDALERTA',     fraAlerta.Value);
          SqlProgramacion.Fields.Add('PG_USUMODIF',   frmPrincipal.DBLogin.UserId);
          SqlProgramacion.Fields.Add('PG_FECHAMODIF', exDateTime);
          SqlProgramacion.Fields.Add('PG_USUBAJA',    exNull);
          SqlProgramacion.Fields.Add('PG_FECHABAJA',  exNull);
          SqlProgramacion.SqlType := stUpdate;
        end;
      end;
    end;
    { -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- }
    try
      Sql.ExecuteST;
      SqlProgramacion.ExecuteST;
      CommitTrans(True);
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        RollBack(True);
        ErrorMsg(E);
      end;
    end;
    { -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- }
    if Result then
      case ModoABM of

        maAlta:
          begin
            fraAlerta.Value := Sql.PrimaryKey[0].Value;
            LoadGrids;
          end;

        maModificacion,
        maBaja:
          fraAlerta.Reload;

//      maBaja: ClearControls(True);
      end;
  finally
    Sql.Free;
    if (ModoABM = maBaja) and Result then
      ModoABM := maModificacion;
  end;
end;

procedure TfrmManAlertas.LoadControls;
begin
  sdqConsulta.Close;
  sdqConsulta.ParamByName('IdAlerta').AsInteger := fraAlerta.Value;
  sdqConsulta.Open;

  inherited;

  edCodigo.Text := sdqConsulta.FieldByName('AL_CODIGO').AsString;
  chkAlertaHabilitada.Checked := sdqConsulta.FieldByName('AL_ACTIVO').AsString = 'S';
  chkAnexan.Checked := sdqConsulta.FieldByName('AL_ANEXA').AsString = SQL_TRUE;
  edDescripcion.Text  := sdqConsulta.FieldByName('AL_DESCRIPCION').AsString;
  edMotivoMensaje.Text  := sdqConsulta.FieldByName('AL_MOTIVOMENSAJE').AsString;  
	fraUsuarioPropietario.Cargar(sdqConsulta.FieldByName('AL_USUARIO').AsString);

	LoadGrids;
end;

procedure TfrmManAlertas.LoadGrids;
begin
  sdqAcciones.Close;
  sdqAcciones.Sql.Text :=
    'SELECT AA_IDACCION, AA_ORDEN, AN_TIPOACCION, AN_DESCRIPCION, AA_OPCIONAL,' +
          ' DECODE(AA_OPCIONAL, ''S'', ''Sí'', ''No'') OPCIONAL' +
     ' FROM CAA_ALERTAACCION, CAN_ACCION' +
    ' WHERE AA_IDACCION = AN_ID' +
      ' AND AA_IDALERTA = :pAlerta' +
 ' ORDER BY AA_ORDEN';
	sdqAcciones.ParamByName('pAlerta').AsInteger := fraAlerta.Value;

  sdqParametros.Close;
  sdqParametros.ParamByName('pAlerta').AsInteger := fraAlerta.Value;

  sdqUsuarios.Close;
  sdqUsuarios.ParamByName('pAlerta').AsInteger := fraAlerta.Value;

  LoadProgramacion;
  PageControlChange(nil);
end;

procedure TfrmManAlertas.LoadProgramacion;
begin
	with sdqProgramacion do
  begin
		sdqProgramacion.Close;
		sdqProgramacion.ParamByName('pAlerta').AsInteger := fraAlerta.Value;
		sdqProgramacion.Open;

		try
			if RecordCount > 0 then
      begin
				if FieldByName('pg_tipoprogramacion').AsString = 'D' then
        begin
        	rbOcurrencia.ItemIndex := 0;
					nbProgramacion.PageIndex := 0;
					edtFrecuenciaDiaria.Value := FieldByName('pg_valor').AsInteger;
				end else
				if FieldByName('pg_tipoprogramacion').AsString = 'S' then
        begin
					rbOcurrencia.ItemIndex := 1;
					nbProgramacion.PageIndex := 1;
					LoadProgramacionSemanal(FieldByName('pg_valor').AsInteger);
				end else
				if FieldByName('pg_tipoprogramacion').AsString = 'M' then
        begin
					rbOcurrencia.ItemIndex := 2;
					nbProgramacion.PageIndex := 2;
					LoadProgramacionMensual(FieldByName('pg_valor').AsInteger);
				end;
				if FieldByName('pg_tipofrecuencia').AsString = 'U' then
        begin
					rbUnaVez.Checked := true;
					edHoraEjecucion.Time :=  SecondsToTime( FieldByName('pg_frecuencia').asinteger );
				end else
				if FieldByName('pg_tipofrecuencia').AsString = 'R' then
        begin
					rbEjecutarCada.Checked := true;
					edtCantidadUnidadTiempo.Value := FieldByName('pg_frecuencia').Value;
           cmbPeriodo.ItemIndex := ArrayPos(FieldByName('pg_unidadfrecuencia').AsString, TTipoUnidadFrecuencia);

					edEmpezando.Time := SecondsToTime( FieldByName('pg_frecuenciadesde').Value );
					edTerminando.Time := SecondsToTime( FieldByName('pg_frecuenciahasta').Value );
				end;

				HabilitacionFrecuenciaProgramacion;
			end;
		finally
			Close;
		end;
	end;
end;


procedure TfrmManAlertas.LoadProgramacionSemanal(Frecuencia : integer);
begin
  chkLunes.Checked       :=  (Frecuencia and 1) = 1;
  chkMartes.Checked      :=  (Frecuencia and 2) = 2;
  chkMiercoles.Checked   :=  (Frecuencia and 4) = 4;
  chkJueves.Checked      :=  (Frecuencia and 8) = 8;
  chkViernes.Checked     :=  (Frecuencia and 16)  = 16;
end;


procedure TfrmManAlertas.LoadProgramacionMensual(Frecuencia : integer);
begin
  chkEnero.Checked     := (Frecuencia and 1) = 1;
  chkFebrero.Checked   := (Frecuencia and 2) = 2;
  chkMarzo.Checked     := (Frecuencia and 4) = 4;
  chkAbril.Checked     := (Frecuencia and 8) = 8;
  chkJunio.Checked     := (Frecuencia and 16) = 16;
  chkJulio.Checked     := (Frecuencia and 32) = 32;
  chkAgosto.Checked    := (Frecuencia and 64) = 64;
  chkSetiembre.Checked := (Frecuencia and 128) = 128;
  chkOctubre.Checked   := (Frecuencia and 256) = 256;
  chkNoviembre.Checked := (Frecuencia and 512) = 512;
  chkDiciembre.Checked := (Frecuencia and 1024) = 1024;
end;

procedure TfrmManAlertas.LockControls(ALocked: Boolean);
begin
	inherited;
	PageControl.Enabled := True;
end;

function TfrmManAlertas.ValidarOcurrencia: Boolean;
begin
	result := False;
	case rbOcurrencia.ItemIndex of
	0 : result := edtFrecuenciaDiaria.Value > 0;
	1 : result := chkLunes.Checked or chkMartes.Checked or chkMiercoles.Checked
									or chkJueves.Checked or chkViernes.Checked;
	2 : result := chkEnero.Checked or chkFebrero.Checked or chkMarzo.Checked or chkAbril.Checked or
								chkMayo.Checked  or chkJunio.Checked or chkJulio.Checked or chkAgosto.Checked or
								chkSetiembre.Checked or chkOctubre.Checked or chkNoviembre.Checked or chkDiciembre.Checked;
	end;
end;

function TfrmManAlertas.ValidarFrecuencia : Boolean;
begin
	if rbEjecutarCada.Checked then
		result := ((cmbPeriodo.ItemIndex > -1) and (edtCantidadUnidadTiempo.Value > 0) and
							 (edEmpezando.Time > 0) and (edTerminando.Time > 0))
	else   result := True;
end;

function TfrmManAlertas.Validar: Boolean;
begin
	Result := VerificarMultiple (['Mantenimiento de Alertas',
											edCodigo,
											edCodigo.Text <> '',
											'Debe ingresar el código del Alerta.',

											edDescripcion,
											edDescripcion.text <> '',
											'Debe ingresar la descripción del alerta.',

											fraUsuarioPropietario,
											fraUsuarioPropietario.edCodigo.text <> '',
											'Debe ingresar un propietario para el alerta',

											nbProgramacion,
											ValidarOcurrencia,
											'Debe ingresar la programación adecuada',

											gbFrecuencia,
											ValidarFrecuencia,
											'Debe ingresar la frecuencia de ejecución'
											]);
end;

procedure TfrmManAlertas.tbAccNuevoClick(Sender: TObject);
begin
  fpAcciones.Caption := FORM_CAP_INSERT;
  fpAcciones.ShowModal;
end;

procedure TfrmManAlertas.tbAccModificarClick(Sender: TObject);
begin
	if tbAccModificar.Enabled and (not sdqAcciones.IsEmpty) then
  begin
    fraAlertaAccion.Value := sdqAcciones.FieldByName('AA_IDACCION').AsInteger;
		OnfraAlertaAccionChange(nil);

		fpAcciones.Caption := FORM_CAP_MODIFY;
		fpAcciones.ShowModal;
	end;
end;

procedure TfrmManAlertas.tbAccEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
	if MsgBox('¿Desea eliminar la acción seleccionada?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
		Sql := TSql.Create('CAA_ALERTAACCION');
		try
      Sql.PrimaryKey.Add('AA_IDALERTA', fraAlerta.Value);
			Sql.PrimaryKey.Add('AA_ORDEN', sdqAcciones.FieldByName('AA_ORDEN').AsInteger);
			EjecutarSqlST(Sql.DeleteSql);
		  sdqAcciones.Refresh;
    finally
		  Sql.Free;
		end;
	end;
end;

procedure TfrmManAlertas.btnAccAceptarClick(Sender: TObject);
var
	 Sql: TSql;
begin
	if fraAlertaAccion.IsEmpty Then
		InvalidMsg(fraAlertaAccion.edCodigo, 'Debe seleccionar el proceso / archivo')

	else begin
	 Sql := TSql.Create( 'CAA_ALERTAACCION' );
	 Try
			Sql.PrimaryKey.Add( 'AA_IDALERTA', fraAlerta.Value );
	//      Sql.Fields.Add( 'AA_TIPOACCION', Copy('IEFD', cmbAccTipo.ItemIndex * 2 + 1, 2) );
			Sql.Fields.Add( 'AA_IDACCION', fraAlertaAccion.Value );

			if fpAcciones.Caption = FORM_CAP_INSERT Then begin
				 Sql.PrimaryKey.Add( 'AA_ORDEN', IncSql('SELECT MAX(AA_ORDEN) FROM CAA_ALERTAACCION WHERE AA_IDALERTA = ' + SqlValue(fraAlerta.Value) ) );
				 Sql.Fields.Add( 'AA_FECHAALTA', SQL_ACTUALDATE, False );
				 Sql.Fields.Add( 'AA_USUALTA',   Sesion.LoginName );
				 Sql.SqlType := stInsert;
			end else begin
				 Sql.PrimaryKey.Add( 'AA_ORDEN',   sdqAcciones.FieldByName('AA_ORDEN').AsInteger );
				 Sql.Fields.Add( 'AA_FECHAMODIF', SQL_ACTUALDATE, False );
				 Sql.Fields.Add( 'AA_USUMODIF',    Sesion.LoginName );
				 Sql.SqlType := stUpdate;
			end;
			EjecutarSqlST(Sql.Sql);
			sdqAcciones.Refresh;
			fpAcciones.ModalResult := mrOk;
	 finally
     Sql.Free;
	 end;
	end;
end;

procedure TfrmManAlertas.PageControlChange(Sender: TObject);
begin
  inherited;
  case PageControl.ActivePageIndex of
    PAG_GENERAL    : OpenQuery( sdqProgramacion );
    PAG_ACCIONES   : OpenQuery( sdqAcciones );
    PAG_PARAMETROS : OpenQuery( sdqParametros );
    PAG_USUARIOS   : OpenQuery( sdqUsuarios );
  end;
end;

procedure TfrmManAlertas.tbParaNuevoClick(Sender: TObject);
begin
  edParaCodigo.Text      := '';
  edParaDescripcion.Text := '';
  edParaOrigen.Text      := '';
  fraParaTipoDato.Limpiar ;
  FreeAndNil(DefParamEditor);

  fpParametros.Caption := FORM_CAP_INSERT;
  fpParametros.ShowModal;
end;

procedure TfrmManAlertas.tbParaModificarClick(Sender: TObject);
begin
  if tbParaModificar.Enabled and (not sdqParametros.IsEmpty) then
  begin
    edParaCodigo.Text        := sdqParametros.FieldByName('AP_CODIGO').AsString;
    edParaDescripcion.Text   := sdqParametros.FieldByName('AP_DESCRIPCION').AsString;
    fraParaTipoDato.Value    := sdqParametros.FieldByName('AP_TIPO').AsString;
    edParaOrigen.Text        := sdqParametros.FieldByName('AP_ORIGEN').AsString;

    OnFraTipoDatoParametroChange(Nil);

    SetParamEditorValue(DefParamEditor, sdqParametros.FieldByName('AP_DEFAULT').AsString);

    fpParametros.Caption := FORM_CAP_MODIFY;
    fpParametros.ShowModal;
  end;
end;

procedure TfrmManAlertas.tbParaEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if MsgBox('¿Desea eliminar el Parámetro Seleccionado?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Sql := TSql.Create( 'CAP_ALERTAPARAMETRO' );
    try
      Sql.PrimaryKey.Add( 'AP_IDALERTA', fraAlerta.Value );
      Sql.PrimaryKey.Add( 'AP_CODIGO',  sdqParametros.FieldByName('AP_CODIGO').AsString );
      Sql.Fields.Add( 'AP_FECHABAJA', SQL_ACTUALDATE, False );
      Sql.Fields.Add( 'AP_USUBAJA',   Sesion.LoginName );
      EjecutarSqlST(Sql.UpdateSql);
      sdqParametros.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManAlertas.dbgParametrosGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not sdqParametros.FieldByName('AP_FECHABAJA').IsNull then
    AFont.Color := clRed;
end;

procedure TfrmManAlertas.btnParaAceptarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if edParaCodigo.Text = '' Then
     InvalidMsg( edCodigo, 'Debe ingresar el código del Parámetro')

  else if AreIn(UpperCase(edParaCodigo.Text), PARAMETROS_FIJOS) {or (Copy(UpperCase(edCodigo.Text), 0, 6) = 'FIELD!')} Then
     InvalidMsg( edCodigo, 'El código de parámetro esta reservado por la aplicación')

  else if fraParaTipoDato.Value = '' Then
     InvalidMsg( edCodigo, 'Debe seleccionar el Tipo de Dato')

  else if ExisteSql('SELECT 1 FROM CAP_ALERTAPARAMETRO ' +
                     'WHERE AP_IDALERTA = ' + SqlValue(fraAlerta.Value) + ' ' +
                       'AND AP_CODIGO = ''' + edCodigo.Text + '''' +
                       IIF(fpParametros.Caption = FORM_CAP_INSERT, '', 'AND AP_CODIGO <> ''' + sdqParametros.FieldByName('AP_CODIGO').AsString + '''' ) ) then
     InvalidMsg( edCodigo, 'Ya existe un Parámetro con el mismo código para el mismo proceso')

  else begin
     Sql := TSql.Create('CAP_ALERTAPARAMETRO');
     try
        Sql.PrimaryKey.Add('AP_IDALERTA', fraAlerta.Value);
        if (fpParametros.Caption = FORM_CAP_INSERT) Then begin
            Sql.SqlType := stInsert;
            Sql.Fields.Add('AP_FECHAALTA', SQL_ACTUALDATE, False);
            Sql.Fields.Add('AP_USUALTA',   Sesion.LoginName);
            Sql.Fields.Add('AP_ORDEN', IncSql('SELECT MAX(AP_ORDEN) FROM CAP_ALERTAPARAMETRO ' + Sql.Where ) );
        end else begin
            Sql.SqlType := stUpdate;
            Sql.PrimaryKey.Add('AP_CODIGO',  sdqParametros.FieldByName('AP_CODIGO').AsString);
            Sql.Fields.Add('AP_FECHAMODIF',  SQL_ACTUALDATE, False);
            Sql.Fields.Add('AP_USUMODIF',    Sesion.LoginName);
            Sql.Fields.Add( 'AP_FECHABAJA', SQL_NULL, False );
            Sql.Fields.Add( 'AP_USUBAJA',  SQL_NULL, False );
        end;
        Sql.Fields.Add('AP_CODIGO', edParaCodigo.Text);
        Sql.Fields.Add('AP_DESCRIPCION', edParaDescripcion.Text);
        Sql.Fields.Add('AP_TIPO', fraParaTipoDato.Value);
        Sql.Fields.Add('AP_DEFAULT', GetParamEditorValue(DefParamEditor));
        Sql.Fields.Add('AP_ORIGEN', edParaOrigen.Text);

        EjecutarSqlST(Sql.Sql);
        fpParametros.ModalResult := mrOk;
        sdqParametros.Refresh ;
     finally
        Sql.Free;
     end;
  end;
end;

procedure TfrmManAlertas.tbUsuNuevoClick(Sender: TObject);
begin
  fraUsuario.Clear;
  edEmail.Clear;

  fpUsuarios.Caption := FORM_CAP_INSERT;
  fpUsuarios.ShowModal;
end;

procedure TfrmManAlertas.tbUsuEliminarClick(Sender: TObject);
var
  Sql: TSql;
begin
  if MsgBox('¿ Desea desvincular al usuario seleccionado ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    Sql := TSql.Create('CAU_ALERTAUSUARIO');
    try
      Sql.PrimaryKey.Add('AU_IDALERTA', fraAlerta.Value);

      if sdqUsuarios.FieldByName('AU_IDUSUARIO').AsString <> '' then
        Sql.PrimaryKey.Add('AU_IDUSUARIO', sdqUsuarios.FieldByName('AU_IDUSUARIO').AsString)
      else
        Sql.PrimaryKey.Add('AU_EMAIL', sdqUsuarios.FieldByName('SE_MAIL').AsString);

      EjecutarSqlST(Sql.DeleteSql);
      sdqUsuarios.Refresh;
    finally
      Sql.Free;
    end;
  end;
end;

procedure TfrmManAlertas.btnUsuAceptarClick(Sender: TObject);
var
  Sql: TSql;
  sSql: String;
begin
  Verificar((not fraUsuario.IsSelected) and (not IsEMail(edEmail.Text)), fraUsuario.edCodigo, 'Debe seleccionar un usuario o ingresar una dirección de e-mail válida.');

  if fraUsuario.IsSelected then
  begin
    sSql :=
      'SELECT 1' +
       ' FROM CAU_ALERTAUSUARIO' +
      ' WHERE AU_IDALERTA = ' + SqlValue(fraAlerta.Value) +
        ' AND AU_IDUSUARIO = ' + SqlString(fraUsuario.edCodigo.Text, True) +
          IIF(fpUsuarios.Caption = FORM_CAP_INSERT, '', ' AND AU_IDUSUARIO <> ' +
              SqlString(sdqUsuarios.FieldByName('AU_IDUSUARIO').AsString, True));
    Verificar(ExisteSql(sSql), fraUsuario.edCodigo, 'Ya existe un usuario con el mismo código para el mismo proceso.');
  end
  else
  begin
    sSql :=
      'SELECT 1' +
       ' FROM CAU_ALERTAUSUARIO' +
      ' WHERE AU_IDALERTA = ' + SqlValue(fraAlerta.Value) +
        ' AND AU_EMAIL = ' + SqlString(edEmail.Text, True) +
          IIF(fpUsuarios.Caption = FORM_CAP_INSERT, '', ' AND AU_EMAIL <> ' +
              SqlString(sdqUsuarios.FieldByName('SE_MAIL').AsString, True));
    Verificar(ExisteSql(sSql), fraUsuario.edCodigo, 'Ya existe esa dirección de e-mail para el mismo proceso.');
  end;


  Sql := TSql.Create('CAU_ALERTAUSUARIO');
  try
    Sql.PrimaryKey.Add('AU_ID',    IncSql('SELECT MAX(AU_ID) FROM CAU_ALERTAUSUARIO'));
    Sql.Fields.Add('AU_IDALERTA',  fraAlerta.Value);

    if fraUsuario.IsSelected then
      Sql.Fields.Add('AU_IDUSUARIO', fraUsuario.edCodigo.Text)
    else
      Sql.Fields.Add('AU_EMAIL', edEmail.Text);

    EjecutarSqlST(Sql.InsertSql);
    fpUsuarios.ModalResult := mrOk;
    sdqUsuarios.Refresh;
  finally
    Sql.Free;
  end;
end;

procedure TfrmManAlertas.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if ModoABM = maAlta then
  begin
    AllowChange := False;
    if MsgBox('Para poder agregar Acciones, Parámetros o Usuarios Relacionados, primero debe guardar los Datos Generales.' + #13 +
              '¿ Desea guardar estos datos ?', MB_ICONQUESTION + MB_YESNO) = IDYES then
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

procedure TfrmManAlertas.tbAccMoverClick(Sender: TObject);
{$IFDEF SQLSERVER}

{$ELSE}
  {$IFDEF MSACCESS}
  {$ELSE}
         Var
          sSql   : String;
          bAbajo : Boolean;
  {$ENDIF}
{$ENDIF}
begin
    {$IFDEF SQLSERVER}
    MsgBox('La opción no está habilitada para SqlServer', MB_ICONEXCLAMATION);
    {$ELSE}
    {$IFDEF MSACCESS}
    MsgBox('La opción no está habilitada para Access', MB_ICONEXCLAMATION);
    {$ELSE}
    bAbajo := TComponent(Sender).Tag > 0 ;
    sSql := 'DECLARE ' +
              'RowId_Origen  ROWID; ' +
              'Orden_Origen  Number; ' +
              'RowId_Destino ROWID; ' +
              'Orden_Destino Number; ' +
            'BEGIN ' +
              'SELECT ROWID, AA_ORDEN ' +
                'INTO RowId_Origen, Orden_Origen ' +
                'FROM CAA_ALERTAACCION ' +
               'WHERE AA_IDALERTA = ' + SqlValue(fraAlerta.Value) + ' ' +
                 'AND AA_ORDEN = ' + SqlInt( sdqAcciones.FieldByName('AA_ORDEN').AsInteger ) + '; ' +

              'SELECT AA_ORDEN, ROWID ' +
                'INTO Orden_Destino, RowId_Destino ' +
                'FROM CAA_ALERTAACCION O ' +
               'WHERE AA_IDALERTA = ' + SqlValue(fraAlerta.Value) + ' ' +
                 'AND AA_ORDEN = (SELECT ' + IIF( bAbajo,'MIN', 'MAX')  + '(D.AA_ORDEN) ' +
                                   'FROM CAA_ALERTAACCION D ' +
                                  'WHERE D.AA_IDALERTA = O.AA_IDALERTA ' +
                                    'AND D.AA_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt( sdqAcciones.FieldByName('AA_ORDEN').AsInteger ) + '); ' +
              'UPDATE CAA_ALERTAACCION O ' +
                 'SET AA_ORDEN = (SELECT MAX(D.AA_ORDEN) + 1 FROM CAA_ALERTAACCION D WHERE D.AA_IDALERTA = O.AA_IDALERTA) ' +
               'WHERE ROWID = RowId_Origen; ' +

              'UPDATE CAA_ALERTAACCION ' +
                 'SET AA_ORDEN = Orden_Origen ' +
               'WHERE ROWID = RowId_Destino; ' +

              'UPDATE CAA_ALERTAACCION ' +
                 'SET AA_ORDEN = Orden_Destino ' +
               'WHERE ROWID = RowId_Origen; ' +
            'END;';
    EjecutarSqlST(sSql);
    sdqAcciones.Refresh;

    if bAbajo Then
       sdqAcciones.Next
    else
       sdqAcciones.Prior;
    {$ENDIF}
    {$ENDIF}
end;

procedure TfrmManAlertas.sdqAccionesAfterScroll(DataSet: TDataSet);
begin
  tbAccMoverArriba.Enabled := DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};
  tbAccMoverAbajo.Enabled  := DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF};
end;

procedure TfrmManAlertas.tbParamMoverClick(Sender: TObject);
Var sSql   : String;
    bAbajo : Boolean;
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
              'SELECT ROWID, AP_ORDEN ' +
                'INTO RowId_Origen, Orden_Origen ' +
                'FROM CAP_ALERTAPARAMETRO ' +
               'WHERE AP_IDALERTA = ' + SqlValue(fraAlerta.Value) + ' ' +
                 'AND AP_ORDEN = ' + SqlInt( sdqParametros.FieldByName('AP_ORDEN').AsInteger ) + '; ' +

              'SELECT AP_ORDEN, ROWID ' +
                'INTO Orden_Destino, RowId_Destino ' +
                'FROM CAP_ALERTAPARAMETRO O ' +
               'WHERE AP_IDALERTA = ' + SqlValue(fraAlerta.Value) + ' ' +
                 'AND AP_ORDEN = (SELECT ' + IIF( bAbajo,'MIN', 'MAX')  + '(D.AP_ORDEN) ' +
                                   'FROM CAP_ALERTAPARAMETRO D ' +
                                  'WHERE D.AP_IDALERTA = O.AP_IDALERTA ' +
                                    'AND D.AP_ORDEN ' + IIF( bAbajo,'>', '<')  + ' ' + SqlInt( sdqParametros.FieldByName('AP_ORDEN').AsInteger ) + '); ' +
              'UPDATE CAP_ALERTAPARAMETRO O ' +
                 'SET AP_ORDEN = (SELECT MAX(D.AP_ORDEN) + 1 FROM CAP_ALERTAPARAMETRO D WHERE D.AP_IDALERTA = O.AP_IDALERTA) ' +
               'WHERE ROWID = RowId_Origen; ' +

              'UPDATE CAP_ALERTAPARAMETRO ' +
                 'SET AP_ORDEN = Orden_Origen ' +
               'WHERE ROWID = RowId_Destino; ' +

              'UPDATE CAP_ALERTAPARAMETRO ' +
                 'SET AP_ORDEN = Orden_Destino ' +
               'WHERE ROWID = RowId_Origen; ' +
            'END;';
    EjecutarSqlST(sSql);
    sdqParametros.Refresh;

    if bAbajo Then
      sdqParametros.Next
    else
      sdqParametros.Prior;
    {$ENDIF}
end;

procedure TfrmManAlertas.sdqParametrosAfterScroll(DataSet: TDataSet);
begin
	tbParamMoverArriba.Enabled := DataSet.RecNo > {$IFDEF VER150}0{$ELSE}1{$ENDIF};
	tbParamMoverAbajo.Enabled  := DataSet.RecNo < DataSet.RecordCount {$IFDEF VER150}- 1{$ENDIF};
end;

procedure TfrmManAlertas.tbSintaxisCheckClick(Sender: TObject);
var
  Bookmark: {$IFDEF VER150}TBookmarkStr{$ELSE}TBookmark{$ENDIF};
begin
  MsgBox('Acción deshabilitada hasta que se sepa de donde sale el campo AA_TIPOACCION..');
  Exit;

	sdqAcciones.DisableControls;
	try
		Bookmark := sdqAcciones.Bookmark;
		try
			sdqAcciones.First;
			while not sdqAcciones.Eof do
      begin
				if (sdqAcciones.FieldByName('AA_TIPOACCION').AsString = TA_PROCESS) then
        try
          WriteStatusText('Comprobando ' + sdqAcciones.FieldByName('DESC_RELACION').AsString );
          CheckAndOpenQuery(dmPrincipal.sdqConsulta, sdqAcciones.FieldByName('SQL').AsString,
														sdqAcciones.FieldByName('AA_TIPOACCION').AsString = TA_MAIL);
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

procedure TfrmManAlertas.OnFraTipoDatoParametroChange(Sender: TObject);
var
  AClass: TWinControlClass;
begin
  if fraParaTipoDato.IsSelected Then
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

procedure TfrmManAlertas.tbEjecutarClick(Sender: TObject);
begin
  EjecutarInmediatamente(fraAlerta.Value);
end;

procedure TfrmManAlertas.OnfraAlertaAccionChange(Sender: TObject);
begin
  tbAccModificarProcArch.Enabled := fraAlertaAccion.IsSelected;
end;

procedure TfrmManAlertas.OnfraAlertaChange(Sender: TObject);
begin
  PKChange(fraAlerta.IsSelected);
  tbEjecutar.Enabled := fraAlerta.IsSelected;
  tbTestear.Enabled := tbEjecutar.Enabled;
end;

function TfrmManAlertas.GetAccionABMClass: TfrmCustomAccionABMClass;
begin
  Result := TfrmManAcciones;
end;

procedure TfrmManAlertas.tbAccNuevoProcArchClick(Sender: TObject);
begin
	with GetAccionABMClass.Create(Self) do
  try
    fraAlertaAccion.Value := Insert;
    OnfraAlertaAccionChange(nil);
  finally
    Free;
  end;
end;

procedure TfrmManAlertas.tbAccModificarProcArchClick(Sender: TObject);
begin
	with GetAccionABMClass.Create( Self ) do
	try
		if Edit(fraAlertaAccion.Value) Then
			fraAlertaAccion.Reload;
	finally
		Free;
	end;
end;

function TfrmManAlertas.CalcularValorFrecuenciaSemanal : integer;
begin
  result := 0;
  if chkLunes.Checked     then result :=  result or 1;
  if chkMartes.Checked    then result :=  result or 2;
  if chkMiercoles.Checked then result :=  result or 4;
  if chkJueves.Checked    then result :=  result or 8;
  if chkViernes.Checked   then result :=  result or 16;
end;

function TfrmManAlertas.CalcularValorFrecuenciaMensual : integer;
begin
  result := 0;
  if chkEnero.Checked     then result := result or 1;
  if chkFebrero.Checked   then result := result or 2;
  if chkMarzo.Checked     then result := result or 4;
  if chkAbril.Checked     then result := result or 8;
  if chkJunio.Checked     then result := result or 16;
  if chkJulio.Checked     then result := result or 32;
  if chkAgosto.Checked    then result := result or 64;
  if chkSetiembre.Checked then result := result or 128;
  if chkOctubre.Checked   then result := result or 256;
  if chkNoviembre.Checked then result := result or 512;
  if chkDiciembre.Checked then result := result or 1024;
end;

function TfrmManAlertas.CalcularUnidadFrecuencia: string;
begin
  case cmbPeriodo.ItemIndex of
    0 : result := 'H';
    1 : result := 'M';
    2 : result := 'S';
  end;
end;                

procedure TfrmManAlertas.rbUnaVezClick(Sender: TObject);
begin
  inherited;
  HabilitacionFrecuenciaProgramacion;
end;

procedure TfrmManAlertas.rbEjecutarCadaClick(Sender: TObject);
begin
  inherited;
  HabilitacionFrecuenciaProgramacion;
end;
           
procedure TfrmManAlertas.HabilitacionFrecuenciaProgramacion;
begin
  edtCantidadUnidadTiempo.Enabled := rbEjecutarCada.Checked;
  cmbPeriodo.Enabled := rbEjecutarCada.Checked;
  edEmpezando.Enabled := rbEjecutarCada.Checked;
  edTerminando.Enabled := rbEjecutarCada.Checked;
  edHoraEjecucion.Enabled := rbUnaVez.Checked;
end;

procedure TfrmManAlertas.rbOcurrenciaClick(Sender: TObject);
begin
  inherited;
  if rbOcurrencia.ItemIndex > -1 then
    nbProgramacion.PageIndex := rbOcurrencia.ItemIndex;
end;

procedure TfrmManAlertas.spVerificarSintaxisClick(Sender: TObject);
begin
  with TSDQuery.Create(nil) do
  try
    try
      DatabaseName := 'dbPrincipal';
      Sql.Text := edParaOrigen.Text;
      Prepare;
      Open;
      if recordcount > 0 then
        InfoHint(edParaOrigen, 'El valor actual del parámetro es ' + fields[0].AsString, false, 'Verificando Parámetro')
      else
        InfoHint(edParaOrigen, 'El parámetro no retorno valor', false, 'Verificando Parámetro');
    except
      on E: Exception do
      begin
        InvalidMsg(edParaOrigen,' La sentencia de origen del parámetro no es válida. ' + #13#10 +
                                 ' Verifique la consulta.', 'Verificando Parámetro');
      end;
    end;
  finally
    Free;
  end;
end;

{
procedure TfrmManAlertas.VerificarMultiple(const Arg : array of TVarRec);
var
 Titulo : string;
 Mensaje : string;
 Condicion : boolean;
 Control : TWinControl;
 i : integer;
begin
//    Titulo := Arg[0].VAnsiString;

    if (High(Arg) mod 3) > 0 then raise Exception.Create('Verificar: Cantidad de parámetros inválidos.');

    for i := 0 to ((High(Arg) div 3) - 1) do begin
        if (Arg[i * 3] is VObject) and (Arg[i * 3 + 1] is VBoolean )
            and (Arg[i * 3 + 2] is VAnsiString) then begin
            Control   := Arg[i * 3].VObject;
            Condicion := Arg[i * 3 + 1 ].VBoolean;
            Mensaje   := Arg[i * 3 + 2 ].VAnsiString;
        else raise Exception.Create('Verificar: Los parámetros no son del tipo correcto.');

        if Not Condicion then begin
           InvalidMsg(Control, Mensaje);
           Abort;
        end;
    end;

end;
}

procedure TfrmManAlertas.tbTestearClick(Sender: TObject);
begin
  with TfrmTesteoProgramacion.Create(self) do
  begin
    if sdqProgramacion.RecordCount > 0 then
    begin
      TestearProgramacion( sdqProgramacion.FieldByName('pg_tipoprogramacion').AsString,
                           sdqProgramacion.FieldByName('pg_valor').asInteger,
                           sdqProgramacion.FieldByName('pg_tipofrecuencia').AsString,
                           sdqProgramacion.FieldByName('pg_frecuencia').AsInteger,
                           sdqProgramacion.FieldByName('pg_frecuenciadesde').AsInteger,
                           sdqProgramacion.FieldByName('pg_frecuenciahasta').AsInteger,
                           sdqProgramacion.FieldByName('pg_unidadfrecuencia').AsString);
    end;
  end;
end;

procedure TfrmManAlertas.edEmailChange(Sender: TObject);
begin
  if edEmail.Text <> '' then
    fraUsuario.Clear;
end;

procedure TfrmManAlertas.fraUsuariocmbDescripcionChange(Sender: TObject);
begin
  if fraUsuario.IsSelected then
    edEmail.Clear;
end;

procedure TfrmManAlertas.FSFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(frmPrincipal) and Assigned(frmPrincipal.mnuSubAlertas) then
    frmPrincipal.mnuSubAlertas.Enabled := True;    
  inherited;
end;

end.
