unit unfrmRecalculoDevengado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unfraInfoEmpresa, unArtDbFrame, unFraEmpresa, Mask,
  ToolEdit, DateComboBox, unArtFrame, unArtDBAwareFrame,
  unFraStaticCodigoDescripcion, unfraStaticActividad, JvgGroupBox, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, FieldHider, SortDlg, DB,
  SDEngine, unFuncionesEmision, unEspera, AnsiSql, unDmPrincipal, VCLExtra,
  ComCtrls, ToolWin, unfrmObservacion, unArt, unDmEmision, ExtCtrls, CustomDlgs,
  Menus, DBClient, Provider, DBCtrls, DbFuncs, General, Strfuncs, FSForm, unSesion;

type
  TfrmPedidoRecalculoDev = class(TFSForm)
    gbEmpresa: TJvgGroupBox;
    gbRazonSocial: TGroupBox;
    lblMotivoBaja: TLabel;
    lblCUIT: TLabel;
    lblEstado: TLabel;
    lblFechaBaja: TLabel;
    edMOTIVO_BAJA: TEdit;
    cmbFECHABAJA: TDateComboBox;
    fraEmpresa: TfraEmpresa;
    edESTADO: TEdit;
    gbVigencia: TGroupBox;
    lblFechaHasta: TLabel;
    lblFechaDesde: TLabel;
    cmbVIGENCIAHASTA: TDateComboBox;
    cmbVIGENCIADESDE: TDateComboBox;
    gbDatosAdicionales: TGroupBox;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    SortDialog: TSortDialog;
    FieldHider: TFieldHider;
    lblBlockNota: TLabel;
    edBlockNota: TMemo;
    fraInfoEmpresa: TfraInfoEmpresa;
    sdqConsultaRC_CONTRATO: TFloatField;
    sdqConsultaRC_PERIODO: TStringField;
    sdqConsultaCUOTA: TFloatField;
    sdqConsultaRC_DEVENGADOCUOTA: TFloatField;
    sdqConsultaRC_DEVENGADOFONDO: TFloatField;
    sdqConsultaIMP598: TFloatField;
    sdqConsultaIMP599: TFloatField;
    sdqConsultaPREVISTO: TFloatField;
    sdqConsultaPAGADOCUOTA: TFloatField;
    sdqConsultaIMP799: TFloatField;
    sdqConsultaIMPAJUSTES: TFloatField;
    sdqConsultaDIFCUOTA: TFloatField;
    sdqConsultaIMP561: TFloatField;
    sdqConsultaIMP551: TFloatField;
    sdqConsultaIMP560: TFloatField;
    sdqConsultaDIFFONDO: TFloatField;
    sdqConsultaCORRESPFONDO: TStringField;
    sdqConsultaEMPLEADOS: TFloatField;
    sdqConsultaCORRESPFNC: TFloatField;
    sdqConsultaCORRESPFFE: TFloatField;
    sdqConsultaIMP570: TFloatField;
    StatusBar: TStatusBar;
    tbComandosDetalle: TToolBar;
    btnRecalcular: TToolButton;
    btnSinCambios: TToolButton;
    btnRecalculaSinModif: TToolButton;
    tbLimpiar: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    pnlRecalculoBotttom: TPanel;
    btnAplicar: TButton;
    btnCancel: TButton;
    btnModifObs: TToolButton;
    btnSelectAll: TToolButton;
    btnSalir: TToolButton;
    mnuSelect: TPopupMenu;
    mnuSeleccionarTodo: TMenuItem;
    mnuSeleccionarResto: TMenuItem;
    btnSumatoria: TToolButton;
    cdsConsulta: TClientDataSet;
    cdsConsultaRC_CONTRATO: TFloatField;
    cdsConsultaRC_PERIODO: TStringField;
    cdsConsultaCUOTA: TFloatField;
    cdsConsultaRC_DEVENGADOCUOTA: TFloatField;
    cdsConsultaRC_DEVENGADOFONDO: TFloatField;
    cdsConsultaIMP598: TFloatField;
    cdsConsultaIMP599: TFloatField;
    cdsConsultaPREVISTO: TFloatField;
    cdsConsultaPAGADOCUOTA: TFloatField;
    cdsConsultaIMP799: TFloatField;
    cdsConsultaIMPAJUSTES: TFloatField;
    cdsConsultaDIFCUOTA: TFloatField;
    cdsConsultaIMP561: TFloatField;
    cdsConsultaIMP551: TFloatField;
    cdsConsultaIMP560: TFloatField;
    cdsConsultaDIFFONDO: TFloatField;
    cdsConsultaCORRESPFONDO: TStringField;
    cdsConsultaEMPLEADOS: TFloatField;
    cdsConsultaCORRESPFNC: TFloatField;
    cdsConsultaCORRESPFFE: TFloatField;
    cdsConsultaIMP570: TFloatField;
    cdsConsultaarregloFondo: TStringField;
    cdsConsultaCHECK_ESTADO: TStringField;
    cdsConsultaObservacion: TStringField;
    ToolButton3: TToolButton;
    pnlObservacion: TPanel;
    edObservacion: TDBMemo;
    edNormObservacion: TDBEdit;
    cdsConsultaIdObservacion: TIntegerField;
    cdsConsultaObservacionDesc: TStringField;
    gbPeriodosSolicitados: TJvgGroupBox;
    edDatos: TMemo;
    lstPeriodos: TListBox;
    dbgPeriodos: TArtDBGrid;
    sdqConsultasp_tipocumplimiento: TStringField;
    pnlAutorizo: TPanel;
    sdqConsultaMostrar: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sdqConsultaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure dbgPeriodosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sdqConsultaarregloFondoGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnRecalcularClick(Sender: TObject);
    procedure btnRecalculaSinModifClick(Sender: TObject);
    procedure btnSinCambiosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sdqConsultaCHECK_ESTADOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnAplicarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure btnModifObsClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure mnuSeleccionarTodoClick(Sender: TObject);
    procedure mnuSeleccionarRestoClick(Sender: TObject);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure cdsConsultaAfterScroll(DataSet: TDataSet);
    procedure btnSumatoriaClick(Sender: TObject);
    procedure dbgPeriodosPaintFooter(Sender: TObject; Column: String;
      var Value: String; var CellColor, FontColor: TColor;
      var AlignFooter: TAlingFooter);
  private
    FCuit: string;
    FContrato: integer;
    FIdRecalculo: integer;
    TotalDetalle : array of extended;
    FSolicitudAuto: integer;
    FCantAprobado: integer;
    FCantNoAprobado: integer;
//    procedure SetCuit(const Value: string);
    procedure CargarDatosAdic(aCuit: String);
    procedure SetContrato(const Value: integer);
    procedure MarcarAccionPeriodo(TipoAccion, Periodo: String; IdObservacion: integer; Observacion: String);
    procedure fraEmpresaChange(Sender: TObject);
    procedure CalcTotales;
    procedure SumSelectedFields(FieldNames: array of String;
      var Results: array of Extended);
    procedure SetSolicitudAuto(const Value: integer);
    procedure do_verificarpedidospendientes(acontrato: integer; tipocumplimiento: string);
   // procedure GuardarDatosAprobacion(aPeriodo: String);
  public
    property Contrato: integer read FContrato write SetContrato;
    property SolicitudAutorizacion: integer read FSolicitudAuto write SetSolicitudAuto;
    procedure CargarSolicitud;
    procedure CargarPedidoFinalizado(aidSolicitud: integer);
  end;

