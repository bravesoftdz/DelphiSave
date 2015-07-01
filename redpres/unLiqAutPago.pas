unit unLiqAutPago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, RXDBCtrl, unfraVolante, StdCtrls, ComCtrls, Db,
  SDEngine, AnsiSql, StrFuncs, General, artSeguridad, Placemnt, Buttons,
  ToolWin, Menus;

type
  TfrmLiquiAutPago = class(TForm)
    tbcPaginas: TTabControl;
    grpVolantes: TGroupBox;
    dbgListado: TRxDBGrid;
    sdqConsulta: TSDQuery;
    dsConsulta: TDataSource;
    FormPlacement: TFormPlacement;
    Seguridad: TSeguridad;
    cbHerramientas: TCoolBar;
    tbHerramientas: TToolBar;
    tbRefrescar: TToolButton;
    ToolButton2: TToolButton;
    tbSalir: TToolButton;
    tbLimpiar: TToolButton;
    tbAutorizar: TToolButton;
    ToolButton6: TToolButton;
    tbDetalles: TToolButton;
    ToolButton3: TToolButton;
    tbFiltro: TToolButton;
    ToolButton1: TToolButton;
    pmnuFiltros: TPopupMenu;
    mnuFiltroTodo: TMenuItem;
    N1: TMenuItem;
    mnuFiltroProvincia: TMenuItem;
    mnuFiltroMutual: TMenuItem;
    pnlTotalFacturado: TPanel;
    fraVolantes: TfraVolantes;
    sdqConsultaAM_VOLANTE: TFloatField;
    sdqConsultaAM_DESTINO: TStringField;
    sdqConsultaAM_IDPRESTADOR: TFloatField;
    sdqConsultaAM_PRESTADORES: TStringField;
    sdqConsultaAM_FACTURA: TStringField;
    sdqConsultaAM_FECHAFACTURA: TDateTimeField;
    sdqConsultaAM_IMPORTE: TFloatField;
    sdqConsultaAM_DESCRIPCION: TStringField;
    sdqConsultaAM_FECHAAPROBACION: TDateTimeField;
    sdqConsultaAM_USUARIOAPROBACION: TStringField;
    sdqConsultaAM_DESTINATARIO: TStringField;
    sdqConsultaAM_ASISTENCIAL: TFloatField;
    sdqConsultaAM_PREST_FECHABAJA: TDateTimeField;
    sdqConsultaAM_ESTADO: TStringField;
    sdqConsultaAM_TIPO: TStringField;
    procedure tbcPaginasChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgListadoGetCellParams(Sender: TObject; Field: TField; AFont: TFont;
                                      var Background: TColor; Highlight: Boolean);
    procedure tbSalirClick(Sender: TObject);
    procedure tbAutorizarClick(Sender: TObject);
    procedure tbRefrescarClick(Sender: TObject);
    procedure tbLimpiarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbDetallesClick(Sender: TObject);
    procedure tbFiltroClick(Sender: TObject);
    procedure mnuFiltroClick(Sender: TObject);
  private
    iMaxApro : Integer;
    procedure OnVolanteChange(Sender: TObject);
//    procedure IsLavadoPrestador(sDescPrestador :String; iIdPrestador, iIdVolante :Integer);
    function PermitirAprobar : Boolean;
    function AvisoEnviado_presup: Boolean;
  public
  end;

var
  frmLiquiAutPago: TfrmLiquiAutPago;

implementation

