unit unFijarImportesSentenciaActora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Placemnt, DB, SDEngine, StdCtrls, ExtCtrls, unArtFrame,
  unArtDBAwareFrame, unFraCodigoDescripcion, ComCtrls, ToolEdit,unDmLegales,
  DateComboBox, Mask, CurrEdit, unDmPrincipal;

type
  TTipoSentencia = (tsDefinitiva, tsCambioJuzgado);

  TfrmFijarImportesSentenciaActora = class(TForm)
    bvSeparadorBotones: TBevel;
    lblSentencia: TLabel;
    lblImporteSentenciaSentencia: TLabel;
    lblHonorariosSentencia: TLabel;
    lblFechaFinJuicioSentencia: TLabel;
    lblImporteIntereses: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btnAceptarSentencia: TButton;
    btnCancelarFijarSentencia: TButton;
    edImporteCapitalFinal: TCurrencyEdit;
    edImporteHonorariosFinal: TCurrencyEdit;
    edFechaSentencia: TDateComboBox;
    pgSentencia: TPageControl;
    tsDetalleSentencia: TTabSheet;
    mDetalleSentencia: TRichEdit;
    fraTipoResultadoJuicio: TfraCodigoDescripcion;
    ceImporteIntereses: TCurrencyEdit;
    ceImporteTasaJusticia: TCurrencyEdit;
    ceImporteSentenciaFinal: TCurrencyEdit;
    sdqPagoLegal: TSDQuery;
    dsPagoLegal: TDataSource;
    sdqImportesRegulados: TSDQuery;
    dsImportesRegulados: TDataSource;
    FormStorage1: TFormStorage;
    sdqSumaImportes: TSDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarSentenciaClick(Sender: TObject);
    procedure dbgImportesReguladosDblClick(Sender: TObject);
    procedure dbgImportesReguladosGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure edImporteCapitalFinalChange(Sender: TObject);
{    procedure fraReclamoSentenciaSentenciabtnAceptarReclamoClick(
      Sender: TObject);}
{    procedure fraReclamoSentenciaSentenciadbReclamosDblClick(
      Sender: TObject);}
{    procedure fraReclamoSentenciaSentenciatbBajaReclamoClick(
      Sender: TObject);}
{    procedure fraReclamoSentenciaSentenciatbEdicionReclamoClick(
      Sender: TObject);}
{    procedure fraReclamoSentenciaSentenciatbNuevoReclamoClick(
      Sender: TObject);}
    procedure GuardarSentenciaCambioJuzgado;
    procedure GuardarSentenciaDefinitiva;
    procedure tbEdicionValorClick(Sender: TObject);
    procedure tbEliminarValorClick(Sender: TObject);
    procedure tbIngresoValorClick(Sender: TObject);
  private
    { Private declarations }
    FIdJuicioEnTramite : Integer;
    FIdInstancia : Integer;
    FModoFijarSentencia : TModoEjecucion;
    FIdInstanciaActualDelJuicioEnTramite : Integer;
    FTipoFijarSentencia: TTipoSentencia;
    FFechaNotifJuicio: TDateTime;
    FTipoSentenciaAnt: integer;
    procedure AsignarTotales;
    procedure Init;
    //procedure LimpiarCamposSentencia;
    procedure CargarDatosSentenciaDefinitiva;
    procedure CargarDatosSentenciaCambioJuzgado;
    procedure GuardarFijarSentencia;
    function VerificarFechaFin: Boolean;
    procedure CalcularImporteSentencia;
  public
    { Public declarations }
    procedure FijarSentencia(AIdJuicioEnTramite: Integer; AModo: TModoEjecucion; aFechaNotifJuicio: TDateTime);
    procedure FijarSentenciaCambioJuzgado(AIdInstancia: Integer; aFechaNotifJuicio: TDateTime);
  end;

var
  frmFijarImportesSentenciaActora: TfrmFijarImportesSentenciaActora;

implementation
uses
  AnsiSql,unSesion, unConstLegales, CustomDlgs, unImportesRegulados;
{$R *.dfm}