var
  frmPedidoRecalculoDev: TfrmPedidoRecalculoDev;

implementation

{$R *.dfm}

Const
 CAMPOS_TOTALES : array [0..12] of string = ('CUOTA', 'RC_DEVENGADOFONDO', 'IMP598', 'IMP599', 'PREVISTO', 'PAGADOCUOTA', 'IMP799', 'IMPAJUSTES', 'DIFCUOTA', 'IMP561', 'IMP551', 'IMP560', 'DIFFONDO');


{ TfrmPedidoRecalculoDev }

(*
procedure TfrmPedidoRecalculoDev.SetCuit(const Value: string);
begin
  IniciarEspera;
  try
    FCuit := Value;

    if not fraEmpresa.IsSelected then
    begin
      fraEmpresa.CUIT := FCuit;
      fraEmpresa.Locked := true;
    end;
    
    edBlockNota.Text := GetUltimoBlockNota(FCuit);
    sdqConsulta.ParamByName('idempresa').AsInteger := fraEmpresa.Value;
    sdqConsulta.Open;

    fraInfoEmpresa.CargarContrato(IntToStr(fraEmpresa.Contrato), FCuit);
    CargarDatosAdic(FCuit);

    LockControl(cmbVIGENCIADESDE, true);
    LockControl(cmbVIGENCIAHASTA, true);
    LockControl(cmbFECHABAJA, true);
    LockControl(edMOTIVO_BAJA, true);
    LockControl(edESTADO, true);
  finally
    DetenerEspera;
  end;
end;
*)

procedure TfrmPedidoRecalculoDev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfrmPedidoRecalculoDev.CargarDatosAdic(aCuit: String);
var
  sSql: string;
  Query: TSDquery;
begin
  sSql := 'SELECT CO_CONTRATO, ' +
          '       AFEST.TB_DESCRIPCION AS ESTADO, CO_VIGENCIADESDE, CO_VIGENCIAHASTA, ' +
          '       CO_FECHABAJA, '' ('' || BAJ.TB_CODIGO || '')  '' || BAJ.TB_DESCRIPCION AS MOTIVO_BAJA ' +
          '  FROM ACO_CONTRATO, CTB_TABLAS BAJ, CTB_TABLAS AFEST ' +
          ' WHERE BAJ.TB_CLAVE(+) = ''MOTIB''' +
          '   AND CO_MOTIVOBAJA   = BAJ.TB_CODIGO(+)' +
          '   AND AFEST.TB_CLAVE  = ''AFEST''' +
          '   AND AFEST.TB_CODIGO = CO_ESTADO' +
          '   AND CO_CONTRATO     =  art.Get_VUltContrato(' + SqlValue(aCuit) + ')';

  Query := GetQuery( sSql );

  try
    if not Query.Eof then
    begin
      With Query do
      begin
        cmbVIGENCIADESDE.Date := FieldByName('CO_VIGENCIADESDE').AsDateTime;
        cmbVIGENCIAHASTA.Date := FieldByName('CO_VIGENCIAHASTA').AsDateTime;
        cmbFECHABAJA.Date     := FieldByName('CO_FECHABAJA').AsDateTime;
        edMOTIVO_BAJA.Text    := FieldByName('MOTIVO_BAJA').AsString;
        edESTADO.Text         := FieldByName('ESTADO').AsString;
      end;
    end;
  finally
    Query.Free;
  end;
end;


procedure TfrmPedidoRecalculoDev.sdqConsultaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (sdqConsulta.FieldByName('cuota').AsFloat <> sdqConsulta.FieldByName('previsto').AsFloat) or
            (sdqConsulta.FieldByName('Mostrar').AsString = 'S') or
            (sdqConsulta.FieldByName('DIFFONDO').AsFloat <> 0) or
            (sdqConsulta.FieldByName('Imp570').AsFloat <> 0);
end;

procedure TfrmPedidoRecalculoDev.dbgPeriodosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  bmp: TBitmap;
begin
  if (Column.Field.FieldName = 'arregloFondo') then
  begin
    if (Column.Field.Text <> '---') then
      dbgPeriodos.Canvas.Brush.Color := $007171FF
    else
      dbgPeriodos.Canvas.Brush.Color := $00B3FFFF;
  end;
  dbgPeriodos.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (Column.Field.FieldName = 'CHECK_ESTADO')then
  begin
    if (Column.Field.Text = 'A') then
    begin
      bmp:= TBitmap.Create;
      try
        DmEmision.ilColor.GetBitmap(46, bmp);
        TArtDBGrid(Sender).Canvas.Draw(Rect.Left,Rect.Top, bmp);
      finally
        bmp.Free;
      end;
    end
    else if (Column.Field.Text = 'B') then
    begin
      bmp:= TBitmap.Create;
      try
        DmEmision.ilColor.GetBitmap(47, bmp);
        TArtDBGrid(Sender).Canvas.Draw(Rect.Left,Rect.Top, bmp);
      finally
        bmp.Free;
      end;
    end
    else if (Column.Field.Text = 'N') then
    begin
      bmp:= TBitmap.Create;
      try
        DmEmision.ilColor.GetBitmap(45, bmp);
        TArtDBGrid(Sender).Canvas.Draw(Rect.Left,Rect.Top, bmp);
      finally
        bmp.Free;
      end;
    end;
  end;

end;

procedure TfrmPedidoRecalculoDev.sdqConsultaarregloFondoGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
(*
  if (sdqConsulta.FieldByName('DIFFONDO').AsFloat <> 0) then
    Text := 'ERROR FONDO'
  else
    Text := '---';
*)
end;

procedure TfrmPedidoRecalculoDev.SetContrato(const Value: integer);
begin
  FContrato := Value;

  if not fraEmpresa.IsSelected then
  begin
    fraEmpresa.Contrato := FContrato;
    FCuit := fraEmpresa.CUIT;
    fraEmpresa.Locked := true;
  end;

  edBlockNota.Text := GetUltimoBlockNota(FCuit);

  fraInfoEmpresa.CargarContrato(fraEmpresa.Contrato, FCuit);
  CargarDatosAdic(FCuit);

  LockControl(cmbVIGENCIADESDE, true);
  LockControl(cmbVIGENCIAHASTA, true);
  LockControl(cmbFECHABAJA, true);
  LockControl(edMOTIVO_BAJA, true);
  LockControl(edESTADO, true);
end;

procedure TfrmPedidoRecalculoDev.btnRecalcularClick(Sender: TObject);
var
  ABookmark: TBookmark;
  i: integer;
