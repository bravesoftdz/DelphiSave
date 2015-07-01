unit unFrmFormulasCalculoReservaSumarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, StdCtrls,
  ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame,
  unFraCodigoDescripcion, Mask, ToolEdit, DateComboBox, Menus, ImgList, mwCustomEdit, mwHighlighter, mwSqlSyn,
  unfraCodigoDescripcionExt, PatternEdit, unFraNormaLegal;

type
  TfrmFormulasCalculoReservaSumarios = class(TfrmCustomGridABM)
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
    lblFechaAsignacion: TLabel;
    lbConcurso: TLabel;
    lblDescripcion: TLabel;
    edFechaVigenciaDesde: TDateComboBox;
    edFechaVigenciaHasta: TDateComboBox;
    edDescripcion: TEdit;
    pcFormulas: TPageControl;
    tsCalculoReservaCapital: TTabSheet;
    mwReservaCapital: TmwCustomEdit;
    tsCalculoReservaHonorarios: TTabSheet;
    mwSqlSynSql2: TmwSqlSyn;
    mwReservaHonorarios: TmwCustomEdit;
    fraNormaLegalImputada: TfraNormaLegal;
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

procedure TfrmFormulasCalculoReservaSumarios.FormCreate(Sender: TObject);
begin
  inherited;

  fraNormaLegalImputada.Init;

  Sql.TableName := 'LEGALES.LFR_FORMULARESERVA';
  FieldBaja     := 'FR_FECHABAJA';

  CargarCamposParametros;
end;

procedure TfrmFormulasCalculoReservaSumarios.ClearControls;
begin
  edDescripcion.Text := '';
  edFechaVigenciaDesde.Date := 0;
  edFechaVigenciaHasta.Date := 0;
  mwReservaCapital.Lines.Text := ' ';
  mwReservaHonorarios.Lines.Text := ' ';
  pcFormulas.ActivePageIndex := PAG_RESERVACAPITAL;
  fraNormaLegalImputada.Limpiar;
end;

procedure TfrmFormulasCalculoReservaSumarios.LoadControls;
begin
	with sdqConsulta do
  begin
	  edDescripcion.Text 													:= FieldByName('fr_descripcion').AsString;
  	edFechaVigenciaDesde.Date 									:= FieldByName('fr_fechavigencia').AsDateTime;
	  edFechaVigenciaHasta.Date 									:= FieldByName('fr_fechavigenciahasta').AsDateTime;
  	mwReservaCapital.Text 											:= FieldByName('fr_formulareservacapital').AsString;
	  mwReservaHonorarios.Text 										:= FieldByName('fr_formulareservahonorario').AsString;
  	fraNormaLegalImputada.IdTipoNorma 					:= FieldByName('tn_id').AsInteger;
	  fraNormaLegalImputada.fraNombreNorma.Codigo := FieldByName('no_id').AsString;

	  fraNormaLegalImputada.Articulo 							:= FieldByName('FS_ARTICULO').AsInteger;
  	fraNormaLegalImputada.Inciso 								:= FieldByName('FS_inciso').AsString;
	  fraNormaLegalImputada.Apartado 							:= FieldByName('FS_Apartado').AsString;
  	fraNormaLegalImputada.Anexo 								:= FieldByName('FS_Anexo').AsString;
	end;
end;

function TfrmFormulasCalculoReservaSumarios.Validar: Boolean;
var
	sdqSql: TSDQuery;
  sqlReservaCapital: String;
  sqlReservaHonorarios: String;
