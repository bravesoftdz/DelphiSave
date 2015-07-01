{-----------------------------------------------------------------------------
 Unit Name: unFijarImportesSentencia
 Author:    RACastro
 Date:      23-May-2006
 Purpose:   Fija los importes regulados en sentencias
 History:
-----------------------------------------------------------------------------}
unit unFijarImportesSentencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unFraReclamoSentencia, StdCtrls, ComCtrls, ToolEdit,
  DateComboBox, CurrEdit, Mask, ExtCtrls, FormPanel, unFraToolbarRTF,
  unArtFrame, unFraCodigoDescripcion, Grids, DBGrids, ToolWin, DB, SDEngine,
  unDmLegales, RxRichEd, JvComponent, unSesion, Placemnt, RXDBCtrl,
  unArtDBAwareFrame;

type

  TTipoSentencia = (tsDefinitiva, tsCambioJuzgado);

  TfrmFijarImportesSentencia = class(TForm)
    bvSeparadorBotones: TBevel;
    lblSentencia: TLabel;
    lblImporteDemandaSentencia: TLabel;
    lblImporteSentenciaSentencia: TLabel;
    lblReservaCapitalSentencia: TLabel;
    lblReservaHonorariosSentencia: TLabel;
    lblHonorariosSentencia: TLabel;
    lblFechaFinJuicioSentencia: TLabel;
    btnAceptarSentencia: TButton;
    btnCancelarFijarSentencia: TButton;
    edImporteDemandaSentencia: TCurrencyEdit;
    edImporteCapitalFinal: TCurrencyEdit;
    edImporteHonorariosFinal: TCurrencyEdit;
    edFechaSentencia: TDateComboBox;
    pgSentencia: TPageControl;
    tsDetalleSentencia: TTabSheet;
    tsReclamosSentencia: TTabSheet;
    fraReclamoSentenciaSentencia: TfraReclamoSentencia;
    fraTipoResultadoJuicio: TfraCodigoDescripcion;
    sdqPagoLegal: TSDQuery;
    dsPagoLegal: TDataSource;
    tsPagosPendientes: TTabSheet;
    ntReservas: TNotebook;
    edReservaCapitalSentencia: TCurrencyEdit;
    edReservaHonorariosSentencia: TCurrencyEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    lblImporteIntereses: TLabel;
    ceImporteIntereses: TCurrencyEdit;
    Label1: TLabel;
    ceImporteTasaJusticia: TCurrencyEdit;
    Label2: TLabel;
    ceImporteSentenciaFinal: TCurrencyEdit;
    tsImportesRegulados: TTabSheet;
    cbEdicionImportesRegulados: TCoolBar;
    tbImportesRegulados: TToolBar;
    tbIngresoValor: TToolButton;
    tbEdicionValor: TToolButton;
    tbEliminarValor: TToolButton;
    ToolButton4: TToolButton;
    tbImprimirValores: TToolButton;
    dbgImportesRegulados: TRxDBGrid;
    sdqImportesRegulados: TSDQuery;
    dsImportesRegulados: TDataSource;
    FormStorage1: TFormStorage;
    sdqSumaImportes: TSDQuery;
    Label3: TLabel;
    edFechaRecepSentencia: TDateComboBox;
    sdqSiniestrosJucio: TSDQuery;
    lblMontoCondena: TLabel;
    edMontoCondena: TCurrencyEdit;
    lblPorcentajeIncapacidadSentencia: TLabel;
    edPorcentajeIncapacidad: TCurrencyEdit;
    lnlPorcentajeIncapacidad: TLabel;
    tbOtros: TTabSheet;
    chkImputacionFFEP: TCheckBox;
    fraJuezAutImpFFEP: TfraCodigoDescripcion;
    Label4: TLabel;
    chkSentenciaAjustaPM: TCheckBox;
    chkDeterminaEnfProf: TCheckBox;
    mDetalleSentencia: TRxRichEdit;

    procedure FormCreate(Sender: TObject);
    procedure btnAceptarSentenciaClick(Sender: TObject);
    procedure fraReclamoSentenciaSentenciatbEdicionReclamoClick(
      Sender: TObject);
    procedure edImporteCapitalFinalChange(Sender: TObject);
    procedure fraReclamoSentenciaSentenciabtnAceptarReclamoClick(
      Sender: TObject);
    procedure GuardarSentenciaDefinitiva;
    procedure GuardarSentenciaCambioJuzgado;
    procedure fraReclamoSentenciaSentenciatbNuevoReclamoClick(
      Sender: TObject);
    procedure tbIngresoValorClick(Sender: TObject);
    procedure tbEdicionValorClick(Sender: TObject);
    procedure fraReclamoSentenciaSentenciatbBajaReclamoClick(
      Sender: TObject);
    procedure tbEliminarValorClick(Sender: TObject);
    procedure dbgImportesReguladosGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure fraReclamoSentenciaSentenciadbReclamosDblClick(
      Sender: TObject);
    procedure dbgImportesReguladosDblClick(Sender: TObject);
    procedure chkImputacionFFEPClick(Sender: TObject);
  private
    Ffederalsistemico: boolean;
    FIdJuicioEnTramite : Integer;
    FIdInstancia : Integer;
    FIdInstanciaActualDelJuicioEnTramite : Integer;
    FModoFijarSentencia : TModoEjecucion;
    FTipoFijarSentencia: TTipoSentencia;
    FFechaNotifJuicio: TDateTime;
    FTipoSentenciaAnt: integer;
    procedure Init;
    //procedure LimpiarCamposSentencia;
    procedure CargarDatosSentenciaDefinitiva;
    procedure CargarDatosSentenciaCambioJuzgado;
    procedure GuardarFijarSentencia;
    function VerificarFechaFin: Boolean;
    procedure CalcularImporteSentencia;
    procedure AsignarTotales;
    procedure VisualizarPorcentajeIncapacidad;
  public
    { Public declarations }
    property federalsistemico: boolean read Ffederalsistemico write Ffederalsistemico;
    procedure FijarSentencia(AIdJuicioEnTramite: Integer; AModo: TModoEjecucion; aFechaNotifJuicio: TDateTime);
    procedure FijarSentenciaCambioJuzgado(AIdInstancia: Integer; aFechaNotifJuicio: TDateTime);
  end;

