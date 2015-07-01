unit unFrmEmpresasCodSiniestrados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, unfraCtbTablas,
  DBClient, Provider, unfraCodigoDescripcionExt;

type
  TfrmEmpresasCodSiniestrados = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    chkPermitirTodoCodSin: TCheckBox;
    gbCodigosNoPermitidos: TGroupBox;
    dbgCodigoSiniestrado: TArtDBGrid;
    tbComandosDetalle: TToolBar;
    tbAgregarCodSin: TToolButton;
    tbEliminarCodSin: TToolButton;
    lblCodSin: TLabel;
    sdqCodigoSiniestrado: TSDQuery;
    dsCodigoSiniestrado: TDataSource;
    cdsCodigoSiniestrado: TClientDataSet;
    fraEmpresaCodSiniestrado: TfraEmpresa;
    Label1: TLabel;
    fraCodigoSiniestrado: TfraCodigoDescripcionExt;
    ShortCutControl1: TShortCutControl;
    procedure fraEmpresaCodSiniestradoExit(Sender: TObject);
    procedure edPeriodoDesdeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure tbAgregarCodSinClick(Sender: TObject);
    procedure tbEliminarCodSinClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkPermitirTodoCodSinClick(Sender: TObject);
  private
    procedure CargarSiniestrados;
    procedure GuardarSiniestrados(ides: integer);
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
  frmEmpresasCodSiniestrados: TfrmEmpresasCodSiniestrados;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}


procedure TfrmEmpresasCodSiniestrados.ClearControls;
begin
  fraEmpresaCodSiniestrado.Clear;
  fraEmpresaCodSiniestrado.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
end;

