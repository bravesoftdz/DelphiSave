unit unFrmEmpresasSAC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, unfraCtbTablas,
  DBClient, Provider, ExComboBox, ToolEdit, CurrEdit;

type
  TfrmEmpresasSAC = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    chkSinSAC: TCheckBox;
    gbMesesConSAC: TGroupBox;
    dbgMesSAC: TArtDBGrid;
    tbComandosDetalle: TToolBar;
    tbAgregarMes: TToolButton;
    tbEliminarMes: TToolButton;
    lblMes: TLabel;
    sdqSACPeriodo: TSDQuery;
    dsActividades: TDataSource;
    cdsMesesSAC: TClientDataSet;
    fraEmpresaSAC: TfraEmpresa;
    cmbMeses: TExComboBox;
    edPorcentajeSAC: TCurrencyEdit;
    ShortCutControl1: TShortCutControl;
    procedure fraEmpresaSACExit(Sender: TObject);
    procedure edPeriodoDesdeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure fpAbmClose(Sender: TObject; var Action: TCloseAction);
    procedure tbAgregarMesClick(Sender: TObject);
    procedure tbEliminarMesClick(Sender: TObject);
    procedure GridGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure chkSinSACClick(Sender: TObject);
  private
    FPeriodoDesdeAnt: String;
    FPeriodoHastaAnt: String;
    procedure CargarSACPeriodo;
    procedure GuardarSACPeriodo(ides: integer);
  public
    { Public declarations }
    procedure ValidaContratoVigente;
    function  ValidaSolapamiento: Boolean;
    function  ExistenActivos: Boolean;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
    procedure ReprocesarPeriodos;
  end;

var
  frmEmpresasSAC: TfrmEmpresasSAC;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta, Periodos, unEspera;

{$R *.dfm}


procedure TfrmEmpresasSAC.ClearControls;
begin
  cmbMeses.ItemIndex := -1;
  fraEmpresaSAC.Clear;
  fraEmpresaSAC.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  chkSinSAC.Checked := false;
  cdsMesesSAC.EmptyDataSet;
end;

function TfrmEmpresasSAC.DoABM: Boolean;
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
      Sql.Fields.Add('ES_IDEMPRESA',fraEmpresaSAC.Value);
      Sql.Fields.Add('ES_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('ES_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);
      Sql.Fields.Add('ES_SINSAC', SqlBoolean(chkSinSAC.Checked, false));

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('ES_ID', GetSecNextVal('EMI.SEQ_IES_EMPRESASAC'));
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
    GuardarSACPeriodo(Sql.PrimaryKey.Items[0].Value);
    ReprocesarPeriodos;

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

