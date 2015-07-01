unit unRecalculoDevengado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Placemnt, StdCtrls, Buttons, PeriodoPicker, unArtFrame, unArtDbFrame,
  unFraEmpresa, ExtCtrls, unArtDBAwareFrame, ComCtrls, Grids, DBGrids,
  RXDBCtrl, ArtComboBox, ArtDBGrid, ToolWin, DB, SDEngine,
  unFraCodigoDescripcion, unfraCodigoDescripcionExt, Mask, ToolEdit,
  DateComboBox, PatternEdit, IntEdit, CurrEdit;

type
  TfrmRecalculoDevengado = class(TForm)
    btnRecalcular: TBitBtn;
    btnSalir: TBitBtn;
    FormStorage: TFormStorage;
    sbDevengadoMensual: TStatusBar;
    btnSimularAutorizar: TBitBtn;
    gbEmisionContrato: TGroupBox;
    lbCuit: TLabel;
    lbPerDesde: TLabel;
    lbPerHasta: TLabel;
    fraEmpresaDevengado: TfraEmpresa;
    ppDesde: TPeriodoPicker;
    ppHasta: TPeriodoPicker;
    gbDetallePeriodosRecalculo: TGroupBox;
    dbgPeriodos: TArtDBGrid;
    gbDetalleNominaTrabajadores: TGroupBox;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    edtPeriodo: TEdit;
    edtOrigen: TEdit;
    edtFechaPresentacion: TEdit;
    ToolBarSeleccionContrato: TToolBar;
    tbSeleccionContratos: TToolButton;
    sdqPeriodosAfectados: TSDQuery;
    dsPeriodosAfectados: TDataSource;
    gbMotivoRecalculo: TGroupBox;
    mObservaciones: TMemo;
    Label4: TLabel;
    gbTarifaAplicar: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edtFechaTarifa: TDateComboBox;
    edtVigenciaTarifa: TDateComboBox;
    lblVigenciaTarifaOriginal: TLabel;
    lblFechaEndosoOrigenal: TLabel;
    edtCantidadTrabajadores: TIntEdit;
    edtMasa: TCurrencyEdit;
    edtSumaFija: TCurrencyEdit;
    edtPorcentajeMasa: TCurrencyEdit;
    procedure btnRecalcularClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure ppDesdeExit(Sender: TObject);
    procedure ppHastaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSimularAutorizarClick(Sender: TObject);
    procedure tbSeleccionContratosClick(Sender: TObject);
    procedure sdqPeriodosAfectadosAfterScroll(DataSet: TDataSet);
    procedure fraEmpresaDevengadoExit(Sender: TObject);
  private
    FIdNivelRequerido : Integer;
    FNivelUsuario     : Integer; 
    function Validar: Boolean;
    function IsPeriodosEmpresaConContrato(sCuit, sPeriodoDesde, sPeriodoHasta: String): Boolean;
    procedure CargarNomina(AContrato: integer; APeriodo: string);
    procedure CargarTarifa(AContrato: integer; APeriodo: string);
    procedure LimpiarRedevengado;
    procedure LimpiarTarifa;
    procedure LimpiarNomina;
    procedure MandarAutorizarPeriodosSeleccionados(contrato: integer;
      periodo_desde, periodo_hasta: string);
    procedure SimularPeriodosSeleccionados(contrato: integer;
      periodo_desde, periodo_hasta: string);
    procedure SetearNivelRequerido;
  public
    procedure Redevengar(AContrato : integer; sPeriodoDesde, sPeriodoHasta: String);
  end;




implementation

uses AnsiSql, CustomDlgs, unDmPrincipal, SqlFuncs, unArt, Periodo, unComunes, unSesion,
  unDmEmision, //unFrmSimulacion, unDmSimulacion,
  unFrmDetalleNomina, unEspera, unFuncionesEmision, unConstEmision;

{$R *.DFM}

const
  OPCION_AUTORIZAR : string = 'Autorizar';
  OPCION_SIMULAR   : string = 'Simular';   


{$HINTS OFF}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.btnRecalcularClick(Sender: TObject);
var
  sMes, sSql, sCuit: String;
