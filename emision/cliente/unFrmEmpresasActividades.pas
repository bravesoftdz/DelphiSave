unit unFrmEmpresasActividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, unfraCtbTablas,
  DBClient, Provider;

type
  TfrmEmpresasActividades = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    chkPermitirTodaAct: TCheckBox;
    gbActividadesNoPermitidas: TGroupBox;
    dbgActividades: TArtDBGrid;
    tbComandosDetalle: TToolBar;
    tbAgregarAct: TToolButton;
    tbEliminarAct: TToolButton;
    fraActividad: TfraCtbTablas;
    lblActividad: TLabel;
    sdqActividades: TSDQuery;
    dsActividades: TDataSource;
    cdsActividades: TClientDataSet;
    fraEmpresaAct: TfraEmpresa;
    Label1: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure fraEmpresaActExit(Sender: TObject);
    procedure edPeriodoDesdeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure tbAgregarActClick(Sender: TObject);
    procedure tbEliminarActClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkPermitirTodaActClick(Sender: TObject);
  private
    procedure CargarActividades;
    procedure GuardarActividades(idae: integer);
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
  frmEmpresasActividades: TfrmEmpresasActividades;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}


procedure TfrmEmpresasActividades.ClearControls;
begin
  fraEmpresaAct.Clear;
  fraEmpresaAct.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
end;

