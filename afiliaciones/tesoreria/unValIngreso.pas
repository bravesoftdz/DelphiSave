unit unValIngreso;

{
 INFORMACION DE LA UNIDAD
 AUTOR:               MARTIN LEFEBVRE
 FECHA DE CREACION:   21-08-03
 ULTIMA MODIFICACION: 06-10-03
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, ShortCutControl,
  unArtFrame, unFraCodigoDescripcion, unfraCtbTablas, unArtDbFrame, unFraEmpresa, StdCtrls, Mask, ToolEdit, DateComboBox,
  PatternEdit, CurrEdit, FormPanel, ExtCtrls, unArt, SDEngine, unAfiliaciones, unFraStaticCodigoDescripcion,
  unFraStaticCTB_TABLAS, unArtDBAwareFrame, unCustomForm, ImgList, XPMenu, Placemnt,
  RxCurrEdit, RxToolEdit, RxPlacemnt;

type
  TSectorIngreso = (siTesoreria, siLegales);

  TfrmValIngreso = class(TfrmCustomForm)
    ShortCutControl: TShortCutControl;
    ToolBar: TToolBar;
    tbGuardar: TToolButton;
    ToolButton1: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton2: TToolButton;
    tbSalir: TToolButton;
    gbDatos: TGroupBox;
    lbCuit: TLabel;
    lbTipoValor: TLabel;
    lbBanco: TLabel;
    lbNroCheque: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    fraEmpresa: TfraEmpresa;
    edNroCheque: TPatternEdit;
    edFechaCheque: TDateComboBox;
    edImporte: TCurrencyEdit;
    chkNegociable: TCheckBox;
    ToolBarNuevaEmpresa: TToolBar;
    tbAgregarEmpresaDeudora: TToolButton;
    Label3: TLabel;
    cmbCC_FECHACAJA: TDateComboBox;
    fraCodigoDescripcionBanco: TfraStaticCodigoDescripcion;
    Label4: TLabel;
    Label5: TLabel;
    edVA_CONCEPTOOBS: TEdit;
    fraCodDescrTipoVal: TfraStaticCodigoDescripcion;
    fraVA_CONCEPTO: TfraStaticCodigoDescripcion;
    procedure FormCreate(Sender: TObject);
    procedure tbSalirClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure tbAgregarEmpresaDeudoraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCobranzas: Boolean;
    FEditType: TFuncionShowForm;
    fFechaCaja: String;
    FIdValor: TTableID;
    FTipoEmpresa: TTiposEmpresa;
    FSectorIngreso: TSectorIngreso;

    function DeshabilitarBanco_Nro_Negociable: Boolean;
    function IsDatosValidosValor: Boolean;

    procedure fraCodDescrTipoValOnChange(Sender: TObject);
    procedure ObtenerCajaActiva;
    procedure SetearFoco;
    procedure SetEditType(const Value: TFuncionShowForm);
    procedure SetIdValor(const Value: TTableID);
    procedure SetTipoEmpresa(const Value: TTiposEmpresa);
    procedure SetSectorIngreso(const Value: TSectorIngreso);
  public
    property EditType     : TFuncionShowForm read FEditType      write SetEditType      default fsNone;
    property IdValor      : TTableID         read FIdValor       write SetIdValor;
    property TipoEmpresa  : TTiposEmpresa    read FTipoEmpresa   write SetTipoEmpresa   default teNone;
    property Cobranzas    : Boolean          read FCobranzas     write FCobranzas;
    property SectorIngreso: TSectorIngreso   read FSectorIngreso write SetSectorIngreso default siTesoreria;
  end;
var
  frmValIngreso: TfrmValIngreso;

implementation

uses
  unPrincipal, CustomDlgs, AnsiSql, General, unCustomDataModule, sqlFuncs, unDmPrincipal, Cuit, VCLExtra,
  unValAdministracion, unManRED_EMPDEUDORA, DBSql, unSesion, unComunes;

{$R *.DFM}

procedure TfrmValIngreso.ObtenerCajaActiva;
var
  sSql: String;
begin
  sSql := 'SELECT TESORERIA.GET_FECHACAJAACTIVA(''I'') FROM DUAL';

  fFechaCaja := ValorSql(sSql, '');
  cmbCC_FECHACAJA.Text := fFechaCaja;
  VCLExtra.LockControl(cmbCC_FECHACAJA, True);
  if fFEchaCaja = '' then
  begin
    MessageDlg('La caja de ingreso no se encuentra activa.', mtWarning, [mbOK], 0);
    LockControls(gbDatos, True);
    tbGuardar.Enabled := False;
    tbLimpiar.Enabled := False;
    tbAgregarEmpresaDeudora.Enabled := False;
  end;
end;

procedure TfrmValIngreso.FormCreate(Sender: TObject);
begin
  EditType      := fsNone;
  TipoEmpresa   := teNone;
  FCobranzas    := False;
  SectorIngreso := siTesoreria;

  with fraCodDescrTipoVal do
  begin
    TableName   := 'OTV_TIPOVALOR';
    FieldId     := 'TV_ID';
    FieldCodigo := 'TV_CODIGO';
    FieldDesc   := 'TV_DESCRIPCION';
    FieldBaja   := 'TV_USUBAJA';
    OnChange    := fraCodDescrTipoValOnChange;
    ShowBajas   := False;
  end;

  with fraVA_CONCEPTO do
  begin
    TableName      := 'OCV_CONCEPTOVALOR';
    FieldId        := 'CV_ID';
    FieldCodigo    := 'CV_ID';
    FieldDesc      := 'CV_DESCRIPCION';
    FieldBaja      := 'CV_USUBAJA';
    ShowBajas      := False;
    ExtraCondition := 'AND CV_TESORERIA = ''S''';
  end;

  with fraCodigoDescripcionBanco do
  begin
    TableName   := 'ZBA_BANCO';
    FieldId     := 'BA_ID';
    FieldCodigo := 'BA_CODIGO';
    FieldDesc   := 'BA_NOMBRE';
    ShowBajas   := False;
  end;
end;

procedure TfrmValIngreso.tbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmValIngreso.tbLimpiarClick(Sender: TObject);
begin
  case EditType of
    fsAgregar:
    begin
      fraCodDescrTipoVal.Clear;
      fraEmpresa.Clear;
    end;
  end;

  case TipoEmpresa of
    teDeudora:
    begin
      edFechaCheque.Clear;
      edImporte.Clear;
    end;
  end;

  if not fraVA_CONCEPTO.ReadOnly then
    fraVA_CONCEPTO.Clear;
    
  edVA_CONCEPTOOBS.Clear;
  fraCodigoDescripcionBanco.Clear;
  edNroCheque.Clear;
  chkNegociable.Checked := False;

  SetearFoco;
end;

{ Alta/modificación del valor }
procedure TfrmValIngreso.tbGuardarClick(Sender: TObject);
var
  bHabilitado: Boolean;
begin
  if IsDatosValidosValor then
  begin
    with TDBSql.Create('ZVA_VALOR') do
    begin
    	try
      	bHabilitado := not DeshabilitarBanco_Nro_Negociable();
        case FEditType of
        	fsAgregar:
          begin
          	Fields.Add('VA_ID',        GetSecNextVal('SEQ_ZVA_ID'));
            Fields.Add('VA_USUALTA',   Sesion.UserId);
            Fields.Add('VA_FECHAALTA', 'ACTUALDATE', False);
            SqlType := stInsert;
          end;
          fsModificar:
          begin
            PrimaryKey.Add( 'VA_ID',     IdValor);
            Fields.Add( 'VA_USUMODIF',   Sesion.UserId);
            Fields.Add( 'VA_FECHAMODIF', exDateTime);
            SqlType := stUpdate;
          end;
        end;
        
        case TipoEmpresa of
        	teDeudora:
          	Fields.Add('VA_IDEMPDEUDORA', Integer(fraEmpresa.Value));
        end;

        if bHabilitado then
        begin
          Fields.Add('VA_IDBANCO',     fraCodigoDescripcionBanco.Value);
          Fields.Add('VA_NROCHEQUE',   Trim(edNroCheque.Text));
          Fields.Add('VA_NEGOCIABLE',  chkNegociable.Checked);
          Fields.Add('VA_VENCIMIENTO', edFechaCheque.Date);
        end;

        if fraVA_CONCEPTO.IsSelected then
          Fields.Add('VA_IDCONCEPTOVALOR', fraVA_CONCEPTO.Value);

        Fields.Add('VA_CONCEPTOOBS', 						edVA_CONCEPTOOBS.Text);
        Fields.Add('VA_IDTIPOVALOR', 						fraCodDescrTipoVal.Value);
        Fields.Add('VA_ESTADO',      						'01');
        Fields.AddExtended('VA_IMPORTE',        edImporte.Value, ALL_DECIMALS, False);
        Fields.AddExtended('VA_IMPOSINIMPUTAR', edImporte.Value, ALL_DECIMALS, False);

        if SectorIngreso = siLegales then
          Fields.Add('VA_ORIGEN',      	   			'2');

        Execute;

        if Assigned(frmValAdministracion) then
          if frmValAdministracion.sdqConsulta.Active then
            frmValAdministracion.sdqConsulta.Refresh;

        MsgBox('Los datos se grabaron correctamente.', MB_OK + MB_ICONINFORMATION);
        case EditType of
        	fsAgregar:
          	tbLimpiarClick(Self);
        else
          Close;
        end;
			finally
        Free;
      end;
    end;
  end;
end;

{ Determina si los datos ingresados del valor son o no válidos}
function TfrmValIngreso.IsDatosValidosValor: Boolean;
var
  sSql: String;
  bSectorTesoreria, bHabilitado: Boolean;
begin
  bHabilitado := not DeshabilitarBanco_Nro_Negociable();

  // Concepto
  bSectorTesoreria := (FSectorIngreso = siTesoreria);
  Verificar(bSectorTesoreria and (EditType = fsAgregar) and (fraVA_CONCEPTO.Value = IDCONCEPTOVALOR_RECUPEROSIN), fraVA_CONCEPTO.edCodigo, 'El tipo de valor no puede ser Recupero de Siniestros.');

  // Tipo de valor
  Verificar(not fraCodDescrTipoVal.IsSelected, fraCodDescrTipoVal.edCodigo, 'Debe ingresar el tipo de valor.');

  // Empresa deudora
  Verificar(not fraEmpresa.IsSelected, fraEmpresa.mskCUIT, 'Debe ingresar la empresa.');

  // Banco
  Verificar(bHabilitado and not fraCodigoDescripcionBanco.IsSelected, fraCodigoDescripcionBanco.edCodigo, 'Debe ingresar el banco.');

  // Nro. de cheque
  Verificar(bHabilitado and (Trim( edNroCheque.Text ) = ''), edNroCheque, 'Debe ingresar el nro. de cheque.');

  // Fecha
  Verificar(((fraCodDescrTipoVal.Codigo = 'PAG') or (fraCodDescrTipoVal.Codigo = 'CHQ')) and edFechaCheque.IsEmpty, edFechaCheque, 'Debe ingresar la fecha la vencimiento.');

  // Importe del valor
  Verificar(edImporte.Value<=0, edImporte, 'El importe debe ser mayor a 0.');

  // banco + nro. de cheque
  if bHabilitado then
    begin
      sSql :=
      	'SELECT 1' +
         ' FROM ZVA_VALOR' +
        ' WHERE VA_IDBANCO = ' + SqlValue(fraCodigoDescripcionBanco.Value) +
        	' AND VA_NROCHEQUE = ' + SqlValue(Trim(edNroCheque.Text));

      case FEditType of
        fsModificar:
          sSql := sSql + ' AND VA_ID <> ' + SqlValue(IdValor);
      end;

      Verificar(ExisteSql(sSql), edNroCheque, 'Ya existe el nro. de cheque para el banco.');

      Result := True;
    end
  else
    Result := True;
end;

procedure TfrmValIngreso.SetEditType(const Value: TFuncionShowForm);
var
  sSql: String;
  sdqRegModificacion: TSDQuery;
begin
  if FEditType <> Value then
  begin
    FEditType := Value;

    case TipoEmpresa of
      teNormal:
        fraEmpresa.cmbRSocial.Width := 330;
      teDeudora:
        fraEmpresa.cmbRSocial.Width := 435;
    end;

    case FEditType of
      fsAgregar:
      begin
        Caption := 'Ingreso de Valores';
        ToolBarNuevaEmpresa.Enabled := True;
      end;
      fsModificar:
      begin
        Caption := 'Modificación de Valores';
        ToolBarNuevaEmpresa.Enabled := not Cobranzas;
        VCLExtra.LockControls(fraVA_CONCEPTO, Cobranzas);
        VCLExtra.LockControls(edVA_CONCEPTOOBS, Cobranzas);
        VCLExtra.LockControls(fraCodDescrTipoVal, False);
        VCLExtra.LockControls(fraEmpresa, Cobranzas);
        VCLExtra.LockControls(fraCodigoDescripcionBanco, Cobranzas);
        VCLExtra.LockControls(edNroCheque, Cobranzas);
        VCLExtra.LockControls(edFechaCheque, Cobranzas);
        VCLExtra.LockControls(edImporte, Cobranzas);
        VCLExtra.LockControls(chkNegociable, Cobranzas);

        case TipoEmpresa of
          teNormal:
          begin
            LockControl(edFechaCheque);
            LockControl(edImporte);

            sSql :=
            	'SELECT EM_CUIT CUIT, EM_NOMBRE NOMBRE, CO_CONTRATO CONTRATO, EM_ID IDEMPRESA,' +
              			' TO_CHAR(VA_NROCHEQUE) NROCHEQUE, VA_IDBANCO IDBANCO, VA_VENCIMIENTO VTO, VA_IMPORTE IMPORTE,' +
                    ' VA_NEGOCIABLE NEGOC, VA_IDCONCEPTOVALOR CONCEPTO, VA_CONCEPTOOBS CONCEPTOOBS,' +
                    ' VA_IDTIPOVALOR CODIGO_TIPO_VALOR' +
               ' FROM AFI.AEM_EMPRESA, AFI.ACO_CONTRATO, COB.ZBA_BANCO, COB.ZVA_VALOR' +
              ' WHERE VA_IDCONTRATO = CO_CONTRATO' +
              	' AND CO_IDEMPRESA = EM_ID' +
                ' AND BA_ID(+) = VA_IDBANCO' +
                ' AND VA_ID = :IdValor';
          end;
          teDeudora:
          begin
            LockControl(edFechaCheque, False);
            LockControl(edImporte, False);

            sSql :=
            	'SELECT ED_CUIT CUIT, ED_NOMBRE NOMBRE, NULL CONTRATO, ED_ID IDEMPRESA, TO_CHAR(VA_NROCHEQUE) NROCHEQUE,' +
              			' VA_IDBANCO IDBANCO, VA_VENCIMIENTO VTO, VA_IMPORTE IMPORTE, VA_NEGOCIABLE NEGOC,' +
                    ' VA_IDCONCEPTOVALOR CONCEPTO, VA_CONCEPTOOBS CONCEPTOOBS, VA_IDTIPOVALOR CODIGO_TIPO_VALOR' +
               ' FROM TESO.RED_EMPDEUDORA, COB.ZBA_BANCO, COB.ZVA_VALOR' +
              ' WHERE VA_IDEMPDEUDORA = ED_ID' +
              	' AND BA_ID(+) = VA_IDBANCO' +
                ' AND VA_ID = :IdValor';
          end;
        end;
        sdqRegModificacion := GetQueryEx(sSql, [IdValor]);

        try
          if not sdqRegModificacion.IsEmpty then
          begin
            if sdqRegModificacion.FieldByName('IDBANCO').AsString <> '' then
              fraCodigoDescripcionBanco.Value := sdqRegModificacion.FieldByName('IDBANCO').AsInteger;

            fraEmpresa.Value         := sdqRegModificacion.FieldByName('IDEMPRESA').AsInteger;
            fraCodDescrTipoVal.Value := sdqRegModificacion.FieldByName('CODIGO_TIPO_VALOR').AsInteger;
            edNroCheque.Text         := sdqRegModificacion.FieldByName('NROCHEQUE').AsString;
            edFechaCheque.Date       := sdqRegModificacion.FieldByName('VTO').AsDateTime;
            edImporte.Value          := sdqRegModificacion.FieldByName('IMPORTE').AsCurrency;
            fraVA_CONCEPTO.Value     := sdqRegModificacion.FieldByName('CONCEPTO').AsInteger;
            edVA_CONCEPTOOBS.Text    := sdqRegModificacion.FieldByName('CONCEPTOOBS').AsString;
            chkNegociable.Checked    := (sdqRegModificacion.FieldByName('NEGOC').AsString = SQL_TRUE);
            fraCodDescrTipoValOnChange(nil);
          end;
        finally
          sdqRegModificacion.Free;
        end;
      end; //case FEdit
    end;
  end;
end;

procedure TfrmValIngreso.SetIdValor(const Value: TTableID);
begin
  if FIdValor <> Value then
    FIdValor := Value;
end;

procedure TfrmValIngreso.SetTipoEmpresa(const Value: TTiposEmpresa);
begin
  if FTipoEmpresa <> Value then
    FTipoEmpresa := Value;


  with fraEmpresa do
  begin
    case FTipoEmpresa of
      teNormal:
      begin
        FieldID     := 'EM_ID';
        FieldCUIT   := 'EM_CUIT';
        FieldNombre := 'EM_NOMBRE';
        FieldBaja   := 'CO_FECHABAJA';

        MinLength := 2;
        ShowBajas := False;
      end;

      teDeudora:
      begin
        Sql :=
          'SELECT ED_ID AS '           + EMP_ALIAS_ID          + ', ' +
                 'ED_CUIT AS '         + EMP_ALIAS_CUIT        + ', ' +
                 'ED_NOMBRE AS '       + EMP_ALIAS_NOMBRE      + ', ' +
                 'NULL AS '            + EMP_ALIAS_CONTRATO    + ', ' +
                 'NULL AS '            + EMP_ALIAS_CODREG      + ', ' +
                 'TO_NUMBER(NULL) AS ' + EMP_ALIAS_CONTRATOEXT + ', ' +
                 'TO_NUMBER(NULL) AS ' + EMP_ALIAS_IDTIPOREGIMEN_ORIG + ', ' +
                 'ED_FECHABAJA AS '    + EMP_ALIAS_BAJA        + ', ' +
                 'NULL '               + EMP_ALIAS_VIP         + ', ' +
                 'DECODE(ED_FECHABAJA, NULL, 1, 2) ' + EMP_ALIAS_COBERTURA + ', ' +
                 'NULL '               + EMP_ALIAS_ORDEN       + ' ' +
            'FROM RED_EMPDEUDORA '  +
           'WHERE 1 = 1 ' ;

        FieldID     := 'ED_ID';
        FieldCUIT   := 'ED_CUIT';
        FieldNombre := 'ED_NOMBRE';
        FieldBaja   := 'ED_FECHABAJA';

        MinLength := 0;
        ShowBajas := False;
      end;
    end;
  end;
end;

{ Setea el foco al control correspondiente}
procedure TfrmValIngreso.SetearFoco;
begin
  case EditType of
    fsAgregar:
      if fraVA_CONCEPTO.ReadOnly then
        edVA_CONCEPTOOBS.SetFocus
      else
        fraVA_CONCEPTO.edCodigo.SetFocus;

    fsModificar:
      fraCodDescrTipoVal.edCodigo.SetFocus;
  end;
end;

procedure TfrmValIngreso.tbAgregarEmpresaDeudoraClick(Sender: TObject);
var
  idEmpresaDeudora: TTableId;
  sSql: String;
  sdqEmpresa: TSDQuery;
begin
  with TfrmManRED_EMPDEUDORA.Create(Self) do
  try
    ShowModal;

    idEmpresaDeudora := IdEmpresaDeudoraAlta;
  finally
    free;
  end;

  if idEmpresaDeudora <> ART_EMPTY_ID then
  begin
    sSql :=
    	'SELECT ED_CUIT, ED_NOMBRE' +
       ' FROM RED_EMPDEUDORA' +
      ' WHERE ED_ID = :ED_ID';

    sdqEmpresa := GetQueryEx(sSql, [idEmpresaDeudora]);
    try
      if not sdqEmpresa.IsEmpty then
      	with fraEmpresa do
        begin
        	mskCUIT.Text := sdqEmpresa.FieldByName('ED_CUIT').AsString;
          cmbRSocial.Text := sdqEmpresa.FieldByName('ED_NOMBRE').AsString;
        end;
    finally
      sdqEmpresa.Free;
    end;
  end;

  if fraEmpresa.IsEmpty then
    fraEmpresa.mskCUIT.SetFocus
  else
    fraCodigoDescripcionBanco.edCodigo.SetFocus;
end;

procedure TfrmValIngreso.fraCodDescrTipoValOnChange(Sender: TObject);
var
  bDeshabilitar: Boolean;
begin
  bDeshabilitar := DeshabilitarBanco_Nro_Negociable();

  if bDeshabilitar then
  begin
    fraCodigoDescripcionBanco.Clear;
    edNroCheque.Clear;
    chkNegociable.Checked := False;
  end;

  VCLExtra.LockControls(fraCodigoDescripcionBanco, bDeshabilitar);
  VCLExtra.LockControls(edNroCheque, bDeshabilitar);
  VCLExtra.LockControls(chkNegociable, bDeshabilitar);

  if ((fraCodDescrTipoVal.Codigo = 'PAG') or (fraCodDescrTipoVal.Codigo = 'CHQ')) then
    VCLExtra.LockControls(edFechaCheque, False)
  else
    VCLExtra.LockControls(edFechaCheque, True);
end;

function TfrmValIngreso.DeshabilitarBanco_Nro_Negociable: Boolean;
begin
  Result := fraCodDescrTipoVal.IsSelected and (fraCodDescrTipoVal.Codigo <> 'CHQ');
end;

procedure TfrmValIngreso.FormShow(Sender: TObject);
begin
  SetearFoco;
  ObtenerCajaActiva;
end;

procedure TfrmValIngreso.SetSectorIngreso(const Value: TSectorIngreso);
var
  bSectorLegales: Boolean;
begin
  if FSectorIngreso <> Value then
    begin
      FSectorIngreso := Value;
      bSectorLegales := (FSectorIngreso = siLegales);

      LockControl(fraVA_CONCEPTO, bSectorLegales);

      if bSectorLegales and (EditType = fsAgregar) then
        fraVA_CONCEPTO.Value := IDCONCEPTOVALOR_RECUPEROSIN;

      SetearFoco;
    end;
end;

end.