implementation

uses unDmPrincipal, unPagosLegalesPendientes, AnsiSql, SqlFuncs, VCLExtra,
     unConstLegales, CustomDlgs, DBSql,
     unImportesRegulados, unFrmPagoConceptosLegalesRegulados;

{$R *.dfm}
{---------------------------------------------------------------------------------}
procedure TfrmFijarImportesSentencia.FormCreate(Sender: TObject);
var
  NivelUsuario: integer;
begin
  fraJuezAutImpFFEP.Locked := true;

  with fraTipoResultadoJuicio do
  begin
    TableName   := 'legales.ltr_tiporesultadosentencia';
    FieldID     := 'tr_id';
    FieldCodigo := 'tr_id';
    ExtraCondition := ' AND (tr_etapa LIKE ''%J%'') ';
    FieldDesc   := 'tr_descripcion';
    FieldBaja := 'tr_fechabaja';
    ShowBajas := true;
  end;

  with fraJuezAutImpFFEP do
  begin
    TableName   := 'legales.ltf_tipoimpffep';
    FieldID     := 'tf_id';
    FieldCodigo := 'tf_id';
    FieldDesc   := 'tf_descripcion';
    FieldBaja := 'tf_fechabaja';
    ShowBajas := true;
  end;

  //Verifico el nivel de seguridad
  NivelUsuario := ValorSql('SELECT nu_idnivelseguridad FROM legales.lnu_nivelusuario WHERE nu_usuario = ' + SqlValue(Sesion.LoginName));
  if NivelUsuario = NIVELNORMAL then
    ntReservas.PageIndex := 1;

  pgSentencia.ActivePageIndex := 0
end;

{---------------------------------------------------------------------------------}

procedure TfrmFijarImportesSentencia.Init;
begin
  with sdqPagoLegal do begin
   Close;
   ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
   Open;
  end;

  with sdqImportesRegulados do begin
    Close;
    ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
    ParamByName('idInstancia').AsInteger := FIdInstancia;
    Open;
  end;

  with sdqSumaImportes do begin
    Close;
    ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
    ParamByName('idInstancia').AsInteger := FIdInstancia;
    Open;
  end;

  AsignarTotales
end;

{---------------------------------------------------------------------------------}
(*procedure TfrmFijarImportesSentencia.LimpiarCamposSentencia;
begin
  pgSentencia.ActivePageIndex := 0;
  mDetalleSentencia.Clear;
  edImporteDemandaSentencia.Value := 0;
  edImporteCapitalFinal.Value := 0;
  edImporteHonorariosFinal.Value := 0;
  edReservaCapitalSentencia.Value := 0;
  edReservaHonorariosSentencia.Value := 0;
  edFechaSentencia.Date := 0;
  edFechaRecepSentencia.Date := 0;
end;*)
{---------------------------------------------------------------------------------}
procedure TfrmFijarImportesSentencia.CargarDatosSentenciaDefinitiva;
var
 Query : TSDQuery;
