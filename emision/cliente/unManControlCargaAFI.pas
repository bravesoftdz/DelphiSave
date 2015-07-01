unit unManControlCargaAFI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PatternEdit, IntEdit, Mask, ToolEdit,
  DateComboBox, unFraCodigoDescripcion, CurrEdit, Login, artDbLogin,
  unFraCodDesc, unFraStaticCodigoDescripcion, unFraStaticCTB_TABLAS,
  GroupCheckBox, JvExControls, JvComponent, JvEnterTab;

type
  TfrmManControlCargaAFI = class(TfrmCustomGridABM)
    edFA_INICIOACTIVIDAD: TDateComboBox;
    edFA_MASA: TCurrencyEdit;
    edCO_VIGENCIADESDEDesde: TDateComboBox;
    edCO_VIGENCIAHASTAHasta: TDateComboBox;
    fraCO_CONTRATO: TfraEmpresa;
    fraEmpresa: TfraEmpresa;
    fraEM_SECTOR: TfraStaticCTB_TABLAS;
    fraEM_SUSS: TfraStaticCTB_TABLAS;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblEmpleados: TLabel;
    lbInicioActiv: TLabel;
    lbMasa: TLabel;
    lbSector: TLabel;
    edFA_INICIOACTIVIDADDesde: TDateComboBox;
    Label4: TLabel;
    chkGroup: TCheckGroup;
    lbErrSUSS: TLabel;
    lbErrSector: TLabel;
    lbErrEmpleados: TLabel;
    lbErrMasaData: TLabel;
    _lbErrInicio: TLabel;
    lbErrMasaTope: TLabel;
    edFA_EMPLEADOS: TIntEdit;
    lbSisSUSS: TLabel;
    lbSisTopeMasa: TLabel;
    lbSisSector: TLabel;
    lbSisEmpleados: TLabel;
    lbSisMasa: TLabel;
    _lbSisIniActiv: TLabel;
    edFA_VIGENCIADESDE: TDateComboBox;
    lbErrMsgData: TLabel;
    lbErrMsgMasa: TLabel;
    lbVigenciDesde: TLabel;
    edFA_INICIOEMPLEADOR: TDateComboBox;
    Label7: TLabel;
    lbErrIniEmpleador: TLabel;
    lbErrIniActividad: TLabel;
    ShortCutControl1: TShortCutControl;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure btnAceptarClick(Sender: TObject);
    procedure edFA_EMPLEADOSExit(Sender: TObject);
    procedure edFA_INICIOACTIVIDADExit(Sender: TObject);
    procedure edFA_MASAExit(Sender: TObject);
    procedure edFA_INICIOEMPLEADORExit(Sender: TObject);
    procedure fraEM_SECTORExit(Sender: TObject);
    procedure fraEM_SUSSExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure fpAbmShow(Sender: TObject);
    procedure fraEmpresaExit(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure edFA_EMPLEADOSKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFA_EMPLEADOSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fraEM_SUSSEnter(Sender: TObject);
    procedure fraEM_SECTOREnter(Sender: TObject);
  private
    FTopeMasa: Extended;
    FCuerpoMail: string;
    FSQL: widestring;
    FDiferencias: TStringList;
    function ExisteDato(const NombreCampo: string; Dato: string): Boolean;
    procedure PreEnvioMail(const CodLista: string; CodListaDescrip: string);
    procedure EnviarMail(const CodLista: string);
  public
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar: Boolean; override;
    procedure CargarDiferencia(const Campo, DatoCarga, DescripClave: string; const SQLTipoFrame:
        boolean; const lbError, lbSisData: TLabel);
    procedure BorrarDiferencia(const campo: string; const lbError, lbSis: TLabel);
    function DatoBDFrame(const campo, DescripClave: string): string;
    function DatoBDNoFrame(const Campo: string): string;
    procedure LabelsPie;
    procedure EnableControls(const lock: boolean);
    procedure MostrarSisLabels(isVisible: boolean);
  end;

var
  frmManControlCargaAFI: TfrmManControlCargaAFI;
  bAskMandaMail: Boolean;

implementation

uses
  unDmPrincipal, unCustomConsulta, SqlFuncs, unComunesEmisionCliente, CustomDlgs,
  unFiltros, unSesion, DateTimeFuncs, AnsiSql, General, unComunes;

{$R *.dfm}

function TfrmManControlCargaAFI.DatoBDFrame(const Campo, DescripClave: string): string;
begin
  Result :=
      ValorSqlEx(
            'SELECT ''('' || ' + Campo + ' || '') - '' || tb_descripcion ' +
            '  FROM aco_contrato, '+
            '       aem_empresa, '+
            '       art.ctb_tablas '+
            ' WHERE co_contrato = :contrato' +
            '   AND co_idempresa = em_id '+
            '   AND tb_codigo = ' + Campo +
            '   AND tb_clave = :DescripClave',
            [fraEmpresa.Contrato, DescripClave]
        );
end;

function TfrmManControlCargaAFI.DatoBDNoFrame(const campo: string): string;
begin
  Result :=
      ValorSql(
            'SELECT ' + Campo +
            '  FROM aco_contrato,   '+
            '       aem_empresa     '+
            ' WHERE co_contrato =  ' + fraEmpresa.edContrato.Text +
            ' AND co_idempresa = em_id'
      );
end;

procedure TfrmManControlCargaAFI.CargarDiferencia(const Campo, DatoCarga, DescripClave: string;
    const SQLTipoFrame: boolean; const lbError, lbSisData: TLabel);
var
  DatoBD: string;
begin
  {para controles que pertenecen a un frame}
  if not SQLTipoFrame then
    if not (campo = TOPEMASA) then
      DatoBD := DatoBDNoFrame(Campo)
    else
      DatoBD := FloatToStr(FTopeMasa)

  else
    {para controles que no pertenecen a un frame}
    DatoBD := DatoBDFrame(Campo, DescripClave);

  {borra para no duplicar}
  BorrarDiferencia(Campo, lbError, lbSisData);

  {y la carga}
  FDiferencias.Add(
      Campo + '=' +
      'Dato Afiliación: (' + DescripClave + ') ' + DatoBD + chr(9) +
      'Dato Emisión: ' + DatoCarga
  );

  lbSisData.Caption :=
      IIF(lbSisData.Name = lbSisTopeMasa.Name,
          '(TOPE) ' + DatoBD,
          IIF(DatoBD = '', DATO_DEL_SISTEMA + 'VACIO', DATO_DEL_SISTEMA + DatoBD)
      );

  if (lbSisData.Name = 'lbSisIniActiv') and (edFA_INICIOACTIVIDAD.IsEmpty) then
    edFA_INICIOACTIVIDAD.Date := StrToDate(DatoBD)
  else begin
    lbSisData.Font.Color := clRed;
    lbError.Visible := True;
    LabelsPie;
  end;

  lbSisData.Visible := True;
end;

procedure TfrmManControlCargaAFI.edFA_EMPLEADOSExit(Sender: TObject);
begin

    if not ExisteDato(CO_TOTEMPLEADOS, edFA_EMPLEADOS.Text) then
      CargarDiferencia(
          CO_TOTEMPLEADOS,
          edFA_EMPLEADOS.Text,
          'Total Empleados',
          False,
          lbErrEmpleados,
          lbSisEmpleados)
    else
      BorrarDiferencia(CO_TOTEMPLEADOS, lbErrEmpleados, lbSisEmpleados);
end;

procedure TfrmManControlCargaAFI.edFA_MASAExit(Sender: TObject);
begin
  if not ExisteDato(CO_MASATOTAL, StringReplace(edFA_MASA.Text, ',', '.', [rfReplaceAll])) then
    CargarDiferencia(
        CO_MASATOTAL,
        edFA_MASA.Text,
        'Masa',
        False,
        lbErrMasaData,
        lbSisMasa)
  else
    BorrarDiferencia(CO_MASATOTAL, lbErrMasaData, lbSisMasa);

      FTopeMasa :=
      ValorSqlExtended(
            Format(SQL_FUNC_TOPEPERIODO,
                [ fraEmpresa.Contrato,
                  QuotedStr(
                      FormatDateTime('yyyymm', edFA_VIGENCIADESDE.Date)
                  )
                ]
            )
      );

  lbSisTopeMasa.Left :=  lbSisMasa.Left + lbSisMasa.Width + 10;
  lbSisTopeMasa.Caption := '(TOPE) ' + FloatToStr(FTopeMasa);

  if not (edFA_EMPLEADOS.Value = 0) then
  begin
    if FTopeMasa < (edFA_MASA.Value / edFA_EMPLEADOS.Value) then
    begin
      CargarDiferencia(
          TOPEMASA,
          edFA_MASA.Text,
          'Tope Masa',
          False,
          lbErrMasaTope,
          lbSisTopeMasa
      );

      if not lbErrMasaData.Visible then
        lbErrMasaTope.Left := 188
      else
        lbErrMasaTope.Left := 204;
    end
    else
      BorrarDiferencia(TOPEMASA, lbErrMasaTope, lbSisTopeMasa);

  end;

end;

procedure TfrmManControlCargaAFI.FormCreate(Sender: TObject);
begin
  inherited;
  bAskMandaMail := False;
  FDiferencias := TStringList.Create;
  FSQL := sdqConsulta.SQL.Text;
  FieldBaja := FA_FECHABAJA;
  fraEM_SECTOR.Clave    := 'SECT';  {Static}
  fraEM_SUSS.Clave      := 'SUSS';  {Static}
  Sql.Clear;
end;

function TfrmManControlCargaAFI.DoABM: Boolean;
  procedure AddFieldForInsUpdt;
  begin
    Sql.Fields.Add(FA_CONTRATO, fraEmpresa.edContrato.Value);
    Sql.Fields.Add(FA_SUSS, fraEM_SUSS.edCodigo.Text);
    Sql.Fields.Add(FA_SECTOR, fraEM_SECTOR.edCodigo.Text);
    Sql.Fields.Add(FA_EMPLEADOS, edFA_EMPLEADOS.Value);
    Sql.Fields.Add(FA_MASA, edFA_MASA.Value);
    if edFA_INICIOACTIVIDAD.Date > 0 then
      Sql.Fields.Add(FA_INICIOACTIVIDAD, edFA_INICIOACTIVIDAD.Date, dmDate)
    else
      Sql.Fields.Add(FA_INICIOACTIVIDAD, exNull);

    if edFA_INICIOEMPLEADOR.Date > 0 then
      Sql.Fields.Add(FA_INICIOEMPLEADOR, edFA_INICIOEMPLEADOR.Date, dmDate)
    else
      Sql.Fields.Add(FA_INICIOEMPLEADOR, exNull);

  end;
begin
  Sql.Clear ;
  Sql.TableName := TBL_FORMULARIOAFI;

  case ModoABM of
    maBaja:
        begin
          Sql.PrimaryKey.Add(FA_ID, sdqConsulta.FieldByName(FA_ID).AsInteger);
          Sql.Fields.Add(FA_FECHABAJA, Date);
          Sql.Fields.Add(FA_USUBAJA, Sesion.UserID);
          Sql.SqlType := stUpdate;
        end;
    maAlta:
        begin
          Sql.PrimaryKey.AddInteger(FA_ID, GetSecNextVal(EMI_SEQ_IFA_ID));
          Sql.Fields.Add(FA_FECHAALTA, Date);
          Sql.Fields.Add(FA_USUALTA, Sesion.UserID);
          Sql.Fields.Add(FA_FECHABAJA, exNull);
          Sql.Fields.Add(FA_USUBAJA, exNull);
          AddFieldForInsUpdt;
          Sql.SqlType := stInsert;
        end;
    maModificacion:
        begin
          Sql.PrimaryKey.ADD(FA_ID, sdqConsulta.FieldByName(FA_ID).AsInteger);
          Sql.Fields.Add(FA_FECHABAJA, exNull);
          Sql.Fields.Add(FA_USUBAJA, exNull);
          Sql.Fields.Add(FA_FECHAMODIF, Date);
          Sql.Fields.Add(FA_USUMODIF, Sesion.UserID);
          AddFieldForInsUpdt;
          Sql.SqlType := stUpdate;
        end;
  end;

  BeginTrans(True);
  try
    Result := inherited DoABM;
    if Result then begin
      if (Sql.Fields.FieldByName[FA_FECHABAJA].Value = 0) then
      begin
        if (not (FDiferencias.IndexOfName(EM_SUSS) = -1)) or
            (not (FDiferencias.IndexOfName(EM_SECTOR) = -1)) then
          PreEnvioMail(MAIL_CODDIF, 'Diferencia en Datos'); //100

        if (not (FDiferencias.IndexOfName(TOPEMASA) = -1)) then
          PreEnvioMail(MAIL_CODPER, 'Tope Masa Salarial excedido'); //101

      end;

      CommitTrans(True);
      bAskMandaMail := False;
    end;
  except
    Rollback(True);
    bAskMandaMail := False;
    Result := False;
  end;
end;

procedure TfrmManControlCargaAFI.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Text :=
      FSQL + DoFiltro(pnlFiltros) +
      iif(chkGroup.Checked[0], ' AND NOT ' + EM_SUSS          +'='+ FA_SUSS           , '') +
      iif(chkGroup.Checked[1], ' AND NOT ' + EM_SECTOR        +'='+ FA_SECTOR         , '') +
      iif(chkGroup.Checked[2], ' AND NOT ' + CO_TOTEMPLEADOS  +'='+ FA_EMPLEADOS      , '') +
      iif(chkGroup.Checked[3], ' AND NOT ' + CO_MASATOTAL     +'='+ FA_MASA           , '') +
      iif(chkGroup.Checked[4], ' AND     ' + CO_VIGENCIADESDE +'<'+ FA_INICIOACTIVIDAD, '') +
      iif(chkGroup.Checked[5], ' AND NOT ' + CO_VIGENCIADESDE +'>'+ FA_INICIOEMPLEADOR, '') +
      SortDialog.OrderBy;
    Grid.DataSource := dsConsulta;
    dsConsulta.Enabled := True;
  inherited;
end;

procedure TfrmManControlCargaAFI.fpAbmShow(Sender: TObject);
begin
  if not (ModoABM = maAlta) then begin
    EnableControls(True);
    LoadControls;
    fraEM_SUSSExit(Sender);
    fraEM_SECTORExit(Sender);
    edFA_EMPLEADOSExit(Sender);
    edFA_MASAExit(Sender);
    edFA_INICIOACTIVIDADExit(Sender);
    edFA_INICIOEMPLEADORExit(Sender);
    fraEmpresa.ReadOnly := True;
    MostrarSisLabels(True);
    fraEM_SUSS.edCodigo.SetFocus;
  end else
  begin
    fraEmpresa.ReadOnly := False;
    fraEmpresa.mskCUIT.SetFocus;
    EnableControls(False);
    MostrarSisLabels(False);
  end;
end;

procedure TfrmManControlCargaAFI.LoadControls;
begin
  fraEmpresa.Contrato := sdqConsulta.FieldByName(FA_CONTRATO).AsInteger;
  fraEmpresa.mskCUIT.Text := sdqConsulta.FieldByName(EM_CUIT).AsString;
  fraEmpresa.cmbRSocial.Text := sdqConsulta.FieldByName(EM_NOMBRE).AsString;
  fraEmpresa.edContrato.Text := sdqConsulta.FieldByName(FA_CONTRATO).AsString;

  fraEM_SUSS.edCodigo.Text := sdqConsulta.FieldByName(FA_SUSS).AsString;
  fraEM_SUSS.cmbDescripcion.Text := sdqConsulta.FieldByName(FA_SUSSDESCRIP).AsString;

  fraEM_SECTOR.edCodigo.Text := sdqConsulta.FieldByName(FA_SECTOR).AsString;
  fraEM_SECTOR.cmbDescripcion.Text := sdqConsulta.FieldByName(FA_SECTORDESCRIP).AsString;

  edFA_EMPLEADOS.Value := sdqConsulta.FieldByName(FA_EMPLEADOS).AsInteger;
  edFA_MASA.Value := sdqConsulta.FieldByName(FA_MASA).AsCurrency;
  edFA_INICIOACTIVIDAD.Date := sdqConsulta.FieldByName(FA_INICIOACTIVIDAD).AsDateTime;
  edFA_VIGENCIADESDE.Date := sdqConsulta.FieldByName(CO_VIGENCIADESDE).AsDateTime;
  edFA_INICIOEMPLEADOR.Date := sdqConsulta.FieldByName(FA_INICIOEMPLEADOR).AsDateTime;

  lbSisSUSS.Caption := DATO_DEL_SISTEMA + fraEM_SUSS.Codigo + ' - ' + fraEM_SUSS.Descripcion;
  lbSisSector.Caption := DATO_DEL_SISTEMA +fraEM_SECTOR.Codigo + ' - ' + fraEM_SECTOR.Descripcion;
  lbSisEmpleados.Caption := DATO_DEL_SISTEMA + edFA_EMPLEADOS.Text;
  lbSisMasa.Caption := DATO_DEL_SISTEMA + edFA_MASA.Text;
end;

procedure TfrmManControlCargaAFI.ClearControls;
begin
  fraEmpresa.Clear;
  edFA_VIGENCIADESDE.ClearDate;
  fraEM_SUSS.Clear;
  fraEM_SECTOR.Clear;
  edFA_EMPLEADOS.Clear;
  edFA_MASA.Clear;
  edFA_INICIOACTIVIDAD.ClearDate;
  edFA_INICIOEMPLEADOR.ClearDate;
end;

function TfrmManControlCargaAFI.Validar: Boolean;
begin
  Result :=
      (Verificar(
          Trim(fraEmpresa.CUIT) = EmptyStr, fraEmpresa.mskCUIT, fraEmpresa.edContrato.Hint))
          and
      (Verificar(
          Trim(fraEM_SUSS.Codigo) = EmptyStr, fraEM_SUSS.edCodigo, fraEM_SUSS.edCodigo.Hint))
          and
      (Verificar(
          Trim(fraEM_SECTOR.Codigo) = EmptyStr, fraEM_SECTOR.edCodigo, fraEM_SECTOR.edCodigo.Hint))
          and
      (Verificar(
          edFA_EMPLEADOS.IsEmpty, edFA_EMPLEADOS, edFA_EMPLEADOS.Hint))
          and
      (Verificar(
          not (edFA_MASA.Value > 0), edFA_MASA, edFA_MASA.Hint));

end;

{verifica la existencia del dato ingresado en el form contra AFI.ACO_CONTRATO para el contrato}
function TfrmManControlCargaAFI.ExisteDato(const NombreCampo: string; Dato: string): Boolean;
begin
  Result := False;
  if (not (Trim(Dato) = EmptyStr) and not (dato = 'NULL')) then
    if ValorSqlInteger(
            Format(
                SQL_EXISTE_DATO,
                [fraEmpresa.Contrato, NombreCampo, Dato]
            )
       ) > 0
    then
      Result := True;
end;

procedure TfrmManControlCargaAFI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FDiferencias);
end;

