unit unFrmAdministracionTopes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ToolEdit, DateComboBox, Mask,
  PatternEdit, PeriodoPicker, Periodo, ExComboBox;

type
  TFrmAdministracionTopes = class(TfrmCustomGridABM)
    lblDescripcion: TLabel;
    lblCodigo: TLabel;
    edtCodigo: TPatternEdit;
    edtDescripcion: TEdit;
    lblVencimientoEvento: TLabel;
    lblFechaEvento: TLabel;
    chkTopeAlMinimo: TCheckBox;
    chkTopeAlMaximo: TCheckBox;
    edPeriodoDesde: TPeriodoPicker;
    edPeriodoHasta: TPeriodoPicker;
    lblPerVigenciaMinDesde: TLabel;
    edPeriodoMinDesde: TPeriodoPicker;
    lblPerVigenciaMinHasta: TLabel;
    edPeriodoMinHasta: TPeriodoPicker;
    Label5: TLabel;
    edPeriodoMaxDesde: TPeriodoPicker;
    Label1: TLabel;
    edPeriodoMaxHasta: TPeriodoPicker;
    Bevel1: TBevel;
    Label2: TLabel;
    cmbProcedencia: TExComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  protected
    procedure ClearControls; override;
    procedure LoadControls; override;
    function Validar : Boolean; override;
    function DoABM: Boolean; override;
  public
    { Public declarations }
  end;

var
  FrmAdministracionTopes: TFrmAdministracionTopes;

implementation

uses unDmEmision, unDmPrincipal, CustomDlgs, AnsiSql, SqlFuncs, unSesion, General,   StrFuncs;

{$R *.dfm}

procedure TFrmAdministracionTopes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmAdministracionTopes.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'EMI.ITM_TOPEMASAS';
  edPeriodoDesde.Periodo.Separador := #0;
  edPeriodoHasta.Periodo.Separador := #0;
  CheckPK := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TFrmAdministracionTopes.Validar: Boolean;
begin
  Result := True;
  VerificarMultiple(['Guardando Administración de Topes Salariales',
                      edtCodigo, not IsEmptyString(edtCodigo.text), 'Debe ingresar un código situación para el tope.',
                      edtDescripcion, not IsEmptyString(edtDescripcion.text), 'Debe Seleccionar una Descripción para el tope.',
                      edPeriodoDesde, not ((edPeriodoDesde.Periodo.IsNull) and (edPeriodoHasta.Periodo.IsNull)), 'Debe especificar alguno de los dos períodos.'
//                      edPeriodoDesde, (not edPeriodoDesde.Periodo.IsNull), 'Debe ingresar un período de inicio vigencia válido.',
//                      edPeriodoHasta, (not edPeriodoHasta.Periodo.IsNull), 'Debe ingresar un período de fin de vigencia válido.'
                      ]);

  Verificar(chkTopeAlMinimo.Checked and not ValidaPeriodos(edPeriodoMinDesde.Periodo, edPeriodoMinHasta.Periodo,False,True,True), edPeriodoMinDesde, 'Debe especificar el período desde');
  Verificar(chkTopeAlMaximo.Checked and not ValidaPeriodos(edPeriodoMaxDesde.Periodo, edPeriodoMaxHasta.Periodo,False,True,True), edPeriodoMaxDesde, 'Debe especificar el período desde');
  Verificar(cmbProcedencia.Value = '', cmbProcedencia, 'Debe especificar la procedencia.');
end;

function TFrmAdministracionTopes.DoABM: Boolean;
begin
  Sql.Clear;

  Sql.Fields.Add('TM_DESCRIPCION', edtDescripcion.Text);
  Sql.Fields.AddString('TM_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.Valor);
  Sql.Fields.AddString('TM_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.Valor);
  Sql.Fields.Add('TM_CODIGO', edtCodigo.Text);
  Sql.Fields.Add('TM_TOPEMINIMO', string(iif(chkTopeAlMinimo.Checked, 'S', 'N')));
  Sql.Fields.Add('TM_TOPEMAXIMO', string(iif(chkTopeAlMaximo.Checked, 'S', 'N')));

  Sql.Fields.AddString('TM_PERIODOVIGMINIMODESDE', edPeriodoMinDesde.Periodo.Valor);
  Sql.Fields.AddString('TM_PERIODOVIGMINIMOHASTA', edPeriodoMinHasta.Periodo.Valor);

  Sql.Fields.AddString('TM_PERIODOVIGMAXIMODESDE', edPeriodoMaxDesde.Periodo.Valor);
  Sql.Fields.AddString('TM_PERIODOVIGMAXIMOHASTA', edPeriodoMaxHasta.Periodo.Valor);
  Sql.Fields.AddString('TM_PROCEDENCIA', cmbProcedencia.Value);


  if ModoABM = maAlta Then
  begin
    Sql.Fields.Add('TM_USUALTA', Sesion.LoginName );
    Sql.Fields.Add('TM_FECHAALTA', exDateTime );
    Sql.PrimaryKey.Add('TM_ID', GetSecNextVal('emi.seq_itm_id'));
  end else begin
    Sql.PrimaryKey.Add('TM_ID', sdqConsulta.FieldByName('TM_ID').AsInteger);
    Sql.Fields.Add('TM_USUMODIF', Sesion.LoginName );
    Sql.Fields.Add('TM_FECHAMODIF', exDateTime );
//    Sql.Fields.Add('TM_USUBAJA', exNull );
//    Sql.Fields.Add('TM_FECHABAJA', exNull );
  end;

  Result := inherited DoABM;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrmAdministracionTopes.ClearControls;
begin
  edtCodigo.Text := '';
  edtDescripcion.Text := '';
  edPeriodoDesde.Periodo.Valor := '';
  edPeriodoHasta.Clear;
  chkTopeAlMinimo.Checked := false;
  chkTopeAlMaximo.Checked := false;
  edPeriodoMinDesde.Clear;
  edPeriodoMinHasta.Clear;
  edPeriodoMaxDesde.Clear;
  edPeriodoMaxHasta.Clear;
  cmbProcedencia.Clear;
  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TFrmAdministracionTopes.LoadControls;
begin
  edtCodigo.Text := sdqConsulta.FieldByName('TM_CODIGO').AsString;
  edtDescripcion.Text := sdqConsulta.FieldByName('TM_DESCRIPCION').AsString;;
  edPeriodoDesde.Text := sdqConsulta.FieldByName('TM_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Text := sdqConsulta.FieldByName('TM_PERIODOVIGENCIAHASTA').AsString;
  chkTopeAlMinimo.Checked := sdqConsulta.FieldByName('TM_TOPEMINIMO').AsString = 'S';
  chkTopeAlMaximo.Checked := sdqConsulta.FieldByName('TM_TOPEMAXIMO').AsString = 'S';
  edPeriodoMinDesde.Text := sdqConsulta.FieldByName('TM_PERIODOVIGMINIMODESDE').AsString;
  edPeriodoMinHasta.Text := sdqConsulta.FieldByName('TM_PERIODOVIGMINIMOHASTA').AsString;
  edPeriodoMaxDesde.Text := sdqConsulta.FieldByName('TM_PERIODOVIGMAXIMODESDE').AsString;
  edPeriodoMaxHasta.Text := sdqConsulta.FieldByName('TM_PERIODOVIGMAXIMOHASTA').AsString;
  cmbProcedencia.Value := sdqConsulta.FieldByName('TM_PROCEDENCIA').AsString;
  inherited;
end;

end.