//  iContrato: Integer;
begin
    if Validar then
      try
       IniciarEspera;
        try
          BeginTrans(true);
          sCuit := fraEmpresaDevengado.mskCUIT.Text;
          sMes  := ppDesde.Periodo.Valor;
          while sMes <= ppHasta.Periodo.Valor do
          begin
(*
                // regenero las nóminas
              sSql := 'SELECT AFILIACION.GET_CONTRATOVIGENTE(' + SqlValue( sCuit ) + ', ' +
                         SqlValue( sMes ) + ') ' +
                        'FROM DUAL';
              iContrato := ValorSqlInteger( sSql );
*)              
              sSql := 'emi.emision.do_devengadocontrato(' + SqlValue( fraEmpresaDevengado.Contrato )  + ', ' + SqlValue(sMes) + ', NULL, TRUE);';
              EjecutarStoreST( sSql );
              sMes := AddPeriodo( sMes, 1 );
          end;
          CommitTrans(true);
          
          Close;
        except
          on E: Exception do
            begin
              RollBack(true);

              Raise Exception.Create( E.Message + CRLF + 'Error al recalcular el devengado' );
            end;
        end;
      finally
        DetenerEspera;
      end;
end;
{$HINTS ON}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.btnLimpiarClick(Sender: TObject);
begin
  LimpiarRedevengado;
end;

{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.LimpiarNomina;
begin
  edtPeriodo.Clear;
  edtCantidadTrabajadores.Clear;
  edtMasa.Clear;
  edtOrigen.Clear;
  edtFechaPresentacion.Clear;
  ToolBarSeleccionContrato.Enabled := false;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.LimpiarTarifa;
begin
  edtSumaFija.Clear;
  edtPorcentajeMasa.Clear;
  edtFechaTarifa.Clear;
  edtVigenciaTarifa.Clear;

end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.LimpiarRedevengado;
begin
  fraEmpresaDevengado.Clear;
  ppDesde.Clear;
  ppHasta.Clear;


  ppDesde.Periodo.MinPeriodo := '199601';
  ppDesde.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);
  ppHasta.Periodo.MinPeriodo := '199601';
  ppHasta.Periodo.MaxPeriodo := GetPeriodo(DBDate, fpAnioMes);

  mObservaciones.Clear;
  sdqPeriodosAfectados.Close;

  LimpiarTarifa;
  LimpiarNomina;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.btnSalirClick(Sender: TObject);
begin
  Close
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.ppDesdeExit(Sender: TObject);
begin
  if ppDesde.Periodo.Valor<>'' then
    ppHasta.Periodo.MinPeriodo := ppDesde.Periodo.Valor;

  SetearNivelRequerido;    
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.ppHastaExit(Sender: TObject);
begin
  if ppHasta.Periodo.Valor<>'' then
    ppDesde.Periodo.MaxPeriodo := ppHasta.Periodo.Valor;

  SetearNivelRequerido;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRecalculoDevengado.Validar: Boolean;
begin
  Result := True;

  VerificarMultiple(['Recálculo devengado.',
     fraEmpresaDevengado, not fraEmpresaDevengado.IsEmpty, 'Debe ingresar la empresa',
     ppDesde, not ppDesde.Periodo.IsNull, 'Debe ingresar el periodo desde',
//Pablo     ppDesde, ppDesde.Periodo.Valor >= '199606', 'El periodo desde no es correcto',
     ppDesde, ppDesde.Periodo.Valor < GetPeriodo(DBDate, fpAnioMes), 'El periodo desde no es correcto',
     ppHasta, not ppHasta.Periodo.IsNull, 'Debe ingresar el periodo hasta',
//Pablo     ppHasta, ppHasta.Periodo.Valor >= '199606', 'El periodo desde no es correcto',
     ppHasta, ppHasta.Periodo.Valor < GetPeriodo(DBDate, fpAnioMes), 'El periodo desde no es correcto',
     ppDesde, IsPeriodosEmpresaConContrato( fraEmpresaDevengado.mskCUIT.Text, ppDesde.Periodo.Valor, ppHasta.Periodo.Valor ), 'Sin vigencia para el período']);
