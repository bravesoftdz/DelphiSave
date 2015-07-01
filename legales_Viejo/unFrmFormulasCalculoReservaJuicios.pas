unit unFrmFormulasCalculoReservaJuicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, Menus, ImgList, mwCustomEdit, mwHighlighter, mwSqlSyn,
  unArtDBAwareFrame;

type
  TfrmFormulasCalculoReservaJuicios = class(TfrmCustomGridABM)
    ilColor: TImageList;
    ilByN: TImageList;
    pmnuCampos: TPopupMenu;
    sdqCampos: TSDQuery;
    sdqCamposJT_PORCENTAJERESULTADOPROBABLE: TFloatField;
    sdqCamposJT_IMPORTERESERVAHONORARIOS: TFloatField;
    sdqCamposJT_IMPORTERESERVA: TFloatField;
    sdqCamposOD_DENTRODELREGIMEN: TStringField;
    sdqCamposOD_CUMPLENORMASHYS: TStringField;
    sdqCamposOD_PORCENTAJEINCAPACIDADCALC: TFloatField;
    sdqCamposRT_MONTODEMANDADO: TFloatField;
    sdqCamposRT_PORCENTAJEINCAPACIDAD: TFloatField;
    sdqCamposRC_RECLAMAINCAPACIDAD: TStringField;
    sdqCamposRE_TIPO: TStringField;
    mwSqlSynSql: TmwSqlSyn;
    pnFormulas: TPanel;
    tbEvToolBar: TToolBar;
    tbSeparador0: TToolButton;
    tbLimpiarFormula: TToolButton;
    tbSeparador1: TToolButton;
    tbChequearConsulta: TToolButton;
    tbSeparador2: TToolButton;
    tbAgregarCampo: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    pnCabecera: TPanel;
    lblTipoJuicio: TLabel;
    lblReclamo: TLabel;
    lblFechaAsignacion: TLabel;
    lbConcurso: TLabel;
    lblDescripcion: TLabel;
    fraTipoJuicio: TfraCodigoDescripcion;
    fraReclamo: TfraCodigoDescripcion;
    edFechaVigenciaDesde: TDateComboBox;
    edFechaVigenciaHasta: TDateComboBox;
    edDescripcion: TEdit;
    pcFormulas: TPageControl;
    tsCalculoReservaCapital: TTabSheet;
    mwReservaCapital: TmwCustomEdit;
    tsCalculoReservaHonorarios: TTabSheet;
    mwSqlSynSql2: TmwSqlSyn;
    mwReservaHonorarios: TmwCustomEdit;
    procedure tbChequearConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  private
    procedure CargarCamposParametros;
    procedure ChequearConsulta;
    procedure pmnuCamposClick(Sender: TObject);
    procedure ReclamoChange(Sender: TObject);
  public
  end;

const
	PAG_RESERVACAPITAL  		= 0;
	PAG_RESERVAHONORARIOS   = 1;

implementation

uses
	unDmPrincipal, unPrincipal, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, StrFuncs, VclExtra, Cuit,
  unCustomConsulta, unDmLegales;

{$R *.dfm}

procedure TfrmFormulasCalculoReservaJuicios.FormCreate(Sender: TObject);
begin
  inherited;

  with fraTipoJuicio do
  begin
    TableName   := 'legales.ltj_tipojuicio';
    FieldID     := 'tj_id';
    FieldCodigo := 'tj_id';
    FieldDesc   := 'tj_descripcion';
  end;

  with fraReclamo do
  begin
    TableName   := 'legales.lrc_reclamo';
    FieldID     := 'rc_id';
    FieldCodigo := 'rc_id';
    FieldDesc   := 'rc_descripcion';
    ExtraFields := ', rc_reclamaincapacidad ';
    OnChange := ReclamoChange;
  end;
  Sql.TableName := 'LEGALES.LFR_FORMULARESERVA';
  FieldBaja     := 'FR_FECHABAJA';
end;

