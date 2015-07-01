unit unfrmEmpresasSinTopeo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCustomGridABM, FieldHider, ShortCutControl, Placemnt,
  artSeguridad, QueryPrint, QueryToFile, ExportDialog, SortDlg, DB,
  SDEngine, StdCtrls, ExtCtrls, FormPanel, Grids, DBGrids, RXDBCtrl,
  ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, unArtFrame, unArtDBAwareFrame,
  unArtDbFrame, unFraEmpresa, PeriodoPicker, Mask, PatternEdit, IntEdit,
  unFraCodigoDescripcion, General, AnsiSql, JvgGroupBox, CheckPanel;

type
  TfrmEmpresasSinTopeo = class(TfrmCustomGridABM)
    fraEmpresaSinTopeo: TfraEmpresa;
    lblCuit: TLabel;
    gbFiltro: TJvgGroupBox;
    fraEmpresaFiltro: TfraEmpresa;
    Label2: TLabel;
    chkPnlMinimo: TCheckPanel;
    cbTopeaAlMinimo: TCheckBox;
    lblPerVigenciaMinDesde: TLabel;
    edPeriodoMinDesde: TPeriodoPicker;
    lblPerVigenciaMinHasta: TLabel;
    edPeriodoMinHasta: TPeriodoPicker;
    chkPnlMaximo: TCheckPanel;
    cbTopeaAlMaximo: TCheckBox;
    Label5: TLabel;
    edPeriodoMaxDesde: TPeriodoPicker;
    Label1: TLabel;
    edPeriodoMaxHasta: TPeriodoPicker;
    chkPnlReprocesamiento: TCheckPanel;
    Label3: TLabel;
    edReprocesoAutomaticoDesde: TPeriodoPicker;
    Label4: TLabel;
    edReprocesoAutomaticoHasta: TPeriodoPicker;
    Label6: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure chkPnlMinimoChange(Sender: TObject);
    procedure chkPnlMaximoChange(Sender: TObject);
    procedure chkPnlReprocesamientoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    procedure ValidaContratoVigente;
    function  ValidaSolapamiento: Boolean;
    procedure ClearControls; override;
    function  DoABM: Boolean; override;
    procedure LoadControls; override;
    function  Validar: Boolean; override;
  end;

var
  frmEmpresasSinTopeo: TfrmEmpresasSinTopeo;

implementation

uses unDmEmision, CustomDlgs, Periodo, unFuncionesEmision, unConstEmision,
  unDmPrincipal, unSesion, SqlFuncs, unCustomConsulta;

{$R *.dfm}

{ TfrmContratosAOmitir }

procedure TfrmEmpresasSinTopeo.ClearControls;
begin
  chkPnlMinimo.Checked := false;
  chkPnlMaximo.Checked := false;
  chkPnlReprocesamiento.Checked := false;
  fraEmpresaSinTopeo.Clear;
  fraEmpresaSinTopeo.Locked := false;
  edPeriodoMinDesde.Clear;
  edPeriodoMinHasta.Clear;
  edPeriodoMaxDesde.Clear;
  edPeriodoMaxHasta.Clear;
  edReprocesoAutomaticoDesde.Clear;
  edReprocesoAutomaticoHasta.Clear;
end;

