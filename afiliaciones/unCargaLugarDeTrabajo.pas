unit unCargaLugarDeTrabajo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, Db, SDEngine, PatternEdit, CurrEdit, unArtFrame, unFraCodigoDescripcion,
  unFraActividad, Mask, ToolEdit, DateComboBox, HotKeyControl, unFraDomicilio, ShortCutControl, QueryPrint,
  unFraDomicilioTrab, artSeguridad, unArtDBAwareFrame, unFraCodDesc,
  RxCurrEdit, RxToolEdit;

type
  TfrmCargaLugarDeTrabajo = class(TForm)
    tlbControl: TToolBar;
    tlbNuevo: TToolButton;
    tlbGuardar: TToolButton;
    tlbBaja: TToolButton;
    tlbSalir: TToolButton;
    tblSeparador1: TToolButton;
    tblSeparador2: TToolButton;
    ArtDBGrid: TArtDBGrid;
    grbDomicilio: TGroupBox;
    lbCAFaxPostal: TLabel;
    lbFaxPostal: TLabel;
    edSE_CODAREAFAX: TPatternEdit;
    edSE_FAX: TPatternEdit;
    sdqDatos: TSDQuery;
    sdDatos: TDataSource;
    ShortCutControl: TShortCutControl;
    QueryPrint1: TQueryPrint;
    PrintDialog1: TPrintDialog;
    edSE_DOMICILIO: TEdit;
    Label3: TLabel;
    tbReactivar: TToolButton;
    ToolButton3: TToolButton;
    fraDomicilio: TfraDomicilio;
    GroupBox1: TGroupBox;
    grbSolicitud: TGroupBox;
    edSA_FORMULARIO: TEdit;
    Seguridad: TSeguridad;
    Label1: TLabel;
    edTelefonos: TEdit;
    grbContrato: TGroupBox;
    edContrato: TEdit;
    procedure tlbSalirClick(Sender: TObject);
    procedure tlbNuevoClick(Sender: TObject);
    procedure tlbGuardarClick(Sender: TObject);
    procedure sdqDatosAfterScroll(DataSet: TDataSet);
    procedure tlbBajaClick(Sender: TObject);
    procedure ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
                                     Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbReactivarClick(Sender: TObject);
  private
    FCancelarNuevo: Boolean;
    FIdFormulario: Integer;
    FOrigenAnterior: String;

    function isValidar: Boolean;

    procedure CancelarAlta;
    procedure DoGuardarEstablecimiento;
  public
    procedure DoCargaIDFormulario(aIdFormulario: Integer);
  end;

var
  frmCargaLugarDeTrabajo: TfrmCargaLugarDeTrabajo;

implementation

uses
  unPrincipal, unDmPrincipal, CustomDlgs, CUIT, General, AnsiSQL, SqlFuncs, unCargaTrabajador, unCargaSRT,
  unCargaSolicitud, unRptEstablecimiento, VCLExtra, Strfuncs, unSesion;

const
  SE_ALTA        : String = 'Carga de Lugar de Trabajo [ALTA]';
  SE_MODIFICACION: String = 'Carga de Lugar de Trabajo [MODIFICACION]';
  SE_BAJA        : String = 'Carga de Lugar de Trabajo [BAJA]';

{$R *.DFM}

function TfrmCargaLugarDeTrabajo.isValidar: Boolean;
var
  sSql: String;
begin
  if not fraDomicilio.isValid then
    Abort;

  sSql :=
    'SELECT 1' +
     ' FROM afi.alt_lugartrabajo_pcp' +
    ' WHERE lt_idformulario = :idformulario' +
      ' AND UPPER(lt_calle) = UPPER(:calle)' +
      ' AND UPPER(lt_numero) = UPPER(:numero)' +
      ' AND UPPER(NVL(lt_piso, '' '')) = UPPER(:piso)' +
      ' AND UPPER(NVL(lt_departamento, '' '')) = UPPER(:departamento)';



  Verificar(fraDomicilio.Provincia = '', fraDomicilio, 'La provincia es obligatoria');

  if Caption = SE_MODIFICACION then
    sSql := sSql + ' AND lt_id <> ' + SqlValue(sdqDatos.fieldByName('lt_id').AsInteger);

  Verificar(ExisteSqlEx(sSql, [FIdFormulario, fraDomicilio.Calle, fraDomicilio.Numero,
                               String(IIF((fraDomicilio.Piso <> ''), fraDomicilio.Piso, ' ')),
                               String(IIF((fraDomicilio.Departamento <> ''), fraDomicilio.Departamento, ' '))]),
                               fraDomicilio, 'Ya existe un establecimiento con ese domicilio.');

  if fraDomicilio.Numero = '' then
    fraDomicilio.Numero := 'S/N';

  Result := True;
end;


procedure TfrmCargaLugarDeTrabajo.CancelarAlta;
begin
  tlbNuevo.ImageIndex := 6;
  tlbNuevo.Hint := 'Cancelar alta (Ctrl - N)';

  EnableControls([tlbBaja], True);

  ArtDBGrid.SetFocus;
end;