begin
  Query := GetQuery('SELECT jt_importereservahonorarios, jt_importereserva, ' +
                   '        jt_importesentencia, jt_importedemandado, ' +
                   '        jt_importesentencia, jt_importecapital, jt_importetasajusticia, ' +
                   '        jt_importehonorarios, jt_idtiporesultadosentencia, ' +
                   '        jt_fechasentencia, jt_fecharecepsentencia, jt_interesesSentencia,  ' +
                   '        jt_montocondena,jt_porcentajeincapacidad, jt_imputacionffep, jt_autorizimpffep, '+
                   '        jt_sentenciaajustapm, jt_determinaenfprof'+
                   '   FROM legales.ljt_juicioentramite' +
                   '  WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite) );

  try

    if (Query.FieldByName('jt_fechasentencia').AsDateTime > 0) then
      FModoFijarSentencia := meModificacion
    else
      FModoFijarSentencia := meAlta;

    if Query.RecordCount > 0 then
    begin
      // Busco la instancia actual del Juicio en Trámite
      FIdInstancia := ValorSql('SELECT a.ij_id FROM legales.lij_instanciajuicioentramite a WHERE a.ij_idjuicioentramite = ' +
                               SqlValue(FIdJuicioEnTramite) + ' ORDER BY a.ij_id desc ');
      FIdInstanciaActualDelJuicioEnTramite := FIdInstancia;

      fraReclamoSentenciaSentencia.Init(FIdJuicioEnTramite, FIJASENTENCIA, FIdInstancia);
      edImporteDemandaSentencia.Value := fraReclamoSentenciaSentencia.TotalDemanda;
      if FTipoFijarSentencia = tsDefinitiva then
//        edImporteCapitalFinal.Value := fraReclamoSentenciaSentencia.TotalSentenciaCapital
      else
        edImporteCapitalFinal.Value := Query.FieldByName('jt_importecapital').AsCurrency;

      edImporteHonorariosFinal.Value := Query.FieldByName('jt_importehonorarios').AsCurrency;
      ceImporteTasaJusticia.Value := Query.FieldByName('jt_importetasajusticia').AsCurrency;
      ceImporteIntereses.Value := Query.FieldByName('jt_interesesSentencia').AsCurrency;

      edReservaCapitalSentencia.value := Query.FieldByName('jt_importereserva').AsCurrency;
      edReservaHonorariosSentencia.Value := Query.FieldByName('jt_importereservahonorarios').AsCurrency;

      edMontoCondena.Value := Query.FieldByName('jt_montocondena').AsCurrency;
      edPorcentajeIncapacidad.Value := Query.FieldByName('jt_porcentajeincapacidad').AsCurrency;

      fraTipoResultadoJuicio.ShowBajas := true;
      fraTipoResultadoJuicio.Codigo := Query.FieldByName('jt_idtiporesultadosentencia').AsString;
      fraTipoResultadoJuicio.ShowBajas := fraTipoResultadoJuicio.IsBaja;
      FTipoSentenciaAnt := fraTipoResultadoJuicio.Value;
      edFechaSentencia.Date := Query.FieldByName('jt_fechasentencia').AsDateTime;
      edFechaRecepSentencia.Date := Query.FieldByName('jt_fecharecepsentencia').AsDateTime;

      chkImputacionFFEP.Checked := (Query.FieldByName('jt_imputacionffep').AsString = 'S');
      fraJuezAutImpFFEP.Value := Query.FieldByName('jt_autorizimpffep').AsInteger;
      chkSentenciaAjustaPM.Checked := (Query.FieldByName('jt_sentenciaajustapm').AsString = 'S');
      chkDeterminaEnfProf.Checked := (Query.FieldByName('jt_determinaenfprof').AsString = 'S');

      BlobSql('SELECT jt_detallesentencia ' +
              '  FROM legales.ljt_juicioentramite ' +
              ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite), mDetalleSentencia.Lines);

    end
    else
    raise Exception.Create('No pudo encontrarse el registro de Juicio Nº ' + IntToStr(FIdJuicioEnTramite) );
  finally
   Query.Free;
  end;
end;
{---------------------------------------------------------------------------------}
procedure TfrmFijarImportesSentencia.GuardarFijarSentencia;
var
  requiereImporte : String;
  Federal : String;
