unit unFrmEmpresasSinFondoHip;

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
  TfrmEmpresasSinFondoHip = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    fraEmpresaSinFondo: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
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
  frmEmpresasSinFondoHip: TfrmEmpresasSinFondoHip;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmEmpresasSinFondoHip.ClearControls;
begin
  fraEmpresaSinFondo.Clear;
  fraEmpresaSinFondo.Locked := false;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
end;

function TfrmEmpresasSinFondoHip.DoABM: Boolean;
begin
 try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('EF_ID', sdqConsulta.FieldByName('EF_ID').AsInteger );
      Sql.Fields.Add('EF_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('EF_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('EF_IDEMPRESA',fraEmpresaSinFondo.Value);
      Sql.Fields.Add('EF_PERIODOVIGENCIADESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('EF_PERIODOVIGENCIAHASTA', edPeriodoHasta.Periodo.valor);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('EF_ID', GetSecNextVal('EMI.SEQ_IEF_ID'));
        Sql.Fields.Add('EF_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('EF_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('EF_ID', sdqConsulta.FieldByName('EF_ID').AsInteger);
        Sql.Fields.Add('EF_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('EF_FECHAMODIF', exDateTime );
        Sql.Fields.Add('EF_USUBAJA', exNull);
        Sql.Fields.Add('EF_FECHABAJA', exNull );
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

procedure TfrmEmpresasSinFondoHip.LoadControls;
begin
  fraEmpresaSinFondo.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;
  edPeriodoDesde.Periodo.Valor := sdqConsulta.FieldByName('EF_PERIODOVIGENCIADESDE').AsString;
  edPeriodoHasta.Periodo.Valor := sdqConsulta.FieldByName('EF_PERIODOVIGENCIAHASTA').AsString;
  fraEmpresaSinFondo.Locked := true;
end;

function TfrmEmpresasSinFondoHip.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de empresas a omitir',
                                fraEmpresaSinFondo, fraEmpresaSinFondo.IsSelected, 'Debe especificar una empresa',
                                edPeriodoDesde, edPeriodoDesde.Periodo.Valor <> '', 'Debe especificar el período desde',
                                edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                                btnAceptar,ValidaSolapamiento(), 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.'
                                ]);
end;
function TfrmEmpresasSinFondoHip.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT *' +
                        '  FROM EMI.IEF_EMPRESAFONDO IER, AFI.AEM_EMPRESA ' +
                        '  WHERE (:pd   BETWEEN EF_PERIODOVIGENCIADESDE AND NVL(EF_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN EF_PERIODOVIGENCIADESDE AND NVL(EF_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  EF_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  EF_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND EM_ID = EF_IDEMPRESA ' +
                        '    AND EF_FECHABAJA IS NULL ' +
                        '    AND EF_IDEMPRESA = :idemp '
                        + iif(ModoABM = maModificacion, ' AND ef_id <> ' + SqlValue(sdqConsulta.FieldByName('EF_ID').AsInteger), '')
                        ,
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaSinFondo.Value]
                         );
end;

procedure TfrmEmpresasSinFondoHip.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaSinFondo.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaSinFondo.CUIT;
    sPd   := edPeriodoDesde.Periodo.Valor;  //Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente.
    fraEmpresaSinFondo.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;

procedure TfrmEmpresasSinFondoHip.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'EF_FECHABAJA';
  Sql.TableName := 'EMI.IEF_EMPRESAFONDO';

  fraEmpresaSinFondo.ShowBajas:= True;

  fraEmpresaFiltro.ShowBajas:= True;
end;

procedure TfrmEmpresasSinFondoHip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasSinFondoHip.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT ief.ef_id, aco.co_contrato, ief.ef_periodovigenciahasta, ief.ef_periodovigenciadesde, ief.ef_fechaalta, ief.ef_usualta, ' +
                      '      ief.ef_fechabaja, ief.ef_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre ' +
                      ' FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.ief_empresafondo ief ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '  AND (aem.em_id = ief.ef_idempresa) ' +
                      '  AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND EF_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));

  inherited;
end;

end.