function TfrmEmpresasCodSiniestrados.DoABM: Boolean;
begin
 try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('ES_ID', sdqConsulta.FieldByName('ES_ID').AsInteger );
      Sql.Fields.Add('ES_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('ES_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('ES_IDEMPRESA',fraEmpresaCodSiniestrado.Value);
      Sql.Fields.Add('ES_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('ES_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);
      Sql.Fields.Add('ES_PERMITIRTODOCOD', SqlBoolean(chkPermitirTodoCodSin.Checked, false));

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('ES_ID', GetSecNextVal('EMI.SEQ_IES_EMPRESASINIESTRADO_ID'));
        Sql.Fields.Add('ES_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('ES_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('ES_ID', sdqConsulta.FieldByName('ES_ID').AsInteger);
        Sql.Fields.Add('ES_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('ES_FECHAMODIF', exDateTime );
        Sql.Fields.Add('ES_USUBAJA', exNull);
        Sql.Fields.Add('ES_FECHABAJA', exNull );
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    GuardarSiniestrados(Sql.PrimaryKey.Items[0].Value);
    CommitTrans(true);
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el formulario.');
    end;
  end;
end;

procedure TfrmEmpresasCodSiniestrados.LoadControls;
begin
  fraEmpresaCodSiniestrado.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('ES_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('ES_PERIODOVIGENCIAHASTA').AsString;
  fraEmpresaCodSiniestrado.Locked := true;
  chkPermitirTodoCodSin.Checked := (sdqConsulta.FieldByName('ES_PERMITIRTODOCOD').AsString = 'S');
  CargarSiniestrados;
end;

function TfrmEmpresasCodSiniestrados.Validar: Boolean;
begin
  Result := VerificarMultiple(['Mantenimiento de empresas-siniestrados',
                                fraEmpresaCodSiniestrado, fraEmpresaCodSiniestrado.IsSelected, 'Debe especificar una empresa',
                                edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                                edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                                btnAceptar,ValidaSolapamiento(), 'Verifique que el rango de períodos ingresados no esté solapado con otros rangos generados previamente.'
                                ]);
end;
function TfrmEmpresasCodSiniestrados.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT 1' +
                        '  FROM EMI.IES_EMPRESASINIESTRADO IES, AFI.AEM_EMPRESA ' +
                        ' WHERE (:pd   BETWEEN ES_PERIODOVIGENCIADESDE AND NVL(ES_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN ES_PERIODOVIGENCIADESDE AND NVL(ES_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  ES_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  ES_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = ES_IDEMPRESA ' +
                        '    AND ES_FECHABAJA IS NULL ' +
                        '    AND ES_IDEMPRESA = :idemp '
                        + iif(ModoABM = maModificacion, ' AND es_id <> ' + SqlValue(sdqConsulta.FieldByName('ES_ID').AsInteger), '')
                        ,
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaCodSiniestrado.Value]
                         );
end;

procedure TfrmEmpresasCodSiniestrados.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaCodSiniestrado.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaCodSiniestrado.CUIT;
    {Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente, sino hace un error de desbordamiento de pila.}
    sPd   := edPeriodoDesde.Periodo.Valor;  //Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente.
    fraEmpresaCodSiniestrado.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasCodSiniestrados.fraEmpresaCodSiniestradoExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasCodSiniestrados.edPeriodoDesdeExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasCodSiniestrados.FormCreate(Sender: TObject);
begin
  inherited;

  cdsCodigoSiniestrado.CreateDataSet;

  FieldBaja := 'ES_FECHABAJA';
  Sql.TableName := 'EMI.IES_EMPRESASINIESTRADO';

  with fraCodigoSiniestrado do
  begin
    TableName   := 'EMI.ISI_SINIESTRADO';
    FieldID     := 'SI_ID';
    FieldCodigo := 'SI_CODIGO';
    FieldDesc   := 'SI_DESCRIPCION';
    FieldBaja   := 'SI_FECHABAJA';
    ShowBajas   := true; 
  end;

  fraEmpresaFiltro.ShowBajas:= True;
  fraEmpresaCodSiniestrado.ShowBajas:= True;
end;

procedure TfrmEmpresasCodSiniestrados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasCodSiniestrados.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT ies.es_id, aco.co_contrato, ies.es_periodovigenciahasta, ies.es_periodovigenciadesde, ies.es_fechaalta, ies.es_usualta, ' +
                      '      ies.es_permitirtodocod, ies.es_fechabaja, ies.es_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre ' +
                      ' FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.ies_empresasiniestrado ies ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '  AND (aem.em_id = ies.es_idempresa) ' +
                      '  AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND ES_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));
     
  inherited;
end;

procedure TfrmEmpresasCodSiniestrados.CargarSiniestrados;
begin
  sdqCodigoSiniestrado.SQL.Clear;
  sdqCodigoSiniestrado.SQL.Add('SELECT DISTINCT ise.*, si_descripcion ' +
                         'FROM emi.ise_siniestradoexcluidaempre ise, emi.isi_siniestrado ' +
                         'WHERE si_codigo = se_codigosiniestrado ' +
                         'AND se_idempresasiniestrado = ' + SqlValue(sdqConsulta.FieldbyName('ES_ID').AsInteger)
                         );
  sdqCodigoSiniestrado.Open;
  while not sdqCodigoSiniestrado.Eof do
  begin
    cdsCodigoSiniestrado.AppendRecord([sdqCodigoSiniestrado.FieldByName('SE_ID').AsInteger,
                                 sdqCodigoSiniestrado.FieldByName('SE_CODIGOSINIESTRADO').AsString,
                                 sdqCodigoSiniestrado.FieldByName('SE_USUALTA').AsString,
                                 sdqCodigoSiniestrado.FieldByName('SE_FECHAALTA').AsDateTime,
                                 sdqCodigoSiniestrado.FieldByName('SE_USUBAJA').AsString,
                                 sdqCodigoSiniestrado.FieldByName('SE_FECHABAJA').AsDateTime,
                                 sdqCodigoSiniestrado.FieldByName('SE_IDEMPRESASINIESTRADO').AsInteger,
                                 sdqCodigoSiniestrado.FieldByName('SI_DESCRIPCION').AsString]);
    sdqCodigoSiniestrado.Next;
  end;
end;

procedure TfrmEmpresasCodSiniestrados.fpAbmClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsCodigoSiniestrado.EmptyDataSet;
  sdqCodigoSiniestrado.Close;
  inherited;
end;

procedure TfrmEmpresasCodSiniestrados.GuardarSiniestrados(ides: integer);
begin
  cdsCodigoSiniestrado.DisableControls;
  try
    cdsCodigoSiniestrado.First;
    while not cdsCodigoSiniestrado.Eof do
    begin
      if (cdsCodigoSiniestrado.FieldByName('se_usualta').AsString <> '') then
      begin
        EjecutarSqlST('update emi.ise_siniestradoexcluidaempre ' +
                      'set se_fechabaja = ' + iif(cdsCodigoSiniestrado.FieldByName('se_usubaja').AsString = '', 'null', 'sysdate') + ', ' +
                      '    se_usubaja = ' + iif(cdsCodigoSiniestrado.FieldByName('se_usubaja').AsString = '', 'null', SqlValue(cdsCodigoSiniestrado.FieldByName('se_usubaja').AsString)) + ' ' +
                      'where se_idempresasiniestrado = ' + SqlInt(ides) + ' and ' +
                      'se_codigosiniestrado = ' + SqlValue(cdsCodigoSiniestrado.FieldByName('se_codigosiniestrado').AsString)
                      );
      end
      else
      begin
        EjecutarSqlST('insert into emi.ise_siniestradoexcluidaempre ' +
                      'values(emi.seq_ise_siniesexcluidaempre_id.nextval, ' +
                       SqlValue(cdsCodigoSiniestrado.FieldByName('se_codigosiniestrado').asString) + ', ' +
                       SqlValue(Sesion.LoginName) + ', ' +
                       'SYSDATE, ' +
                       'NULL, ' +
                       'NULL, ' +
                       SqlValue(ides) + ')' 
                     );
      end;

      cdsCodigoSiniestrado.Next;
    end;
  finally
    cdsCodigoSiniestrado.EnableControls;
  end;
end;

procedure TfrmEmpresasCodSiniestrados.tbAgregarCodSinClick(Sender: TObject);
begin
  if fraCodigoSiniestrado.IsSelected then
  begin
    try
      cdsCodigoSiniestrado.Append;
      cdsCodigoSiniestrado.FieldByName('se_codigosiniestrado').AsString := fraCodigoSiniestrado.Codigo;
      cdsCodigoSiniestrado.FieldByName('si_descripcion').AsString := fraCodigoSiniestrado.Descripcion;
      cdsCodigoSiniestrado.Post;
    except
      on E: EDBClient do
      begin
        //Key violation
        if E.ErrorCode = 9729 then
        begin
          cdsCodigoSiniestrado.Cancel;
          cdsCodigoSiniestrado.SetKey;
          cdsCodigoSiniestrado.FieldByName('se_codigosiniestrado').AsString := fraCodigoSiniestrado.Codigo;
          if cdsCodigoSiniestrado.GotoKey then
          begin
            cdsCodigoSiniestrado.Edit;
            cdsCodigoSiniestrado.FieldByName('se_fechabaja').AsString := '';
            cdsCodigoSiniestrado.FieldByName('se_usubaja').AsString := '';
            cdsCodigoSiniestrado.UpdateRecord;
          end;
        end;
      end;
    end;
    fraCodigoSiniestrado.Clear;
  end;
end;

procedure TfrmEmpresasCodSiniestrados.tbEliminarCodSinClick(Sender: TObject);
begin
  if cdsCodigoSiniestrado.Active and not cdsCodigoSiniestrado.IsEmpty then
  begin
      cdsCodigoSiniestrado.Edit;
      cdsCodigoSiniestrado.FieldByName('se_fechabaja').AsDateTime := Now;
      cdsCodigoSiniestrado.FieldByName('se_usubaja').AsString := Sesion.LoginName;
      cdsCodigoSiniestrado.UpdateRecord;
  end;
end;

procedure TfrmEmpresasCodSiniestrados.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if fpAbm.Visible then
  begin
    if cdsCodigoSiniestrado.FieldByName('se_usubaja').AsString <> '' then
      AFont.Color := clRed;
  end;

end;

procedure TfrmEmpresasCodSiniestrados.chkPermitirTodoCodSinClick(Sender: TObject);
begin
  tbComandosDetalle.Enabled := not chkPermitirTodoCodSin.Checked;
  cdsCodigoSiniestrado.DisableControls;
  try
    if chkPermitirTodoCodSin.Checked then
    begin
      cdsCodigoSiniestrado.First;
      while not cdsCodigoSiniestrado.Eof do
      begin
        if cdsCodigoSiniestrado.FieldByName('se_usubaja').AsString = '' then
        begin
          cdsCodigoSiniestrado.Edit;
          cdsCodigoSiniestrado.FieldByName('se_fechabaja').AsDateTime := Now;
          cdsCodigoSiniestrado.FieldByName('se_usubaja').AsString := Sesion.LoginName;
          cdsCodigoSiniestrado.UpdateRecord;
        end;
        cdsCodigoSiniestrado.Next;
      end;
      cdsCodigoSiniestrado.First;
    end;
  finally
    cdsCodigoSiniestrado.EnableControls;
  end;
end;

end.