begin
  VerificarMultiple(['Fijando Sentencia',

                     fraTipoResultadoJuicio.edCodigo,
                     fraTipoResultadoJuicio.Codigo <> '',
                     'Debe especificar un resultado del juicio',

                     fraTipoResultadoJuicio.edCodigo,
                     (fraTipoResultadoJuicio.Value = FTipoSentenciaAnt) or (fraTipoResultadoJuicio.IsSelected and (not fraTipoResultadoJuicio.IsBaja)),
                     'El resultado del juicio seleccionado está dado de baja',

                     edFechaSentencia,
                     edFechaSentencia.Date > 0,
                     'Debe especificar la fecha de sentencia del juicio',
                     edFechaSentencia,
                     VerificarFechaFin,
                     'Debe especificar una Fecha Sentencia mayor que la Fecha de Notificación.',
                     edFechaRecepSentencia,
                     edFechaRecepSentencia.Date > 0,
                     'Debe especificar la Fecha de Recepción de Sentencia.',
                     edFechaRecepSentencia,
                     edFechaRecepSentencia.Date >= edFechaSentencia.Date,
                     'Debe especificar una Fecha de Recepción mayor que la Fecha de Sentencia.',
                     mDetalleSentencia,
                     Trim(mDetalleSentencia.Text) <> '',
                     'Debe especificar un detalle de la sentencia']);

  requiereImporte := ValorSql(
    ' SELECT tr_requiereimporte '+
    '   FROM legales.ltr_tiporesultadosentencia '+
    '  WHERE tr_id = '+SqlValue(fraTipoResultadoJuicio.Value));
  Federal := ValorSql(
    ' SELECT jt_federal ' +
    '   FROM legales.ljt_juicioentramite ' +
    '  WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite));
  if ((requiereImporte <> 'N') and (Ffederalsistemico=false)) then //(Federal <> '1')) then
  begin
    Verificar((edMontoCondena.Value = 0),edMontoCondena,'Debe ingresar un monto de condena.');
    Verificar(edPorcentajeIncapacidad.Visible and (edPorcentajeIncapacidad.Value = 0),edPorcentajeIncapacidad,'Debe ingresar un Porcentaje de Incapacidad.');
  end;
  Verificar( (edMontoCondena.Value < 0),edMontoCondena,'Debe ingresar un monto positivo o 0 .');

  Verificar(chkImputacionFFEP.Checked and not fraJuezAutImpFFEP.IsSelected,fraJuezAutImpFFEP, 'Debe ingresar valor.');


  GuardarSentenciaDefinitiva

//  if FTipoFijarSentencia = tsDefinitiva then
//    GuardarSentenciaDefinitiva
//  else
//    GuardarSentenciaCambioJuzgado;
end;
{---------------------------------------------------------------------------------}
{function TfrmFijarImportesSentencia.VerificarReclamos : Boolean;
var
 seteados, todos : integer;
begin
  seteados := ValorSql('SELECT count(*) FROM legales.lrt_reclamojuicioentramite ' +
                       'WHERE rt_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) +
                       '  AND rt_montosentencia is not null ' +
                       '  AND RT_FECHABAJA is null');
  todos    := ValorSql('SELECT count(*) FROM legales.lrt_reclamojuicioentramite ' +
                       'WHERE rt_idjuicioentramite = ' + SqlValue(FIdJuicioEnTramite) +
                       '  AND RT_FECHABAJA is null');
  result := seteados = todos;
end;}
{----------------------------------------------------------------------------------------}
function TfrmFijarImportesSentencia.VerificarFechaFin : Boolean;
begin
  result := FFechaNotifJuicio < edFechaSentencia.Date;
end;

procedure TfrmFijarImportesSentencia.fraReclamoSentenciaSentenciatbEdicionReclamoClick(
  Sender: TObject);
var
  NroPago: integer;
begin
  NroPago := ValorSqlInteger('SELECT ir_nropago FROM legales.lir_importesreguladosjuicio ' +
                             'WHERE ir_idreclamojuicioentramite = ' +
                                    SqlValue(fraReclamoSentenciaSentencia.sdqReclamoJuicioEnTramite.FieldByName('rt_id').AsInteger) +
                             '  AND ir_idinstancia = ' + SqlValue(FIdInstancia));
  if NroPago > 0 then
  begin
    ShowMessage (Format ('La Sentencia a Reclamo ha sido asignada al Nº de Pago %d.' + #13 +
                         'Sus datos no pueden ser modificados.', [NroPago]));
    Exit
  end;

  fraReclamoSentenciaSentencia.tbEdicionReclamoClick(Sender);

  sdqImportesRegulados.Refresh;
  AsignarTotales;
end;

procedure TfrmFijarImportesSentencia.edImporteCapitalFinalChange(Sender: TObject);
begin
  CalcularImporteSentencia;
end;

procedure TfrmFijarImportesSentencia.CalcularImporteSentencia;
begin
  ceImporteSentenciaFinal.Value := edImporteCapitalFinal.Value +  edImporteHonorariosFinal.Value +
                                   ceImporteIntereses.Value + ceImporteTasaJusticia.Value;
end;

procedure TfrmFijarImportesSentencia.fraReclamoSentenciaSentenciabtnAceptarReclamoClick(
  Sender: TObject);
begin
  fraReclamoSentenciaSentencia.btnAceptarReclamoClick(Sender);
  edImporteCapitalFinal.Value := fraReclamoSentenciaSentencia.TotalSentenciaCapital;

  sdqImportesRegulados.Refresh;
  VisualizarPorcentajeIncapacidad;
  AsignarTotales;
end;

procedure TfrmFijarImportesSentencia.GuardarSentenciaDefinitiva;
var
  sSiniestros: string;
begin
  try
    sdqSiniestrosJucio.ParamByName('id_juiciotramite').AsString := sqlvalue(FIdJuicioEnTramite);
    sdqSiniestrosJucio.Open;

    while not sdqSiniestrosJucio.Eof do
    begin
      if ObtenerValorEx(
            'art.Siniestro.get_enfnolistada(:id_ex, art.actualdate)',
            [sdqSiniestrosJucio.FieldByName('ex_id').AsInteger]) = 'S' then
      begin
        sSiniestros :=
            sSiniestros +
            sdqSiniestrosJucio.FieldByName('ex_siniestro').AsString + '-' +
            sdqSiniestrosJucio.FieldByName('ex_orden').AsString + '-' +
            sdqSiniestrosJucio.FieldByName('ex_recaida').AsString + chr(13);
      end;
      
      sdqSiniestrosJucio.Next;
    end;

    if sSiniestros <> '' then
      MessageDlg('Los siguientes siniestros están imputados al FFEP:' + chr(13) +
          sSiniestros, mtWarning, [mbOK], 0);

    if FTipoFijarSentencia = tsDefinitiva then
    begin
      EjecutarSqlST('UPDATE legales.ljt_juicioentramite ' +
                    '   SET jt_fechasentencia = ' + SqlDateTime(edFechaSentencia.Date) + ', ' +
                    '       jt_fecharecepsentencia = ' + SqlDateTime(edFechaRecepSentencia.Date) + ', ' +
                    '       jt_idtiporesultadosentencia = ' + SqlInteger(fraTipoResultadoJuicio.Codigo, true) + ', ' +
                    '       jt_interesesSentencia = ' + SqlValue(ceImporteIntereses.Value) + ', ' +
                    '       jt_importecapital = ' + SqlValue(edImporteCapitalFinal.Value) + ', ' +
                    '       jt_montocondena = ' + SqlNumber(edMontoCondena.Value) + ', ' +
                    '       jt_porcentajeincapacidad = ' + SqlNumber(edPorcentajeIncapacidad.Value) + ', ' +
                    '       jt_usumodif = ' + SqlValue(Sesion.LoginName) + ', ' +
                    '       jt_fechamodif = sysdate, ' +
                    '       jt_imputacionffep = ' + SqlValue(chkImputacionFFEP.Checked) + ', ' +
                    '       jt_autorizimpffep = ' + SqlInteger(fraJuezAutImpFFEP.Value, true) + ', ' +
                    '       jt_sentenciaajustapm = ' + SqlValue(chkSentenciaAjustaPM.Checked) + ', ' +
                    '       jt_determinaenfprof = ' + SqlValue(chkDeterminaEnfProf.Checked) + ', ' +
                    '       jt_importetasajusticia = ' + SqlValue(ceImporteTasaJusticia.Value) + ', ' +
                    '       jt_importesentencia = ' + SqlValue(ceImporteSentenciaFinal.Value) + ', ' +
                    '       jt_importehonorarios = ' + SqlValue(edImporteHonorariosFinal.Value) +
                    ' WHERE jt_id = ' + SqlInteger(FIdJuicioEnTramite));

      SaveBlob(  'SELECT jt_detallesentencia ' +
                 '  FROM legales.ljt_juicioentramite ' +
                 ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite),

                 'UPDATE legales.ljt_juicioentramite' +
                 '   SET jt_detallesentencia = :jt_detallesentencia ' +
                 ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite),

                 'jt_detallesentencia', mDetalleSentencia.Lines);
    end
    else begin // Cambio de Juzgado
      // Si estoy modificando los datos de la instancia actual
      if FIdInstancia = FIdInstanciaActualDelJuicioEnTramite then
      begin
        EjecutarSqlST('UPDATE legales.ljt_juicioentramite ' +
                      '   SET jt_fechasentencia = ' + SqlDateTime(edFechaSentencia.Date) + ', ' +
                      '       jt_fecharecepsentencia = ' + SqlDateTime(edFechaRecepSentencia.Date) + ', ' +
                      '       jt_idtiporesultadosentencia = ' + SqlInteger(fraTipoResultadoJuicio.Codigo, true) + ', ' +
                      '       jt_interesesSentencia = ' + SqlValue(ceImporteIntereses.Value) + ', ' +
                      '       jt_importecapital = ' + SqlValue(edImporteCapitalFinal.Value) + ', ' +
                      '       jt_importetasajusticia = ' + SqlValue(ceImporteTasaJusticia.Value) + ', ' +
                      '       jt_montocondena = ' + SqlNumber(edMontoCondena.Value) + ', ' +
                      '       jt_porcentajeincapacidad = ' + SqlNumber(edPorcentajeIncapacidad.Value) + ', ' +
                      '       jt_usumodif = ' + SqlValue(Sesion.LoginName) + ', ' +
                      '       jt_fechamodif = sysdate, ' +
                      '       jt_imputacionffep = ' + SqlValue(chkImputacionFFEP.Checked) + ', ' +
                      '       jt_autorizimpffep = ' + SqlInteger(fraJuezAutImpFFEP.Value, true) + ', ' +
                      '       jt_sentenciaajustapm = ' + SqlValue(chkSentenciaAjustaPM.Checked) + ', ' +
                      '       jt_determinaenfprof = ' + SqlValue(chkDeterminaEnfProf.Checked) + ', ' +
                      '       jt_importesentencia = ' + SqlValue(ceImporteSentenciaFinal.Value) + ', ' +
                      '       jt_importehonorarios = ' + SqlValue(edImporteHonorariosFinal.Value) +
                      ' WHERE jt_id = ' + SqlInteger(FIdJuicioEnTramite));

        SaveBlob(  'SELECT jt_detallesentencia ' +
                   '  FROM legales.ljt_juicioentramite ' +
                   ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite),

                   'UPDATE legales.ljt_juicioentramite' +
                   '   SET jt_detallesentencia = :jt_detallesentencia ' +
                   ' WHERE jt_id = ' + SqlValue(FIdJuicioEnTramite),

                   'jt_detallesentencia', mDetalleSentencia.Lines);
      end
    end;

    GuardarSentenciaCambioJuzgado;

    Close;
  except
    on E : Exception do begin
       raise Exception.Create('Error al guardar juicio' + E.Message);
    end;
  end;
