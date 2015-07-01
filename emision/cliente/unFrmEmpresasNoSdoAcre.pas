unit unFrmEmpresasNoSdoAcre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox;

type
  TfrmEmpresasNoSdoAcre = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    fraEmpresaNoSdoAcre: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
  private
    FPeriodoDesdeAnt: String;
    FPeriodoHastaAnt: String;
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
  frmEmpresasNoSdoAcre: TfrmEmpresasNoSdoAcre;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta, Periodos;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmEmpresasNoSdoAcre.ClearControls;
begin
  fraEmpresaNoSdoAcre.Clear;
  fraEmpresaNoSdoAcre.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
  FPeriodoDesdeAnt:= '';
  FPeriodoHastaAnt:= '';
end;

function TfrmEmpresasNoSdoAcre.DoABM: Boolean;
var
  sPeriodo, sPeriodoHasta, sUltPeriodoExigible: string;
  acontrato: integer;
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
      Sql.Fields.Add('EA_IDEMPRESA',fraEmpresaNoSdoAcre.Value);
      Sql.Fields.Add('EA_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('EA_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('EA_ID', GetSecNextVal('EMI.SEQ_IES_ID'));
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

    if ModoABM <> maBaja then
    begin

      if (FPeriodoDesdeAnt <> '') and (FPeriodoDesdeAnt < edPeriodoDesde.Periodo.Valor) then
        sPeriodo := PrevPeriodo(FPeriodoDesdeAnt)
      else
        sPeriodo := PrevPeriodo(edPeriodoDesde.Periodo.Valor);

      with GetQueryEx(' SELECT co_fechabaja, co_vigenciadesde ' +
                      ' FROM afi.aco_contrato ' +
                      ' WHERE co_contrato = :contrato', [fraEmpresaNoSdoAcre.Contrato]) do
      try
         sUltPeriodoExigible := get_ultimoperiodoexigible(fraEmpresaNoSdoAcre.Contrato, Fields[0].AsDateTime, Fields[1].AsDateTime);
      finally
       free;
      end;

      if edPeriodoHasta.Periodo.IsNull then
        sPeriodoHasta := sUltPeriodoExigible
      else
      begin
        if (FPeriodoHastaAnt < edPeriodoHasta.Periodo.Valor) then
          sPeriodoHasta := iif(sUltPeriodoExigible < edPeriodoHasta.Periodo.Valor, edPeriodoHasta.Periodo.Valor, sUltPeriodoExigible)
        else
          sPeriodoHasta := iif(sUltPeriodoExigible < FPeriodoHastaAnt, FPeriodoHastaAnt, sUltPeriodoExigible);
      end;

      while (sPeriodo <= sPeriodoHasta) do
      begin
        acontrato := get_contratovigente(fraEmpresaNoSdoAcre.CUIT, sPeriodo);
        if (acontrato > 0) and (Get_CoberturaCobranza(acontrato, sPeriodo)) then
          EjecutarStoreST( 'emi.emision.do_devengadocontrato(' + SqlValue(acontrato)  + ', ' + SqlValue(sPeriodo) + ', NULL, TRUE);');
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

      if sdqConsulta.fieldbyname('ea_periodovigenciahasta').AsString <> '' then
        sPeriodoHasta := iif(sUltPeriodoExigible < sdqConsulta.fieldbyname('ea_periodovigenciahasta').AsString, sUltPeriodoExigible, sdqConsulta.fieldbyname('ea_periodovigenciahasta').AsString)
      else
        sPeriodoHasta := sUltPeriodoExigible;
        
      sPeriodo := PrevPeriodo(sdqConsulta.fieldbyname('ea_periodovigenciadesde').AsString);

      while (sPeriodo <= sPeriodoHasta) do
      begin
        acontrato := get_contratovigente(sdqConsulta.fieldbyname('em_cuit').AsString, sPeriodo);
        if (acontrato > 0) and (Get_CoberturaCobranza(acontrato, sPeriodo)) then
          EjecutarStoreST( 'emi.emision.do_devengadocontrato(' + SqlValue(acontrato)  + ', ' + SqlValue(sPeriodo) + ', NULL, TRUE);');
        sPeriodo := NextPeriodo(sPeriodo);
      end;
    end;

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

procedure TfrmEmpresasNoSdoAcre.LoadControls;
begin
  fraEmpresaNoSdoAcre.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('EA_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('EA_PERIODOVIGENCIAHASTA').AsString;
  fraEmpresaNoSdoAcre.Locked := true;
  FPeriodoDesdeAnt:= edPeriodoDesde.Periodo.Valor;
  FPeriodoHastaAnt:= edPeriodoHasta.Periodo.Valor;
end;

function TfrmEmpresasNoSdoAcre.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de empresas a omitir',
                                fraEmpresaNoSdoAcre, fraEmpresaNoSdoAcre.IsSelected, 'Debe especificar una empresa',
                                edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                                edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                                btnAceptar,ValidaSolapamiento(), 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.'
                                ]);
end;
function TfrmEmpresasNoSdoAcre.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT *' +
                        '  FROM EMI.IEA_EMPRESACORRESPSDOACR IEA, AFI.AEM_EMPRESA ' +
                        ' WHERE (:pd   BETWEEN EA_PERIODOVIGENCIADESDE AND NVL(EA_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN EA_PERIODOVIGENCIADESDE AND NVL(EA_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  EA_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  EA_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = EA_IDEMPRESA ' +
                        '    AND EA_FECHABAJA IS NULL ' +
                        '    AND EA_IDEMPRESA = :idemp '
                        + iif(ModoABM = maModificacion, ' AND ea_id <> ' + SqlValue(sdqConsulta.FieldByName('EA_ID').AsInteger), '')
                        ,
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaNoSdoAcre.Value]
                         );
end;

procedure TfrmEmpresasNoSdoAcre.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaNoSdoAcre.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaNoSdoAcre.CUIT;
    sPd   := edPeriodoDesde.Periodo.Valor;  //Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente.
    fraEmpresaNoSdoAcre.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasNoSdoAcre.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'EA_FECHABAJA';
  Sql.TableName := 'EMI.IEA_EMPRESACORRESPSDOACR';

  fraEmpresaNoSdoAcre.ShowBajas:= True;

  fraEmpresaFiltro.ShowBajas:= True;
end;

procedure TfrmEmpresasNoSdoAcre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasNoSdoAcre.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT iea.ea_id, aco.co_contrato, iea.ea_periodovigenciahasta, iea.ea_periodovigenciadesde, iea.ea_fechaalta, iea.ea_usualta, ' +
                      '      iea.ea_fechabaja, iea.ea_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre ' +
                      ' FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.iea_empresacorrespsdoacr iea ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '  AND (aem.em_id = iea.ea_idempresa) ' +
                      '  AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND EA_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));

  inherited;
end;

end.


