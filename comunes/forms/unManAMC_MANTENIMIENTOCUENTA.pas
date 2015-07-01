unit unManAMC_MANTENIMIENTOCUENTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unFraCodigoDescripcion, unFraCodDesc, Mask, PatternEdit, IntEdit,
  AdvGroupBox, AdvOfficeButtons, DBCtrls;

type
  TfrmAMC_MANTENIMIENTOCUENTA = class(TfrmCustomGridABM)
    fraEjecutivo: TfraCodDesc;
    Label1: TLabel;
    edCantidad: TIntEdit;
    Label2: TLabel;
    ShortCutControlHijo: TShortCutControl;
    lbl1: TLabel;
    rgLimiteCapitas: TAdvOfficeRadioGroup;
    edTOPE_CAPITAS: TIntEdit;
    lblInformarA: TLabel;
    edINFORMAR_MAIL: TEdit;
    chkSUSPENDIDO: TCheckBox;
    dbtxtCUENTAS: TDBText;
    lblEmpresas: TLabel;
    chkVerBajas: TCheckBox;
    fraIDEJECUTIVO: TfraCodDesc;
    lbl2: TLabel;
    Label3: TLabel;
    lbEmpresasConCapitas: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure fraEjecutivoedCodigoChange(Sender: TObject);
    procedure fraEjecutivoPropiedadesChange(Sender: TObject);
    procedure fraEjecutivoPropiedadesDBAwareChange(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var
        Background: TColor; Highlight: Boolean);
    procedure rgLimiteCapitasClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  end;

var
  frmAMC_MANTENIMIENTOCUENTA: TfrmAMC_MANTENIMIENTOCUENTA;

implementation

uses VCLExtra, unSesion, SqlFuncs, AnsiSql, unFiltros, CustomDlgs, Math,
  General, Strfuncs, Internet, unGrids, unDmPrincipal;

{$R *.dfm}

procedure TfrmAMC_MANTENIMIENTOCUENTA.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'AGENDA.AMC_MANTENIMIENTOCUENTA';
  FieldBaja := 'MC_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.ClearControls;
begin
  inherited;
  VCLExtra.LockControls([fraEjecutivo], False);
  fraEjecutivo.Propiedades.ExtraCondition := ' AND NOT EXISTS(SELECT 1 ' +
                                                               'FROM agenda.amc_mantenimientocuenta ' +
                                                              'WHERE mc_idejecutivo = ec_id ' +
                                                                'AND mc_fechabaja IS NULL)';
  fraEjecutivo.Clear;
  edCantidad.Clear;
  edTOPE_CAPITAS.Clear;
  edINFORMAR_MAIL.Clear;
  chkSUSPENDIDO.Checked := False;
end;