end;

procedure TfrmFijarImportesSentencia.GuardarSentenciaCambioJuzgado;
begin
  Try
    EjecutarSqlST('UPDATE legales.lij_instanciajuicioentramite ' +
                  '   SET ij_fechasentencia = ' + SqlDateTime(edFechaSentencia.Date) + ', ' +
                  '       ij_fecharecepsentencia = ' + SqlDateTime(edFechaRecepSentencia.Date) + ', ' +
                  '       ij_idtiporesultadosentencia = ' + SqlInteger(fraTipoResultadoJuicio.Codigo, true) + ', ' +
                  '       ij_interesesSentencia = ' + SqlValue(ceImporteIntereses.Value) + ', ' +
                  '       ij_importecapital = ' + SqlValue(edImporteCapitalFinal.Value) + ', ' +
                  '       ij_importetasajusticia = ' + SqlValue(ceImporteTasaJusticia.Value) + ', ' +
                  '       ij_importesentencia = ' + SqlValue(ceImporteSentenciaFinal.Value) + ', ' +
                  '       ij_montocondena = '+ SqlNumber(edMontoCondena.Value) +', '+
                  '       ij_porcentajeincapacidad = '+ SqlNumber(edPorcentajeIncapacidad.Value) +', '+
                  '       ij_importehonorarios = ' + SqlValue(edImporteHonorariosFinal.Value) +
                  ' WHERE ij_id = ' + SqlInteger(FIdInstancia));

    SaveBlob('SELECT ij_detallesentencia ' +
             '  FROM legales.lij_instanciajuicioentramite ' +
             ' WHERE ij_id = ' + SqlValue(FIdInstancia),

             'UPDATE legales.lij_instanciajuicioentramite ' +
             '   SET ij_detallesentencia = :ij_detallesentencia ' +
             ' WHERE ij_id = ' + SqlValue(FIdInstancia),

             'ij_detallesentencia', mDetalleSentencia.Lines);
    Close;
  except
    on E : Exception do begin
       raise Exception.Create('Error al guardar juicio' + E.Message);
    end;
  end;