procedure TfrmManControlCargaAFI.PreEnvioMail(const CodLista: string; CodListaDescrip: string);
begin

  if (ModoABM = maAlta) or (bAskMandaMail) then
    EnviarMail(CodLista)
  else begin
    if (MessageDlg(Format(DLG_ENVIAR, [CodListaDescrip]), mtWarning, [mbYes, mbNo], 0) in [mrYes]) then
      EnviarMail(CodLista);

    bAskMandaMail := True;
  end;

  FCuerpoMail := EmptyStr;
end;


procedure TfrmManControlCargaAFI.EnviarMail(const CodLista: string);
var
  EncaMail, CuerpoMailTmp: string;

  {limpia el nombre del campo de la tabla del la cadena}
  function LimpiaCampo(cadena: string): string;
  begin
    Result := copy(cadena, pos('=', cadena)+1, Length(cadena));
  end;

begin
  EncaMail := Format(MAIL_ENCA, [fraEmpresa.CUIT, fraEmpresa.Contrato, fraEmpresa.RazonSocial]);

  if CodLista = MAIL_CODDIF then begin {diferencias en datos}
    if FDiferencias.IndexOfName(EM_SUSS) > -1 then begin
      CuerpoMailTmp := FDiferencias.Strings[FDiferencias.IndexOfName(EM_SUSS)];
      FCuerpoMail := FCuerpoMail + LimpiaCampo(CuerpoMailTmp) + LF;
    end;

    if FDiferencias.IndexOfName(EM_SECTOR) > -1 then begin
      CuerpoMailTmp := FDiferencias.Strings[FDiferencias.IndexOfName(EM_SECTOR)];
      FCuerpoMail := FCuerpoMail + LimpiaCampo(CuerpoMailTmp) + LF;
    end;
  end else
  begin {tope masa salarial superado}
    if FDiferencias.IndexOfName(CO_MASATOTAL) > -1 then begin
      CuerpoMailTmp := FDiferencias.Strings[FDiferencias.IndexOfName(TOPEMASA)] + LF;
      FCuerpoMail := FCuerpoMail + LimpiaCampo(CuerpoMailTmp) + LF;
    end;
  end;

  {envía el mail}
  if Trim(FCuerpoMail) > EmptyStr then
    EjecutarStoreST(
         Format(
            SQL_STORE_ENVIA_MAIL,
            [ QuotedStr(Get_DireccionesEnvioMail(CodLista)),
              QuotedStr(EncaMail + LF + FCuerpoMail) ]
         )
    );