function TfrmEmpresasSinTopeo.DoABM: Boolean;
begin
 try
    Result := true;
    BeginTrans(true);
    Sql.Clear;
    if ModoABM = maBaja Then
    begin
      Sql.PrimaryKey.Add('ET_ID', sdqConsulta.FieldByName('ET_ID').AsInteger );
      Sql.Fields.Add('ET_USUBAJA', Sesion.LoginName );
      Sql.Fields.Add('ET_FECHABAJA', exDateTime );
      Sql.SqlType := stUpdate;
    end else begin
      Sql.Fields.Add('ET_IDEMPRESA',fraEmpresaSinTopeo.Value);
      if chkPnlMinimo.Checked then
      begin
        Sql.Fields.Add('ET_TOPEAMINIMO',string(iif(cbTopeaAlMinimo.Checked, 'S', 'N')));
        Sql.Fields.Add('ET_PERIODOVIGMINIMODESDE', edPeriodoMinDesde.Periodo.valor);
        Sql.Fields.Add('ET_PERIODOVIGMINIMOHASTA', edPeriodoMinHasta.Periodo.valor);
      end
      else begin
        Sql.Fields.Add('ET_TOPEAMINIMO', exNull);
        Sql.Fields.Add('ET_PERIODOVIGMINIMODESDE', exNull);
        Sql.Fields.Add('ET_PERIODOVIGMINIMOHASTA', exNull);
      end;

      if chkPnlMaximo.Checked then
      begin
        Sql.Fields.Add('ET_TOPEAMAXIMO',string(iif(cbTopeaAlMaximo.Checked, 'S', 'N')));
        Sql.Fields.Add('ET_PERIODOVIGMAXIMODESDE', edPeriodoMaxDesde.Periodo.valor);
        Sql.Fields.Add('ET_PERIODOVIGMAXIMOHASTA', edPeriodoMaxHasta.Periodo.valor);
      end
      else begin
        Sql.Fields.Add('ET_TOPEAMAXIMO', exNull);
        Sql.Fields.Add('ET_PERIODOVIGMAXIMODESDE', exNull);
        Sql.Fields.Add('ET_PERIODOVIGMAXIMOHASTA', exNull);
      end;

      if chkPnlReprocesamiento.Checked then
      begin
        Sql.Fields.Add('ET_REPROCESADDJJ',string(iif(chkPnlReprocesamiento.Checked, 'S', 'N')));
        Sql.Fields.Add('ET_PERIODOVIGREPRODESDE', edReprocesoAutomaticoDesde.Periodo.valor);
        Sql.Fields.Add('ET_PERIODOVIGREPROHASTA', edReprocesoAutomaticoHasta.Periodo.valor);
      end
      else begin
        Sql.Fields.Add('ET_REPROCESADDJJ', exNull);
        Sql.Fields.Add('ET_PERIODOVIGREPRODESDE', exNull);
        Sql.Fields.Add('ET_PERIODOVIGREPROHASTA', exNull);
      end;

      if ModoABM = maAlta Then
      begin
        Sql.PrimaryKey.Add('ET_ID', GetSecNextVal('EMI.SEQ_IES_ID'));
        Sql.Fields.Add('ET_USUALTA', Sesion.LoginName );
        Sql.Fields.Add('ET_FECHAALTA', exDateTime );
      end else begin
        Sql.PrimaryKey.Add('ET_ID', sdqConsulta.FieldByName('ET_ID').AsInteger);
        Sql.Fields.Add('ET_USUMODIF', Sesion.LoginName);
        Sql.Fields.Add('ET_FECHAMODIF', exDateTime );
        Sql.Fields.Add('ET_USUBAJA', exNull);
        Sql.Fields.Add('ET_FECHABAJA', exNull );
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
end;

procedure TfrmEmpresasSinTopeo.LoadControls;
begin
  fraEmpresaSinTopeo.Contrato := sdqConsulta.FieldByName('CO_CONTRATO').AsInteger;

  edPeriodoMinDesde.Periodo.Valor := sdqConsulta.FieldByName('ET_PERIODOVIGMINIMODESDE').AsString;
  chkPnlMinimo.Checked := edPeriodoMinDesde.Periodo.Valor <> '';
  edPeriodoMinHasta.Periodo.Valor := sdqConsulta.FieldByName('ET_PERIODOVIGMINIMOHASTA').AsString;

  edPeriodoMaxDesde.Periodo.Valor := sdqConsulta.FieldByName('ET_PERIODOVIGMAXIMODESDE').AsString;
  chkPnlMaximo.Checked := edPeriodoMaxDesde.Periodo.Valor <> '';
  edPeriodoMaxHasta.Periodo.Valor := sdqConsulta.FieldByName('ET_PERIODOVIGMAXIMOHASTA').AsString;

  edReprocesoAutomaticoDesde.Periodo.valor := sdqConsulta.FieldByName('ET_PERIODOVIGREPRODESDE').AsString;
  chkPnlReprocesamiento.Checked := edReprocesoAutomaticoDesde.Periodo.Valor <> '';
  edReprocesoAutomaticoHasta.Periodo.valor := sdqConsulta.FieldByName('ET_PERIODOVIGREPROHASTA').AsString;

  cbTopeaAlMinimo.Checked := (sdqConsulta.FieldByName('ET_TOPEAMINIMO').AsString = 'S');
  cbTopeaAlMaximo.Checked := (sdqConsulta.FieldByName('ET_TOPEAMAXIMO').AsString = 'S');
  fraEmpresaSinTopeo.Locked := true;