begin
  if (not cdsConsulta.Active) or cdsConsulta.IsEmpty then Exit;

  if (dbgPeriodos.SelCount > 0) then
  begin
    dbgPeriodos.DataSource.DataSet.DisableControls;
    try
      ABookmark := dbgPeriodos.DataSource.DataSet.GetBookmark;
      for i:=0 to dbgPeriodos.SelCount-1 do
      begin
        dbgPeriodos.GotoSelection(i);
        cdsConsulta.Edit;
        cdsConsulta.FieldByName('CHECK_ESTADO').AsString := 'A';
        cdsConsulta.FieldByName('Observacion').AsString := '';
        cdsConsulta.FieldByName('IdObservacion').AsInteger := 0;
        cdsConsulta.FieldByName('ObservacionDesc').AsString := '';
        cdsConsulta.UpdateRecord;
      end;
      try
        dbgPeriodos.DataSource.DataSet.GotoBookmark(ABookmark);
      except
      end;
        dbgPeriodos.DataSource.DataSet.FreeBookmark(ABookmark);
    finally
      dbgPeriodos.DataSource.DataSet.EnableControls;
    end;
  end
  else begin
    cdsConsulta.Edit;
    cdsConsulta.FieldByName('CHECK_ESTADO').AsString := 'A';
    cdsConsulta.FieldByName('Observacion').AsString := '';
    cdsConsulta.FieldByName('IdObservacion').AsInteger := 0;
    cdsConsulta.FieldByName('ObservacionDesc').AsString := '';
    cdsConsulta.UpdateRecord;
  end;

  dbgPeriodos.UnselectAll;
  dbgPeriodos.Refresh;
  cdsConsultaAfterScroll(dbgPeriodos.DataSource.DataSet);
end;

procedure TfrmPedidoRecalculoDev.MarcarAccionPeriodo(TipoAccion,
  Periodo: String; IdObservacion: integer; Observacion: String);
begin
(*
  if (FIdRecalculo = 0) then
  begin
    FIdRecalculo := GetSecNextVal('emi.seq_irz_id');
    EjecutarSqlST(' insert into emi.ira_recalculoautorizado(ra_id, ra_contrato) values(' +  SqlValue(FIdRecalculo) + ', ' + SqlValue(fraEmpresa.Contrato) + ' )' );
  end;
  EjecutarSqlST(' insert into emi.irp_recalculoperiodoautorizado values(emi.seq_irz_id.nextval, ' +
                                                                            SqlValue(FIdRecalculo) + ', ' +
                                                                            SqlValue(Periodo) +  ', ' +
                                                                            SqlValue(TipoAccion) +  ', ' +
                                                                            SqlInt(IdObservacion, true) +  ', ' +
                                                                            SqlValue(Observacion) + ' )' );
*)
  if ExisteSql('SELECT 1 FROM emi.isp_solicitudautorizperiodo WHERE sp_periodo = ' + SqlValue(Periodo) +
               ' and sp_idsolicitudautorizacion = ' + SqlValue(FSolicitudAuto) ) then
  begin
    //solo se hace aca ya que se determina para los periodos solicitados

    if (TipoAccion = 'A') then
      inc(FCantAprobado)
    else
      inc(FCantNoAprobado);

    EjecutarSqlST(' update emi.isp_solicitudautorizperiodo ' +
                  ' set sp_tipocumplimiento = ' + SqlValue(TipoAccion) + ', ' +
                  '     sp_fechacumplimiento = sysdate, ' +
                  '     sp_idobservacion = ' + SqlInt(IdObservacion, true) + ', ' +
                  '     sp_observacion = ' + SqlValue(Observacion) +  ', ' +
                  '     sp_devengadocuota = ' + SqlNumber(cdsConsulta.FieldByName('CUOTA').AsFloat) + ', ' +
                  '     sp_devengadofondo = ' + SqlNumber(cdsConsulta.FieldByName('RC_DEVENGADOFONDO').AsFloat) + ', ' +
                  '     sp_importe598 = ' + SqlNumber(cdsConsulta.FieldByName('IMP598').AsFloat) + ', ' +
                  '     sp_importe599 = ' + SqlNumber(cdsConsulta.FieldByName('IMP599').AsFloat) + ', ' +
                  '     sp_previstocuota = ' + SqlNumber(cdsConsulta.FieldByName('PREVISTO').AsFloat) + ', ' +
                  '     sp_pagadocuota = ' + SqlNumber(cdsConsulta.FieldByName('PAGADOCUOTA').AsFloat) + ', ' +
                  '     sp_importe799 = ' + SqlNumber(cdsConsulta.FieldByName('IMP799').AsFloat) + ', ' +
                  '     sp_importeajuste = ' + SqlNumber(cdsConsulta.FieldByName('IMPAJUSTES').AsFloat) + ', ' +
                  '     sp_empleados = ' + SqlValue(cdsConsulta.FieldByName('EMPLEADOS').AsInteger) + ', ' +
                  '     sp_impfondonocorresp = ' + SqlNumber(cdsConsulta.FieldByName('CORRESPFNC').AsFloat) + ', ' +
                  '     sp_importefondoffe = ' + SqlNumber(cdsConsulta.FieldByName('CORRESPFFE').AsFloat) + ', ' +
                  '     sp_importe560 =  ' + SqlNumber(cdsConsulta.FieldByName('IMP560').AsFloat) + ', ' +
                  '     sp_importe561 = ' + SqlNumber(cdsConsulta.FieldByName('IMP561').AsFloat) + ', ' +
                  '     sp_importe551 = ' + SqlNumber(cdsConsulta.FieldByName('IMP551').AsFloat)  + ', ' +
                  '     sp_importe570 = ' + SqlNumber(cdsConsulta.FieldByName('IMP570').AsFloat)  +
                  ' WHERE sp_periodo = ' + SqlValue(Periodo) +
                  ' and sp_idsolicitudautorizacion = ' + SqlValue(FSolicitudAuto));
  end
  else
    EjecutarSqlST(' insert into emi.isp_solicitudautorizperiodo(sp_id, sp_idsolicitudautorizacion, sp_periodo, ' +
                  '                                             sp_fechacumplimiento, sp_tipocumplimiento, sp_motivosolicitud, ' +
                  '                                             sp_idobservacion, sp_observacion, sp_devengadocuota, ' +
                  '                                             sp_devengadofondo, sp_importe598, sp_importe599, ' +
                  '                                             sp_previstocuota, sp_pagadocuota, sp_importe799, ' +
                  '                                             sp_importeajuste, sp_empleados, sp_impfondonocorresp, ' +
                  '                                             sp_importefondoffe, sp_importe560, sp_importe561, sp_importe551, ' +
                  '                                             sp_importe570) ' +
                  ' values( emi.seq_isp_id.nextval, ' + SqlValue(FSolicitudAuto) + ', ' + SqlValue(Periodo) +
                  ' , sysdate, ' + SqlValue(TipoAccion) + ', null, ' +
                    SqlInt(IdObservacion, true) + ', ' + SqlValue(Observacion) + ', ' + 
                    SqlNumber(cdsConsulta.FieldByName('CUOTA').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('RC_DEVENGADOFONDO').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('IMP598').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('IMP599').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('PREVISTO').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('PAGADOCUOTA').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('IMP799').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('IMPAJUSTES').AsFloat) + ', ' +
                    SqlValue(cdsConsulta.FieldByName('EMPLEADOS').AsInteger) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('CORRESPFNC').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('CORRESPFFE').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('IMP560').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('IMP561').AsFloat) + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('IMP551').AsFloat)  + ', ' +
                    SqlNumber(cdsConsulta.FieldByName('IMP570').AsFloat)  +
                  ')');

end;

procedure TfrmPedidoRecalculoDev.btnRecalculaSinModifClick(
  Sender: TObject);
var
  ABookmark: TBookmark;
  i: integer;