function TfrmEmpresasActividades.DoABM: Boolean;
begin
 try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('EA_ID', sdqConsulta.FieldByName('EA_ID').AsInteger );
      Sql.Fields.Add('EA_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('EA_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EA_IDEMPRESA',fraEmpresaAct.Value);
      Sql.Fields.Add('EA_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('EA_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);
      Sql.Fields.Add('EA_PERMITIRTODAACT', SqlBoolean(chkPermitirTodaAct.Checked, false));

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('EA_ID', GetSecNextVal('EMI.SEQ_IAB_ID'));
        Sql.Fields.Add('EA_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('EA_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('EA_ID', sdqConsulta.FieldByName('EA_ID').AsInteger);
        Sql.Fields.Add('EA_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('EA_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EA_USUBAJA', exNull);
        Sql.Fields.Add('EA_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    GuardarActividades(Sql.PrimaryKey.Items[0].Value);
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

procedure TfrmEmpresasActividades.LoadControls;
begin
  fraEmpresaAct.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('EA_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('EA_PERIODOVIGENCIAHASTA').AsString;
  fraEmpresaAct.Locked := true;
  chkPermitirTodaAct.Checked := (sdqConsulta.FieldByName('EA_PERMITIRTODAACT').AsString = 'S');
  CargarActividades;
end;

function TfrmEmpresasActividades.Validar: Boolean;
begin
  Result := VerificarMultiple(['Mantenimiento de empresas-actividades',
                                fraEmpresaAct, fraEmpresaAct.IsSelected, 'Debe especificar una empresa',
                                edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                                edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                                btnAceptar,ValidaSolapamiento(), 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.'
                                ]);
end;
function TfrmEmpresasActividades.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT 1' +
                        '  FROM EMI.IEA_EMPRESAACEPTACTIV IEA, AFI.AEM_EMPRESA ' +
                        ' WHERE (:pd   BETWEEN EA_PERIODOVIGENCIADESDE AND NVL(EA_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN EA_PERIODOVIGENCIADESDE AND NVL(EA_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  EA_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  EA_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = EA_IDEMPRESA ' +
                        '    AND EA_FECHABAJA IS NULL ' +
                        '    AND EA_IDEMPRESA = :idemp '
                        + iif(ModoABM = maModificacion, ' AND ea_id <> ' + SqlValue(sdqConsulta.FieldByName('EA_ID').AsInteger), '')
                        ,
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaAct.Value]
                         );
end;

procedure TfrmEmpresasActividades.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaAct.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaAct.CUIT;
    {Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente, sino hace un error de desbordamiento de pila.}
    sPd   := edPeriodoDesde.Periodo.Valor;  //Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente.
    fraEmpresaAct.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasActividades.fraEmpresaActExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasActividades.edPeriodoDesdeExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasActividades.FormCreate(Sender: TObject);
begin
  inherited;

  cdsActividades.CreateDataSet;

  FieldBaja := 'EA_FECHABAJA';
  Sql.TableName := 'EMI.IEA_EMPRESAACEPTACTIV';

  fraActividad.Clave := 'ACTIV';

  fraEmpresaAct.ShowBajas:= True;

  fraEmpresaFiltro.ShowBajas:= True;
end;

procedure TfrmEmpresasActividades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasActividades.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT iea.ea_id, aco.co_contrato, iea.ea_periodovigenciahasta, iea.ea_periodovigenciadesde, iea.ea_fechaalta, iea.ea_usualta, ' +
                      '      iea.ea_permitirtodaact, iea.ea_fechabaja, iea.ea_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre ' +
                      ' FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.iea_empresaaceptactiv iea ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '  AND (aem.em_id = iea.ea_idempresa) ' +
                      '  AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND EA_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));
     
  inherited;
end;

procedure TfrmEmpresasActividades.CargarActividades;
begin
  sdqActividades.SQL.Clear;
  sdqActividades.SQL.Add('SELECT iae.*, tb_descripcion ' +
                         'FROM emi.iae_activexcluidaempre iae, art.ctb_tablas ' +
                         'WHERE tb_clave = ''ACTIV''' +
                         'AND tb_codigo = ae_codigoactividad ' +
                         'AND ae_idempresaaceptactiv = ' + SqlValue(sdqConsulta.FieldbyName('EA_ID').AsInteger)
                         );
  sdqActividades.Open;
  while not sdqActividades.Eof do
  begin
    cdsActividades.AppendRecord([sdqActividades.FieldByName('AE_ID').AsInteger,
                                 sdqActividades.FieldByName('AE_CODIGOACTIVIDAD').AsString,
                                 sdqActividades.FieldByName('AE_USUALTA').AsString,
                                 sdqActividades.FieldByName('AE_FECHAALTA').AsDateTime,
                                 sdqActividades.FieldByName('AE_USUBAJA').AsString,
                                 sdqActividades.FieldByName('AE_FECHABAJA').AsDateTime,
                                 sdqActividades.FieldByName('AE_IDEMPRESAACEPTACTIV').AsInteger,
                                 sdqActividades.FieldByName('TB_DESCRIPCION').AsString]);
    sdqActividades.Next;
  end;
end;

procedure TfrmEmpresasActividades.fpAbmClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsActividades.EmptyDataSet;
  sdqActividades.Close;
  inherited;
end;

procedure TfrmEmpresasActividades.GuardarActividades(idae: integer);
begin
  cdsActividades.DisableControls;
  try
    cdsActividades.First;
    while not cdsActividades.Eof do
    begin
      if (cdsActividades.FieldByName('ae_usualta').AsString <> '') then
      begin
        EjecutarSqlST('update emi.iae_activexcluidaempre ' +
                      'set ae_fechabaja = ' + iif(cdsActividades.FieldByName('ae_usubaja').AsString = '', 'null', 'sysdate') + ', ' +
                      '    ae_usubaja = ' + iif(cdsActividades.FieldByName('ae_usubaja').AsString = '', 'null', SqlValue(cdsActividades.FieldByName('ae_usubaja').AsString)) + ' ' + 
                      'where ae_idempresaaceptactiv = ' + SqlInt(idae) + ' and ' +
                      'ae_codigoactividad = ' + SqlValue(cdsActividades.FieldByName('ae_codigoactividad').AsString)
                      );
      end
      else
      begin
        EjecutarSqlST('insert into emi.iae_activexcluidaempre ' + 
                      'values(emi.seq_iec_id.nextval, ' +
                       SqlValue(cdsActividades.FieldByName('ae_codigoactividad').asString) + ', ' +
                       SqlValue(Sesion.LoginName) + ', ' +
                       'SYSDATE, ' +
                       'NULL, ' +
                       'NULL, ' +
                       SqlValue(idae) + ')' 
                     );
      end;

      cdsActividades.Next;
    end;
  finally
    cdsActividades.EnableControls;
  end;
end;

procedure TfrmEmpresasActividades.tbAgregarActClick(Sender: TObject);
begin
  if fraActividad.IsSelected then
  begin
    try
      cdsActividades.Append;
      cdsActividades.FieldByName('ae_codigoactividad').AsString := fraActividad.Value;
      cdsActividades.FieldByName('tb_descripcion').AsString := fraActividad.Descripcion;
      cdsActividades.Post;
    except
      on E: EDBClient do
      begin
        //Key violation
        if E.ErrorCode = 9729 then
        begin
          cdsActividades.Cancel;
          cdsActividades.SetKey;
          cdsActividades.FieldByName('ae_codigoactividad').AsString := fraActividad.Value;
          if cdsActividades.GotoKey then
          begin
            cdsActividades.Edit;
            cdsActividades.FieldByName('ae_fechabaja').AsString := '';
            cdsActividades.FieldByName('ae_usubaja').AsString := '';
            cdsActividades.UpdateRecord;
          end;
        end;
      end;
    end;
    fraActividad.Clear;
  end;
end;

procedure TfrmEmpresasActividades.tbEliminarActClick(Sender: TObject);
begin
  if cdsActividades.Active and not cdsActividades.IsEmpty then
  begin
      cdsActividades.Edit;
      cdsActividades.FieldByName('ae_fechabaja').AsDateTime := Now;
      cdsActividades.FieldByName('ae_usubaja').AsString := Sesion.LoginName;
      cdsActividades.UpdateRecord;
  end;
end;

procedure TfrmEmpresasActividades.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if fpAbm.Visible then
  begin
    if cdsActividades.FieldByName('ae_usubaja').AsString <> '' then
      AFont.Color := clRed;
  end;

end;

procedure TfrmEmpresasActividades.chkPermitirTodaActClick(Sender: TObject);
begin
  tbComandosDetalle.Enabled := not chkPermitirTodaAct.Checked;
  cdsActividades.DisableControls;
  try
    if chkPermitirTodaAct.Checked then
    begin
      cdsActividades.First;
      while not cdsActividades.Eof do
      begin
        if cdsActividades.FieldByName('ae_usubaja').AsString = '' then
        begin
          cdsActividades.Edit;
          cdsActividades.FieldByName('ae_fechabaja').AsDateTime := Now;
          cdsActividades.FieldByName('ae_usubaja').AsString := Sesion.LoginName;
          cdsActividades.UpdateRecord;
        end;
        cdsActividades.Next;
      end;
      cdsActividades.First;
    end;
  finally
    cdsActividades.EnableControls;
  end;
end;

end.


