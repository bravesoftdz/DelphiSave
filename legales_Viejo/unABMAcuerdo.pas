unit unABMAcuerdo;

{----------------------------------------------------------------------------------------------------------------------
   Modulo de ABL de Acuerdo de Concursos y Quiebras.
   Autor: EVila.
   Date: 25/04/2002
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, unFraCtbTablas, unFraEmpresa, unArtFrame,
  unFraCodigoDescripcion, StdCtrls, IntEdit, RxLookup, CurrEdit, Mask, ToolEdit, DateComboBox, FormPanel, unArtDbFrame,
  PatternEdit, unArtDBAwareFrame, unfraAbogadosLegales;

type
  TfrmABMAcuerdo = class(TfrmCustomConsulta)
    lbNroJuicio: TLabel;
    edCQ_NROORDEN: TIntEdit;
    lbAbogado: TLabel;
    fraAbogados: TfraAbogadosLegales;
    fraEmpresa: TfraEmpresa;
    lbFuero: TLabel;
    fraFuero: TfraCtbTablas;
    lbJuzgado: TLabel;
    edCQ_JUZGADO: TIntEdit;
    lbSecretaria: TLabel;
    edCQ_SECRETARIA: TIntEdit;
    lbJurisdiccion: TLabel;
    sdqCargaDatos: TSDQuery;
    lbParteDemandada: TLabel;
    edCQ_SINDICO: TEdit;
    lbDireccionSindico: TLabel;
    edCQ_DIRECCIONSIND: TEdit;
    lbLocalidad: TLabel;
    edCQ_LOCALIDADSIND: TEdit;
    lbTelefonos: TLabel;
    edCQ_TELEFONOSIND: TEdit;
    frmPanelABMAcuerdo: TFormPanel;
    lbTipo: TLabel;
    lbMonto: TLabel;
    lbFechaPago: TLabel;
    lbObservaciones: TLabel;
    btnAceptar: TButton;
    btnCancelar: TButton;
    edCA_FECHAPAGO: TDateComboBox;
    edCA_OBSERVACIONES: TMemo;
    edCA_MONTO: TCurrencyEdit;
    lbFechaVenc: TLabel;
    edCA_FECHAVENC: TDateComboBox;
    frmCargaAutomaticaCuotas: TFormPanel;
    Label2: TLabel;
    fechaCuota: TLabel;
    btlAceptarCuotas: TButton;
    Button2: TButton;
    edFecha1raCuota: TDateComboBox;
    edMontoCuota: TCurrencyEdit;
    lbCantidadCuotas: TLabel;
    lbPediodicidadCuotas: TLabel;
    edCantidadCuotas: TIntEdit;
    edPeriodicidadCuotas: TIntEdit;
    Label1: TLabel;
    lbFExtincion: TLabel;
    edCA_FECHAEXTINCION: TDateComboBox;
    fraTipo: TfraCodigoDescripcion;
    Panel1: TPanel;
    Label3: TLabel;
    fraTipoFiltro: TfraCodigoDescripcion;
    fraTipoCuotas: TfraCodigoDescripcion;
    Label4: TLabel;
    fraJurisdiccion: TfraCodigoDescripcion;
    procedure tbNuevoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure tbMostrarFiltrosClick(Sender: TObject);
    procedure btlAceptarCuotasClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
  private
  public
    FModified: Boolean;
    FConcurso: Boolean;
    iNROORDEN : Integer;
    procedure SetConcurso(const Value: Boolean);
    function GetExecute(iNROORDENParam: Integer): Boolean;
  published
  //Concurso indica si es concurso o quiebra el que tiene la fecha mayor para luego
  //indicar los tipo que se pueden seleccionar (true concurso, false quiebra)
    property Concurso             : Boolean   read FConcurso   write SetConcurso;
  end;

var
  frmABMAcuerdo: TfrmABMAcuerdo;

const
	TitACUERDO_Alta           = 'Alta de Acuerdo';
  TitACUERDO_Bajas          = 'Baja de Acuerdo' ;
  TitACUERDO_Modificacion   = 'Modificacion de Acuerdo';

implementation

uses
	unPrincipal, CustomDlgs, General, AnsiSql, SqlFuncs, unDmPrincipal;

{$R *.DFM}

{ TfrmABMEventos }

procedure TfrmABMAcuerdo.FormCreate(Sender: TObject);
begin
  inherited;

  FModified := False;
  fraFuero.Clave        := 'FUERO';
  with fraJurisdiccion do
  begin
    TableName   := 'legales.lju_jurisdiccion';
    FieldID     := 'ju_id';
    FieldCodigo := 'ju_id';
    FieldDesc   := 'ju_descripcion';
    FieldBaja   := 'ju_fechabaja';
    ShowBajas := false;
  end;
  with fraTipoFiltro do
  begin
    TableName   := 'ctb_tablas';
    FieldID     := 'TB_CODIGO';
    FieldCodigo := 'TB_CODIGO';
    FieldDesc   := 'TB_DESCRIPCION';
    FieldBaja   := 'TB_FECHABAJA';
    Showbajas   := true;
    ExtraCondition := ' AND TB_CLAVE = ''TACYQ'' AND (TB_ESPECIAL1 = ''Q'' OR TB_ESPECIAL1 = ''C'') ';
    IdType      := ctString;
    CodigoType  := ctString;
  end;
  

end;

// Function que se usa para cargar los datos del EVENTO cuando es llamado desde otro form.
function TfrmABMAcuerdo.GetExecute(iNROORDENParam: Integer): Boolean;
var
	sSql: String;
begin
	fraEmpresa.ShowBajas := True;
  fraEmpresa.UltContrato := True;
  iNROORDEN := iNROORDENParam;
  FModified := False;
  sdqCargaDatos.Close;

  sSql :=
  	'SELECT LCQ.CQ_NROORDEN, LCQ.CQ_CUIT, LCQ.CQ_SINDICO, LCQ.CQ_DIRECCIONSIND, LCQ.CQ_LOCALIDADSIND,' +
    			' LCQ.CQ_TELEFONOSIND, LCQ.CQ_JUZGADO, LCQ.CQ_SECRETARIA, LCQ.CQ_FUERO, LCQ.CQ_JURISDICCION, LCQ.CQ_ABOGADO' +
     ' FROM LCE_EVENTOCYQ LCE, LCQ_CONCYQUIEBRA LCQ' +
    ' WHERE LCQ.CQ_NROORDEN = LCE.CE_NROEVENTO(+)' +
    	' AND LCQ.CQ_NROORDEN = '+ IntToStr(iNROORDENParam);
	OpenQuery(sdqCargaDatos, sSql);

  fraAbogados.Codigo      := sdqCargaDatos.FieldByName('CQ_ABOGADO').AsString;
  fraEmpresa.CUIT 			  := sdqCargaDatos.FieldByName('CQ_CUIT').AsString;
  edCQ_DIRECCIONSIND.Text := sdqCargaDatos.FieldByName('CQ_DIRECCIONSIND').AsString;

  fraFuero.Codigo 				:= sdqCargaDatos.FieldByName('CQ_FUERO').AsString;
  fraJurisdiccion.Codigo 	:= sdqCargaDatos.FieldByName('CQ_JURISDICCION').AsString;

  edCQ_JUZGADO.Text       := sdqCargaDatos.FieldByName('CQ_JUZGADO').AsString;
  edCQ_LOCALIDADSIND.Text := sdqCargaDatos.FieldByName('CQ_LOCALIDADSIND').AsString;
  edCQ_NROORDEN.Text      := sdqCargaDatos.FieldByName('CQ_NROORDEN').AsString;
  edCQ_SECRETARIA.Text    := sdqCargaDatos.FieldByName('CQ_SECRETARIA').AsString;
  edCQ_SINDICO.Text       := sdqCargaDatos.FieldByName('CQ_SINDICO').AsString;
  edCQ_TELEFONOSIND.Text  := sdqCargaDatos.FieldByName('CQ_TELEFONOSIND').AsString;

  sdqCargaDatos.Close;

  // Carga la grilla.
  sdqConsulta.ParamByName('CA_NROORDENParam').AsInteger := iNROORDENParam;
  sdqConsulta.Open;

  // Muestra la ventana y devuelve Ok si todo esta bien.
  tbRefrescarClick(nil);
  Result := ShowModal = mrOk;
end;

// Alta de un nuevo EVENTO.
procedure TfrmABMAcuerdo.tbNuevoClick(Sender: TObject);
begin
  try
    edCA_FECHAPAGO.Clear;
    edCA_FECHAVENC.Clear;
    edCA_MONTO.Clear;
    edCA_OBSERVACIONES.Clear;
    edCA_FECHAEXTINCION.Clear;
    fraTipo.Clear;

    frmPanelABMAcuerdo.Caption := TitACUERDO_Alta;
    if frmPanelABMAcuerdo.ShowModal = mrOk then
    	tbRefrescarClick(nil);
  except
  	on E: Exception do
    	ErrorMsg(E);
  end;
end;

// Modificacion de un EVENTO Existente.
procedure TfrmABMAcuerdo.tbModificarClick(Sender: TObject);
begin
	if not sdqConsulta.IsEmpty then
  try
    //edCA_NROPAGO.Text     	:= sdqConsulta.FieldByName('CA_NROPAGO').AsString;
    edCA_MONTO.Value      	 := sdqConsulta.FieldByName('CA_MONTO').AsCurrency;
    edCA_FECHAPAGO.Date   	 := sdqConsulta.FieldByName('CA_FECHAPAGO').AsDateTime;
    edCA_FECHAVENC.Date   	 := sdqConsulta.FieldByName('CA_FECHAVENC').AsDateTime;
    edCA_OBSERVACIONES.Text  := sdqConsulta.FieldByName('CA_OBSERVACIONES').AsString;
    edCA_FECHAEXTINCION.Date := sdqConsulta.FieldByName('CA_FECHAEXTINCION').AsDateTime;
    fraTipo.Codigo           := sdqConsulta.FieldByName('CA_TIPO').AsString;

    frmPanelABMAcuerdo.Caption := TitACUERDO_Modificacion;
    if frmPanelABMAcuerdo.ShowModal = mrOk then
    	tbRefrescarClick(nil);
	except
  	on E: Exception do
    	ErrorMsg(E);
  end;
end;

// Boton de Aceptar del FromPanel de Alta, Modificacion o Baja.
procedure TfrmABMAcuerdo.btnAceptarClick(Sender: TObject);
var
  iNroCuota: Integer;
  iNroPago: Integer;
  fechaVtoValida : string;
  qry : TSDQuery;
	SqlTrans: TSql;
begin
	if (frmPanelABMAcuerdo.Caption = TitACUERDO_Alta) or (frmPanelABMAcuerdo.Caption = TitACUERDO_Modificacion) then
  begin
		// control.
    if edCA_MONTO.Text = '' then
    begin
    	InvalidMsg(edCA_MONTO, 'El monto no puede quedar en blanco.');
      Abort;
    end;
    if edCA_FECHAVENC.IsEmpty then
    begin
    	InvalidMsg(edCA_FECHAVENC, 'La fecha de vencimiento no puede quedar en blanco.');
      Abort;
    end;
    if frmPanelABMAcuerdo.Caption = TitACUERDO_Alta then
    begin
      qry := GetQuery ('SELECT 1 FROM lca_acuerdocyq WHERE ca_nroorden = '+SqlValue(edCQ_NROORDEN.Text)+ ' AND ca_fechavenc = '+ SqlDate(edCA_FECHAVENC.Date)+' AND ca_nropago > 0');
      fechaVtoValida := qry.Fields[0].AsString;
    end
    else if frmPanelABMAcuerdo.Caption = TitACUERDO_Modificacion then
    begin
      qry := GetQuery ('SELECT 1 FROM lca_acuerdocyq WHERE ca_nroorden = '+SqlValue(edCQ_NROORDEN.Text)+ ' AND ca_fechavenc = '+ SqlDate(edCA_FECHAVENC.Date)+' AND ca_nropago > 0 AND ca_nropago <>'+ SqlInt(sdqConsulta.FieldbyName('CA_NROPAGO').AsInteger));
      fechaVtoValida := qry.Fields[0].AsString;
    end;
    if fechaVtoValida <>'' then
      begin
    	  InvalidMsg(edCA_FECHAVENC, 'La fecha de vencimiento no puede ser igual a una existente.');
        Abort;
      end;
		// Fin Control...

		SqlTrans := TSQL.Create('LCA_ACUERDOCYQ');
    if frmPanelABMAcuerdo.Caption = TitACUERDO_Alta then
    begin
    	iNroPago := ValorSql('SELECT IIF_Compara( ''<='', NVL(Max(CA_NROPAGO), 0), 0, 1, NVL(Max(CA_NROPAGO), 0) + 1) FROM LCA_ACUERDOCYQ WHERE CA_NROORDEN = ' + edCQ_NROORDEN.Text);
      SqlTrans.Fields.Add('CA_NROORDEN', 	edCQ_NROORDEN.Text, False);
      SqlTrans.Fields.Add('CA_NROPAGO',  	IntToStr(iNroPago), False);
      SqlTrans.Fields.Add('CA_USUALTA',  	frmPrincipal.DBLogin.UserId);
      SqlTrans.Fields.Add('CA_FECHAALTA', 'Actualdate', False);
      SqlTrans.SqlType := stInsert;
    end
    else if frmPanelABMAcuerdo.Caption = TitACUERDO_Modificacion then
    begin
    	SqlTrans.PrimaryKey.Add('CA_NROORDEN', edCQ_NROORDEN.Text, False);
      SqlTrans.PrimaryKey.Add('CA_NROPAGO',  sdqConsulta.FieldbyName('CA_NROPAGO').AsInteger);
      SqlTrans.Fields.Add('CA_USUMODIF', 		 frmPrincipal.DBLogin.UserId);
      SqlTrans.Fields.Add('CA_FECHAMODIF', 	 'Actualdate', False);
      SqlTrans.SqlType := stUpdate;
    end;

    SqlTrans.Fields.Add('CA_FECHAPAGO', 		 edCA_FECHAPAGO.Date);
    SqlTrans.Fields.Add('CA_FECHAVENC', 		 edCA_FECHAVENC.Date);
    SqlTrans.Fields.Add('CA_MONTO', 				 edCA_MONTO.Value);
    SqlTrans.Fields.Add('CA_OBSERVACIONES',  edCA_OBSERVACIONES.Text);
    SqlTrans.Fields.Add('CA_TIPO',           fraTipo.Codigo);
    SqlTrans.Fields.Add('CA_FECHAEXTINCION', edCA_FECHAEXTINCION.Date);

    try
    	EjecutarSQL(SqlTrans.Sql);
      FModified := True;
      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
      frmPanelABMAcuerdo.ModalResult := mrOk;
    finally
    	SqlTrans.Free;
    end;
  end
  else if frmPanelABMAcuerdo.Caption = TitACUERDO_Bajas then
  begin
  	if MsgBox('¿ Está usted seguro que desea dar de baja esta Cuota ?', MB_ICONINFORMATION + MB_YESNO, 'Atención') = ID_YES then
    begin
      SqlTrans := TSql.Create('LCA_ACUERDOCYQ');
      iNroCuota := ValorSql('SELECT IIF_Compara( ''>'', NVL(Min(CA_NROPAGO), 0), 0, -1, NVL(Min(CA_NROPAGO), 0) - 1) FROM LCA_ACUERDOCYQ WHERE CA_NROORDEN = ' + IntToStr(edCQ_NROORDEN.Value));
      SqlTrans.PrimaryKey.Add('CA_NROORDEN', edCQ_NROORDEN.Text, False);
      SqlTrans.PrimaryKey.Add('CA_NROPAGO', sdqConsulta.FieldbyName('CA_NROPAGO').AsInteger);
      SqlTrans.Fields.Add('CA_NROPAGO', IntToStr(iNroCuota), False);
      SqlTrans.Fields.Add('CA_USUMODIF', frmPrincipal.DBLogin.UserId);
      SqlTrans.Fields.Add('CA_FECHAMODIF', 'Actualdate', False);
      try
      	EjecutarSql(SqlTrans.UpdateSql);
        MsgBox('La baja se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        FModified := True;
        frmPanelABMAcuerdo.ModalResult := mrOk;
      finally
      	SqlTrans.Free;
      end;
    end;
  end;
end;

procedure TfrmABMAcuerdo.tbImprimirClick(Sender: TObject);
begin
	QueryPrint.SubTitle.Lines.Clear;
  QueryPrint.SubTitle.Lines.Add('Nro. Orden: ' + edCQ_NROORDEN.Text);
  QueryPrint.SubTitle.Lines.Add('Abogado: '+ fraAbogados.cmbDescripcion.Text + '    ' + 'CUIT: ' + fraempresa.mskCUIT.Text + '    ' + 'Contrato: ' + fraempresa.edContrato.Text);

  inherited;
end;

{----------------------------------------------------------------------------------------------------------------------
  Carga automatica de cuotas. (esta en este boton para que aparesca antes que el boton salir)
}

procedure TfrmABMAcuerdo.tbMostrarFiltrosClick(Sender: TObject);
begin
	frmCargaAutomaticaCuotas.Caption := 'Carga automática de cuotas';
  if frmCargaAutomaticaCuotas.ShowModal = mrOk then
  	tbRefrescarClick(nil);
end;

procedure TfrmABMAcuerdo.btlAceptarCuotasClick(Sender: TObject);
var
	sSql: String;
  fechaVtoValida : string;
  qry : TSDQuery;
begin
	if edFecha1raCuota.IsEmpty then
  begin
  	InvalidMsg(edFecha1raCuota, 'La fecha de la 1er. cuota no puede quedar en blanco.');
    Abort;
  end;
  if (edCantidadCuotas.IsEmpty) or (StrToInt(edCantidadCuotas.Text) <= 0) then
  begin
  	InvalidMsg(edCantidadCuotas, 'La cantidad de cuotas debe ser mayor a cero.');
    Abort;
  end;
  if (edPeriodicidadCuotas.IsEmpty) or (StrToInt(edPeriodicidadCuotas.Text) <= 0) then
  begin
  	InvalidMsg(edPeriodicidadCuotas, 'La periodicidad de cuotas debe ser mayor a cero.');
    Abort;
  end;

  qry := GetQuery (' SELECT art.legales.do_validar_cuotas('+
                            SqlDate(edFecha1raCuota.Date)+', '+
                            SqlValue(edCantidadCuotas.Text)+', '+
                            SqlValue(edPeriodicidadCuotas.Text)+', '+
                            SqlValue(edCQ_NROORDEN.Text)+')'+
                   '   FROM dual ');
  fechaVtoValida := qry.Fields[0].AsString;
  if fechaVtoValida ='1' then
    begin
    InvalidMsg(edFecha1raCuota, 'La fecha de vencimiento de alguna cuota coincide con una existente.');
    Abort;
    end;
  if (edMontoCuota.Text = '') or (StrToFloat(edMontoCuota.Text) <= 0) then
  begin
  	InvalidMsg(edMontoCuota, 'El monto debe ser mayor a cero.');
    Abort;
  end;

  sSql := 'Begin ART.LEGALES.Do_PlanCyQ ( ' + SqlValue(edFecha1raCuota.Date) + ', ' + edCantidadCuotas.Text + ', ' +
  				edPeriodicidadCuotas.Text + ', ' + SQLValue(edMontoCuota.Value) + ', ' + edCQ_NROORDEN.Text + ', ''' +
          frmPrincipal.DBLogin.UserId + ''','''+fraTipoCuotas.Codigo +'''); End;';
  EjecutarSQL(sSql);
  FModified := True;
  frmCargaAutomaticaCuotas.ModalResult := mrOk;
end;

procedure TfrmABMAcuerdo.tbEliminarClick(Sender: TObject);
begin
	if not sdqConsulta.IsEmpty then
  begin
  	if sdqConsulta.FieldByName('CA_FECHAPAGO').AsString <> '' then
    begin
    	MsgBox('No se puede dar de baja esta cuota por estar paga.', MB_ICONEXCLAMATION, 'Atención');
      Abort;
    end;

    try
      //edCA_NROPAGO.Text     	:= sdqConsulta.FieldByName('CA_NROPAGO').AsString;
      edCA_MONTO.Value      	:= sdqConsulta.FieldByName('CA_MONTO').AsCurrency;
      edCA_FECHAPAGO.Date   	:= sdqConsulta.FieldByName('CA_FECHAPAGO').AsDateTime;
      edCA_FECHAVENC.Date   	:= sdqConsulta.FieldByName('CA_FECHAVENC').AsDateTime;
      edCA_OBSERVACIONES.Text := sdqConsulta.FieldByName('CA_OBSERVACIONES').AsString;

      frmPanelABMAcuerdo.Caption := TitACUERDO_Bajas;
      if frmPanelABMAcuerdo.ShowModal = mrOk then
      	tbRefrescarClick(nil);
    except
    	on E: Exception do
      	ErrorMsg(E);
    end;
	end;
end;

procedure TfrmABMAcuerdo.SetConcurso(const Value: Boolean);
var
  sSQL :string;
begin
  if (FConcurso <> Value) then
    FConcurso := Value;
  if FConcurso then
    sSQL := ' AND TB_CLAVE = ''TACYQ'' AND TB_ESPECIAL1 = ''C'' '
  else
    sSQL := ' AND TB_CLAVE = ''TACYQ'' AND TB_ESPECIAL1 = ''Q'' ';
  with fraTipo do
  begin
    TableName   := 'ctb_tablas';
    FieldID     := 'TB_CODIGO';
    FieldCodigo := 'TB_CODIGO';
    FieldDesc   := 'TB_DESCRIPCION';
    FieldBaja   := 'TB_FECHABAJA';
    Showbajas   := true;
    ExtraCondition := sSQL;
    IdType      := ctString;
    CodigoType  := ctString;
  end;
  with fraTipoCuotas do
  begin
    TableName   := 'ctb_tablas';
    FieldID     := 'TB_CODIGO';
    FieldCodigo := 'TB_CODIGO';
    FieldDesc   := 'TB_DESCRIPCION';
    FieldBaja   := 'TB_FECHABAJA';
    Showbajas   := true;
    ExtraCondition := sSQL;
    IdType      := ctString;
    CodigoType  := ctString;
  end;

end;

procedure TfrmABMAcuerdo.tbRefrescarClick(Sender: TObject);
var
  sSQL :string;
begin
  sdqConsulta.SQL.Clear;
  sSQL :=
  ' SELECT CA_NROORDEN, CA_NROPAGO, CA_MONTO, CA_FECHAVENC, CA_FECHAPAGO, '+
  '        CA_OBSERVACIONES, CA_USUALTA, CA_FECHAALTA, CA_USUMODIF, '+
  '        CA_FECHAMODIF, CA_FECHAEXTINCION, CA_TIPO, tb_descripcion '+
  '   FROM LCA_ACUERDOCYQ LEFT JOIN (SELECT tb_codigo, tb_descripcion '+
  '                                 FROM ctb_tablas '+
  '                                WHERE tb_clave = ''TACYQ'') ON lca_acuerdocyq.ca_tipo = '+
  '                                                                   tb_codigo'+
  '  WHERE CA_NROORDEN = :CA_NROORDENParam '+
  '    AND CA_NROPAGO > 0';
  if not fraTipoFiltro.IsEmpty then
    sSQL := sSQL + 'AND CA_TIPO = '+ SqlValue(fraTipoFiltro.Codigo);
  sdqConsulta.SQL.Add(sSQL);
  sdqConsulta.ParamByName('CA_NROORDENParam').AsInteger := iNROORDEN;
  inherited;
end;

procedure TfrmABMAcuerdo.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraTipoFiltro.Clear;
end;



procedure TfrmABMAcuerdo.tbSalirClick(Sender: TObject);
begin
  fraTipoFiltro.Clear;
  inherited;
end;

end.