end;

function TfrmEmpresasSinTopeo.Validar: Boolean;
begin

  Verificar(not fraEmpresaSinTopeo.IsSelected, fraEmpresaSinTopeo, 'Debe especificar una empresa');
  Verificar(chkPnlMinimo.Checked and (edPeriodoMinDesde.Periodo.Valor = ''), edPeriodoMinDesde, 'Debe especificar el período desde');
  Verificar(chkPnlMaximo.Checked and (edPeriodoMaxDesde.Periodo.Valor = ''), edPeriodoMaxDesde, 'Debe especificar el período desde');

  Verificar(chkPnlMinimo.Checked and not ValidaPeriodos(edPeriodoMinDesde.Periodo, edPeriodoMinHasta.Periodo,False,True,True), edPeriodoMinDesde, 'Debe especificar el período desde');
  Verificar(chkPnlMaximo.Checked and not ValidaPeriodos(edPeriodoMaxDesde.Periodo, edPeriodoMaxHasta.Periodo,False,True,True), edPeriodoMaxDesde, 'Debe especificar el período desde');

  Verificar((chkPnlMinimo.Checked or chkPnlMaximo.Checked) and not ValidaSolapamiento(), btnAceptar, 'Verifique que el rango de periodos ingresado no esté solapado con otros rangos generados previamente.');

  Verificar(chkPnlReprocesamiento.Checked and not ValidaPeriodos(edReprocesoAutomaticoDesde.Periodo, edReprocesoAutomaticoHasta.Periodo,False,True,True), edReprocesoAutomaticoDesde, 'Debe especificar el período desde');

  result := true;
end;

function TfrmEmpresasSinTopeo.ValidaSolapamiento: Boolean;
begin
  Result:= not ExisteSqlEx( 'SELECT *' +
                        '  FROM EMI.IET_EMPRESATOPEO IET, AFI.AEM_EMPRESA ' +
                        ' WHERE ((:pd   BETWEEN ET_PERIODOVIGMINIMODESDE AND NVL(ET_PERIODOVIGMINIMOHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN ET_PERIODOVIGMINIMODESDE AND NVL(ET_PERIODOVIGMINIMOHASTA, ''299901'')' +
                        '    OR  ET_PERIODOVIGMINIMODESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  ET_PERIODOVIGMINIMOHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) '+

                        '    OR (:pd   BETWEEN ET_PERIODOVIGMAXIMODESDE AND NVL(ET_PERIODOVIGMAXIMOHASTA, ''299901'') ' +
                        '    OR  nvl(:ph, ''299901'') BETWEEN ET_PERIODOVIGMAXIMODESDE AND NVL(ET_PERIODOVIGMAXIMOHASTA, ''299901'')' +
                        '    OR  ET_PERIODOVIGMAXIMODESDE BETWEEN :pd  AND NVL(:ph , ''299901'')'  +
                        '    OR  ET_PERIODOVIGMAXIMOHASTA BETWEEN :pd  AND NVL(:ph , ''299901'')) ) '+

                        '    AND EM_ID = ET_IDEMPRESA ' +
                        '    AND ET_FECHABAJA IS NULL ' +
                        '    AND ET_IDEMPRESA = :idemp '
                        + iif(ModoABM = maModificacion, ' AND et_id <> ' + SqlValue(sdqConsulta.FieldByName('ET_ID').AsInteger), '')
                        ,
                        [edPeriodoMinDesde.Periodo.Valor, edPeriodoMinHasta.Periodo.Valor,
                         edPeriodoMinDesde.Periodo.Valor, edPeriodoMinHasta.Periodo.Valor,
                         edPeriodoMinDesde.Periodo.Valor, edPeriodoMinHasta.Periodo.Valor,

                         edPeriodoMaxDesde.Periodo.Valor, edPeriodoMaxHasta.Periodo.Valor,
                         edPeriodoMaxDesde.Periodo.Valor, edPeriodoMaxHasta.Periodo.Valor,
                         edPeriodoMaxDesde.Periodo.Valor, edPeriodoMaxHasta.Periodo.Valor,

                         fraEmpresaSinTopeo.Value
                        ]
                         );