procedure TfrmFormulasCalculoReservaJuicios.ClearControls;
begin
  edDescripcion.Text := '';
  fraTipoJuicio.Codigo := '';
  fraReclamo.Codigo := '';
  edFechaVigenciaDesde.Date := 0;
  edFechaVigenciaHasta.Date := 0;
  mwReservaCapital.Lines.Text := ' ';
  mwReservaHonorarios.Lines.Text := ' ';
  pcFormulas.ActivePageIndex := PAG_RESERVACAPITAL;

  VCLextra.LockControls([fraTipoJuicio, fraReclamo],(ModoABM = maModificacion));
end;

procedure TfrmFormulasCalculoReservaJuicios.LoadControls;
begin
  edDescripcion.Text 				:= sdqConsulta.FieldByName('fr_descripcion').AsString;
  fraTipoJuicio.Codigo 			:= sdqConsulta.FieldByName('fj_idtipojuicio').AsString;
  fraReclamo.Codigo 				:= sdqConsulta.FieldByName('fj_idreclamo').AsString;
  edFechaVigenciaDesde.Date := sdqConsulta.FieldByName('fr_fechavigencia').AsDateTime;
  edFechaVigenciaHasta.Date := sdqConsulta.FieldByName('fr_fechavigenciahasta').AsDateTime;
  mwReservaCapital.Text 		:= sdqConsulta.FieldByName('fr_formulareservacapital').AsString;
  mwReservaHonorarios.Text 	:= sdqConsulta.FieldByName('fr_formulareservahonorario').AsString;

  VCLextra.LockControls([fraTipoJuicio, fraReclamo], (ModoABM = maModificacion));

  CargarCamposParametros;
end;

function TfrmFormulasCalculoReservaJuicios.Validar: Boolean;
var
	sdqSql: TSDQuery;
  sqlReservaCapital: String;
  sqlReservaHonorarios: String;
begin
  Result := True;

  sdqSql := TSDQuery.Create(Self);
  SetDatabaseToQuery(sdqSql);
  try
    sqlReservaCapital := PrepararSentencia(trCapitalJuicio, mwReservaCapital.Lines, dmLegales.sdqCalculoReservaJuicio.Fields);
    sqlReservaHonorarios := PrepararSentencia(trHonorariosJuicio, mwReservaHonorarios.Lines, dmLegales.sdqCalculoReservaJuicio.Fields);

    VerificarMultiple(['Formulas para Cálculo de Reservas',
        edDescripcion, not IsEmptyString(edDescripcion.Text), 'Debe especificar una Descripción.',
        fraReclamo.edCodigo, fraReclamo.IsSelected or fraTipoJuicio.IsSelected, 'Debe especificar un tipo de juicio o un reclamo.',
        edFechaVigenciaDesde, edFechaVigenciaDesde.Date > 0, 'Debe especificar una fecha de comienzo de aplicación de la fórmula.',
        mwReservaCapital, not IsEmptyString(mwReservaCapital.Text), 'Debe especificar una formula para calcular la reserva de capitales.',
        mwReservaHonorarios, not IsEmptyString(mwReservaHonorarios.Text), 'Debe especificar una formula para calcular la reserva de honorarios.',
        mwReservaCapital, CheckSintaxis(sdqSql, sqlReservaCapital), 'La formula para calcular la reserva de capitales contiene errores de sintaxis.',
        mwReservaHonorarios, CheckSintaxis(sdqSql, sqlReservaHonorarios), 'La formula para calcular la reserva de honorarios contiene errores de sintaxis.',
        mwReservaCapital, VerificarFormula(mwReservaCapital.lines), 'En la formula debe asignar el resultado a la variable <"Valor">.',
        mwReservaHonorarios, VerificarFormula(mwReservaHonorarios.lines), 'En la formula debe asignar el resultado a la variable <"Valor">.']);
  finally
    sdqSql.Free;
  end;
end;

function TfrmFormulasCalculoReservaJuicios.DoABM: Boolean;
var
	IDFormula: Integer;