end;

procedure TfrmManControlCargaAFI.fpAbmClose(Sender: TObject; var Action: TCloseAction);
var
  i: Word;
begin
  FDiferencias.Clear;
  lbErrMsgData.Visible := False;
  lbErrMsgMasa.Visible := False;
  for i := 0 to frmManControlCargaAFI.ComponentCount -1 do
  begin
    if (Components[i] is TLabel) and
        (
          (copy(Components[i].Name, 1, 5) = 'lbErr') or
          (copy(Components[i].Name, 1, 5) = 'lbSis  ')
        ) then
    begin {corto circuito}
      (Components[i] as TLabel).Visible := False;
    end;
  end;
  ClearControls;
end;

procedure TfrmManControlCargaAFI.fraEM_SECTORExit(Sender: TObject);
begin

  if not ExisteDato(EM_SECTOR, QuotedStr(fraEM_SECTOR.Codigo)) then
    CargarDiferencia(
        EM_SECTOR,
        '(' + fraEM_SECTOR.Codigo + ') - ' + fraEM_SECTOR.cmbDescripcion.Text ,
        'SECT',
        True,
        lbErrSector,
        lbSisSector)
  else
    BorrarDiferencia(EM_SECTOR, lbErrSector, lbSisSector);
  JvEnterAsTab1.EnterAsTab := True;