end;

procedure TfrmFijarImportesSentencia.CargarDatosSentenciaCambioJuzgado;
var
 Query : TSDQuery;
begin
  Query := GetQuery('SELECT ij_idjuicioentramite, ij_importesentencia, ij_importecapital, ' +
                    '       ij_importetasajusticia, ij_importehonorarios, ' +
                    '       ij_idtiporesultadosentencia, ij_fechasentencia, ' +
                    '       ij_fecharecepsentencia, ij_interesessentencia, '+
                    '       ij_montocondena,ij_porcentajeincapacidad ' +
                    '  FROM legales.lij_instanciajuicioentramite ' +
                    ' WHERE ij_id = ' + SqlValue(FIdInstancia) );

  try
    // Identifico cuál es el Juicio en Trámite para esta ID de Instancia
    FIdJuicioEnTramite := Query.FieldByName('ij_idjuicioentramite').AsInteger;

    // Identifico en qué instancia se encuentra actualmente el juicio
    FIdInstanciaActualDelJuicioEnTramite := ValorSql('SELECT a.ij_id FROM legales.lij_instanciajuicioentramite a WHERE a.ij_idjuicioentramite = ' +
                                                     SqlValue(FIdJuicioEnTramite) + ' ORDER BY a.ij_id desc ');

    if (Query.FieldByName('ij_fechasentencia').AsDateTime > 0) then
      FModoFijarSentencia := meModificacion
    else
      FModoFijarSentencia := meAlta;

    if Query.RecordCount > 0 then
    begin
      with sdqPagoLegal do begin
       Close;
       ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
       Open;
      end;

      with sdqImportesRegulados do begin
        Close;
        ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
        ParamByName('idInstancia').AsInteger := FIdInstancia;
        Open;
      end;

      with sdqSumaImportes do begin
        Close;
        ParamByName('idJuicioEnTramite').AsInteger := FIdJuicioEnTramite;
        ParamByName('idInstancia').AsInteger := FIdInstancia;
        Open;
      end;

      edImporteCapitalFinal.Value := Query.FieldByName('ij_importecapital').AsCurrency;

      edImporteHonorariosFinal.Value := Query.FieldByName('ij_importehonorarios').AsCurrency;
      ceImporteTasaJusticia.Value := Query.FieldByName('ij_importetasajusticia').AsCurrency;
      ceImporteIntereses.Value := Query.FieldByName('ij_interesessentencia').AsCurrency;

      edMontoCondena.Value := Query.FieldByName('ij_montocondena').AsCurrency;
      edPorcentajeIncapacidad.Value := Query.FieldByName('ij_porcentajeincapacidad').AsCurrency;

      fraTipoResultadoJuicio.Codigo := Query.FieldByName('ij_idtiporesultadosentencia').AsString;
      FTipoSentenciaAnt := fraTipoResultadoJuicio.Value;
      edFechaSentencia.Date := Query.FieldByName('ij_fechasentencia').AsDateTime;
      edFechaRecepSentencia.Date := Query.FieldByName('ij_fecharecepsentencia').AsDateTime;

      BlobSql('SELECT ij_detallesentencia ' +
              '  FROM legales.lij_instanciajuicioentramite ' +
              ' WHERE ij_id = ' + SqlValue(FIdInstancia), mDetalleSentencia.Lines);
    end
    else
    raise Exception.Create('No pudo encontrarse el registro de Juicio Nº ' + IntToStr(FIdJuicioEnTramite) );
  finally
   Query.Free;
  end;
