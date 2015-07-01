unit unLiqAMPAutPago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, RXDBCtrl, unfraVolante, StdCtrls, ComCtrls, Db,
  SDEngine, AnsiSql, StrFuncs, General, artSeguridad, Placemnt, Buttons,
  ToolWin, Menus, LookupDialog;

type
  TfrmLiqAMPAutPago = class(TForm)
    tbcPaginas: TTabControl;
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
    sdqConsultaAU_VOLANTE: TFloatField;
    sdqConsultaAU_PRESTADORES: TStringField;
    sdqConsultaAU_FACTURA: TStringField;
    sdqConsultaAU_FECHAFACTURA: TDateTimeField;
    sdqConsultaAU_IMPORTE: TFloatField;
    sdqConsultaAU_DESCRIPCION: TStringField;
    sdqConsultaAU_FECHAAPROBACION: TDateTimeField;
    sdqConsultaAU_USUARIOAPROBACION: TStringField;
    sdqConsultaAU_DESTINATARIO: TStringField;
    sdqConsultaAU_ASISTENCIAL: TFloatField;
    sdqConsultaAU_PREST_FECHABAJA: TDateTimeField;
    sdqConsultaAU_DESTINO: TStringField;
    pnlTotalFacturado: TPanel;
    sdqConsultaAU_IDPRESTADOR: TFloatField;
    sdqDetalle: TSDQuery;
    dsDetalle: TDataSource;
    dlgDetalle: TLookupDialog;
    grpVolantes: TGroupBox;
    fraVolantes: TfraVolantes;
    sdqConsultaAU_APAGAR: TFloatField;
    sdqConsultaAU_ESTADO: TStringField;
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
    procedure mnuFiltroClick(Sender: TObject);
  private
    iMaxApro : Integer;
    procedure OnVolanteChange(Sender: TObject);
    procedure IsLavadoPrestador(sDescPrestador :String; iIdPrestador, iIdVolante :Integer);    
    function PermitirAprobar : Boolean;
  public
  end;

var
  frmLiqAMPAutPago: TfrmLiqAMPAutPago;

implementation

uses
  unDmPrincipal, unPrincipal, unSesion;

