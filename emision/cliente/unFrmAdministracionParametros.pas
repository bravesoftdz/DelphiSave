{-----------------------------------------------------------------------------
 Nombre Unidad: unFrmAdministracionParametros
 Autor:         cchiappero
 Fecha:         10-Sep-2005
 Proposito:     administrar los parámetros que no son de sistemas.
 Versiones:
-----------------------------------------------------------------------------}
unit unFrmAdministracionParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, unArtFrame, unFraCodigoDescripcion,
  unfraCtbTablas, StdCtrls, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl, ArtComboBox,
  ArtDBGrid, ComCtrls, ToolWin, Mask, ToolEdit, DateComboBox,
  unFraParametroValor, VCLExtra;

type
  TfrmAdministracionParametros = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    lblCodigo: TLabel;
    edtDescripcionParametro: TEdit;
    edtCodigoParametro: TEdit;
    cboClaseParametro: TComboBox;
    lblTipoParametro: TLabel;
    edFechaVigenciaDesde: TDateComboBox;
    edFechaVigenciaHasta: TDateComboBox;
    lblFechaVigenciaDesde: TLabel;
    lblVigenciaHasta: TLabel;
    sdqClaseParametro: TSDQuery;
    dsClaseParametro: TDataSource;
    sb: TStatusBar;
    chkParametroObligatorio: TCheckBox;
    fraParametro: TfraParametroValor;
    procedure FormCreate(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure cboClaseParametroChange(Sender: TObject);
  protected
    procedure ClearControls; override;
    function DoABM: Boolean; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
  private
    procedure ControlEditables(Editables: boolean);
    procedure RefrescarParametros;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdministracionParametros: TfrmAdministracionParametros;

implementation

uses unDmEmision, unDmPrincipal, unUtils, unCustomConsulta, unSesion, SqlFuncs, Strfuncs,
  unConstEmision, CustomDlgs, unFuncionesEmision;

{$R *.dfm}
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'pa_fechabaja';
  Sql.TableName := 'EMI.IPA_PARAMETRO';
  CheckPK := False;

  CargarCombo(cboClaseParametro,
     'select cp_id id, cp_descripcion descripcion            ' +
     '  from emi.icp_claseparametro where cp_sistema = ''S'' ');
  cboClaseParametro.ItemIndex := 0;
  RefrescarParametros;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.ClearControls;
begin
  edtCodigoParametro.Clear;
  edtDescripcionParametro.Clear;
  fraParametro.Clear;
  fraParametro.TipoParametro := 'N';
  edFechaVigenciaDesde.Clear;
  edFechaVigenciaHasta.Clear;
  ControlEditables(True);
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionParametros.DoABM: Boolean;
begin
   Sql.Clear ;
   if ModoABM = maBaja Then begin
      if sdqConsulta.FieldByName('pa_obligatorio').asstring = 'S' then
      begin
        if (MessageDlg('El parámetro a sido marcado como obligatorio. ' +
                       'Se finalizará la vigencia de este y '+
                       #13#10+'se generará una parámetro copia de este.'+#13#10+''
                       +#13#10+'¿Continua con la baja del parámetro?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          do_copiarparametro(sdqConsulta.FieldByName('pa_id').AsInteger);
        end;
        //Baja del parámetro actual
        Sql.PrimaryKey.Add( 'pa_id', sdqConsulta.FieldByName('pa_id').AsInteger );
        Sql.Fields.Add( 'pa_fechabaja', exDate );
        Sql.Fields.Add( 'pa_usubaja', Sesion.Usuario );
        Sql.SqlType := stUpdate;
      end;
   end else
   begin
      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.AddExpression( 'pa_id', 'emi.seq_ipa_id.nextval' );
        Sql.Fields.Add( 'pa_fechaalta', exDate );
        Sql.Fields.Add( 'pa_usualta',   Sesion.LoginName );
        Sql.Fields.Add( 'pa_idclaseparametro', GetIdComboByIndex(cboClaseParametro));
        Sql.Fields.Add( 'pa_obligatorio', chkParametroObligatorio.Checked );
        Sql.Fields.Add( 'pa_clave', edtCodigoParametro.Text );
        Sql.Fields.Add( 'pa_descripcion', edtDescripcionParametro.Text );
        Sql.Fields.Add('pa_fechavigenciadesde', edFechaVigenciaDesde.date);
        Sql.Fields.Add( 'pa_idseteo', get_seteoactivo);
        Sql.SqlType := stInsert;
      end
      else Sql.PrimaryKey.Add( 'pa_id', sdqConsulta.FieldByName('pa_id').AsInteger );
      Sql.Fields.Add( 'pa_tipoparametro', fraParametro.TipoParametro );
      Sql.Fields.Add( 'pa_valor', fraParametro.Valor);
      Sql.Fields.Add('pa_fechavigenciahasta', edFechaVigenciaHasta.date, -1, true);
   end;
   Result := inherited DoABM;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.LoadControls;
begin
  edtCodigoParametro.Text      := sdqConsulta.FieldByName('pa_clave').AsString;
  edtDescripcionParametro.Text := sdqConsulta.FieldByName('pa_descripcion').AsString;

  fraParametro.TipoParametro   := sdqConsulta.FieldByName('pa_tipoparametro').AsString;
  fraParametro.Valor           := sdqConsulta.FieldByName('pa_valor').AsString;

  edFechaVigenciaDesde.Date    := sdqConsulta.FieldByName('pa_fechavigenciadesde').AsDateTime;
  edFechaVigenciaHasta.Date    := sdqConsulta.FieldByName('pa_fechavigenciahasta').AsDateTime;
  chkParametroObligatorio.Checked := sdqConsulta.FieldByName('pa_obligatorio').AsString = 'S';
  chkParametroObligatorio.Enabled := false;

  ControlEditables(false);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.tbRefrescarClick(
  Sender: TObject);
begin
  RefrescarParametros;
  inherited;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.cboClaseParametroChange(
  Sender: TObject);
begin
  tbRefrescar.Click;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.RefrescarParametros;
begin
  if cboClaseParametro.ItemIndex > -1 then
  begin
    sdqConsulta.ParamByName('claseparametro').AsInteger :=    GetIdComboByIndex(cboClaseParametro);
    
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.ControlEditables(Editables : boolean);
begin
  VCLExtra.LockControls([edtCodigoParametro,
    edtDescripcionParametro,
    fraParametro.fraTipoDatoParametro.edCodigo,
    fraParametro.fraTipoDatoParametro.cmbDescripcion,
    edFechaVigenciaDesde
    ], not Editables);
end;
{------------------------------------------------------------------------------}
procedure TfrmAdministracionParametros.tbNuevoClick(Sender: TObject);
begin
  ControlEditables(true);
  inherited;
end;
{------------------------------------------------------------------------------}
function TfrmAdministracionParametros.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de Parámetros',
                                edtCodigoParametro, not IsEmptyString(edtCodigoParametro.text), 'Debe especificar un código para el parámetro.',
                                edtDescripcionParametro, not IsEmptyString(edtDescripcionParametro.Text), 'Debe especificar una descripción para el parámetro',
                                fraParametro.fraTipoDatoParametro.edCodigo, fraParametro.IsSelected, 'Debe seleccionar un tipo y valor para el parámetro',
                                edFechaVigenciaDesde, (ModoABM <> maAlta) or
                                                      ( (ModoABM = maAlta) and
                                                        (edFechaVigenciaDesde.Date >= DBDateTime)) , 'La fecha de vigencia no puede ser fijada en el pasado.',
                                edFechaVigenciaHasta,
                                ( edFechaVigenciaHasta.IsEmpty) or
                                (edFechaVigenciaHasta.Date >= edFechaVigenciaDesde.Date), ' La fecha de fin de vigencia debe ser mayor que la fecha de inicio de vigencia.'
                              ]);
end;

end.
