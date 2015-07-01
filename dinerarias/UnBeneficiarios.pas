unit unBeneficiarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, StdCtrls, SinEdit,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine,
  Grids, DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, ImgList, unFraEmpresa,
  Mask, Buttons, FormPanel, ToolEdit, DateComboBox, unFraCtbTablas, unArtFrame, unFraCodigoDescripcion,
  PatternEdit, DateTimeEditors, unArtDbFrame, unArtDBAwareFrame, unFraDomicilio,
  unFraTrabajador, unFraTrabajadorSiniestro, unFraCodDesc;

type
  TfrmBeneficiarios = class(TfrmCustomConsulta)
    grpEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    grpSiniestro: TGroupBox;
    blSinFecha: TLabel;
    btnSiniMasDatos: TSpeedButton;
    edSinDiagnostico: TEdit;
    edCausaFin: TEdit;
    pnlChecks: TPanel;
    chkComMed: TCheckBox;
    chkSRT: TCheckBox;
    sdqBusqueda: TSDQuery;
    sdqBusquedaEX_SINIESTRO: TFloatField;
    sdqBusquedaEX_ORDEN: TFloatField;
    sdqBusquedaEX_RECAIDA: TFloatField;
    sdqBusquedaEX_FECHAACCIDENTE: TDateTimeField;
    sdqBusquedaEX_DIAGNOSTICO: TStringField;
    sdqBusquedaCAUSAFIN: TStringField;
    sdqBusquedaEX_CUIT: TStringField;
    sdqBusquedaEX_CUIL: TStringField;
    sdqBusquedaEX_CAUSAFIN: TStringField;
    sdqBusquedaEX_GTRABAJO: TStringField;
    sdqBusquedaGP_NOMBRE: TStringField;
    sdqBusquedaLG_NOMBRE: TStringField;
    sdqBusquedaEX_PRESTADOR: TFloatField;
    dsBusqueda: TDataSource;
    sdqBusquedaEX_GRAVEDAD: TStringField;
    PanABM: TFormPanel;
    LblNombre: TLabel;
    LblParentezco: TLabel;
    LblGrupoFam: TLabel;
    LblFecNac: TLabel;
    lbTelefono: TLabel;
    TxtTelefonos: TEdit;
    Label2: TLabel;
    ChkDiscapacitado: TCheckBox;
    TxtNombre: TEdit;
    cmbFecNac: TDateComboBox;
    ChkRepLegal: TCheckBox;
    TxtDocumento: TEdit;
    CmbGrupoFam: TComboBox;
    SDQGruposFam: TSDQuery;
    fraParentezco: TfraCtbTablas;
    lbDomicilio: TLabel;
    EdDomicilio: TEdit;
    PANBaja: TFormPanel;
    RadioGroup: TRadioGroup;
    grpTrabajador: TGroupBox;
    tbLiquidaciones: TToolButton;
    tbSalir2: TToolButton;
    lblParentezcoBenef: TLabel;
    fraParentezcoBenef: TfraCtbTablas;
    Label1: TLabel;
    fraDireccion: TfraDomicilio;
    Label3: TLabel;
    sdqBusquedaEX_IDTRABAJADOR: TFloatField;
    sdqBusquedaEM_ID: TFloatField;
    Bevel2: TBevel;
    edSinFecha: TDateEdit;
    fraTrabajadorSIN: TfraTrabajadorSiniestro;
    sbtnBuscar: TSpeedButton;
    ToolButton1: TToolButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    chkDocumNacimiento: TCheckBox;
    chkDocumDNI: TCheckBox;
    chkDocumCasamiento: TCheckBox;
    chkDocumSumaria: TCheckBox;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAceptarBorrado: TBitBtn;
    chkDocumOtros: TCheckBox;
    tbControversia: TToolButton;
    ToolButton2: TToolButton;
    tbFinControversia: TToolButton;
    fpControversia: TFormPanel;
    Bevel1: TBevel;
    btnCancelarCont: TBitBtn;
    btnAceptarCont: TBitBtn;
    dcDesdeCont: TDateComboBox;
    Label5: TLabel;
    rbReservaAlta: TRadioButton;
    rbControvAlta: TRadioButton;
    Label6: TLabel;
    btnAgregarCont: TBitBtn;
    btnQuitarCont: TBitBtn;
    ArtDBGrid1: TArtDBGrid;
    dsControversia: TDataSource;
    sdqControversia: TSDQuery;
    fraBeneficiarioCont: TfraCodDesc;
    fpFechaFin: TFormPanel;
    Label87: TLabel;
    Bevel5: TBevel;
    btnCerrarFecha: TBitBtn;
    btnAceptarFecha: TBitBtn;
    dcHastaCont: TDateComboBox;
    rbControversia: TRadioButton;
    rbReserva: TRadioButton;
    procedure tbRefrescarClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure tbNuevoClick(Sender: TObject);
    procedure PanABMShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure fradireccionExit(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure btnAceptarBorradoClick(Sender: TObject);
    procedure tbEliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String; var AFont: TFont;
                                      var ABackground: TColor; var AAlignment: TAlignment);
    procedure tbLimpiarClick(Sender: TObject);
    procedure ChkRepLegalClick(Sender: TObject);
    procedure tbLiquidacionesClick(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure fraTrabajadorSINedSiniestroSelect(Sender: TObject);
    procedure sbtnBuscarClick(Sender: TObject);
    procedure tbControversiaClick(Sender: TObject);
    procedure fpControversiaBeforeShow(Sender: TObject);
    procedure btnCancelarContClick(Sender: TObject);
    procedure btnAgregarContClick(Sender: TObject);
    procedure rbControvAltaClick(Sender: TObject);
    procedure btnQuitarContClick(Sender: TObject);
    procedure tbFinControversiaClick(Sender: TObject);
    procedure fpFechaFinBeforeShow(Sender: TObject);
    procedure btnAceptarFechaClick(Sender: TObject);
    procedure dcDesdeContExit(Sender: TObject);
  private
    Siniestro, Orden, Recaida: Integer;
    function CargarPartes: Boolean;
    function GetExisteBeneficiarioSiniestro(Siniestro, Orden, Recaida, Beneficiario: Integer): Boolean;
    function Validar: Boolean;
    procedure Cargar_Combo(Sender: TObject);
    procedure DoLimpiarABM;
    procedure DoCargarControversia;
  public
  end;

var
  frmBeneficiarios: TfrmBeneficiarios;

implementation

uses
  AnsiSql, unDmPrincipal, General, CustomDlgs, UnLiqBeneficiarios, VCLExtra, unSesion,
  unPrincipal, unDlgBusSiniestro, unArt, unTercerizadoras;

{$R *.DFM}

procedure TfrmBeneficiarios.tbRefrescarClick(Sender: TObject);
begin
  sdqconsulta.ParamByName('nSINIESTRO').AsInteger := Siniestro;
  sdqconsulta.ParamByName('nORDEN').AsInteger     := Orden;
  sdqconsulta.ParamByName('nRECAIDA').AsInteger   := Recaida;
  inherited;
end;

function TfrmBeneficiarios.CargarPartes: Boolean;
var
  sMensaje: String;
  sSql: string;
begin
  sMensaje  := '';
  sdqConsulta.Close;
  Result    := True;
  Siniestro := 0;
  Orden     := 0;
  Recaida   := 0;
  with sdqBusqueda do
  begin
    Close;
    ParamByName('pSiniestro').AsInteger := fraTrabajadorSIN.edSiniestro.Siniestro;
    ParamByName('pOrden').AsInteger     := fraTrabajadorSIN.edSiniestro.Orden;
    ParamByName('pRecaida').AsInteger   := fraTrabajadorSIN.edSiniestro.Recaida;
    Open;
  end;

  if sdqBusqueda.IsEmpty then
  begin
    tbLimpiarClick(Nil);
    Verificar(True, fraTrabajadorSIN.edSiniestro, 'No existe el siniestro buscado. Verifique los datos ingresados.');
  end
  else if (sdqBusquedaEX_CAUSAFIN.AsString  = '99') or (sdqBusquedaEX_CAUSAFIN.AsString  = '95') then
  begin
    tbLimpiarClick(Nil);
    Verificar(True, fraTrabajadorSIN.edSiniestro, 'El siniestro seleccionado ha sido cerrado por error de carga');
  end
  else if sdqBusqueda.FieldByName('ex_gravedad').AsString <> '5' then
  begin
    tbLimpiarClick(Nil);
    Verificar(True, fraTrabajadorSIN.edSiniestro, 'El siniestro seleccionado no es mortal');
  end;

  Siniestro           := fraTrabajadorSIN.edSiniestro.Siniestro;
  Orden               := fraTrabajadorSIN.edSiniestro.Orden;
  Recaida             := fraTrabajadorSIN.edSiniestro.Recaida;

  tbNuevo.Enabled     := Seguridad.Activar(tbNuevo);
  tbModificar.Enabled := Seguridad.Activar(tbModificar);
  tbEliminar.Enabled  := Seguridad.Activar(tbEliminar);
  tbImprimir.Enabled  := Seguridad.Activar(tbImprimir);
  tbExportar.Enabled  := Seguridad.Activar(tbExportar);

  if fraEmpresa.Value <> sdqBusquedaEM_ID.AsInteger then
    fraEmpresa.Value := sdqBusquedaEM_ID.AsInteger;

  if fraTrabajadorSIN.IdTrabajador <> sdqBusquedaEX_IDTRABAJADOR.AsInteger then
    fraTrabajadorSIN.Value := sdqBusquedaEX_IDTRABAJADOR.AsInteger;

  edSinFecha.Date       := sdqBusquedaEX_FECHAACCIDENTE.AsDateTime;
  edCausaFin.Text       := sdqBusquedaCAUSAFIN.AsString;
  edSinDiagnostico.Text := sdqBusquedaEX_DIAGNOSTICO.AsString;

  chkComMed.Checked := (ValorSqlEx('SELECT art.inca.is_dictamencommed(:Sin, :Ord) ' +
                                    ' FROM dual', [Siniestro, Orden]) = 'S');
  chkSRT.Checked    := ExisteSqlEx('SELECT 1' +
                                    ' FROM sdg_denunciasgraves' +
                                   ' WHERE dg_siniestro = :Sin ' +
                                     ' AND dg_orden = :Ord', [Siniestro, Orden]);

  sdqConsulta.Close;

  sSql := ' SELECT eb_siniestro, eb_orden, eb_recaida, eb_codigo, eb_nombre, eb_direccion, ' +
                 ' eb_caracter, eb_cpostal, eb_localidad, eb_fechanacimiento, eb_benefprincipal, ' +
                 ' eb_fechaalta, eb_usualta, eb_fechamodif, eb_usumodif, eb_provincia, eb_porcentaje, ' +
                 ' eb_fechabaja, eb_usubaja, eb_grupofamiliar, eb_replegal, eb_discapacitado, ' +
                 ' eb_documento, eb_telefono, eb_parenbene, NVL(eb_controversia, ''N'') eb_controversia, ' +
                 ' parentezco.tb_descripcion descrparentezco, ' +
                 ' parentezcobenef.tb_descripcion descrparentezcobenef, ' +
                 ' DECODE(eb_motivobaja, ''D'', ''Dejo de ser beneficiario'', ''N'', ''No es beneficiairo'', NULL) AS eb_motivobaja, ' +
                 ' eb_documdni, eb_documnacimiento, eb_documcasamiento, eb_documsumaria, ' +
                 ' eb_documotros, eb_controversiadesde, eb_controversiahasta, eb_calle, eb_numero, eb_piso, eb_departamento ' +
            ' FROM seb_beneficiarios, ctb_tablas parentezco, ctb_tablas parentezcobenef, art.sex_expedientes ' +
           ' WHERE eb_siniestro = :nsiniestro ' +
             ' AND eb_orden = :norden ' +
             ' AND eb_recaida = :nrecaida ' +
             ' AND eb_caracter = parentezco.tb_codigo(+) ' +
             ' AND parentezco.tb_clave(+) = ''PAREN'' ' +
             ' AND eb_parenbene = parentezcobenef.tb_codigo(+) ' +
             ' AND parentezcobenef.tb_clave(+) = ''PAREN'' ' +
             ' AND eb_siniestro = ex_siniestro ' +
             ' AND eb_orden = ex_orden ' +
             ' AND eb_recaida = ex_recaida ';

  if EsUsuarioDeTercerizadora then                                                    // por plan Ioma (Tercerizadoras)
    sSql := sSql + ' AND art.siniestro.is_sinitercerizadora(ex_id, ' + SQLValue(Sesion.UserID) + ') = ''S'' ';

  sSql := sSql + ' ORDER BY eb_grupofamiliar ';

  sdqConsulta.SQL.Text := sSql;

  sdqConsulta.ParamByName('nSINIESTRO').AsInteger := Siniestro;
  sdqConsulta.ParamByName('nORDEN').AsInteger     := Orden;
  sdqConsulta.ParamByName('nRECAIDA').AsInteger   := Recaida;

  sdqConsulta.Open;

  grpEmpresa.Enabled    := sdqConsulta.IsEmpty;
  grpTrabajador.Enabled := sdqConsulta.IsEmpty;
end;

procedure TfrmBeneficiarios.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                              var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if not sdqconsulta.FieldByName('eb_fechabaja').IsNull then
     AFont.Color := clRed;
end;

procedure TfrmBeneficiarios.tbNuevoClick(Sender: TObject);
begin
  inherited;
  panABM.Caption := 'Alta de Beneficiarios';
  PanABM.tag := 1;
  DoLimpiarABM;
  TxtNombre.Enabled     := True;
  fraparentezco.Enabled := True;
  cmbgrupofam.Enabled   := True;
  Cargar_Combo(nil);
  fraParentezcoBenef.Enabled := True;
  PanABM.ModalResult := mrOK;
  PanABM.ShowModal;
  tbRefrescar.Click;
end;

procedure TfrmBeneficiarios.PanABMShow(Sender: TObject);
begin
  cmbfecNac.MaxDate := DBDateTime;
end;
{-------------------------------------------------------------------------------}
procedure TfrmBeneficiarios.btnAceptarClick(Sender: TObject);
var
  SCodigo, SGrupoFam: String;
  Sql: TSQL;
begin
  //Defino el código que voy a usar
  if Panabm.Tag = 1 then
    SCodigo := ValorSqlEx('SELECT NVL(MAX(eb_codigo), 0) + 1' +
                           ' FROM seb_beneficiarios' +
                          ' WHERE eb_siniestro = :Sin ' +
                            ' AND eb_orden = :Ord ' +
                            ' AND eb_recaida = :Reca', [Siniestro, Orden, Recaida])
  else
    SCodigo := SDQConsulta.FieldByName('EB_CODIGO').AsString;

  TxtNombre.Tag := StrToInt(SCodigo);

  // Defino el grupo
  if CmbGrupoFam.Text = 'Nuevo Grupo' then
    SGrupoFam := ValorSqlEx('SELECT NVL(MAX(eb_grupofamiliar), 0) + 1' +
                           ' FROM seb_beneficiarios' +
                          ' WHERE eb_siniestro = :Sin ' +
                            ' AND eb_orden = :Ord ' +
                            ' AND eb_recaida = :Reca', [Siniestro, Orden, Recaida])
  else
    SGrupoFam := CmbGrupoFam.Text;

  Sql := TSql.Create;

  if validar then
  try
    BeginTrans;
    Sql.TableName := 'SEB_BENEFICIARIOS';
    Sql.Fields.Add('EB_SINIESTRO',       Siniestro, False);
    Sql.Fields.Add('EB_ORDEN',           Orden, False);
    Sql.Fields.Add('EB_RECAIDA',         Recaida, False);
    Sql.Fields.Add('EB_CODIGO',          SCodigo, False);
    Sql.Fields.Add('EB_NOMBRE',          txtNombre.Text);
    Sql.Fields.Add('EB_DIRECCION',       EdDomicilio.Text);
    Sql.Fields.Add('EB_CARACTER',        fraParentezco.edCodigo.Text);
    Sql.Fields.Add('EB_CPOSTAL',         fraDireccion.CodigoPostal);
    Sql.Fields.Add('EB_LOCALIDAD',       fraDireccion.Localidad);
    Sql.Fields.Add('EB_FECHANACIMIENTO', cmbFecNac.SqlText, False);
    Sql.Fields.Add('EB_FECHAALTA',      'actualdate', False);
    Sql.Fields.Add('EB_USUALTA',         Sesion.UserID);
    Sql.Fields.Add('EB_PROVINCIA',       IntToStr(fraDireccion.Prov));
    Sql.Fields.Add('EB_GRUPOFAMILIAR',   SGrupoFam, False);
    Sql.Fields.Add('EB_REPLEGAL',        SqlBoolean(ChkREpLegal.Checked, True), False);
    Sql.Fields.Add('EB_DISCAPACITADO',   SqlBoolean(ChkDiscapacitado.Checked, True), False);
    Sql.Fields.Add('EB_DOCUMENTO',       TxtDocumento.Text);
    Sql.Fields.Add('EB_TELEFONO',        TxtTelefonos.Text);
    Sql.Fields.Add('EB_PARENBENE',       fraParentezcoBenef.edCodigo.Text);
    Sql.Fields.Add('EB_DOCUMDNI',        SqlBoolean(chkDocumDNI.Checked, True), False);
    Sql.Fields.Add('EB_DOCUMNACIMIENTO', SqlBoolean(chkDocumNacimiento.Checked, True), False);
    Sql.Fields.Add('EB_DOCUMCASAMIENTO', SqlBoolean(chkDocumCasamiento.Checked, True), False);
    Sql.Fields.Add('EB_DOCUMSUMARIA',    SqlBoolean(chkDocumSumaria.Checked, True), False);
    Sql.Fields.Add('EB_DOCUMOTROS',      SqlBoolean(chkDocumOtros.Checked, True), False);
    Sql.Fields.Add('EB_CALLE',           fraDireccion.Calle);
    Sql.Fields.Add('EB_NUMERO',          fraDireccion.Numero);
    Sql.Fields.Add('EB_PISO',            fraDireccion.Piso);
    Sql.Fields.Add('EB_DEPARTAMENTO',    fraDireccion.Departamento);

    if Panabm.Tag = 1 then
      EjecutarSqlST(Sql.InsertSql)
    else
      EjecutarSqlST(Sql.UpdateSql +
                  ' WHERE eb_siniestro = ' + SqlInt(Siniestro) +
                    ' AND eb_orden = ' + SqlInt(Orden) +
                    ' AND eb_recaida = ' + SqlInt(Recaida) +
                    ' AND eb_codigo = ' + SCodigo);

    EjecutarStoreSTEx('art.sin.do_actualizarbeneficiario(:Sin, :Ord, :Reca);', [Siniestro, Orden, Recaida]);
    CommitTrans;
    DoLimpiarABM;
    PanABM.ModalResult := mrOK;
  except
    on E:Exception do
    begin
      ErrorMsg(E, 'Error al intentar ' + IIF(PanABM.Tag = 1, 'insertar', 'modificar'));
      Rollback;
    end;
  end;
  Sql.Free;
end;

procedure TfrmBeneficiarios.fradireccionExit(Sender: TObject);
begin
  if fraDireccion.IsSelected then
  begin
    if fradireccion.Piso = '' then
      edDomicilio.Text := fradireccion.Calle + ' ' + fradireccion.Numero
    else
      edDomicilio.Text := fradireccion.Calle + ' ' + fradireccion.Numero + ', ' +
                          fradireccion.Piso + ' ' + fradireccion.Departamento;
  end;

  fradireccion.FrameExit(Sender);
end;

procedure TfrmBeneficiarios.tbModificarClick(Sender: TObject);
var
  bBeneficiarioSiniestroSinLiq: Boolean;
  ICntitems: Integer;
begin
  if sdqconsulta.FieldByName('EB_FECHABAJA').IsNull then
  begin
    bBeneficiarioSiniestroSinLiq := not GetExisteBeneficiarioSiniestro(sdqConsulta.FieldByName('EB_SINIESTRO').AsInteger,
                                                                       sdqConsulta.FieldByName('EB_ORDEN').AsInteger,
                                                                       sdqConsulta.FieldByName('EB_RECAIDA').AsInteger,
                                                                       sdqConsulta.FieldByName('EB_CODIGO').AsInteger);

    Cargar_Combo(nil);
    panABM.Caption := 'Modificación de Beneficiarios';

    TxtNombre.Text    := sdqconsulta.FieldByName('EB_NOMBRE').AsString;
    Txtnombre.Enabled := bBeneficiarioSiniestroSinLiq;

    Fraparentezco.Value   := sdqconsulta.FieldByName('EB_CARACTER').AsString;
    Fraparentezco.Enabled := bBeneficiarioSiniestroSinLiq;

    ICntitems:= -1;
    while cmbgrupofam.Text <> sdqconsulta.FieldByName('EB_GRUPOFAMILIAR').AsString do
    begin
      ICntitems := ICntitems + 1;
      cmbgrupofam.ItemIndex := ICntitems;
    end;

    if not sdqconsulta.FieldByName('EB_GRUPOFAMILIAR').IsNull then
      cmbgrupofam.enabled := bBeneficiarioSiniestroSinLiq;

    cmbfecnac.Date:= sdqconsulta.FieldByName('EB_FECHANACIMIENTO').AsDateTime;

    ChkRepLegal.Checked        := IIF((sdqconsulta.FieldByName('EB_REPLEGAL').AsString = 'S') and
                                     (not sdqconsulta.FieldByName('EB_FECHANACIMIENTO').IsNull), True, False);
    ChkDiscapacitado.Checked   := IIF(sdqconsulta.FieldByName('EB_DISCAPACITADO').AsString = 'S', True, False);
    chkDocumDNI.Checked        := IIF(sdqconsulta.FieldByName('EB_DOCUMDNI').AsString = 'S', True, False);
    chkDocumNacimiento.Checked := IIF(sdqconsulta.FieldByName('EB_DOCUMNACIMIENTO').AsString = 'S', True, False);
    chkDocumCasamiento.Checked := IIF(sdqconsulta.FieldByName('EB_DOCUMCASAMIENTO').AsString = 'S', True, False);
    chkDocumSumaria.Checked    := IIF(sdqconsulta.FieldByName('EB_DOCUMSUMARIA').AsString = 'S', True, False);
    chkDocumOtros.Checked      := IIF(sdqconsulta.FieldByName('EB_DOCUMOTROS').AsString = 'S', True, False);    
    TxtDocumento.Text          := sdqconsulta.FieldByName('EB_DOCUMENTO').AsString;
    EdDomicilio.Text           := sdqconsulta.FieldByName('EB_DIRECCION').AsString;
    TxtTelefonos.Text          := sdqconsulta.FieldByName('EB_TELEFONO').AsString;
    rbControversia.Checked     := (sdqconsulta.FieldByName('EB_CONTROVERSIA').AsString = 'C');
    rbReserva.Checked          := (sdqconsulta.FieldByName('EB_CONTROVERSIA').AsString = 'R');
    //FraDireccion.CodigoPostal  := sdqconsulta.FieldByName('EB_CPOSTAL').AsString;
    //FraDireccion.Localidad     := sdqconsulta.FieldByName('EB_LOCALIDAD').AsString;
    fraDireccion.Cargar(sdqconsulta.FieldByName('EB_CALLE').AsString, sdqconsulta.FieldByName('EB_CPOSTAL').AsString,
                        sdqconsulta.FieldByName('EB_LOCALIDAD').AsString, sdqconsulta.FieldByName('EB_NUMERO').AsString,
                        sdqconsulta.FieldByName('EB_PISO').AsString, sdqconsulta.FieldByName('EB_DEPARTAMENTO').AsString,
                        sdqconsulta.FieldByName('EB_PROVINCIA').AsString, '');

    {if (sdqconsulta.FieldByName('EB_PROVINCIA').AsString <> '') then
    begin
      FraDireccion.Prov         := sdqconsulta.FieldByName('EB_PROVINCIA').AsInteger;
      FraDireccion.Provincia    := ValorSqlEx('SELECT pv_descripcion' +
                                               ' FROM cpv_provincias' +
                                              ' WHERE pv_codigo = :Prov',
                                              [sdqconsulta.FieldByName('EB_PROVINCIA').AsString]);
    end;}

    fraParentezcoBenef.Value   := sdqconsulta.FieldByName('EB_PARENBENE').AsString;
    fraParentezcoBenef.Enabled := bBeneficiarioSiniestroSinLiq;

    PanABM.Tag := 2;
    PanABM.ShowModal;
    tbRefrescar.Click;
  end
  else
    MessageDlg('No puede modificar un beneficiario que ha sido dado de baja.', mtError, [mbOK], 0);
end;

procedure TfrmBeneficiarios.btnAceptarBorradoClick(Sender: TObject);
var
  SMotivo: String;
begin
  case radiogroup.ItemIndex of
    0:  SMotivo := 'D';
    1:  SMotivo := 'N';
  end;

  try
    EjecutarSQL('UPDATE seb_beneficiarios' +
                  ' SET eb_fechabaja = actualdate, ' +
                      ' eb_usubaja = ' + SqlValue(Sesion.UserID) + ',' +
                      ' eb_motivobaja = ' + SqlValue(SMotivo) +
                ' WHERE eb_siniestro = ' + SqlInt(Siniestro) +
                  ' AND eb_orden = ' + SqlInt(Orden) +
                  ' AND eb_recaida = ' + SqlInt(Recaida) +
                  ' AND eb_codigo = ' + sdqConsulta.FieldByName('EB_CODIGO').AsString);

    PANBaja.ModalResult := mrOK;

    EjecutarStoreEx('art.sin.do_actualizarbeneficiario(:Sin, :Ord, :Reca);', [Siniestro, Orden, Recaida]);
  except
    MessageDlg('No se ha podido eliminar el registro.', mtError, [mbOK], 0);
  end;
end;

procedure TfrmBeneficiarios.tbEliminarClick(Sender: TObject);
begin
  if MsgAsk('¿Está seguro que desea eliminar el beneficiario seleccionado?') then
  begin
    PanBaja.ShowModal;
    tbRefrescar.Click;
  end;
end;

procedure TfrmBeneficiarios.FormCreate(Sender: TObject);
begin
  inherited;

  fraParentezco.Clave           := 'PAREN';
  fraParentezco.ShowBajas       := False;

  fraParentezcoBenef.Clave      := 'PAREN';
  fraParentezcoBenef.ShowBajas  := False;

  fraEmpresa.ShowBajas          := True;

  dcDesdeCont.MaxDate := DBDate;
  dcHastaCont.MaxDate := DBDate;

  IMG_FILTROS_SHOW := 17;
  IMG_FILTROS_HIDE := 18;

  tbLiquidaciones.Enabled := frmPrincipal.Seguridad.Activar(frmPrincipal.mnuLiqMortCalculos);   // Habilitacion btn Viajar.
end;

procedure TfrmBeneficiarios.Cargar_Combo(Sender: TObject);
begin
  //Cargo el combo de grupos familiares de acuerdo al SOR
  with Sender do
  begin
    SDQGruposFam.SQL.Text :=
      'SELECT DISTINCT eb_grupofamiliar as GRUPO' +
       ' FROM seb_beneficiarios' +
      ' WHERE eb_siniestro = ' + SqlInt(Siniestro) +
        ' AND eb_orden = ' + SqlInt(Orden) +
        ' AND eb_recaida = ' + SqlInt(Recaida);
    SDQGruposFam.Open;
    SDQGruposFam.First;
    while not SDQGruposFam.Eof do
    begin
      if SDQGruposFam.FieldByName('GRUPO').AsString <> '' then
        cmbGrupoFam.Items.Add(SDQGruposFam.FieldByName('GRUPO').AsString);
      SDQGruposFam.Next;
    end;
    cmbGrupoFam.Items.Add('Nuevo Grupo');
  end;
end;

function TfrmBeneficiarios.Validar: Boolean;
var
  I: Integer;
  iQEspConv: Integer;
  iTmp: Integer;
  Valido: Boolean;
begin
  Valido := True;

  if (txtNombre.Text = '') and Valido then
  begin
    MessageDlg('Debe cargar un nombre para el beneficiario.', mtWarning, [mbOK], 0);
    Valido := False;
  end;

  if Fraparentezco.IsEmpty and Valido then
  begin
    MessageDlg('Debe cargar un Parentezco.', mtWarning, [mbOK], 0);
    Valido := False;
  end;

  if (CmbGrupoFam.Text = '') and Valido then
  begin
    MessageDlg('Debe cargar un grupo familiar o seleccionar "Nuevo Grupo".', mtWarning, [mbOK], 0);
    Valido := False;
  end;

  if ((fraDireccion.IsEmpty) or (not fraDireccion.IsValid)) and Valido then
  begin
    MessageDlg('La dirección está vacía o contiene datos incorrectos.', mtWarning, [mbOK], 0);
    Valido := False;
  end;

  //Validaciones que dependen de si es A o M
  if panabm.Tag = 1 then
  begin
    //Si es Alta
    Val(ValorSql('SELECT COUNT(*)' +
                  ' FROM SEB_BENEFICIARIOS' +
                 ' WHERE EB_SINIESTRO = ' + SqlInt(Siniestro) +
                   ' AND EB_ORDEN = ' + SqlInt(Orden) +
                   ' AND EB_RECAIDA = ' + SqlInt(Recaida) +
                   ' AND EB_CARACTER = ' + SqlValue(fraParentezco.edCodigo.Text) +
                   ' AND EB_FECHABAJA IS NULL'), i, iTmp);

    if (cmbGrupoFam.Text <> 'Nuevo Grupo') and (cmbGrupoFam.Text <> '') then
      Val(ValorSql('SELECT COUNT(*)' +
                    ' FROM SEB_BENEFICIARIOS' +
                   ' WHERE EB_SINIESTRO = ' + SqlInt(Siniestro) +
                     ' AND EB_ORDEN = ' + SqlInt(Orden) +
                     ' AND EB_RECAIDA = ' + SqlInt(Recaida) +
                     ' AND EB_CARACTER in (''K'', ''L'')' +
                     ' AND EB_GRUPOFAMILIAR = ' + cmbGrupoFam.Text +
                     ' AND EB_FECHABAJA IS NULL'), iQEspConv, ITmp)
    else
      iQEspConv := 0;

    if ((fraParentezco.edCodigo.Text = 'K') or (fraParentezco.edCodigo.Text = 'L')) and Valido and (iQEspConv > 0) then
    begin
      MsgBox('Ese grupo familiar ya posee una esposa o conviviente.', 0, 'Imposible Cargar');
      Valido := False;
    end;

    if ((fraParentezco.edCodigo.Text = 'A') or (fraParentezco.edCodigo.Text = 'B') or
        (fraParentezco.edCodigo.Text = 'C') or (fraParentezco.edCodigo.Text = 'D') or
        (fraParentezco.edCodigo.Text = 'E') or (fraParentezco.edCodigo.Text = 'F') or
        (fraParentezco.edCodigo.Text = 'K') or (fraParentezco.edCodigo.Text = 'L')) and Valido and (i > 0) then
    begin
      MsgBox('Ya existe un beneficiario con ese parentezco.', 0, 'Imposible Cargar');
      Valido := False;
    end;

    if (cmbGrupoFam.Text <> 'Nuevo Grupo') and (cmbGrupoFam.Text <> '') then
    begin
      if chkReplegal.Checked and Valido and ValorSql('SELECT COUNT(*)' +
                                                      ' FROM SEB_BENEFICIARIOS' +
                                                     ' WHERE EB_SINIESTRO = ' + SqlInt(Siniestro) +
                                                       ' AND EB_ORDEN = ' + SqlInt(Orden) +
                                                       ' AND EB_RECAIDA = ' + SqlInt(Recaida) +
                                                       ' AND EB_GRUPOFAMILIAR = ' + SqlValue(cmbGrupoFam.Text) +
                                                       ' AND EB_REPLEGAL = ''S''' +
                                                       ' AND EB_FECHABAJA IS NULL') > 0 then
      begin
        MsgBox('Ya existe un representante legal para este grupo familiar.', 0, 'Imposible Cargar');
        Valido := False;
      end;
    end;
  end
  else
  begin
    //Si es Modificacion se agrega el Codigo
    Val(ValorSql('SELECT COUNT(*)' +
                  ' FROM SEB_BENEFICIARIOS' +
                 ' WHERE EB_SINIESTRO = ' + SqlInt(Siniestro) +
                   ' AND EB_ORDEN = ' + SqlInt(Orden) +
                   ' AND EB_RECAIDA = ' + SqlInt(Recaida) +
                   ' AND EB_CARACTER = ' + SqlValue(fraParentezco.edCodigo.Text) +
                   ' AND EB_FECHABAJA IS NULL' +
                   ' AND EB_CODIGO <> ' + IntToStr(TxtNombre.Tag)), i, ITmp);

    if (cmbGrupoFam.Text <> 'Nuevo Grupo') and (cmbGrupoFam.Text <> '') then
      Val(ValorSql('SELECT COUNT(*)' +
                    ' FROM SEB_BENEFICIARIOS' +
                   ' WHERE EB_SINIESTRO = ' + SqlInt(Siniestro) +
                     ' AND EB_ORDEN = ' + SqlInt(Orden) +
                     ' AND EB_RECAIDA = ' + SqlInt(Recaida) +
                     ' AND EB_CARACTER in(''K'',''L'')' +
                     ' AND EB_GRUPOFAMILIAR = ' + cmbGrupoFam.Text +
                     ' AND EB_FECHABAJA IS NULL' +
                     ' AND EB_CODIGO <> ' + IntToStr(TxtNombre.Tag)), iQEspConv, ITmp)
    else
      iQEspConv := 0;

    if ((fraParentezco.edCodigo.Text = 'K') or (fraParentezco.edCodigo.Text = 'L')) and Valido and (iQEspConv > 0) then
    begin
      MsgBox('Ese grupo familiar ya posee una esposa o conviviente.', 0, 'Imposible Cargar');
      Valido := False;
    end;

    if ((fraParentezco.edCodigo.Text = 'A') or (fraParentezco.edCodigo.Text = 'B') or
        (fraParentezco.edCodigo.Text = 'C') or (fraParentezco.edCodigo.Text = 'D') or
        (fraParentezco.edCodigo.Text = 'E') or (fraParentezco.edCodigo.Text = 'F') or
        (fraParentezco.edCodigo.Text = 'K') or (fraParentezco.edCodigo.Text = 'L')) and Valido and (i > 0) then
    begin
      MsgBox('Ya existe un beneficiario con ese parentezco.', 0, 'Imposible Cargar');
      Valido := False;
    end;

    if (cmbGrupoFam.Text <> 'Nuevo Grupo') and (cmbGrupoFam.Text <> '') then
    begin
      if chkReplegal.Checked and Valido and ValorSql('SELECT COUNT(*)' +
                                                      ' FROM SEB_BENEFICIARIOS' +
                                                     ' WHERE EB_CODIGO <> ' + SDQConsulta.FieldByName('EB_CODIGO').AsString +
                                                       ' AND EB_SINIESTRO = ' + SqlInt(Siniestro) +
                                                       ' AND EB_ORDEN = ' + SqlInt(Orden) +
                                                       ' AND EB_RECAIDA = ' + SqlInt(Recaida) +
                                                       ' AND EB_GRUPOFAMILIAR = ' + SqlValue(cmbGrupoFam.Text) +
                                                       ' AND EB_REPLEGAL = ''S''' +
                                                       ' AND EB_FECHABAJA IS NULL' +
                                                       ' AND EB_CODIGO <> ' + IntToStr(TxtNombre.Tag)) > 0 then
      begin
        MsgBox('Ya existe un representante legal para este grupo familiar.', 0, 'Imposible Cargar');
        Valido := False;
      end;
    end;
  end;

  Result := Valido;
end;

procedure TfrmBeneficiarios.tbImprimirClick(Sender: TObject);
begin
  Queryprint.Title.Text    := 'Listado de Beneficiarios';
  Queryprint.SubTitle.Text := 'Siniestro: ' + IntToStr(Siniestro) + '/' + IntToStr(Orden) +
                              '/' + IntToStr(Recaida) + ' - ' + fraTrabajadorSIN.Nombre +
                              '(' + fraTrabajadorSIN.CUIL + ')';
  inherited;
end;

procedure TfrmBeneficiarios.QueryPrintGetCellParams(Sender: TObject; Field: TPrintField; var AText: String;
                                                    var AFont: TFont; var ABackground: TColor; var AAlignment: TAlignment);
begin
  inherited;
  if sdqconsulta.FieldByName('EB_FECHABAJA').IsNull then
    AFont.Color := ClBlack
  else
    AFont.Color := ClSilver;
end;

procedure TfrmBeneficiarios.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraEmpresa.Clear;
  fraTrabajadorSIN.Clear;
  edSinDiagnostico.Clear;
  edSinFecha.Clear;
  edCausaFin.Clear;
  Siniestro := 0;
  Orden     := 0;
  Recaida   := 0;
  grpEmpresa.Enabled    := True;
  grpTrabajador.Enabled := True;
  if fraTrabajadorSIN.edSiniestro.CanFocus then
    fraTrabajadorSIN.edSiniestro.SetFocus;
end;

procedure TfrmBeneficiarios.ChkRepLegalClick(Sender: TObject);
var
  sFechaHoy: String;
begin
  if ChkRepLegal.Checked then
  begin
    if cmbFecNac.Text <> '  /  /    ' then
    begin
      sFechaHoy := ValorSql('Select floor((actualdate - to_date(''' + cmbFecNac.Text + ''', ''dd/mm/yyyy'')) / 365)' +
                             ' from dual');
      if StrToInt(sFechaHoy) < 18 then
      begin
        ChkRepLegal.Checked := False;
        MsgBox('El representante legal debe ser mayor de edad (18 años).', 0, 'Representante Menor de Edad');
      end;
    end
    else
    begin
      ChkRepLegal.Checked := False;
      MsgBox('Debe seleccionar la fecha de nacimiento antes de seleccionar esta opción.', 0, 'Faltan Datos');
    end;
  end;
end;

procedure TfrmBeneficiarios.tbLiquidacionesClick(Sender: TObject);
var
  frmLiqBeneficiarios: tfrmliqbeneficiarios;
begin
  if not fraTrabajadorSIN.IsEmpty then
    with frmLiqBeneficiarios  do
    begin
      frmLiqBeneficiarios   := TfrmLiqBeneficiarios.Create(frmPrincipal);
      MenuItem              := frmPrincipal.mnuLiqMortCalculos;
      fraTrabajadorSIN.edSiniestro.SetValues(Self.Siniestro, Self.Orden, Self.Recaida);
      fraTrabajadorSINedSiniestroSelect(Nil);
      Show;
      Self.Close;
    end;
end;

function TfrmBeneficiarios.GetExisteBeneficiarioSiniestro(Siniestro, Orden, Recaida, Beneficiario: Integer): Boolean;
var
  sSql: String;
begin
  sSql := 'SELECT 1' +
           ' FROM SBL_BENEFICIARIOLIQUIDACION' +
          ' WHERE BL_SINIESTRO = :Sin ' +
            ' AND BL_ORDEN = :Ord ' +
            ' AND BL_RECAIDA = :Reca ' +
            ' AND BL_BENEFICIARIO = :Ben';
  Result := ExisteSqlEx(sSql, [Siniestro, Orden, Recaida, Beneficiario]);
end;

procedure TfrmBeneficiarios.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBeneficiarios.fraTrabajadorSINedSiniestroSelect(Sender: TObject);
begin
  inherited;
  fraTrabajadorSIN.edSiniestroSelect(Sender);
  CargarPartes;
end;

procedure TfrmBeneficiarios.sbtnBuscarClick(Sender: TObject);
var
  iOldIdSiniestro, iNewIdSiniestro: integer;
begin
  ShortCutControl.Enabled := False;
  try
    iOldIdSiniestro := fraTrabajadorSIN.IdSiniestro;
    iNewIdSiniestro := GetIdSiniestro(fraEmpresa.Value, fraTrabajadorSIN.Value,
                                       fraTrabajadorSIN.IdSiniestro, edSinFecha.Date, True);
    fraTrabajadorSIN.IdSiniestro := iNewIdSiniestro;
    if (fraTrabajadorSIN.IdSiniestro <> ART_EMPTY_ID) and
       (iOldIdSiniestro <> fraTrabajadorSIN.IdSiniestro) then
      CargarPartes;
  finally
    ShortCutControl.Enabled := True;
  end;
end;

procedure TfrmBeneficiarios.DoLimpiarABM;
begin
  TxtNombre.Clear;
  fraparentezco.Limpiar;
  cmbgrupofam.Clear;
  cmbfecnac.Clear;
  TxtDocumento.Clear;
  fraDireccion.Clear;
  Txttelefonos.Clear;
  fraParentezcoBenef.Limpiar;
  Eddomicilio.Clear;
  rbControversia.Checked      := False;
  rbReserva.Checked           := False;
  chkreplegal.Checked         := False;
  chkdiscapacitado.Checked    := False;
  chkDocumDNI.Checked         := False;
  chkDocumNacimiento.Checked  := False;
  chkDocumCasamiento.Checked  := False;
  chkDocumSumaria.Checked     := False;
  chkDocumOtros.Checked       := False;
end;

procedure TfrmBeneficiarios.DoCargarControversia;
begin
  with sdqControversia do
  begin
    Close;
    ParamByName('nsiniestro').AsInteger   := Siniestro;
    ParamByName('norden').AsInteger       := Orden;
    ParamByName('nrecaida').AsInteger     := Recaida;
    ParamByName('cont').AsString          := IIF(rbControvAlta.Checked, 'C',
                                                IIF(rbReservaAlta.Checked, 'R', 'X'));
    ParamByName('desde').AsDate           := dcDesdeCont.Date;
    Open;
  end;
  fraBeneficiarioCont.Clear;
  fraBeneficiarioCont.Propiedades.ExtraCondition := ' AND eb_siniestro = ' + SqlInt(Siniestro) +
                                                    ' AND eb_orden = ' + SqlInt(Orden) +
                                                    ' AND eb_recaida = ' + SqlInt(Recaida) +
                                                    ' AND NVL(eb_controversia, ''N'') = ''N'' ';
end;

procedure TfrmBeneficiarios.tbControversiaClick(Sender: TObject);
begin
  if not(sdqConsulta.IsEmpty) and sdqConsulta.Active and
     (fpControversia.ShowModal = mrOk) then
  begin
    CommitTrans;
    tbRefrescar.Click;
  end
  else
    Rollback;
end;

procedure TfrmBeneficiarios.fpControversiaBeforeShow(Sender: TObject);
begin
  dcDesdeCont.Clear;
  fraBeneficiarioCont.Clear;
  rbReservaAlta.Checked := False;
  rbControvAlta.Checked := False;
  DoCargarControversia;
  BeginTrans;
end;

procedure TfrmBeneficiarios.btnCancelarContClick(Sender: TObject);
begin
  if MsgAsk('¿Desea descartar los cambios realizados?') then
    fpControversia.ModalResult := mrCancel;
end;

procedure TfrmBeneficiarios.btnAgregarContClick(Sender: TObject);
var
  sSql: String;
begin
  Verificar(dcDesdeCont.IsEmpty, dcDesdeCont, 'Debe ingresar la fecha.');
  Verificar(not(rbReservaAlta.Checked) and not(rbControvAlta.Checked), rbControvAlta, 'Debe seleccionar el tipo.');
  Verificar(fraBeneficiarioCont.IsEmpty, fraBeneficiarioCont, 'Debe seleccionar el beneficiario.');

  sSql := 'UPDATE seb_beneficiarios ' +
            ' SET eb_controversia = ' + SqlString(IIF(rbControvAlta.Checked, 'C', 'R'), True) + ',' +
                ' eb_controversiadesde = ' + SqlDate(dcDesdeCont.Date) + ',' +
                ' eb_controversiahasta = Null, ' + 
                ' eb_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' eb_fechamodif = ActualDate ' +
          ' WHERE eb_siniestro = ' + SqlInt(Siniestro) +
            ' AND eb_orden = ' + SqlInt(Orden) +
            ' AND eb_recaida = ' + SqlInt(Recaida) +
            ' AND eb_codigo = ' + SqlInt(fraBeneficiarioCont.ID);
  EjecutarSqlST(sSql);
  DoCargarControversia;
end;

procedure TfrmBeneficiarios.rbControvAltaClick(Sender: TObject);
begin
  DoCargarControversia;
end;

procedure TfrmBeneficiarios.btnQuitarContClick(Sender: TObject);
var
  sSql: String;
begin
  if not(sdqControversia.IsEmpty) and sdqControversia.Active and
     MsgAsk('¿Confirma quitar a ' + sdqControversia.FieldByName('eb_nombre').AsString + '?') then
  begin
    sSql := 'UPDATE seb_beneficiarios ' +
              ' SET eb_controversia = ''N'', ' +
                ' eb_controversiadesde = Null, ' +
                ' eb_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' eb_fechamodif = ActualDate ' +
          ' WHERE eb_siniestro = ' + SqlInt(Siniestro) +
            ' AND eb_orden = ' + SqlInt(Orden) +
            ' AND eb_recaida = ' + SqlInt(Recaida) +
            ' AND eb_codigo = ' + SqlInt(sdqControversia.FieldByName('eb_codigo').AsInteger);
    EjecutarSqlST(sSql);
    DoCargarControversia;
  end;
end;

procedure TfrmBeneficiarios.tbFinControversiaClick(Sender: TObject);
var
  sSql: String;
begin
  if not(sdqConsulta.IsEmpty) and sdqConsulta.Active and
     (sdqConsulta.FieldByName('eb_controversia').AsString <> 'N') and
     (fpFechaFin.ShowModal = mrOk) then
  begin
    sSql := 'UPDATE seb_beneficiarios ' +
              ' SET eb_controversia = ''N'', ' +
                ' eb_controversiahasta = ' + SqlDate(dcHastaCont.Date) + ',' +
                ' eb_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
                ' eb_fechamodif = ActualDate ' +
          ' WHERE eb_siniestro = ' + SqlInt(Siniestro) +
            ' AND eb_orden = ' + SqlInt(Orden) +
            ' AND eb_recaida = ' + SqlInt(Recaida) +
            ' AND eb_controversiadesde = ' + SqlDate(sdqConsulta.FieldByName('eb_controversiadesde').AsDateTime) +
            ' AND eb_controversia = ' + SqlValue(sdqConsulta.FieldByName('eb_controversia').AsString);
    EjecutarSql(sSql);
    tbRefrescar.Click;
  end;
end;

procedure TfrmBeneficiarios.fpFechaFinBeforeShow(Sender: TObject);
begin
  dcHastaCont.Clear;
end;

procedure TfrmBeneficiarios.btnAceptarFechaClick(Sender: TObject);
begin
  Verificar(dcHastaCont.IsEmpty, dcHastaCont, 'Debe ingresar la fecha.');
  Verificar(dcHastaCont.Date < sdqConsulta.FieldByName('eb_controversiadesde').AsDateTime,
            dcHastaCont, 'La fecha de fin no puede ser anterior a la de inicio.');
  fpFechaFin.ModalResult := mrOk;
end;

procedure TfrmBeneficiarios.dcDesdeContExit(Sender: TObject);
begin
  DoCargarControversia;
end;

end.