end;

procedure TfrmManControlCargaAFI.fraEM_SUSSExit(Sender: TObject);
begin

  if not ExisteDato(EM_SUSS, QuotedStr(fraEM_SUSS.Codigo)) then
    CargarDiferencia(
        EM_SUSS,
        '(' + fraEM_SUSS.Codigo + ') - ' + fraEM_SUSS.cmbDescripcion.Text,
        'SUSS',
        True,
        lbErrSUSS,
        lbSisSUSS)
  else
    BorrarDiferencia(EM_SUSS, lbErrSUSS, lbSisSUSS);
  JvEnterAsTab1.EnterAsTab := True;
end;

procedure TfrmManControlCargaAFI.tbLimpiarClick(Sender: TObject);
begin
  inherited;
  fraCO_CONTRATO.Clear;
  edCO_VIGENCIADESDEDesde.Clear;
  edCO_VIGENCIAHASTAHasta.Clear;
  edFA_INICIOACTIVIDADDesde.Clear;
  chkGroup.Clear(False);
end;

procedure TfrmManControlCargaAFI.BorrarDiferencia(const campo: string; const lbError, lbSis: TLabel);
begin
  if FDiferencias.IndexOfName(Campo) > -1 then
      FDiferencias.Delete(FDiferencias.IndexOfName(Campo));

  lbSis.Font.Color := clBlack;
  lbError.Visible := False;
  LabelsPie;