{$R *.DFM}
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.tbcPaginasChange(Sender: TObject);
begin
  sdqConsulta.Close;
  if tbcPaginas.TabIndex = 1 then
  begin
    sdqConsulta.SQL.Text := 'SELECT * FROM MAU_AUTOPAGO_AMP ' +
                            ' WHERE AMEBPBA.IS_VALID_RANGE(''' + Sesion.UserID + ''', ''U'', AU_IMPORTE) IS NOT NULL' +
                            ' ORDER BY AU_VOLANTE';
    CopySqlClp(sdqConsulta.SQL.Text);
    sdqConsulta.Open;
  end;

  //----[Selecciona los Registros para ambos casos]-------------------------------------//
  if fraVolantes.edNumero.Text <> '' Then
    OnVolanteChange( Nil );
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.mnuLiqAMPAutPago.Enabled := True;
  Action := caFree;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.OnVolanteChange(Sender: TObject);
begin
  if not(AreIn(fraVolantes.Estado, ['AAM', 'AAG'])) then
  begin
    MsgBox('No se puede autorizar el pago de la Factura.', MB_ICONEXCLAMATION);
    fraVolantes.Limpiar;
    if tbcPaginas.TabIndex = 0 then
       sdqConsulta.Close;
  end
  else
    if ExisteSql('SELECT 1 FROM DUAL WHERE AMEBPBA.IS_VALID_RANGE(''' + Sesion.UserID + ''', ''U'', ' + SqlNumber(fraVolantes.sdqBusquedaVO_MONTO.AsCurrency) + ') IS NULL') then
    begin
      MsgBox('El Usuario no está habilitado para autorizar el pago de esta Factura', MB_ICONEXCLAMATION);
      fraVolantes.Limpiar;
    end
    else begin
      if tbcPaginas.TabIndex = 1 then
      begin
        sdqConsulta.DisableControls;
        sdqConsulta.First;
        sdqConsulta.Locate('AU_VOLANTE', fraVolantes.edNumero.Value, []);
        if not sdqConsulta.Eof then
          Repeat
            if sdqConsultaAU_VOLANTE.AsInteger = StrToInt('0' + fraVolantes.edNumero.Text) then
              dbgListado.SelectedRows.CurrentRowSelected := True
            else
              break;

            sdqConsulta.Next;
          until sdqConsulta.Eof;

        sdqConsulta.EnableControls;
      end
      else begin
        sdqConsulta.SQL.Text := 'SELECT * FROM mau_autopago_amp ' +
                                 'WHERE au_volante = ' + SqlInt(fraVolantes.edNumero.Value);
        sdqConsulta.Open;
      end;
    end;

  //------------------------------------------------------------------------------------------------------
  if fraVolantes.edNumero.Value > 0 then
    fraVolantes.edEstado.Text := ' (Monto a Pagar: ' +
                                 ValorSql('SELECT FMTNUMBER(amebpba.get_montopagado(' + fraVolantes.edNumero.TextSql + ')) FROM DUAL') + ') ' +
                                 ' (Monto a Debitar: ' +
                                 ValorSql('SELECT FMTNUMBER(amebpba.imp_negativo_amp(' + fraVolantes.edNumero.TextSql + ')) FROM DUAL') + ')';
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.FormCreate(Sender: TObject);
begin
  if Not CheckView('MAU_AUTOPAGO_AMP') Then
  begin
    MsgBox('No se puede abrir el formulario porque la vista ART.MAU_AUTOPAGO_AMP está inválida', MB_ICONERROR, 'Error del Sistema');
    Release ;
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
procedure TfrmLiqAMPAutPago.dbgListadoGetCellParams(Sender: TObject;  Field: TField; AFont: TFont;
                                                    var Background: TColor; Highlight: Boolean);
begin
  if dbgListado.SelectedRows.CurrentRowSelected then
    Background := clNavy     // Color para la fila seleccionada
  else begin
    Background  := clWhite;  // Color de fondo para la fila no seleccionada
    AFont.Color := clBlack;  // Color de la Fuente para la fila no seleccionada
  end;

  if (Field.FieldName = 'AU_IMPORTE') then
  begin
    if (Field.Value < 0) then
       AFont.Color := clRed;
  end
  else
    if (Field.FieldName = 'AU_PRESTADORES') then
    begin
      if not sdqConsultaAU_PREST_FECHABAJA.IsNull then
        AFont.Color := IIF(Highlight, clFuchsia, clRed)
      else if (sdqConsultaAU_DESTINATARIO.Text = 'P') and (sdqConsultaAU_ASISTENCIAL.IsNull) Then
        AFont.Color := IIF(Highlight, clAqua, clBlue);
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.tbSalirClick(Sender: TObject);
begin
  Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.tbAutorizarClick(Sender: TObject);
Var
  Sql, sEstado: String;
  SumCantidad, NumVolante: Integer;
  SumMonto: Double;
begin
  if tbcPaginas.TabIndex = 1 then
  begin
    SumCantidad := 0;
    SumMonto    := 0;
    sdqConsulta.First ;
    if not sdqConsulta.Eof then
    begin
      sdqConsulta.DisableControls;
      Repeat
        if dbgListado.SelectedRows.CurrentRowSelected and (sdqConsultaAU_IMPORTE.AsFloat >= 0) then
        begin
          Inc(SumCantidad);
          SumMonto := SumMonto + sdqConsultaAU_IMPORTE.AsFloat;
        end;
        sdqConsulta.Next;
      until sdqConsulta.Eof;

      if SumCantidad = 0 then
        Exit;

      sdqConsulta.EnableControls;
      if MsgBox('La cantidad de pagos a autorizar es: ' + IntToStr( SumCantidad ) + #13 +
                'El monto de los pagos es de: $ ' + FloatToStr( SumMonto ) + #13 +
                '¿Confirma la Operación?', MB_ICONQUESTION + MB_YESNO) = IDYES Then
      begin
        NumVolante := 0;
        sdqConsulta.First ;
        sdqConsulta.DisableControls;
        Repeat
          if dbgListado.SelectedRows.CurrentRowSelected then
          begin
            if (NumVolante <> sdqConsultaAU_VOLANTE.AsInteger) then
            begin
              NumVolante := sdqConsultaAU_VOLANTE.AsInteger;
              IsLavadoPrestador(sdqConsultaAU_PRESTADORES.AsString,
                                sdqConsultaAU_IDPRESTADOR.AsInteger,
                                sdqConsultaAU_VOLANTE.AsInteger);

              sEstado := IIF(sdqConsultaAU_ESTADO.AsString = 'AAM', 'EAM', 'EAG');

              Sql := 'UPDATE svo_volantes ' +
                       ' SET vo_estado = ' + SqlValue(sEstado) + ',' +
                           ' vo_usupago = ' + SqlValue(Sesion.UserID) + ',' +
                           ' vo_fechapago = ACTUALDATE ' +
                     ' WHERE vo_volante = ' + SqlInt(sdqConsultaAU_VOLANTE.AsInteger);
              EjecutarSql(Sql);
            end;
          end;
          sdqConsulta.Next ;
          if not PermitirAprobar then
          begin
            MsgBox('La Aprobación ha superado el límite para el período actual (' + FormatFloat('#,#0.00', iMaxApro)+ ')', MB_ICONEXCLAMATION );
            tbAutorizar.Enabled  := False;
            Break;
          end;
        until sdqConsulta.Eof;

        sdqConsulta.EnableControls;
        sdqConsulta.Close;
        sdqConsulta.Open;
      end
    end
  end
  else
    if fraVolantes.CheckInput then
    begin
      if not(AreIn(fraVolantes.Estado, ['AAM', 'AAG'])) then
        MsgBox('No se puede autorizar el pago de la Factura.', MB_ICONEXCLAMATION)
      else begin
        IsLavadoPrestador(fraVolantes.edPrestRSocial.Text,
                          fraVolantes.edPrestIdentif.Value,
                          fraVolantes.edNumero.Value);
        sEstado := IIF(fraVolantes.Estado = 'AAM', 'EAM', 'EAG');
        Sql := 'UPDATE svo_volantes ' +
                 ' SET vo_estado = ' + SqlValue(sEstado) + ',' +
                     ' vo_usupago = ' + SqlValue(Sesion.UserID) + ',' +
                     ' vo_fechapago = actualdate ' +
               ' WHERE vo_volante = ' + SqlInt(fraVolantes.edNumero.Value);
       EjecutarSql(Sql);
       fraVolantes.Limpiar;
       sdqConsulta.Close;
       tbAutorizar.Enabled := PermitirAprobar;
     end;
   end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.tbRefrescarClick(Sender: TObject);
begin
  if sdqConsulta.Active then
  begin
    sdqConsulta.Close;
    sdqConsulta.Open;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.tbLimpiarClick(Sender: TObject);
begin
  fraVolantes.Limpiar;
  if not (tbcPaginas.TabIndex = 1) then
    sdqConsulta.Close;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 116 Then
    tbRefrescarClick( Nil );

  if ssCtrl in Shift then
    case Key of
      65: if tbAutorizar.Enabled Then tbAutorizarClick( Nil ) ; // A
      76: tbLimpiarClick( Nil ) ; // L
      83: tbSalirClick( Nil ); // S
    end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.tbDetallesClick(Sender: TObject);
begin
  if tbDetalles.Enabled then
  begin
    sdqDetalle.ParamByName('pVolante').AsInteger := sdqConsultaAU_VOLANTE.AsInteger;
    sdqDetalle.Open;

    if sdqDetalle.Eof then
      MsgBox('No se encontraron detalles que mostrar.')
    else
      dlgDetalle.Execute;

    sdqDetalle.Close;
  end
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.mnuFiltroClick(Sender: TObject);
begin
  with Sender as TMenuItem do
  begin
    fraVolantes.Limpiar ;
    if sdqConsulta.Active Then
      tbcPaginasChange( Nil );
  end;
end;

{----------------------------------------------------------------------------------------------------------------------}
function TfrmLiqAMPAutPago.PermitirAprobar: Boolean;
Var
  sSql        : String;
  cTotCargado : Currency;
begin
  Result := True;
  sSql := 'SELECT SUM(vo_monto) ' +
          '  FROM svo_volantes ' +
          ' WHERE vo_fechapago >= TO_DATE(''01/'' || TO_CHAR(SYSDATE, ''MM/YYYY''), ''DD/MM/YYYY'') ' +
          '   AND ''''||vo_estado IN (''EAM'', ''EAG'')';
  cTotCargado := StrToFloat('0' + ValorSql(sSql));
  pnlTotalFacturado.Caption := 'Total Aprobado en el Período Actual: $ ' + FormatFloat('#,#0.00', cTotCargado);

  if Seguridad.Claves.IsActive('LIMITAR') then
  begin
    if iMaxApro = -1 then
    begin
      sSql := 'SELECT tb_especial1 ' +
              '  FROM ctb_tablas ' +
              ' WHERE tb_clave = ''PARAM'' ' +
              '   AND tb_codigo = ''TOPAPRO''';
      iMaxApro := ValorSql(sSql);
    end;
    Result := cTotCargado < iMaxApro;
  end;
end;
{----------------------------------------------------------------------------------------------------------------------}
procedure TfrmLiqAMPAutPago.IsLavadoPrestador(sDescPrestador :String; iIdPrestador, iIdVolante :Integer);
var
  sSql :String;
begin
  sSql := 'SELECT art.liq.is_lavado_prestador(' + SqlInt(iIdPrestador) + ',ActualDate, ' +
                                                  SqlInt(iIdVolante) + ') FROM dual';
  if ValorSql(sSql)='S' then
    MsgBox('El pago del Prestador ' + sDescPrestador + ', Factura ' + IntToStr(iIdVolante) + ' supera ' + #13 +
           'los parámetros definidos ($30.000 mensuales). Por lo tanto, esta operación debe ' + #13 +
           'evaluarse en los términos de la Ley 25.246 y CCS (Prevención de Lavado de Dinero). ', MB_ICONEXCLAMATION);
end;
{----------------------------------------------------------------------------------------------------------------------}
end.