procedure TfrmFijarImportesSentenciaActora.FormCreate(Sender: TObject);
begin
  with fraTipoResultadoJuicio do
  begin
    TableName   := 'legales.ltr_tiporesultadosentencia';
    FieldID     := 'tr_id';
    FieldCodigo := 'tr_id';
    ExtraCondition := ' AND (tr_etapa LIKE ''%A%'') ';
    FieldDesc   := 'tr_descripcion';
    FieldBaja := 'tr_fechabaja';
    ShowBajas := true;
  end;

  pgSentencia.ActivePageIndex := 0;
end;

{---------------------------------------------------------------------------------}

procedure TfrmFijarImportesSentenciaActora.Init;
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
procedure TfrmFijarImportesSentenciaActora.CargarDatosSentenciaDefinitiva;
var
 Query : TSDQuery;
begin
  Query := GetQuery('SELECT jt_importereservahonorarios, jt_importereserva, ' +
                   '        jt_importesentencia, jt_importedemandado, ' +
                   '        jt_importesentencia, jt_importecapital, jt_importetasajusticia, ' +
                   '        jt_importehonorarios, jt_idtiporesultadosentencia, ' +
                   '        jt_fechasentencia, jt_fecharecepsentencia, jt_interesesSentencia  ' +
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



      edImporteCapitalFinal.Value := Query.FieldByName('jt_importecapital').AsCurrency;
      edImporteHonorariosFinal.Value := Query.FieldByName('jt_importehonorarios').AsCurrency;
      ceImporteTasaJusticia.Value := Query.FieldByName('jt_importetasajusticia').AsCurrency;
      ceImporteIntereses.Value := Query.FieldByName('jt_interesesSentencia').AsCurrency;

      fraTipoResultadoJuicio.ShowBajas := true;
      fraTipoResultadoJuicio.Codigo := Query.FieldByName('jt_idtiporesultadosentencia').AsString;
      fraTipoResultadoJuicio.ShowBajas := fraTipoResultadoJuicio.IsBaja;
      FTipoSentenciaAnt := fraTipoResultadoJuicio.Value;
      edFechaSentencia.Date := Query.FieldByName('jt_fechasentencia').AsDateTime;


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
procedure TfrmFijarImportesSentenciaActora.GuardarFijarSentencia;
begin
  VerificarMultiple(['Fijando Sentencia',

                     fraTipoResultadoJuicio.edCodigo,
                     fraTipoResultadoJuicio.Codigo <> '',
                     'Debe especificar un resultado del juicio',

                     fraTipoResultadoJuicio.edCodigo,
                     (fraTipoResultadoJuicio.Value = FTipoSentenciaAnt) or (not fraTipoResultadoJuicio.IsBaja),
                     'El resultado del juicio seleccionado está dado de baja',

                     edFechaSentencia,
                     edFechaSentencia.Date > 0,
                     'Debe especificar la fecha de sentencia del juicio',
                     edFechaSentencia,
                     VerificarFechaFin,
                     'Debe especificar una Fecha Sentencia mayor que la Fecha de Notificación.',
                     mDetalleSentencia,
                     Trim(mDetalleSentencia.Text) <> '',
                     'Debe especificar un detalle de la sentencia'
                     ]);

  GuardarSentenciaDefinitiva

//  if FTipoFijarSentencia = tsDefinitiva then
//    GuardarSentenciaDefinitiva
//  else
//    GuardarSentenciaCambioJuzgado;
end;
{----------------------------------------------------------------------------------------}
function TfrmFijarImportesSentenciaActora.VerificarFechaFin : Boolean;
begin
  result := FFechaNotifJuicio < edFechaSentencia.Date;
end;

{procedure TfrmFijarImportesSentenciaActora.fraReclamoSentenciaSentenciatbEdicionReclamoClick(
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
}
procedure TfrmFijarImportesSentenciaActora.edImporteCapitalFinalChange(Sender: TObject);
begin
  CalcularImporteSentencia;
end;

procedure TfrmFijarImportesSentenciaActora.CalcularImporteSentencia;
begin
  ceImporteSentenciaFinal.Value := edImporteCapitalFinal.Value +  edImporteHonorariosFinal.Value +
                                   ceImporteIntereses.Value + ceImporteTasaJusticia.Value;
end;

{procedure TfrmFijarImportesSentenciaActora.fraReclamoSentenciaSentenciabtnAceptarReclamoClick(
  Sender: TObject);
begin
  fraReclamoSentenciaSentencia.btnAceptarReclamoClick(Sender);
  edImporteCapitalFinal.Value := fraReclamoSentenciaSentencia.TotalSentenciaCapital;

  sdqImportesRegulados.Refresh;
  AsignarTotales;
end;
}
procedure TfrmFijarImportesSentenciaActora.GuardarSentenciaDefinitiva;
begin
  Try
    if (FTipoFijarSentencia = tsDefinitiva)  or (FIdInstancia = FIdInstanciaActualDelJuicioEnTramite) then
    begin
      EjecutarSqlST('UPDATE legales.ljt_juicioentramite ' +
                    '   SET jt_fechasentencia = ' + SqlDateTime(edFechaSentencia.Date) + ', ' +
                    '       jt_idtiporesultadosentencia = ' + SqlInteger(fraTipoResultadoJuicio.Codigo, true) + ', ' +
                    '       jt_interesesSentencia = ' + SqlValue(ceImporteIntereses.Value) + ', ' +
                    '       jt_importecapital = ' + SqlValue(edImporteCapitalFinal.Value) + ', ' +
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
    end;
{    else begin // Cambio de Juzgado
      // Si estoy modificando los datos de la instancia actual
      if FIdInstancia = FIdInstanciaActualDelJuicioEnTramite  then
      begin
        EjecutarSqlST('UPDATE legales.ljt_juicioentramite ' +
                      '   SET jt_fechasentencia = ' + SqlDateTime(edFechaSentencia.Date) + ', ' +
                      '       jt_fecharecepsentencia = ' + SqlDateTime(edFechaRecepSentencia.Date) + ', ' +
                      '       jt_idtiporesultadosentencia = ' + SqlInteger(fraTipoResultadoJuicio.Codigo, true) + ', ' +
                      '       jt_interesesSentencia = ' + SqlValue(ceImporteIntereses.Value) + ', ' +
                      '       jt_importecapital = ' + SqlValue(edImporteCapitalFinal.Value) + ', ' +
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
    end;
}
    GuardarSentenciaCambioJuzgado;

    Close;
  except
    on E : Exception do begin
       raise Exception.Create('Error al guardar juicio' + E.Message);
    end;
  end;
end;

procedure TfrmFijarImportesSentenciaActora.GuardarSentenciaCambioJuzgado;
begin
  Try
    EjecutarSqlST('UPDATE legales.lij_instanciajuicioentramite ' +
                  '   SET ij_fechasentencia = ' + SqlDateTime(edFechaSentencia.Date) + ', ' +
                  '       ij_idtiporesultadosentencia = ' + SqlInteger(fraTipoResultadoJuicio.Codigo, true) + ', ' +
                  '       ij_interesesSentencia = ' + SqlValue(ceImporteIntereses.Value) + ', ' +
                  '       ij_importecapital = ' + SqlValue(edImporteCapitalFinal.Value) + ', ' +
                  '       ij_importetasajusticia = ' + SqlValue(ceImporteTasaJusticia.Value) + ', ' +
                  '       ij_importesentencia = ' + SqlValue(ceImporteSentenciaFinal.Value) + ', ' +
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

procedure TfrmFijarImportesSentenciaActora.CargarDatosSentenciaCambioJuzgado;
var
 Query : TSDQuery;
begin
  Query := GetQuery('SELECT ij_idjuicioentramite, ij_importesentencia, ij_importecapital, ' +
                    '       ij_importetasajusticia, ij_importehonorarios, ' +
                    '       ij_idtiporesultadosentencia, ij_fechasentencia, ' +
                    '       ij_fecharecepsentencia, ij_interesessentencia ' +
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

      fraTipoResultadoJuicio.Codigo := Query.FieldByName('ij_idtiporesultadosentencia').AsString;
      FTipoSentenciaAnt := fraTipoResultadoJuicio.Value;
      edFechaSentencia.Date := Query.FieldByName('ij_fechasentencia').AsDateTime;

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

{procedure TfrmFijarImportesSentenciaActora.fraReclamoSentenciaSentenciatbNuevoReclamoClick(
  Sender: TObject);
begin
  fraReclamoSentenciaSentencia.tbNuevoReclamoClick(Sender);

  sdqImportesRegulados.Refresh;
  AsignarTotales;
end;}

procedure TfrmFijarImportesSentenciaActora.AsignarTotales;
begin
  //edImporteHonorariosFinal.Value := 0;
  //ceImporteIntereses.Value       := 0;
  //ceImporteTasaJusticia.Value    := 0;

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

procedure TfrmFijarImportesSentenciaActora.tbIngresoValorClick(Sender: TObject);
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

procedure TfrmFijarImportesSentenciaActora.tbEdicionValorClick(Sender: TObject);
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

{procedure TfrmFijarImportesSentenciaActora.fraReclamoSentenciaSentenciatbBajaReclamoClick(
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
}
procedure TfrmFijarImportesSentenciaActora.tbEliminarValorClick(Sender: TObject);
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

procedure TfrmFijarImportesSentenciaActora.dbgImportesReguladosGetCellParams(
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

procedure TfrmFijarImportesSentenciaActora.FijarSentencia(AIdJuicioEnTramite: Integer; AModo: TModoEjecucion; aFechaNotifJuicio: TDateTime);
begin
  FIdJuicioEnTramite := AIdJuicioEnTramite;
  FTipoFijarSentencia := tsDefinitiva;
  FFechaNotifJuicio := aFechaNotifJuicio;
  
  if AModo = meConsulta then
  begin
    mDetalleSentencia.Enabled := False;
//    fraReclamoSentenciaSentencia.cbReclamoSentencia.Enabled := False;
//    cbEdicionImportesRegulados.Enabled := False;
    fraTipoResultadoJuicio.Enabled := False;
    edFechaSentencia.Enabled := False;
  end;

  CargarDatosSentenciaDefinitiva;
  Init;

  self.ShowModal;
end;

{---------------------------------------------------------------------------------}

procedure TfrmFijarImportesSentenciaActora.FijarSentenciaCambioJuzgado(AIdInstancia: Integer; aFechaNotifJuicio: TDateTime);
begin
   Caption := 'Fijar Sentencia por cambio de instancia';

   FIdInstancia := AIdInstancia;

   FTipoFijarSentencia := tsCambioJuzgado;

  FFechaNotifJuicio := aFechaNotifJuicio;

  //   tsReclamosSentencia.TabVisible := false;
// racastro - 05/06/06 - el importe por capital siempre es asignado por sentencia
// definitiva o importe regulado por sentencia
//   edImporteCapitalFinal.Enabled := true;
//   edImporteCapitalFinal.Color := clWindow;

  CargarDatosSentenciaCambioJuzgado;

   self.ShowModal;
end;

{---------------------------------------------------------------------------------}

procedure TfrmFijarImportesSentenciaActora.btnAceptarSentenciaClick(Sender: TObject);
begin
   GuardarFijarSentencia;
end;

{procedure TfrmFijarImportesSentenciaActora.fraReclamoSentenciaSentenciadbReclamosDblClick(
  Sender: TObject);
begin
  fraReclamoSentenciaSentenciatbEdicionReclamoClick(nil);
end;
}
procedure TfrmFijarImportesSentenciaActora.dbgImportesReguladosDblClick(
  Sender: TObject);
begin
  tbEdicionValorClick(nil);
end;

end.