procedure TfrmEmpresasSAC.LoadControls;
begin
  fraEmpresaSAC.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('ES_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('ES_PERIODOVIGENCIAHASTA').AsString;
  fraEmpresaSAC.Locked := true;
  chkSinSAC.Checked := (sdqConsulta.FieldByName('ES_SINSAC').AsString = 'S');
  CargarSACPeriodo;
end;

function TfrmEmpresasSAC.Validar: Boolean;
begin
  VerificarMultiple(['Mantenimiento de empresas-sac',
                     fraEmpresaSAC, fraEmpresaSAC.IsSelected, 'Debe especificar una empresa',
                     edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                     edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                     btnAceptar, ValidaSolapamiento(), 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.']);
  Verificar(not chkSinSAC.Checked and not ExistenActivos, btnAceptar, 'Debe existir algún mes activo');
  Result := MsgBox( 'Estas modificaciones implican regenerar las DDJJ. ¿Desea continuar?', MB_ICONQUESTION + MB_YESNO, Self.Caption) = IDYES;
end;

function TfrmEmpresasSAC.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT 1' +
                        '  FROM EMI.IES_EMPRESASAC IES, AFI.AEM_EMPRESA ' +
                        ' WHERE (:pd   BETWEEN ES_PERIODOVIGENCIADESDE AND NVL(ES_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN ES_PERIODOVIGENCIADESDE AND NVL(ES_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  ES_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  ES_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = ES_IDEMPRESA ' +
                        '    AND ES_FECHABAJA IS NULL ' +
                        '    AND ES_IDEMPRESA = :idemp '
                        + iif(ModoABM = maModificacion, ' AND es_id <> ' + SqlValue(sdqConsulta.FieldByName('ES_ID').AsInteger), '')
                        ,
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaSAC.Value]
                         );
end;

procedure TfrmEmpresasSAC.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaSAC.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaSAC.CUIT;
    {Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente, sino hace un error de desbordamiento de pila.}
    sPd   := edPeriodoDesde.Periodo.Valor;  //Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente.
    fraEmpresaSAC.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasSAC.fraEmpresaSACExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasSAC.edPeriodoDesdeExit(Sender: TObject);
begin
//  ValidaContratoVigente;
end;

procedure TfrmEmpresasSAC.FormCreate(Sender: TObject);
begin
  inherited;

  cdsMesesSAC.CreateDataSet;

  FieldBaja := 'ES_FECHABAJA';
  Sql.TableName := 'EMI.IES_EMPRESASAC';

  fraEmpresaSAC.ShowBajas:= True;

  fraEmpresaFiltro.ShowBajas:= True;
end;

procedure TfrmEmpresasSAC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasSAC.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT ies.es_id, aco.co_contrato, ies.es_periodovigenciahasta, ies.es_periodovigenciadesde, ies.es_fechaalta, ies.es_usualta, ' +
                      '      ies.es_sinsac, ies.es_fechabaja, ies.es_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre ' +
                      ' FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.ies_empresasac ies ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '  AND (aem.em_id = ies.es_idempresa) ' +
                      '  AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND ES_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));
     
  inherited;
end;

procedure TfrmEmpresasSAC.CargarSACPeriodo;
begin
  sdqSACPeriodo.SQL.Clear;
  sdqSACPeriodo.SQL.Add('SELECT isp.*, to_char(to_date(sp_mes, ''MM''), ''Month'') MesDesc ' +
                         'FROM emi.isp_sacperiodo isp ' +
                         'WHERE sp_idempresasac = ' + SqlValue(sdqConsulta.FieldbyName('ES_ID').AsInteger)
                         );
  sdqSACPeriodo.Open;
  while not sdqSACPeriodo.Eof do
  begin
    cdsMesesSAC.AppendRecord([sdqSACPeriodo.FieldByName('SP_ID').AsInteger,
                              sdqSACPeriodo.FieldByName('SP_MES').AsString,
                              sdqSACPeriodo.FieldByName('SP_USUALTA').AsString,
                              sdqSACPeriodo.FieldByName('SP_FECHAALTA').AsDateTime,
                              sdqSACPeriodo.FieldByName('SP_USUBAJA').AsString,
                              sdqSACPeriodo.FieldByName('SP_FECHABAJA').AsDateTime,
                              sdqSACPeriodo.FieldByName('SP_IDEMPRESASAC').AsInteger,
                              sdqSACPeriodo.FieldByName('MesDesc').AsString,
                              sdqSACPeriodo.FieldByName('SP_AJUSTESAC').AsFloat]);
    sdqSACPeriodo.Next;
  end;
end;

procedure TfrmEmpresasSAC.fpAbmClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cdsMesesSAC.EmptyDataSet;
  sdqSACPeriodo.Close;
  inherited;
end;

procedure TfrmEmpresasSAC.GuardarSACPeriodo(ides: integer);
begin
  cdsMesesSAC.DisableControls;
  try
    cdsMesesSAC.First;
    while not cdsMesesSAC.Eof do
    begin
      if (cdsMesesSAC.FieldByName('sp_usualta').AsString <> '') then
      begin
        EjecutarSqlST('update emi.isp_sacperiodo ' +
                      'set sp_ajustesac = ' + SqlNumber(cdsMesesSAC.FieldByName('sp_ajustesac').AsFloat) + ',' +
                       '   sp_fechabaja = ' + iif(cdsMesesSAC.FieldByName('sp_usubaja').AsString = '', 'null', 'sysdate') + ', ' +
                      '    sp_usubaja = ' + iif(cdsMesesSAC.FieldByName('sp_usubaja').AsString = '', 'null', SqlValue(cdsMesesSAC.FieldByName('sp_usubaja').AsString)) + ' ' +
                      'where sp_idempresasac = ' + SqlInt(ides) + ' and ' +
                      'sp_mes = ' + SqlValue(cdsMesesSAC.FieldByName('SP_MES').AsString)
                      );
      end
      else
      begin
        EjecutarSqlST('insert into emi.isp_sacperiodo ' +
                      'values(emi.seq_isp_sacperiodo.nextval, ' +
                       SqlValue(cdsMesesSAC.FieldByName('sp_mes').asString) + ', ' +
                       SqlNumber(cdsMesesSAC.FieldByName('sp_ajustesac').AsFloat) + ', ' +
                       SqlValue(Sesion.LoginName) + ', ' +
                       'SYSDATE, ' +
                       'NULL, ' +
                       'NULL, ' +
                       SqlValue(ides) + ')'
                     );
      end;

      cdsMesesSAC.Next;
    end;
  finally
    cdsMesesSAC.EnableControls;
  end;
end;

procedure TfrmEmpresasSAC.tbAgregarMesClick(Sender: TObject);
begin
  Verificar(edPorcentajeSAC.Value = 0, edPorcentajeSAC, 'El SAC no puede ser cero.');

  if (cmbMeses.ItemIndex <> -1) then
  begin
    try
      cdsMesesSAC.Append;
      cdsMesesSAC.FieldByName('sp_mes').AsString := cmbMeses.Value;
      cdsMesesSAC.FieldByName('MesDesc').AsString := copy(cmbMeses.Items[cmbMeses.ItemIndex], 4, Length(cmbMeses.Items[cmbMeses.ItemIndex])-3);
      cdsMesesSAC.FieldByName('SP_AJUSTESAC').AsFloat := edPorcentajeSAC.Value;
      cdsMesesSAC.Post;
    except
      on E: EDBClient do
      begin
        //Key violation
        if E.ErrorCode = 9729 then
        begin
          cdsMesesSAC.Cancel;
          cdsMesesSAC.SetKey;
          cdsMesesSAC.FieldByName('sp_mes').AsString := cmbMeses.Value;
          if cdsMesesSAC.GotoKey then
          begin
            cdsMesesSAC.Edit;
            cdsMesesSAC.FieldByName('SP_AJUSTESAC').AsFloat := edPorcentajeSAC.Value;
            cdsMesesSAC.FieldByName('sp_fechabaja').AsString := '';
            cdsMesesSAC.FieldByName('sp_usubaja').AsString := '';
            cdsMesesSAC.UpdateRecord;
          end;
        end;
      end;
    end;
    cmbMeses.ItemIndex := -1;
    edPorcentajeSAC.Clear;
  end;
end;

procedure TfrmEmpresasSAC.tbEliminarMesClick(Sender: TObject);
begin
  if cdsMesesSAC.Active and not cdsMesesSAC.IsEmpty then
  begin
      cdsMesesSAC.Edit;
      cdsMesesSAC.FieldByName('sp_fechabaja').AsDateTime := Now;
      cdsMesesSAC.FieldByName('sp_usubaja').AsString := Sesion.LoginName;
      cdsMesesSAC.UpdateRecord;
  end;
end;

procedure TfrmEmpresasSAC.GridGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if fpAbm.Visible then
  begin
    if cdsMesesSAC.FieldByName('sp_usubaja').AsString <> '' then
      AFont.Color := clRed;
  end;

end;

procedure TfrmEmpresasSAC.chkSinSACClick(Sender: TObject);
begin
  tbComandosDetalle.Enabled := not chkSinSAC.Checked;
  cdsMesesSAC.DisableControls;
  try
    if chkSinSAC.Checked then
    begin
      cdsMesesSAC.First;
      while not cdsMesesSAC.Eof do
      begin
        if cdsMesesSAC.FieldByName('sp_usubaja').AsString = '' then
        begin
          cdsMesesSAC.Edit;
          cdsMesesSAC.FieldByName('sp_fechabaja').AsDateTime := Now;
          cdsMesesSAC.FieldByName('sp_usubaja').AsString := Sesion.LoginName;
          cdsMesesSAC.UpdateRecord;
        end;
        cdsMesesSAC.Next;
      end;
      cdsMesesSAC.First;
    end;
  finally
    cdsMesesSAC.EnableControls;
  end;
end;

function TfrmEmpresasSAC.ExistenActivos: Boolean;
begin
  result := false;
  if not cdsMesesSAC.IsEmpty then
  begin
    result := false;
    cdsMesesSAC.First;
    while not cdsMesesSAC.Eof do
    begin
      if cdsMesesSAC.FieldByName('SP_FECHABAJA').AsDateTime = 0 then
      begin
        result := true;
        break;
      end;
      cdsMesesSAC.Next;
    end;
  end;

end;

procedure TfrmEmpresasSAC.ReprocesarPeriodos;
var
  sPeriodo, sPeriodoHasta, sUltPeriodoExigible: string;
  acontrato: integer;
begin
  if ModoABM <> maBaja then
  begin
    if (FPeriodoDesdeAnt <> '') and (FPeriodoDesdeAnt < edPeriodoDesde.Periodo.Valor) then
      sPeriodo := PrevPeriodo(FPeriodoDesdeAnt)
    else
      sPeriodo := PrevPeriodo(edPeriodoDesde.Periodo.Valor);

    with GetQueryEx(' SELECT co_fechabaja, co_vigenciadesde ' +
                      ' FROM afi.aco_contrato ' +
                     ' WHERE co_contrato = :contrato', [fraEmpresaSAC.Contrato]) do
    try
      sUltPeriodoExigible := get_ultimoperiodoexigible(fraEmpresaSAC.Contrato, Fields[0].AsDateTime, Fields[1].AsDateTime);
    finally
      free;
    end;

    if edPeriodoHasta.Periodo.IsNull then
      sPeriodoHasta := sUltPeriodoExigible
    else
    begin
      if (FPeriodoHastaAnt < edPeriodoHasta.Periodo.Valor) then
        sPeriodoHasta := iif(sUltPeriodoExigible < edPeriodoHasta.Periodo.Valor, sUltPeriodoExigible, edPeriodoHasta.Periodo.Valor)
      else
        sPeriodoHasta := iif(sUltPeriodoExigible < FPeriodoHastaAnt, sUltPeriodoExigible, FPeriodoHastaAnt);
    end;

    while (sPeriodo <= sPeriodoHasta) do
    begin
      acontrato := get_contratovigente(fraEmpresaSAC.CUIT, sPeriodo);
      if (acontrato > 0) and (Get_CoberturaCobranza(acontrato, sPeriodo)) then
      begin
        with GetQueryEx('SELECT DJ_ID, DJ_ESTADO FROM EMI.IDJ_DDJJ WHERE DJ_CONTRATO = :CONTRATO AND DJ_PERIODO = :PERIODO', [acontrato, sPeriodo]) do
        try
          while not Eof do
          begin
            do_regenerardeclaracion(FieldByName('dj_id').AsInteger, 432, 'M', true,
                             (FieldByName('dj_estado').AsInteger = 1) or (FieldByName('dj_estado').AsInteger = 2));
            next;
          end;
        finally
          free;
        end;
      end;
      sPeriodo := NextPeriodo(sPeriodo);
    end;
  end
  else begin
    with GetQueryEx(' SELECT co_fechabaja, co_vigenciadesde ' +
                      ' FROM afi.aco_contrato ' +
                     ' WHERE co_contrato = :contrato', [sdqConsulta.fieldbyname('co_contrato').AsInteger]) do
    try
       sUltPeriodoExigible := get_ultimoperiodoexigible(sdqConsulta.fieldbyname('co_contrato').AsInteger, Fields[0].AsDateTime, Fields[1].AsDateTime);
    finally
     free;
    end;

    sPeriodoHasta := iif(sUltPeriodoExigible < sdqConsulta.fieldbyname('es_periodovigenciahasta').AsString, sUltPeriodoExigible, sdqConsulta.fieldbyname('es_periodovigenciahasta').AsString);
    sPeriodo := PrevPeriodo(sdqConsulta.fieldbyname('es_periodovigenciadesde').AsString);

    while (sPeriodo <= sPeriodoHasta) do
    begin
      acontrato := get_contratovigente(sdqConsulta.fieldbyname('em_cuit').AsString, sPeriodo);
      if (acontrato > 0) and (Get_CoberturaCobranza(acontrato, sPeriodo)) then
      begin
        with GetQueryEx('SELECT DJ_ID, DJ_ESTADO FROM EMI.IDJ_DDJJ WHERE DJ_CONTRATO = :CONTRATO AND DJ_PERIODO = :PERIODO', [acontrato, sPeriodo]) do
        try
          while not Eof do
          begin
            do_regenerardeclaracion(FieldByName('dj_id').AsInteger, 432, 'M', true,
                             (FieldByName('dj_estado').AsInteger = 1) or (FieldByName('dj_estado').AsInteger = 2));
            next;
          end;
        finally
          free;
        end;
      end;
      sPeriodo := NextPeriodo(sPeriodo);
    end;
  end;
end;

end.


