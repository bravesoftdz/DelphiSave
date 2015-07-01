{----------------------------------------------------------------------------------------------------------------------
   Modulo de consulta de la Administracion de Recuperos.
   Desde este modulo se administra la carga de Recuperos.
   Autor: EVila.
}
unit unConsultaAdministracionRecupero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  unCustomConsulta, FieldHider, ShortCutControl, Placemnt, artSeguridad,
  QueryPrint, QueryToFile, ExportDialog, SortDlg, Db, SDEngine, Grids,
  DBGrids, RXDBCtrl, ArtComboBox, ArtDBGrid, ComCtrls, ToolWin, ExtCtrls,
  unArtFrame, unFraCodigoDescripcion, unfraAbogadosLegales, unFraCtbTablas,
  StdCtrls, unFraEmpresa, SinEdit, unArtDbFrame, Mask, ToolEdit,
  DateComboBox, unArtDBAwareFrame;

type
  TfrmConsultaAdministracionRecupero = class(TfrmCustomConsulta)
    fraEmpresa: TfraEmpresa;
    Label4: TLabel;
    fraEstado: TfraCtbTablas;
    Label1: TLabel;
    fraMotivo: TfraCtbTablas;
    lbAbogado: TLabel;
    fraAbogados: TfraAbogadosLegales;
    Label2: TLabel;
    edSiniestro: TSinEdit;
    chkSinAsignar: TCheckBox;
    gbFechaAccidente: TGroupBox;
    lbFechaDesde: TLabel;
    lbFechaHasta: TLabel;
    edFechaAccDesde: TDateComboBox;
    edFechaAccHasta: TDateComboBox;
    gbFechaEntrega: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edFechaEntregaDesde: TDateComboBox;
    edFechaEntregaHasta: TDateComboBox;
    gbFechaCarga: TGroupBox;
    Label3: TLabel;
    Label7: TLabel;
    edFechaCargaDesde: TDateComboBox;
    edFechaCargaHasta: TDateComboBox;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    cmbFechaTerminadoDesde: TDateComboBox;
    cmbFechaTerminadoHasta: TDateComboBox;
    tbSumatoria: TToolButton;
    tbSeparador: TToolButton;
    Label10: TLabel;
    ShortCutControl1: TShortCutControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbNuevoClick(Sender: TObject);
    procedure DoCargaAdministracionRecupero(Sender: TObject);
    procedure tbModificarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
    procedure sdqConsultaAfterOpen(DataSet: TDataSet);
    procedure tbSumatoriaClick(Sender: TObject);
  private
    FTotales: array[0..10] of Extended;
    procedure CalcularSumatoria;
    
  public
  end;

var
  frmConsultaAdministracionRecupero: TfrmConsultaAdministracionRecupero;

implementation

uses
  unDmPrincipal, unPrincipal, AnsiSql, unABMAdminstracionRecupero, General, DBFuncs, vclextra;

Const
  CamposSumatoria: array[0..10] of string = ('ILP', 'ILT', 'MORTALES', 'OTROS', 'PREST_MEDICAS', 'TOTAL', 'ILT_ESTIMADA', 'RS_MONTOARECUPERAR', 'RS_MONTORECUPERADO', 'MONTOLEGALES', 'MONTOMEDIAC' );

{$R *.DFM}

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.FormCreate(Sender: TObject);
begin
  inherited;

  fraMotivo.Clave   := 'MORES';
  fraEstado.Clave   := 'ESRES';

  tbSeparador.Left := 347;
  tbSumatoria.Left := 347;

  fraAbogados.Parte := paPropia;

  fraEmpresa.ShowBajas      := true;
  fraEmpresa.UltContrato    := true;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.mnuAdministracionRecupero.Enabled := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.tbRefrescarClick( Sender: TObject);
var sWhere : String;
    sSql   : String;