end;

procedure TfrmManControlCargaAFI.btnAceptarClick(Sender: TObject);
var
  bkm: TBookmark;
begin
  inherited;
  if not (grid.DataSource = nil) then begin
    bkm := nil;
    try
      bkm := sdqConsulta.GetBookmark;
      tbRefrescarClick(Sender);
      sdqConsulta.GotoBookmark(bkm);
    finally
      sdqConsulta.FreeBookmark(bkm);
    end;
  end;
end;

procedure TfrmManControlCargaAFI.edFA_INICIOACTIVIDADExit(Sender: TObject);
begin
  if edFA_INICIOACTIVIDAD.Date > edFA_VIGENCIADESDE.Date then begin
    lbErrIniActividad.Caption := MAYOR_VIGENCIA;
    lbErrIniActividad.Visible := True;
  end else
    lbErrIniActividad.Visible := False;
end;


procedure TfrmManControlCargaAFI.edFA_INICIOEMPLEADORExit(Sender: TObject);
begin
  if edFA_VIGENCIADESDE.Date < edFA_INICIOEMPLEADOR.Date then begin
    lbErrIniEmpleador.Caption := MAYOR_VIGENCIA;
    lbErrIniEmpleador.Visible := True;
  end else
    lbErrIniEmpleador.Visible := False
