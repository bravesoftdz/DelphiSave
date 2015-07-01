unit unFrmEmpresasAOmitir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, ExComboBox,
  unfraCodigoDescripcionExt;

type
  TfrmEmpresasAOmitir = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    fraEmpresaOmitir: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    cbPerfilNomina: TExComboBox;
    lblPerfilNomina: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure fraEmpresaOmitirExit(Sender: TObject);
    procedure edPeriodoDesdeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure cbPerfilNominaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ValidaContratoVigente;
    function  ValidaSolapamiento: Boolean;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
  end;

var
  frmEmpresasAOmitir: TfrmEmpresasAOmitir;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmEmpresasAOmitir.ClearControls;
begin
  fraEmpresaOmitir.Clear;
  fraEmpresaOmitir.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  cbPerfilNomina.Value := 'T';
  cbPerfilNominaChange(Self);
end;

function TfrmEmpresasAOmitir.DoABM: Boolean;
begin
 try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('ER_ID', sdqConsulta.FieldByName('ER_ID').AsInteger );
      Sql.Fields.Add('ER_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('ER_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('ER_IDEMPRESA',fraEmpresaOmitir.Value);
      Sql.Fields.Add('ER_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('ER_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);
      Sql.Fields.Add('ER_EMPLEADOS', cbPerfilNomina.Value);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('ER_ID', GetSecNextVal('EMI.SEQ_IER_ID'));
        Sql.Fields.Add('ER_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('ER_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('ER_ID', sdqConsulta.FieldByName('ER_ID').AsInteger);
        Sql.Fields.Add('ER_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('ER_FECHAMODIF', exDateTime );
        Sql.Fields.Add('ER_USUBAJA', exNull);
        Sql.Fields.Add('ER_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el formulario.');
    end;
  end;
  //fixme 1.j.3.	ejecuta el Caso de Uso CU-EMI-0005 "Administración de Presentaciones"
end;

procedure TfrmEmpresasAOmitir.LoadControls;
begin
  fraEmpresaOmitir.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  cbPerfilNomina.Value := sdqConsulta.FieldByName('ER_EMPLEADOS').AsString;
  cbPerfilNominaChange(Self);
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('ER_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('ER_PERIODOVIGENCIAHASTA').AsString;
  fraEmpresaOmitir.Locked := true;
end;

function TfrmEmpresasAOmitir.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de empresas a omitir',
                                fraEmpresaOmitir, fraEmpresaOmitir.IsSelected, 'Debe especificar una empresa',
                                edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                                edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                                btnAceptar,ValidaSolapamiento(), 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.'
                                ]);
end;
function TfrmEmpresasAOmitir.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT *' +
                        '  FROM EMI.IER_EMPRESARECHAZODDJJ IER, AFI.AEM_EMPRESA ' +
                        ' WHERE (:pd   BETWEEN ER_PERIODOVIGENCIADESDE AND NVL(ER_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN ER_PERIODOVIGENCIADESDE AND NVL(ER_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  ER_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  ER_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = ER_IDEMPRESA ' +
                        '    AND ER_FECHABAJA IS NULL ' +
                        '    AND ER_IDEMPRESA = :idemp ' +
                        '    AND ER_EMPLEADOS = :tipo ' + 
                        + iif(ModoABM = maModificacion, ' AND er_id <> ' + SqlValue(sdqConsulta.FieldByName('ER_ID').AsInteger), '')
                        ,
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaOmitir.Value, cbPerfilNomina.Value]
                         );
end;

procedure TfrmEmpresasAOmitir.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaOmitir.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaOmitir.CUIT;
    {Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente, sino hace un error de desbordamiento de pila.}
    sPd   := edPeriodoDesde.Periodo.Valor;  //Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente.
    fraEmpresaOmitir.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasAOmitir.fraEmpresaOmitirExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasAOmitir.edPeriodoDesdeExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasAOmitir.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ER_FECHABAJA';
  Sql.TableName := 'EMI.IER_EMPRESARECHAZODDJJ';

  fraEmpresaOmitir.ShowBajas:= True;

  fraEmpresaFiltro.ShowBajas:= True;
end;

procedure TfrmEmpresasAOmitir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasAOmitir.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT ier.er_id, aco.co_contrato, ier.er_periodovigenciahasta, ier.er_periodovigenciadesde, ier.er_fechaalta, ier.er_usualta, ' +
                      '      ier.er_fechabaja, ier.er_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre, ier.er_empleados, decode(ier.er_empleados, ''T'', ''Todas'', ''S'', ''Sin Empleados'') empleados ' +
                      ' FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.ier_empresarechazoddjj ier ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '  AND (aem.em_id = ier.er_idempresa) ' +
                      '  AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND ER_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));
     
  inherited;
end;

procedure TfrmEmpresasAOmitir.cbPerfilNominaChange(Sender: TObject);
begin
  if cbPerfilNomina.Value = 'S' then
  begin
    edPeriodoDesde.Periodo.Valor := '199606';
    edPeriodoDesde.Enabled := false;
    edPeriodoHasta.Clear;
    edPeriodoHasta.Enabled := false;
  end
  else begin
    edPeriodoDesde.Clear;
    edPeriodoDesde.Enabled := true;
    edPeriodoHasta.Clear;
    edPeriodoHasta.Enabled := true;
  end;
end;

end.