end;

procedure TfrmFijarImportesSentencia.fraReclamoSentenciaSentenciatbNuevoReclamoClick(
  Sender: TObject);
begin
  fraReclamoSentenciaSentencia.tbNuevoReclamoClick(Sender);

  sdqImportesRegulados.Refresh;
  AsignarTotales;
end;

procedure TfrmFijarImportesSentencia.AsignarTotales;
begin
  edImporteHonorariosFinal.Value := 0;
  ceImporteIntereses.Value       := 0;
  ceImporteTasaJusticia.Value    := 0;

  with sdqSumaImportes do
  begin
    Refresh;
    First;

    while not EoF do
    begin
      case Char(FieldByName('ir_aplicacion').AsString[1]) of
        'C': edImporteCapitalFinal.Value    := FieldByName('Total').AsCurrency;
        'H': edImporteHonorariosFinal.Value := FieldByName('Total').AsCurrency;
        'I': ceImporteIntereses.Value       := FieldByName('Total').AsCurrency;
        'T': ceImporteTasaJusticia.Value    := FieldByName('Total').AsCurrency;
      end;

      Next
    end
  end
end;

procedure TfrmFijarImportesSentencia.tbIngresoValorClick(Sender: TObject);
begin
  with TfrmImportesRegulados.Create(self) do
  try
     AltaImporteRegulado(FIdJuicioEnTramite, FIdInstancia);
     sdqImportesRegulados.Refresh;
     AsignarTotales;
  finally
     free;
  end;
end;

procedure TfrmFijarImportesSentencia.tbEdicionValorClick(Sender: TObject);
begin
  if not sdqImportesRegulados.FieldByName('ir_fechabaja').IsNull then
  begin
    ShowMessage ('El importe de sentencia a sido dado de baja.' + #13 +
                 'Sus datos no pueden ser modificados.');
    Exit
  end;

  if sdqImportesRegulados.FieldByName('ir_nropago').AsInteger > 0 then
  begin
    ShowMessage (Format ('El importe de sentencia ha sido asignado al Nº de Pago %d.' + #13 +
                         'Sus datos no pueden ser modificados.',
                         [sdqImportesRegulados.FieldByName('ir_nropago').AsInteger]));
    Exit
  end;

  if sdqImportesRegulados.FieldByName('ir_aplicacion').AsString = 'Capital' then
  begin
    ShowMessage ('El importe corresponde a una Sentencia a Reclamo.' + #13 +
                 'Sus datos no pueden ser modificados directamente.');
    Exit
  end;

  with TfrmImportesRegulados.Create(self) do
  try
     ModificacionImporteRegulado(sdqImportesRegulados);
     sdqImportesRegulados.Refresh;
     AsignarTotales;
  finally
     free;
  end;
end;

procedure TfrmFijarImportesSentencia.fraReclamoSentenciaSentenciatbBajaReclamoClick(
  Sender: TObject);
var
  NroPago: integer;
begin
  NroPago := ValorSqlInteger('SELECT ir_nropago FROM legales.lir_importesreguladosjuicio ' +
                             ' WHERE ir_idreclamojuicioentramite = ' +
                             SqlValue(fraReclamoSentenciaSentencia.sdqReclamoJuicioEnTramite.FieldByName('rt_id').AsInteger));
  if NroPago > 0 then
  begin
    ShowMessage (Format ('La Sentencia a Reclamo ha sido asignada al Nº de Pago %d.' + #13 +
                         'No puede darse de baja.',
                         [sdqImportesRegulados.FieldByName('ir_nropago').AsInteger]));
    Exit
  end;

  fraReclamoSentenciaSentencia.tbBajaReclamoClick(Sender);
end;

procedure TfrmFijarImportesSentencia.tbEliminarValorClick(Sender: TObject);
begin
  if not sdqImportesRegulados.FieldByName('ir_fechabaja').IsNull then
  begin
    ShowMessage ('El importe de sentencia ya ha sido dado de baja.');
    Exit
  end;

  if sdqImportesRegulados.FieldByName('ir_aplicacion').AsString = 'Capital' then
  begin
    ShowMessage ('El importe corresponde a una Sentencia a Reclamo.' + #13 +
                 'No puede darse de baja directamente.');
    Exit
  end;

  if sdqImportesRegulados.FieldByName('ir_nropago').AsInteger > 0 then
  begin
    if ExisteSql ('SELECT * ' +
                  '  FROM legales.lpl_pagolegal ' +
                  ' WHERE pl_id = ' + SqlInt (sdqImportesRegulados.FieldByName('ir_nropago').AsInteger) +
                  '   AND (   pl_importepago > 0 ' +
                  '        OR pl_importeconretencion > 0) ') then
    begin
      ShowMessage (Format ('El importe ha sido asignado al Nº de Pago %d.' + #13 +
                           'No puede darse de baja.',
                           [sdqImportesRegulados.FieldByName('ir_nropago').AsInteger]));
      Exit
    end
  end;

  EjecutarSqlST('UPDATE legales.lir_importesreguladosjuicio ' +
                '   SET ir_usubaja = ' + SqlValue(Sesion.LoginName) + ', ' +
                '       ir_fechabaja = ' + SqlDateTime(DBDateTime) + ' ' +
                ' WHERE ir_id = ' + SqlInteger(sdqImportesRegulados.FieldByName('ir_id').AsInteger));
  sdqImportesRegulados.Refresh;
  AsignarTotales;