uses unDmPrincipal, unPrincipal, unSesion, unMoldeEnvioMail, unComunes, CustomDlgs;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.tbcPaginasChange(Sender: TObject);
begin
  sdqConsulta.Close;
  if tbcPaginas.TabIndex = 1 then
  begin
    sdqConsulta.SQL.Text := 'SELECT * FROM mam_autopagomixto ' +
                            ' WHERE amebpba.is_valid_range(' + SqlValue(Sesion.UserID) + ', ''U'', am_importe) IS NOT NULL ' +
                            IIF(tbFiltro.Tag > 0,' AND am_destinatario =''' + Copy('PM', tbFiltro.Tag, 1) + ''' ', '') +
                            ' ORDER BY am_volante';
    CopySqlClp(sdqConsulta.SQL.Text);
    sdqConsulta.Open;
  end;
  //----[Selecciona los Registros para ambos casos]-------------------------------------//
  if fraVolantes.edNumero.Text <> '' then
    OnVolanteChange(Nil);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuLiquiAutPago.Enabled := True;
  Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.OnVolanteChange(Sender: TObject);
begin
  if not(AreIn(fraVolantes.Estado, ['A', 'AM', 'AP'])) then
  begin
    MsgBox('No se puede autorizar el Volante debido a que no se encuentra Aprobado.', MB_ICONEXCLAMATION);
    fraVolantes.Limpiar;
    if tbcPaginas.TabIndex = 0 then sdqConsulta.Close;
  end else if fraVolantes.sdqBusqueda.Active and (tbFiltro.Tag > 0) then
  begin
    MsgBox('El destino del Volante no coincide con el destino del Filtro.', MB_ICONEXCLAMATION);
    fraVolantes.Limpiar;
  end else if ExisteSql('SELECT 1 FROM DUAL WHERE amebpba.is_valid_range(' + SqlValue(Sesion.UserID) + ', ''U'', ' +
                                                                             SqlNumber(fraVolantes.sdqBusquedaVO_MONTO.AsCurrency) + ') IS NULL') then
  begin
    MsgBox('El Usuario no está habilitado para autorizar el pago de este volante', MB_ICONEXCLAMATION);
    fraVolantes.Limpiar;
  end
  else begin
    if tbcPaginas.TabIndex = 1 then
    begin
      sdqConsulta.DisableControls;
      sdqConsulta.First;
      sdqConsulta.Locate('AM_VOLANTE', fraVolantes.edNumero.Value, []);
      if not sdqConsulta.Eof then
      begin
        Repeat
          if sdqConsultaAM_VOLANTE.AsInteger = StrToInt('0' + fraVolantes.edNumero.Text) then begin
            dbgListado.SelectedRows.CurrentRowSelected := True;
          end else
            break;
          sdqConsulta.Next;
        until sdqConsulta.Eof;
      end;
      sdqConsulta.EnableControls;
    end
    else begin
      sdqConsulta.SQL.Text := 'SELECT * FROM mam_autopagomixto ' +
                              ' WHERE am_volante = ' + SqlInt(fraVolantes.edNumero.Value);
      sdqConsulta.Open;
    end;
  end;
  //------------------------------------------------------------------------------------------------------
  if fraVolantes.edNumero.Value > 0 then
    fraVolantes.edEstado.Text := fraVolantes.edEstado.Text + ' (Monto Pagado: ' +
                                 ValorSql('SELECT FMTNUMBER(amebpba.get_montopagado(' + fraVolantes.edNumero.TextSql + ')) FROM DUAL ' ) + ' )';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.FormCreate(Sender: TObject);
begin
  if Not CheckView('MAM_AUTOPAGOMIXTO') then
  begin
   MsgBox('No se puede abrir el formulario porque la vista ''MAM_AUTOPAGOMIXTO'' esta inválida', MB_ICONERROR, 'Error del Sistema');
   Release;
 end
 else begin
   tbcPaginasChange(Nil);
   fraVolantes.OnChange := OnVolanteChange;
   iMaxApro             := -1;
   tbAutorizar.Enabled  := PermitirAprobar;
 end;
 tbHerramientas.Top := 2;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.dbgListadoGetCellParams(Sender: TObject;  Field: TField; AFont: TFont;
                                                   var Background: TColor; Highlight: Boolean);
begin
  if dbgListado.SelectedRows.CurrentRowSelected then
    Background := clNavy     // Color para la fila seleccionada
  else begin
    Background  := clWhite;  // Color de fondo para la fila no seleccionada
    AFont.Color := clBlack;  // Color de la Fuente para la fila no seleccionada
  end;

  if (Field.FieldName = 'AM_IMPORTE') then
  begin
    if (Field.Value < 0) then  AFont.Color := clRed;

  end else if (Field.FieldName = 'AM_PRESTADORES') then
  begin
    if not sdqConsultaAM_PREST_FECHABAJA.IsNull then
      AFont.Color := IIF(Highlight, clFuchsia, clRed)
    else if (sdqConsultaAM_DESTINATARIO.Text = 'M') and (sdqConsultaAM_ASISTENCIAL.IsNull) then
      AFont.Color := IIF(Highlight, clAqua, clBlue);
 end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.tbAutorizarClick(Sender: TObject);
var
  Sql, sEstado, sSqlVol :String;
  SumCantidad_Facturas, SumCantidad_Debitos, NumVolante :Integer;
  SumMonto :Double;
begin
  if tbcPaginas.TabIndex = 1 then
  begin
    SumCantidad_Facturas := 0;
    SumCantidad_Debitos  := 0;
    SumMonto             := 0;
    sdqConsulta.First;
    if not sdqConsulta.Eof then
    begin
       sdqConsulta.DisableControls;
       Repeat
          if dbgListado.SelectedRows.CurrentRowSelected then
          begin
            if (sdqConsultaAM_IMPORTE.AsFloat > 0) then
               Inc(SumCantidad_Facturas)
            else if (sdqConsultaAM_IMPORTE.AsFloat < 0) then
               Inc(SumCantidad_Debitos);

            SumMonto := SumMonto + sdqConsultaAM_IMPORTE.AsFloat;
          end;
          sdqConsulta.Next;
       until sdqConsulta.Eof;
       sdqConsulta.EnableControls;
       if MsgBox('Cantidad de Facturas a autorizar: ' + IntToStr(SumCantidad_Facturas) + #13 +
                 'Cantidad de Débitos: ' + IntToStr(SumCantidad_Debitos) + #13 +
                 'El monto de los pagos es de: $ ' + FloatToStr(SumMonto) + #13 +
                 '¿Confirma la Operación?', MB_ICONQUESTION + MB_YESNO) = IDYES then
       begin
         NumVolante := 0;
         sdqConsulta.First;
         sdqConsulta.DisableControls;
         repeat
            if dbgListado.SelectedRows.CurrentRowSelected then
            begin
              if (NumVolante <> sdqConsultaAM_VOLANTE.AsInteger) then
              begin
                NumVolante := sdqConsultaAM_VOLANTE.AsInteger;
                {IsLavadoPrestador(sdqConsultaAM_PRESTADORES.AsString,
                                  sdqConsultaAM_IDPRESTADOR.AsInteger,
                                  sdqConsultaAM_VOLANTE.AsInteger);}
                sEstado := IIF(sdqConsultaAM_ESTADO.AsString = 'A', 'E',
                           IIF(sdqConsultaAM_ESTADO.AsString = 'AP', 'EG', 'EM'));
                Sql     := 'UPDATE svo_volantes ' +
                              'SET vo_estado = ' + SqlValue(sEstado) + ',' +
                                 ' vo_usupago = ' + SqlValue(Sesion.UserID) + ', ' +
                                 ' vo_fechapago = actualdate ' +
                            'WHERE vo_volante = ' + SqlInt(sdqConsultaAM_VOLANTE.AsInteger);
                EjecutarSql(Sql);
              end;
            end;
            sdqConsulta.Next;
            if not PermitirAprobar then
            begin
              MsgBox('La Aprobación ha superado el límite para el período actual (' + FormatFloat('#,#0.00', iMaxApro)+ ')', MB_ICONEXCLAMATION );
              tbAutorizar.Enabled  := False;
              Break;
            end;
         until sdqConsulta.Eof;
         sdqConsulta.EnableControls;
         //-----------------------------------------------------------------------------------------------------//
         sdqConsulta.Close;
         sdqConsulta.Open;
         //-----------------------------------------------------------------------------------------------------//
       end;
    end;
  end else if fraVolantes.CheckInput then
  begin
    sSqlVol := 'SELECT 1 FROM svo_volantes ' +
               ' WHERE vo_volante = :vol ' +
                 ' AND vo_auditcondebito = ''S'' ' +
                 ' AND vo_fechaavaldebito is null ';

    Verificar(ExisteSqlEx(sSqlVol, [fraVolantes.edNumero.Value]), nil, 'No se puede autorizar el Pago: No se encuentra avalado el débito del Volante');

    {IsLavadoPrestador(fraVolantes.edPrestRSocial.Text,
                      fraVolantes.edPrestIdentif.Value,
                      fraVolantes.edNumero.Value); }
    sEstado := IIF(fraVolantes.Estado = 'A', 'E',
               IIF(fraVolantes.Estado = 'AP', 'EG', 'EM'));
    Sql     := 'UPDATE svo_volantes ' +
                  'SET vo_estado = ' + SqlValue(sEstado) + ',' +
                     ' vo_usupago = ' + SqlValue(Sesion.UserID) + ', ' +
                     ' vo_fechapago = actualdate ' +
               ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
    EjecutarSql(Sql);
    fraVolantes.Limpiar;
    sdqConsulta.Close;
    tbAutorizar.Enabled := PermitirAprobar;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.tbRefrescarClick(Sender: TObject);
begin
  if sdqConsulta.Active then
  begin
    sdqConsulta.Close;
    sdqConsulta.Open;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.tbLimpiarClick(Sender: TObject);
begin
  fraVolantes.Limpiar;
  if not (tbcPaginas.TabIndex = 1) then sdqConsulta.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 116 then
    tbRefrescarClick(Nil);
 //--------------------------------------------------------
 if ssCtrl in Shift then
    case Key of
      65: if tbAutorizar.Enabled then tbAutorizarClick(Nil) ; // A
      76: tbLimpiarClick(Nil) ; // L
      83: tbSalirClick(Nil); // S
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.tbDetallesClick(Sender: TObject);
begin
  if tbDetalles.Enabled then
    frmPrincipal.VolDetalle(sdqConsultaAM_VOLANTE.AsInteger);
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.tbFiltroClick(Sender: TObject);
begin
  tbFiltro.CheckMenuDropdown;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiquiAutPago.mnuFiltroClick(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    tbFiltro.Tag := Tag;
    fraVolantes.Limpiar;
    if sdqConsulta.Active then tbcPaginasChange(Nil);
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiAutPago.PermitirAprobar: Boolean;
var
  sSql :String;
  cTotCargado, cMonto, cPresupuesto :Currency;
begin
  Result := True;
  cPresupuesto := 0;

 { sSql := 'SELECT SUM(vo_monto) ' +
           ' FROM svo_volantes ' +
          ' WHERE vo_fechapago >= TO_DATE(''01/'' || TO_CHAR(SYSDATE, ''MM/YYYY''), ''DD/MM/YYYY'') ' +
            ' AND ''''||vo_estado IN (''E'',''EG'',''EM'')';      }

   // Lu 12/06/2009: se cambio el Total facturado por pedido de Patlante 12/06 (se sacan los siniestros de la Gobernación)         
   sSql := 'SELECT /*+ RULE */ SUM(iv_impfacturado) ' +
            ' FROM siv_itemvolante, svo_volantes ' +
           ' WHERE vo_fechapago >= TO_DATE(''01/'' || TO_CHAR(SYSDATE, ''MM/YYYY''), ''DD/MM/YYYY'') ' +
             ' AND ''''||vo_estado IN (''E'',''EG'',''EM'') ' +
             ' AND vo_volante = iv_volante ' +
             ' AND iv_estado NOT IN (''X'',''Z'') ' +
             ' AND iv_impfacturado > 0 ' +
             ' AND iv_siniestro < 5000000 ';

  cTotCargado := StrToFloat('0' + ValorSql(sSql));

  sSql := 'SELECT RM_MONTO ' +
           ' FROM art.prm_presupuestomensual ' +
          ' WHERE rm_periodo = TO_CHAR(SYSDATE, ''MM/YYYY'') ' +
            ' AND rm_clavearea = ''LIQUI'' ' +
            ' AND rm_fechabaja is null ';

  if ExisteSql(sSql) then
  begin
    cMonto       := StrToFloat('0' + ValorSql(sSql));
    cPresupuesto := cMonto - cTotCargado;

    if (cPresupuesto <= 0) and (not AvisoEnviado_presup) then     // si el presup menor a cero y no se envio el aviso aun, lo manda y graba la fecha
    begin
      EnviarMailBD(Get_DireccionesEnvioMail('PRESSUP'),
                  'Presupuesto Superado', [],
                  'El presupuesto correspondiente al periodo actual, ha llegado a cero o ha sido superado.' + #13#10 + #13#10 +
                  'Referido al presupuesto de: Prestaciones Médicas' + #13#10 +                                                    // Lu 26/06/2009: se agregaron estas cosas al mail por pedido de Alberto Carballal (ver mail de Patlante 26/06/2009)
                  'Monto asignado en el presupuesto de este mes: ' + FormatFloat('#,#0.00', cMonto) + #13#10 +
                  'Monto ejecutado: ' + FormatFloat('#,#0.00', cTotCargado) + #13#10 +
                  'Monto excedido hasta el momento: ' + FormatFloat('#,#0.00', cPresupuesto),
                  nil, 0, tcDefault, False);

      sSql := 'UPDATE prm_presupuestomensual ' +
                ' SET rm_fechapresupsuperado = ART.ACTUALDATE ' +
              ' WHERE rm_periodo = TO_CHAR(SYSDATE, ''MM/YYYY'') ' +
                ' AND rm_clavearea = ''LIQUI'' ';
      EjecutarSql(sSql);
    end
    else if (cPresupuesto > 0) and AvisoEnviado_presup then   // si el prespu es mayor a cero y tiene la fecha grabada (se envio el aviso), entonces borro la fecha porque ya se mejoro el presupuesto
    begin
      sSql := 'UPDATE prm_presupuestomensual ' +
                ' SET rm_fechapresupsuperado = NULL ' +
              ' WHERE rm_periodo = TO_CHAR(SYSDATE, ''MM/YYYY'') ' +
                ' AND rm_clavearea = ''LIQUI'' ';
      EjecutarSql(sSql);
    end;
  end;

  pnlTotalFacturado.Caption := 'Total Aprobado en el Período Actual: $ ' + FormatFloat('#,#0.00', cTotCargado) +
                               ' - Resta en Presupuesto: $ ' + FormatFloat('#,#0.00', cPresupuesto);

  if Seguridad.Claves.IsActive('LIMITAR') then
  begin
    if iMaxApro = -1 then
    begin
       sSql := 'SELECT tb_especial1 ' +
                ' FROM ctb_tablas ' +
               ' WHERE tb_clave = ''PARAM'' ' +
                 ' AND tb_codigo = ''TOPAPRO''';
       iMaxApro := ValorSql(sSql);
    end;
    Result := cTotCargado < iMaxApro;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