//     ppDesde, not get_estadoperiodos(fraEmpresaDevengado.Contrato,
//              ppDesde.Periodo.Valor,
//              ppHasta.Periodo.Valor ,
//              ESTADO_PERIODO_PENDIENTE), 'El rango de periodos indicado contiene períodos pendientes.']);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.FormCreate(Sender: TObject);
begin
  inherited;
  fraEmpresaDevengado.ShowBajas := True;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmRecalculoDevengado.IsPeriodosEmpresaConContrato(sCuit, sPeriodoDesde, sPeriodoHasta: String): Boolean;
var
  sSql, sMes: String;
begin
  Result := False;

  sMes := sPeriodoDesde;

  while sMes <= sPeriodoHasta do
    begin
      sSql := 'SELECT AFILIACION.GET_CONTRATOVIGENTE(' + SqlValue( sCuit ) + ', ' +
                 SqlValue( sMes ) + ') ' +
                'FROM DUAL';

      if ValorSql( sSql ) = '' then
        begin
          MsgBox('El periodo ' + sMes + ' no posee un contrato', MB_ICONEXCLAMATION, 'Error de Validación' );
          Exit;
        end;

      sMes := AddPeriodo( sMes, 1 );
    end;

  Result := True;
end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.SimularPeriodosSeleccionados(contrato : integer; periodo_desde : string;
      periodo_hasta   : string);
begin
(*
  if not get_estadoperiodos(Contrato, periodo_desde, periodo_hasta, ESTADO_PERIODO_PENDIENTE) then
  begin
    with TFrmSimulacion.create(self) do
    try
//      FormStyle := fsNormal;
//      Hide;
      SimularContrato(contrato);
*)
(*
      SimularContrato(contrato,
                           0,
                           periodo_desde,
                           periodo_hasta, true);
*)
(*
      ShowModal;
    finally
      Free;
    end;
  end else MessageBox(0, 'El rango de períodos incluye períodos pendientes. ', 'Simulación', MB_ICONINFORMATION or MB_OK);
*)  
end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.MandarAutorizarPeriodosSeleccionados(contrato : integer;
      periodo_desde : string;
      periodo_hasta   : string);
var
 mensaje : string;
begin
  if get_estadoperiodos(Contrato, periodo_desde, periodo_hasta, ESTADO_PERIODO_PENDIENTE) then
  begin
    mensaje :=  Format('¿Confirma la generación de la autorización para los períodos entre %s y %s del contrato %d?',
        [periodo_desde, periodo_hasta, contrato]);
    if (MessageBox(0, PChar(mensaje), 'Autorización',
          MB_ICONQUESTION or MB_OKCANCEL or MB_DEFBUTTON1) = idOk) then
    begin
       get_autorizacionrecalculo(contrato, periodo_desde, periodo_hasta);
    end;
  end else
    MessageBox(0, 'El rango de períodos incluye períodos pendientes. ',
          'Simulación', MB_ICONINFORMATION or MB_OK);
end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.btnSimularAutorizarClick(Sender: TObject);
begin
  if fraEmpresaDevengado.IsSelected and not ppDesde.Periodo.IsNull and
      not ppHasta.Periodo.IsNull then
  begin
    if btnSimularAutorizar.Caption = OPCION_SIMULAR then
    begin
        SimularPeriodosSeleccionados(fraEmpresaDevengado.Contrato,
              ppDesde.Periodo.Valor, ppHasta.Periodo.Valor);
    end else
    begin
        MandarAutorizarPeriodosSeleccionados(fraEmpresaDevengado.Contrato,
              ppDesde.Periodo.Valor, ppHasta.Periodo.Valor);
    end;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.tbSeleccionContratosClick(
  Sender: TObject);
begin
  if sdqPeriodosAfectados.RecordCount > 0 then
    VerDetalleNominaSeleccionada(
        sdqPeriodosAfectados.FieldByName('contrato').AsInteger,
        sdqPeriodosAfectados.FieldByName('periodo').AsString);
