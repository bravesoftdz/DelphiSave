unit unManMEP_EMPRESAPRESTADOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, StdCtrls, ExtCtrls, JvExExtCtrls, JvRadioGroup,
  Mask, ToolEdit, unfraCPR_PRESTADOR, unfraPrestadorAGENDA, unArtFrame,
  unArtDBAwareFrame, unArtDbFrame, unFraEmpresa, unfraEmpresaAGENDA,
  FieldHider, ShortCutControl, Placemnt, artSeguridad, QueryPrint,
  QueryToFile, ExportDialog, SortDlg, DB, SDEngine, FormPanel, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, DBCtrls,
  JvgGroupBox;

type
  TfrmManMEP_EMPRESAPRESTADOR = class(TfrmCustomGridABM)
    pnlFechas: TPanel;
    pnlFiltroEmpresaPrestador: TPanel;
    fraCO_CONTRATO: TfraEmpresaAGENDA;
    fraEP_PRESTADOR: TfraPrestadorAGENDA;
    edEP_VIGENCIADESDEDesde: TDateEdit;
    edEP_VIGENCIAHASTAHasta: TDateEdit;
    lblDesde: TLabel;
    lblHasta: TLabel;
    fraEmpresaABM: TfraEmpresaAGENDA;
    fraPrestadorABM: TfraPrestadorAGENDA;
    edFechaDesde: TDateEdit;
    edFechaHasta: TDateEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    rgFiltroPreferencial: TJvRadioGroup;
    chkBajas: TCheckBox;
    ShortCutControl1: TShortCutControl;
    cmbPreferencial: TComboBox;
    lbl3: TLabel;
    lbl4: TLabel;
    edObservaciones: TMemo;
    rgFiltroAuditoria: TJvRadioGroup;
    chkAuditoria: TCheckBox;
    pnlBottom: TPanel;
    gbAlta: TJvgGroupBox;
    dbtxtEP_USUALTA: TDBText;
    dbtxtEP_FECHAALTA: TDBText;
    JvgGroupBox1: TJvgGroupBox;
    dbtxtEP_USUMODIF: TDBText;
    dbtxtEP_FECHAMODIF: TDBText;
    JvgGroupBox2: TJvgGroupBox;
    dbtxtEP_USUBAJA: TDBText;
    dbtxtEP_FECHABAJA: TDBText;
    JvgGroupBox3: TJvgGroupBox;
    dbtxtEP_USUAUDITADO: TDBText;
    dbtxtEP_FECHAAUDITADO: TDBText;
    dbmmoObservaciones: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure fpAbmBeforeShow(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure ClearData; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
		function DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmManMEP_EMPRESAPRESTADOR: TfrmManMEP_EMPRESAPRESTADOR;

implementation

uses
  AnsiSql, SqlFuncs, CustomDlgs, VCLExtra, unSesion, General, unFiltros,
  unDmPrincipal, DateTimeFuncs, unArt;

{$R *.dfm}

procedure TfrmManMEP_EMPRESAPRESTADOR.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL := sdqConsulta.SQL.Text;
  fraCO_CONTRATO.MostrarMensajeInformacion := False;
  CheckPK       := False;
  Sql.TableName := 'ART.MEP_EMPRESAPRESTADOR';
  FieldBaja     := 'EP_FECHABAJA';
  VCLExtra.LockControls([dbmmoObservaciones], True);
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.ClearControls;
begin
  fraEmpresaABM.Clear;
  fraPrestadorABM.Clear;
  edFechaDesde.Clear;
  edFechaHasta.Clear;
  cmbPreferencial.ItemIndex := -1;
  edObservaciones.Clear;
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.ClearData;
begin
  fraCO_CONTRATO.Clear;
  fraEP_PRESTADOR.Clear;
  edEP_VIGENCIADESDEDesde.Clear;
  edEP_VIGENCIAHASTAHasta.Clear;
  rgFiltroPreferencial.ItemIndex := 0;
  rgFiltroAuditoria.ItemIndex := 0;
  chkBajas.Checked := True;
end;

function TfrmManMEP_EMPRESAPRESTADOR.DoABM: Boolean;
var
  sSQL: String;
  dFechaAux: TDateTime;
begin
  with Sql do
  begin
    Clear;
    if ModoABM = maBaja then
    begin
      PrimaryKey.Add('EP_ID', sdqConsulta.FieldByName('EP_ID').AsInteger);
      Fields.Add('EP_FECHABAJA', exDate);
      Fields.Add('EP_USUBAJA', Sesion.UserID);
      SqlType := stUpdate;
    end else
    begin
      if ModoABM = maAlta then
      begin
        PrimaryKey.AddExpression('EP_ID', 'ART.SEQ_MEP_ID.NEXTVAL');
        Fields.Add('EP_FECHAALTA', exDate);
        Fields.Add('EP_USUALTA', Sesion.UserID);
        SqlType := stInsert;
      end else
      if ModoABM = maModificacion then
      begin
        PrimaryKey.Add('EP_ID', sdqConsulta.FieldByName('EP_ID').AsInteger);
        Fields.Add('EP_FECHAMODIF', exDate);
        Fields.Add('EP_USUMODIF', Sesion.UserID);
        SqlType := stUpdate;
      end;

      Fields.AddInteger('EP_PRESTADOR', fraPrestadorABM.IdPrestador);
      Fields.AddString('EP_CUIT', fraEmpresaABM.CUIT);
      Fields.Add('EP_VIGENCIADESDE', edFechaDesde.Date);
      Fields.AddString('EP_PREFERENCIAL', iif(cmbPreferencial.ItemIndex = 0, 'P', 'N'));
      Fields.AddString('EP_OBSERVACIONES', edObservaciones.Lines.Text);

      sSQL := 'SELECT MIN(ep_vigenciadesde)' +
               ' FROM mep_empresaprestador' +
              ' WHERE ep_prestador = :identificador ' +
                ' AND ep_cuit = :cuit ' +
                ' AND ep_vigenciadesde > :desde ' +
                ' AND ep_fechabaja IS NULL';
      dFechaAux := ValorSQLDateTimeEx(sSQL, [fraPrestadorABM.IdPrestador, fraEmpresaABM.CUIT, TDateTimeEx.Create(edFechaDesde.Date)]);

      if edFechaHasta.Date > 0 then
      begin
        if (dFechaAux > 0) and (dFechaAux > edFechaHasta.Date) then
          Fields.Add('EP_VIGENCIAHASTA', edFechaHasta.Date)
        else
          Fields.Add('EP_VIGENCIAHASTA', dFechaAux)
      end else
      begin
        if (dFechaAux > 0) then
        begin
          dFechaAux := dFechaAux - 1;
          Fields.Add('EP_VIGENCIAHASTA', dFechaAux);
        end;
      end;

      if chkAuditoria.Checked then
      begin
        Fields.Add('EP_FECHAAUDITADO', exDate);
        Fields.AddString('EP_USUAUDITADO', Sesion.UserID);
      end;
    end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.fpAbmBeforeShow(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([fraEmpresaABM, fraPrestadorABM, edFechaDesde, cmbPreferencial], ModoABM = maModificacion);
  VCLExtra.LockControls([chkAuditoria], ((ModoABM = maModificacion) and (not sdqConsulta.FieldByName('EP_FECHAAUDITADO').IsNull)) or (not Seguridad.Activar(chkAuditoria)));
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if AreIn(Field.FullName, ['AUDITADO', 'OBSERVACIONES']) then
  begin
    if Field.AsString = vSI then
      AFont.Color := clNavy
    else
      AFont.Color := clMaroon;
  end;
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.LoadControls;
begin
  with sdqConsulta do
  begin
    fraEmpresaABM.Contrato := FieldByName('CO_CONTRATO').AsInteger;
    fraPrestadorABM.Value := FieldByName('EP_PRESTADOR').AsInteger;
    edFechaDesde.Date := FieldByName('EP_VIGENCIADESDE').AsDateTime;
    edFechaHasta.Date := FieldByName('EP_VIGENCIAHASTA').AsDateTime;
    cmbPreferencial.ItemIndex := iif(FieldByName('EP_PREFERENCIAL').AsString = 'P', 0, 1);
    edObservaciones.Text := FieldByName('EP_OBSERVACIONES').AsString;
    chkAuditoria.Checked := not FieldByName('EP_FECHAAUDITADO').IsNull;
    if FieldByName('EP_FECHAAUDITADO').IsNull then
      chkAuditoria.Caption := 'Haga click aquí para auditar ahora esta relación Empresa / Prestador'
    else
      chkAuditoria.Caption := 'Auditoría aprobada';
  end;
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.RefreshData;
var
  sSQL: String;
begin
  sSQL := iif(chkBajas.Checked, ' AND EP_FECHABAJA IS NULL ' , '');
  case rgFiltroPreferencial.ItemIndex of
    1: sSQL := sSQL + ' AND EP_PREFERENCIAL = ''P''';
    2: sSQL := sSQL + ' AND EP_PREFERENCIAL = ''N''';
  end;
  case rgFiltroAuditoria.ItemIndex of
    1: sSQL := sSQL + ' AND EP_FECHAAUDITADO IS NOT NULL ';
    2: sSQL := sSQL + ' AND EP_FECHAAUDITADO IS NULL ';
  end;  
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + sSQL + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VCLExtra.DynColWidthsByData(Grid);
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.tbEliminarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not sdqConsulta.FieldByName('EP_FECHABAJA').IsNull), nil, 'El registro ya ha sido dado de baja.');
  inherited;