//camarillo - 06-06-06 (a las 6:06!) - si la funcion IsLavadoPrestador es True,
//solamente muestra el mensaje pero deja autorizar
{procedure TfrmLiquiAutPago.IsLavadoPrestador(sDescPrestador :String; iIdPrestador, iIdVolante :Integer);
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.is_lavado_prestador(' + SqlInt(iIdPrestador) + ',ActualDate, ' +
                                                  SqlInt(iIdVolante) + ') FROM dual';
  if ValorSql(sSql)='S' then
    MsgBox('El pago del Prestador ' + sDescPrestador + ', Volante ' + IntToStr(iIdVolante) + ' supera ' + #13 +
           'los parámetros definidos ($30.000 mensuales). Por lo tanto, esta operación debe ' + #13 +
           'evaluarse en los términos de la Ley 25.246 y CCS (Prevención de Lavado de Dinero). ', MB_ICONEXCLAMATION);
end;  Ticket 47687 DFG} 
{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiquiAutPago.AvisoEnviado_presup: Boolean;
var sSql: string;
begin
  Result := false;
  sSql := 'SELECT rm_fechapresupsuperado FROM prm_presupuestomensual ' +
          ' WHERE rm_periodo = TO_CHAR(SYSDATE, ''MM/YYYY'') ' +
            ' AND rm_clavearea = ''LIQUI'' ';
  if (ValorSql(sSql) <> '') then
    Result := True;
end;

end.


