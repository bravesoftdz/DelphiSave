unit unBusquedaDomicilio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, unCustomConsulta, FieldHider,
  ShortCutControl, Placemnt, artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls, PatternEdit, StdCtrls, Mask, IntEdit, unFraDomicilio,
  ImgList, FormPanel, unCustomGridABM, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unfraDelegacion;

type
  TfrmBusquedaDomicilio = class(TfrmCustomGridABM)
    GroupBox1: TGroupBox;
    lbCPostal: TLabel;
    lbCPA: TLabel;
    lbLocalidad: TLabel;
    lbProvincia: TLabel;
    edCPostal: TIntEdit;
    edCPABusqueda: TPatternEdit;
    edLocalidadBusqueda: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edCalleDesde: TIntEdit;
    edCalleHasta: TIntEdit;
    cmbProvincia: TComboBox;
    ilByN: TImageList;
    ilColor: TImageList;
    Label3: TLabel;
    edAlturaBusqueda: TIntEdit;
    chkControlParImpar: TCheckBox;
    Panel1: TPanel;
    btnAceptar2: TButton;
    btnCancelar2: TButton;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    edCp: TEdit;
    edCpa: TEdit;
    edCalle: TEdit;
    edLocalidad: TEdit;
    edPartido: TEdit;
    cbProvincia: TComboBox;
    edAltura: TIntEdit;
    cbVereda: TComboBox;
    GroupBox3: TGroupBox;
    edCalleBusqueda: TEdit;
    rgCalle: TRadioGroup;
    fraDelega: TfraDelegacion;
    fraDelegaContrato: TfraDelegacion;
    Label8: TLabel;
    Label13: TLabel;
    procedure tbRefrescarClick(Sender: TObject); {$IFDEF REFRESH} override; {$ENDIF}
    procedure FormCreate(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbPropiedadesClick(Sender: TObject);
    procedure btnAceptar2Click(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    fFraDomicilio: TFraDomicilio;

    function GetComputerAndUserName: String;
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;

    procedure ClearControls; override;
    procedure LoadControls; override;
  public
    property Frame: TFraDomicilio read fFraDomicilio write fFraDomicilio;
  end;

implementation

uses
  unDmPrincipal, CustomDlgs, VCLExtra, AnsiSql, General, unSesion,
  {$IFDEF CAS}unMenu{$ELSE}unPrincipal{$ENDIF};

{$R *.DFM}

function TfrmBusquedaDomicilio.DoABM: Boolean;
var
  iAltura: Integer;
  iAlturaDesde: Integer;
  iAlturaHasta: Integer;
  iCubId: Integer;
  sSql: String;
  sSql2: String;
begin
  if ModoABM = maBaja then
  begin
    sSql :=
      'DECLARE' +
       ' PRAGMA AUTONOMOUS_TRANSACTION;' +
     ' BEGIN' +
       ' DELETE FROM cub_ubicacion' +
             ' WHERE ub_id = :p1;' +
       ' DELETE FROM cpa_codigospostales' +
             ' WHERE pa_id = :p2;' +
       ' COMMIT;' +
     ' END;';
     EjecutarSqlSTEx(sSql, [sdqConsulta.FieldByName('mp_idubicacion').AsInteger,
                            sdqConsulta.FieldByName('mp_idcodigospostales').AsInteger]);
  end
  else
  begin
    iAltura := Trunc(edAltura.Value / 100) * 100;
    iAlturaDesde := 0;
    iAlturaHasta := 0;

    if Copy(cbVereda.Text, 1, 1) = 'P' then   // Vereda Par..
    begin
      iAlturaDesde := iAltura + 2;
      iAlturaHasta := iAltura + 100;
    end;
    if Copy(cbVereda.Text, 1, 1) = 'I' then   // Vereda Impar..
    begin
      iAlturaDesde := iAltura + 1;
      iAlturaHasta := iAltura + 99;
    end;

    if ModoABM = maAlta then
    begin
      sSql := 'SELECT seq_cub_id.NEXTVAL FROM DUAL';
      iCubId := ValorSqlInteger(sSql);

      sSql :=
        'DECLARE' +
         ' PRAGMA AUTONOMOUS_TRANSACTION;' +
       ' BEGIN' +
         ' INSERT INTO cub_ubicacion' +
                     ' (ub_id, ub_calle, ub_localidad, ub_cpostal, ub_provincia, ub_fechaactualizacion, ub_usualta,' +
                      ' ub_fechaalta, ub_iddelegacion, ub_iddelegacontrato)' +
              ' VALUES (:id, :calle, :localidad, :cp, :provincia, SYSDATE, :usualta, SYSDATE, :delegacion, :delegacontrato);' +
         ' INSERT INTO cpa_codigospostales' +
                     ' (pa_cpa, pa_letra_provincia, pa_partido, pa_localidad, pa_codigoppostal, pa_calle_abreviado,' +
                      ' pa_calle_largo, pa_desde, pa_hasta, pa_provincia, pa_idubicacion)' +
              ' VALUES (:cpa, :letra, :partido, :localidad2, :cp2, :calle2, :calle3,' +
                      ' :alturadesde, :alturahasta, :provincia2, :id2);' +
         ' COMMIT;' +
       ' END;';
      EjecutarSqlSTEx(sSql, [iCubId, Trim(edCalle.Text), Trim(edLocalidad.Text), Trim(edCp.Text),
                             String(ValorSqlEx('SELECT pv_codigo FROM cpv_provincias WHERE pv_descripcion = :descripcion', [cbProvincia.Text])),
                             Sesion.UserID, fraDelega.Value, fraDelegaContrato.Value,
                             Trim(edCpa.Text), Copy(Trim(edCpa.Text), 1, 1), Trim(edPartido.Text),
                             Trim(edLocalidad.Text), Trim(edCp.Text), Trim(edCalle.Text), Trim(edCalle.Text),
                             iAlturaDesde, iAlturaHasta,
                             String(ValorSqlEx('SELECT pv_codigo FROM cpv_provincias WHERE pv_descripcion = :descripcion', [cbProvincia.Text])),
                             iCubId]);
    end
    else if ModoABM = maModificacion then
    begin
      sSql :=
        'DECLARE' +
         ' PRAGMA AUTONOMOUS_TRANSACTION;' +
       ' BEGIN' +
       ' UPDATE cub_ubicacion' +
          ' SET ub_calle = ' + SqlValue(Trim(edCalle.Text)) + ',' +
              ' ub_localidad = ' + SqlValue(Trim(edLocalidad.Text)) + ',' +
              ' ub_cpostal = ' + SqlValue(Trim(edCp.Text)) + ',' +
              ' ub_provincia = ' + SqlValue(String(ValorSql('SELECT pv_codigo FROM cpv_provincias WHERE pv_descripcion = ' + SqlValue(cbProvincia.Text)))) + ',' +
              ' ub_fechaactualizacion = SYSDATE,' +
              ' ub_usumodif = ' + SqlValue(Sesion.UserID) + ',' +
              ' ub_fechamodif = SYSDATE' + ',' +
              ' ub_iddelegacion = ' + SqlValue(fraDelega.Value) + ',' +
              ' ub_iddelegacontrato = ' + SqlValue(fraDelegaContrato.Value) +
        ' WHERE ub_id = ' + SqlValue(sdqConsulta.FieldByName('mp_idubicacion').AsInteger) + ';';

      if sdqConsulta.FieldByName('mp_idcodigospostales').IsNull then
      begin
        sSql2 := 'SELECT seq_cub_id.NEXTVAL FROM DUAL';
        iCubId := ValorSqlInteger(sSql2);

        sSql := sSql +
         ' INSERT INTO cpa_codigospostales' +
                     ' (pa_cpa, pa_letra_provincia, pa_partido, pa_localidad, pa_codigoppostal, pa_calle_abreviado, pa_calle_largo,' +
                      ' pa_desde, pa_hasta, pa_provincia, pa_idubicacion)' +
              ' VALUES (' + SqlValue(Trim(edCpa.Text)) + ', ' + SqlValue(Copy(Trim(edCpa.Text), 1, 1)) + ', ' + SqlValue(Trim(edPartido.Text)) + ', ' + SqlValue(Trim(edLocalidad.Text)) + ', ' + SqlValue(Trim(edCp.Text)) + ', ' + SqlValue(Trim(edCalle.Text)) + ', ' + SqlValue(Trim(edCalle.Text)) + ',' +
                      ' ' + SqlValue(iAlturaDesde) + ', ' + SqlValue(iAlturaHasta) + ', ' + SqlValue(String(ValorSql('SELECT pv_codigo FROM cpv_provincias WHERE pv_descripcion = ' + SqlValue(cbProvincia.Text)))) + ', ' + SqlValue(iCubId) + ');';
      end
      else
        sSql := sSql +
         ' UPDATE cpa_codigospostales' +
            ' SET pa_cpa = ' + SqlValue(Trim(edCpa.Text)) + ',' +
                ' pa_letra_provincia = ' + SqlValue(Copy(Trim(edCpa.Text), 1, 1)) + ',' +
                ' pa_partido = ' + SqlValue(Trim(edPartido.Text)) + ',' +
                ' pa_localidad = ' + SqlValue(Trim(edLocalidad.Text)) + ',' +
                ' pa_codigoppostal = ' + SqlValue(Trim(edCp.Text)) + ',' +
                ' pa_calle_abreviado = ' + SqlValue(Trim(edCalle.Text)) + ',' +
                ' pa_calle_largo = ' + SqlValue(Trim(edCalle.Text)) + ',' +
                ' pa_desde = ' + SqlValue(iAlturaDesde) + ',' +
                ' pa_hasta = ' + SqlValue(iAlturaHasta) + ',' +
                ' pa_provincia = ' + SqlValue(String(ValorSql('SELECT pv_codigo FROM cpv_provincias WHERE pv_descripcion = ' + SqlValue(cbProvincia.Text)))) +
          ' WHERE pa_id = ' + SqlValue(sdqConsulta.FieldByName('mp_idcodigospostales').AsInteger) + ';';

      sSql := sSql +
          ' COMMIT;' +
        ' END;';
      EjecutarSqlST(sSql);
    end;
  end;

  Result := True;
end;

function TfrmBusquedaDomicilio.GetComputerAndUserName: String;
begin
  Result := Format('%s/%s', [{$IFDEF CAS}frmMenu{$ELSE}frmPrincipal{$ENDIF}.DBLogin.WindowsComputerName, Sesion.UserID]);
end;

function TfrmBusquedaDomicilio.Validar: Boolean;
var
  iAltura: Integer;
  iAlturaDesde: Integer;
  iAlturaHasta: Integer;
  sSql: String;
begin
  Verificar((Trim(edCp.Text) = ''), edCp, 'El campo C.P. es obligatorio.');
  Verificar((Trim(edCpa.Text) = ''), edCpa, 'El campo C.P.A. es obligatorio.');
  Verificar((Trim(edCalle.Text) = ''), edCalle, 'El campo Calle es obligatorio.');
  Verificar(edAltura.IsEmpty, edAltura, 'El campo Altura es obligatorio.');
  Verificar((cbVereda.ItemIndex < 1), cbVereda, 'El campo Vereda es obligatorio.');
  Verificar((Trim(edLocalidad.Text) = ''), edLocalidad, 'El campo Localidad es obligatorio.');
//  Verificar((Trim(edPartido.Text) = ''), edPartido, 'El campo Partido es obligatorio.');
  Verificar((cbProvincia.ItemIndex = -1), cbProvincia, 'El campo Provincia es obligatorio.');

  sSql :=
    'SELECT 1' +
     ' FROM cub_ubicacion' +
    ' WHERE UPPER(ub_calle) = UPPER(:calle)' +
      ' AND UPPER(ub_localidad) = UPPER(:localidad)' +
      ' AND UPPER(ub_cpostal) = UPPER(:cp)' +
      ' AND UPPER(ub_provincia) = UPPER(:provincia)';
  Verificar(ExisteSqlEx(sSql, [Trim(edCalle.Text), Trim(edLocalidad.Text), Trim(edCp.Text), cbProvincia.Text]), edCp,
            'El conjunto de datos Calle - Localidad - CP - Provincia ya existe en la base de datos.');

//  sSql :=
//    'SELECT 1' +
//     ' FROM cpa_codigospostales' +
//    ' WHERE UPPER(pa_cpa) = UPPER(:cpa)';
//  Verificar(ExisteSqlEx(sSql, [Trim(edCpa.Text)]), edCpa, 'El C.P.A. ya existe en la base de datos.');


  iAltura := Trunc(edAltura.Value / 100) * 100;
  iAlturaDesde := 0;
  iAlturaHasta := 0;

  if Copy(cbVereda.Text, 1, 1) = 'P' then   // Vereda Par..
  begin
    iAlturaDesde := iAltura + 2;
    iAlturaHasta := iAltura + 100;
  end;
  if Copy(cbVereda.Text, 1, 1) = 'I' then   // Vereda Impar..
  begin
    iAlturaDesde := iAltura + 1;
    iAlturaHasta := iAltura + 99;
  end;

  sSql :=
    'SELECT 1' +
     ' FROM cpa_codigospostales' +
    ' WHERE UPPER(pa_provincia) = UPPER(:provincia)' +
//      ' AND UPPER(pa_partido) = UPPER(' + SqlValue(Trim(edPartido.Text)) + ')' +
      ' AND UPPER(pa_localidad) = UPPER(:localidad)' +
      ' AND UPPER(pa_calle_abreviado) = UPPER(:calle)' +
      ' AND pa_desde = :alturadesde' +
      ' AND pa_hasta = :alturahasta';
  Verificar(ExisteSqlEx(sSql, [cbProvincia.Text, Trim(edLocalidad.Text), Trim(edCalle.Text), iAlturaDesde, iAlturaHasta]),
            edCp, 'El conjunto de datos Provincia - Localidad - Calle - Altura ya existe en la base de datos.');

  Result := True;
end;


procedure TfrmBusquedaDomicilio.ClearControls;
begin
  edCp.Clear;
  edCpa.Clear;
  edCalle.Clear;
  edAltura.Clear;
  cbVereda.ItemIndex := 0;
  edLocalidad.Clear;
  edPartido.Clear;
  cbProvincia.ItemIndex := -1;
  fraDelega.Clear;
  fraDelegaContrato.Clear;
end;

procedure TfrmBusquedaDomicilio.LoadControls;
begin
  with sdqConsulta do
  begin
    edCp.Text               := FieldByName('mp_cpostal').AsString;
    edCpa.Text              := FieldByName('mp_cpa').AsString;
    edCalle.Text            := FieldByName('mp_calle').AsString;
    edAltura.Value          := Trunc(FieldByName('mp_desde').AsInteger / 100) * 100;
    cbVereda.ItemIndex      := IIF(((FieldByName('mp_desde').AsInteger mod 2) = 0), 2, 1);
    edLocalidad.Text        := FieldByName('mp_localidad').AsString;
    edPartido.Text          := FieldByName('mp_partido').AsString;
    cbProvincia.ItemIndex   := cbProvincia.Items.IndexOf(FieldByName('mp_provincia').AsString);
    {$IFDEF RED_PRES}
    fraDelega.Codigo          := FieldByName('mp_iddelegacion').AsString;
    fraDelegaContrato.Codigo   := FieldByName('mp_iddelegacontrato').AsString;
    {$ELSE}
    fraDelega.Value         := FieldByName('mp_iddelegacion').AsInteger;
    fraDelegaContrato.Value := FieldByName('mp_iddelegacontrato').AsInteger;
    {$ENDIF}
  end;
end;


procedure TfrmBusquedaDomicilio.tbRefrescarClick(Sender: TObject);
var
  sSelect1: String;
  sSelect2: String;
  sSql: String;
  sWhere1: String;
  sWhere2: String;
begin
  sSelect1 :=
    'SELECT ' + SqlValue(GetComputerAndUserName) + ', pa_id, pa_idubicacion, pa_codigoppostal, pa_cpa,' +
            ' pa_calle_abreviado, pa_desde, pa_hasta, pa_localidad, pv_descripcion, pa_provincia, pa_partido,' +
            ' ub_iddelegacion, ub_iddelegacontrato' +
       ' FROM cpv_provincias, cpa_codigospostales' +
       ' LEFT JOIN cub_ubicacion ON(ub_id = pa_idubicacion)' +
      ' WHERE pv_codigo = pa_provincia _WHERE1_';
  sSelect2 :=
    'SELECT ' + SqlValue(GetComputerAndUserName) + ', NULL, ub_id, ub_cpostal, NULL, ub_calle, 0, 9999, ub_localidad,' +
            ' pv_descripcion, ub_provincia, NULL,' +
            ' ub_iddelegacion, ub_iddelegacontrato' +
       ' FROM cub_ubicacion, cpv_provincias' +
      ' WHERE pv_codigo = ub_provincia' +
        ' AND NOT EXISTS(SELECT 1' +
                         ' FROM tmp_domicilios' +
                        ' WHERE mp_idubicacion = ub_id' +
                          ' AND mp_usuario = ' + SqlValue(GetComputerAndUserName) + ') _WHERE2_';

  sWhere1 := '';
  sWhere2 := '';

  if Trim(edCalleBusqueda.Text) <> '' then
  begin
    if rgCalle.ItemIndex = 0 then   // Contiene..
    begin
      sWhere1 := sWhere1 + ' AND pa_calle_abreviado LIKE ' + SqlValue('%' + Trim(edCalleBusqueda.Text) + '%');
      sWhere2 := sWhere2 + ' AND ub_calle LIKE ' + SqlValue('%' + Trim(edCalleBusqueda.Text) + '%');
    end;
    if rgCalle.ItemIndex = 1 then   // Empieza..
    begin
      sWhere1 := sWhere1 + ' AND pa_calle_abreviado LIKE ' + SqlValue(Trim(edCalleBusqueda.Text) + '%');
      sWhere2 := sWhere2 + ' AND ub_calle LIKE ' + SqlValue(Trim(edCalleBusqueda.Text) + '%');
    end;
  end;

  if Trim(edLocalidadBusqueda.Text) <> '' then
  begin
    sWhere1 := sWhere1 + ' AND pa_localidad LIKE ' + SqlValue('%' + Trim(edLocalidadBusqueda.Text) + '%');
    sWhere2 := sWhere2 + ' AND ub_localidad LIKE ' + SqlValue('%' + Trim(edLocalidadBusqueda.Text) + '%');
  end;

  if (cmbProvincia.ItemIndex <> -1) then
  begin
    sWhere1 := sWhere1 + ' AND pv_descripcion = ' + SqlValue(cmbProvincia.Text);
    sWhere2 := sWhere2 + ' AND pv_descripcion = ' + SqlValue(cmbProvincia.Text);
  end;

  if Trim(edCPostal.Text) <> '' then
  begin
    sWhere1 := sWhere1 + ' AND pa_codigoppostal = ' + SqlValue(Trim(edCPostal.Text));
    sWhere2 := sWhere2 + ' AND ub_cpostal = ' + SqlValue(Trim(edCPostal.Text));
  end;

  if Trim(edCPABusqueda.Text) <> '' then
  begin
    sWhere1 := sWhere1 + ' AND pa_cpa = ' + SqlValue(Trim(edCPABusqueda.Text));
    sWhere2 := sWhere2 + ' AND 1 = 2';
  end;

  if not edCalleDesde.IsEmpty then
    sWhere1 := sWhere1 + ' AND pa_desde >= ' + SqlValue(edCalleDesde.Value);

  if not edCalleHasta.IsEmpty then
    sWhere1 := sWhere1 + ' AND pa_hasta <= ' + SqlValue(edCalleHasta.Value);

  if not edAlturaBusqueda.IsEmpty then
    sWhere1 := sWhere1 + ' AND ' + SqlValue(edAlturaBusqueda.Value) + ' BETWEEN pa_desde AND pa_hasta ';

  if not edAlturaBusqueda.IsEmpty and chkControlParImpar.Checked then
    sWhere1 := sWhere1 + ' AND ((MOD( ' + SqlValue(edAlturaBusqueda.Value) + ' , 2) = 0 AND MOD(PA_DESDE, 2) = 0) OR (    MOD( ' + SqlValue(edAlturaBusqueda.Value) + ' , 2) = 1 AND MOD(PA_DESDE, 2) = 1)) ';

  sSelect1 := StringReplace(sSelect1, '_WHERE1_', sWhere1, []);
  sSelect2 := StringReplace(sSelect2, '_WHERE2_', sWhere2, []);
  sdqConsulta.SQL.Text :=
    'SELECT *' +
     ' FROM tmp_domicilios' +
    ' WHERE mp_usuario = ' + SqlValue(GetComputerAndUserName) + SortDialog.OrderBy;


  sSql :=
    'DECLARE' +
     ' PRAGMA AUTONOMOUS_TRANSACTION;' +
   ' BEGIN' +
     ' DELETE FROM tmp_domicilios' +
           ' WHERE mp_usuario = ' + SqlValue(GetComputerAndUserName) + ';' +
     ' INSERT INTO tmp_domicilios' +
                 ' (mp_usuario, mp_idcodigospostales, mp_idubicacion, mp_cpostal, mp_cpa, mp_calle, mp_desde, mp_hasta,' +
                 ' mp_localidad, mp_provincia, mp_idprovincia, mp_partido, mp_iddelegacion, mp_iddelegacontrato)' + sSelect1 + ';' +
     ' INSERT INTO tmp_domicilios' +
                 ' (mp_usuario, mp_idcodigospostales, mp_idubicacion, mp_cpostal, mp_cpa, mp_calle, mp_desde, mp_hasta,' +
                 ' mp_localidad, mp_provincia, mp_idprovincia, mp_partido, mp_iddelegacion, mp_iddelegacontrato)' + sSelect2 + ';' +
     ' COMMIT;' +
   ' END;';
  EjecutarSqlST(sSql);


  inherited;

  if sdqConsulta.IsEmpty then
  begin
    InfoHint(btnAceptar2, 'No existen datos para esta selección.');
    VCLExtra.EnableControls([tbPropiedades, tbImprimir, tbExportar, btnAceptar2], False);
  end
  else
    VCLExtra.EnableControls([tbPropiedades, tbImprimir, tbExportar, btnAceptar2]);

  {$IFNDEF VER130}
  AutoColWidths := False;
  AutoColWidths := True;
  {$ELSE}
  DynColWidthsByData(Grid);
  {$ENDIF}
end;

procedure TfrmBusquedaDomicilio.FormCreate(Sender: TObject);
begin
  inherited;

  ShowActived := False;

  {$IFNDEF VER130}
  tbPropiedades.Visible := True;
  AutoColWidths := False;
  AutoColWidths := True;
  {$ENDIF}

  FormStyle := fsNormal;
  fFraDomicilio := nil;
  LoadStrings('SELECT DISTINCT pv_descripcion FROM cpv_provincias ORDER BY 1', cmbProvincia.Items);
  LoadStrings('SELECT DISTINCT pv_descripcion FROM cpv_provincias ORDER BY 1', cbProvincia.Items);
end;

procedure TfrmBusquedaDomicilio.tbLimpiarClick(Sender: TObject);
begin
  edCalleBusqueda.Clear;
  rgCalle.ItemIndex := 1;
  edCalleDesde.Clear;
  edCalleHasta.Clear;
  edCPostal.Clear;
  edCPABusqueda.Clear;
  edLocalidadBusqueda.Clear;
  cmbProvincia.ItemIndex := -1;
  edAlturaBusqueda.Clear;
  chkControlParImpar.Checked := True;

  inherited;
end;

procedure TfrmBusquedaDomicilio.tbPropiedadesClick(Sender: TObject);
begin
  inherited;

  DynColWidthsByData(Grid);
end;

procedure TfrmBusquedaDomicilio.btnAceptar2Click(Sender: TObject);
var
  iUbId: Integer;
  sSql: String;
begin
  Verificar(not sdqConsulta.Active or sdqConsulta.IsEmpty, btnAceptar2, 'Debe seleccionar un registro.');

//  if sdqConsulta.FieldByName('mp_idubicacion').AsInteger = 0 then
  if True then
  begin
    sSql :=
      'SELECT ub_id' +
       ' FROM cub_ubicacion' +
      ' WHERE ub_localidad = :localidad' +
        ' AND ub_cpostal = :cpostal' +
        ' AND ub_provincia = :provincia';
    if sdqConsulta.FieldByName('mp_calle').IsNull then
      sSql := sSql + ' AND ub_calle IS NULL' //antes matcheaba por ub_calle = '' haciendo que no encuentre resultados
    else                        //y luego queria insertarlos generando una Violacion ORACLE en COMUNES.UK_CUB_CA_LOC_CPOST_PRO
      sSql := sSql + ' AND ub_calle = ''' + sdqConsulta.FieldByName('mp_calle').AsString + '''';

    with GetQueryEx(sSql, [sdqConsulta.FieldByName('mp_localidad').AsString,
                           sdqConsulta.FieldByName('mp_cpostal').AsString,
                           sdqConsulta.FieldByName('mp_idprovincia').AsString]) do
    try
      if IsEmpty then
      begin
        sSql := 'SELECT seq_cub_id.NEXTVAL FROM DUAL';
        iUbId := ValorSqlInteger(sSql);

        sSql :=
          'INSERT INTO cub_ubicacion' +
                    ' (ub_id, ub_calle, ub_localidad, ub_cpostal, ub_provincia, ub_fechaactualizacion, ub_usualta, ub_fechaalta)' +
             ' VALUES (:id, :calle, :localidad, :cpostal, :provincia, SYSDATE, :usualta, SYSDATE)';

        if InTransaction then
          EjecutarSqlSTEx(sSql, [iUbId,
                                 sdqConsulta.FieldByName('mp_calle').AsString,
                                 sdqConsulta.FieldByName('mp_localidad').AsString,
                                 sdqConsulta.FieldByName('mp_cpostal').AsString,
                                 sdqConsulta.FieldByName('mp_idprovincia').AsString,
                                 Sesion.UserID])
        else
          EjecutarSqlEx(sSql, [iUbId,
                               sdqConsulta.FieldByName('mp_calle').AsString,
                               sdqConsulta.FieldByName('mp_localidad').AsString,
                               sdqConsulta.FieldByName('mp_cpostal').AsString,
                               sdqConsulta.FieldByName('mp_idprovincia').AsString,
                               Sesion.UserID]);
      end
      else
        iUbId := FieldByName('ub_id').AsInteger;

      // Actualizo el pa_idubicacion..
      if InTransaction then
      begin
        sSql :=
          'UPDATE cpa_codigospostales' +
            ' SET pa_idubicacion = :idubicacion' +
          ' WHERE pa_id = :id';
        EjecutarSqlSTEx(sSql, [iUbId, sdqConsulta.FieldByName('mp_idcodigospostales').AsInteger]);
      end
      else
      begin
        sSql :=
          'UPDATE cpa_codigospostales' +
            ' SET pa_idubicacion = :idubicacion' +
          ' WHERE pa_id = :id';
        EjecutarSqlEx(sSql, [iUbId, sdqConsulta.FieldByName('mp_idcodigospostales').AsInteger]);
      end;
    finally
      Free;
    end;
  end
  else
    iUbId := sdqConsulta.FieldByName('mp_idubicacion').AsInteger;

  if Assigned(fFraDomicilio) then
  begin
    fFraDomicilio.Ubicacion := iUbId;
    fFraDomicilio.CPA := sdqConsulta.FieldByName('mp_cpa').AsString;
    fFraDomicilio.FocusNumero;
    if not edAlturaBusqueda.IsEmpty then
      fFraDomicilio.Numero := edAlturaBusqueda.Text;
   Close;
  end;
end;

procedure TfrmBusquedaDomicilio.GridDblClick(Sender: TObject);
begin
  btnAceptar2Click(nil);
end;

procedure TfrmBusquedaDomicilio.btnAceptarClick(Sender: TObject);
begin
  if Validar and DoABM then
  begin
    // Muestro el registro insertado..
    tbLimpiarClick(nil);
    edCPABusqueda.Text := edCpa.Text;
    tbRefrescarClick(nil);

    fpABM.ModalResult := mrOk;
  end;
end;

end.