end;

procedure TfrmManControlCargaAFI.fraEmpresaExit(Sender: TObject);
begin
  inherited;
  if not fraEmpresa.IsEmpty then begin
    EnableControls(True);
    edFA_VIGENCIADESDE.Date := ValorSqlDateTimeEx(
        'SELECT a.co_vigenciadesde FROM afi.aco_contrato a WHERE a.co_contrato = :contrato',
        [fraEmpresa.Contrato]
    );
    fraEM_SUSSExit(Sender);
    fraEM_SECTORExit(Sender);
    edFA_EMPLEADOSExit(Sender);
    edFA_MASAExit(Sender);
    edFA_INICIOACTIVIDADExit(Sender);
    edFA_INICIOEMPLEADORExit(Sender);
    edFA_INICIOACTIVIDAD.Text := DatoBDNoFrame(EM_FEINICACTIV);
    lbErrIniActividad.Visible := False;
    lbErrIniEmpleador.Visible := False;
    MostrarSisLabels(True);
    fraEM_SUSS.edCodigo.SetFocus;
  end else
    EnableControls(False);
end;

procedure TfrmManControlCargaAFI.LabelsPie;
begin

  if (FDiferencias.Count = 0)  then
  begin
    lbErrMsgData.Visible := False;
    lbErrMsgMasa.Visible := False;
  end else
  begin
    if FDiferencias.IndexOfName(TOPEMASA) = -1 then
      lbErrMsgMasa.Visible := False
    else
      lbErrMsgMasa.Visible := True;

    if (FDiferencias.IndexOfName(TOPEMASA) = -1) and (FDiferencias.Count > 0) then
      lbErrMsgData.Visible := True;

    if (FDiferencias.IndexOfName(TOPEMASA) > -1) and (FDiferencias.Count > 1) then
      lbErrMsgData.Visible := True;

  end;