begin
  if (not cdsConsulta.Active) or cdsConsulta.IsEmpty then Exit;

  with TfrmObservacion.Create(self) do
  try
    TablaObservacion := 'EMI.IOR_OBSERVACIONRECALCULO';
    FieldId := 'OR_ID';
    FieldCodigo := 'OR_ID';
    FieldDescripcion := 'OR_DESCRIPCION';
    FieldFechaBaja := 'OR_FECHABAJA';
    ShowBajas := true;
    if (ShowModal = mrOk) then
    begin

      if (dbgPeriodos.SelCount > 0) then
      begin
        dbgPeriodos.DataSource.DataSet.DisableControls;
        try
          ABookmark := dbgPeriodos.DataSource.DataSet.GetBookmark;
          for i:=0 to dbgPeriodos.SelCount-1 do
          begin
            dbgPeriodos.GotoSelection(i);;
            cdsConsulta.Edit;
            cdsConsulta.FieldByName('CHECK_ESTADO').AsString := 'B';
            cdsConsulta.FieldByName('Observacion').AsString := Observacion;
            cdsConsulta.FieldByName('IdObservacion').AsInteger := IdObservacion;
            cdsConsulta.FieldByName('ObservacionDesc').AsString := DescObservacion;
            cdsConsulta.UpdateRecord;
          end;
          try
            dbgPeriodos.DataSource.DataSet.GotoBookmark(ABookmark);
          except
          end;
            dbgPeriodos.DataSource.DataSet.FreeBookmark(ABookmark);
        finally
          dbgPeriodos.DataSource.DataSet.EnableControls;
        end;
      end
      else begin
        cdsConsulta.Edit;
        cdsConsulta.FieldByName('CHECK_ESTADO').AsString := 'B';
        cdsConsulta.FieldByName('Observacion').AsString := Observacion;
        cdsConsulta.FieldByName('IdObservacion').AsInteger := IdObservacion;
        cdsConsulta.FieldByName('ObservacionDesc').AsString := DescObservacion;
        cdsConsulta.UpdateRecord;
      end;

      dbgPeriodos.UnselectAll;
      dbgPeriodos.Refresh;
      cdsConsultaAfterScroll(dbgPeriodos.DataSource.DataSet);
    end;
  finally
    free;
  end;
end;

procedure TfrmPedidoRecalculoDev.btnSinCambiosClick(Sender: TObject);
var
  ABookmark: TBookmark;
  i: integer;
begin
  if (not cdsConsulta.Active) or cdsConsulta.IsEmpty then Exit;

  with TfrmObservacion.Create(self) do
  try
    TablaObservacion := 'EMI.IOR_OBSERVACIONRECALCULO';
    FieldId := 'OR_ID';
    FieldCodigo := 'OR_ID';
    FieldDescripcion := 'OR_DESCRIPCION';
    FieldFechaBaja := 'OR_FECHABAJA';
    ShowBajas := true;
    if (ShowModal = mrOk) then
    begin

      if (dbgPeriodos.SelCount > 0) then
      begin
        dbgPeriodos.DataSource.DataSet.DisableControls;
        try
          ABookmark := dbgPeriodos.DataSource.DataSet.GetBookmark;
          for i:=0 to dbgPeriodos.SelCount-1 do
          begin
            dbgPeriodos.GotoSelection(i);;
            cdsConsulta.Edit;
            cdsConsulta.FieldByName('CHECK_ESTADO').AsString := 'N';
            cdsConsulta.FieldByName('Observacion').AsString := Observacion;
            cdsConsulta.FieldByName('IdObservacion').AsInteger := IdObservacion;
            cdsConsulta.FieldByName('ObservacionDesc').AsString := DescObservacion;
            cdsConsulta.UpdateRecord;
          end;
          try
            dbgPeriodos.DataSource.DataSet.GotoBookmark(ABookmark);
          except
          end;
            dbgPeriodos.DataSource.DataSet.FreeBookmark(ABookmark);
        finally
          dbgPeriodos.DataSource.DataSet.EnableControls;
        end;
      end
      else begin
        cdsConsulta.Edit;
        cdsConsulta.FieldByName('CHECK_ESTADO').AsString := 'N';
        cdsConsulta.FieldByName('Observacion').AsString := Observacion;
        cdsConsulta.FieldByName('IdObservacion').AsInteger := IdObservacion;
        cdsConsulta.FieldByName('ObservacionDesc').AsString := DescObservacion;
        cdsConsulta.UpdateRecord;
      end;

     dbgPeriodos.UnselectAll;
     dbgPeriodos.Refresh;
     cdsConsultaAfterScroll(dbgPeriodos.DataSource.DataSet);
    end;
  finally
    free;
  end;
end;

procedure TfrmPedidoRecalculoDev.FormCreate(Sender: TObject);
begin
  cdsConsulta.CreateDataSet;
  FIdRecalculo := 0;
  fraEmpresa.ShowBajas := true;
//  fraEmpresa.UltContrato := true;
  fraEmpresa.OnChange := fraEmpresaChange;
end;

procedure TfrmPedidoRecalculoDev.fraEmpresaChange(Sender: TObject);
begin
(*
  if (fraEmpresa.CUIT <> FCuit) then
  begin
    cdsConsulta.EmptyDataSet;
    sdqConsulta.Close;
    if fraEmpresa.IsSelected then
    begin
      tbLimpiarClick(Sender);
      SetCuit(fraEmpresa.CUIT);
    end;
  end;
*)
end;

procedure TfrmPedidoRecalculoDev.sdqConsultaCHECK_ESTADOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
//  Text := ValorSql(' select rp_acciontomada from emi.irp_recalculoperiodoautorizado where rp_periodo = ' + SqlValue(Sender.DataSet.Fieldbyname('rc_periodo').AsString) + ' and rp_idrecalculoautorizado = ' + SqlValue(FIdRecalculo));
end;

procedure TfrmPedidoRecalculoDev.btnAplicarClick(Sender: TObject);
var
  tipocumplimiento: String;
  Query: TSDQuery;
//  contrato: integer;
begin
  cdsConsulta.DisableControls;
  try
    cdsConsulta.First;
    while not cdsConsulta.Eof and (not cdsConsulta.FieldByName('CHECK_ESTADO').IsNull) do
      cdsConsulta.Next;
    Verificar(not cdsConsulta.Eof, dbgPeriodos, 'Debe tomar una acción para cada período.');

    FCantAprobado := 0;
    FCantNoAprobado := 0;
    
    BeginTrans(true);
    try
      cdsConsulta.First;
      while not cdsConsulta.Eof do
      begin
        MarcarAccionPeriodo(cdsConsulta.FieldbyName('CHECK_ESTADO').AsString,
                            cdsConsulta.FieldbyName('rc_periodo').AsString,
                            cdsConsulta.FieldbyName('IdObservacion').AsInteger,
                            cdsConsulta.FieldbyName('Observacion').AsString);