begin
     sSql     := 'SELECT rs_siniestro siniestro, rs_orden orden, rs_estado, EstRec.tb_descripcion Estado, TDest.tb_descripcion tdestinatario, rs_observaciones, '+
                        'tj_nombre trabajador, em_nombre empresa, rs_motivo, MotRec.tb_descripcion motivo, rs_fecha fentrega, rs_abogado, bo_nombre abogado, rs_montoarecuperar, rs_tdestinatario, '+
                        'rs_destinatario destinatario, rs_fterminado fechafin, legales.get_montorecuperadosiniestro(rs_id) rs_montorecuperado, EX_CUIT, EX_CUIL, '+
                        'art.liq.Get_ImporteLiquidadoILT(ex_siniestro,ex_orden,null) ilt, '+
                        'art.liq.Get_ImporteLiquidadoILP(ex_siniestro,ex_orden,ex_recaida) ilp, '+
                        'art.liq.Get_ImporteLiquidadoMortales(ex_siniestro,ex_orden,ex_recaida) mortales, '+
                        'art.liq.Get_ImporteConceptos(ex_siniestro,ex_orden,null) otros, '+
                        'art.amebpba.Get_ImportePrestMedicas(ex_Siniestro, ex_Orden,null) PREST_MEDICAS, '+
                        '(art.liq.Get_ImporteLiquidadoILT(ex_siniestro,ex_orden,null) + '+
                        'art.liq.Get_ImporteLiquidadoILP(ex_siniestro,ex_orden,ex_recaida) + '+
                        'art.liq.Get_ImporteLiquidadoMortales(ex_siniestro,ex_orden,ex_recaida) + '+
                        'art.liq.Get_ImporteConceptos(ex_siniestro,ex_orden,null) + '+
                        'art.amebpba.Get_ImportePrestMedicas(ex_Siniestro, ex_Orden,null) + '+
                        'ART.AMEBPBA.Get_CostosSin(ex_Siniestro, ex_Orden, ex_Recaida, 12) + ' +
                        'art.amebpba.get_costossin(rs_siniestro, rs_orden, 0, 20) + ' +
                        'art.amebpba.get_costossin(rs_siniestro, rs_orden, 0, 23)) TOTAL, ' +
                        'ex_altamedica, ex_fechaaccidente, ex_fechaalta, rs_idreftipo, ' +
                        'ART.AMEBPBA.Get_CostosSin(ex_Siniestro, ex_Orden, ex_Recaida, 12) ILT_ESTIMADA, '+
                        'ART.SIN.Get_ListaNrosJuicioExp(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) JUICIO, ' +
                        'ART.SIN.Get_ListaNrosMediacionesExp(EX_ID) MEDIACIONES, '+
                        'art.legales.get_tienearecuperar(EX_SINIESTRO, EX_ORDEN, EX_RECAIDA) ARECUPERAR, ' +
                        'art.amebpba.get_costossin(rs_siniestro, rs_orden, 0, 20) MONTOLEGALES, ' +
                        'art.amebpba.get_costossin(rs_siniestro, rs_orden, 0, 23) MONTOMEDIAC '+
                 'FROM ctb_tablas MotRec, ctb_tablas EstRec, ctb_tablas TDest, LEGALES.lbo_abogado, aem_empresa, ctj_trabajador, '+
                 '     sex_expedientes, lrs_recuperosiniestros '+
                 ' WHERE rs_motivo         = MotRec.tb_codigo(+) '+
                 '   AND MotRec.tb_clave(+)= ''MORES'' '+
                 '   AND rs_Estado         = EstRec.tb_codigo '+
                 '   AND EstRec.tb_clave   = ''ESRES'' '+
                 '   AND rs_tdestinatario  = TDest.tb_codigo(+) '+
                 '   AND TDest.tb_clave(+) = ''TDEST'' '+
                 '   AND rs_abogado        = bo_ID(+) '+
                 '   AND ex_siniestro      = rs_siniestro '+
                 '   AND ex_orden          = rs_orden '+
                 '   AND ex_cuil           = tj_cuil '+
                 '   AND ex_cuit           = em_cuit '+
                 '   AND ex_recaida        = 0 ';

     if edSiniestro.Text <> '' then
        sWhere := sWhere + ' AND RS_SINIESTRO = ' + SqlValue( edSiniestro.SiniestroS );

     if fraAbogados.IsSelected then
        sWhere := sWhere + ' AND RS_ABOGADO = ' + SqlValue( fraAbogados.Codigo );

     if chkSinAsignar.Checked then
        sWhere := sWhere + ' AND RS_ABOGADO IS NULL';

     if fraEmpresa.IsSelected then
        sWhere := sWhere + ' AND EM_CUIT = ' + SqlValue(fraEmpresa.Cuit);

     if fraMotivo.IsSelected then
        sWhere := sWhere + ' AND RS_MOTIVO = '+ SqlValue( fraMotivo.Codigo );

     if fraEstado.IsSelected then
        sWhere := sWhere + ' AND RS_ESTADO = '+ SqlValue( fraEstado.Codigo );

     sWhere := sWhere + SqlBetween('AND EX_FECHAACCIDENTE', edFechaAccDesde.Date, edFechaAccHasta.Date) +
                        SqlBetween('AND RS_FECHA', edFechaEntregaDesde.Date, edFechaEntregaHasta.Date) +
                        SqlBetween('AND EX_FECHAALTA', edFechaCargaDesde.Date, edFechaCargaHasta.Date) +
                        SqlBetween('AND RS_FTERMINADO', cmbFechaTerminadoDesde.Date, cmbFechaTerminadoHasta.Date);


     sdqConsulta.SQL.Text := sSql + sWhere + SortDialog.OrderBy;
  inherited;
  CalcularSumatoria;
  if sdqConsulta.IsEmpty then begin
     msgBox( 'No existen datos para esta selección', MB_ICONEXCLAMATION, 'Atención');
     Abort;
  end;
  if NOT Assigned(frmABMAdminstracionRecupero) then
    if sdqConsulta.RecordCount = 1 then
       DoCargaAdministracionRecupero( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.tbNuevoClick(Sender: TObject);
begin
  inherited;
   frmABMAdminstracionRecupero := TfrmABMAdminstracionRecupero.Create( Self );
   Try
     frmABMAdminstracionRecupero.Caption := LGD_GESTION_ALTA;
     if frmABMAdminstracionRecupero.ShowModal = mrOK then
       tbRefrescarClick( frmConsultaAdministracionRecupero );
   Finally
      frmABMAdminstracionRecupero.Free;
      frmABMAdminstracionRecupero := Nil;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.DoCargaAdministracionRecupero( Sender: TObject);
begin
    if NOT sdqConsulta.IsEmpty then begin
      frmABMAdminstracionRecupero := TfrmABMAdminstracionRecupero.Create( Self );
      Try
        frmABMAdminstracionRecupero.Caption := LGD_GESTION_MODIF;
        //frmABMAdminstracionRecupero.edRS_SINIESTRO.Enabled   := False;
        vclextra.lockcontrol(frmABMAdminstracionRecupero.edRS_SINIESTRO, true);
        frmABMAdminstracionRecupero.edRS_SINIESTRO.Siniestro := sdqConsulta.FieldByName( 'siniestro' ).AsInteger;
        frmABMAdminstracionRecupero.edRS_SINIESTRO.Orden     := sdqConsulta.FieldByName( 'orden' ).AsInteger;
        frmABMAdminstracionRecupero.edJUICIO.Text            := sdqConsulta.FieldByName('JUICIO').AsString;
        frmABMAdminstracionRecupero.edJUICIO.Hint            := sdqConsulta.FieldByName('JUICIO').AsString;
        frmABMAdminstracionRecupero.edMEDIACIONES.Text       := sdqConsulta.FieldByName('MEDIACIONES').AsString;
        frmABMAdminstracionRecupero.edMEDIACIONES.Hint       := sdqConsulta.FieldByName('MEDIACIONES').AsString;
        frmABMAdminstracionRecupero.chkARecuperar.Checked    := sdqConsulta.FieldByName('ARECUPERAR').AsString = 'S';
        frmABMAdminstracionRecupero.fraEstado.Codigo         := sdqConsulta.FieldByName( 'rs_estado' ).AsString;
        frmABMAdminstracionRecupero.fraAbogados.Codigo       := sdqConsulta.FieldByName( 'rs_abogado' ).AsString; // New version...
        frmABMAdminstracionRecupero.fraMotivo.Codigo         := sdqConsulta.FieldByName( 'rs_motivo' ).AsString;
        frmABMAdminstracionRecupero.edRS_FECHA.Date          := sdqConsulta.FieldByName( 'fentrega' ).AsDateTime;
        frmABMAdminstracionRecupero.edRS_FTERMINADO.Date     := sdqConsulta.FieldByName( 'fechafin' ).AsDateTime;

        frmABMAdminstracionRecupero.fraEmpresa.CUIT    := sdqConsulta.FieldByName( 'EX_CUIT' ).AsString;
        frmABMAdminstracionRecupero.fraTrabajador.CUIL := sdqConsulta.FieldByName( 'EX_CUIL' ).AsString;

        frmABMAdminstracionRecupero.edRS_DESTINATARIO.Text     := sdqConsulta.FieldByName( 'destinatario' ).AsString;
        frmABMAdminstracionRecupero.fraTipoDestinatario.Codigo := sdqConsulta.FieldByName( 'rs_tdestinatario' ).AsString;
        frmABMAdminstracionRecupero.fraTipoDestinatarioOnChange(nil);

        if AreIn(sdqConsulta.FieldByName( 'rs_tdestinatario' ).AsString, ['S', 'O', 'A']) then
          frmABMAdminstracionRecupero.fraDestinatario.Codigo := sdqConsulta.FieldByName( 'rs_idreftipo' ).AsString;

        frmABMAdminstracionRecupero.edRS_MONTOARECUPERAR.Text := sdqConsulta.FieldByName( 'rs_montoarecuperar' ).AsString;
        frmABMAdminstracionRecupero.edRS_MONTORECUPERADO.Text := sdqConsulta.FieldByName( 'rs_montorecuperado' ).AsString;
        frmABMAdminstracionRecupero.edRS_OBSERVACIONES.Text   := sdqConsulta.FieldByName( 'rs_observaciones' ).AsString;
        if frmABMAdminstracionRecupero.ShowModal = mrOK then
           tbRefrescarClick( frmABMAdminstracionRecupero );
      Finally
        frmABMAdminstracionRecupero.Free;
        frmABMAdminstracionRecupero := Nil;
      end;
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.tbModificarClick( Sender: TObject);
begin
     DoCargaAdministracionRecupero( nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.tbLimpiarClick(
  Sender: TObject);
begin
  edSiniestro.Clear;
  fraAbogados.Clear;
  chkSinAsignar.Checked := False;
  fraEmpresa.CUIT := '';
  fraEstado.Limpiar;
  fraMotivo.Limpiar;
  edFechaAccDesde.Clear;
  edFechaAccHasta.Clear;
  edFechaEntregaDesde.Clear;
  edFechaEntregaHasta.Clear;
  edFechaCargaDesde.Clear;
  edFechaCargaHasta.Clear;
  cmbFechaTerminadoDesde.Clear;
  cmbFechaTerminadoHasta.Clear;

  inherited;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.GridPaintFooter(Sender: TObject; Column: String; var Value: String; var CellColor, FontColor: TColor; var AlignFooter: TAlingFooter);
var
  iCol: Integer;
begin
  iCol := ArrayPos(Column,CamposSumatoria);
  if iCol > -1 Then
     Value := Format('$ %0.2f', [FTotales[iCol]]);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.sdqConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if sdqConsulta.FieldByName( 'RS_MONTOARECUPERAR' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'RS_MONTOARECUPERAR' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'RS_MONTORECUPERADO' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'RS_MONTORECUPERADO' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'ILT_ESTIMADA' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'ILT_ESTIMADA' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'ILT' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'ILT' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'ILP' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'ILP' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'MORTALES' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'MORTALES' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'OTROS' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'OTROS' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'PREST_MEDICAS' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'PREST_MEDICAS' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'TOTAL' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'TOTAL' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'montolegales' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'montolegales' ) ).Currency := True;

  if sdqConsulta.FieldByName( 'montomediac' ) is TFloatField then
    TFloatField( sdqConsulta.FieldByName( 'montomediac' ) ).Currency := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.tbSumatoriaClick(
  Sender: TObject);
begin
  CalcularSumatoria;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmConsultaAdministracionRecupero.CalcularSumatoria;
begin
  Grid.FooterBand := tbSumatoria.Down;
  if tbSumatoria.Down and sdqConsulta.Active then
    SumFields(sdqConsulta, CamposSumatoria, FTotales);
end;
{----------------------------------------------------------------------------------------------------------------------}

end.
