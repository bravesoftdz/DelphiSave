unit unFrmContratosAOmitir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion;

type
  TfrmContratosAOmitir = class(TfrmCustomGridABM)
    lblPerVigenciaDesde: TLabel;
    Label5: TLabel;
    edPeriodoHasta: TPeriodoPicker;
    edPeriodoDesde: TPeriodoPicker;
    fraEmpresaOmitir: TfraEmpresa;
    Label1: TLabel;
    lblMotrechazo: TLabel;
    fraMotivoRechazo: TfraCodigoDescripcion;
    procedure fraEmpresaOmitirExit(Sender: TObject);
    procedure edPeriodoDesdeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FSFormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ValidaContratoVigente;
    function  ValidaSolapamiento: Boolean;
    procedure Incializar;
    function  ValidaCobertura(AContrato: Integer; APeriodo : String) : Boolean;

    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
  end;

var
  frmContratosAOmitir: TfrmContratosAOmitir;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmContratosAOmitir.ClearControls;
begin
  fraEmpresaOmitir.Clear;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
end;

function TfrmContratosAOmitir.DoABM: Boolean;
begin
 try
    Result := true;
    BeginTrans();
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('CM_ID', sdqConsulta.FieldByName('CM_ID').AsInteger );
      Sql.Fields.Add('CM_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('CM_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('CM_CONTRATO',fraEmpresaOmitir.Contrato);
      Sql.Fields.Add('CM_PERIODODESDE', edPeriodoDesde.Periodo.valor);
      Sql.Fields.Add('CM_PERIODOHASTA', edPeriodoHasta.Periodo.valor);

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('CM_ID', GetSecNextVal('EMI.SEQ_ICM_ID'));
        Sql.Fields.Add('CM_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('CM_FECHAALTA', exDateTime );
      end else begin
        Exit;  //no se permite modi.
{        Sql.PrimaryKey.Add('TF_ID', sdqConsulta.FieldByName('TF_ID').AsInteger);
        Sql.Fields.Add('TF_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('TF_FECHAMODIF', exDateTime );
        Sql.Fields.Add('TF_USUBAJA', exNull );
        Sql.Fields.Add('TF_FECHABAJA', exNull );}
      end;
    end;
    EjecutarSqlST( GetSqlABM );
    CommitTrans();
  except
    on E: Exception do begin
       Result := false;
       Rollback(true);
       ErrorMsg(E, 'Error al guardar el formulario.');
    end;
  end;
  //fixme 1.j.3.	ejecuta el Caso de Uso CU-EMI-0005 "Administración de Presentaciones"
end;

procedure TfrmContratosAOmitir.LoadControls;
begin
  fraEmpresaOmitir.ShowBajas:= True;
  edPeriodoDesde.Clear;
  edPeriodoHasta.Clear;
end;

function TfrmContratosAOmitir.Validar: Boolean;
begin
  Result := VerificarMultiple(['Administración de Tipos de Formularios',
                                edPeriodoDesde, ValidaPeriodos(edPeriodoDesde.Periodo, edPeriodoHasta.Periodo,False,True,True), 'El período desde no puede ser mayor al hasta.', // valida periodo desde obligatorio.
                                edPeriodoDesde, ValidaCobertura(fraEmpresaOmitir.Contrato, edPeriodoDesde.Periodo.Valor), 'Debe ingresar un periodo desde para el cual esté dentro de la cobertura del contrato.',
                                fraMotivoRechazo, fraMotivoRechazo.IsSelected, 'Debe especificar un motivo de rechazo.',     //valida motivo de rechazo obligatorio
                                btnAceptar,ValidaSolapamiento(), 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.'
                                ]);
end;
function TfrmContratosAOmitir.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT *' +
                        '  FROM EMI.ICM_CONTRATOOMITIR  ICM ' +
                        ' WHERE (:pd   BETWEEN CM_PERIODOVIGENCIADESDE AND NVL(CM_PERIODOVIGENCIAHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN CM_PERIODOVIGENCIADESDE AND NVL(CM_PERIODOVIGENCIAHASTA, ''299901'')' +
                        '    OR  CM_PERIODOVIGENCIADESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  CM_PERIODOVIGENCIAHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+
                        '    AND CM_FECHABAJA IS NULL ' +
                        '    AND EXISTS (' +
                        '                SELECT *' +
                        '                  FROM AFI.ACO_CONTRATO ACO, AFI.AEM_EMPRESA AEM' +
                        '                 WHERE ACO.CO_CONTRATO = ICM.CM_CONTRATO ' +
                        '                   and aco.CO_IDEMPRESA = aem.em_id '+
                        '                   AND aem.em_cuit = :idemp  )',
                        [edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor,edPeriodoDesde.Periodo.Valor, edPeriodoHasta.Periodo.Valor, fraEmpresaOmitir.CUIT]
                         );
end;

procedure TfrmContratosAOmitir.ValidaContratoVigente;
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

procedure TfrmContratosAOmitir.fraEmpresaOmitirExit(Sender: TObject);
begin
  ValidaContratoVigente;
end;

procedure TfrmContratosAOmitir.edPeriodoDesdeExit(Sender: TObject);
begin
  ValidaContratoVigente;
end;

procedure TfrmContratosAOmitir.Incializar;
begin
 with fraMotivoRechazo do
  begin
    TableName   := 'IMR_MOTIVORECHAZO';
    FieldID     := 'MR_ID';
    FieldCodigo := 'MR_ID';
    FieldDesc   := 'MR_DESCRIPCION';
    FieldBaja   := 'MR_FECHABAJA';
    Showbajas   := True;
  end;
  FieldBaja := 'CM_FECHABAJA';
  Sql.TableName := 'EMI.ICM_CONTRATOOMITIR';
end;

function TfrmContratosAOmitir.ValidaCobertura(AContrato: Integer; APeriodo : String) : Boolean;
begin
  Result := Get_CoberturaCobranza(AContrato, APeriodo);
end;


procedure TfrmContratosAOmitir.FormCreate(Sender: TObject);
begin
  inherited;
  Incializar;
end;

procedure TfrmContratosAOmitir.FSFormShow(Sender: TObject);
begin
  inherited;
  tbModificar.Enabled := False;
end;

procedure TfrmContratosAOmitir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.