function TfrmAMC_MANTENIMIENTOCUENTA.DoABM: Boolean;
begin
  Sql.Clear;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add('MC_ID', sdqConsulta.FieldByName('MC_ID').AsInteger);
     Sql.Fields.Add('MC_FECHABAJA', exDate);
     Sql.Fields.Add('MC_USUBAJA', Sesion.UserID);
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddExpression('MC_ID', 'AGENDA.SEQ_AMC_ID.NEXTVAL');
       Sql.Fields.Add('MC_FECHAALTA', exDate);
       Sql.Fields.Add('MC_USUALTA', Sesion.UserID);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('MC_ID', sdqConsulta.FieldByName('MC_ID').AsInteger);
       Sql.Fields.Add('MC_FECHAMODIF', exDate);
       Sql.Fields.Add('MC_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('MC_IDEJECUTIVO', fraEjecutivo.ID);
     Sql.Fields.Add('MC_CANTIDAD', edCantidad.Value);
     Sql.Fields.Add('MC_INFORMAR_MAIL', edINFORMAR_MAIL.Text);
     Sql.Fields.Add('MC_SUSPENDIDO', SqlBoolean(chkSUSPENDIDO.Checked, False));     

     case rgLimiteCapitas.ItemIndex of
       0: Sql.Fields.AddExpression('MC_TOPE_CAPITAS', SQL_NULL);
       1: Sql.Fields.AddInteger('MC_TOPE_CAPITAS', edTOPE_CAPITAS.Value);
     end;
  end;

  Result := inherited DoABM;
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.fraEjecutivoedCodigoChange(Sender: TObject);
begin
  inherited;
  lblEmpresas.Visible := Trim(dbtxtCUENTAS.Caption) > '';
  if fraEjecutivo.IsSelected then
    lbEmpresasConCapitas.Caption := ValorSQLEx('SELECT /*+ rule*/ COUNT(*) ' +
                                                 'FROM aco_contrato ' +
                                                'WHERE co_idejecutivo = :IDEJECUTIVO ' +
                                                  'AND co_estado = :ESTADO ' +
                                                  'AND co_fecharecepcion < TRUNC (SYSDATE) - 180 ' +
                                                  'AND co_ultimoperiodomayorcero >= TO_CHAR (ADD_MONTHS (SYSDATE, -13), ''YYYYMM'')', [fraEjecutivo.Id, '1'])
  else
    lbEmpresasConCapitas.Caption := '';
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.fraEjecutivoPropiedadesChange(Sender: TObject);
begin
  inherited;
  fraEjecutivoedCodigoChange(nil);
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.fraEjecutivoPropiedadesDBAwareChange(Sender: TObject);
begin
  inherited;
  fraEjecutivo.PropiedadesDBAwareChange(Sender);
  fraEjecutivoedCodigoChange(nil);
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.GridGetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if {AreIn(Field.FieldName, ['MC_SUSPENDIDO']) and} (sdqConsulta.FieldByName('MC_SUSPENDIDO').AsString = 'S') then
  begin
    AFont.Color := clMaroon;
    AFont.Style := AFont.Style + [fsItalic];
  end;
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.LoadControls;
begin
  fraEjecutivo.Propiedades.ExtraCondition := '';
  VCLExtra.LockControls([fraEjecutivo], True);
  with sdqConsulta do
  begin
    fraEjecutivo.Codigo := FieldByName('idejecutivo').AsString;
    edCantidad.Value := FieldByName('cantidad').AsInteger;
    edTOPE_CAPITAS.Value := FieldByName('mc_tope_capitas').AsInteger;
    edINFORMAR_MAIL.Text := FieldByName('mc_informar_mail').AsString;
    chkSUSPENDIDO.Checked := FieldByName('mc_suspendido').AsString = 'S';
    rgLimiteCapitas.ItemIndex := FieldByName('mc_tope_capitas').AsInteger or 0;
    rgLimiteCapitasClick(nil);       
  end;
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + iif(chkVerBajas.Checked, ' AND mc_fechabaja IS NULL ', '') + SortDialog.OrderBy;
  inherited RefreshData;
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.rgLimiteCapitasClick(Sender: TObject);
begin
  inherited;
  VCLExtra.LockControls([edTOPE_CAPITAS], rgLimiteCapitas.ItemIndex = 0);
end;

procedure TfrmAMC_MANTENIMIENTOCUENTA.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DynColWidthsByData(Grid);
  Grid.ColumnByField['CONTACTOS_HOY'].Width := 55;
  Grid.ColumnByField['CONTACTOS'].Width := 73;
  Grid.ColumnByField['CANTIDAD_EMPRESAS_CON_CAPITAS'].Width := 54;
  Grid.ColumnByField['CANTIDAD_EMPRESAS'].Width := 54;
  Width := Min(Screen.Width, GetColumnWidths(Grid, True));
end;

function TfrmAMC_MANTENIMIENTOCUENTA.Validar: Boolean;
begin
  Verificar(fraEjecutivo.IsEmpty, fraEjecutivo.edCodigo, 'Debe completar el ejecutivo de cuentas.');
  Verificar(fraEjecutivo.sdqDatos.FieldByName('EC_USUARIO').IsNull, fraEjecutivo.edCodigo, 'El ejecutivo seleccionado no posee asociado un usuario de la ART, debe revisar la configuración del ejecutivo si desea emplearlo para esta campaña.');
  Verificar(edCantidad.IsEmpty, edCantidad, 'Debe indicar la cantidad máxima diaria de tareas que se generarán en el SIC.');
  Verificar((not IsEmptyString(edINFORMAR_MAIL.Text)) and (not IsEMails(edINFORMAR_MAIL.Text)), edINFORMAR_MAIL, 'Debe ingresar una o varias direcciones de correo válidas.');    
  Result := True;
end;

end.
