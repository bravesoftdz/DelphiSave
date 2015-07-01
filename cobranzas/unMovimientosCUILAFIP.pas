unit unMovimientosCUILAFIP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unCustomGridABM, FieldHider,
  ShortCutControl, RxPlacemnt, artSeguridad, QueryPrint, QueryToFile,
  ExportDialog, SortDlg, Data.DB, SDEngine, Vcl.StdCtrls, Vcl.ExtCtrls,
  FormPanel, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ArtComboBox, ArtDBGrid,
  Vcl.ComCtrls, Vcl.ToolWin, unArtFrame, unArtDBAwareFrame, unArtDbFrame,
  unFraEmpresa, PeriodoPicker, Vcl.Mask;

type
  TfrmMovimientosCUILAFIP = class(TfrmCustomGridABM)
    ShortCutControl1: TShortCutControl;
    gbEmpresa: TGroupBox;
    Label1: TLabel;
    fraEmpresaBusq: TfraEmpresa;
    Label2: TLabel;
    edPeriodoAltaModif: TPeriodoPicker;
    gbPeriod: TGroupBox;
    edCUILAltaModif: TMaskEdit;
    Label3: TLabel;
    edPeriodoBusq: TPeriodoPicker;
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
  private
  public
  protected
    function DoABM: Boolean; override;
    function Validar: Boolean; override;
    procedure ClearControls; override;
    procedure LoadControls; override;
  end;

var
  frmMovimientosCUILAFIP: TfrmMovimientosCUILAFIP;

implementation

uses
  unPrincipal, unDmPrincipal, AnsiSql, SqlFuncs, CustomDlgs, CUIT, StrFuncs,
  unSesion, unFuncionesEmision, unCobranzas, unArt, unAfiliaciones;

{$R *.dfm}

procedure TfrmMovimientosCUILAFIP.ClearControls;
begin
  //
end;

function TfrmMovimientosCUILAFIP.DoABM: Boolean;
var
  sPeriodoAnt, sPeriodo: String;
  iContratoAnt, iContrato: Integer;
  dImporte: Currency;
  FRecaudacion: TDateTime;
begin
  with Sql do
    begin
      Clear;

      if ModoABM = maModificacion then
        begin
          sPeriodoAnt := sdqConsulta.FieldByName('PERIODO').AsString;
          sPeriodo    := edPeriodoAltaModif.Periodo.Valor;

          PrimaryKey.Add('MC_ID',         sdqConsulta.FieldByName('ID').AsInteger);
          Fields.Add('MC_PERIODO',        sPeriodo);
          Fields.Add('MC_CUIL',           edCUILAltaModif.Text);

          SqlType := stUpdate;
        end;
    end;

   BeginTrans;
   try
     Result := inherited DoABM;

     if Result then
       begin
         iContratoAnt := Get_ContratoVigente(sdqConsulta.FieldByName('CUIT').AsString, sPeriodoAnt, IDTIPOREG_PCP);
         iContrato    := Get_ContratoVigente(sdqConsulta.FieldByName('CUIT').AsString, sPeriodo, IDTIPOREG_PCP);

         if sPeriodo <> sPeriodoAnt then
           begin
              dImporte     := sdqConsulta.FieldByName('IMPORTE').AsCurrency;
              FRecaudacion := sdqConsulta.FieldByName('FECARECAUDACION').AsDateTime;

              DoGenerarMovimiento(iContratoAnt, sPeriodoAnt, '100', -dImporte, FRecaudacion, False);
              Do_RedevengarConciliar(iContratoAnt, sPeriodoAnt, Sesion.UserID, True, False);

              DoGenerarMovimiento(iContrato, sPeriodo, '100', dImporte, FRecaudacion, False);
              Do_RedevengarConciliar(iContrato, sPeriodo, Sesion.UserID, True, False);
           end;

         if iContratoAnt > 0 then
           Do_ReprocesarDDJJPCP(iContratoAnt, sPeriodoAnt);

         if (iContrato <> iContratoAnt) or (sPeriodo <> sPeriodoAnt) then
           Do_ReprocesarDDJJPCP(iContrato, sPeriodo);
       end;

     CommitTrans;
  except
    on E: Exception do
      begin
        RollBack;
        Raise Exception.Create( E.Message + CRLF + 'Error al realizar ajustes PCP' );
      end;
  end;
end;

procedure TfrmMovimientosCUILAFIP.FormCreate(Sender: TObject);
begin
  inherited;
  Sql.TableName := 'ZMC_MOVIMIENTOCUILAFIP';

  fraEmpresaBusq.ShowBajas := True;
end;

procedure TfrmMovimientosCUILAFIP.LoadControls;
begin
  with sdqConsulta do
    begin
      edCUILAltaModif.Text             := FieldByName('CUIL').AsString;
      edPeriodoAltaModif.Periodo.Valor := FieldByName('PERIODO').AsString;
    end;
end;

procedure TfrmMovimientosCUILAFIP.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if sdqConsulta.FieldByName('IMPORTE') is TFloatField then
     TFloatField(sdqConsulta.FieldByName('IMPORTE')).Currency := True;
end;

procedure TfrmMovimientosCUILAFIP.tbLimpiarClick(Sender: TObject);
begin
  inherited;

  fraEmpresaBusq.Clear;
  edPeriodoBusq.Clear;
end;

procedure TfrmMovimientosCUILAFIP.tbRefrescarClick(Sender: TObject);
var
  sSql: String;
  sWhere: String;
begin
  sWhere := '';

  sSql := 'SELECT MC_CUITCONT CUIT, MC_PERIODO PERIODO, MC_CUIL CUIL, ART.AFILIACION.GET_CONTRATOVIGENTE(MC_CUITCONT, MC_PERIODO) CONTRATO, ' +
                 'EM_NOMBRE RSOCIAL, NVL(ROUND(DECODE(MC_INDDBCR, ''C'', 1, -1) * MC_IMPORTE / 100 / (1 - 8 / 1000), 2), 0) IMPORTE, ' +
                 'MC_FECREC FECARECAUDACION, MC_ID ID ' +
            'FROM ZMC_MOVIMIENTOCUILAFIP, AEM_EMPRESA ' +
           'WHERE MC_CUITCONT = EM_CUIT';

  if fraEmpresaBusq.IsSelected then
    sWhere := sWhere + ' AND MC_CUITCONT = ' + SqlValue(fraEmpresaBusq.CUIT);

  if not IsEmptyString(edPeriodoBusq.Periodo.Valor) then
    sWhere := sWhere + ' AND MC_PERIODO = ' + SqlValue(edPeriodoBusq.Periodo.Valor);

  sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
end;

function TfrmMovimientosCUILAFIP.Validar: Boolean;
begin
  Verificar(IsEmptyString(edPeriodoAltaModif.Periodo.Valor), edPeriodoAltaModif, 'Debe ingresar un periodo.');
  Verificar(Get_ContratoVigente(sdqConsulta.FieldByName('CUIT').AsString, edPeriodoAltaModif.Periodo.Valor, IDTIPOREG_PCP) = 0, edPeriodoAltaModif, 'El periodo no corresponde a la vigencia del contrato.');
  Verificar(IsEmptyString(edCUILAltaModif.Text), edCUILAltaModif, 'Debe ingresar una CUIL.');
  Verificar(not IsCuil(edCUILAltaModif.Text), edCUILAltaModif, 'La CUIL es inválida.');

  Result := True
end;

end.

