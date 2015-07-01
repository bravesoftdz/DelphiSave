unit unConsultaOficios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, StdCtrls, unArtDBAwareFrame, unArtDbFrame, unFraEmpresa,
  Mask, CurrEdit, ToolEdit, DateComboBox, unArtFrame, unFraCodigoDescripcion, unfraAbogadosLegales, PatternEdit, IntEdit,
  unfraCodigoDescripcionExt, unfraUsuarios, CustomDlgs;

type
  TfrmConsultaOficios = class(TfrmCustomConsulta)
    pcFiltrosBusqueda: TPageControl;
    tsGeneral: TTabSheet;
    gbJuicio: TGroupBox;
    lbNroOficio: TLabel;
    lblCaratula: TLabel;
    lblContra: TLabel;
    edNroOficio: TIntEdit;
    edCARATULA: TEdit;      
    chkConJuicios: TCheckBox;
    edDemandante: TEdit;
    edDemandado: TEdit;
    tsOtrosDatos: TTabSheet;
    gbLetrados: TGroupBox;
    tsJuzgados: TTabSheet;
    gbJuzgado: TGroupBox;
    lbFuero: TLabel;
    lbJurisdiccion: TLabel;
    lbJuzgado: TLabel;
    lbSecretaria: TLabel;
    fraFuero: TfraCodigoDescripcion;
    fraJurisdiccion: TfraCodigoDescripcion;
    fraJuzgado: TfraCodigoDescripcion;
    fraSecretaria: TfraCodigoDescripcion;
    tsFechas: TTabSheet;
    gbFechas: TGroupBox;
    lblFechaInicioHasta: TLabel;
    lblFechaInicioDesde: TLabel;
    lblFechaCierreDesde: TLabel;
    LblFechaCierrehasta: TLabel;
    lblFechaAsignacionDesde: TLabel;
    lblFechaAsignacionHasta: TLabel;
    edFechaEntradahta: TDateComboBox;
    edFechaEntradadde: TDateComboBox;
    edFechaSalidahta: TDateComboBox;
    edFechaSalidadde: TDateComboBox;
    edFechaRecepciondde: TDateComboBox;
    edFechaRecepcionhta: TDateComboBox;
    chkSinFechaRecepcion: TCheckBox;
    chkFechadeSalida: TCheckBox;
    sdqModificacionRegistro: TSDQuery;
    fraUsuario: TfraUsuario;
    Label1: TLabel;
    FraJuicios: TfraCodigoDescripcionExt;
    Label7: TLabel;
    edOficiante: TEdit;
    fraEntidad: TfraCodigoDescripcionExt;
    Label2: TLabel;
    chkSinJuicios: TCheckBox;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure ChangeJurisdiccion(Sender: TObject);
    procedure ChangeFuero(Sender: TObject);
    procedure ChangeJuzgado(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure FraJuicioscmbDescripcionDropDown(Sender: TObject);
  private
    procedure CalcularFiltro(var from, where: String);
  public
  end;

var
  frmConsultaOficios: TfrmConsultaOficios;

implementation

uses
	AnsiSql, dbFuncs, unSesion, StrFuncs, unABMOficios;

{$R *.dfm}

procedure TfrmConsultaOficios.FormCreate(Sender: TObject);
begin
  inherited;
  with fraFuero do
  begin
    TableName   := 'legales.lfu_fuero';
    FieldID     := 'fu_id';
    FieldCodigo := 'fu_id';
    FieldDesc   := 'fu_descripcion';
    FieldBaja   := 'fu_fechabaja';
    Showbajas   := True;

    ExtraCondition := 'and 1=2';
    OnChange := ChangeFuero;
  end;

  with fraJurisdiccion do
  begin
    TableName   := 'legales.lju_jurisdiccion';
    FieldID     := 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc   := 'ju_descripcion';
    FieldBaja   := 'ju_fechabaja';
    Showbajas   := True;

    OnChange := ChangeJurisdiccion;
  end;

  with fraJuzgado do
  begin
    TableName   	 := 'legales.ljz_juzgado';
    FieldID     	 := 'jz_id';
    FieldCodigo 	 := 'jz_id';
    FieldDesc   	 := 'jz_descripcion';
    ExtraCondition := 'and 1=2';
    FieldBaja   	 := 'jz_fechabaja';
    Showbajas   	 := True;

    OnChange := ChangeJuzgado;
  end;

  with fraSecretaria do
  begin
    TableName   	 := 'legales.lsc_secretaria';
    FieldID     	 := 'sc_id';
    FieldCodigo 	 := 'sc_id';
    FieldDesc   	 := 'sc_descripcion';
    ExtraCondition := 'and 1=2';
    FieldBaja   	 := 'sc_fechabaja';
    Showbajas   	 := True;
  end;

  fraUsuario.ShowBajas := True;
  fraUsuario.Sector := 'LEGAL';

  with fraJuicios do
  begin
    TableName 	:= 'LEGALES.LJT_JUICIOENTRAMITE';
    FieldID     := 'jt_id';
    FieldCodigo := 'JT_NUMEROCARPETA';
    FieldDesc   := 'JT_DEMANDANTE';
    FieldBaja   := 'jt_fechabaja';
    ExtraFields := ' ,JT_DEMANDADO, JT_CARATULA ';
    Showbajas   := True;
  end;

  with fraEntidad do
  begin
    TableName 	:= 'legales.leo_entidadoficiante ';
    FieldID     := 'eo_id';
    FieldCodigo := 'eo_id';
    FieldDesc   := 'eo_descripcion';
    FieldBaja   := 'eo_fechabaja';
    Showbajas   := True;
  end;
end;

procedure TfrmConsultaOficios.ChangeJurisdiccion(Sender: TObject);
begin
	if fraJurisdiccion.IsSelected then
 		with fraFuero do
 		begin
    	fraFuero.Codigo := '';
      TableName   	 := 'legales.lfu_fuero';
      FieldID     	 := 'fu_id';
      FieldCodigo 	 := 'fu_id';
      FieldDesc   	 := 'fu_descripcion';
      ExtraCondition := ' and fu_id in (select jz_idfuero from LEGALES.LJZ_JUZGADO where jz_idjurisdiccion = ' + SqlValue(StrToInt(fraJurisdiccion.Codigo)) + ')';
      OnChange 			 := ChangeFuero;
		end;

	if fraJurisdiccion.IsSelected and fraFuero.IsSelected then
 		with fraJuzgado do
 		begin
    	fraJuzgado.Codigo := '';
    	TableName   	 		:= 'legales.ljz_juzgado';
    	FieldID     	 		:= 'jz_id';
    	FieldCodigo 	 		:= 'jz_id';
    	FieldDesc   	 		:= 'jz_descripcion';
    	ExtraCondition 		:= 'and jz_idjurisdiccion = ' + SqlValue(StrToInt(fraJurisdiccion.Codigo)) + ' and jz_idfuero = ' +  SqlValue(StrToInt(fraFuero.Codigo));
 		end;
end;

procedure TfrmConsultaOficios.ChangeFuero(Sender: TObject);
begin
	if fraJurisdiccion.IsSelected and fraFuero.IsSelected then
  	with fraJuzgado do
  	begin
    	TableName   	 := 'legales.ljz_juzgado';
    	FieldID     	 := 'jz_id';
    	FieldCodigo 	 := 'jz_id';
    	FieldDesc   	 := 'jz_descripcion';
    	ExtraCondition := 'and jz_idjurisdiccion = ' + SqlValue(StrToInt(fraJurisdiccion.Codigo)) + ' and jz_idfuero = ' +  SqlValue(StrToInt(fraFuero.Codigo));
		end;
end;

procedure TfrmConsultaOficios.ChangeJuzgado(Sender: TObject);
begin
	if fraJuzgado.IsSelected then
  	with fraSecretaria do
  	begin
    	TableName   	 := 'legales.lsc_secretaria';
    	FieldID     	 := 'sc_id';
    	FieldCodigo 	 := 'sc_id';
    	FieldDesc   	 := 'sc_descripcion';
    	ExtraCondition := 'and sc_idjuzgado = ' + SqlValue(strtoint(fraJuzgado.Codigo));
  	end;
end;

procedure TfrmConsultaOficios.tbRefrescarClick(Sender: TObject);
var
	sFrom: String;
	sWhere: String;
begin
	sWhere  := '';
  sFrom   := '';

  CalcularFiltro(sFrom, sWhere);

  sdqConsulta.SQL.Text :=
  	'SELECT lju_jurisdiccion.ju_descripcion, lfu_fuero.fu_descripcion, ljz_juzgado.jz_descripcion,' +
    			' lsc_secretaria.sc_descripcion, loj_oficiojudicial.OJ_NUMEROOFICIO, loj_oficiojudicial.oj_caratula,' +
          ' loj_oficiojudicial.OJ_DEMANDANTE, loj_oficiojudicial.OJ_DEMANDADO, loj_oficiojudicial.oj_idfuero,' +
          ' loj_oficiojudicial.oj_idjuzgado, loj_oficiojudicial.oj_idsecretaria, loj_oficiojudicial.oj_idjurisdiccion,' +
          ' loj_oficiojudicial.oj_id, loj_oficiojudicial.oj_usubaja, loj_oficiojudicial.oj_usumodif,' +
          ' loj_oficiojudicial.oj_fechamodif, loj_oficiojudicial.oj_usualta, loj_oficiojudicial.OJ_FECHALALTA,' +
          ' loj_oficiojudicial.oj_requerimiento, loj_oficiojudicial.OJ_RESPUESTA, loj_oficiojudicial.OJ_FECHASALIDA,' +
          ' loj_oficiojudicial.OJ_FECHAENTRADA, loj_oficiojudicial.OJ_FECHASALIDA,' +
          ' loj_oficiojudicial.OJ_FECHARECEPCION, loj_oficiojudicial.OJ_AGREGADOCUMENTACION,' +
          ' art.USE_USUARIOS.SE_USUARIO, art.USE_USUARIOS.se_nombre' +
     ' FROM legales.loj_oficiojudicial, legales.lju_jurisdiccion, legales.lfu_fuero, legales.ljz_juzgado,' +
     			' legales.lsc_secretaria, art.USE_USUARIOS ' +
            sFrom  +
    ' WHERE ((loj_oficiojudicial.oj_idjurisdiccion = lju_jurisdiccion.ju_id(+))' +
    	' AND (loj_oficiojudicial.oj_idfuero = lfu_fuero.fu_id(+))' +
      ' AND (loj_oficiojudicial.oj_idjuzgado = ljz_juzgado.jz_id(+))' +
      ' AND (loj_oficiojudicial.oj_idsecretaria = lsc_secretaria.sc_id(+))' +
      ' AND (loj_oficiojudicial.oj_usuarioasignado = art.USE_USUARIOS.SE_USUARIO(+))) ' +
      			sWhere;
	sdqConsulta.SQL.Add(SortDialog.OrderBy);

  inherited;
(*
     if Assigned(Sender) and (sdqConsulta.RecordCount = 1) then
       DoCargaAdministracionJuicio( nil );
*)
end;

procedure TfrmConsultaOficios.CalcularFiltro(var from, where: String);
begin
////*********************** GENERAL ********************** //////
	if not IsEmptyString(edNroOficio.Text) then
  begin
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_NUMEROOFICIO = ' +  edNroOficio.Text + #13#10;
    Exit;
  end;

  if not FraJuicios.IsSelected then
  begin
    if chkConJuicios.checked and not chkSinJuicios.checked then
    	Where := Where + ' AND (LOJ_OFICIOJUDICIAL.OJ_IDJUICIOENTRAMITE IS NOT NULL)';

    if chkSinJuicios.checked and not chkConJuicios.checked then
      Where := Where + ' AND (LOJ_OFICIOJUDICIAL.OJ_IDJUICIOENTRAMITE IS NULL)';
  end;

  if not IsEmptyString(edDemandante.Text) then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_demandante LIKE ''%' + edDemandante.Text + '%''';

  if not IsEmptyString(edDemandado.Text) then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_DEMANDADO LIKE ''%' + edDemandado.Text + '%''';

  if not IsEmptyString(edCARATULA.Text) then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_CARATULA LIKE ''%' + edCARATULA.Text + '%''';

  if fraUsuario.IsSelected then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_USUARIOASIGNADO = ''' + fraUsuario.edCodigo.Text + '''';

  if fraJurisdiccion.IsSelected then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_IDJURISDICCION = ' + fraJurisdiccion.Codigo;

  if fraFuero.IsSelected then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_IDFUERO = ' + fraFuero.Codigo;

  if fraJuzgado.IsSelected then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_IDJUZGADO = ' + fraJuzgado.Codigo;

  if fraSecretaria.IsSelected then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_IDSECRETARIA = ' + fraSecretaria.Codigo;


  if not edFechaEntradadde.IsEmpty then
  begin
    if not edFechaEntradahta.IsEmpty then
    	Where := Where + ' AND ' + SqlBetween('LOJ_OFICIOJUDICIAL.OJ_FECHAENTRADA', edFechaEntradadde.Date, edFechaEntradahta.Date)
    else
    	Where := Where + ' AND ' + SqlBetween('LOJ_OFICIOJUDICIAL.OJ_FECHAENTRADA', edFechaEntradadde.Date, 0);
  end
  else
    if not edFechaEntradahta.IsEmpty then
    	Where := Where + ' AND ' + SqlBetween('LOJ_OFICIOJUDICIAL.OJ_FECHAENTRADA', 0, edFechaEntradahta.Date);

  if chkFechadeSalida.Checked then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_FECHASALIDA IS NULL ' + #13#10
  else
  	if not edFechaSalidadde.IsEmpty  then
    begin
      if not edFechaSalidahta.IsEmpty then
      	Where := Where + ' AND ' + SqlBetween('LOJ_OFICIOJUDICIAL.OJ_FECHASALIDA ', edFechaSalidadde.Date, edFechaSalidahta.Date)
      else
      	Where := Where + ' AND ' + SqlBetween('LOJ_OFICIOJUDICIAL.OJ_FECHASALIDA ', edFechaSalidadde.Date, 0);
  	end
    else
    	if not edFechaSalidahta.IsEmpty then
    		Where := Where + ' AND ' + SqlBetween('LOJ_OFICIOJUDICIAL.OJ_FECHASALIDA ', 0, edFechaSalidahta.Date);

  if chkSinFechaRecepcion.Checked then
  	Where := Where + ' AND LJT_JUICIOENTRAMITE.JT_FECHAASIGNACION IS NULL ' + #13#10
  else
  	if not edFechaRecepciondde.IsEmpty then
    begin
    	if not edFechaRecepcionhta.IsEmpty then
      	Where := Where + SqlBetween(' AND LJT_JUICIOENTRAMITE.JT_FECHAASIGNACION ', edFechaRecepciondde.Date, edFechaRecepcionhta.Date)
      else
      	Where := Where + SqlBetween(' AND LJT_JUICIOENTRAMITE.JT_FECHAASIGNACION ', edFechaRecepciondde.Date, 0);
  	end
    else
    	if not edFechaRecepcionhta.IsEmpty then
      	Where := Where + SqlBetween(' AND LJT_JUICIOENTRAMITE.JT_FECHAASIGNACION ', 0, edFechaRecepcionhta.Date);

  if FraJuicios.IsSelected then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_IDJUICIOENTRAMITE = ' + FraJuicios.Codigo;

  if fraEntidad.IsSelected then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_IDENTIDADOFICIANTE = ' + fraEntidad.Codigo;

  if edOficiante.Text <> '' then
    Where := Where + ' AND LOJ_OFICIOJUDICIAL.OJ_OFICIANTE like ''%' + Trim(edOficiante.Text) + '%''';
end;

procedure TfrmConsultaOficios.tbNuevoClick(Sender: TObject);
begin
  with TfrmABMOficios.Create(Self) do
  try
  	if AltaOficio and sdqConsulta.Active then
    	sdqConsulta.Refresh;
  finally
    Free;
  end;
end;

procedure TfrmConsultaOficios.tbModificarClick(Sender: TObject);
begin
  if not sdqConsulta.IsEmpty then
  	with TfrmABMOficios.Create(Self) do
    try
    	sdqModificacionRegistro.ParamByName('oj_id').AsInteger := sdqConsulta.FieldByName('oj_id').AsInteger;
      try
        sdqModificacionRegistro.Open;
        ModificacionOficio(sdqModificacionRegistro);
      except
        on E : Exception do
        	MessageDlg('Error al cargar el Oficio.' +  #13#10 + E.Message, mtError, [mbOK], 0);
      end;
    finally
      sdqModificacionRegistro.Close;
      sdqConsulta.Refresh;
      Free;
    end;
end;                                                                             

procedure TfrmConsultaOficios.FraJuicioscmbDescripcionDropDown(Sender: TObject);
begin
  with FraJuicios do
  	if (Length(Trim(cmbDescripcion.Text)) < MINLENGTH) then
    begin
      Clear;
      InvalidHint(cmbDescripcion, 'El mínimo a ingresar es ' + IntToStr(MINLENGTH) + ' caracteres.' , 'Advertencia', blnWarning);
    end
    else
    begin
      ExtraJoinCondition := ' (JT_CARATULA LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE +
              						' OR JT_DEMANDANTE LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE + ' ' +
              						' OR JT_DEMANDADO LIKE ' + SQL_QUOTE + SQL_WILLCARD + cmbDescripcion.Text + SQL_WILLCARD + SQL_QUOTE + ') ';

      cmbDescripcionDropDown(Sender);
    end;
end;

end.