begin
  Result := True;

  sdqSql := TSDQuery.Create(Self);
  SetDatabaseToQuery(sdqSql);

  try
    sqlReservaCapital := PrepararSentencia(trCapitalSumario, mwReservaCapital.Lines, dmLegales.sdqCalculoReservaSumario.Fields);
    sqlReservaHonorarios := PrepararSentencia(trHonorariosSumario, mwReservaHonorarios.Lines, dmLegales.sdqCalculoReservaSumario.Fields);

    VerificarMultiple(['Formulas para Cálculo de Reservas',
        edDescripcion, not IsEmptyString(edDescripcion.Text), 'Debe especificar una Descripción.',
//        fraReclamo.edCodigo, fraReclamo.IsSelected or fraTipoJuicio.IsSelected, 'Debe especificar un tipo de juicio o un reclamo.',
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

function TfrmFormulasCalculoReservaSumarios.DoABM: Boolean;
var
	IDFormula: Integer;
begin
	Result := True;

  Sql.Clear;
  Sql.TableName := 'LEGALES.LFR_FORMULARESERVA';

	if ModoABM = maBaja then
  begin
  	IDFormula :=  sdqConsulta.FieldByName('FR_ID').AsInteger;
    Sql.PrimaryKey.Add('FR_ID', sdqConsulta.FieldByName('FR_ID').AsInteger);
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
      Sql.PrimaryKey.Add('FR_ID',  								sdqConsulta.FieldByName('FR_ID').AsInteger);
      Sql.Fields.Add('FR_FECHAMODIF', 						exDateTime);
      Sql.Fields.Add('FR_USUMODIF',   						Sesion.LoginName);
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
  Sql.TableName := 'LEGALES.LFS_FORMULARESERVASUMARIO';

	if ModoABM = maBaja then
  begin
  	Sql.PrimaryKey.Add('FS_ID', 	 sdqConsulta.FieldByName('FS_ID').AsInteger);
    Sql.Fields.Add('FS_FECHABAJA', exDateTime);
    Sql.Fields.Add('FS_USUBAJA',   frmPrincipal.DBLogin.UserID);
    Sql.SqlType := stUpdate;
	end
  else
  begin
  	if ModoABM = maAlta then
    begin
      Sql.PrimaryKey.AddExpression('FS_ID', 			'LEGALES.SEQ_LFT_ID.NEXTVAL');
      Sql.Fields.Add('FS_FECHAALTA', 							 exDateTime);
      Sql.Fields.Add('FS_USUALTA', 								 Sesion.LoginName);
      Sql.SqlType := stInsert;
      Sql.Fields.AddInteger('FS_IDNORMA', 				 fraNormaLegalImputada.fraNombreNorma.Codigo);
      Sql.Fields.AddString('FS_ARTICULO', 				 fraNormaLegalImputada.Articulo);
      Sql.Fields.AddString('FS_INCISO', 					 fraNormaLegalImputada.Inciso);
      Sql.Fields.AddString('FS_ANEXO', 					 	 fraNormaLegalImputada.Anexo);
      Sql.Fields.AddString('FS_APARTADO', 				 fraNormaLegalImputada.Apartado);
      Sql.Fields.AddInteger('FS_IDFORMULARESERVA', IDFormula);
    end
    else
    begin { maModificacion }
    	Sql.PrimaryKey.Add('FS_ID', 		sdqConsulta.FieldByName('FS_ID').AsInteger);
      Sql.Fields.Add('FS_FECHAMODIF', exDateTime);
      Sql.Fields.Add('FS_USUMODIF',   Sesion.LoginName);
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

procedure TfrmFormulasCalculoReservaSumarios.tbChequearConsultaClick(Sender: TObject);
begin
	ChequearConsulta;
end;

procedure TfrmFormulasCalculoReservaSumarios.ChequearConsulta;
var
	sdqSql: TSDQuery;
begin
	try
  	sdqSql := TSDQuery.Create(Self);
		try
    	case pcFormulas.ActivePageIndex of
      	PAG_RESERVACAPITAL:
        	sdqSql.SQL.Text := PrepararSentencia(trCapitalSumario, mwReservaCapital.Lines, dmLegales.sdqCalculoReservaSumario.Fields);
      	PAG_RESERVAHONORARIOS:
        	sdqSql.SQL.Text := PrepararSentencia(trHonorariosSumario, mwReservaHonorarios.Lines, dmLegales.sdqCalculoReservaSumario.Fields);
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

procedure TfrmFormulasCalculoReservaSumarios.CargarCamposParametros;
var
  i: Integer;
	MenuItem: TMenuItem;
begin
 	pmnuCampos.Items.Clear;
  for i := 0 to dmLegales.sdqCalculoReservaSumario.FieldCount - 1 do
  begin
    if (pmnuCampos.FindComponent(dmLegales.sdqCalculoReservaSumario.Fields[i].DisplayName) = nil) and
       (dmLegales.sdqCalculoReservaSumario.Fields[i].Visible) then
    begin
      MenuItem := TMenuItem.Create(pmnuCampos);
      MenuItem.Caption := dmLegales.sdqCalculoReservaSumario.Fields[i].DisplayName;
      MenuItem.OnClick := pmnuCamposClick;
      pmnuCampos.Items.Add(MenuItem);
    end;
  end;

  MenuItem := TMenuItem.Create(pmnuCampos);
  MenuItem.Caption := 'Valor';
  MenuItem.OnClick := pmnuCamposClick;
  pmnuCampos.Items.Add(MenuItem);

	tbAgregarCampo.Enabled := pmnuCampos.Items.Count > 0;
end;

procedure TfrmFormulasCalculoReservaSumarios.pmnuCamposClick(Sender: TObject);
begin
	case pcFormulas.ActivePageIndex of
		PAG_RESERVACAPITAL:
			mwReservaCapital.SelText := '<"' + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]) + '">';
		PAG_RESERVAHONORARIOS:
			mwReservaHonorarios.SelText := '<"' + StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]) + '">';
 	end;
end;

procedure TfrmFormulasCalculoReservaSumarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