end;

procedure TfrmManControlCargaAFI.EnableControls(const lock: boolean);
begin
  edFA_VIGENCIADESDE.Enabled := lock;
  edFA_INICIOACTIVIDAD.Enabled := lock;
  fraEM_SUSS.Enabled := lock;
  fraEM_SECTOR.Enabled := lock;
  edFA_EMPLEADOS.Enabled := lock;
  edFA_MASA.Enabled := lock;
  edFA_INICIOACTIVIDAD.Enabled := lock;
  edFA_INICIOEMPLEADOR.Enabled := lock;
end;

procedure TfrmManControlCargaAFI.MostrarSisLabels(isVisible: boolean);
var
  i: integer;
begin
  for i := 0 to Self.ComponentCount -1 do begin
    if (Self.Components[i] is TLabel)                       {corto circuito}
        and (copy((Self.Components[i] as TLabel).Name, 1, 5) = 'lbSis')
      then
        TWinControl(Self.Components[i]).Visible := isVisible;

  end;
end;

procedure TfrmManControlCargaAFI.edFA_EMPLEADOSKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    key := VK_TAB;
    //SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
  end;
  inherited;
end;

procedure TfrmManControlCargaAFI.edFA_EMPLEADOSKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if (Key = VK_RETURN) then
  begin
    key := VK_TAB;

  end;
  inherited;
end;

procedure TfrmManControlCargaAFI.fraEM_SUSSEnter(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := False;
  inherited;
end;

procedure TfrmManControlCargaAFI.fraEM_SECTOREnter(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := False;
  inherited;                        
end;

end.