end;

procedure TfrmManMEP_EMPRESAPRESTADOR.tbModificarClick(Sender: TObject);
begin
  Verificar(sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not sdqConsulta.FieldByName('EP_FECHABAJA').IsNull), nil, 'El registro ya ha sido dado de baja.');
  Verificar(sdqConsulta.Active and (not sdqConsulta.IsEmpty) and (not sdqConsulta.FieldByName('EP_VIGENCIAHASTA').IsNull), nil, 'La vigencia de cierre ya ha sido establecida.');
  inherited;
end;

function TfrmManMEP_EMPRESAPRESTADOR.Validar: Boolean;
var
  sSQL: String;
begin
  Verificar(fraEmpresaABM.IsEmpty, fraEmpresaABM.edContrato, 'Debe indicar la empresa.');
  Verificar(fraPrestadorABM.IsEmpty, fraPrestadorABM.edCA_IDENTIFICADOR, 'Debe indicar el prestador.');
  Verificar(fraPrestadorABM.IsEmpty, fraPrestadorABM.edCA_IDENTIFICADOR, 'Debe indicar el prestador.');
  Verificar(edFechaDesde.Date = 0, edFechaDesde, 'Debe indicar la vigencia a partir de la cual se establece la relación.');
  Verificar((edFechaDesde.Date > 0) and (edFechaHasta.Date > 0) and (edFechaDesde.Date > edFechaHasta.Date), edFechaDesde, 'El inicio de la vigencia a partir de la cual se establece la relación no puede ser posterior al cierre de la misma.');
  Verificar(cmbPreferencial.ItemIndex = -1, cmbPreferencial, 'Debe indicar el tipo de relación.');

  // Validaciones para que no se solapen los rangos de vigencia
  sSQL := 'SELECT 1' +
           ' FROM mep_empresaprestador' +
          ' WHERE ep_prestador = :identificador ' +
            ' AND ep_cuit = :cuit ' +
            ' AND ep_vigenciahasta = :desde ' +
            ' AND ep_fechabaja IS NULL';
  Verificar((ModoABM = maAlta) and ExisteSqlEx(sSQL, [fraPrestadorABM.Identificador, fraEmpresaABM.CUIT, TDateTimeEx.Create(edFechaDesde.Date)]), edFechaDesde, 'El valor ingresado en la vigencia desde coincide con una fecha de cierre, por favor, modifíquelo en al menos un día y reintente.');

  sSQL := 'SELECT 1' +
           ' FROM mep_empresaprestador' +
          ' WHERE ep_prestador = :identificador ' +
            ' AND ep_cuit = :cuit ' +
            ' AND :desde BETWEEN ep_vigenciadesde AND NVL(ep_vigenciahasta, SYSDATE + 365) ' +
            ' AND ep_fechabaja IS NULL';
  Verificar((ModoABM = maAlta) and ExisteSqlEx(sSQL, [fraPrestadorABM.Identificador, fraEmpresaABM.CUIT, TDateTimeEx.Create(edFechaDesde.Date)]), edFechaDesde, 'El valor ingresado en la vigencia desde se solapa con un período existente.');

  Result := True;
end;

end.