end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.SetearNivelRequerido;
begin
  if fraEmpresaDevengado.IsSelected and not ppDesde.Periodo.IsNull and
      not ppHasta.Periodo.IsNull then
  begin
    FIdNivelRequerido := get_nivelrequeridorecalculo(
          fraEmpresaDevengado.Contrato,
          ppDesde.Periodo.Valor, ppHasta.Periodo.Valor);
          
    sbDevengadoMensual.SimpleText := ' Nivel Requerido: ' + get_descripcionnivelrequerido(FIdNivelRequerido);

    if FNivelUsuario < FIdNivelRequerido then
       btnSimularAutorizar.Caption := OPCION_AUTORIZAR
    else
       btnSimularAutorizar.Caption := OPCION_SIMULAR;

   // btnSimularAutorizar.Visible := true;
  end else btnSimularAutorizar.Visible := false;

end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.Redevengar(AContrato: integer;
  sPeriodoDesde, sPeriodoHasta: String);
begin
   try
      gbEmisionContrato.Enabled := false;
      fraEmpresaDevengado.Contrato := AContrato;
      ppDesde.Periodo.Valor := sPeriodoDesde;
      ppHasta.Periodo.Valor := sPeriodoHasta;

      sdqPeriodosAfectados.ParamByName('contrato').AsInteger := AContrato;
      sdqPeriodosAfectados.ParamByName('periodo_desde').AsString := sPeriodoDesde;
      sdqPeriodosAfectados.ParamByName('periodo_hasta').AsString := sPeriodoHasta;
      sdqPeriodosAfectados.Open;

      CargarNomina(AContrato, sPeriodoDesde);
      self.ActiveControl := mObservaciones;

//      FNivelUsuario := 3;
      FNivelUsuario := get_nivelautorizacionusuario(Sesion.LoginName);

      SetearNivelRequerido;

      ShowModal;
   finally
      gbEmisionContrato.Enabled := true;
   end;
end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.CargarNomina(AContrato : integer; APeriodo : string);
var
 Q : TSDQuery;
begin
  Q := GetQuery('select * from emi.idj_ddjj idj, emi.ion_origennomina ion ' +
                ' where dj_id = emi.utiles.get_ultimaiddeclaracion(' +
                      SqlValue(AContrato) + ' , ' + SqlValue(Aperiodo) + ') ' +
                '  and idj.dj_idtiponomina = ion.on_id');


  LimpiarNomina;
  try
    if Q.Recordcount > 0 then
    begin
      edtPeriodo.Text := Q.FieldByName('dj_periodo').AsString;
      edtCantidadTrabajadores.Text := Q.FieldByName('dj_periodo').AsString;
      edtMasa.Value := Q.FieldByName('dj_masasalarial').AsCurrency;
      edtOrigen.Text := Q.FieldByName('on_descripcion').AsString;
      edtFechaPresentacion.Text := FormatDateTime('dd/mm/yyyy', Q.FieldByName('dj_fechapresentacion').AsDateTime);
      //ToolBarSeleccionContrato.Enabled := true;
    end;
  finally
    Q.Free;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.CargarTarifa(AContrato : integer; APeriodo : string);
var
 porcmasa, sumafija : real;
 fechaendoso, fechavigencia : TDate;
begin
  porcmasa := 0; sumafija := 0; fechaendoso := 0; fechavigencia := 0;
  get_tarifavigente(Acontrato, Aperiodo, porcmasa, sumafija, fechaendoso, fechavigencia);

  LimpiarTarifa;
  if fechaendoso > 0 then
  begin
    edtSumaFija.Value := sumafija;
    edtPorcentajeMasa.Value := porcmasa;
    edtFechaTarifa.Date := fechavigencia;
    edtVigenciaTarifa.Date := fechaendoso;
  end;
end;
{------------------------------------------------------------------------------}
procedure TfrmRecalculoDevengado.sdqPeriodosAfectadosAfterScroll(
  DataSet: TDataSet);
begin
  with sdqPeriodosAfectados do
  begin
    if RecordCount > 0 then
      CargarNomina(FieldByName('contrato').AsInteger,
                   FieldByName('periodo').AsString);
                   
      CargarTarifa(FieldByName('contrato').AsInteger,
                   FieldByName('periodo').AsString);
  end;
end;

procedure TfrmRecalculoDevengado.fraEmpresaDevengadoExit(Sender: TObject);
begin
  fraEmpresaDevengado.FrameExit(Sender);
  SetearNivelRequerido;
end;

end.


