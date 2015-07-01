unit unfrmABMJuzgado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomGridABM, ComCtrls,
  StdCtrls, Mask, PatternEdit, FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, DB, SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin,
  Buttons, unArtFrame, ExComboBox, unFraCodigoDescripcion, unfraCodigoDescripcionExt, unfrmABMSecretaria,
  unArtDBAwareFrame;

type

  TfrmABMJuzgado = class(TfrmCustomGridABM)
    Label18: TLabel;
    edNroJuzgado: TPatternEdit;
    Label19: TLabel;
    edDescripcionJuzgado: TEdit;
    fraJurisdiccion: TfraCodigoDescripcionExt;
    Label1: TLabel;
    Label2: TLabel;
    fraFuero: TfraCodigoDescripcionExt;
    fraInstancia: TfraCodigoDescripcionExt;
    Label3: TLabel;
    Domicilio: TLabel;
    edDomicilio: TEdit;
    frafilterJurisdiccion: TfraCodigoDescripcionExt;
    fraFilterFuero: TfraCodigoDescripcionExt;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fraFilterFueroChange(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
  private
  public
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure FiltarDatos(aIdJurisdiccion: String = ''; aIdFuero: String = '');
    procedure frafilterJurisdiccionChange(Sender: TObject);
    procedure LoadControls; override;
  end;

var
  frmABMJuzgado: TfrmABMJuzgado;

implementation

uses
	unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, DBFuncs, unSesion, General, StrFuncs, unCustomConsulta;

{$R *.dfm}

procedure TfrmABMJuzgado.ClearControls;
begin
  inherited;
  LockControls([edDescripcionJuzgado,fraJurisdiccion,fraFuero,fraInstancia],False);
  edDescripcionJuzgado.Enabled := True;
  edNroJuzgado.Clear;
  edDescripcionJuzgado.Clear;
  fraJurisdiccion.Clear;
  fraFuero.Clear;
  fraInstancia.Clear;
  edDomicilio.Clear;
  fraFuero.ExtraCondition := ' AND fu_fechabaja IS NULL ';
  fraJurisdiccion.ExtraCondition := ' AND ju_fechabaja IS NULL ';

end;

function TfrmABMJuzgado.DoABM: Boolean;
begin
  try
    Result := True;

    BeginTrans(True);
    Sql.Clear;
    if ModoABM = maBaja then
    begin
      Sql.PrimaryKey.Add('JZ_ID', 	 sdqConsulta.FieldByName('JZ_ID').AsInteger);
      Sql.Fields.Add('JZ_USUBAJA', 	 Sesion.LoginName);
      Sql.Fields.Add('JZ_FECHABAJA', exDateTime);
      Sql.SqlType := stUpdate;
    end
    else
    begin
      Sql.Fields.Add('JZ_DESCRIPCION', 		edDescripcionJuzgado.Text);
      Sql.Fields.Add('JZ_IDJURISDICCION', fraJurisdiccion.Codigo);
      Sql.Fields.Add('JZ_IDFUERO', 				fraFuero.Codigo);
      Sql.Fields.Add('JZ_IDINSTANCIA', 		fraInstancia.Codigo);
      Sql.Fields.Add('JZ_DIRECCION', 			edDomicilio.Text);
      if ModoABM = maAlta then
      begin
        Sql.PrimaryKey.Add('JZ_ID', 	 GetSecNextVal('legales.seq_ljz_id'));
        Sql.Fields.Add('JZ_USUALTA', 	 Sesion.LoginName);
        Sql.Fields.Add('JZ_FECHAALTA', exDateTime);
      end
      else
      begin
        Sql.PrimaryKey.Add('JZ_ID', 		sdqConsulta.FieldByName('JZ_ID').AsInteger);
        Sql.Fields.Add('JZ_USUMODIF', 	Sesion.LoginName);
        Sql.Fields.Add('JZ_FECHAMODIF', exDateTime);
        Sql.Fields.Add('JZ_USUBAJA', exNull );
        Sql.Fields.Add('JZ_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST(GetSqlABM);
    CommitTrans(True);
	except
  	on E: Exception do
    begin
    	Result := False;
      Rollback(True);
      ErrorMsg(E, 'Error al guardar el juzgado.');
    end;
  end;
end;

procedure TfrmABMJuzgado.FormCreate(Sender: TObject);
begin
  inherited;

  FieldBaja := 'JZ_FECHABAJA';
  Sql.TableName := 'legales.ljz_juzgado';
  CheckPK := True;

  with fraJurisdiccion do
  begin
    TableName 	:= 'legales.lju_jurisdiccion';
    FieldID 		:= 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc 	:= 'ju_descripcion';
    FieldBaja 	:= 'ju_fechabaja';
    ShowBajas   := True;
  end;

  with fraFuero do
  begin
    TableName 	:= 'legales.lfu_fuero';
    FieldID 		:= 'fu_id';
    FieldCodigo := 'fu_id';
    FieldDesc 	:= 'fu_descripcion';
    FieldBaja 	:= 'fu_fechabaja';
    ShowBajas   := True;
  end;

  with fraInstancia do
  begin
    TableName 	:= 'legales.lin_instancia';
    FieldID 		:= 'in_id';
    FieldCodigo := 'in_id';
    FieldDesc 	:= 'in_descripcion';
    FieldBaja 	:= 'in_fechabaja';
    ShowBajas 	:= True;
  end;

  with frafilterJurisdiccion do
  begin
    TableName 	:= 'legales.lju_jurisdiccion';
    FieldID 		:= 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc 	:= 'ju_descripcion';
    FieldBaja 	:= 'ju_fechabaja';
    ShowBajas   := True;
    OnChange 		:= frafilterJurisdiccionChange;
  end;

  with fraFilterFuero do
  begin
    TableName 	:= 'legales.lfu_fuero';
    FieldID 		:= 'fu_id';
    FieldCodigo := 'fu_id';
    FieldDesc 	:= 'fu_descripcion';
    FieldBaja 	:= 'fu_fechabaja';
    ShowBajas   := True;
    OnChange 		:= fraFilterFueroChange;
  end;
end;

procedure TfrmABMJuzgado.LoadControls;
begin
  inherited;
  edNroJuzgado.Text 				:= sdqConsulta.fieldbyname('JZ_ID').AsString;
  edDescripcionJuzgado.Text := sdqConsulta.fieldbyname('JZ_DESCRIPCION').AsString;
  fraFuero.ExtraCondition := ' AND (fu_fechabaja IS NULL OR fu_id = '+SqlValue(sdqConsulta.fieldbyname('JZ_IDFUERO').AsString)+') ';
  fraJurisdiccion.ExtraCondition := ' AND (ju_fechabaja IS NULL OR ju_id = '+SqlValue(sdqConsulta.fieldbyname('JZ_IDJURISDICCION').AsString)+') ';
  fraJurisdiccion.Codigo 		:= sdqConsulta.fieldbyname('JZ_IDJURISDICCION').AsString;
  fraFuero.Codigo 					:= sdqConsulta.fieldbyname('JZ_IDFUERO').AsString;
  fraInstancia.Codigo 			:= sdqConsulta.fieldbyname('JZ_IDINSTANCIA').AsString;
  edDomicilio.Text 					:= sdqConsulta.fieldbyname('JZ_DIRECCION').AsString;
  LockControls([edDescripcionJuzgado,fraJurisdiccion,fraFuero,fraInstancia],True);
  edDescripcionJuzgado.Enabled := False;
end;

function TfrmABMJuzgado.Validar: Boolean;
begin
	Result := VerificarMultiple(['ABM de Juzgado',
                                edDescripcionJuzgado, not IsEmptyString(edDescripcionJuzgado.text), 'Debe especificar la descripción del juzgado.',
                                fraJurisdiccion, fraJurisdiccion.IsSelected ,'Debe especificar la jurisdicción.',
                                fraFuero, fraFuero.IsSelected ,'Debe especificar el fuero.',
                                fraInstancia, fraInstancia.IsSelected ,'Debe especificar la instancia.'
                              ]);
end;

procedure TfrmABMJuzgado.tbLimpiarClick(Sender: TObject);
begin
  frafilterJurisdiccion.Codigo := '';
  fraFilterFuero.Codigo := '';
  inherited;
end;

procedure TfrmABMJuzgado.FiltarDatos(aIdJurisdiccion, aIdFuero: String);
begin
  with sdqConsulta do
  begin
  	Close;
		SQL.Text :=
			'SELECT JZ_ID, JZ_DESCRIPCION, JZ_FECHABAJA, JZ_DIRECCION, FU_DESCRIPCION, ju_descripcion, IN_DESCRIPCION,' +
    				' JZ_IDFUERO, JZ_IDJURISDICCION, JZ_IDINSTANCIA, JZ_FECHABAJA' +
	     ' FROM legales.ljz_juzgado, legales.lfu_fuero, legales.lin_instancia, legales.lju_jurisdiccion' +
  	  ' WHERE JZ_IDFUERO = fu_id' +
    		' AND JZ_IDINSTANCIA = in_id' +
      	' AND ju_id = jz_idjurisdiccion';

  	if (aIdJurisdiccion <> '') then
    	SQL.Text := SQL.Text + ' AND JZ_IDJURISDICCION = ' + SqlValue(aIdJurisdiccion);

  	if (aIdFuero <> '') then
    	SQL.Text := SQL.Text + ' AND JZ_IDFUERO = ' + SqlValue(aIdFuero);
	end;
end;

procedure TfrmABMJuzgado.tbRefrescarClick(Sender: TObject);
begin
  FiltarDatos(frafilterJurisdiccion.Codigo, fraFilterFuero.Codigo);
  inherited;
end;

procedure TfrmABMJuzgado.fraFilterFueroChange(Sender: TObject);
begin
  FiltarDatos(frafilterJurisdiccion.Codigo, fraFilterFuero.Codigo);
  tbRefrescarClick(Sender);
end;

procedure TfrmABMJuzgado.frafilterJurisdiccionChange(Sender: TObject);
begin
	if frafilterJurisdiccion.IsSelected then
  begin
  	fraFuero.Codigo := '';
   	with fraFilterFuero do
   	begin
   		TableName   	 := 'legales.lfu_fuero';
      FieldID     	 := 'fu_id';
      FieldCodigo 	 := 'fu_id';
      FieldDesc   	 := 'fu_descripcion';
      ExtraCondition := ' and fu_id in (select jz_idfuero from LEGALES.LJZ_JUZGADO where jz_idjurisdiccion = ' + SqlValue(StrToInt(frafilterJurisdiccion.Codigo)) + ')';
      OnChange 			 := fraFilterFueroChange;
		end;
  end;

  FiltarDatos(frafilterJurisdiccion.Codigo, fraFilterFuero.Codigo);
  tbRefrescarClick(Sender);
end;

procedure TfrmABMJuzgado.tbPropiedadesClick(Sender: TObject);
begin
  inherited;

  if sdqConsulta.RecNo >= {$IFDEF VER150}0{$ELSE}1{$ENDIF} then
    with TfrmABMSecretaria.Create(self) do
    begin
      FormStyle := fsNormal;
      visible := False;
      IdJuzgado := Self.sdqConsulta.FieldByName('JZ_ID').AsInteger;
      ShowModal;
    end;
end;

end.