(*
        sSql := '';
        if (cdsConsulta.FieldbyName('CHECK_ESTADO').AsString = 'B') then
          sSql := ' emi.emision.autoriza := ''N''; '
        else
          sSql := ' emi.emision.autoriza := null; ';
        if (cdsConsulta.FieldbyName('CHECK_ESTADO').AsString <> 'N') then
        begin
          sSql := sSql + ' emi.emision.do_devengadocontrato(' + SqlValue(fraEmpresa.Contrato)  + ', ' + SqlValue(cdsConsulta.FieldbyName('rc_periodo').AsString) + ', null, true);';
          EjecutarStoreST( sSql );
        end;
*)
        cdsConsulta.Next;
      end;

      if (FCantAprobado = 0) and (FCantNoAprobado <> 0) then
        tipocumplimiento := 'N'
      else begin
        if (FCantAprobado <> 0) and (FCantNoAprobado = 0) then
          tipocumplimiento := 'A'
        else
          tipocumplimiento := 'M';
      end;

      EjecutarSqlST(' update emi.isa_solicitudautorizacion ' +
                    ' set sa_usuariocumplimiento = ' + SqlValue(Sesion.LoginName) + ', ' +
                    ' sa_fechacumplimiento = sysdate, ' +
                    ' sa_tipocumplimiento = ' + SqlValue(tipocumplimiento) +
                    ' where sa_id = ' + SqlValue(FSolicitudAuto));

      Query := GetQuery(' select sp_periodo, sp_tipocumplimiento '  +
                        ' from emi.isp_solicitudautorizperiodo ' +
                        ' where sp_idsolicitudautorizacion = ' +  SqlValue(FSolicitudAuto) +
                        ' order by sp_periodo ' );
      try
      while not Query.Eof do
      begin
        //Por si generan pedidos para periodos que no existen