procedure TfrmCargaLugarDeTrabajo.DoCargaIDFormulario(aIdFormulario: Integer);
begin
  FIdFormulario := aIdFormulario;
  sdqDatos.ParamByName('formulario').AsInteger := FIdFormulario;
  sdqDatos.Open;
  if sdqDatos.Eof then
    Caption := SE_ALTA
  else
    Caption := SE_MODIFICACION;
end;

procedure TfrmCargaLugarDeTrabajo.DoGuardarEstablecimiento;
var
  iSE_ID, iContrato, iSolicitud: Integer;
  sSql: String;
begin
  with TSql.Create('afi.alt_lugartrabajo_pcp') do
  try
    Fields.Add('lt_codareafax',           edSE_CODAREAFAX.Text);
    Fields.Add('lt_fax',                  edSE_FAX.Text);
    Fields.Add('lt_telefonos',            edTelefonos.Text);
    Fields.Add('lt_idformulario',          FIdFormulario);
    Fields.Add('lt_cpostal',              fraDomicilio.CodigoPostal);
    Fields.Add('lt_calle',                fraDomicilio.Calle);
    Fields.Add('lt_localidad',            fraDomicilio.Localidad);
    Fields.Add('lt_provincia',            ValorSqlIntegerEx('SELECT NVL(pv_codigo, 0)' +
                                                             ' FROM cpv_provincias' +
                                                            ' WHERE pv_descripcion = :descripcion',
                                                                      [fraDomicilio.Provincia], 0), False);
    iSolicitud := ValorSqlIntegerEx('SELECT sa_id FROM ' +
                                      ' asa_solicitudafiliacion '+
                                      '  WHERE sa_idformulario =:formulario', [FIDFormulario], 0);
    if iSolicitud <> 0 then
      Fields.AddInteger('lt_idsolicitud', iSolicitud , True);

    iContrato := ValorSqlIntegerEx('SELECT co_contrato FROM ' +
                                     ' aco_contrato ' +
                                     '  WHERE co_idformulario =:formulario', [FIdFormulario], 0);
    if iContrato <> 0 then
      Fields.AddInteger('lt_contrato', iContrato, True);

    Fields.Add('lt_departamento', fraDomicilio.Departamento);
    Fields.Add('lt_numero',       fraDomicilio.Numero);
    Fields.Add('lt_piso',         fraDomicilio.Piso);
    Fields.Add('lt_cpa',          fraDomicilio.CPA);

    if Caption = SE_ALTA then
    begin
      SqlType := stInsert;
      iSE_ID := ValorSql('SELECT AFI.SEQ_LUGARTRABAJO_ID.NEXTVAL FROM DUAL');
      PrimaryKey.Add('lt_id', iSE_ID, False);

      sSql :=
        'SELECT NVL(MAX(lt_nrolugartrabajo), 0) + 1' +
         ' FROM afi.alt_lugartrabajo_pcp' +
        ' WHERE lt_idformulario = :idformulario';
      Fields.Add('lt_nrolugartrabajo ', ValorSqlIntegerEx(sSql, [FIdFormulario]));

      Fields.Add('lt_fechaalta', 'SYSDATE', False);
      Fields.Add('lt_usualta',   frmPrincipal.DBLogin.UserId);
    end
    else if Caption = SE_MODIFICACION then
    begin
      iSE_ID := sdqDatos.FieldByName('lt_id').AsInteger;
      SqlType := stUpdate;
      PrimaryKey.Add('lt_id', iSE_ID, False);

      Fields.Add('lt_fechamodif', 'SYSDATE', False);
      Fields.Add('lt_usumodif',   frmPrincipal.DBLogin.UserId);
    end;

    try
      BeginTrans;
      EjecutarSqlST(Sql);
      CommitTrans;

      MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
      sdqDatos.Close;
      sdqDatos.Open;
    except
      RollBack;
    end;
  finally
    Free;
  end;
end;


procedure TfrmCargaLugarDeTrabajo.tlbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCargaLugarDeTrabajo.tlbNuevoClick(Sender: TObject);
begin
  FOrigenAnterior := '';

  if FCancelarNuevo then
  begin
    CancelarAlta;
    sdqDatosAfterScroll(nil);
    FCancelarNuevo := False;
  end
  else
  begin
    tlbNuevo.ImageIndex := 8;
    tlbNuevo.Hint := 'Nuevo (Ctrl - N)';
    EnableControls([tlbBaja], False);
    FCancelarNuevo := True;

    fraDomicilio.Clear;
    edSE_CODAREAFAX.Clear;
    edSE_FAX.Clear;
    Caption := SE_ALTA;
    edSE_DOMICILIO.Clear;
    edTelefonos.Clear;
    edContrato.Clear;
  end;
end;

procedure TfrmCargaLugarDeTrabajo.tlbGuardarClick(Sender: TObject);
begin
  Verificar((Caption <> SE_ALTA) and not sdqDatos.Eof and (sdqDatos.FieldByName('lt_usubaja').AsString <> ''),
            tlbControl, 'Este registro se encuentra dado de baja.');

  //Esta dando de alta un nuevo registro
  if isValidar then
    DoGuardarEstablecimiento;