end;

procedure TfrmFijarImportesSentencia.dbgImportesReguladosGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if not Field.DataSet.FieldByName('ir_fechabaja').IsNull then
    AFont.Color := clRed
  else
    if Field.DataSet.FieldByName('ir_nropago').AsInteger > 0 then
      AFont.Color := clBlue;
end;

{---------------------------------------------------------------------------------}

procedure TfrmFijarImportesSentencia.FijarSentencia(AIdJuicioEnTramite: Integer; AModo: TModoEjecucion; aFechaNotifJuicio: TDateTime);
begin
  FIdJuicioEnTramite := AIdJuicioEnTramite;
  FTipoFijarSentencia := tsDefinitiva;
  FFechaNotifJuicio := aFechaNotifJuicio;

  if AModo = meConsulta then
  begin
    mDetalleSentencia.Enabled := False;
    fraReclamoSentenciaSentencia.cbReclamoSentencia.Enabled := False;
    cbEdicionImportesRegulados.Enabled := False;
    fraTipoResultadoJuicio.Enabled := False;
    edFechaSentencia.Enabled := False;
    edFechaRecepSentencia.Enabled := False
  end;

  VisualizarPorcentajeIncapacidad;
  CargarDatosSentenciaDefinitiva;
  Init;

  self.ShowModal;
end;

{---------------------------------------------------------------------------------}

procedure TfrmFijarImportesSentencia.FijarSentenciaCambioJuzgado(AIdInstancia: Integer; aFechaNotifJuicio: TDateTime);
begin
  Caption := 'Fijar Sentencia por cambio de instancia';

  FIdInstancia := AIdInstancia;

  FTipoFijarSentencia := tsCambioJuzgado;

  FFechaNotifJuicio := aFechaNotifJuicio;

  FIdJuicioEnTramite := ValorSql(
      ' SELECT ij_idjuicioentramite '+
      '   FROM legales.lij_instanciajuicioentramite '+
      '  WHERE ij_id = '+SqlValue(FIdInstancia));

  tsReclamosSentencia.TabVisible := false;
  tbOtros.TabVisible := false;
// racastro - 05/06/06 - el importe por capital siempre es asignado por sentencia
// definitiva o importe regulado por sentencia
//   edImporteCapitalFinal.Enabled := true;
//   edImporteCapitalFinal.Color := clWindow;

  VisualizarPorcentajeIncapacidad;
  CargarDatosSentenciaCambioJuzgado;

  self.ShowModal;
end;

{---------------------------------------------------------------------------------}

procedure TfrmFijarImportesSentencia.btnAceptarSentenciaClick(Sender: TObject);
begin
  GuardarFijarSentencia;
end;

procedure TfrmFijarImportesSentencia.fraReclamoSentenciaSentenciadbReclamosDblClick(
  Sender: TObject);
begin
  fraReclamoSentenciaSentenciatbEdicionReclamoClick(nil);
end;

procedure TfrmFijarImportesSentencia.dbgImportesReguladosDblClick(
  Sender: TObject);
begin
  tbEdicionValorClick(nil);
end;

{---------------------------------------------------------------------------------}

procedure TfrmFijarImportesSentencia.VisualizarPorcentajeIncapacidad;
var
  incapacidadVisible : String;
begin
  incapacidadVisible := ValorSql(
      ' SELECT DISTINCT ''S'' visible'+
      '   FROM legales.lrc_reclamo, legales.lrt_reclamojuicioentramite '+
      '  WHERE rc_reclamaincapacidad = ''S'' '+
      '    AND rt_idreclamo = rc_id '+
      '    AND rt_idjuicioentramite = '+SqlValue(FIdJuicioEnTramite));

  lblPorcentajeIncapacidadSentencia.Visible := incapacidadVisible = 'S';
  edPorcentajeIncapacidad.Visible := incapacidadVisible = 'S';
  lnlPorcentajeIncapacidad.Visible := incapacidadVisible = 'S';
  if not (incapacidadVisible = 'S') then
    edPorcentajeIncapacidad.Clear;
end;

procedure TfrmFijarImportesSentencia.chkImputacionFFEPClick(
  Sender: TObject);
begin
  fraJuezAutImpFFEP.Locked := not chkImputacionFFEP.Checked;
  if fraJuezAutImpFFEP.Locked then fraJuezAutImpFFEP.Clear;
end;

end.