begin
	Sql.Clear;
  Sql.TableName := 'LEGALES.LFR_FORMULARESERVA';

  Result := True;

	if ModoABM = maBaja then
  begin
  	IDFormula := sdqConsulta.FieldByName('FR_ID').AsInteger;
    Sql.PrimaryKey.Add('FR_ID', 	 sdqConsulta.FieldByName('FR_ID').AsInteger);
    Sql.Fields.Add('FR_FECHABAJA', exDateTime);
    Sql.Fields.Add('FR_USUBAJA',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
	end
  else
  begin
  	if ModoABM = maAlta then
    begin
    	IDFormula := GetSecNextVal('LEGALES.SEQ_LFR_ID');
//        Sql.PrimaryKey.AddExpression( 'FR_ID', IDFormula );
			Sql.PrimaryKey.Add('FR_ID', 			 IDFormula);
      Sql.Fields.Add('FR_FECHAALTA', 		 exDateTime);
      Sql.Fields.Add('FR_USUALTA', 			 Sesion.LoginName);
      Sql.Fields.Add('FR_FECHAVIGENCIA', edFechaVigenciaDesde.Date);
      Sql.SqlType := stInsert;
//        Sql.Fields.AddInteger( 'FR_IDTIPOJUICIO' ,fraTipoJuicio.Codigo, true);
//        Sql.Fields.AddInteger( 'FR_IDRECLAMO', fraReclamo.Codigo, true);
		end
    else
    begin { maModificacion }
    	IDFormula := sdqConsulta.FieldByName('FR_ID').AsInteger;
      Sql.PrimaryKey.Add('FR_ID', 								sdqConsulta.FieldByName('FR_ID').AsInteger);
      Sql.Fields.Add('FR_FECHAMODIF', 						exDateTime);
      Sql.Fields.Add('FR_USUMODIF',   					 	Sesion.LoginName);
      Sql.SqlType := stUpdate;
      Sql.Fields.AddDate('FR_FECHAVIGENCIAHASTA', edFechaVigenciaHasta.Date, True);
    end;

    Sql.Fields.Add('FR_DESCRIPCION', 						 edDescripcion.Text);
    Sql.Fields.Add('FR_FORMULARESERVACAPITAL', 	 mwReservaCapital.Lines.Text);
    Sql.Fields.Add('FR_FORMULARESERVAHONORARIO', mwReservaHonorarios.Lines.Text);
	end;

	try
  	BeginTrans;
    EjecutarSqlST(Sql.Sql);
  except
  	on E: Exception do
    begin
    	Result := False;
      Rollback;
      ErrorMsg(E);
      Exit;
    end;
	end;

	Sql.Clear;
  Sql.TableName := 'LEGALES.LFJ_FORMULARESERVAJUICIO';

	if ModoABM = maBaja then
  begin
    Sql.PrimaryKey.Add('FJ_ID', 	 sdqConsulta.FieldByName('FJ_ID').AsInteger);
    Sql.Fields.Add('FJ_FECHABAJA', exDateTime);
    Sql.Fields.Add('FJ_USUBAJA',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
	end
  else
  begin
  	if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddExpression('FJ_ID', 'LEGALES.SEQ_LFJ_ID.NEXTVAL');
      Sql.Fields.Add('FJ_FECHAALTA', 							 exDateTime);
      Sql.Fields.Add('FJ_USUALTA', 								 Sesion.LoginName);
      Sql.SqlType := stInsert;
      Sql.Fields.AddInteger('FJ_IDTIPOJUICIO',		 fraTipoJuicio.Codigo, True);
      Sql.Fields.AddInteger('FJ_IDRECLAMO', 			 fraReclamo.Codigo, True);
      Sql.Fields.AddInteger('FJ_IDFORMULARESERVA', IDFormula);
		end
    else
    begin { maModificacion }
    	Sql.PrimaryKey.Add('FJ_ID', 		sdqConsulta.FieldByName('FJ_ID').AsInteger);
      Sql.Fields.Add('FJ_FECHAMODIF', exDateTime);
      Sql.Fields.Add('FJ_USUMODIF',   Sesion.LoginName);
      Sql.SqlType := stUpdate;
    end;
	end;

  try
  	EjecutarSqlST(Sql.Sql);
  except
  	on E: Exception do
    begin
    	Result := False;
      Rollback;
      ErrorMsg(E);
      Exit;
    end;
  end;
	CommitTrans;
end;

procedure TfrmFormulasCalculoReservaJuicios.tbChequearConsultaClick(Sender: TObject);
begin
	ChequearConsulta;
end;

procedure TfrmFormulasCalculoReservaJuicios.ChequearConsulta;
var
	sdqSql: TSDQuery;
begin
	try
  	sdqSql := TSDQuery.Create(Self);
		try
    	case pcFormulas.ActivePageIndex of
      	PAG_RESERVACAPITAL:
        	sdqSql.SQL.Text := PrepararSentencia(trCapitalJuicio, mwReservaCapital.Lines, dmLegales.sdqCalculoReservaJuicio.Fields);
      	PAG_RESERVAHONORARIOS:
        	sdqSql.SQL.Text := PrepararSentencia(trHonorariosJuicio, mwReservaHonorarios.Lines, dmLegales.sdqCalculoReservaJuicio.Fields);
      end;

			if not IsEmptyString(sdqSql.SQL.Text) then
			begin
				SetDatabaseToQuery(sdqSql);
        try
          CheckAndOpenQuery(sdqSql, sdqSql.SQL.Text, False);
          if not VerificarFormula(sdqSql.SQL) then
            raise exception.Create('En la formula debe asignar el resultado a la variable <"Valor">');
          MsgBox('La comprobación de sintaxis fue satisfactoria.', MB_ICONINFORMATION);
        except
          on E: Exception do
          	MessageDlg('La fórmula contiene errores de sintaxis' + #13#10 + E.Message, mtError, [mbOK], 0);
        end;
			end;
		finally
			sdqSql.Free;
		end;
	except
		on E: Exception do
    	ErrorMsg(E, 'Error de Sintaxis.');
	end;
end;

procedure TfrmFormulasCalculoReservaJuicios.CargarCamposParametros;
var
  CargarIncapacidad: Boolean;
  i: Integer;
	MenuItem: TMenuItem;
begin
 	pmnuCampos.Items.Clear;
  for i := 0 to dmLegales.sdqCalculoReservaJuicio.FieldCount - 1 do
  begin
    if (pmnuCampos.FindComponent(dmLegales.sdqCalculoReservaJuicio.Fields[i].DisplayName) = nil) and
       (dmLegales.sdqCalculoReservaJuicio.Fields[i].Visible) Then
    begin
      //Si no reclama incapacidad no cargar los campos de incapacidad que son los
      //que tiene tag = 1

      if fraReclamo.IsSelected then
      begin
        if ((fraReclamo.sdqDatos.FieldByName('rc_reclamaincapacidad').AsString = 'N') and
           (dmLegales.sdqCalculoReservaJuicio.Fields[i].Tag = 0)) or
           (fraReclamo.sdqDatos.FieldByName('rc_reclamaincapacidad').AsString = 'S') then
        	CargarIncapacidad := True
        else
        	CargarIncapacidad := False;
      end
      else
       CargarIncapacidad := True;

      if CargarIncapacidad then
      begin
        MenuItem := TMenuItem.Create(pmnuCampos);
        MenuItem.Caption := dmLegales.sdqCalculoReservaJuicio.Fields[i].DisplayName;
        MenuItem.OnClick := pmnuCamposClick;
        pmnuCampos.Items.Add(MenuItem);
      end;
    end;
  end;

  MenuItem := TMenuItem.Create(pmnuCampos);
  MenuItem.Caption := 'Valor';
  MenuItem.OnClick := pmnuCamposClick;
  pmnuCampos.Items.Add(MenuItem);

	tbAgregarCampo.Enabled := pmnuCampos.Items.Count > 0;
end;

procedure TfrmFormulasCalculoReservaJuicios.pmnuCamposClick(Sender: TObject);
begin
	case pcFormulas.ActivePageIndex of
		PAG_RESERVACAPITAL:
			mwReservaCapital.SelText := '<"' + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]) + '">' ;
		PAG_RESERVAHONORARIOS:
			mwReservaHonorarios.SelText := '<"' + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]) + '">';
	end;
end;

procedure TfrmFormulasCalculoReservaJuicios.ReclamoChange(Sender: TObject);
begin
	CargarCamposParametros;
end;

procedure TfrmFormulasCalculoReservaJuicios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