//        if ExisteSql(' SELECT 1 FROM EMI.IRP_RESUMENPERIODO WHERE RP_CONTRATO = ' + SqlValue(fraEmpresa.Contrato) +
//                     ' AND RP_PERIODO = ' + SqlValue(Query.FieldbyName('sp_periodo').AsString)
//                    ) then
        do_aprobar_recalculo_periodo(FSolicitudAuto, fraEmpresa.Contrato, Query.FieldbyName('sp_periodo').AsString, Query.FieldbyName('sp_tipocumplimiento').AsString);
        Query.Next;
      end;
      finally
        Query.Free;
      end;

      do_verificarpedidospendientes(fraEmpresa.Contrato, tipocumplimiento);

      CommitTrans(true);
    except
      on E: Exception do
      begin
        Rollback(true);
        cdsConsulta.EnableControls;
        MsgBox('Error al registrar los datos. ' + #13#10 + E.Message, MB_ICONERROR, self.Caption);
        Exit;
      end;
    end;
  finally
    cdsConsulta.EnableControls;
  end;
  ModalResult := mrOk;
  //Close;
end;

procedure TfrmPedidoRecalculoDev.tbLimpiarClick(Sender: TObject);
var
  ABookmark: TBookmark;
  i: integer;
begin
  if (not cdsConsulta.Active) or cdsConsulta.IsEmpty then Exit;

  if (dbgPeriodos.SelCount > 0) then
  begin
    dbgPeriodos.DataSource.DataSet.DisableControls;
    try
      ABookmark := dbgPeriodos.DataSource.DataSet.GetBookmark;
      for i:=0 to dbgPeriodos.SelCount-1 do
      begin
        dbgPeriodos.GotoSelection(i);;
        cdsConsulta.Edit;
        cdsConsulta.FieldByName('CHECK_ESTADO').AsString := '';
        cdsConsulta.FieldByName('Observacion').AsString := '';
        cdsConsulta.FieldByName('IdObservacion').AsInteger := 0;
        cdsConsulta.FieldByName('ObservacionDesc').AsString := '';
        cdsConsulta.UpdateRecord;
      end;
      try
        dbgPeriodos.DataSource.DataSet.GotoBookmark(ABookmark);
      except
      end;
        dbgPeriodos.DataSource.DataSet.FreeBookmark(ABookmark);
    finally
      dbgPeriodos.DataSource.DataSet.EnableControls;
    end;
  end
  else begin
    cdsConsulta.Edit;
    cdsConsulta.FieldByName('CHECK_ESTADO').AsString := '';
    cdsConsulta.FieldByName('Observacion').AsString := '';
    cdsConsulta.FieldByName('IdObservacion').AsInteger := 0;
    cdsConsulta.FieldByName('ObservacionDesc').AsString := '';
    cdsConsulta.UpdateRecord;
  end;

  dbgPeriodos.Refresh;
  cdsConsultaAfterScroll(dbgPeriodos.DataSource.DataSet);
end;

procedure TfrmPedidoRecalculoDev.btnModifObsClick(Sender: TObject);
var
  ABookmark: TBookmark;
  i: integer;
begin
  if cdsConsulta.Active and not cdsConsulta.IsEmpty and (cdsConsulta.FieldByName('CHECK_ESTADO').Text <> '') then
    with TfrmObservacion.Create(self) do
    try
      TablaObservacion := 'EMI.IOR_OBSERVACIONRECALCULO';
      FieldId := 'OR_ID';
      FieldCodigo := 'OR_ID';
      FieldDescripcion := 'OR_DESCRIPCION';
      FieldFechaBaja := 'OR_FECHABAJA';
      ShowBajas := true;
      if (dbgPeriodos.SelCount = 0) or (dbgPeriodos.SelCount = 1) then
      begin
        IdObservacion := cdsConsulta.fieldbyname('IdObservacion').AsInteger;
        Observacion := cdsConsulta.fieldbyname('Observacion').AsString;
      end;

      if (ShowModal = mrOk) then
      begin
        if (dbgPeriodos.SelCount > 0) then
        begin
          dbgPeriodos.DataSource.DataSet.DisableControls;
          try
            ABookmark := dbgPeriodos.DataSource.DataSet.GetBookmark;
            for i:=0 to dbgPeriodos.SelCount-1 do
            begin
              dbgPeriodos.GotoSelection(i);;
              cdsConsulta.Edit;
              cdsConsulta.FieldByName('Observacion').AsString := Observacion;
              cdsConsulta.FieldByName('IdObservacion').AsInteger := IdObservacion;
              cdsConsulta.FieldByName('ObservacionDesc').AsString := DescObservacion;
              cdsConsulta.UpdateRecord;
            end;
            try
              dbgPeriodos.DataSource.DataSet.GotoBookmark(ABookmark);
            except
            end;
              dbgPeriodos.DataSource.DataSet.FreeBookmark(ABookmark);
          finally
            dbgPeriodos.DataSource.DataSet.EnableControls;
          end;
        end
        else begin
          cdsConsulta.Edit;
          cdsConsulta.FieldByName('Observacion').AsString := Observacion;
          cdsConsulta.FieldByName('IdObservacion').AsInteger := IdObservacion;
          cdsConsulta.FieldByName('ObservacionDesc').AsString := DescObservacion;
          cdsConsulta.UpdateRecord;
        end;

       dbgPeriodos.Refresh;
       cdsConsultaAfterScroll(dbgPeriodos.DataSource.DataSet);
      end;
    finally
      free;
    end;
end;


procedure TfrmPedidoRecalculoDev.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedidoRecalculoDev.mnuSeleccionarTodoClick(Sender: TObject);
begin
  dbgPeriodos.SelectAll;
end;

procedure TfrmPedidoRecalculoDev.mnuSeleccionarRestoClick(Sender: TObject);
var
  ABookmark: TBookmark;
begin
  with dbgPeriodos.DataSource do
    if Dataset.Active then
    begin
      with Dataset do begin
        if (Dataset.BOF and Dataset.EOF) then Exit;
        Dataset.DisableControls;
        try
          ABookmark := Dataset.GetBookmark;
          try
            Dataset.First;
            while not Dataset.EOF do
            begin
              if DataSet.FieldByName('CHECK_ESTADO').IsNull then
                dbgPeriodos.SelectedRows.CurrentRowSelected := True;
              Next;
            end;
          finally
            try
              Dataset.GotoBookmark(ABookmark);
            except
            end;
            Dataset.FreeBookmark(ABookmark);
          end;
        finally
          Dataset.EnableControls;
        end;
      end;
    end;
end;

procedure TfrmPedidoRecalculoDev.sdqConsultaAfterOpen(DataSet: TDataSet);
var
  arreglofondo: String;
begin
  DataSet.First;
  cdsConsulta.Close;
  cdsConsulta.Open;
  while not DataSet.Eof do
  begin

    if (DataSet.FieldByName('DIFFONDO').AsFloat <> 0) then
      arreglofondo := 'ERROR FONDO'
    else
      arreglofondo := '---';

    cdsConsulta.AppendRecord([DataSet.Fields[0].Value,
                             DataSet.Fields[1].Value,
                             DataSet.Fields[2].Value,
                             DataSet.Fields[3].Value,
                             DataSet.Fields[4].Value,
                             DataSet.Fields[5].Value,
                             DataSet.Fields[6].Value,
                             DataSet.Fields[7].Value,
                             DataSet.Fields[8].Value,
                             DataSet.Fields[9].Value,
                             DataSet.Fields[10].Value,
                             DataSet.Fields[11].Value,
                             DataSet.Fields[12].Value,
                             DataSet.Fields[13].Value,
                             DataSet.Fields[14].Value,
                             DataSet.Fields[15].Value,
                             DataSet.Fields[16].Value,
                             DataSet.Fields[17].Value,
                             DataSet.Fields[18].Value,
                             DataSet.Fields[19].Value,
                             DataSet.Fields[20].Value,
                             arreglofondo,
                             DataSet.Fields[21].Value]);
    DataSet.Next;
  end;
  DataSet.Close;
end;

procedure TfrmPedidoRecalculoDev.cdsConsultaAfterScroll(DataSet: TDataSet);
var
  Q: TSDQuery;
begin
  Q := GetQuery(' SELECT a.rc_empleados, a.rc_masasalarial, ' +
                ' afiliacion.get_suma_fija (a.rc_contrato, a.rc_periodo) sumafija, ' +
                ' afiliacion.get_porcmasa (a.rc_contrato, a.rc_periodo) sumavar ' +
                ' FROM zrc_resumencobranza a ' +
                ' WHERE a.rc_periodo = ' + SqlValue(DataSet.FieldbyName('rc_periodo').AsString) +
                ' AND a.rc_contrato = ' + SqlValue(fraEmpresa.Contrato));

  try
    if not Q.IsEmpty then
    begin
      StatusBar.Panels[0].Text := ' Período: ' + DataSet.fieldbyname('rc_periodo').AsString;
      StatusBar.Panels[1].Text := Format('   Emple.: %8.0f  /  Mas Sal.: %12.2f  /  S.Fija: %8.2f  /  Variable: %6.3f',
                                  [Q.fieldbyname('rc_empleados').AsFloat,
                                   Q.fieldbyname('rc_masasalarial').AsFloat,
                                   Q.fieldbyname('sumafija').AsFloat,
                                   Q.fieldbyname('sumavar').AsFloat]);
    end;
  finally
    Q.Free;
  end;
end;

procedure TfrmPedidoRecalculoDev.btnSumatoriaClick(Sender: TObject);
begin
  dbgPeriodos.FooterBand := btnSumatoria.Down;
  if dbgPeriodos.FooterBand then CalcTotales;
end;

procedure TfrmPedidoRecalculoDev.CalcTotales;
begin
  try
    SetLength( TotalDetalle,  13);

    if btnSumatoria.Down and cdsConsulta.Active Then
    begin
      if dbgPeriodos.SelectedRows.Count > 0 then
        SumSelectedFields(CAMPOS_TOTALES, TotalDetalle )
      else
        SumFields( cdsConsulta, CAMPOS_TOTALES, TotalDetalle );
    end;
  except
    on E: Exception do ErrorMsg(E, 'Error al Calcular los Subtotales');
  end;
end;

procedure TfrmPedidoRecalculoDev.SumSelectedFields(FieldNames: array of String; var Results: array of Extended);
var
 i, j  : integer;
 Dataset : TDataset;
 Field    : TField;
 b : TBookmark;
begin
  DataSet := dbgPeriodos.DataSource.DataSet;

  for j := Low(Results) to High(Results) do  Results[j] := 0;

  Dataset.DisableControls;
  b := Dataset.GetBookmark;  
  try
    for i := 0 to dbgPeriodos.SelectedRows.Count - 1 do
    begin
       Dataset.GotoBookmark(pointer(dbgPeriodos.SelectedRows.Items[i]));
       for j := Low(Results) to High(Results) do
       begin
         Field := DataSet.FindField(FieldNames[j]);
         if Assigned(Field) Then
           Results[j] := Results[j] + Field.AsFloat ;
       end;
    end;
  finally
    Dataset.GotoBookmark(b);
    Dataset.FreeBookmark(b);
    DataSet.EnableControls;
  end;
end;

procedure TfrmPedidoRecalculoDev.dbgPeriodosPaintFooter(Sender: TObject;
  Column: String; var Value: String; var CellColor, FontColor: TColor;
  var AlignFooter: TAlingFooter);
var
  iPos : integer;
begin
  AlignFooter := afRight;
  iPos := ArrayPos( Column, CAMPOS_TOTALES);
  if (iPos > -1) and (iPos <= 12) Then
  begin
    Value := '$ ' + ToStr(TotalDetalle[iPos]);
  end;
end;

procedure TfrmPedidoRecalculoDev.SetSolicitudAuto(const Value: integer);
var
  qry: TSDQuery;
begin
  FSolicitudAuto := Value;
  qry := GetQuery(  ' SELECT pp_periodo, se_nombre, mp_descripcion, pr_observacion, pr_id ' +
                    ' FROM emi.ipr_pedidorecalculo ipr,                ' +
                    '      emi.imp_motivopedidorecalculo imp,          ' +
                    '      emi.ipp_pedidorecalculoperiodo ipp,         ' +
                    '      art.use_usuarios use                        ' +
                    ' WHERE ipr.pr_idsolicitudautorizacion = ' + SqlValue(FSolicitudAuto)       +
                    ' AND ipr.pr_idmotivopedido = imp.mp_id            ' +
                    ' AND use.se_id = ipr.pr_solicitante               ' +
                    ' AND ipp.pp_idpedidorecalculo = ipr.pr_id         ');

  try
    if not qry.Eof then
    begin
      edDatos.Text := 'Solicitante: ' + qry.fieldbyname('se_nombre').AsString + #13#10 +
                      'Motivo: ' + qry.fieldbyname('mp_descripcion').AsString + #13#10 +
                      'Observación: ' + qry.fieldbyname('pr_observacion').AsString;

      FIdRecalculo := qry.fieldbyname('pr_id').AsInteger;
    end;

    while not qry.eof do
    begin
      lstPeriodos.Items.Add(qry.fieldbyname('pp_periodo').AsString);
      qry.Next;
    end;
  finally
    qry.free;
  end;
end;


procedure TfrmPedidoRecalculoDev.do_verificarpedidospendientes(acontrato: integer; tipocumplimiento: string);
var
//  qry: TSDQuery;
  periododesde: string;
begin

(*
  qry := GetQuery(' SELECT * periodo FROM emi.isa_solicitudautorizacion ' +
                  ' WHERE sa_contrato = ' + SqlValue(acontrato) +
                  ' AND sa_cumplimiento is null ' );
*)
//  try
//    while not qry.Eof do
//    begin

      with TfrmPedidoRecalculoDev.Create(self) do
      try
        FormStyle := fsNormal;
        Visible := false;
        Contrato := acontrato;
        CargarSolicitud;
        cdsConsulta.First;
        periododesde := cdsConsulta.FieldByName('RC_PERIODO').AsString;
      finally
        Delay(300);
        free;
      end;


      //Actualizo los estados de los periodos de otras solicitudes
      EjecutarSqlST('UPDATE emi.isp_solicitudautorizperiodo a ' +
                    ' SET (sp_fechacumplimiento, sp_tipocumplimiento, sp_motivosolicitud, sp_idobservacion, sp_observacion) = ' +
                    '     (SELECT sp_fechacumplimiento, sp_tipocumplimiento, sp_motivosolicitud, sp_idobservacion, sp_observacion ' +
                    '      FROM emi.isp_solicitudautorizperiodo b, emi.isa_solicitudautorizacion ' +
                    '      WHERE a.sp_periodo = b.sp_periodo ' +
                    '      AND sa_id = b.sp_idsolicitudautorizacion ' +
                    '      AND sp_tipocumplimiento <> ''N'' ' +
                    '      AND sa_id = ' + SqlValue(FSolicitudAuto) + ')' +
                    ' WHERE a.sp_idsolicitudautorizacion IN(SELECT sa_id ' +
                    '                                       FROM emi.isa_solicitudautorizacion ' +
                    '                                       WHERE sa_contrato = ' + SqlValue(acontrato) +
                    '                                       AND sa_idtipoautorizacion = 7 ' +
                    '                                       AND sa_fechacumplimiento IS NULL) ');



      //No existe nada para recalcular
      if (periododesde = '') then
      begin
        EjecutarSqlST(' UPDATE emi.isa_solicitudautorizacion ' +
                      ' SET sa_usuariocumplimiento = ' + SqlValue(Sesion.LoginName) + ', ' +
                      ' sa_fechacumplimiento = SYSDATE, '  +
                      ' sa_tipocumplimiento = ' + SqlValue(tipocumplimiento) +
                      ' WHERE sa_contrato = ' + SqlValue(acontrato) +
                      ' AND sa_idtipoautorizacion = ' + SqlValue(7) +
                      ' AND sa_fechacumplimiento is null ');
      end;


      EjecutarSqlST(' UPDATE emi.irp_resumenperiodo ' +
                    ' SET rp_estado = DECODE(emi.utiles.getautorizpendiente(rp_contrato, rp_periodo), ' +
                    ' ''S'', ''P'', ' +
                    ' ''V'') ' +
                    ' WHERE rp_contrato = ' + SqlValue(acontrato));
//                      ' AND rp_periodo = ' + SqlValue(qry.FieldByName(periodo).AsString))

(*
      else begin
        cdsPeriodos.First;
        SqlPeriodos := '';
        while not cdsPeriodos.Eof do
        begin
          if (SqlPeriodos <> '') then
            SqlPeriodos := SqlPeriodos + ', ';
          SqlPeriodos := SqlPeriodos + '''' + cdsPeriodos.FieldByName('Periodo').AsString + '''';
          cdsPeriodos.Next;
        end;

      end;
*)
//        qry.Next;
//    end;
//  finally
//    qry.Free;
//  end;
end;

procedure TfrmPedidoRecalculoDev.CargarPedidoFinalizado(
  aidSolicitud: integer);
begin
  if Self.Visible then IniciarEspera;
  try
    pnlAutorizo.Visible := true;
    btnRecalcular.Enabled := false;
    btnRecalculaSinModif.Enabled := false;
    btnSinCambios.Enabled := false;
    btnModifObs.Enabled := false;
    tbLimpiar.Enabled := false;
    btnSelectAll.Enabled := false;

    btnAplicar.Enabled := false;
    btnCancel.Caption := '&Cerrar';

    sdqConsulta.SQL.Clear;
    sdqConsulta.SQL.Add(' SELECT sa_contrato rc_contrato, sp_periodo rc_periodo, sp_devengadocuota cuota, 0 rc_devengadocuota, sp_devengadofondo rc_devengadofondo, ' +
                        '        sp_importe598 imp598, sp_importe599 imp599, sp_previstocuota previsto, sp_pagadocuota pagadocuota, sp_importe799 imp799, ' +
                        '        sp_importeajuste impajustes,(sp_previstocuota-sp_devengadocuota) difcuota, sp_importe561 imp561, sp_importe560 imp560, ' +
                        '        sp_importe551 imp551, ' +
                        '        DECODE(emi.utiles.get_correspondefondohipoacus(sa_contrato, sp_periodo), ''S'', sp_empleados * 0.6, 0) ' +
                        '        -(sp_importe551 + sp_importe560 + sp_importe561) diffondo, ' +
                        '        emi.utiles.get_correspondefondohipoacus(sa_contrato, sp_periodo), sp_empleados empleados, ' +
                        '        sp_impfondonocorresp correspfnc, sp_importefondoffe correspffe, sp_importe560 imp560, sp_importe561 imp561, ' +
                        '        emi.utiles.get_correspondefondohipoacus(sa_contrato, sp_periodo) correspfondo, ' +
                        '        sp_importe551 imp551, sp_importe570 imp570, sp_tipocumplimiento, ''S'' mostrar ' +
                        '  FROM emi.isp_solicitudautorizperiodo, emi.isa_solicitudautorizacion ' +
                        ' WHERE sp_idsolicitudautorizacion = sa_id ' +
                        '   AND sa_id = ' + SqlValue(aidSolicitud) +
                        ' ORDER BY 1, 2 ');
    sdqConsulta.Open;
    pnlAutorizo.Caption := ValorSql(' SELECT ''Gestionado por '' || sa_usuariocumplimiento || '' el '' || TO_CHAR(sa_fechacumplimiento, ''DD/MM/YYYY HH24:MI:SS'')' +
                                    ' FROM emi.isa_solicitudautorizacion ' +
                                    ' WHERE sa_id = ' + SqlValue(aidSolicitud));
  finally
    if Self.Visible then DetenerEspera;
  end;
end;

(*procedure TfrmPedidoRecalculoDev.GuardarDatosAprobacion(aPeriodo: String);
begin
  EjecutarSqlST(' UPDATE EMI.ISP_SOLICITUDAUTORIZPERIODO ' +
                ' SET SP_DEVENGADOCUOTA = ' + SqlNumber(cdsConsulta.FieldByName('CUOTA').AsFloat) + ', ' +
                '     SP_DEVENGADOFONDO = ' + SqlNumber(cdsConsulta.FieldByName('RC_DEVENGADOFONDO').AsFloat) + ', ' +
                '     SP_IMPORTE598 = ' + SqlNumber(cdsConsulta.FieldByName('IMP598').AsFloat) + ', ' +
                '     SP_IMPORTE599 = ' + SqlNumber(cdsConsulta.FieldByName('IMP599').AsFloat) + ', ' +
                '     SP_PREVISTOCUOTA = ' + SqlNumber(cdsConsulta.FieldByName('PREVISTO').AsFloat) + ', ' +
                '     SP_PAGADOCUOTA = ' + SqlNumber(cdsConsulta.FieldByName('PAGADOCUOTA').AsFloat) + ', ' +
                '     SP_IMPORTE799 = ' + SqlNumber(cdsConsulta.FieldByName('IMP799').AsFloat) + ', ' +
                '     SP_IMPORTEAJUSTE = ' + SqlNumber(cdsConsulta.FieldByName('IMPAJUSTES').AsFloat) + ', ' +
                '     SP_EMPLEADOS = ' + SqlValue(cdsConsulta.FieldByName('EMPLEADOS').AsInteger) + ', ' +
                '     SP_IMPFONDONOCORRESP = ' + SqlNumber(cdsConsulta.FieldByName('CORRESPFNC').AsFloat) + ', ' +
                '     SP_IMPORTEFONDOFFE = ' + SqlNumber(cdsConsulta.FieldByName('CORRESPFFE').AsFloat) + ', ' +
                '     SP_IMPORTE560 =  ' + SqlNumber(cdsConsulta.FieldByName('IMP560').AsFloat) + ', ' +
                '     SP_IMPORTE561 = ' + SqlNumber(cdsConsulta.FieldByName('IMP561').AsFloat) + ', ' +
                '     SP_IMPORTE551 = ' + SqlNumber(cdsConsulta.FieldByName('IMP551').AsFloat)  + ', ' +
                '     SP_IMPORTE570 = ' + SqlNumber(cdsConsulta.FieldByName('IMP570').AsFloat)  +
                ' WHERE SP_IDSOLICITUDAUTORIZACION = ' + SqlValue(FSolicitudAuto) +
                ' AND SP_PERIODO = ' + SqlValue(aPeriodo));

end;*)

procedure TfrmPedidoRecalculoDev.CargarSolicitud;
begin
  pnlAutorizo.Visible := false;
  if Self.Visible then IniciarEspera;
  try
    sdqConsulta.SQL.Clear;
    sdqConsulta.SQL.Add(' SELECT  rc_contrato, rc_periodo, emi.utiles.sumarcodigosreversioncuota(rc_contrato, rc_periodo) cuota, rc_devengadocuota, ' +
                        '         rc_devengadofondo, emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''598'') imp598, ' +
                        '         emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''599'') imp599, ' +
                        '         emi.emision.get_devengadoprevisto(rc_contrato, rc_periodo) previsto,(rc_pagocuota + rc_recuperocuota) pagadocuota, ' +
                        '         emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''799'') imp799, ' +
                        '         emi.utiles.get_importeajustes(rc_contrato, rc_periodo) impajustes, ' +
                        '         (emi.utiles.sumarcodigosreversioncuota(rc_contrato, rc_periodo) ' +
                        '          - emi.emision.get_devengadoprevisto(rc_contrato, rc_periodo)) difcuota, ' +
                        '         emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''561'') imp561, ' +
                        '         emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''551'') imp551, ' +
                        '         emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''560'') imp560, ' +
                        '         DECODE(emi.utiles.get_correspondefondohipoacus(rc_contrato, rc_periodo), ' +
                        '                ''S'', NVL(emi.utiles.get_empleados(rc_contrato, rc_periodo), 0) * 0.6, ' +
                        '                0) ' +
                        '         -((emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''551'') ' +
                        '            + emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''560'') ' +
                        '            + emi.utiles.get_importecodmovimsimilares(rc_contrato, rc_periodo, ''561''))) diffondo, ' +
                        '         emi.utiles.get_correspondefondohipoacus(rc_contrato, rc_periodo) correspfondo, ' +
                        '         emi.utiles.get_empleados(rc_contrato, rc_periodo) empleados, ' +
                        '         emi.simulacion.get_devfondonctotalsim(rc_contrato, rc_periodo, ' +
                        '                                               emi.utiles.get_empleados(rc_contrato, rc_periodo)) correspfnc, ' +
                        '         emi.simulacion.get_devfondototalsim(rc_contrato, rc_periodo, ' +
                        '                                             emi.utiles.get_empleados(rc_contrato, rc_periodo)) correspffe, ' +
                        '    art.cobranza.GET_IMPORTECODIGOMOVIM(rc_contrato,rc_periodo,''570'') Imp570, null sp_tipocumplimiento, NULL Mostrar ' +
                        '    FROM cob.zrc_resumencobranza, afi.aco_contrato ' +
                        '   WHERE rc_contrato = co_contrato ' +
                        '     AND rc_contrato = :contrato ' +
                        'UNION ALL ' +
                        'SELECT   co_contrato, pe_periodo, null cuota, NULL, NULL, NULL, NULL, emi.emision.get_devengadoprevisto(co_contrato, pe_periodo), 0, 0, 0, emi.emision.get_devengadoprevisto(co_contrato, pe_periodo) difcuota, ' +
                        '         NULL, NULL, NULL, ' +
                        '         DECODE(emi.utiles.get_correspondefondohipoacus(co_contrato, pe_periodo), ' +
                        '                ''S'', NVL(emi.utiles.get_empleados(co_contrato, pe_periodo), 0) * 0.6, ' +
                        '                0), ' +
                        '         emi.utiles.get_correspondefondohipoacus(co_contrato, pe_periodo) correspfondo, ' +
                        '         emi.utiles.get_empleados(co_contrato, pe_periodo) empleados, ' +
                        '         emi.simulacion.get_devfondonctotalsim(co_contrato, pe_periodo, ' +
                        '                                               NVL(emi.utiles.get_empleados(co_contrato, pe_periodo), 0)) correspfnc, ' +
                        '         emi.simulacion.get_devfondototalsim(co_contrato, pe_periodo, ' +
                        '                                             NVL(emi.utiles.get_empleados(co_contrato, pe_periodo), 0)) correspffe, 0 Imp570, null sp_tipocumplimiento, ''S'' Mostrar ' +
                        '    FROM comunes.cpe_periodo, afi.aco_contrato ' +
                        '   WHERE co_contrato = :contrato ' +
                        '     AND pe_periodo >= art.cobranza.get_primerperiodoexigible(co_contrato) ' +
                        '     AND pe_periodo <= art.cobranza.get_ultimoperiodoexigible(co_contrato, co_fechabaja, co_vigenciadesde) ' +
                        '     AND art.cobranza.check_cobertura_periodocobranz(co_contrato, pe_periodo) = 1 ' +
                        '     AND NOT EXISTS(SELECT 1 ' +
                        '                      FROM cob.zrc_resumencobranza ' +
                        '                     WHERE rc_periodo = pe_periodo ' +
                        '                       AND rc_contrato = co_contrato) ' +
                        'ORDER BY 1, 2 ');
    sdqConsulta.ParamByName('contrato').AsInteger := fraEmpresa.Contrato;
    sdqConsulta.Open;
  finally
    if Self.Visible then DetenerEspera;
  end;
end;

end.

