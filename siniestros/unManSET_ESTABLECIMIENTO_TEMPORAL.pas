unit unManSET_ESTABLECIMIENTO_TEMPORAL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, Mask, JvExMask, JvToolEdit, JvMaskEdit,
  JvDBControls, unFraDomicilio, Buttons;

type
  TfrmManSET_ESTABLECIMIENTO_TEMPORAL = class(TfrmCustomGridABM)
    grpEmpresa: TGroupBox;
    fraEmpresa: TfraEmpresa;
    grpEstablecimientoTemporal: TGroupBox;
    lbValidacionCUIT: TLabel;
    Label1: TLabel;
    edNombre: TEdit;
    fraDomicilio: TfraDomicilio;
    edTelefonos: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edObservaciones: TEdit;
    mskCUIT_EstTemp: TMaskEdit;
    CUIT: TLabel;
    Label4: TLabel;
    mskNroEstab: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure mskCUIT_EstTempExit(Sender: TObject);
  private
    FSQL: String;
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function  Validar : Boolean; override;
		function  DoABM: Boolean; override;
		procedure RefreshData; override;
  public
   {}
  end;

var
  frmManSET_ESTABLECIMIENTO_TEMPORAL: TfrmManSET_ESTABLECIMIENTO_TEMPORAL;

implementation

uses
  CUIT, unFiltros, VCLExtra, unSesion, SqlFuncs, unDmPrincipal, CustomDlgs;

{$R *.dfm}

procedure TfrmManSET_ESTABLECIMIENTO_TEMPORAL.FormCreate(Sender: TObject);
begin
  inherited;
  SQL.TableName := 'SIN.SET_ESTABLECIMIENTO_TEMPORAL';
  FieldBaja := 'ET_FECHABAJA';
  FSQL := sdqConsulta.SQL.Text;
  lbValidacionCUIT.Caption := '';
end;

procedure TfrmManSET_ESTABLECIMIENTO_TEMPORAL.LoadControls;
begin
  lbValidacionCUIT.Caption   := '';
  fraEmpresa.mskCUIT.Text    := sdqConsulta.FieldByName('ET_CUIT').AsString;
  fraEmpresa.cmbRSocial.Text := sdqConsulta.FieldByName('NOMEMPRESA').AsString;
  fraEmpresa.edContrato.Text := sdqConsulta.FieldByName('CO_CONTRATO').AsString;
  mskCUIT_EstTemp.Text       := sdqConsulta.FieldByName('ET_CUIT_TEMPORAL').AsString;
  edNombre.Text              := sdqConsulta.FieldByName('NOMBRE_ESTABLTEMP').AsString;
  mskNroEstab.Text           := sdqConsulta.FieldByName('ET_NROESTABLECI').AsString;
  with fraDomicilio do
  begin
    Calle        := sdqConsulta.FieldByName('ET_CALLE').AsString;
    Numero       := sdqConsulta.FieldByName('ET_NUMERO').AsString;
    Piso         := sdqConsulta.FieldByName('ET_PISO').AsString;
    Departamento := sdqConsulta.FieldByName('ET_DEPARTAMENTO').AsString;
    CodigoPostal := sdqConsulta.FieldByName('ET_CPOSTAL').AsString;
    Localidad    := sdqConsulta.FieldByName('ET_LOCALIDAD').AsString;
    Provincia    := sdqConsulta.FieldByName('PROVINCIA').AsString;
  end;
  edTelefonos.Text     := sdqConsulta.FieldByName('ET_TELEFONOS').AsString;
  edObservaciones.Text := sdqConsulta.FieldByName('ET_OBSERVACIONES').AsString;
  VCLExtra.LockControls(fraEmpresa, True);
end;

procedure TfrmManSET_ESTABLECIMIENTO_TEMPORAL.ClearControls;
begin
  inherited;
  fraEmpresa.Clear;
  mskCUIT_EstTemp.Clear;
  edNombre.Clear;
  fraDomicilio.Clear;
  edTelefonos.Clear;
  edObservaciones.Clear;
  mskNroEstab.Clear;
  VCLExtra.LockControls(fraEmpresa, False);
  lbValidacionCUIT.Caption := '';
end;