end;

(*
procedure TfrmEmpresasSinTopeo.ValidaContratoVigente;
var
 sCuit, sPd : string;
begin
  if not fraEmpresaSinTopeo.IsEmpty and (edPeriodoDesde.Text <> '') then
  begin
    sCuit := fraEmpresaSinTopeo.CUIT;
    sPd   := edPeriodoDesde.Periodo.Valor;  //Ojo !!! esta sentencia no puede ir en el Onchange del mismo componente.
    fraEmpresaSinTopeo.Contrato := get_contratovigente(sCuit,sPd);
  end;
end;
*)

procedure TfrmEmpresasSinTopeo.FormCreate(Sender: TObject);
begin
  inherited;
  FieldBaja := 'ET_FECHABAJA';
  Sql.TableName := 'EMI.IET_EMPRESATOPEO';

  fraEmpresaSinTopeo.ShowBajas:= True;

  fraEmpresaFiltro.ShowBajas:= True;
end;

procedure TfrmEmpresasSinTopeo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmEmpresasSinTopeo.tbRefrescarClick(Sender: TObject);
begin
  sdqConsulta.SQL.Clear;
  sdqConsulta.SQL.Add(' SELECT iet.et_id, aco.co_contrato, iet.et_periodovigminimohasta, iet.et_periodovigminimodesde, iet.et_periodovigmaximohasta, iet.et_periodovigmaximodesde, iet.et_fechaalta, iet.et_usualta, ' +
                      '      iet.et_fechabaja, iet.et_usubaja, aco.co_idempresa, aem.em_id, aem.em_cuit, aem.em_nombre, et_topeaminimo, et_topeamaximo, et_reprocesaddjj, et_periodovigreprodesde, et_periodovigreprohasta ' +
                      ' FROM afi.aem_empresa aem, afi.aco_contrato aco, emi.iet_empresatopeo iet ' +
                      ' WHERE (aem.em_id = aco.co_idempresa) ' +
                      '  AND (aem.em_id = iet.et_idempresa) ' +
                      '  AND (co_contrato = art.afiliacion.get_ultcontrato(aem.em_cuit)) ');

  if fraEmpresaFiltro.IsSelected then
     sdqConsulta.SQL.Add(' AND ET_IDEMPRESA = ' + SqlValue(fraEmpresaFiltro.Value));

  inherited;
end;

procedure TfrmEmpresasSinTopeo.chkPnlMinimoChange(Sender: TObject);
begin
  if not chkPnlMinimo.Checked then
  begin
    cbTopeaAlMinimo.Checked := false;
    edPeriodoMinDesde.Clear;
    edPeriodoMinHasta.Clear;
  end;
end;

procedure TfrmEmpresasSinTopeo.chkPnlMaximoChange(Sender: TObject);
begin
  if not chkPnlMaximo.Checked then
  begin
    cbTopeaAlMaximo.Checked := false;
    edPeriodoMaxDesde.Clear;
    edPeriodoMaxHasta.Clear;
  end
end;

procedure TfrmEmpresasSinTopeo.chkPnlReprocesamientoChange(
  Sender: TObject);
begin
  if not chkPnlReprocesamiento.Checked then
  begin
    edReprocesoAutomaticoDesde.Clear;
    edReprocesoAutomaticoHasta.Clear;
  end
end;

end.