end;

procedure TfrmCargaLugarDeTrabajo.tlbBajaClick(Sender: TObject);
begin
  if not sdqDatos.Eof and (sdqDatos.FieldByName('lt_usubaja').asString <> '') then
  begin
    MsgBox('Este registro se encuentra dado de baja.');
    Abort;
  end;

  if not sdqDatos.Eof then
    if MsgBox('¿ Realmente desea dar de baja este registro ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      with TSql.Create('afi.alt_lugartrabajo_pcp') do
      try
        SqlType := stUpdate;
        PrimaryKey.Add('lt_id',     sdqDatos.fieldByName('lt_id').AsInteger, False);
        Fields.Add('lt_fechabaja', 'SYSDATE', False);
        Fields.Add('lt_usubaja',    frmPrincipal.DBLogin.UserId);

        EjecutarSql(Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        sdqDatos.Close;
        sdqDatos.Open;
      finally
        Free;
      end;
end;

procedure TfrmCargaLugarDeTrabajo.sdqDatosAfterScroll(DataSet: TDataSet);
begin
  with sdqDatos do
  begin
   // edSA_FORMULARIO.Text        := FieldByName('fo_formulario').AsString;
    // DIRECCION A LA ANTIGUA...
    fraDomicilio.Clear;   //sin esto se quedan pegados los datos de otro registro
    fraDomicilio.CodigoPostal := FieldByName('lt_cpostal').AsString;
    fraDomicilio.CPA          := FieldByName('lt_cpa').AsString;
    fraDomicilio.Calle        := FieldByName('lt_calle').AsString;
    fraDomicilio.Localidad    := FieldByName('lt_localidad').AsString;
    fraDomicilio.Provincia    := FieldByName('pv_descripcion').AsString;
    fraDomicilio.Numero       := FieldByName('lt_numero').AsString;
    fraDomicilio.Departamento := FieldByName('lt_departamento').AsString;
    fraDomicilio.Piso         := FieldByName('lt_piso').AsString;
    edSA_FORMULARIO.Text      := FieldByName('fo_formulario').AsString;
    edContrato.Text           := FieldByName('lt_contrato').AsString;
    edSE_CODAREAFAX.Text := FieldByName('lt_codareafax').AsString;
    edSE_FAX.Text        := FieldByName('lt_fax').AsString;
    edTelefonos.Text     := FieldByName('lt_telefonos').AsString;
    edSE_DOMICILIO.Text  := FieldByName('lt_domicilio').AsString;
    if (not FieldByName('lt_contrato').IsNull) then
    begin
      edContrato.Text      := FieldByName('lt_contrato').AsString;
      grbContrato.Visible := True;
    end
    else
    begin
      edContrato.Clear;
      grbContrato.Visible := False;
    end;
  end;

  Caption := SE_MODIFICACION;

  if FCancelarNuevo then
  begin
    CancelarAlta;
    FCancelarNuevo := False;
  end;
end;

procedure TfrmCargaLugarDeTrabajo.ArtDBGridGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                                          var Background: TColor; Highlight: Boolean);
begin
  if sdqDatos.FieldByName('lt_usubaja').AsString <> '' then
    AFont.Color:= clRed;
end;

procedure TfrmCargaLugarDeTrabajo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action                  := caFree;
  frmCargaLugarDeTrabajo  := nil;
end;

procedure TfrmCargaLugarDeTrabajo.tlbImprimirClick(Sender: TObject);
begin
 { rptEstablecimiento := TrptEstablecimiento.Create(Self);
  try
    rptEstablecimiento.sdqReporte.ParamByName('isa_id').AsInteger := FIdSolicitud;
    rptEstablecimiento.sdqReporte.Open;
    rptEstablecimiento.Print;
  finally
    rptEstablecimiento.Free;
  end;      }
end;

procedure TfrmCargaLugarDeTrabajo.FormCreate(Sender: TObject);
begin
  inherited;
  FCancelarNuevo := False;
  VCLExtra.LockControls(edSE_DOMICILIO, True);
end;

procedure TfrmCargaLugarDeTrabajo.tbReactivarClick(Sender: TObject);
begin
  if not sdqDatos.Eof and (sdqDatos.FieldByName('lt_usubaja').AsString = '') then
  begin
    MsgBox('Este establecimiento se encuentra activo.');
    Abort;
  end;

  if not sdqDatos.Eof then
    if MsgBox('¿ Realmente desea reactivar este establecimiento ?', MB_ICONINFORMATION + MB_OKCANCEL) = IDOK then
      with TSql.Create('afi.alt_lugartrabajo_pcp') do
      try
        PrimaryKey.Add('lt_id',     sdqDatos.FieldByName('lt_id').AsInteger);
        Fields.Add('lt_fechabaja', 'NULL', False);
        Fields.Add('lt_usubaja',   'NULL', False);
        SqlType := stUpdate;

        EjecutarSQL(Sql);
        MsgBox('La operación se realizó con éxito.', MB_ICONEXCLAMATION, 'Atención');
        sdqDatos.Close;
        sdqDatos.Open;
      finally
        Free;
      end;
end;

end.