function TfrmManSET_ESTABLECIMIENTO_TEMPORAL.DoABM: Boolean;
var iProv: integer;
begin
  Sql.Clear ;
  if ModoABM = maBaja then
  begin
     Sql.PrimaryKey.Add( 'ET_ID', sdqConsulta.FieldByName('ET_ID').AsInteger );
     Sql.Fields.Add( 'ET_FECHABAJA', DBDateTime );
     Sql.Fields.Add( 'ET_USUBAJA', Sesion.UserID );
     Sql.SqlType := stUpdate;
  end else
  begin
     if ModoABM = maAlta then
     begin
       Sql.PrimaryKey.AddExpression('ET_ID', 'SIN.SEQ_SET_ID.NEXTVAL');
       Sql.Fields.Add('ET_FECHAALTA', DBDateTime);
       Sql.Fields.Add('ET_USUALTA', Sesion.UserID);
       Sql.Fields.Add('ET_CUIT', fraEmpresa.CUIT);
       Sql.SqlType := stInsert;
     end else
     if ModoABM = maModificacion then
     begin
       Sql.PrimaryKey.Add('ET_ID', sdqConsulta.FieldByName('ET_ID').AsInteger);
       Sql.Fields.Add('ET_FECHAMODIF', DBDateTime);
       Sql.Fields.Add('ET_USUMODIF', Sesion.UserID);
       Sql.SqlType := stUpdate;
     end;

     Sql.Fields.Add('ET_NROESTABLECI', mskNroEstab.Text);
     Sql.Fields.Add('ET_NOMBRE', edNombre.Text);
     Sql.Fields.Add('ET_CUIT_TEMPORAL', mskCUIT_EstTemp.Text);
     Sql.Fields.Add('ET_CALLE', fraDomicilio.Calle);
     Sql.Fields.Add('ET_NUMERO', fraDomicilio.Numero);
     Sql.Fields.Add('ET_PISO', fraDomicilio.Piso);
     Sql.Fields.Add('ET_DEPARTAMENTO', fraDomicilio.Departamento);
     Sql.Fields.Add('ET_LOCALIDAD', fraDomicilio.Localidad);
     Sql.Fields.Add('ET_CPOSTAL', fraDomicilio.CodigoPostal);

     iProv := ValorSqlEx('SELECT pv_codigo FROM art.cpv_provincias ' +
                         ' WHERE pv_descripcion = :prov', [fraDomicilio.Provincia]);

     Sql.Fields.Add('ET_PROVINCIA', iProv);

     Sql.Fields.Add('ET_TELEFONOS', Trim(edTelefonos.Text));
     Sql.Fields.Add('ET_OBSERVACIONES', Trim(edObservaciones.Text));
  end;

  Result := inherited DoABM;
end;

procedure TfrmManSET_ESTABLECIMIENTO_TEMPORAL.RefreshData;
begin
  sdqConsulta.SQL.Text := FSQL + DoFiltro(pnlFiltros) + SortDialog.OrderBy;
  inherited RefreshData;
end;

function TfrmManSET_ESTABLECIMIENTO_TEMPORAL.Validar: Boolean;
begin
  Verificar(Trim(fraEmpresa.mskCUIT.Text) = '', fraEmpresa, 'Debe completar los datos de la Empresa');
  Verificar(Trim(mskCUIT_EstTemp.Text)='', mskCUIT_EstTemp, 'Debe completar el Cuit del Establecimiento Temporal');
  Verificar(lbValidacionCUIT.Caption = 'û', mskCUIT_EstTemp, 'El Cuit del Establecimiento Temporal no es válido');
  Verificar(Trim(edNombre.Text) = '', edNombre, 'Debe completar el Nombre del Establecimiento Temporal');
  Verificar(Trim(mskNroEstab.Text)='', mskNroEstab, 'Debe completar el Nro de Establecimiento');
  Verificar(fraDomicilio.IsEmpty, fraDomicilio, 'Faltan completar datos del Domicilio del Establecimiento');

  Result := True;
end;

procedure TfrmManSET_ESTABLECIMIENTO_TEMPORAL.mskCUIT_EstTempExit(Sender: TObject);
begin
  lbValidacionCUIT.Caption := '';
  if (Length(Trim(mskCUIT_EstTemp.Text)) = 11) and IsCuit(mskCUIT_EstTemp.Text) then
  begin
    lbValidacionCUIT.Caption    := 'ü';  // Tilde  (valido)
    lbValidacionCUIT.Font.Color := clTeal;
  end else
  if (Length(Trim(mskCUIT_EstTemp.Text)) > 0) then
  begin
    lbValidacionCUIT.Caption    := 'û';  // Cruz  (no valido)
    lbValidacionCUIT.Font.Color := clRed;
  end;
end;

end.
